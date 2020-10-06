create or replace function invoke_profile_application
( p_resource_id in number, p_profile_id in number, p_log_id in number
) return varchar2 is
  req utl_http.req;  res utl_http.resp;
  ret_str CLOB;
  url varchar2(4000) := 'http://127.0.0.1/run/profile/';
  name varchar2(4000);  buffer varchar2(4000);
  content varchar2(4000);
begin
  req := utl_http.begin_request(url, 'POST',' HTTP/1.1');
  utl_http.set_header(req, 'user-agent', 'mozilla/4.0');
  utl_http.set_header(req, 'content-type', 'application/x-www-form-urlencoded');

  content:='resource_id='||p_resource_id||chr(38)||'profile_id='||p_profile_id||chr(38)||'log_id='||p_log_id;

  utl_http.set_header(req, 'Content-Length', length(content));
  utl_http.write_text(req, content);

  res := utl_http.get_response(req);
  begin
    loop
      utl_http.read_line(res, buffer); ret_str := ret_str || buffer;
    end loop;
    utl_http.end_response(res);
  exception
    when utl_http.end_of_body  then utl_http.end_response(res);
  end;
   return 'Success';
end ;
/

create or replace FUNCTION GET_SCHEDULE_DATA
RETURN varchar2 IS
ret_str clob;
pragma autonomous_transaction;
type c_user_cur is ref cursor; c_user c_user_cur;
type c_org_cur is ref cursor; c_org c_org_cur;
type c_res_execption_cur is ref cursor; c_res_exception c_res_execption_cur;

cursor c1 is select id, resource_id,profile_id, owner_id, schedule_next_run_time,decode(run_remediate,'Y',run_cost_remediate,run_cost_scan), run_remediate, run_status
                from cpe_resource_mgmt
                where
                  (schedule_next_run_time is not null and to_char(schedule_next_run_time ,'mm-dd-yyyy hh24:mi') = to_char(sysdate,'mm-dd-yyyy hh24:mi') )
                  and
                  nvl(schedule_end_time,sysdate+1) >= sysdate and is_active ='Y' Order by ID;
cursor c2 is select id, resource_mgmt_id from cpe_resource_log where overall_status in ('QUEUED','ON-HOLD') order by 1,2 asc;
cursor c3 is select resource_mgmt_id, profile_info_id, id from cpe_resource_log where overall_status = 'READY';

v_id number(16);v_target number(16); v_profile number(16);v_owner number(16);v_runtime timestamp;v_cost number(9,3);
v_err number(1);v_name varchar2(64);v_remediate varchar2(1);v_rlog_id number(16);
c_cpm number(10,2);c_rpm number(8);c_uc number(10,2);c_ur number(8);c_id number(16);c_name varchar2(64);
c_es_cost number(10,2); c_er_cost number(10,2);c_es varchar2(1);c_date timestamp;c_err varchar2(64);c_crit number(16);
v_s1 number(8,3); v_s2 number(8,3);v_s_id number(16);v_s_temp number(8,3);
v_qid number(16);v_q_status varchar2(8);v_q_ast timestamp;
v_temp number(16);v_temp2 number(16);v_temp3 number(16); v_cnote varchar2(1024);v_temp4 number(16);
api_ret CLOB;
p_resource_id number(16); p_profile_id number(16); p_log_id number(16); t_running number(16); t_skip number(16);
begin
-- Checking number schedule currently running
    select count(id) into t_running from cpe_resource_log where overall_status in ('READY','RUNNING','ON-HOLD','QUEUED');

    t_skip := 50 - t_running;
    
    update cpe_resource_mgmt set schedule_next_run_time = (sysdate+1/1440),schedule_end_time = greatest(sysdate+1/1440, schedule_end_time)
    where last_run_id is null and schedule_next_run_time < sysdate and is_active = 'Y';
    
    OPEN c1; LOOP
    FETCH c1 into v_id,v_target,v_profile,v_owner,v_runtime,v_cost,v_remediate,v_cnote; EXIT WHEN c1%notfound;
        if c1%ROWCOUNT > t_skip then
            update cpe_resource_mgmt set run_status = 'SKIPPED',
            schedule_next_run_time = (schedule_next_run_time+1/1440),schedule_end_time = greatest(sysdate+1/1440, schedule_end_time) where id = v_id;
            commit;
        else
