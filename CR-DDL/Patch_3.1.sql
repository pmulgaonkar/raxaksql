create or replace TRIGGER "CPE_RESOURCE_TRIG3" before update on CPE_RESOURCE for each row
DECLARE
v_id number(16);v_quota number(16); v_usage number(16); v_err number(1);v_auth_id number(16);
v_old_owner number(16); v_new_owner number(16); v_active varchar2(1);v_found number (1);
pragma autonomous_transaction;
cursor c1 is select id,
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when quota_expiry_date < sysdate then 0
             else quota_resource
             end quota_resource,
             usage_resource from cpe_user
             where is_active = 'Y'
             connect by prior parent_id = id start with id = :new.owner_id;
cursor c2 is select id,
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when quota_expiry_date < sysdate then 0
             else quota_resource
             end quota_resource,
             usage_resource from cpe_organization
             where is_active = 'Y'
             connect by prior parent_id = id
             start with id = ( select user_org_id from cpe_user where id = :new.owner_id and is_active = 'Y') ;
cursor c3 is select id,is_active from cpe_user
             where id <> :old.owner_id
             connect by prior parent_id=id start with id= :old.owner_id ;
cursor c4 is select id,
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when quota_expiry_date < sysdate then 0
             else quota_resource
             end quota_resource,
             usage_resource
             from cpe_user
             connect by prior parent_id=id start with id= :new.owner_id;
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
      if (:old.is_active = 'Y' AND :new.is_active = 'N' ) THEN
         open c1;
         loop
            FETCH c1 into v_id,v_quota,v_usage; EXIT WHEN c1%notfound;
            begin
               update cpe_user set usage_resource = v_usage - 1 where id = v_id;
               commit;
            exception
               when others then raise_application_error ( -20001, 'Error : 20001 : Error updating cpe_user');
            end;
         end loop;
         close c1;
         open c2;
         loop
            FETCH c2 into v_id,v_quota,v_usage; EXIT WHEN c2%notfound;
            begin
               update cpe_organization set usage_resource = v_usage - 1 where id = v_id;
               commit;
            exception
               when others then raise_application_error ( -20001, 'Error : 20001 : Error updating cpe_org');
            end;
         end loop;
         close c2;
         open c3;v_found := 0;
         loop
             FETCH c3 into v_id,v_active; EXIT WHEN c3%notfound;
             if v_found = 0  then
                if v_active = 'Y' then
                   v_found := 1;
                   begin
                     select v_id into :new.owner_id from dual;
                   exception
                     when others then raise_application_error ( -20001, 'Error : 20001 : Error updating cpe_user');
                   end;
                   insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
                   values ( v_id ,( select id from cpe_user_message_type where event_type = 12),
                    'You inherited deactivated resource '|| :old.name || ' because it was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
                    'Resource status changed' ,'System Generated Event');
                 end if;
              end if;
         end loop;
         close c3;
      end if;
      if (:old.is_active = 'N' AND :new.is_active = 'Y' ) THEN
         v_err := 0;
         open c1;
         loop
            FETCH c1 into v_id,v_quota,v_usage; EXIT WHEN c1%notfound;
            if v_usage >= v_quota then v_err := 1; end if;
         end loop;
         close c1;
         if v_err = 0 then
            open c2;
            loop
               FETCH c2 into v_id,v_quota,v_usage; EXIT WHEN c2%notfound;
               if v_usage >= v_quota then v_err := 1; end if;
            end loop;
            close c2;
         end if;
         if v_err = 0 then
           open c1;
           loop
              FETCH c1 into v_id,v_quota,v_usage; EXIT WHEN c1%notfound;
              if v_quota < v_usage + 1 then
                raise_application_error ( -20000, 'Error : 20000 : Resource quota exceeded');
              else
                 begin
                   update cpe_user set usage_resource = v_usage + 1 where id = v_id;
                 exception
                   when others then raise_application_error ( -20001, 'Error : 20001 : Error updating cpe_user');
                 end;
              end if;
           end loop;
           close c1;
           open c2;
           loop
              FETCH c2 into v_id,v_quota,v_usage; EXIT WHEN c2%notfound;
              if v_quota < v_usage + 1 then
                 raise_application_error ( -20000, 'Error : 20000 : Resource quota exceeded');
              else
                 begin
                    update cpe_organization set usage_resource = v_usage + 1 where id = v_id;
                 exception
                    when others then raise_application_error ( -20001, 'Error : 20001 : Error updating cpe_org');
                 end;
               end if;
           end loop;
           close c2;
           commit;
         else
           raise_application_error ( -20030, 'Error : 20030');
         end if;
       end if;
       commit;
       if updating ('owner_id') then
         if :new.is_active = 'Y' then
          open c3;
          loop
              FETCH c3 into v_id,v_active; EXIT WHEN c3%notfound;
              if v_active = 'Y' then
                 begin
                   update cpe_user set usage_resource = usage_resource - 1 where id = v_id;
                 exception
                   when others then null;
                 end;
              end if;
          end loop;
          commit;
          close c3;
          open c4;
          loop
              FETCH c4 into v_id,v_quota,v_usage; EXIT WHEN c4%notfound;
              if v_quota < v_usage + 1 then
                 raise_application_error ( -20000, 'Error : 20000 : Resource quota exceeded');
              else
                 begin
                   update cpe_user set usage_resource = usage_resource + 1 where id = v_id;
                 exception
                   when others then null;
                 end;
              end if;
          end loop;
          close c4;
          commit;
         end if;
       end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_TRIG3" ENABLE;
/

create or replace FUNCTION GET_SCHEDULE_DATA
RETURN varchar2 IS
ret_str varchar2(1024);
pragma autonomous_transaction;
type c_user_cur is ref cursor; c_user c_user_cur;
type c_org_cur is ref cursor; c_org c_org_cur;
type c_res_execption_cur is ref cursor; c_res_exception c_res_execption_cur;
cursor c1 is select id, resource_id,profile_id,owner_id,
                    schedule_next_run_time, decode(run_remediate,'Y',run_cost_remediate,run_cost_scan),
                    run_remediate,change_note
             from   cpe_resource_mgmt
             where  (
                      (schedule_next_run_time is not null and
                       to_char(schedule_next_run_time ,'mm-dd-yyyy hh24:mi') = to_char(sysdate,'mm-dd-yyyy hh24:mi') )
                      OR
                       (change_note='API-test')
                     )
                    and nvl(schedule_end_time,sysdate+1) >= sysdate and is_active ='Y';
cursor c2 is select id, resource_mgmt_id from cpe_resource_log
                    where overall_status = 'ON-HOLD' order by 1,2 asc;

v_id number(16);v_target number(16); v_profile number(16);v_owner number(16);v_runtime timestamp;v_cost number(9,3);
v_err number(1);v_name varchar2(64);v_remediate varchar2(1);v_rlog_id number(16);
c_cpm number(10,2);c_rpm number(8);c_uc number(10,2);c_ur number(8);c_id number(16);c_name varchar2(64);
c_es_cost number(10,2); c_er_cost number(10,2);c_es varchar2(1);c_date timestamp;c_err varchar2(64);c_crit number(16);
v_s1 number(8,3); v_s2 number(8,3);v_s_id number(16);v_s_temp number(8,3);
v_qid number(16);v_q_status varchar2(8);v_q_ast timestamp;
v_temp number(16);v_temp2 number(16);v_temp3 number(16); v_cnote varchar2(1024);v_temp4 number(16);
api_ret CLOB;
begin
   OPEN c1;
   LOOP
     FETCH c1 into v_id,v_target,v_profile,v_owner,v_runtime,v_cost,v_remediate,v_cnote; EXIT WHEN c1%notfound;
-- get original strength
     begin
         select nvl(sum(case a.criticality_id when 5 then 1 when 6 then 2 when 7 then 3 else 0 end),0) into v_s1
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
        select nvl(sum(case a.criticality_id when 5 then 1 when 6 then 2 when 7 then 3 else 0 end),0) into v_s2
        from cpe_profile_member a, cpe_profile b
        where a.is_active='Y' and b.id = a.profile_id
        and b.id = v_s_id;
      exception
        when others then v_s2 := 0;
      end ;
---
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
              select nvl(sum(case c_crit when 5 then 1 when 6 then 2 when 7 then 3 else 0 end),0)
                     into v_s_temp from dual;
              v_s1 := v_s1 - v_s_temp ;
           end if;
           if ( c_es = 'R' ) then
              select nvl(sum(case c_crit when 5 then 1 when 6 then 2 when 7 then 3 else 0 end),0)
                     into v_s_temp from dual;
              v_s1 := v_s1 + v_s_temp ;
           end if;
       end loop;
       close c_res_exception;
--- end of adjustment
--- now adjust the next_run_time so that we pick up next time
       begin
         update cpe_resource_mgmt
         set schedule_next_run_time =
             (case when
                   (schedule_next_run_time + (schedule_frequency/1440)) > ( nvl(schedule_end_time,sysdate+1000) )
              then schedule_next_run_time else (schedule_next_run_time + (schedule_frequency/1440))
             end )
         where id = v_id ;
         commit;
       exception
         when others then null;
       end;
-----
     v_err := 0;
     begin
      select decode(is_active,'Y',0,'I',0,1) into v_err from cpe_profile where id = v_profile;
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
        update cpe_resource_mgmt set last_run_id = v_temp3 where id = v_id;
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
                    v_runtime, sysdate,sysdate,'SKIPPED','Requestor User is not active')
           returning id into v_temp3;
           update cpe_resource_mgmt set last_run_id = v_temp3 where id = v_id;
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
           update cpe_resource_mgmt set last_run_id = v_temp3 where id = v_id;
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
                                                               ( select id from cpe_profile
                                                                 where name = 'Rule-by-rule Force Remediation -- Initiated by User')
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
                  update cpe_resource_mgmt set last_run_id = v_temp3,change_note='' where id = v_id;
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
               update cpe_resource_mgmt set last_run_id = v_temp3 where id = v_id;
            end if;
        end if;
     end if;
---
     if v_err = 0 then
         c_err := 'User/Parent quota exceeded';
         open c_user for
           'select
                 case when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
                 when quota_expiry_date < sysdate then 0
                 when quota_runs_per_month = -1 then 99999999
                 else quota_runs_per_month
                 end RPM,
                 case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
                 when quota_expiry_date < sysdate then 0
                 when quota_cost_per_month = -1 then 99999999
                 else quota_cost_per_month
                 end CPM,
                 usage_runs,usage_cost,id,quota_expiry_date
            from cpe_user connect by prior parent_id = id start with id = :s' USING v_owner;
          loop
            fetch c_user into
            c_rpm,c_cpm,
            c_ur,c_uc,
            c_id, c_date;exit when c_user%notfound;
            if c_ur >= c_rpm then v_err := 1; c_err := 'User/Parent Runs_Per_Month quota EXCEEDED'; end if;
            if ( c_uc + v_cost ) > c_cpm then v_err := 1;  c_err := 'User/Parent Cost_Per_Month quota EXCEEDED'; end if;
            if ( (c_date is not null) AND (c_date < sysdate) ) then c_err := 'User/Parent quota EXPIRED'; v_err := 1; end if;
          end loop;
          close c_user;
          if v_err = 1 then
             insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                           actual_end_time,overall_status,overall_info)
             values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                      v_runtime, sysdate,sysdate,'SKIPPED',c_err);
          end if;
      end if;

      if v_err = 0 then
         c_err := 'Organizational quota exceeded';
         open c_org for
           'select
                 case when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
                 when quota_expiry_date < sysdate then 0
                 when quota_runs_per_month = -1 then 99999999
                 else quota_runs_per_month
                 end RPM,
                 case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
                 when quota_expiry_date < sysdate then 0
                 when quota_cost_per_month = -1 then 99999999
                 else quota_cost_per_month
                 end CPM,
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
                      v_runtime, sysdate,sysdate,'SKIPPED',c_err);
          end if;
      end if;

      if v_err = 0 then
         open c_user for
           'select
                 case when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
                 when quota_expiry_date < sysdate then 0
                 when quota_runs_per_month = -1 then 99999999
                 else quota_runs_per_month
                 end RPM,
                 case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
                 when quota_expiry_date < sysdate then 0
                 when quota_cost_per_month = -1 then 99999999
                 else quota_cost_per_month
                 end CPM,
                 usage_runs,usage_cost,id, login_id
            from cpe_user connect by prior parent_id = id start with id = :s' USING v_owner;
          loop
            fetch c_user into c_rpm,c_cpm,c_ur,c_uc,c_id,c_name;exit when c_user%notfound;
            update cpe_user set usage_runs = (c_ur + 1), usage_cost = (c_uc + v_cost)
                   where id = c_id;
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

      if v_err = 0 then
         open c_org for
           'select
                 case when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
                 when quota_expiry_date < sysdate then 0
                 when quota_runs_per_month = -1 then 99999999
                 else quota_runs_per_month
                 end RPM,
                 case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
                 when quota_expiry_date < sysdate then 0
                 when quota_cost_per_month = -1 then 99999999
                 else quota_cost_per_month
                 end CPM,
                 usage_runs,usage_cost,id
            from cpe_organization connect by prior parent_id = id
            start with id = ( select user_org_id from cpe_user where id = :s )' USING v_owner;
          loop
            fetch c_org into c_rpm,c_cpm,c_ur,c_uc,c_id;exit when c_org%notfound;
            update cpe_organization set usage_runs = (c_ur + 1), usage_cost = (c_uc + v_cost)
                   where id = c_id;
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
                                           where resource_id = (select resource_id from cpe_resource_mgmt
                                                                where id = v_id)
                                         )
               and overall_status IN  ('RUNNING','QUEUED') ;
         exception
             when others then v_qid := 0 ;
         end;
         if v_qid = 0 then
            begin
              select nvl(min(id),0) into v_qid  from cpe_resource_log
              where resource_mgmt_id IN ( select id from cpe_resource_mgmt
                                             where resource_id = (select resource_id from cpe_resource_mgmt
                                             where id = v_id)
                                         )
              and overall_status IN  ('ON-HOLD') ;
            exception
               when others then v_qid := 0 ;
            end;
            if v_qid > 0 then
               update cpe_resource_log set overall_status = 'QUEUED', actual_start_time = sysdate
               where id = v_qid;
               commit;
               ret_str := ret_str || v_id || ',' || v_profile || ',' || v_qid || '###';
---- now call the API
               BEGIN
-- Job defined entirely by the CREATE JOB procedure.
                 DBMS_SCHEDULER.create_job (
                    job_name        => 'JOB_' || to_char(sysdate,'rrrrmmddhh24miss') || '_' || v_id ,
                    job_type        => 'PLSQL_BLOCK',
                    job_action      => 'BEGIN
                                          declare api_ret2 CLOB;
                                          begin
                                            select invoke_profile_application('||v_id ||',' ||
                                                 v_profile||','||v_qid||') into api_ret2 from dual;
                                          end;
                                        END;',
                    start_date      => SYSTIMESTAMP,
                    repeat_interval => NULL,
                    end_date        => NULL,
                    enabled         => TRUE
                 );
               END;
---               select invoke_profile_application(v_id,v_profile,v_qid) into api_ret from dual;
---- end calling the API
            end if;
         end if;
         v_q_status := 'ON-HOLD'; select null into v_q_ast from dual;
         begin
              select nvl(max(id),0) into v_qid  from cpe_resource_log
              where resource_mgmt_id IN ( select id from cpe_resource_mgmt
                                             where resource_id = (select resource_id from cpe_resource_mgmt
                                                                  where id = v_id)
                                        )
              and overall_status IN  ('RUNNING','QUEUED') ;
         exception
             when others then v_qid := 0 ;
         end;
         if v_qid = 0 then v_q_status := 'QUEUED'; select sysdate into v_q_ast from dual; end if;
         insert into cpe_resource_log (resource_mgmt_id,profile_info_id,scheduled_start_time,actual_start_time,
                                       overall_status,run_parameter, run_mof , profile_ref_id , profile_strength)
         values ( v_id, (select max(id) from cpe_profile_info where profile_id = v_profile ),
                  v_runtime, v_q_ast ,v_q_status,
                  xmltype(create_profile_run_data(v_profile,v_id)) , create_profile_run_mof(v_profile,v_id),
                  v_s_id , v_s_temp )
         returning id into v_rlog_id;
         update cpe_resource_mgmt set last_run_id = v_rlog_id where id = v_id;
         commit;
         if v_qid = 0 then
            ret_str := ret_str || v_id || ',' || v_profile || ',' || v_rlog_id || '###';
---- now call the API
            BEGIN
-- Job defined entirely by the CREATE JOB procedure.
                 DBMS_SCHEDULER.create_job (
                    job_name        => 'JOB_' || to_char(sysdate,'rrrrmmddhh24miss') || '_' || v_id ,
                    job_type        => 'PLSQL_BLOCK',
                    job_action      => 'BEGIN
                                          declare api_ret1 CLOB;
                                          begin
                                             select invoke_profile_application('||v_id ||',' ||
                                                 v_profile||','||v_rlog_id||') into api_ret1 from dual;
                                          end;
                                        END;',
                    start_date      => SYSTIMESTAMP,
                    repeat_interval => NULL,
                    end_date        => NULL,
                    enabled         => TRUE
                 );
             END;
--            select invoke_profile_application(v_id,v_profile,v_rlog_id) into api_ret from dual;
---- end calling the API
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
                                             where resource_id = (select resource_id from cpe_resource_mgmt
                                             where id = c_id)
                                        )
              and overall_status IN  ('RUNNING','QUEUED') ;
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
               update cpe_resource_log set overall_status = 'QUEUED', actual_start_time = sysdate where id = v_rlog_id;
               commit;
               ret_str := ret_str || c_id || ',' || v_profile || ',' || v_rlog_id || '###';
               BEGIN
-- Job defined entirely by the CREATE JOB procedure.
                 DBMS_SCHEDULER.create_job (
                    job_name        => 'JOB_' || to_char(sysdate,'rrrrmmddhh24miss') ||  v_rlog_id ,
                    job_type        => 'PLSQL_BLOCK',
                    job_action      => 'BEGIN
                                          declare api_ret3 CLOB;
                                          begin
                                             select invoke_profile_application('||c_id ||',' ||
                                                 v_profile||','||v_rlog_id||') into api_ret3 from dual;
                                          end;
                                        END;',
                    start_date      => SYSTIMESTAMP,
                    repeat_interval => NULL,
                    end_date        => NULL,
                    enabled         => TRUE
                 );
              END;
--               select invoke_profile_application(c_id,v_profile,v_rlog_id) into api_ret from dual;
            end if;
         end if;
   end loop;
   close c2;
---  now clean up old pending stuff
   begin
      update cpe_resource_log
             set overall_status = 'ABORTED' , actual_end_time = sysdate ,
                 overall_info = '[ Job in RUNNING / QUEUED state for more than 30 minutes] '
      where id in (select id from cpe_resource_log
             where nvl(actual_start_time,sysdate) < sysdate - 30/1440 and overall_status in ('QUEUED','RUNNING') );
      commit;
   exception when others then null;
   end;

   begin
      update cpe_resource_log
             set overall_status = 'ABORTED' , actual_start_time = sysdate, actual_end_time = sysdate ,
                 overall_info = '[ Job in ON_HOLD state for more than 30 minutes] '
      where id in (select id from cpe_resource_log
             where nvl(scheduled_start_time,sysdate) < sysdate - 30/1440 and overall_status in ('ON-HOLD') );
      commit;
   exception when others then null;
   end;
---
   return ret_str;
end;
/

BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name => 'CR_SCHED_PROFILE_JOB', attribute => 'START_DATE',value => '01-JUL-17 12.00.00AM UTC');
END;
/
BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name  => 'CR_RESET_USAGE_JOB', attribute => 'START_DATE',value => '01-JUN-17 12.00.00AM UTC');
END;
/
BEGIN
DBMS_SCHEDULER.SET_ATTRIBUTE (
   name  => 'CR_ENTITY_EXPIRY_JOB', attribute => 'START_DATE',value => '01-JUN-17 12.00.00AM UTC');
END;
/

create or replace TRIGGER "CPE_RESOURCE_MGMT_TRIG2" before update on CPE_RESOURCE_MGMT for each row
declare
v_id number (16);
v_rule_by_rule number (16);
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
      if updating ('ID') or updating('resource_id') or
--         updating('run_remediate') or updating('schedule_start_time') or
         updating('schedule_create_time') or updating('run_cost_scan') or updating('run_cost_remediate')
      then
         raise_application_error ( -20000,'Error: you can not update these values');
      end if;
      if :new.schedule_frequency is NULL OR :new.schedule_frequency = 0 then select 1440 into :new.schedule_frequency from dual;end if;
      if updating ('schedule_end_time') then
         if :new.schedule_end_time is not null then
            if :new.schedule_end_time < sysdate OR :new.schedule_end_time < :new.schedule_start_time then
               raise_application_error ( -20000, 'Error: Schedule end time must be later than start time'
                                       || '  sysdate = ' || to_char(sysdate,'dd-mon-rrrr hh:mi')
                                       || '  end date = ' || to_char(:new.schedule_end_time ,'dd-mon-rrrr hh:mi')
                                       );
            end if;
         end if;
      end if;
      if updating ('schedule_start_time') then
         if :new.schedule_start_time is not null then
            if :new.schedule_start_time < sysdate OR :new.schedule_start_time > :new.schedule_end_time then
               raise_application_error ( -20000, 'Error: Schedule end time must be later than start time' );
            end if;
         else
               raise_application_error ( -20000, 'Error: Schedule start time must be specified' );
         end if;
      end if;
      if updating ('run_remediate') then
         if :new.run_remediate = 'Y' then
            begin
               select id into v_id from cpe_user where id = :new.owner_id and is_active = 'Y' and remediate_priviledge = 'Y' ;
            exception
               when no_data_found then raise_application_error ( -20000, 'Error: User is not priviledged to run remediate');
            end;
         end if;
      end if;
      if :old.is_active = 'N' and updating ('is_active') then
         raise_application_error ( -20000, 'Error: You can not activate inactive schedule');
      end if;
      v_rule_by_rule := 0 ;
      begin
         select max(id) into v_rule_by_rule
                from cpe_profile where name ='Rule-by-rule Force Remediation -- Initiated by User'
                and id = :new.profile_id
                and is_active in ('Y','I');
      exception
         when others then v_rule_by_rule := 0 ;
      end;
      if v_rule_by_rule > 0  then
          select 0,0 into :new.run_cost_scan, :new.run_cost_remediate from dual;
       else
          begin SELECT p1,p2 into :new.run_cost_scan, :new.run_cost_remediate
             FROM cpe_profile_info a,
             XMLTABLE ('/ProfileInfo/Info' PASSING a.profile_info
             columns P1 number(9,3) PATH 'cost_to_scan', P2 number(9,3) PATH 'cost_to_remediate') b
             where a.profile_id = :new.profile_id and is_active='Y';
            exception
             when others then raise_application_error ( -20000,'Error: Could not gather profile info');
          end;
      end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_MGMT_TRIG2" ENABLE;
/