-- get original strength
            begin
                select nvl(sum(case a.criticality_id when 6 then 1 when 7 then 2 when 8 then 3 else 0 end),0) into v_s1
                from cpe_profile_member a , cpe_profile b
                where a.is_active='Y' and b.id = a.profile_id and b.id = v_profile;
              exception
                when others then v_s1 := 0 ;
            end;
            begin
                select nvl(b.ref_profile_id,0) into v_s_id
                from cpe_resource_type b, cpe_profile a
                where b.is_active= 'Y' and a.id = v_profile and b.id = a.resource_type_id;
              exception
                when others then v_s_id := 0;
            end;
            begin
                select nvl(sum(case a.criticality_id when 6 then 1 when 7 then 2 when 8 then 3 else 0 end),0) into v_s2
                from cpe_profile_member a, cpe_profile b
                where a.is_active='Y' and b.id = a.profile_id and b.id = v_s_id;
               exception
                when others then v_s2 := 0;
            end ;
        --- adjust v_cost based on exceptions
            open c_res_exception for
                'select a.override_type,c.cost_scan,c.cost_remediate,c.criticality_id
                 from cpe_res_mgmt_exception a, cpe_profile_member b,cpe_rule_header c
                 where a.resource_mgmt_id = :id and a.is_active = :status
                 and (
                      (a.override_start_date is NULL) OR
                      (to_char(a.override_start_date,:mask1) <= to_char(sysdate,:mask2))
                      )
                 and (
                      (a.override_end_date is NULL) OR
                      (to_char(a.override_end_date,:mask3) >= to_char(sysdate,:mask4))
                      )
                 and b.id = a.profile_member_id and c.id = b.base_rule_id'
            USING v_id,'Y','rrrrmmddhh24mi','rrrrmmddhh24mi','rrrrmmddhh24mi','rrrrmmddhh24mi';
            loop
            fetch c_res_exception into c_es,c_es_cost,c_er_cost,c_crit;exit when c_res_exception%notfound;
        --- M = mark succesful....do nothing, we will charge the customer run cost
        --- S = scan ....adjust cost
        --- K = skip ....adjust cost
                if ( c_es = 'S' and v_remediate = 'Y' ) then v_cost := v_cost - c_er_cost + c_es_cost; end if;
                if ( c_es = 'K' and v_remediate = 'Y' ) then v_cost := v_cost - c_er_cost ; end if;
                if ( c_es = 'K' and v_remediate = 'N' ) then v_cost := v_cost - c_es_cost; end if;
                if ( c_es = 'R' ) then v_cost := v_cost + c_es_cost; end if;
        --- now adjust profile strength
        --- if skip or mark succesful...remove strentgh
                if ( c_es = 'K' OR c_es = 'M' ) then
                    select nvl(sum(case c_crit when 6 then 1 when 7 then 2 when 8 then 3 else 0 end),0) into v_s_temp from dual;
                    v_s1 := v_s1 - v_s_temp ;
                end if;
                if ( c_es = 'R' ) then
                    select nvl(sum(case c_crit when 6 then 1 when 7 then 2 when 8 then 3 else 0 end),0) into v_s_temp from dual;
                    v_s1 := v_s1 + v_s_temp ;
                end if;
            end loop;
            close c_res_exception;
        --- end of adjustment
        --- now adjust the next_run_time so that we pick up next time
            begin
                update cpe_resource_mgmt set schedule_next_run_time =
                    (case when (schedule_next_run_time + (schedule_frequency/1440)) > ( nvl(schedule_end_time,sysdate+1000) )
                      then schedule_next_run_time else (schedule_next_run_time + (schedule_frequency/1440))
                    end ) where id = v_id ;
                commit;
             exception
                when others then null;
            end;
        -----
            v_err := 0;
            begin
                select decode(is_active,'Y',0,'I',0,'N',1) into v_err from cpe_profile where id = v_profile;
             exception
                when others then v_err := 1;
            end;
            if v_err = 0 then
                if v_s2 = 0 then
                    v_s_temp := v_s2;
                else
                    v_s_temp := ((v_s1 / v_s2) * 100);
                end if;
            end if;
            if v_err = 1 then
                insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                              actual_end_time,overall_status,overall_info)
                values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                         v_runtime, sysdate,sysdate,'SKIPPED','Requested profile is not active')
                returning id into v_temp3;
                update cpe_resource_mgmt set run_status=null,last_run_id = v_temp3 where id = v_id;
            end if;
            if v_err = 0 then
                begin
                    select decode(is_active,'Y',0,1),login_id into v_err,v_name from cpe_user where id = v_owner;
                  exception
                    when others then v_err := 1;
                end;
                if v_err = 1 then
                    insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                                 actual_end_time,overall_status,overall_info)
                    values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                            v_runtime, sysdate,sysdate,'SKIPPED','Requested User is not active')
                    returning id into v_temp3;
                    update cpe_resource_mgmt set run_status=null,last_run_id = v_temp3 where id = v_id;
                end if;
            end if;
        ---
            v_temp:=0;
            if v_err = 0 then
                begin
                    select resource_version_id into v_temp from cpe_resource where id=v_target and is_active='Y';
                  exception
                    when others then v_err := 1;
                end;
                if v_err = 1 then
                    insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                                 actual_end_time,overall_status,overall_info)
                    values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                            v_runtime, sysdate,sysdate,'SKIPPED','Resource is not active')
                    returning id into v_temp3;
                    update cpe_resource_mgmt set run_status=null,last_run_id = v_temp3 where id = v_id;
                end if;
            end if;
        ---
            if v_err = 0 then
                if v_cnote is not null then
                    begin
                        select b.resource_id into v_temp2
                        from cpe_resource_log a, cpe_resource_mgmt b
                        where a.id = v_cnote and b.id = a.resource_mgmt_id ;
                      exception
                        when others then v_temp2 := 0 ;
                    end;
                    begin
                        select max(a.id) into v_temp4
                        from cpe_resource_log a, cpe_resource_mgmt b
                        where a.resource_mgmt_id in ( select id from cpe_resource_mgmt
                                                      where resource_id = v_temp2 and profile_id not in
                                                                       ( select id from cpe_profile where name = 'Rule-by-rule Force Remediation -- Initiated by User')
                                                    )
                        and a.overall_status in ('COMPLETE','QUEUED','RUNNING');
                     exception
                        when others then v_temp4 :=0;
                    end;
                    if v_temp4 > 0 then
                        if v_temp4 <> v_cnote then
                            insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                                          actual_end_time,overall_status,overall_info)
                            values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                                     v_runtime, sysdate,sysdate,'SKIPPED','You can only remediate rules from latest profile-run')
                            returning id into v_temp3;
                            update cpe_resource_mgmt set run_status=null,last_run_id = v_temp3 where id = v_id;
                        end if;
                    end if;
                end if;
            end if;
        ----
            if v_err = 0 then
                v_temp2 := 0 ;
                begin
                    select max(id) into v_temp2 from cpe_profile where name = 'Rule-by-rule Force Remediation -- Initiated by User';
                  exception
                    when others then v_temp2 := 0;
                end;
                if v_profile <> v_temp2 then
                    begin
                        select id into v_temp2  from cpe_profile_support_matrix
                        where profile_id=v_profile and resource_version_id=v_temp and is_active='Y';
                      exception
                        when others then v_err := 1;
                    end;
                    if v_err = 1 then
                        insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                                      actual_end_time,overall_status,overall_info)
                        values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                                 v_runtime, sysdate,sysdate,'SKIPPED','Provided profile was NOT suitable for resource (support matrix mismatch)')
                        returning id into v_temp3;
                        update cpe_resource_mgmt set run_status=null,last_run_id = v_temp3 where id = v_id;
                    end if;
                end if;
            end if;
        ---
            if v_err = 0 then
                c_err := 'User/Parent quota exceeded';
                open c_user for
                    'select
                           quota_runs_per_month RPM, quota_cost_per_month CPM,
                           usage_runs,usage_cost,id,quota_expiry_date
                     from cpe_user connect by prior parent_id = id start with id = :s' USING v_owner;
                loop
                    fetch c_user into
                    c_rpm,c_cpm, c_ur,c_uc, c_id, c_date;exit when c_user%notfound;
                    if c_ur >= c_rpm then v_err := 1; c_err := 'User/Parent Runs_Per_Month quota EXCEEDED'; end if;
                    if ( c_uc + v_cost ) > c_cpm then v_err := 1;  c_err := 'User/Parent Cost_Per_Month quota EXCEEDED'; end if;
                    if ( (c_date is not null) AND (c_date < sysdate) ) then c_err := 'User/Parent quota EXPIRED'; v_err := 1; end if;
                end loop;
                close c_user;
                if v_err = 1 then
                    insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                                  actual_end_time,overall_status,overall_info)
                    values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                             v_runtime, sysdate,sysdate,'SKIPPED',c_err)
                    returning id into v_temp3;
                    update cpe_resource_mgmt set run_status=null,last_run_id = v_temp3 where id = v_id;
                end if;
            end if;

            if v_err = 0 then
                c_err := 'Organizational quota exceeded';
                open c_org for
                    'select
                           quota_runs_per_month RPM, quota_cost_per_month CPM,
                           usage_runs,usage_cost,id,quota_expiry_date
                     from cpe_organization connect by prior parent_id = id
                     start with id = ( select user_org_id from cpe_user where id = :s )' USING v_owner;
                loop
                fetch c_org into c_rpm,c_cpm,c_ur,c_uc,c_id,c_date;exit when c_org%notfound;
                    if c_ur >= c_rpm then v_err := 1; c_err := 'Organizational Runs_Per_Month quota EXCEEDED'; end if;
                    if ( c_uc + v_cost ) > c_cpm then v_err := 1;  c_err := 'Organizational Cost_Per_Month quota EXCEEDED'; end if;
                    if ( (c_date is not null) AND (c_date < sysdate) ) then c_err := 'Organizational quota EXPIRED';v_err:=1; end if;
                end loop;
                close c_org;
                if v_err = 1 then
                    insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                                  actual_end_time,overall_status,overall_info)
                    values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                             v_runtime, sysdate,sysdate,'SKIPPED',c_err)
                    returning id into v_temp3;
                    update cpe_resource_mgmt set run_status=null,last_run_id = v_temp3 where id = v_id;
                end if;
            end if;