create or replace TRIGGER "CPE_RESOURCE_MGMT_TRIG1" before insert on CPE_RESOURCE_MGMT for each row
declare
v_id number (16); v_res number(16); v_prof number(16);
v_rule_by_rule number (16);
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      if :new.run_remediate is null then select 'Y' into :new.run_remediate from dual ; end if;
      if :new.created_by is null then
          select ( select login_id from cpe_user where id = :new.owner_id and is_active='Y') into :new.created_by from dual;
      end if;
      if :new.schedule_frequency is NULL OR :new.schedule_frequency = 0 then select 1440 into :new.schedule_frequency from dual;end if;
      if :new.schedule_start_time is NULL then
         select ( sysdate + 1/1440 ) into :new.schedule_start_time from dual;
      end if;
     if :new.schedule_start_time < sysdate then
         raise_application_error ( -20000, 'Error: Schedule start time can not be past' );
      end if;
      if :new.schedule_end_time is not null then
         if :new.schedule_end_time < sysdate OR :new.schedule_end_time < :new.schedule_start_time then
            raise_application_error ( -20000, 'Error: Schedule end time must be later than start time' );
         end if;
      end if;
      v_rule_by_rule := 0 ;
      begin
         select max(id) into v_rule_by_rule
                from cpe_profile where name ='Rule-by-rule Force Remediation -- Initiated by User'
                and id = :new.profile_id
                and is_active in ('Y','I');
      exception
         when others then v_rule_by_rule := 0 ;
      end;
      if v_rule_by_rule = 0 then
         begin
            select id  into v_id from cpe_user_profile
                where permitted_user_id = :new.owner_id and profile_id = :new.profile_id and
                nvl(granted_date,sysdate - 1 )  <= sysdate and ( expiry_date >= sysdate OR expiry_date is null)  and is_active = 'Y';
         exception
                when no_data_found then raise_application_error ( -20000, 'Error: Profile not available for user');
         end;
       end if;
       begin
         select id  into v_id from cpe_user where id = :new.owner_id and is_active = 'Y';
         exception
             when no_data_found then raise_application_error ( -20000, 'Error: User is inactive');
       end;
       if :new.run_remediate = 'Y' then
          begin
            select id into v_id from cpe_user where id = :new.owner_id and is_active = 'Y' and remediate_priviledge = 'Y' ;
            exception
               when no_data_found then raise_application_error ( -20000, 'Error: User is not priviledged to run remediate');
          end;
       end if;
       begin
         select id ,resource_type_id into v_id,v_prof  from cpe_profile where id = :new.profile_id and is_active in ('Y','I') ;
         exception
             when no_data_found then raise_application_error ( -20000, 'Error: Profile is inactive');
       end;
--       begin
--         select id, resource_type_id  into v_id , v_res from cpe_resource where id = :new.resource_id and is_active = 'Y'
--             and owner_id IN ( select id from cpe_user where is_active = 'Y' connect by prior id=parent_id start with id=:new.owner_id) ;
--         exception
--             when no_data_found then raise_application_error ( -20000, 'Error: User does not have priviledge on resource');
--       end;
       if v_rule_by_rule > 0 then
          select 1,1 into :new.run_cost_scan, :new.run_cost_remediate from dual;
       else
          begin SELECT p1,p2 into :new.run_cost_scan, :new.run_cost_remediate
             FROM cpe_profile_info a,
             XMLTABLE ('/ProfileInfo/Info' PASSING a.profile_info
             columns P1 number(9,3) PATH 'cost_to_scan', P2 number(9,3) PATH 'cost_to_remediate') b
             where a.profile_id = :new.profile_id and is_active='Y';
          exception
             when others then raise_application_error ( -20000,'Error: Could not gather profile info');
          end;
       end if;
--       if v_res <> v_prof then
--            raise_application_error ( -20000,'Error: Resource-Profle type mismatch');
--       end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_MGMT_TRIG1" ENABLE;
/
create or replace function "INVOKE_REMEDIATE_BY_RULE" (
P_owner IN NUMBER,           --   logged in user id
P_resource IN NUMBER,        --   resource id
P_run_id IN NUMBER,          --   resource_log_id  where rule is selected to be remediated
P_rule_id IN NUMBER          --   rule_id
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);v_err number (1);
v_id number(16);
v_pid number(16); v_temp number(16);
begin
    v_err :=0;result := 'Successfully scheduled selective rule-by-rule remediation';
    begin
      select max(id) into v_pid from cpe_profile
       where name ='Rule-by-rule Force Remediation -- Initiated by User' and is_active in ('Y','I');
    exception
       when others then  v_err:=1;
          select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20001;
          raise_application_error( -20001, result );
    end;
    if v_err = 0 then
       begin
          select id into v_temp from cpe_user where id = P_owner  and is_active = 'Y' ;
       exception
          when others then v_err:=1;
          select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20017;
          raise_application_error( -20017, result );
       end;
    end if;
    if v_err = 0 then
       begin
          select a.owner_id into v_id from cpe_resource_mgmt a , cpe_resource_log b
                 where b.id= p_run_id  and b.resource_mgmt_id = a.id ;
       exception
          when others then v_err:=1;
          select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20050;
          raise_application_error( -20050, result );
       end;
       if v_err = 0 then
          begin
             select id into v_temp from cpe_user where id = v_id and is_active = 'Y'
             connect by prior id = parent_id start with id = p_owner ;
          exception
             when others then v_err:=1;
             select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20051;
             raise_application_error( -20051, result );
          end;
       end if;
     end if;
     if v_err = 0 then
        begin
           select a.resource_id into v_temp from cpe_resource_mgmt a, cpe_resource_log b
           where b.id = p_run_id and a.id = b.resource_mgmt_id and a.resource_id = p_resource;
        exception
             when others then v_err:=1;
             select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20052;
             raise_application_error( -20052, result );
        end;
      end if;
      if v_err = 0 then
        begin
           select id  into v_temp from cpe_resource where id= p_resource and is_active ='Y';
        exception
             when others then v_err:=1;
             select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20053;
             raise_application_error( -20053, result );
        end;
      end if;
      if v_err = 0  then
        begin
            select id into v_temp from cpe_resource_log where
                   overall_status not in ('SKIPPED') and resource_mgmt_id IN
                   (select id  from cpe_resource_mgmt
                    where  resource_id = p_resource and profile_id not in (v_pid) ) and id > p_run_id ;
        exception
             when others then v_temp := 0 ;
        end;
        if v_temp > 0 then
             v_err := 1;
             select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20054;
             raise_application_error( -20054, result );
        end if ;
      end if;

      if v_err = 0 then
        begin
           select a.id into v_temp from cpe_profile_member a, cpe_profile b where a.profile_id IN
               (select a.profile_id from cpe_resource_mgmt a, cpe_resource_log b
                where  b.id = p_run_id  and a.id = b.resource_mgmt_id  )
           and a.base_rule_id = p_rule_id and a.is_active = 'Y'
           and b.id = a.profile_id and b.is_active IN  ('Y','I');
        exception
             when others then v_err:=1;
             select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20055;
             raise_application_error( -20055, result );
        end;
      end if;
      if v_err = 0  then
         begin
            select nvl(min(id),0) into v_temp from cpe_resource_log_detail where rule_status > 0
            and resource_log_id IN
                ( select id from cpe_resource_log where resource_mgmt_id IN
                  ( select id from cpe_resource_mgmt where id IN
                    ( select a.id from cpe_resource_mgmt a , cpe_resource_log b
                      where b.id >= p_run_id and b.resource_mgmt_id = a.id
                      and a.resource_id = p_resource )
                  )
                ) and rule_id = p_rule_id;
         exception
             when others then null;
         end;
         if  v_temp > 0 then
             v_err:=1;
             select error_text into result from CPE_SYS_ERROR_MESSAGE where ERROR_NUMBER = -20056;
             raise_application_error( -20056, result );
         end if;
      end if;
      if v_err = 0 then
         insert into cpe_resource_mgmt
            (owner_id,resource_id,profile_id,run_remediate,
             schedule_start_time,schedule_create_time,schedule_end_time,schedule_next_run_time,
             schedule_frequency,change_note)
         values
            ( (select owner_id from cpe_resource where id = p_resource) ,p_resource, v_pid,'Y',
              (sysdate + 1/1440), sysdate, (sysdate + 1/1440),(sysdate + 1/1440), 1,p_run_id)
         returning id into v_id;
         commit;
         insert into cpe_res_mgmt_exception
             (resource_mgmt_id,profile_member_id,override_type,override_created_by,
              override_start_date,override_end_date,update_date)
         values
            ( v_id, p_rule_id,'R',p_owner,(sysdate + 1/1440),(sysdate + 1/1440),(sysdate + 1/1440));
         commit;
       end if;
return result;
end INVOKE_REMEDIATE_BY_RULE;
/
create or replace TRIGGER "CPE_RESOURCE_LOG_DETAIL_TRIG1" before insert on CPE_RESOURCE_LOG_DETAIL for each row
declare
v_xml XMLTYPE;
v_id number(16);v_status varchar2(1024); v_rlog_id number(16);
v_log CLOB;v_count number(4);
v_rule varchar2(1024);v_message varchar2(1024);v_info varchar2(1024);
v_scount number(4); v_fcount number(4);v_health number(9,2);

begin
   select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
   select SYSDATE into :new.CREATE_DATE from dual;
    begin
         select id,resource_log_id  into v_id,v_rlog_id  from cpe_resource_log_detail
         where rule_id = :new.rule_id and resource_log_id =
               (select b.change_note from  cpe_resource_log a, cpe_resource_mgmt b
                where a.id = :new.resource_log_id and b.id = a.resource_mgmt_id );
    exception
         when others then v_id := 0 ;
    end;


    if v_id > 0  then

       select extractValue(:new.log_xml,'/ResourceLogDetail/Info/outcome') into v_status from dual;
       select extractValue(:new.log_xml,'/ResourceLogDetail/Info/rule_number') into v_rule from dual;
       update cpe_resource_log_detail set log_xml =
              UPDATEXML (log_xml,'/ResourceLogDetail/Info/outcome/text()',
                 'Selective Remediation -- ' || v_status )
       where id = v_id;
--  Comment out this , as console log if too large , gives value too large error....
--      will be fixed in next release
--       update cpe_resource_log_detail set log_xml =
--              UPDATEXML (log_xml,'/ResourceLogDetail/Info/rule_console/text()',
--                 chr(10) || '----------' || chr(10)||
--                 'Rule Log generated at '|| to_char(sysdate,'dd-Mon-rrrr hh:mi AM') || ' UTC' || chr(10) ||
--                 ' as part of Selective Remediation by user via UI' ||
--                 chr(10) || '----------' || chr(10) ||
--                 EXTRACTVALUE(:new.log_xml, '/ResourceLogDetail/Info/rule_console')
--             )
--       where id = v_id;

       update cpe_resource_log_detail set log_xml = :new.log_xml, rule_status = :new.rule_status
       where id = v_id;

       select overall_info,overall_health into v_info,v_health from cpe_resource_log where id = v_rlog_id;
       if INSTR(v_info,'Selective') > 0 then
          select replace(v_info,']',', '||v_rule||' ]') into v_message from dual;
       else
          select substr(v_info || ' [ with Selective Remediation for - Rule : '|| v_rule||' ]',1,1023)
                 into v_message from dual;
       end if;
       update cpe_resource_log
              set actual_end_time =  sysdate ,overall_info = v_message
              where id = v_rlog_id;
       if :new.rule_status = 1 then
          select ( extractValue(log_xml,'/ResourceLog/Info/success_rules_count') + 1 ) into v_scount
               from cpe_resource_log where id= v_rlog_id ;     
          update cpe_resource_log set log_xml =
               UPDATEXML (log_xml,'/ResourceLog/Info/success_rules_count/text()', v_scount)
               where id = v_rlog_id;
          select ( extractValue(log_xml,'/ResourceLog/Info/failure_rules_count') - 1 ) into v_fcount
               from cpe_resource_log where id= v_rlog_id ;
          update cpe_resource_log set log_xml =
               UPDATEXML (log_xml,'/ResourceLog/Info/failure_rules_count/text()', v_fcount)
               where id = v_rlog_id;
          if ( ( v_scount + v_fcount) > 0 ) then      
             select  round(cast(( 
               (sum((case rule_status when '1' then 1 when '0' then -1 when '-1' then -1 else 0 end) * rule_weight)) + sum(rule_weight)) 
               / 
               (2 * sum(rule_weight)) * 100 as decimal(8,2))) into v_health
               from cpe_resource_log_detail where resource_log_id = v_rlog_id;
             update cpe_resource_log set overall_health = v_health  where id = v_rlog_id and rule_status != -2;
          end if;    
       end if;
    end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_LOG_DETAIL_TRIG1" ENABLE;
/

create or replace function "CREATE_PROFILE_RUN_DATA" (
P_PROFILE_ID in NUMBER,
P_PM_ID in NUMBER
) return CLOB is
result CLOB;
v_name varchar2 (1024); v_desc varchar2 (1024);v_err number(1);
r_name cpe_rule_header.name%type;
r_rid cpe_rule_header.id%type;
r_cid cpe_rule_header.criticality_id%type;
cursor c1 is select c.name,c.id,  c.criticality_id
       from cpe_profile a, cpe_profile_member b, cpe_rule_header c
       where a.id = p_profile_id and b.profile_id = a.id and c.id = b.base_rule_id
         and a.is_active in ('Y','I') and b.is_active = 'Y' and c.is_active = 'Y';
cursor c2 is select c.name,c.id,  c.criticality_id
       from cpe_res_mgmt_exception b, cpe_rule_header c
       where b.resource_mgmt_id = p_pm_id and c.id = b.profile_member_id
         and  b.is_active = 'Y' and c.is_active = 'Y';
v_action varchar2(16);r_action varchar2(16);
v_rule_by_rule number (16);

begin
    v_err:=0; result:='<ProfileData><Profile></Profile></profileData>' ;
    begin
        select name || profile_type, profile_ref_url into v_name,v_desc
        from cpe_profile where id = p_profile_id  and is_active in ('Y','I');
        exception
        when others then v_err := 1;
    end;
    if v_err = 0  then
       begin
         select decode(run_remediate,'Y','Remediate','Scan') into v_action
         from cpe_resource_mgmt where id = p_pm_id  and is_active = 'Y';
       exception when others then v_err := 1;
       end;
    end if;

    if v_err = 0 then
       result := '<ProfileData > <Profile id="' || p_profile_id || '">' ;
       result := result || '<title>' || v_name || '</title>';
       result := result || '<description>' || v_desc || '</description>';

       OPEN c1;
       LOOP
            FETCH c1 into  r_name, r_rid , r_cid; EXIT WHEN c1%notfound;
            begin
               select decode(override_type,'S','Scan','M','Mark_success','K','Skip','R','Remediate','Scan')
               into r_action from cpe_res_mgmt_exception
               where id =
               ( select max(b.id)
               from  cpe_resource_mgmt a, cpe_res_mgmt_exception b, cpe_profile_member c, cpe_rule_header d
               where a.id = p_pm_id and b.resource_mgmt_id = a.id and c.id = b.profile_member_id
               and d.id = c.base_rule_id  and d.name = r_name             
--               and ( b.override_start_date <= sysdate OR b.override_start_date is null )
               and ( ( to_char(b.override_start_date ,'rrrrmmddhh24mi') <= to_char(sysdate,'rrrrmmddhh24mi') ) OR b.override_start_date is null )             
--               and ( b.override_end_date >= sysdate OR b.override_end_date is null )
               and ( ( to_char(b.override_end_date ,'rrrrmmddhh24mi') >= to_char(sysdate,'rrrrmmddhh24mi') ) OR b.override_end_date is null )               
               and a.is_active = 'Y' and b.is_active = 'Y' and c.is_active = 'Y' and d.is_active = 'Y'
               )
               ;
            exception
               when no_data_found then r_action := v_action;
            end;
            result := result || '<select idref="' || r_name   || '" rule_id="' ||
                       r_rid || '" selected="'    || r_action || '" severity="'||
                       r_cid || '" />';
       END LOOP;
       close c1;

      v_rule_by_rule := 0 ;
      begin
         select max(id) into v_rule_by_rule
                from cpe_profile where name ='Rule-by-rule Force Remediation -- Initiated by User'
                and is_active in ('Y','I');
      exception
         when others then v_rule_by_rule := 0 ;
      end;
      if v_rule_by_rule = p_profile_id then
       OPEN c2;
       LOOP
            FETCH c2 into  r_name, r_rid , r_cid; EXIT WHEN c2%notfound;
            begin
               select decode(b.override_type,'S','Scan','M','Mark_success','K','Skip','R','Remediate','Scan')
               into r_action
               from  cpe_resource_mgmt a, cpe_res_mgmt_exception b
               where a.id = p_pm_id and b.resource_mgmt_id = a.id
               and ( b.override_start_date <= sysdate OR b.override_start_date is null )
               and ( b.override_end_date >= sysdate OR b.override_end_date is null )
               and a.is_active = 'Y' and b.is_active = 'Y'
               ;
            exception
               when no_data_found then r_action := v_action;
            end;
            result := result || '<select idref="' || r_name   || '" rule_id="' ||
                       r_rid || '" selected="'    || r_action || '" severity="'||
                       r_cid || '" />';
       END LOOP;
       close c2;
      end if;


       result := result || '</Profile> </ProfileData>';
    end if;
    return result;
end CREATE_PROFILE_RUN_DATA;
/

create or replace function "CREATE_PROFILE_RUN_MOF" (
P_PROFILE_ID in NUMBER,
P_PM_ID in NUMBER
) return CLOB is
result CLOB;
v_name varchar2 (1024); v_desc varchar2 (1024);v_err number(1);
r_name cpe_rule_header.name%type;
r_rid cpe_rule_header.rule_id%type;
r_mof cpe_rule_header.rule_config%type;
c_mof cpe_rule_header.rule_config%type;
cursor c1 is select c.name,c.rule_id,c.rule_config from cpe_profile a, cpe_profile_member b, cpe_rule_header c
       where a.id = p_profile_id and b.profile_id = a.id and c.id = b.base_rule_id
         and a.is_active in ('Y','I') and b.is_active = 'Y' and c.is_active = 'Y';
cursor c2 is select c.name,c.rule_id,  c.rule_config
       from cpe_res_mgmt_exception b, cpe_rule_header c
       where b.resource_mgmt_id = p_pm_id and c.id = b.profile_member_id
         and  b.is_active = 'Y' and c.is_active = 'Y';
v_action varchar2(16);r_action varchar2(16);
v_rule_by_rule number (16);

begin
    v_err:=0;v_name := 'Profile_name_not_found';
    begin
        select name || profile_type, profile_ref_url into v_name,v_desc
        from cpe_profile where id = p_profile_id  and is_active in ('Y','I');
        exception
        when others then v_err := 1;
    end;

    result:=
'/*
\@TargetNode=' || v_name ||
'
\@GeneratedBy=Darth_Vader
\@GenerationDate=' || to_char(sysdate,'mm/dd/rrrr hh:mi:ss') ||
'
\@GenerationHost=Mustafar,_The_Volcanic_Planet
*/' ;

    if v_err = 0  then
       begin
         select decode(run_remediate,'Y','Remediate','Scan') into v_action from cpe_resource_mgmt where id = p_pm_id  and is_active = 'Y';
       exception when others then v_err := 1;
       end;
    end if;

    if v_err = 0 then
       OPEN c1;
       LOOP
            FETCH c1 into  r_name, r_rid , r_mof ; EXIT WHEN c1%notfound;
            if ( instr(result , r_name ) > 0 ) then
               null;
            else
              begin
               select decode(override_type,'S','Scan','M','Mark_success','K','Skip','R','Remediate','Scan')
               into r_action from cpe_res_mgmt_exception
               where id =
               ( select max(b.id)
               from  cpe_resource_mgmt a, cpe_res_mgmt_exception b, cpe_profile_member c, cpe_rule_header d
               where a.id = p_pm_id and b.resource_mgmt_id = a.id and c.id = b.profile_member_id
               and d.id = c.base_rule_id  and d.name = r_name
--               and ( b.override_start_date <= sysdate OR b.override_start_date is null )
               and ( ( to_char(b.override_start_date ,'rrrrmmddhh24mi') <= to_char(sysdate,'rrrrmmddhh24mi') ) OR b.override_start_date is null )             
--               and ( b.override_end_date >= sysdate OR b.override_end_date is null )
               and ( ( to_char(b.override_end_date ,'rrrrmmddhh24mi') >= to_char(sysdate,'rrrrmmddhh24mi') ) OR b.override_end_date is null )               
               and a.is_active = 'Y' and b.is_active = 'Y' and c.is_active = 'Y' and d.is_active = 'Y'
               )
               ;
              exception
                 when no_data_found then r_action := v_action;
              end;
              c_mof := replace ( r_mof , 'RuleStatus = "Default"' , 'RuleStatus = "' || r_action || '"' );
              result := result || c_mof ;
            end if;
       END LOOP;
       close c1;

     v_rule_by_rule := 0 ;
      begin
         select max(id) into v_rule_by_rule
                from cpe_profile where name ='Rule-by-rule Force Remediation -- Initiated by User'
                and is_active in ('Y','I');
      exception
         when others then v_rule_by_rule := 0 ;
      end;
      if v_rule_by_rule = p_profile_id then
       OPEN c2;
       LOOP
            FETCH c2 into  r_name, r_rid , r_mof; EXIT WHEN c2%notfound;
            begin
               select decode(b.override_type,'S','Scan','M','Mark_success','K','Skip','R','Remediate','Scan')
               into r_action
               from  cpe_resource_mgmt a, cpe_res_mgmt_exception b
               where a.id = p_pm_id and b.resource_mgmt_id = a.id
               and ( b.override_start_date <= sysdate OR b.override_start_date is null )
               and ( b.override_end_date >= sysdate OR b.override_end_date is null )
               and a.is_active = 'Y' and b.is_active = 'Y'
               ;
            exception
               when no_data_found then r_action := v_action;
            end;
            c_mof := replace ( r_mof , 'RuleStatus = "Default"' , 'RuleStatus = "' || r_action || '"' );
            result := result || c_mof ;
       END LOOP;
       close c2;
      end if;


    end if;

    result := result ||
'instance of OMI_ConfigurationDocument
{
Version="1.0.0";
Author="Darth_Vader";
GenerationDate="' || to_char(sysdate,'dd/mm/rrrr hh:mi:ss') || '";
GenerationHost="Mustafar,_The_Volcanic_Planet";
};';
    return result;
end CREATE_PROFILE_RUN_MOF;
/

create or replace FUNCTION RESET_USAGE_DATA
RETURN varchar2 IS
ret_str varchar2(1024);
pragma autonomous_transaction;
cursor c1 is select id,is_active,login_id from cpe_user;
cursor c2 is select id,is_active,owner_id,name from cpe_organization;
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
             where id = v_id;
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

create or replace TRIGGER "CPE_USER_TRIG3"  before insert or update on CPE_USER for each row
DECLARE

v_qr NUMBER(8);      -- quota_resource
v_qrpm NUMBER(8);    -- quota runs per month
v_qcpm NUMBER(10,2);    --- quota cost per month
v_ut number(8);      --- user type
v_put varchar2(2);
v_puid number(16); -- parent user type id
v_uoid number(16); -- parent org
v_user_org_id number(16);
v_dummy number(16);
c_id number(16);c_date timestamp; c_qr NUMBER(8); c_qrpm NUMBER(8); c_qcpm NUMBER(10,2);
v_user_mod number (1); 
v_found number(1);v_parent number(16);v_ptype number(2);v_id number(16);v_active varchar2(1);
v_expiry timestamp;
type c_user_cur is ref cursor; c_user c_user_cur;
cursor c1 is select id,is_active,parent_id ,user_expiry_date from cpe_user 
             where id <> :old.id 
             connect by prior parent_id=id start with id= :old.id ;
pragma autonomous_transaction;

begin

if ( updating ) then 
   if updating ('is_active' ) and :new.is_active = 'Y'  and :old.is_active ='N' then
      open c1;v_found := 0;
      loop
         FETCH c1 into v_id,v_active,v_parent,v_expiry; EXIT WHEN c1%notfound;
         if v_found = 0  then 
            if v_active = 'Y' then
               if v_parent is null then 
                  begin 
                     select priviledge_type into v_ptype from cpe_user_type where id = :old.user_type_id;
                  exception 
                    when others then raise_application_error ( -20001, 'Error : 20001 : Error updating new parent');
                  end;  
                  if v_ptype < 20 and v_ptype > 9 then 
                     select sysdate + 7 into v_expiry from dual;
                  else 
                     raise_application_error ( -20001, 'Error : 20001 : Error : User does not have suitable parent');
                  end if;   
               end if;
               v_found := 1;
               begin
                   select v_id into :new.parent_id from dual;
                   select v_expiry into :new.user_expiry_date from dual;
                exception
                   when others then raise_application_error ( -20001, 'Error : 20001 : Error updating new parent');
                end;
            end if;
         end if;   
      end loop;      
   end if;   