/* Below code commented, in order to improve performace for IBM scalability testing. Will uncomment it after scalability testing and need to improve below code.
            if v_err = 0 then
                open c_user for
                'select
                       quota_runs_per_month RPM, quota_cost_per_month CPM,
                       usage_runs,usage_cost,id, login_id
                from cpe_user connect by prior parent_id = id start with id = :s' USING v_owner;
                loop
                fetch c_user into c_rpm,c_cpm,c_ur,c_uc,c_id,c_name;exit when c_user%notfound;
                    update cpe_user set usage_runs = (c_ur + 1), usage_cost = (c_uc + v_cost) where id = c_id;
                    commit;
                    insert into cpe_usage_log ( event_trigger_by, user_id, resource_mgmt_id,
                                                event_type, event_trigger, event_value, created_by )
                    values ( v_owner, c_id, v_id , 'apply_profile', 'Ran a profile', 1 , v_name) ;
                    insert into cpe_usage_log ( event_trigger_by, user_id, resource_mgmt_id,
                                                event_type, event_trigger, event_value, created_by )
                    values ( v_owner, c_id, v_id , 'apply_profile', 'Profile cost expensed out', v_cost , v_name) ;

                    insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
                    values ( c_id , ( select id from cpe_user_message_type where event_type = 10),
                            'Hello ' || c_name || '  :  '|| v_name ||
                            ' ran a profile and your run_per_month is increased by 1',v_name);
                    insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
                    values ( c_id , ( select id from cpe_user_message_type where event_type = 10),
                            'Hello ' || c_name || '  :  '|| v_name ||
                            ' ran a profile and your cost_per_month is increased by '|| v_cost ,v_name);
                    commit;
                end loop;
                close c_user;
            end if;
*/
            if v_err = 0 then
                open c_org for
                'select
                       quota_runs_per_month RPM, quota_cost_per_month CPM,
                       usage_runs,usage_cost,id
                from cpe_organization connect by prior parent_id = id
                start with id = ( select user_org_id from cpe_user where id = :s )' USING v_owner;
                loop
                fetch c_org into c_rpm,c_cpm,c_ur,c_uc,c_id;exit when c_org%notfound;
                    update cpe_organization set usage_runs = (c_ur + 1), usage_cost = (c_uc + v_cost) where id = c_id;
                    commit;
                  end loop;
                  close c_org;
            end if;

            if v_err = 0 then
        --- make sure no other instance is running or queued or on-hold, if so, you go on-hold
                v_qid :=0;
                begin
                    select nvl(min(id),0) into v_qid  from cpe_resource_log
                    where resource_mgmt_id IN ( select id from cpe_resource_mgmt
                                                where resource_id = (select resource_id from cpe_resource_mgmt where id = v_id)
                                              )
                    and overall_status IN  ('RUNNING','QUEUED','READY') ;
                  exception
                    when others then v_qid := 0 ;
                end;
                if v_qid = 0 then
                    begin
                        select nvl(min(id),0) into v_qid  from cpe_resource_log
                        where resource_mgmt_id IN ( select id from cpe_resource_mgmt
                                                     where resource_id = (select resource_id from cpe_resource_mgmt where id = v_id)
                                                  )
                        and overall_status IN  ('ON-HOLD') ;
                    exception
                       when others then v_qid := 0 ;
                    end;
                    if v_qid > 0 then
                       update cpe_resource_log set overall_status = 'QUEUED', actual_start_time = sysdate where id = v_qid;
                       commit;
                       ret_str := ret_str || v_id || ',' || v_profile || ',' || v_qid || '###';
                    end if;
                end if;
                v_q_status := 'ON-HOLD'; select null into v_q_ast from dual;
                begin
                    select nvl(max(id),0) into v_qid  from cpe_resource_log
                    where resource_mgmt_id IN ( select id from cpe_resource_mgmt
                                                     where resource_id = (select resource_id from cpe_resource_mgmt where id = v_id)
                                              )
                    and overall_status IN  ('RUNNING','QUEUED','READY') ;
                  exception
                    when others then v_qid := 0 ;
                end;
                if v_qid = 0 then v_q_status := 'READY'; select sysdate into v_q_ast from dual; end if;
                insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                              overall_status,run_parameter, run_mof , profile_ref_id , profile_strength)
                values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                         v_runtime, v_q_ast ,v_q_status,
                         xmltype(create_profile_run_data(v_profile,v_id)) , create_profile_run_mof(v_profile,v_id),
                         v_s_id , v_s_temp )
                returning id into v_rlog_id;
                update cpe_resource_mgmt set run_status=null,last_run_id = v_rlog_id where id = v_id;
                commit;
                if v_qid = 0 then
                    ret_str := ret_str || v_id || ',' || v_profile || ',' || v_rlog_id || '###';
                end if;
            end if;
        end if;
    END loop;
    CLOSE c1;
    commit;
        
    --- even if no candidates , check for anyone in holding position
    OPEN c2;
    LOOP
    FETCH c2 into v_rlog_id,c_id ; EXIT WHEN c2%notfound;
        v_qid :=0;
        begin
            select nvl(max(id),0) into v_qid  from cpe_resource_log
            where resource_mgmt_id IN ( select id from cpe_resource_mgmt
                                        where resource_id = (select resource_id from cpe_resource_mgmt where id = c_id)
                                      )
            and overall_status IN  ('RUNNING','READY') ;
          exception
            when others then v_qid := 0 ;
        end;
        if v_qid = 0 then
            begin
                select profile_id into v_profile from cpe_resource_mgmt where id = c_id;
              exception
                when others then v_profile := 0 ;
            end;
            if v_profile > 0 then
                update cpe_resource_log set overall_status = 'READY', actual_start_time = sysdate where id = v_rlog_id;
                commit;
                ret_str := ret_str || c_id || ',' || v_profile || ',' || v_rlog_id || '###';
            end if;
        end if;
    end loop;
    close c2;