end if;



if updating ('is_active' ) and :new.is_active = 'N' then
   null;
else
   if updating ('quota_resource') OR updating ('quota_runs_per_month') OR updating ('quota_cost_per_month') then
      if updating ('quota_expiry_date') then
         if (:new.quota_expiry_date is not null and :new.quota_expiry_date < sysdate) then
            select sysdate into :new.quota_expiry_date from dual;
         end if;
      else
         if nvl(:old.quota_expiry_date,sysdate+1)  < sysdate then
            :new.quota_runs_per_month := :old.quota_runs_per_month;
            :new.quota_cost_per_month := :old.quota_cost_per_month;
            :new.quota_resource := :old.quota_resource;
            :new.quota_expiry_date := :old.quota_expiry_date;
         end if;
      end if;
    end if;

    begin
      select user_type into v_ut from cpe_user_type where id = :new.user_type_id and is_active = 'Y';
      exception when no_data_found then v_ut := 'xx';
    end;
    IF ( (v_ut <> '00') AND (:new.quota_resource < 0 ) )
       THEN raise_application_error( -20020, 'Error : 20020');
    END IF;

    if :new.parent_id is not null then
       select
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when nvl(quota_expiry_date,sysdate+1) < sysdate then 0
             when quota_resource = -1 then 99999999
             else quota_resource
             end quota_resource
        into v_qr from cpe_user
              where id = :new.parent_id and is_active = 'Y' ;
       select
             case when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
             when quota_expiry_date < sysdate then 0
             when quota_runs_per_month = -1 then 99999999
             else quota_runs_per_month
             end quota_runs_per_month
       into v_qrpm
              from cpe_user where id = :new.parent_id and is_active = 'Y' ;
       select
             case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
             when quota_expiry_date < sysdate then 0
             when quota_cost_per_month = -1 then 99999999
             else quota_cost_per_month
             end quota_cost_per_month
       into v_qcpm
              from cpe_user where id = :new.parent_id and is_active = 'Y' ;
    end if;

    if :new.parent_id is not null then
       IF (:new.quota_resource < 0  OR  :new.quota_resource > v_qr )
          THEN raise_application_error( -20005, 'Error : 20005');
       END IF;
       IF (:new.quota_resource < :new.usage_resource  OR  :new.quota_resource < :old.usage_resource )
          THEN raise_application_error( -20033, 'Error : 20033');
       END IF;
--       IF ( (:new.quota_runs_per_month  > v_qrpm) OR ( :new.quota_runs_per_month < 0 AND v_qrpm < 99999999 )  )
       IF ( ( :new.quota_runs_per_month < 0 AND v_qrpm < 99999999 )  )
         	THEN raise_application_error( -20006, 'Error : 20006');
       END IF;
--       IF ( (:new.quota_cost_per_month  > v_qcpm) OR ( :new.quota_cost_per_month < 0 AND v_qcpm < 99999999 )  )
       IF ( ( :new.quota_cost_per_month < 0 AND v_qcpm < 99999999 )  )
          THEN raise_application_error( -20007, 'Error : 20007' || :new.id);
       END IF;
    end if;

    if :new.parent_id is not null then
    select
          case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
          when nvl(quota_expiry_date,sysdate+1) < sysdate then 0
          when quota_resource = -1 then 99999999
          else quota_resource
          end quota_resource
    into v_qr
          from cpe_organization where id = :new.user_org_id and is_active = 'Y' ;
    select
             case
             when quota_expiry_date < sysdate then 0
             when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
             when quota_runs_per_month = -1 then 99999999
             else quota_runs_per_month
             end quota_runs_per_month
    into v_qrpm
           from cpe_organization where id = :new.user_org_id and is_active = 'Y' ;
    select
             case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
             when quota_expiry_date < sysdate then 0
             when quota_cost_per_month = -1 then 99999999
             else quota_cost_per_month
             end quota_cost_per_month
    into v_qcpm
           from cpe_organization where id = :new.user_org_id and is_active = 'Y' ;
    end if;

    if :new.parent_id is not null then
      if  ( (updating) and :old.is_active = 'N' and :new.is_active = 'Y' ) OR
          ( updating('usage_resource') OR updating('usage_runs') OR updating('usage_cost') )  
      then 
         null;
      else 
       IF (:new.quota_resource < 0  OR  :new.quota_resource > v_qr )
          THEN raise_application_error( -20021, 'Error : 20021' || v_qr );
       END IF;
--       IF ( (:new.quota_runs_per_month  > v_qrpm) OR ( :new.quota_runs_per_month < 0 AND v_qrpm < 99999999 )  )
       IF ( :new.quota_runs_per_month < 0  AND v_qrpm <  99999999  )
         	THEN raise_application_error( -20022, 'Error : 20022' || v_qrpm );
       END IF;
--       IF ( (:new.quota_cost_per_month  > v_qcpm) OR ( :new.quota_cost_per_month < 0 AND v_qcpm < 99999999 )  )
       IF ( ( :new.quota_cost_per_month < 0 AND v_qcpm < 99999999 )  )
          THEN raise_application_error( -20023, 'Error : 20023');
       END IF;
      end if; 
    end if;

    if :new.parent_id is not null then
       select user_type_id into v_puid from cpe_user where id = :new.parent_id and is_active = 'Y' ;
       begin
          select id into v_dummy from CPE_USER_RELATION
                 where parent_id = v_puid   and child_id = :new.user_type_id and is_active = 'Y' ;
          exception when no_data_found  THEN raise_application_error( -20024, 'Error : 20024');
       end;
       begin
          select user_org_id into v_uoid from cpe_user where id = :new.parent_id and is_active = 'Y' ;
          exception when no_data_found  THEN raise_application_error( -20025, 'Error : 20025');
      end;
      IF :new.user_org_id <> v_uoid THEN
         begin
  	       select ID into v_user_org_id FROM CPE_ORGANIZATION
                 where id = :new.user_org_id and is_active = 'Y'
	         connect by prior ID = PARENT_ID start with ID = v_uoid;
  	       exception when no_data_found then raise_application_error( -20026, 'Error : 20026');
         end;
      END IF;
    end if;

    if :new.parent_id is not null OR :old.parent_id is not null then
       if updating ('quota_resource') OR updating ('quota_runs_per_month') OR updating ('quota_cost_per_month') OR
          updating ('quota_expiry_date') then
          open c_user for
                 'select quota_resource,quota_runs_per_month,quota_cost_per_month, quota_expiry_date,id
                  from cpe_user where  is_active = :status and id <> :id1 connect by prior id = parent_id start with id = :id2'
               USING 'Y', :old.id, :old.id;
          loop
            fetch c_user into c_qr,c_qrpm,c_qcpm,c_date,c_id;exit when c_user%notfound;
            v_user_mod:=0;
            if nvl(c_date,sysdate+1) > sysdate then
               if updating ('quota_expiry_date' ) then
                  if ((:new.quota_expiry_date is not null) AND
                     (c_date is null OR  c_date > :new.quota_expiry_date) )
                     then c_date := :new.quota_expiry_date; v_user_mod:=1;end if;
               end if;
               if updating ('quota_resource' ) then
                  if (( :new.quota_resource > -1 ) AND ( c_qr = -1 OR c_qr > :new.quota_resource)
                       AND (nvl(c_date,sysdate+1) > sysdate))
                       then c_qr := :new.quota_resource; v_user_mod:=1;end if;
               end if;
               if updating ('quota_runs_per_month' ) then
                  if ((:new.quota_runs_per_month > -1 ) AND (c_qrpm = -1 OR c_qrpm > :new.quota_runs_per_month)
                      AND (nvl(c_date,sysdate+1) > sysdate))
                      then c_qrpm := :new.quota_runs_per_month; v_user_mod:=1;end if;
               end if;
               if updating ('quota_cost_per_month' ) then
                  if ((:new.quota_cost_per_month > -1) AND (c_qcpm = -1 OR c_qcpm > :new.quota_cost_per_month)
                      AND (nvl(c_date,sysdate+1) > sysdate))
                     then c_qcpm := :new.quota_cost_per_month; v_user_mod:=1;end if;
               end if;
               if v_user_mod > 0 then
                  update cpe_user set
                      quota_resource = c_qr ,quota_runs_per_month = c_qrpm ,
                      quota_cost_per_month = c_qcpm ,quota_expiry_date = c_date
                  where id = c_id;
                  commit;
               end if;
             end if;
          end loop;
          close c_user;
        end if;
      end if;
end if;
end;
/
ALTER TRIGGER "CPE_USER_TRIG3" ENABLE;
/

create or replace TRIGGER "CPE_USER_TRIG4"  after update on CPE_USER for each row
DECLARE
v_self_id number(16); v_parent_id number(16);v_parent_name varchar2(64);v_self_name varchar2(64);v_org_id number(16);
c_id number(16);c_message varchar2(1024);c_name varchar2(1024);c_id2 number(16);
v_auth_id number(16);
type c_cur_cur is ref cursor; c_cur c_cur_cur;
c_guid varchar2(64); v_date timestamp;

pragma autonomous_transaction;
begin

if :new.parent_id = :new.id then
   raise_application_error( -20000, 'Error: User can not be own parent' );
end if;

select nvl(parent_id,-1) into c_id from cpe_user where id = :old.id;
if c_id < 0 then
    null;
else

select nvl(parent_id,-1) into c_id from cpe_user where id = ( select parent_id from cpe_user where id = :old.id );
select id,parent_id,login_id,user_org_id  into v_self_id,v_parent_id,v_self_name,v_org_id from cpe_user where id = :old.id;
select login_id into v_parent_name from cpe_user where id = v_parent_id;

if updating ('is_active') and :new.is_active = 'N' and :old.is_active = 'Y' then
--- this user is not at top of tree
  if c_id > 0 then