---  now clean up old pending stuff
    begin
        update cpe_resource_log set overall_status = 'ABORTED' , actual_end_time = sysdate ,
               overall_info = '[ Job in RUNNING / QUEUED state for more than 45 minutes ]'
        where id in (select id from cpe_resource_log where nvl(actual_start_time,sysdate) < sysdate - 45/1440 and overall_status in ('QUEUED','RUNNING') );
        commit;
      exception when others then null;
    end;

    begin
        update cpe_resource_log
        set overall_status = 'ABORTED' , actual_start_time = sysdate, actual_end_time = sysdate ,
            overall_info = '[ Job in ON_HOLD state for more than 45 minutes ]'
        where id in (select id from cpe_resource_log where nvl(scheduled_start_time,sysdate) < sysdate - 45/1440 and overall_status in ('ON-HOLD') );
        commit;
     exception when others then null;
    end;
--- Applying profile on schedules where overall_status is set to Ready
    open c3;
     LOOP
     FETCH c3 into p_resource_id, p_profile_id, p_log_id ; EXIT WHEN c3%notfound;
         begin
             select invoke_profile_application(p_resource_id,p_profile_id,p_log_id) into api_ret from dual;
         end;
    end loop;
    close c3;
---
    return ret_str;
end;
/

create or replace FUNCTION RESET_USAGE_DATA
RETURN varchar2 IS
ret_str varchar2(1024);
pragma autonomous_transaction;
cursor c1 is select id,is_active,login_id from cpe_user order by id desc;
cursor c2 is select id,is_active,owner_id,name from cpe_organization order by id desc;
v_id number(16);v_active varchar2(1);v_name varchar2(64);
v_owner number(16); v_org_name varchar2(64);
begin
   ret_str := 'Successfully reset usage quota';

   OPEN c1;
   LOOP
     FETCH c1 into v_id,v_active,v_name; EXIT WHEN c1%notfound;
     if v_active = 'Y' then
        update cpe_user set usage_runs = 0 , usage_cost = 0
            where id = v_id;
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
            values ( v_id , ( select id from cpe_user_message_type where event_type = 11),
                    'Hello ' || v_name || '  :  Your monthly usage is reset to zero by system','System Trigger');
      end if;
      commit;
   END LOOP;
   CLOSE c1;

   OPEN c2;
   LOOP
     FETCH c2 into v_id,v_active,v_owner,v_org_name ; EXIT WHEN c2%notfound;
     if v_active = 'Y' then
        update cpe_organization set usage_runs = 0 , usage_cost = 0
             where id = v_id and 
             (quota_expiry_date > sysdate OR quota_expiry_date is null)
             and is_active = 'Y';
        begin
           select login_id into v_name from cpe_user where id = v_owner;
        exception
           when others then v_name := '';
        end;
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
            values ( v_owner,
                    ( select id from cpe_user_message_type where event_type = 11),
                    'Hello ' || v_name || '  :  Your Org : ' || v_org_name ||
                         ' monthly usage is reset to zero by system','System Trigger');
      end if;
      commit;
   END LOOP;
   CLOSE c2;

   return ret_str;