--- 1. all my children go to my parent
    open c_cur for
         'select id,login_id from cpe_user where is_active = :status and parent_id = :id ' USING 'Y', v_self_id;
    loop
       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
       update cpe_user set parent_id = v_parent_id where parent_id = v_self_id and is_active = 'Y';
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( v_parent_id ,( select id from cpe_user_message_type where event_type = 12),
               'You inherited user '|| c_name || ' because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
               'User status changed' ,'System Generated Event');
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( c_id ,( select id from cpe_user_message_type where event_type = 12),
               'Your parent changed to  '|| v_parent_name || ' because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
               'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 2. all my profiles go to my parent
    open c_cur for
         'select id,name || profile_type || version
          from cpe_profile where is_active = :status and owner_id = :id ' USING 'Y', v_self_id;
    loop
       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
       begin
         update cpe_profile set owner_id = v_parent_id where owner_id = v_self_id and is_active = 'Y';
       exception
         when others then null;
       end;
       begin
         update cpe_user_profile set granted_by_user_id = v_parent_id,
                change_note = change_note || ' [ because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss') || ' ] '
                where granted_by_user_id = v_self_id and is_active='Y';
       exception
          when others then null;
       end;
       begin
          update cpe_user_profile set permitted_user_id = v_parent_id
                 where permitted_user_id = v_self_id and is_active = 'Y';
       exception
           when others then null;
       end;    
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( v_parent_id ,( select id from cpe_user_message_type where event_type = 12),
               'You inherited profile '|| c_name || ' because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
               'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 3. all my resources and schedules ( resource_mgmt ) go to my parent
    open c_cur for
         'select id,cr_guid from cpe_resource where is_active = :status and owner_id = :id ' USING 'Y', v_self_id;
    loop
       fetch c_cur into c_id,c_guid;exit when c_cur%notfound;
       update cpe_resource set owner_id = v_parent_id ,
              change_note = change_note || ' [ because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss') || ' ] '
              where owner_id = v_self_id and is_active = 'Y' and id = c_id;
       begin
          select schedule_end_time into v_date from cpe_resource_mgmt where
            owner_id = v_self_id and resource_id = c_id and is_active = 'Y';
       exception
          when others then select sysdate into v_date from dual;
       end;
       update cpe_resource_mgmt set owner_id = v_parent_id , ---schedule_end_time = v_date,
              change_note = change_note || ' [ because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss') || ' ] '
              where owner_id = v_self_id and resource_id = c_id and is_active = 'Y';
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( v_parent_id ,( select id from cpe_user_message_type where event_type = 12),
               'You inherited resource '|| c_id2 || ' because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
               'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 4. all my resource type groups go to my parent
    open c_cur for
         'select id,name from cpe_group_resource_type where is_active = :status and owner_id = :id ' USING 'Y', v_self_id;
    loop
       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
       update cpe_group_resource_type  set owner_id = v_parent_id,
              change_note = change_note || ' [ because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss') || ' ] '
              where owner_id = v_self_id and is_active = 'Y';
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( v_parent_id ,( select id from cpe_user_message_type where event_type = 12),
              'You inherited resource type group  '|| c_name || ' because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
              'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 5. all my functional type groups go to my parent
    open c_cur for
         'select id,name from cpe_group_functional_type where is_active = :status and owner_id = :id ' USING 'Y', v_self_id;
    loop
       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
       update cpe_group_functional_type  set owner_id = v_parent_id,
              change_note = change_note || ' [ because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss') || ' ] '
              where owner_id = v_self_id and is_active = 'Y';
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( v_parent_id ,( select id from cpe_user_message_type where event_type = 12),
              'You inherited functional type group  '|| c_name || ' because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
              'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 6. all my Orgs go to my parent
    open c_cur for
         'select id,name from cpe_organization where is_active = :status and owner_id = :id ' USING 'Y', v_self_id;
    loop
       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
       update cpe_organization  set owner_id = v_parent_id
             where owner_id = v_self_id and is_active = 'Y';
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( v_parent_id ,( select id from cpe_user_message_type where event_type = 12),
              'You inherited organization  '|| c_name || ' because old parent ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
              'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
    update cpe_user_preference set is_active= 'N' where user_id = v_self_id;
    commit;
--- 7. now make auth_user inactive for me too
    begin
        select auth_user_id into v_auth_id from cpe_user where id = v_self_id;
        update auth_user set is_active = 0 where id = v_auth_id ;
        commit;
    exception
        when others then null;
    end;
  else
--- my parent parent is null
--- 0. lets take all resources , de-activate and pass on to my parent
    open c_cur for
         'select id,name from cpe_resource where is_active = :res_status
          and owner_id in     
              (select id from cpe_user where is_active = :status  
               connect by prior id = parent_id start with id= :id2)'
          USING 'Y','Y', :old.id  ;
    loop
       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
       update cpe_resource set is_active = 'N', owner_id = :old.parent_id  where id = c_id;
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( (select max(id) from cpe_user where parent_id is null) ,
               ( select id from cpe_user_message_type where event_type = 12),
              'Cloud Raxak lost business from '||
               ( select name from cpe_organization where id=v_org_id )
              || ' and resource named  ' || c_name || ' was assigned to you , made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
              'Resource status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 1. first make all users inactive
    open c_cur for
         'select id,login_id,parent_id from cpe_user where is_active = :status and id <> :id1 connect by prior id = parent_id start with id= :id2 order by 3 desc'
          USING 'Y', :old.id , :old.id ;
    loop
       fetch c_cur into c_id,c_name,c_id2;exit when c_cur%notfound;
       update cpe_user  set is_active = 'N'  where id = c_id;
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( (select max(id) from cpe_user where parent_id is null) ,
               ( select id from cpe_user_message_type where event_type = 12),
              'Cloud Raxak lost business from '||
               ( select name from cpe_organization where id=v_org_id )
              || ' because the owner ' || v_self_name || ' and thus the child ' || c_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
              'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 2. now take care of orgs
--    open c_cur for
--         'select id, name from cpe_organization where is_active = :status and id <> :id1
--          connect by prior id = parent_id start with id= :id2 '
--          USING 'Y', v_org_id, v_org_id ;
--    loop
--       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
--       update cpe_organization set is_active = 'N'  where id = c_id;
--       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
--              values ( (select max(id) from cpe_user where parent_id is null) ,
--               ( select id from cpe_user_message_type where event_type = 12),
--              'Cloud Raxak lost business from '||
--               ( select name from cpe_organization where id=v_org_id )
--              || ' because the owner ' || v_self_name || ' and thus the Org ' || c_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
--              'User status changed' ,'System Generated Event');
--       commit;
--    end loop;
--    close c_cur;
--- 3. now make auth_user inactive for me too
    begin
        select auth_user_id into v_auth_id from cpe_user where id = v_self_id;
        update auth_user set is_active = 0 where id = v_auth_id ;
        commit;
    exception
        when others then null;
    end;
 end if;
end if;
end if;
end;
/
ALTER TRIGGER "CPE_USER_TRIG4" ENABLE;
/

create or replace function invoke_create_org_keys
( p_org_id in number
) return varchar2 is
    request UTL_HTTP.REQ;
    response UTL_HTTP.RESP;
    url varchar2(4000) := 'http://127.0.0.1/generate/keys/' || p_org_id || '/';
begin
    request := UTL_HTTP.BEGIN_REQUEST(url, 'GET');
    UTL_HTTP.SET_HEADER(request, 'User-Agent', 'Mozilla/4.0');
    response := UTL_HTTP.GET_RESPONSE(request);
    return ('called URL');
end ;
/

create or replace function "CREATE_USER" (
P_NAME IN VARCHAR2,
P_AUTH_TYPE IN VARCHAR2,
P_USER_TYPE IN VARCHAR2,
P_ORG IN VARCHAR2,
P_INITIATED_BY IN VARCHAR2,
P_PARENT IN VARCHAR2,
P_QUOTA_RESOURCE IN NUMBER,
P_QUOTA_RUNS IN NUMBER,
P_QUOTA_COST IN NUMBER,
P_EXPIRY IN VARCHAR2,
P_AUTH_ID IN NUMBER,
P_REM_PRIV IN VARCHAR2 default 'N'
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(2560);v_err number(1); v_id number(16);
v_at_id number(16);v_ut_id number(16);v_uo_id number(16); v_ut_ptype number(8);
v_cb_id number(16);v_p_id number(16);v_org_num number(16);
v_qr number(8);v_qruns number(8);v_qcost number(8);v_date date;
v_hack_id number(16);v_hack_org varchar2(64);v_hack_org_id number (16);v_hack_ret varchar2(1024);
l_sql varchar2(123);p_ut_ptype number(8);p_ut_id number(16);
l_c   sys_refcursor;
l_res cpe_user%rowtype;
l_qrpm NUMBER(8); l_qcpm number(8);l_expiry date;
exp_20005 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20005, -20005);
exp_20006 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20006, -20006);
exp_20007 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20007, -20007);
exp_20020 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20020, -20020);
exp_20021 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20021, -20021);
exp_20022 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20022, -20022);
exp_20023 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20023, -20023);
exp_20024 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20024, -20024);
exp_20025 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20025, -20025);
exp_20026 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20026, -20026);
exp_20201 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20201, -20201);
exp_20202 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20202, -20202);
exp_20203 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20203, -20203);
exp_20204 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20204, -20204);
exp_20205 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20205, -20205);
exp_20034 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20034, -20034);

BEGIN
    v_err:=0; result:='SUCCESS: Created User: ' || P_name || ' ,as child of :' || P_parent || ' ,as user type of :' || P_user_type ;
    begin
       select id into v_at_id from cpe_auth_type where auth_type = p_auth_type  and is_active = 'Y' ;
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20014 ;
    end;
    begin
       select id, priviledge_type into v_ut_id,v_ut_ptype from cpe_user_type where user_type = p_user_type  and is_active = 'Y' ;
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20015 ;
    end;
---
    if v_err =0 then
       begin
         select id into v_uo_id from cpe_organization where id = p_org  and is_active = 'Y' ;
       exception
          when too_many_rows then v_err:=1;result:='FAILURE:20003:Provide distinct Org-Name OR Provide Org-ID instead';
          when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20016 ;
       end;
       if v_err =1 then
          BEGIN
            v_org_num := TO_NUMBER(p_org);
          EXCEPTION
            WHEN VALUE_ERROR then v_org_num:=0;v_err:=1;
          end;
          if v_org_num > 0 then
             v_err:=0;
             begin
                select id into v_uo_id from cpe_organization
                where id = v_org_num and is_active = 'Y';
                exception
                when no_data_found then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20016 ;
             end;
          end if;
        end if;
    end if;
---
    begin
       select id, user_type_id into v_cb_id,p_ut_id from cpe_user where login_id = p_initiated_by  and is_active = 'Y' ;
       select priviledge_type into p_ut_ptype from cpe_user_type where id = p_ut_id and is_active = 'Y' ;
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20017 ;
    end;
    begin
       select id into v_p_id from cpe_user where login_id = p_parent  and is_active = 'Y' ;
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20018 ;
    end;
------- Now adding HACK since we dont want to talk about Org.....
    if v_err = 0 and v_ut_ptype = 10 and p_ut_ptype = 10 then
--       begin
--          select nvl(parent_id,0) into v_hack_id from cpe_user where id = v_p_id;
--       exception
--          when others then v_hack_id :=1 ;
--       end;
--
--       if v_hack_id > 0 then
--          begin
--             select nvl(parent_id,0) into v_hack_id from cpe_user
--             where id = ( select nvl(parent_id,0) from cpe_user where id =v_p_id ) ;
--          exception
--            when others then v_hack_id :=1 ;
--          end;
-- --      end if;
--         if v_hack_id = 0 then
            select substr( (to_char(sysdate,'rrrrmmddhhmiss') || '_' || a.name),1,64) into v_hack_org
                  from cpe_organization a, cpe_user b
                  where b.id=v_p_id and a.id=b.user_org_id;
            select create_organization (
                  (Select login_id from cpe_user where id = (select owner_id from CPE_ORGANIZATION where id = v_uo_id)),
                  v_hack_org,
                  p_org,
                  (select quota_resource from cpe_organization where id = v_uo_id ),
                  (select quota_runs_per_month from cpe_organization where id = v_uo_id ),
                  (select quota_cost_per_month from cpe_organization where id = v_uo_id ),
                  (Select login_id from cpe_user where id = (select owner_id from CPE_ORGANIZATION where id = v_uo_id)),
                  (select quota_expiry_date from cpe_organization where id = v_uo_id)
                  )
                  into v_hack_ret
             from dual;
             v_hack_org_id := v_uo_id;
             begin
                select id into v_uo_id from cpe_organization where name = v_hack_org;
             exception
                when others then v_uo_id := 1 ; -- v_hack_org_id;
             end;
-- Job defined to create org keys 
             if v_uo_id > 1 then
                BEGIN 
                 DBMS_SCHEDULER.create_job (
                    job_name        => 'JOB1_' || to_char(sysdate,'rrrrmmddhh24miss') || '_' || v_uo_id ,
                    job_type        => 'PLSQL_BLOCK',
                    job_action      => 'BEGIN
                                          declare api_ret2 CLOB;
                                          begin
                                            select invoke_create_org_keys('||v_uo_id ||') into api_ret2 from dual;
                                          end;
                                        END;',
                    start_date      => SYSTIMESTAMP,
                    repeat_interval => NULL,
                    end_date        => NULL,
                    enabled         => TRUE
                 );
               END;             
             end if;
-- end of job             
--          end if;
--        end if;
    end if;
------- end of HACK
    if v_err = 0 then
       begin
         select a.quota_resource,a.quota_runs_per_month,a.quota_cost_per_month
         into v_qr, v_qruns,v_qcost
         from cpe_organization a, cpe_user b where
         b.id = v_p_id and a.id = b.user_org_id  and a.is_active = 'Y'  and b.is_active = 'Y' ;
       exception when others then v_qr := 0; v_qruns := 0 ;v_qcost :=0;
       end;
    end if;

    if P_QUOTA_RESOURCE is not NULL then v_qr := TO_NUMBER(P_QUOTA_RESOURCE); end if;
    if P_QUOTA_RUNS is not NULL then v_qruns := TO_NUMBER(P_QUOTA_RUNS); end if;
    if P_QUOTA_COST is not NULL then v_qcost := TO_NUMBER(P_QUOTA_COST); end if;


     if P_EXPIRY is not null then
          begin
            select to_date(P_EXPIRY,'dd-Mon-rrrr') into v_date from dual;
            exception when others then null;
          end;
     else
        v_date := sysdate + 60;
     end if;
     if v_ut_ptype > 90 then
       v_date := sysdate + 5;
     end if;

    l_qrpm := v_qruns; l_qcpm := v_qcost;

    if v_err = 0 then
       l_sql := 'select * from cpe_user where is_active = ''Y'' connect by PRIOR parent_id = id start with id = ' || v_p_id  ;
       if P_QUOTA_RUNS < 0 then
          open l_c for l_sql;
          loop
              fetch l_c into l_res; exit when l_c%notfound;
              if l_res.quota_runs_per_month > -1 then l_qrpm := l_res.quota_runs_per_month; exit; end if;
          end loop; close l_c;
       end if;
       if P_QUOTA_COST  < 0 then
          open l_c for l_sql;
          loop
              fetch l_c into l_res; exit when l_c%notfound;
              if l_res.quota_cost_per_month > -1 then l_qcpm := l_res.quota_cost_per_month; exit; end if;
          end loop; close l_c;
        end if;
        open l_c for l_sql;
        loop
          fetch l_c into l_res; exit when l_c%notfound;
          if l_res.USER_EXPIRY_DATE < V_DATE then V_DATE := l_res.USER_EXPIRY_DATE; exit; end if;
        end loop; close l_c;
    END IF;

    if v_err = 0 then
        begin
         insert into cpe_user
              (login_id, AUTH_TYPE_ID,user_type_id,user_org_id,parent_id,created_by,
               user_create_date, user_expiry_date,
               quota_resource,quota_runs_per_month,quota_cost_per_month , auth_user_id, REMEDIATE_PRIVILEDGE )
              values
              (p_name, v_at_id,v_ut_id,v_uo_id,v_p_id,p_initiated_by,
               sysdate,v_date,
               v_qr, l_qrpm , l_qcpm , TO_NUMBER(p_auth_id) , p_rem_priv ) returning id into v_id;
          commit;
          update CPE_ORGANIZATION set owner_id = v_id where name = v_hack_org;
          commit;
          result := v_id || ' : Success';
          exception
          when exp_20005 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20005 ;
          when exp_20006 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20006 ;
          when exp_20007 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20007 ;
          when exp_20020 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20020 ;
          when exp_20021 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20021 ;
          when exp_20022 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20022 ;
          when exp_20023 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20023 ;
          when exp_20024 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20024 ;
          when exp_20025 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20025 ;
          when exp_20026 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20026 ;
          when exp_20201 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20201 ;
          when exp_20202 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20202 ;
          when exp_20203 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20203 ;
          when exp_20204 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20204 ;
          when exp_20205 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20205 ;
          when exp_20034 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20034 ;
          when DUP_VAL_ON_INDEX THEN v_err:=1; result:='Error : Duplicate user name OR auth reference';
          when others then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20001 ;
        end;
      end if;
      if v_err = 0 then
         open l_c for l_sql;
         loop
            fetch l_c into l_res; exit when l_c%notfound;
            insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
            values ( l_res.id , ( select id from cpe_user_message_type where event_type = 2),
               'Hello ' || l_res.login_id || '  :  A New user '|| p_name || ' with parent = ' || p_parent || ' has been added in your org tree', result,p_initiated_by);
            commit;
            if v_qruns <> l_qrpm then
               insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
               values ( l_res.id , ( select id from cpe_user_message_type where event_type = 5),
                 'Hello ' || l_res.login_id || '  :  A New user '|| p_name || ' -- quota runs per month is adjusted to '|| l_qrpm || ' due to org/parent budget', result,p_initiated_by);
               commit;
            end if;
            if v_qcost  <> l_qcpm then
               insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
               values ( l_res.id , ( select id from cpe_user_message_type where event_type = 5),
                 'Hello ' || l_res.login_id || '  :  A New user '|| p_name || ' -- quota cost per month is adjusted to '|| l_qcpm || ' due to org/parent budget', result,p_initiated_by);
               commit;
            end if;
            if  v_date <> to_date(p_expiry,'dd-Mon-rrrr')  then
               insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
               values ( l_res.id , ( select id from cpe_user_message_type where event_type = 5),
                 'Hello ' || l_res.login_id || '  :  A New user '|| p_name || ' -- expiry date is adjusted to '|| to_char(v_date,'dd-Mon-rrrr') || ' due to parent expiry date', result,p_initiated_by);
               commit;
            end if;
         end loop; close l_c;
         insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
         values ( (select id from cpe_user where login_id = p_name )  ,
                  ( select id from cpe_user_message_type where event_type = 7),
                  'Hello ' || p_name || '  :  -- Welcome to Cloud Raxak', NULL ,p_initiated_by);
         commit;
      end if;
  return result;
end CREATE_USER;
/

create or replace TRIGGER "CPE_USER_TRIG1" before insert on CPE_USER for each row
declare
v_date timestamp; v_org number(16);
v_me_ciso number(1); v_other_ciso number(1); 

begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      if :new.remediate_priviledge is null then select 'Y' into :new.remediate_priviledge from dual ; end if;
      select 0,0,0 into :new.usage_resource, :new.usage_runs, :new.usage_cost from dual;
      if :new.quota_resource is null then select 0 into :new.quota_resource from dual;end if;
      if :new.quota_runs_per_month is null then select 0 into :new.quota_runs_per_month from dual;end if;
      if :new.quota_cost_per_month is null then select 0 into :new.quota_cost_per_month from dual;end if;

      if :new.parent_id is not null then
         begin
           select nvl(quota_expiry_date,sysdate+1000)  into v_date from cpe_user
                  where id = :new.parent_id and is_active = 'Y';
           exception when others then raise_application_error( -20000, 'Error: parnet quota expiry date not found' );
         end;
         if nvl(:new.quota_expiry_date,sysdate + 1) > v_date then
            raise_application_error ( -20205, 'Error: Quota expiry date can not exceed parent' );
         end if;
       end if;

       if :new.parent_id is not null then
          begin
            select nvl(parent_id,0) into v_org from cpe_organization where id= :new.user_org_id and is_active='Y';
          exception
            when no_data_found then v_org := 0;
          end;
          if v_org = 0 then
             raise_application_error ( -20204,'Error: User can not belong to internal org');
          end if;
       end if;

 
       begin
          select nvl(parent_id,0) into v_me_ciso from cpe_user where id = :new.parent_id and is_active = 'Y';
       exception
          when others then v_me_ciso :=1;
       end;
       
       begin
          select count(*) into v_other_ciso from cpe_user where user_org_id = :new.user_org_id 
              and parent_id = :new.parent_id;
       exception
          when others then v_other_ciso := 1;
      end;

 -- raise_application_error ( -20005,'Error: Customer here');

      if v_me_ciso = 0 then 
         if v_other_ciso > 0 then 
            raise_application_error ( -20034,'Error: 20034');
         end if;
      end if;   

end;
/
ALTER TRIGGER "CPE_USER_TRIG1" ENABLE;
/

create or replace TRIGGER "CPE_ORGANIZATION_TRIG3"  before insert or update on CPE_ORGANIZATION for each row
DECLARE
v_qr NUMBER(8);      -- quota_resource
v_qrpm NUMBER(8);    -- quota runs per month
v_qcpm NUMBER(10,2);    --- quota cost per month
v_otype varchar2(8);      --- OWNER type
v_expiry timestamp;   --- quota expiry date
v_num1 number(16);
v_var1 number(16);
l_sql varchar2(256);
v_user_mod number(1);
l_c   sys_refcursor;
l_res1 cpe_user%rowtype; l_res2 cpe_organization%rowtype;

pragma autonomous_transaction;
begin

   if :new.parent_id is not null then
        begin
           select nvl(b.priviledge_type,99) into v_num1 from cpe_user a,cpe_user_type b
            where a.id = :new.owner_id and b.id=a.user_type_id;
        exception when others then v_num1 := 99;
        end;
        if v_num1 > 29 then
           RAISE_APPLICATION_ERROR(-20000, 'Error: Owner must be SA or RA');
        end if;
    end if;



    if :new.parent_id is not null then
       if updating ('quota_resource') OR updating ('quota_runs_per_month') OR updating ('quota_cost_per_month') then

          if updating ('quota_expiry_date') then