end;
/

create or replace FUNCTION PROCESS_EXPIRED_ENTITY
RETURN varchar2 IS
ret_str varchar2(1024);
pragma autonomous_transaction;
cursor c1 is select id,login_id,parent_id from cpe_user 
             where is_active = 'Y' and user_expiry_date < sysdate order by id desc;
v_id number(16);v_active varchar2(1);v_name varchar2(64);v_pid number(16);
cursor c2 is select id,name,owner_id from cpe_profile where is_active in ('Y','I') and profile_expiry_date < sysdate;

begin
   ret_str := 'Successfully processed expiry dates ';

   OPEN c1;
   LOOP
     FETCH c1 into v_id,v_name,v_pid ; EXIT WHEN c1%notfound;
      update cpe_user set is_active= 'N' where id = v_id;
      insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
             values ( v_pid , ( select id from cpe_user_message_type where event_type = 16),
                    'Your user '|| v_name || ' is made inactive by system ( user_expiry_date past current date) ',
                    'System Trigger');
      commit;
   END LOOP;
   CLOSE c1;

   OPEN c2;
   LOOP
     FETCH c2 into v_id,v_name,v_pid ; EXIT WHEN c2%notfound;
      update cpe_profile set is_active= 'N' where id = v_id;
      insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
             values ( v_pid , ( select id from cpe_user_message_type where event_type = 17),
                    'Your profile '|| v_name || ' is made inactive by system ( profile_expiry_date past current date) ',
                    'System Trigger');
      commit;
   END LOOP;
   CLOSE c2;

   return ret_str;