--             if (:new.quota_expiry_date is null) then
--                select sysdate into :new.quota_expiry_date from dual;
--             end if;
               null;
          else
             if nvl(:old.quota_expiry_date,sysdate+1)  < sysdate then
                :new.quota_runs_per_month := :old.quota_runs_per_month;
                :new.quota_cost_per_month := :old.quota_cost_per_month;
                :new.quota_resource := :old.quota_resource;
                :new.quota_expiry_date := :old.quota_expiry_date;
             end if;
         end if;
      end if;

       begin
         select ID into v_var1 FROM CPE_user where id = :new.owner_id and is_active = 'Y'
         connect by prior ID = PARENT_ID start with ID = (select id from cpe_user where login_id = :new.created_by and is_active = 'Y');
         exception
         when no_data_found then raise_application_error( -20004, 'Error : 20004');
       end;

       select
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when quota_expiry_date < sysdate then 0
             when quota_resource = -1 then 99999999
             else quota_resource
             end quota_resource
       into v_qr
              from cpe_organization where id = :new.parent_id and is_active = 'Y' ;
       select
             case when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
             when quota_expiry_date < sysdate then 0
             when quota_runs_per_month = -1 then 99999999
             else quota_runs_per_month
             end quota_runs_per_month
       into v_qrpm
              from cpe_organization where id = :new.parent_id and is_active = 'Y';
       select
             case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
             when quota_expiry_date < sysdate then 0
             when quota_cost_per_month = -1 then 99999999
             else quota_cost_per_month
             end quota_runs_per_month
       into v_qcpm
              from cpe_organization where id = :new.parent_id and is_active = 'Y';

       select quota_expiry_date into v_expiry
              from cpe_organization where id = :new.parent_id and is_active = 'Y';

       if ( ( v_expiry is null ) OR
            ( (v_expiry is not null) and (:new.quota_expiry_date is not null) and (v_expiry >= :new.quota_expiry_date) )
          )
       then
          null;
       else
          raise_application_error( -20205, 'Error : 20205' || :new.parent_id || '---' || :new.id);
       end if;

       IF (:new.quota_resource < 0  OR  :new.quota_resource > v_qr )
          THEN raise_application_error( -20005, 'Error : 20005' || v_qr);
       END IF;
       IF (  ( :new.quota_runs_per_month < 0 AND v_qrpm < 99999999 ) OR
             ( :new.quota_runs_per_month > v_qrpm )
          )
         	THEN raise_application_error( -20006, 'Error : 20006');
       END IF;
       IF (  ( :new.quota_cost_per_month < 0 AND v_qcpm < 99999999 ) OR
             ( :new.quota_cost_per_month > v_qcpm )
          )
          THEN raise_application_error( -20007, 'Error : 20007' || :new.id);
       END IF;
    end if;

    if :new.created_by is null then select user into :new.created_by from dual ; end if;
    if :new.updated_by is null then select user into :new.updated_by from dual ; end if;


    if :new.parent_id is not null OR :old.parent_id is not null then
       if updating ('quota_resource') OR updating ('quota_runs_per_month') OR updating ('quota_cost_per_month') OR
          updating ('quota_expiry_date') then
          l_sql := 'select * from cpe_organization where id <> ' || :old.id || ' and is_active = ''Y'' connect by PRIOR id = parent_id
                    start with id = ' || :old.id  ;

          open l_c for l_sql;
          loop
               fetch l_c into l_res2; exit when l_c%notfound;
               v_user_mod:=0;
               if updating ('quota_expiry_date' ) then
                  if ((:new.quota_expiry_date is not null) AND
                     (l_res2.quota_expiry_date is null OR  l_res2.quota_expiry_date > :new.quota_expiry_date) )
                     then l_res2.quota_expiry_date := :new.quota_expiry_date;v_user_mod:=1; end if;
               end if;
               if updating ('quota_resource' ) then
                  if (( :new.quota_resource > -1 ) AND ( l_res2.quota_resource = -1 OR l_res2.quota_resource > :new.quota_resource)
                      AND (nvl(l_res2.quota_expiry_date,sysdate+1) > sysdate))
                      then l_res2.quota_resource := :new.quota_resource; v_user_mod:=1;end if;
               end if;
               if updating ('quota_runs_per_month' ) then
                  if ((:new.quota_runs_per_month > -1 ) AND (l_res2.quota_runs_per_month = -1 OR l_res2.quota_runs_per_month > :new.quota_runs_per_month)
                      AND (nvl(l_res2.quota_expiry_date,sysdate+1) > sysdate))
                      then l_res2.quota_runs_per_month := :new.quota_runs_per_month; v_user_mod:=1;end if;
               end if;
               if updating ('quota_cost_per_month' ) then
                  if ((:new.quota_cost_per_month > -1) AND (l_res2.quota_cost_per_month = -1 OR l_res2.quota_cost_per_month > :new.quota_cost_per_month)
                      AND (nvl(l_res2.quota_expiry_date,sysdate+1) > sysdate))
                     then l_res2.quota_cost_per_month := :new.quota_cost_per_month; v_user_mod:=1;end if;
               end if;

             if v_user_mod >0 then
               update cpe_organization set
                  quota_resource = l_res2.quota_resource ,quota_runs_per_month = l_res2.quota_runs_per_month,
                  quota_cost_per_month = l_res2.quota_cost_per_month ,quota_expiry_date = l_res2.quota_expiry_date
                where id = l_res2.id;
                insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
                     values ( l_res2.owner_id, ( select id from cpe_user_message_type where event_type = 6),
                              'Revised Quota due to Parent quota got modified' ,'Consult your manager for more information' ,'System generated event');
             end if;
          end loop;
          close l_c;

          l_sql := 'select * from cpe_user where is_active = ''Y'' and user_org_id
                    IN (select id from cpe_organization connect by PRIOR id = parent_id  start with id = ' || :old.id || ' )' ;
          open l_c for l_sql;
          loop
              fetch l_c into l_res1; exit when l_c%notfound;
              v_user_mod:=0;
               if updating ('quota_expiry_date' ) then
                  if ((:new.quota_expiry_date is not null) AND
                     (l_res1.quota_expiry_date is null OR  l_res1.quota_expiry_date > :new.quota_expiry_date) )
                     then l_res1.quota_expiry_date := :new.quota_expiry_date; v_user_mod:=1;end if;
               end if;
               if updating ('quota_resource' ) then
                  if (( :new.quota_resource > -1 ) AND ( l_res1.quota_resource = -1 OR l_res1.quota_resource > :new.quota_resource)
                      AND (nvl(l_res1.quota_expiry_date,sysdate+1) > sysdate))
                      then l_res1.quota_resource := :new.quota_resource; v_user_mod:=1;end if;
               end if;
               if updating ('quota_runs_per_month' ) then
                  if ((:new.quota_runs_per_month > -1 ) AND (l_res1.quota_runs_per_month = -1 OR l_res1.quota_runs_per_month > :new.quota_runs_per_month)
                      AND (nvl(l_res1.quota_expiry_date,sysdate+1) > sysdate))
                      then l_res1.quota_runs_per_month := :new.quota_runs_per_month; v_user_mod:=1;end if;
               end if;
               if updating ('quota_cost_per_month' ) then
                  if ((:new.quota_cost_per_month > -1) AND (l_res1.quota_cost_per_month = -1 OR l_res1.quota_cost_per_month > :new.quota_cost_per_month)
                      AND (nvl(l_res1.quota_expiry_date,sysdate+1) > sysdate))
                     then l_res1.quota_cost_per_month := :new.quota_cost_per_month;v_user_mod:=1; end if;
               end if;

        if v_user_mod > 0 then
              update cpe_user  set
                  quota_resource = l_res1.quota_resource ,quota_runs_per_month = l_res1.quota_runs_per_month,
                  quota_cost_per_month = l_res1.quota_cost_per_month ,quota_expiry_date = l_res1.quota_expiry_date
              where id = l_res1.id;
              insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
                   values ( l_res1.id, ( select id from cpe_user_message_type where event_type = 6),
                            'Revised Quota due to Parent quota got modified' ,'Consult your manager for more information' ,'System generated event');
         end if;


          end loop;
          close l_c;
          commit;
       end if;
    end if;

end;
/
ALTER TRIGGER "CPE_ORGANIZATION_TRIG3" ENABLE;
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

create or replace TRIGGER "CPE_USER_PROFILE_TRIG2" before update on CPE_USER_PROFILE for each row
DECLARE
v_id number(16); v_login varchar2(1024); v_id2 number(16);
pragma autonomous_transaction;
cursor c1 is select id,login_id from cpe_user where id <> :old.permitted_user_id and is_active='Y'
connect by prior id=parent_id start with id = :old.permitted_user_id order by 1 desc;
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
      if :new.is_active = 'N' then
         open c1;
         loop
            fetch c1 into v_id,v_login; exit when c1%notfound;
         begin
             select id into v_id2 from cpe_user_profile
             where profile_id = :old.profile_id and is_active = 'Y' and permitted_user_id = v_id;
         exception
             when others then v_id2 := 0 ;
         end;
         if v_id2 > 0 then
            update cpe_user_profile set is_active = 'N' where id = v_id2;
            commit;
            insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
            values ( v_id , ( select id from cpe_user_message_type where event_type = 14 and is_active = 'Y'),
                  'Hello ' || v_login || '  :  '||
                  ' Your access to profile '|| (select name from cpe_profile where id= :old.profile_id) ||
                  ' is revoked due to loss of access by parent'
                  ,(select login_id from cpe_user where id = :old.permitted_user_id)
                  );
             commit;
          end if;
          end loop;
          close c1;
      end if;
      insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
            values ( :old.permitted_user_id , ( select id from cpe_user_message_type where event_type = 14 and is_active = 'Y'),
                  'Hello ' ||
                  (select login_id from cpe_user where id = :old.permitted_user_id) || '  :  '||
                  ' Your access to profile '|| (select name from cpe_profile where id= :old.profile_id) ||
                  ' is revoked by parent'
                  ,(select login_id from cpe_user where id = :old.granted_by_user_id)
                  );
      commit;
end;
/
ALTER TRIGGER "CPE_USER_PROFILE_TRIG2" ENABLE;
/

begin
  declare v_id number(16);
  begin
    select id into v_id from cpe_sys_error_message where error_number = 99999;
  exception  
    when too_many_rows then null;
    when no_data_found then 
        INSERT INTO "CPE_SYS_ERROR_MESSAGE" (ERROR_NUMBER, ERROR_TEXT , CREATED_BY )
        VALUES (-20034, 'FAILURE:20034: Customer ORG can have only ONE primary CISO', 'Seed_Data');
        commit;
    when others then null;    
  end;  
end;
/

create or replace function "CREATE_ORGANIZATION" (
P_OWNER in VARCHAR2,
P_NAME IN VARCHAR2,
P_PARENT IN VARCHAR2,
P_QUOTA_RESOURCE IN NUMBER,
P_QUOTA_RUNS IN NUMBER,
P_QUOTA_COST IN NUMBER,
P_INITIATED_BY IN VARCHAR2,
P_EXP IN DATE default sysdate + 365
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
v_owner_id number(16);v_err number(1);v_parent_id number(16);v_id number(16);
v_parent_id_num number(16);
exp_20004 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20004, -20004);
exp_20005 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20005, -20005);
exp_20006 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20006, -20006);
exp_20007 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20007, -20007);
exp_20008 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20008, -20008);
exp_20205 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20205, -20205);

begin

    v_err:=0; result:='SUCCESS: Organization created,  Name: ' || P_NAME || ', Owned by: '|| P_OWNER || ', with Parent Org: '||P_PARENT;
--    begin
--        select id into v_owner_id from cpe_user where login_id = p_initiated_by and is_active = 'Y';
--        exception
--        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20019 ;
--    end;
    begin
        select id into v_owner_id from cpe_user where login_id = p_owner and is_active = 'Y' ;
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20002 ;
    end;
    if v_err = 0 then
       begin
          select id into v_parent_id from cpe_organization
          where name = p_parent and owner_id = v_owner_id and is_active = 'Y';
          exception
          when too_many_rows then v_err:=1;result:='FAILURE:20003:Provide distinct Org-Name OR Provide Org-ID instead';
          when no_data_found then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20003 ;
       end;
       if v_err =1 then
          BEGIN
            v_parent_id_num := TO_NUMBER(p_parent);
          EXCEPTION
            WHEN VALUE_ERROR then v_parent_id_num:=0;v_err:=1;
          end;
          if v_parent_id_num > 0 then
             v_err:=0;
             begin
                select id into v_parent_id from cpe_organization
                where id = v_parent_id_num and owner_id = v_owner_id and is_active = 'Y';
                exception
                when no_data_found then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20003 ;
             end;
          end if;
        end if;
     end if;
     if v_err = 0 then
        begin
          insert into cpe_organization
              (parent_id,name,owner_id,quota_resource,quota_runs_per_month,quota_cost_per_month,created_by,quota_expiry_date)
              values
              (v_parent_id,p_name,v_owner_id,p_quota_resource,p_quota_runs,p_quota_cost,p_initiated_by,p_exp)
              returning id into v_id;
          commit;
          result := v_id || ' : Success';
          exception
          when exp_20004 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20004 ;
          when exp_20005 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20005 ;
          when exp_20006 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20006 ;
          when exp_20007 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20007 ;
          when exp_20008 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20008 ;
          when exp_20205 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20205 ;

          when others then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20001 ;
        end;
      end if;
     if v_err = 0 then
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
        values ( (select id from cpe_user where login_id = p_owner),
            ( select id from cpe_user_message_type where event_type = 1),
        'function create_organization', result,p_initiated_by);
        commit;
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
        values ( (select id from cpe_user where login_id = p_initiated_by),
              ( select id from cpe_user_message_type where event_type = 1 ),
                 'you created using function create_organization for user ' || p_owner , result,p_initiated_by);
        commit;
     end if;
  return result;
end CREATE_ORGANIZATION;
/

BEGIN
  DBMS_XMLSCHEMA.registerSchema(
'http://www.cloudraxak.com/schemas/resource_info.xsd',
'<xs:schema elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
<xs:simpleType name="IPtype">
     <xs:restriction base="xs:string">
         <xs:pattern value="(([2][0-5][0-5])|([0-1][0-9][0-9])|\d{2}|\d{1})\.(([2][0-5][0-5])|([0-1][0-9][0-9])|\d{2}|\d{1})\.(([2][0-5][0-5])|([0-1][0-9][0-9])|\d{2}|\d{1})\.(([2][0-5][0-5])|([0-1][0-9][0-9])|\d{2}|\d{1})"/>
    </xs:restriction>
 </xs:simpleType>
 <xs:simpleType name="URLtype">
      <xs:restriction base="xs:string">
           <xs:pattern value="https?://.+" />
       </xs:restriction>
 </xs:simpleType>
<xs:element name="ResourceInfo">
   <xs:complexType>
     <xs:sequence>
       <xs:element minOccurs="1" maxOccurs="1" name="Info">
         <xs:complexType>
           <xs:sequence>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="os_name"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="os_version"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="os_architecture"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="ssh_port"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="username"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="aws_access_key"/> 
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="aws_secret_key"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="aws_account_number"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="azure_application_id"/> 
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="azure_secret_key"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="azure_subscription_id"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="azure_tenant_id"/>             
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_userid"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_password"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_access_ID"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_access_key"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_version"/>
             <xs:element minOccurs="0" maxOccurs="1" type="IPtype" name="MP_endpoint_ip"/>
             <xs:element minOccurs="0" maxOccurs="1" type="IPtype" name="ip_addr"/>
            <xs:element minOccurs="0" maxOccurs="1" type="IPtype" name="subnetMask"/>
             <xs:element minOccurs="0" maxOccurs="1" type="URLtype" name="MP_endpoint_URL"/>
           </xs:sequence>
         </xs:complexType>
       </xs:element>
     </xs:sequence>
   </xs:complexType>
 </xs:element>
</xs:schema>',
LOCAL => TRUE
);
end;
/