end;
/

begin
dbms_scheduler.drop_job ('CR_SCHED_PROFILE_JOB');
end;
/
begin
dbms_scheduler.create_job (
job_name => 'CR_SCHED_PROFILE_JOB',
job_type => 'PLSQL_BLOCK',
job_action => '
begin
    declare 
      v_str varchar2(2048);
    begin
       v_str := get_schedule_data();
    end;  
end;',
comments => 'will check every min if anything needs to be scheduled to run');
end;
/
BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name => 'CR_SCHED_PROFILE_JOB', attribute => 'START_DATE',value => '01-JUN-17 12.00.00AM UTC');
END;
/
BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name => 'CR_SCHED_PROFILE_JOB', attribute => 'repeat_interval', value => 'FREQ=MINUTELY');
END;
/
BEGIN
      DBMS_SCHEDULER.enable(name=>'"RAXAK3"."CR_SCHED_PROFILE_JOB"');
END;
/

begin
dbms_scheduler.drop_job ('CR_RESET_USAGE_JOB');
end;
/
begin
dbms_scheduler.create_job (
job_name => 'CR_RESET_USAGE_JOB',
job_type => 'PLSQL_BLOCK',
job_action => '
begin
    declare
      v_str varchar2(2048);
    begin
       v_str := reset_usage_data();
    end;
end;',
comments => 'will reset user and org usage data every month at start of month at 00 hours');
end;
/
BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name  => 'CR_RESET_USAGE_JOB', attribute => 'START_DATE',value => '01-JUN-17 12.00.00AM UTC');
END;
/
BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name => 'CR_RESET_USAGE_JOB', attribute => 'repeat_interval',value => 'FREQ=MONTHLY');
END;
/
BEGIN
      DBMS_SCHEDULER.enable(name=>'"RAXAK3"."CR_RESET_USAGE_JOB"');
END;
/

begin
dbms_scheduler.drop_job ('CR_ENTITY_EXPIRY_JOB');
end;
/
begin
dbms_scheduler.create_job (
job_name => 'CR_ENTITY_EXPIRY_JOB',
job_type => 'PLSQL_BLOCK',
job_action => '
begin
    declare
      v_str varchar2(2048);
    begin
       v_str := process_expired_entity();
    end;
end;',
comments => 'will expire entities every month at start of day at 00 hours at entity_expiry_date');
end;
/
BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name  => 'CR_ENTITY_EXPIRY_JOB', attribute => 'START_DATE',value => '01-JUN-17 12.00.00AM UTC');
END;
/
BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name => 'CR_ENTITY_EXPIRY_JOB', attribute => 'repeat_interval',value => 'FREQ=DAILY');
END;
/
BEGIN
      DBMS_SCHEDULER.enable(name=>'"RAXAK3"."CR_ENTITY_EXPIRY_JOB"');
END;
/


PROMPT all done with scheduler stuff
PROMPT Good bye.
