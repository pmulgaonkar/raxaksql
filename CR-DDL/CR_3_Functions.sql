prompt now create some functions

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

create or replace function "MODIFY_ORG_OWNER"
(
P_OWNER in VARCHAR2,
P_NEW_OWNER in VARCHAR2,
P_NAME IN VARCHAR2,
P_INITIATED_BY IN VARCHAR2
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
v_err number(1);
v_var1 number(16);v_var2 number(16);v_var3 number(16);v_var4 number(16);
v_str varchar2(256);v_dummy number(16);v_org_id_num number(16);
l_sql varchar2(256);
l_c   sys_refcursor;
l_res cpe_user%rowtype; l_res2 cpe_organization%rowtype;
exp_20008 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20008, -20008);
exp_20009 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20009, -20009);
exp_20010 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20010, -20010);
exp_20011 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20011, -20011);
exp_20012 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20012, -20012);
exp_20013 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20013, -20013);

BEGIN
    v_err:=0; result:='SUCCESS: Assigned organization: ' || p_name || ' to new owner: ' || p_new_owner;
    begin
	      select id into v_var1 from cpe_user where login_id = p_initiated_by and is_active = 'Y';
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20019 ;
    end;
    if v_err = 0 then
       begin
         select id ,user_type_id
                    into v_var1,v_var3   from cpe_user where login_id = p_new_owner and is_active = 'Y';
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20002 ;
       end;
    end if;
    if v_err = 0 then
       begin
	 select id
              into v_var2 from cpe_user where login_id = p_owner and is_active = 'Y';
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20003 ;
       end;
    end if;
    if v_err = 0 then
       begin
         select priviledge_type  into v_var4  from cpe_user_type where id = v_var3 and is_active = 'Y';
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20009 ;
       end;
    end if;
   if v_err = 0 then
      if ( v_var4 = 0  OR v_var4 > 29 ) then
          v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20010 ;
      end if;
    end if;
    if v_err = 0 then
       begin
         select owner_id,id into v_var3,v_var4  from cpe_organization where name = p_name and is_active = 'Y';
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20011 ;
       end;
---
       if v_err =1 then
          BEGIN
            v_org_id_num := TO_NUMBER(p_name);   
          EXCEPTION
            WHEN VALUE_ERROR then v_org_id_num:=0;v_err:=1;
          end;          
          if v_org_id_num > 0 then
             v_err:=0;       
             begin
                select owner_id,id into v_var3,v_var4 from cpe_organization
                where id = v_org_id_num and is_active = 'Y';
                exception
                when no_data_found then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20011 ;
             end;       
          end if;
        end if;  
----   
    end if;
    if v_err = 0 then
       if v_var2 <> v_var3 then
          begin
             select id into v_dummy from cpe_user where id = v_var3 and is_active = 'Y'
             connect by prior parent_id = id start with id = v_var3;
             exception when no_data_found then
                 v_err:=1; select error_text  into result from cpe_sys_error_message where error_number = -20012 ;
          end;
      end if;
    end if;
    if v_err = 0 then
       begin
         select ID into v_var2 FROM CPE_user where id = v_var1 and is_active = 'Y'
         connect by prior ID = PARENT_ID start with ID = (select id from cpe_user where login_id = p_owner and is_active = 'Y');
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20013 ;
       end;
    end if;


    if v_err = 0 then
       v_str:=  'update cpe_organization set owner_id =  ' || v_var1  || ' ,updated_by = ''' || p_initiated_by || ''''  ;
       v_str := v_str || '  where id = ' || v_var4 ;
       begin
	       execute immediate v_str;
       	 commit;
       exception
          when exp_20008 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20008 ;
          when exp_20009 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20009 ;
          when exp_20010 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20010 ;
          when exp_20011 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20011 ;
          when exp_20012 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20012 ;
          when exp_20013 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20013 ;
          when others then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20001 ;
       end;
    end if;
    if v_err = 0 then
       l_sql := 'select * from cpe_organization where  is_active = ''Y'' connect by PRIOR parent_id = id start with id = ' || v_var4  ;
       open l_c for l_sql;
       loop
          fetch l_c into l_res2; exit when l_c%notfound;
          if  v_var1 = l_res2.owner_id  then v_var4 := l_res2.id; end if;
       end loop;
       close l_c;
       update cpe_user set user_org_id = v_var4 where id = v_var1;
       commit;
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
       values ( (select id from cpe_user where login_id = p_new_owner), ( select id from cpe_user_message_type where event_type = 3),
         'You inherited new Org', result,p_initiated_by);
       commit;
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
       values ( (select id from cpe_user where login_id = p_owner) ,( select id from cpe_user_message_type where event_type = 3 ),
        'your Org (using function assign_organization) is transferred to user ' || p_new_owner , result,p_initiated_by);
       commit;
    end if;
return result;
end MODIFY_ORG_OWNER;
/

create or replace function "MODIFY_ORG_QUOTA_RESOURCES" 
(
P_OWNER in VARCHAR2,
P_NAME IN VARCHAR2,
P_QUOTA_RESOURCE IN NUMBER,
P_INITIATED_BY IN VARCHAR2
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(1024);
v_err number(16);
v_var1 number(16);v_var2 number(16);v_var3 number(16);v_var4 number(16);
v_str varchar2(256);v_dummy number(8);
v_o_q number(8);v_u_q number(8);v_q_new number(8);
l_sql varchar2(256);        
l_c   sys_refcursor;        
l_res1 cpe_user%rowtype; l_res2 cpe_organization%rowtype; 
exp_20008 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20008, -20008);
exp_20009 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20009, -20009);
exp_20010 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20010, -20010);
exp_20011 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20011, -20011);
exp_20012 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20012, -20012);
exp_20013 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20013, -20013);
BEGIN    
    v_err:=0; result:='SUCCESS: MODIFIED quota resource for organization: ' || p_name ;
    begin
	      select id into v_var1 from cpe_user where login_id = p_initiated_by and is_active = 'Y';
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20019 ;
    end;     
    if v_err = 0 then
       begin
         select id into v_var2 from cpe_user where login_id = p_owner and is_active = 'Y';
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20003 ;
       end; 
    end if;
    if v_err = 0 then
       begin
         select
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when quota_expiry_date < sysdate then 0
             else quota_resource
             end quota_resource
         into v_u_q from cpe_user 
         where id = (select parent_id from cpe_user where login_id = p_owner and is_active = 'Y') and is_active = 'Y';
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20001 ;
       end; 
    end if;
    if v_err = 0 then
       begin
         select owner_id,id,
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when quota_expiry_date < sysdate then 0
             else quota_resource
             end quota_resource
         into v_var3,v_var4,v_o_q   
                from cpe_organization where name = p_name and is_active = 'Y' ;
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20011 ;
       end; 
    end if;
    if v_err = 0 then
       if v_var2 <> v_var3 then 
          begin
             select id into v_dummy from cpe_user where id = v_var3  and is_active = 'Y' 
             connect by prior parent_id = id start with id = v_var3;
             exception when no_data_found then    
                 v_err:=1; select error_text  into result from cpe_sys_error_message where error_number = -20012 ;
          end;       
      end if;    
    end if;
    
    IF (P_quota_resource < 0  OR  P_quota_resource > v_o_q OR  P_quota_resource > v_u_q ) 
            THEN v_err:=1; select error_text  into result from cpe_sys_error_message where error_number = -20005 ;
    END IF; 
        
    if v_err = 0 then 
       v_str:=  'update cpe_organization set quota_resource =  ' ||  P_quota_resource || 
                ' ,updated_by = ''' || p_initiated_by || ''''  ;
       v_str := v_str || '  where id = ' || v_var4 ;
       begin 
      	 execute immediate v_str; 
       	 commit;
       exception
          when exp_20008 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20008 ;
          when exp_20009 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20009 ;
          when exp_20010 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20010 ;
          when exp_20011 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20011 ;
          when exp_20012 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20012 ;
          when exp_20013 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20013 ;
          when others then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20001 ;
       end;
    end if;
    if v_err = 0 then
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
        values ( (select id from cpe_user where login_id = p_initiated_by ), ( select id from cpe_user_message_type where event_type = 6),
         'Revised Quota Resource for ' || P_name , result,p_initiated_by);
        commit; 
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
        values ( (select id from cpe_user where login_id = p_owner) ,( select id from cpe_user_message_type where event_type = 3 ),
        'Quota for your Org ' || p_name || ' is revised by ' || p_initiated_by , result,p_initiated_by);
        commit;
    end if;  
return result;
end MODIFY_ORG_QUOTA_RESOURCES;
/

create or replace function "MODIFY_ORG_QUOTA_COST" 
(
P_OWNER in VARCHAR2,
P_NAME IN VARCHAR2,
P_QUOTA_CPM IN NUMBER,
P_INITIATED_BY IN VARCHAR2
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
v_err number(1);
v_var1 number(16);v_var2 number(16);v_var3 number(16);v_var4 number(16);
v_str varchar2(256);v_dummy number(8);
v_o_q number(8);v_u_q number(8);v_q_new number(8);
l_sql varchar2(256);        
l_c   sys_refcursor;        
l_res1 cpe_user%rowtype; l_res2 cpe_organization%rowtype; 
exp_20008 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20008, -20008);
exp_20009 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20009, -20009);
exp_20010 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20010, -20010);
exp_20011 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20011, -20011);
exp_20012 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20012, -20012);
exp_20013 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20013, -20013);
BEGIN    
    v_err:=0; result:='SUCCESS: MODIFIED quota cost per month for organization: ' || p_name ;
    begin
	      select id into v_var1 from cpe_user where login_id = p_initiated_by  and is_active = 'Y' ;
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20019 ;
    end;     
    if v_err = 0 then
       begin
         select id into v_var2 from cpe_user where login_id = p_owner  and is_active = 'Y' ;
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20003 ;
       end; 
    end if;
    if v_err = 0 then
       begin
         select 
             case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
             when quota_expiry_date < sysdate then 0
             else quota_cost_per_month
             end quota_cost_per_month
         into v_u_q from cpe_user 
         where id = (select parent_id from cpe_user where login_id = p_owner)  and is_active = 'Y' ;
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20001 ;
       end; 
    end if;
    if v_err = 0 then
       begin
         select owner_id,id,
             case when quota_expiry_date is null then decode(quota_cost_per_month,-1,99999999,quota_cost_per_month)
             when quota_expiry_date < sysdate then 0
             else quota_cost_per_month    
             end quota_cost_per_month
         into v_var3,v_var4,v_o_q   
           from cpe_organization where name = p_name  and is_active = 'Y' ;
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20011 ;
       end; 
    end if;
    if v_err = 0 then
       if v_var2 <> v_var3 then 
          begin
             select id into v_dummy from cpe_user where id = v_var3  and is_active = 'Y'  
             connect by prior parent_id = id start with id = v_var3;
             exception when no_data_found then    
                 v_err:=1; select error_text  into result from cpe_sys_error_message where error_number = -20012 ;
          end;       
      end if;    
    end if;
    
    IF ( P_QUOTA_CPM > v_o_q OR  P_QUOTA_CPM > v_u_q ) 
            THEN v_err:=1; select error_text  into result from cpe_sys_error_message where error_number = -20005 ;
    END IF; 
        
    if v_err = 0 then 
       v_str:=  'update cpe_organization set quota_cost_per_month =  ' ||  P_QUOTA_CPM || 
                ' ,updated_by = ''' || p_initiated_by || ''''  ;
       v_str := v_str || '  where id = ' || v_var4 ;
       begin 
      	 execute immediate v_str; 
       	 commit;
       exception
          when exp_20008 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20008 ;
          when exp_20009 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20009 ;
          when exp_20010 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20010 ;
          when exp_20011 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20011 ;
          when exp_20012 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20012 ;
          when exp_20013 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20013 ;
          when others then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20001 ;
       end;
    end if;
    if v_err = 0 then
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
        values ( (select id from cpe_user where login_id = p_initiated_by ), ( select id from cpe_user_message_type where event_type = 6),
         'Revised Quota Cost Per Month for ' || P_name , result,p_initiated_by);
        commit; 
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
        values ( (select id from cpe_user where login_id = p_owner) ,( select id from cpe_user_message_type where event_type = 3 ),
        'Quota Cost Per Month for your Org ' || p_name || ' is revised by ' || p_initiated_by , result,p_initiated_by);
        commit;
    end if;  
return result;
end MODIFY_ORG_QUOTA_COST;
/


create or replace function "MODIFY_ORG_QUOTA_RUNS" 
(
P_OWNER in VARCHAR2,
P_NAME IN VARCHAR2,
P_QUOTA_RPM IN NUMBER,
P_INITIATED_BY IN VARCHAR2
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
v_err number(1);
v_var1 number(16);v_var2 number(16);v_var3 number(16);v_var4 number(16);
v_str varchar2(256);v_dummy number(8);
v_o_q number(8);v_u_q number(8);v_q_new number(8);
l_sql varchar2(256);        
l_c   sys_refcursor;        
l_res1 cpe_user%rowtype; l_res2 cpe_organization%rowtype; 
exp_20008 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20008, -20008);
exp_20009 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20009, -20009);
exp_20010 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20010, -20010);
exp_20011 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20011, -20011);
exp_20012 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20012, -20012);
exp_20013 EXCEPTION; PRAGMA EXCEPTION_INIT(exp_20013, -20013);
BEGIN    
    v_err:=0; result:='SUCCESS: MODIFIED quota RUNS per month for organization: ' || p_name ;
    begin
	      select id into v_var1 from cpe_user where login_id = p_initiated_by  and is_active = 'Y' ;
        exception
        when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20019 ;
    end;     
    if v_err = 0 then
       begin
         select id into v_var2 from cpe_user where login_id = p_owner  and is_active = 'Y' ;
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20003 ;
       end; 
    end if;
    if v_err = 0 then
       begin
         select 
             case when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
             when quota_expiry_date < sysdate then 0
             else quota_runs_per_month
             end quota_runs_per_month
         into v_u_q from cpe_user 
         where id = (select parent_id from cpe_user where login_id = p_owner)  and is_active = 'Y' ;
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20001 ;
       end; 
    end if;
    if v_err = 0 then
       begin
         select owner_id,id,
             case when quota_expiry_date is null then decode(quota_runs_per_month,-1,99999999,quota_runs_per_month)
             when quota_expiry_date < sysdate then 0
             else quota_runs_per_month
             end quota_runs_per_month
         into v_var3,v_var4,v_o_q   
            from cpe_organization where name = p_name  and is_active = 'Y' ;
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20011 ;
       end; 
    end if;
    if v_err = 0 then
       if v_var2 <> v_var3 then 
          begin
             select id into v_dummy from cpe_user where id = v_var3  and is_active = 'Y' 
             connect by prior parent_id = id start with id = v_var3;
             exception when no_data_found then    
                 v_err:=1; select error_text  into result from cpe_sys_error_message where error_number = -20012 ;
          end;       
      end if;    
    end if;
    
    IF ( P_QUOTA_RPM > v_o_q OR  P_QUOTA_RPM > v_u_q ) 
            THEN v_err:=1; select error_text  into result from cpe_sys_error_message where error_number = -20005 ;
    END IF; 
        
    if v_err = 0 then 
       v_str:=  'update cpe_organization set quota_runs_per_month =  ' ||  P_QUOTA_RPM || 
                ' ,updated_by = ''' || p_initiated_by || ''''  ;
       v_str := v_str || '  where id = ' || v_var4 ;
       begin 
      	 execute immediate v_str; 
       	 commit;
       exception
          when exp_20008 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20008 ;
          when exp_20009 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20009 ;
          when exp_20010 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20010 ;
          when exp_20011 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20011 ;
          when exp_20012 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20012 ;
          when exp_20013 then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20013 ;
          when others then v_err:=1;select error_text into result from cpe_sys_error_message where error_number = -20001 ;
       end;
    end if;
    if v_err = 0 then
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
        values ( (select id from cpe_user where login_id = p_initiated_by ), ( select id from cpe_user_message_type where event_type = 6),
         'Revised Quota RUNS Per Month for ' || P_name , result,p_initiated_by);
        commit; 
        insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
        values ( (select id from cpe_user where login_id = p_owner) ,( select id from cpe_user_message_type where event_type = 3 ),
        'Quota RUNS Per Month for your Org ' || p_name || ' is revised by ' || p_initiated_by , result,p_initiated_by);
        commit;
    end if;  
return result;
end MODIFY_ORG_QUOTA_RUNS;
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
P_REM_PRIV IN VARCHAR2 default 'N',
P_RVIEW_TYPE IN VARCHAR2,
P_UVIEW_TYPE IN VARCHAR2
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
               quota_resource,quota_runs_per_month,quota_cost_per_month , auth_user_id, REMEDIATE_PRIVILEDGE, res_view_type, user_view_type)
              values
              (p_name, v_at_id,v_ut_id,v_uo_id,v_p_id,p_initiated_by,
               sysdate,v_date,
               v_qr, l_qrpm , l_qcpm , TO_NUMBER(p_auth_id) , p_rem_priv, p_rview_type, p_uview_type ) returning id into v_id;
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

create or replace function "ADD_PROFILE_DATA" (
P_name IN VARCHAR2,
P_type IN VARCHAR2,
P_res_type IN VARCHAR2,
P_url IN VARCHAR2,
P_date IN VARCHAR2,
P_1 IN VARCHAR2,
P_owner IN NUMBER DEFAULT 0,
P_PARENT IN NUMBER DEFAULT 0,
P_EXP_DATE IN TIMESTAMP DEFAULT NULL
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
v_id number(16);v_err number (1);v_pid number(16); r_profile_id number(16);
v_root_id number(16);
v_pstr varchar2(256);v_date timestamp; v_exp_date timestamp;
type c_psm_cur is ref cursor; c_psm c_psm_cur;
c_rtid number(16); c_rvid number(16);
begin
    v_err :=0;
    if P_owner = 0 then
       begin
         select min(id) into v_root_id from cpe_user where PARENT_ID is null  and is_active = 'Y' ;
       exception
         when others then v_err:=1; result := '-20100 : Error';
       end;
    else
       begin
         select id into v_root_id from cpe_user where id = P_owner  and is_active = 'Y' ;
       exception
         when others then v_err:=1; result := '-20100 : Error';
       end;
    end if;

    begin
      select id into v_pid from cpe_resource_type where level3 = P_res_type  and is_active = 'Y' ;
    exception
      when no_data_found then v_err := 1;result :='-20101 : Error';
      when others then v_err:=1; result := '20102 : Error';
    end;

    if v_err = 0 then
       select sysdate into v_date from dual;
       begin
         select to_date(p_date,'rrrr-mm-dd') into v_date from dual;
       exception
         when others then v_err :=0;
       end;
    end if;
    if v_err = 0 then
       v_pstr :=  '[ ' || p_type || ' ]'; v_id := -1;
       begin
         select id into v_id from cpe_profile
         where name = P_NAME and profile_type = v_pstr and owner_id = v_root_id
                and  ( is_active = 'Y' OR is_active = 'I') ;
       exception
         when no_data_found then v_id := -1; v_err:=0;
         when others then v_err := 1;result := '20104 : Error';
       end;
       if v_err = 0 then 
          begin
             select user_expiry_date into v_exp_date from cpe_user where id=v_root_id ;
          exception
              when others then v_err:=1; result := '-20100 : Error';
          end;    
          if p_exp_date is not null then 
             if p_exp_date > v_exp_date then 
                v_err:=1; result := '-20100 : Error : Profile Expiry can not be more than user expiry date';
             else 
                v_exp_date := p_exp_date;
             end if;
          end if;
       end if;   
       if v_err = 0 AND v_id = -1 then
          begin
             insert into cpe_profile
               (name, profile_type ,profile_ref_url, owner_id, resource_type_id,
                profile_create_date, created_by,profile_expiry_date,parent_profile_id) 
              values
               (p_name, v_pstr, p_url, v_root_id ,v_pid,
                v_date,P_1,v_exp_date,p_parent) 
              returning id into r_profile_id;
             commit;
             result := 'Successfully added Profile : '|| p_name || ' with  ID = ' || r_profile_id || ' Status : Success';
          exception
             when others then v_err:=1;result:='20105 : Error ' ;
          end;
       end if;

       if v_err = 0 and v_id = -1 then

          if P_parent > 0 then 
             open c_psm for 
                  'select resource_type_id,resource_version_id from cpe_profile_support_matrix
                   where profile_id = :pid and is_active = :status ' USING p_parent , 'Y';
             loop
                fetch c_psm into c_rtid,c_rvid  ; exit when c_psm%notfound;
                begin
                   insert into cpe_profile_support_matrix 
                      (profile_id,resource_type_id, resource_version_id) 
                   values
                      (r_profile_id, c_rtid, c_rvid) ;
                   commit;
                exception
                  when others then null;
                end;  
             end loop;
             close c_psm;
          end if;      
       end if;
       if v_err = 0 AND v_id = -1 then
          begin
             insert into cpe_user_profile
               (permitted_user_id, granted_by_user_id, created_by ,granted_date ,expiry_date, profile_id)
             values
               (v_root_id,v_root_id, P_1, sysdate, NULL , r_profile_id ) ;
             commit;
          exception
             when others then v_err:=1;result:='20106 : Error';
          end;
       end if;

    end if;    
return result;
end ADD_PROFILE_DATA;
/

create or replace function "ADD_RULE_DATA" (
P_fname IN VARCHAR2,
P_name IN VARCHAR2,
P_rule_id IN VARCHAR2,
P_FType IN VARCHAR2,
P_1 IN VARCHAR2,
P_2 IN VARCHAR2,
P_3 IN VARCHAR2,
P_6 IN VARCHAR2,
P_7 IN VARCHAR2,
P_PNAME IN VARCHAR2,
P_PTYPE IN VARCHAR2,
P_version IN VARCHAR2,
P_8 IN VARCHAR2,
P_9 IN VARCHAR2,
P_10 IN VARCHAR2
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
v_id number(16);v_err number (1);v_pid number(16);v_ftid number(16);
v_cid number(16);v_weight number(8);v_err1 number(1);
v_pstr varchar2(256);
begin
    v_err :=0; v_err1 := 0; result := 'Successfully added rule '|| P_name || ' as profile member';
    begin
      select id into v_id from CPE_RULE_FUNCTIONAL_GROUP_TYPE where name = P_fname  and is_active = 'Y' ;
    exception
      when no_data_found then v_err := 1;result :=' Rule functional type not found';
      when others then v_err:=1; result := 'unknown error in rule functional type search';
    end;
    if v_err = 0 then
       begin
         select id into v_ftid from CPE_RULE_FUNCTIONAL_GROUP_TYPE where name = P_FType  and is_active = 'Y' ;
       exception
         when no_data_found then v_ftid :=-1;
         when others then v_err:=1; result := 'unknown error in RULE HEADER search';
       end;
    end if;
    if v_ftid = -1 and v_err = 0 then
       begin
         select id into v_ftid from CPE_RULE_FUNCTIONAL_GROUP_TYPE where name = 'default'  and is_active = 'Y' ;
       exception
         when no_data_found then v_err:=1; result:='Rule funcational type not found';
         when others then v_err:=1; result := 'unknown error in RULE HEADER search';
       end;
    end if;
    if v_err = 0 then
       begin
         select id into v_cid from CPE_CRITICALITY_TYPE where UPPER(name) = UPPER(P_1)  and is_active = 'Y' ;
       exception
         when no_data_found then v_ftid :=-1;
         when others then v_err:=1; result := 'unknown error in CRITICALITY TYPE search';
       end;
    end if;
    if v_cid = -1 and v_err = 0 then
       begin
         select id into v_cid from CPE_CRITICALITY_TYPE where UPPER(name) = UPPER('default')  and is_active = 'Y' ;
       exception
         when no_data_found then v_err:=1; result:='Rule Criticality Type not found';
         when others then v_err:=1; result := 'unknown error in RULE Criticality Type search';
       end;
    end if;
    if v_err = 0 then
      begin
      select decode(upper(P_1), 'LOW', 1, 'MEDIUM' ,2 , 'HIGH',3, 'DEFAULT', 1,'CRITICAL',4,'INSANE', 5,  1)
             into v_weight from dual;
      exception
        when others then v_err:=1;result:='somethignwent wrong in calculating weight';
      end;
    end if;
    if v_err = 0 then
       begin
         select id into v_id from cpe_rule_header where name = P_name and rule_id = p_rule_id  and
                fix_text = P_7 and check_text = P_9 and is_active = 'Y' ;
       exception
         when no_data_found then v_id := -1;
         when others then v_err:=1; result := 'unknown error in RULE HEADER search';
       end;
    end if;
    if v_err = 0 AND v_id = -1 then
       begin
         insert into cpe_rule_header
            (name,rule_id,version,created_by, description,title,
            RULE_FUNC_TYPE_ID,criticality_id ,weight,cost_scan,cost_remediate,param_editable,
            fix_id,fix_text,check_id,check_text)
          values
            (P_name,p_rule_id,p_version,P_10,P_3,P_2,
             v_ftid,v_cid,v_weight,0.1 , 0.5,'N',P_6 ,P_7,P_8,P_9) returning ID into v_id;
          commit;
         exception
              when others then rollback; v_err:=1; result := 'Error in creating rule header';
         end;
    end if;
    if v_err = 0 then
       begin
         select id into v_id from cpe_rule_header where name = P_name and rule_id = p_rule_id
                   and fix_text = P_7 and check_text = P_9 and is_active = 'Y' ;
       exception
         when no_data_found then v_err1 := 1; result:='rule header not found - ';
         when others then v_err1 := 1; result := 'unknown error in RULE HEADER search';
       end;
       if v_err1 = 0 then
          v_pstr :=  '[ ' || p_ptype || ' ]';
          begin
             select max(id) into v_Pid from cpe_profile
             where name = p_pname and profile_type = v_pstr and owner_id = (select min(id) from cpe_user where PARENT_ID is null)
                    and is_active = 'I' ;
          exception
             when no_data_found then  v_err1 := 1;result:='profile not found ' || p_pname || ' -- ' || v_pstr;
             when others then v_err1 := 1;result := 'root user not found';
          end;
       end if;
       if v_err1 = 0 then
          begin
             select id into v_err1 from cpe_profile_member
             where profile_id = v_pid and base_rule_id = v_id  and is_active = 'Y' ;
          exception
             when no_data_found then  v_err1 := 0;
             when others then v_err1 := 0;
          end;
       end if;
       if v_err1 = 0  then
          begin
             insert into cpe_profile_MEMBER
               (profile_id,base_rule_id, criticality_id,weight,created_by, parent_profile_id)
               values
               (v_pid, v_id, v_cid,v_weight,'profile-rule upload process',
                (select id from cpe_profile where name = 'ENTRY POINT SEEDED PROFILE'));
             commit;
          exception
             when others then v_err:=1;result:='Error in creating profile member';
          end;
       end if;
    end if;
return result;
end ADD_RULE_DATA;
/

create or replace view "CPE_PROFILE_BY_TYPE_V" as
select 'Profile by resource type'  as col1, 
1 as id, null as parent_id,0 as p_url
from dual
union
select level1 || '--' || level2 || '--' || level3 as col1 , id as id , 1 as parent_id,0 as p_url
from cpe_resource_type
where id in (select resource_type_id from cpe_profile)  and is_active = 'Y' 
union
select distinct(a.name)  as col1 , (select max(id)*10000 from cpe_profile where name = a.name) as id,  
        b.id as parent_id,0 as p_url from cpe_profile a, cpe_resource_type b where b.id = a.resource_type_id
        and a.is_active = 'Y'  and b.is_active = 'Y'   
union
select '[ ID: '||a.id||'] '|| a.name || '--' || a.profile_type || ' [ profile dated '|| to_char(profile_create_date,'dd-Mon-rrrr') || ' ]' as col1,
a.id as id, 
(select max(id)*10000 from cpe_profile where name = a.name) as parent_id,
a.id as p_url
from cpe_profile a where is_active = 'Y' ;
/

create or replace view "CPE_PROFILE_BY_AUTHOR_V" as
select 'Profile by Author -- "created-by" '  as col1,
1 as id, null as parent_id,0 as p_url
from dual
union  
select distinct(created_by) as col1 , id as id , 1 as parent_id,0 as p_url
from cpe_profile where id in ( select max(id) from cpe_profile group by created_by) 
union
select distinct(a.name)  as col1 , (select max(id)*10000 from cpe_profile where name = a.name) as id,
       (select max(id) from cpe_profile where created_by = a.created_by group by created_by ) as parent_id,
        0 as p_url from cpe_profile a
union
select '[ ID: '||a.id||'] '|| a.name || '--' || a.profile_type || ' [ profile dated '|| to_char(profile_create_date,'dd-Mon-rrrr') || ' ]' as col1,
a.id as id,
(select max(id)*10000 from cpe_profile where name = a.name and id <> a.id ) as parent_id,
a.id as p_url
from cpe_profile a ; 
/

CREATE OR REPLACE FORCE VIEW "RAXAK3"."CPE_PRINT_PROFILE_DATA_V" ("ID", "NAME", "URL", "RULE", "TITLE", "SEV", "RULE_DESC") AS 
  select a.id ID ,a.name NAME ,a.profile_ref_url URL ,c.name RULE , 
replace (replace (c.title,chr(13),''),chr(10),'')  TITLE , 
replace(d.name,'null',NULL)  SEV ,
case instr(c.description,'<VulnDiscussion>',1,1) 
     when 0 then replace(c.description,chr(10),'') 
     else 
         replace(
             replace (
                 replace(substr(c.description, 1,instr(c.description,'</VulnDiscussion>',1,1)-1),'<VulnDiscussion>','')
                     , chr(10),''),
             chr(13),'')        
END RULE_DESC
from cpe_profile a, cpe_profile_member b, cpe_rule_header c, CPE_CRITICALITY_TYPE d
where a.is_active='Y'
and b.profile_id = a.id and b.is_active='Y'
and c.id = b.base_rule_id and c.is_active='Y'
and d.id=b.criticality_id
--and rownum < 3
;
/

CREATE OR REPLACE FORCE VIEW "RAXAK3"."CPE_RESOURCE_PROFILE_DETAILS_V" ("ID", "RESOURCE_ID", "RESOURCE_NAME", "STATUS", "HEALTH", "PROFILE_ID", "PROFILE_NAME", "APPLY_TIME", "LOG_ID", "OWNER_ID", "RESOURCE_MGMT_ID", "IS_ACTIVE") AS 
  select  a.id, a.id resource_id, a.name  resource_name , decode(a.is_active,'Y','Active','In-active') Status ,
    (case nvl(b.overall_health,-1) when -1 then ' Last Run Unsuccessful' 
    else cast(lpad(round(b.overall_health),3,0) as varchar(7)) end) health ,
    c.id Profile_id ,c.name Profile_name ,
    b.actual_end_time apply_time, b.ID log_id , A.owner_id owner_id , d.id resource_mgmt_id,a.is_active is_active
from cpe_resource a , cpe_resource_log b,cpe_profile c, cpe_resource_mgmt d 
WHERE 
     d.resource_id(+) = a.id 
and b.resource_mgmt_id = d.id 
and b.id = (select max(id) from cpe_resource_log where resource_mgmt_id = d.id )
and d.id IN 
( select ID from ( select ID,profile_id,resource_id,
                   row_number() over (partition by resource_id,profile_id order by profile_id,id ASC) R
                   from cpe_resource_mgmt where profile_id NOT IN 
                   (SELECT ID FROM cpe_profile WHERE NAME ='Rule-by-rule Force Remediation -- Initiated by User')
                 ) --where R = 1 
)
and c.id = d.profile_id;
/


create or replace function verify_profile_run
(
P_resource in NUMBER
) return number is
result number(16,0);
c_id number(16,0);r_id number(16,0);
cursor c1 is 
       select distinct id from cpe_resource_mgmt 
       where resource_id = p_resource 
       and profile_id NOT IN 
           (SELECT ID FROM cpe_profile WHERE NAME ='Rule-by-rule Force Remediation -- Initiated by User');      
begin
    result:=p_resource ; 
    OPEN c1;
    LOOP
        FETCH c1 into c_id; EXIT WHEN c1%notfound;
        begin
            select id into r_id from cpe_resource_log where resource_mgmt_id = c_id;
            result := 0;
        exception
            when others then null;
        end;    
     end loop;
     close c1;
return result;
end verify_profile_run ;
/


CREATE OR REPLACE FORCE VIEW "RAXAK3"."CPE_RESOURCE_HEALTH_V" ("ID", "RESOURCE_ID", "RESOURCE_NAME", "RESOURCE_STATUS", "HEALTH",
"OS_NAME","OS_VERSION","OS_ARCHITECTURE","USERNAME","IP_ADDR","SUCCESS_COUNT","FAILED_COUNT","SKIPPED_COUNT","TOTAL_COUNT",
"PROFILE_ID", "PROFILE_NAME", "APPLY_TIME", "LOG_ID", "OVERALL_INFO", "RESOURCE_MGMT_ID",
"OWNER", "OWNER_LOGIN", "ORGID", "ORGNAME", "IS_ACTIVE", "RESOURCE_TYPE", "RESOURCE_VERSION", 
"CREATE_DATE", "STATUS", "STATUS_DATE", "UPDATE_DATE", "UPDATED_BY" ,"UPDATED_USER") AS 
SELECT  r.id, r.id resource_id, r.name  resource_name, decode(r.is_active,'Y','Active','In-active') Resource_Status,
    'No Profile Applied as yet' health, ri.*, 0 success_count, 0 failed_count, 0 skipped_count, 0 total_count,
    NULL Profile_id, NULL Profile_name, NULL apply_time, NULL log_id, NULL overall_info, NULL resource_mgmt_id,
    r.owner_id owner, u.login_id owner_login, u.user_org_id orgid, o.name orgname, r.is_active is_active,
    t.level3 resource_type, v.resource_version resource_version, r.create_date, r.Status, r.status_date,
    r.update_date, r.updated_by, s.login_id updated_user
FROM cpe_resource r, cpe_user u, cpe_organization o, cpe_resource_type t,
     cpe_resource_version v, cpe_user s,
     XMLTABLE('/ResourceInfo/Info' PASSING r.resource_info
      COLUMNS
          os_name PATH 'os_name',
          os_version PATH 'os_version',
          os_architecture PATH 'os_architecture',
          username PATH 'username',
          ip_addr PATH 'ip_addr') ri
WHERE not exists (select null from cpe_resource_mgmt m where m.resource_id = r.id) and u.id = r.owner_id and o.id = u.user_org_id and t.id = r.resource_type_id and v.id = r.resource_version_id and s.id = r.updated_by
UNION ALL
select  r.id, r.id resource_id, r.name  resource_name, decode(r.is_active,'Y','Active','In-active') Resource_Status,
    (case nvl(l.overall_health,-1) when -1 then
        ( case l.overall_status when 'FAILED' then 'Last Run Unsuccessful'
                                when 'COMPLETE' then 'Last Run Unsuccessful'
                                when 'ABORTED' then 'Last Run Unsuccessful'
                                when 'SKIPPED' then 'Last Run Unsuccessful'
                                else 'Profile Run In-Progress'
          end
        )
    else cast(lpad(round(l.overall_health),3,0) as varchar(7))  end) health, ri.*, 0 success_count, 0 failed_count, 0 skipped_count, 0 total_count,
    p.id Profile_id, p.name Profile_name, l.actual_end_time apply_time, l.ID log_id, l.overall_info overall_info, m.id resource_mgmt_id,
    r.owner_id owner, u.login_id owner_login, u.user_org_id orgid, o.name orgname, r.is_active is_active,
    t.level3 resource_type, v.resource_version resource_version, r.create_date, r.Status, r.status_date,
    r.update_date, r.updated_by, s.login_id updated_user
from cpe_resource r, cpe_resource_log l, cpe_profile p, cpe_resource_mgmt m, cpe_user u, cpe_organization o, cpe_resource_type t,
     cpe_resource_version v, cpe_user s,
     XMLTABLE('/ResourceInfo/Info' PASSING r.resource_info
      COLUMNS
          os_name PATH 'os_name',
          os_version PATH 'os_version',
          os_architecture PATH 'os_architecture',
          username PATH 'username',
          ip_addr PATH 'ip_addr') ri
WHERE
     m.resource_id = r.id
and l.resource_mgmt_id = m.id
and l.log_xml is Null
and l.id = (select max(id) from cpe_resource_log
            where resource_mgmt_id IN
            (  (select ID from cpe_resource_mgmt where resource_id = r.id
            and profile_id NOT IN
             (SELECT ID FROM cpe_profile WHERE NAME ='Rule-by-rule Force Remediation -- Initiated by User')))
            )
and p.id = m.profile_id and u.id = r.owner_id and o.id = u.user_org_id and t.id = r.resource_type_id and v.id = r.resource_version_id and s.id = r.updated_by
UNION ALL
select  r.id, r.id resource_id, r.name  resource_name, decode(r.is_active,'Y','Active','In-active') Resource_Status,
    (case nvl(l.overall_health,-1) when -1 then
        ( case l.overall_status when 'FAILED' then 'Last Run Unsuccessful'
                                when 'COMPLETE' then 'Last Run Unsuccessful'
                                when 'ABORTED' then 'Last Run Unsuccessful'
                                when 'SKIPPED' then 'Last Run Unsuccessful'
                                else 'Profile Run In-Progress'
          end
        )
    else cast(lpad(round(l.overall_health),3,0) as varchar(7))  end) health, ri.*, rs.*,
    p.id Profile_id, p.name Profile_name, l.actual_end_time apply_time, l.ID log_id, l.overall_info overall_info, m.id resource_mgmt_id,
    r.owner_id owner, u.login_id owner_login, u.user_org_id orgid, o.name orgname, r.is_active is_active,
    t.level3 resource_type, v.resource_version resource_version, r.create_date, r.Status, r.status_date,
    r.update_date, r.updated_by, s.login_id updated_user
from cpe_resource r, cpe_resource_log l, cpe_profile p, cpe_resource_mgmt m, cpe_user u, cpe_organization o, cpe_resource_type t,
     cpe_resource_version v, cpe_user s,
     XMLTABLE('/ResourceInfo/Info' PASSING r.resource_info
      COLUMNS
          os_name PATH 'os_name',
          os_version PATH 'os_version',
          os_architecture PATH 'os_architecture',
          username PATH 'username',
          ip_addr PATH 'ip_addr') ri,
     XMLTABLE ('/ResourceLog/Info' PASSING l.log_xml
      COLUMNS 
          success_count NUMBER PATH 'success_rules_count',
          failed_count NUMBER PATH 'failure_rules_count',
          skipped_count NUMBER PATH 'skipped_rules_count',
          total_count NUMBER PATH 'total_rules') rs
WHERE
     m.resource_id = r.id
and l.resource_mgmt_id = m.id
and l.id = (select max(id) from cpe_resource_log
            where resource_mgmt_id IN
            (  (select ID from cpe_resource_mgmt where resource_id = r.id
            and profile_id NOT IN
             (SELECT ID FROM cpe_profile WHERE NAME ='Rule-by-rule Force Remediation -- Initiated by User')))
            )
and p.id = m.profile_id and u.id = r.owner_id and o.id = u.user_org_id and t.id = r.resource_type_id and v.id = r.resource_version_id and s.id = r.updated_by
UNION ALL
select  r.id, r.id resource_id, r.name  resource_name, decode(r.is_active,'Y','Active','In-active') Resource_Status, 
   'Profile Applied but Not Run as yet' health, ri.*, 0 success_count, 0 failed_count, 0 skipped_count, 0 total_count,
    p.id Profile_id, p.name Profile_name, NULL apply_time, NULL log_id, NULL overall_info, m.id resource_mgmt_id,
    r.owner_id owner, u.login_id owner_login, u.user_org_id orgid, o.name orgname, r.is_active is_active,
    t.level3 resource_type, v.resource_version resource_version, r.create_date, r.Status, r.status_date, 
    r.update_date, r.updated_by, s.login_id updated_user
from cpe_resource r, cpe_profile p, cpe_resource_mgmt m, cpe_user u, cpe_organization o, cpe_resource_type t,
     cpe_resource_version v, cpe_user s,
     XMLTABLE('/ResourceInfo/Info' PASSING r.resource_info
      COLUMNS
          os_name PATH 'os_name',
          os_version PATH 'os_version',
          os_architecture PATH 'os_architecture',
          username PATH 'username',
          ip_addr PATH 'ip_addr') ri
where
    m.resource_id = r.id
and r.id = verify_profile_run(r.id)
and m.id NOT IN ( select distinct resource_mgmt_id from cpe_resource_log)
and m.id = (select max(ID) from cpe_resource_mgmt where resource_id = r.id
            and profile_id NOT IN
            (SELECT ID FROM cpe_profile WHERE NAME ='Rule-by-rule Force Remediation -- Initiated by User'))
and p.id = m.profile_id and u.id = r.owner_id and o.id = u.user_org_id and t.id = r.resource_type_id and v.id = r.resource_version_id and s.id = r.updated_by;
/

create or replace view cpe_resource_profile_report_v AS
select  a.id, a.id resource_id, a.name  resource_name , decode(a.is_active,'Y','Active','In-active') Status ,
    (case nvl(b.overall_health,-1) when -1 then ' Last Run Unsuccessful' 
    else cast(lpad(round(b.overall_health),3,0) as varchar(7)) end) health ,
    c.id Profile_id ,c.name Profile_name ,
    b.actual_end_time apply_time, b.ID log_id , A.owner_id owner_id , d.id resource_mgmt_id,a.is_active is_active
from cpe_resource a , cpe_resource_log b,cpe_profile c, cpe_resource_mgmt d 
WHERE 
     d.resource_id(+) = a.id 
and b.resource_mgmt_id = d.id 
and b.id = (select max(id) from cpe_resource_log where resource_mgmt_id = d.id )
and d.id IN 
( select ID from ( select ID,profile_id,resource_id,
                   row_number() over (partition by resource_id,profile_id order by profile_id,id ASC) R
                   from cpe_resource_mgmt where profile_id NOT IN 
                   (SELECT ID FROM cpe_profile WHERE NAME ='Rule-by-rule Force Remediation -- Initiated by User')
                 ) where R = 1 
)
and c.id = d.profile_id;
/

CREATE OR REPLACE PACKAGE PROFILE_DIFF AS
    TYPE diff_record IS RECORD(
       id1 number, pid1 number, str1 VARCHAR2(2048), 
       p1 NUMBER, p2 NUMBER);
    TYPE diff_table IS TABLE OF diff_record ;
    FUNCTION GET_DATA(p1 NUMBER, p2 number)
        RETURN diff_table PIPELINED;
END;
/

create or replace PACKAGE BODY PROFILE_DIFF AS
FUNCTION GET_DATA(p1 number,p2 number)
  RETURN diff_table PIPELINED IS
  BEGIN
        declare
         r_id cpe_rule_header.id%type;
         r_name cpe_rule_header.name%type;
         r_rule_id cpe_rule_header.rule_id%type;
         r_title cpe_rule_header.title%type;
         cursor c1 is select c.id,c.name,c.rule_id,c.title from cpe_profile a, cpe_profile_member b, cpe_rule_header c
                       where a.id = p1 and b.profile_id = a.id and c.id = b.base_rule_id and b.is_active = 'Y';
         cursor c2 is select c.id,c.name,c.rule_id,c.title from cpe_profile a, cpe_profile_member b, cpe_rule_header c
                       where a.id = p2 and b.profile_id = a.id and c.id = b.base_rule_id and b.is_active = 'Y';
        rec  diff_record;
        rec_num number;
        recs_diff diff_table;
        v_id number;
        v_3 number;v_4 number;v_5 number;v_6 number;
    begin
        rec_num :=0;v_3:=0;v_4:=0;v_5:=0;v_6:=0;
        SELECT rec_num , null,'Profile Diff Result' , null,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);
        SELECT rec_num, 0, 'Profile 1 : '|| (select name || profile_type from cpe_profile where id = p1) ||
               ' .... Total rules : ' || (select count(*) from cpe_profile_member where profile_id = p1 and is_active = 'Y')
               ,null,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);
        SELECT rec_num, 0, 'Profile 2 : '|| (select name || profile_type from cpe_profile where id = p2) ||
               ' .... Total rules : ' || (select count(*) from cpe_profile_member where profile_id = p2 and is_active = 'Y')
               ,null,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);
        rec_num:=7;

        OPEN c1;
        LOOP
            FETCH c1 into r_id, r_name, r_rule_id, r_title ; EXIT WHEN c1%notfound;v_id:=-1;
            begin
              select c.id into v_id from cpe_profile a, cpe_profile_member b, cpe_rule_header c
              where a.id = p2 and b.profile_id = a.id and c.id = b.base_rule_id and c.id = r_id and b.is_active = 'Y';
            exception
              when others then null;
            end;
            if v_id > -1 then
               SELECT rec_num ,3,r_name||' ['||r_title ||' ]', r_id,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);v_3:=v_3+1;
            end if;
            if v_id = -1 then
               begin
                 select c.id into v_id from cpe_profile a, cpe_profile_member b, cpe_rule_header c
                 where a.id = p2 and b.profile_id = a.id and c.id = b.base_rule_id and c.name = r_name and b.is_active = 'Y';
               exception
                 when no_data_found then
                      SELECT rec_num ,5,r_name||' ['||r_title ||' ]', r_id,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);v_5:=v_5+1;
                 when others then null;
               end;
               if v_id > -1 then
                  SELECT rec_num ,4,r_name , r_id, v_id INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);v_4:=v_4+1;
               end if;
            end if;
        END LOOP;
        CLOSE c1;

        OPEN c2;
        LOOP
            FETCH c2 into r_id, r_name, r_rule_id,r_title; EXIT WHEN c2%notfound;v_id:=-1;
            begin
              select c.id into v_id from cpe_profile a, cpe_profile_member b, cpe_rule_header c
              where a.id = p1 and b.profile_id = a.id and c.id = b.base_rule_id and c.id = r_id and b.is_active = 'Y';
            exception
              when others then null;
            end;
            if v_id = -1 then
               begin
                 select c.id into v_id from cpe_profile a, cpe_profile_member b, cpe_rule_header c
                 where a.id = p1 and b.profile_id = a.id and c.id = b.base_rule_id and c.name = r_name and b.is_active = 'Y';
               exception
                 when no_data_found then
                      SELECT rec_num ,6,r_name||' ['||r_title||' ]', null, r_id  INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);v_6:=v_6+1;
                 when others then null;
               end;
            end if;
        END LOOP;
        CLOSE c2;

        SELECT 3 ,0,v_3||'...Rules common to both profiles' , null,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);
        SELECT 4 ,0,v_4||'...Base Rule common to both profiles BUT of different version (rule_id)' , null,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);
        SELECT 5 ,0,v_5||'...Rules only appearing in Profile 1' , null,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);
        SELECT 6 ,0,v_6||'...Rules only appearing in Profile 2' , null,null INTO rec FROM DUAL; rec_num := rec_num +1;PIPE ROW (rec);

    END ;
  END get_data;
end;
/

create or replace function "CREATE_PROFILE_INFO" (
P_ID in NUMBER
) return VARCHAR2 is
--PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(2048);
v_name varchar2 (1024); v_count number; v_err number;

begin
    v_err:=0; result:='<ProfileInfo><Info></Info></ProfileInfo>' ;
    begin
        select name || profile_type into v_name from cpe_profile where id = p_id ;
        exception
        when no_data_found then v_err := 1;
    end;

    if v_err = 0 then
       result := '<ProfileInfo > <Info Name="' || v_name || '">' ;
       select count(*) into v_count from cpe_profile_member where profile_id = p_id  and is_active in ('Y','I') ;
       result := result || '<total_rules>' || v_count || '</total_rules>';
       select nvl(sum(b.cost_scan),0) into v_count from cpe_profile_member a, cpe_rule_header b
              where a.profile_id = p_id and b.id = a.base_rule_id  and a.is_active = 'Y'  and b.is_active = 'Y' ;
       result := result || '<cost_to_scan>' || v_count || '</cost_to_scan>';
       select nvl(sum(b.cost_remediate),0) into v_count from cpe_profile_member a, cpe_rule_header b
              where a.profile_id = p_id and b.id = a.base_rule_id  and a.is_active = 'Y'  and b.is_active = 'Y' ;
       result := result || '<cost_to_remediate>' || v_count || '</cost_to_remediate>';
       select count(*) into v_count from cpe_profile_member a, cpe_rule_header b, cpe_criticality_type c
              where a.profile_id = p_id and b.id = a.base_rule_id and c.id = b.criticality_id and lower(c.name) = 'low'
               and a.is_active = 'Y'  and b.is_active = 'Y'  and c.is_active = 'Y' ;
       if v_count > 0 then  result := result || '<rule_low>' || v_count || '</rule_low>'; end if;
       select count(*) into v_count from cpe_profile_member a, cpe_rule_header b, cpe_criticality_type c
              where a.profile_id = p_id and b.id = a.base_rule_id and c.id = b.criticality_id and lower(c.name) = 'medium'
               and a.is_active = 'Y'  and b.is_active = 'Y'  and c.is_active = 'Y' ;
       if v_count > 0 then result := result || '<rule_medium>' || v_count || '</rule_medium>'; end if;
       select count(*) into v_count from cpe_profile_member a, cpe_rule_header b, cpe_criticality_type c
              where a.profile_id = p_id and b.id = a.base_rule_id and c.id = b.criticality_id and lower(c.name) = 'high'
               and a.is_active = 'Y'  and b.is_active = 'Y'  and c.is_active = 'Y' ;
       if v_count > 0 then result := result || '<rule_high>' || v_count || '</rule_high>'; end if;
       select count(*) into v_count from cpe_profile_member a, cpe_rule_header b, cpe_criticality_type c
              where a.profile_id = p_id and b.id = a.base_rule_id and c.id = b.criticality_id and lower(c.name) = 'critical'
               and a.is_active = 'Y'  and b.is_active = 'Y'  and c.is_active = 'Y' ;
       if v_count > 0  then result := result || '<rule_critical>' || v_count || '</rule_critical>'; end if;
       select count(*) into v_count from cpe_profile_member a, cpe_rule_header b, cpe_criticality_type c
              where a.profile_id = p_id and b.id = a.base_rule_id and c.id = b.criticality_id and lower(c.name) = 'insane'
               and a.is_active = 'Y'  and b.is_active = 'Y'  and c.is_active = 'Y' ;
       if v_count > 0  then result := result || '<rule_insane>' || v_count || '</rule_insane>'; end if;
       select count(*) into v_count from cpe_profile_member a, cpe_rule_header b, cpe_criticality_type c
              where a.profile_id = p_id and b.id = a.base_rule_id and c.id = b.criticality_id and lower(c.name) = 'default'
               and a.is_active = 'Y'  and b.is_active = 'Y'  and c.is_active = 'Y' ;
       if v_count > 0 then result := result || '<rule_default>' || v_count || '</rule_default>'; end if;
       select nvl(sum(b.weight),0) into v_count from cpe_profile_member a, cpe_rule_header b
              where a.profile_id = p_id and b.id = a.base_rule_id
               and a.is_active = 'Y'  and b.is_active = 'Y'   ;
       result := result || '<weight>' || v_count || '</weight>';
       result := result || '</Info> </ProfileInfo>';
    end if;
    return result;
end CREATE_PROFILE_INFO;
/
create or replace function "CREATE_PROFILE_DATA" (
P_ID in NUMBER
) return CLOB is
result CLOB;
v_name varchar2 (1024); v_desc varchar2 (1024);
v_count number; v_err number;
r_name cpe_rule_header.name%type;
r_rid cpe_rule_header.rule_id%type;
cursor c1 is select c.name,c.rule_id from cpe_profile a, cpe_profile_member b, cpe_rule_header c
       where a.id = p_id and b.profile_id = a.id and c.id = b.base_rule_id
        and a.is_active in ('Y','I') and b.is_active = 'Y' and c.is_active = 'Y';
begin
    v_err:=0; result:='<ProfileData><Profile></Profile></ProfileData>' ;
    begin
        select name || profile_type, profile_ref_url into v_name,v_desc from cpe_profile where id = p_id ;
        exception
        when no_data_found then v_err := 1;
    end;

    if v_err = 0 then
       result := '<ProfileData > <Profile id="' || p_id || '">' ;
       result := result || '<title>' || v_name || '</title>';
       result := result || '<description>' || v_desc || '</description>';

       OPEN c1;
       LOOP
            FETCH c1 into  r_name, r_rid; EXIT WHEN c1%notfound;
            result := result || '<select idref="' || r_name || '" rule_id="' || r_rid || '" selected="true" />';
       END LOOP;
       close c1;
       result := result || '</Profile> </ProfileData>';
    end if;
    return result;
end CREATE_PROFILE_DATA;
/

create or replace function "CREATE_PROFILE_MOF" (
P_ID in NUMBER
) return CLOB is
result CLOB;
v_name varchar2 (1024); v_desc varchar2 (1024);
v_count number; v_err number;
r_mof cpe_rule_header.rule_config%type;
cursor c1 is select c.rule_config from cpe_profile a, cpe_profile_member b, cpe_rule_header c
       where a.id = p_id and b.profile_id = a.id and c.id = b.base_rule_id
        and a.is_active = 'Y' and b.is_active = 'Y' and c.is_active = 'Y';
begin
    begin 
       select name||profile_type into v_name from cpe_profile where id = p_id;
    exception 
       when others then v_name := 'Profile_name_not_found';
    end;
    result:=
'/*
\@TargetNode=' || v_name || 
'
\@GeneratedBy=Darth_Vader
\@GenerationDate=03/15/2017 12:34:56
\@GenerationHost=Mustafar,_The_Volcanic_Planet
*/' ;

    OPEN c1;
    LOOP
         FETCH c1 into  r_mof; EXIT WHEN c1%notfound;
         result := result || r_mof ;
    END LOOP;
    close c1;
    result := result || 
'instance of OMI_ConfigurationDocument
{
 Version="1.0.0";
 Author="Darth_Vader";
 GenerationDate="03/15/2017 12:34:56";
 GenerationHost="Mustafar,_The_Volcanic_Planet";
};';
    return result;
end CREATE_PROFILE_MOF;
/

create or replace TRIGGER "CPE_PROFILE_TRIG3" after update on CPE_PROFILE for each row
DECLARE
v_id number(16);
pragma autonomous_transaction;
begin
      if (:new.is_active in ('Y','I') and :old.is_active <> 'Y' ) THEN
           begin
             select id into v_id from cpe_profile_info where profile_id = :old.id;
           exception 
             when no_data_found then v_id := 0;
           end;  
           if v_id = 0 then          
              begin
                insert into cpe_profile_info (profile_id,PROFILE_INFO, profile_data, profile_mof)
                values ( :old.id , xmltype(create_profile_info(:old.id)) , xmltype(create_profile_data(:old.id)) , 
                          create_profile_mof(:old.id)  );
                commit;
              exception
                 when others then raise_application_error( -20000, 'Error : 20000' || :old.id );
              end;
           else
             begin
                update cpe_profile_info 
                set PROFILE_INFO=xmltype(create_profile_info(:old.id)) , 
                    profile_data = xmltype(create_profile_data(:old.id)) ,
                    profile_mof = create_profile_mof(:old.id) 
                where id = v_id;
                commit;
              exception
                 when others then raise_application_error( -20000, 'Error : 20000' || :old.id );                
             end;
           end if;
      end if;
end;
/
ALTER TRIGGER "CPE_PROFILE_TRIG3" ENABLE;
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

create or replace function "REPLACE_PROFILE"
(
P_OLD in NUMBER,
P_NEW in NUMBER,
P_INITIATED_BY IN NUMBER
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
v_err number(1);
v_old_name varchar2(1024); v_new_name varchar2(1024);
v_old_owner number(16); v_new_owner number (16);
v_old_rt number(16); v_new_rt number(16);
v_new_id number(16); v_old_id number(16);
v_id number(16); v_name varchar2(64); v_up_id number(16);
l_sql varchar2(1024); l_c   sys_refcursor;
l_res  cpe_user_profile%rowtype;
l_res2 cpe_resource_mgmt%rowtype;

begin

    v_err:=0; result:='SUCCESS: profile :' || p_old || ' is replaced with profile : ' || p_new ;
    if v_err = 0 then
      begin
         select id into v_id from cpe_user where id = p_initiated_by and is_active = 'Y';
         exception
         when no_data_found then v_err:=1; select error_text into result from cpe_sys_error_message where error_number = -20019 ;
       end;
    end if;
    if v_err = 0 then
       begin
           select name,id,resource_type_id  into v_old_name,v_old_owner ,v_old_rt
              from cpe_profile where id = p_old and is_active = 'Y';
           exception
           when no_data_found then v_err:=1;
           raise_application_error( -20000, 'Error : 20000 : OLD profile not found or not active' || p_old );
       end;
    end if;
    if v_err = 0 then
       begin
           select name,id,resource_type_id into v_new_name,v_new_id,v_new_rt
              from cpe_profile where id = p_new and is_active = 'Y';
           exception
           when no_data_found then v_err:=1;
           raise_application_error( -20000, 'Error : 20000 : NEW profile not found or not active' || p_new );
       end;
    end if;
    if v_err = 0 then
       begin
           select count(*) into v_id from cpe_user where id=v_old_id connect by prior id=parent_id start with id = p_initiated_by;
           exception
           when no_data_found then v_err:=1;
           raise_application_error( -20000, 'Error : 20000 : you do not have rights for OLD profile ' || p_old );
       end;
    end if;
    if v_err = 0 then
       begin
           select count(*) into v_id from cpe_user where id=v_new_id connect by prior id=parent_id start with id = p_initiated_by;
           exception
           when no_data_found then v_err:=1;
           raise_application_error( -20000, 'Error : 20000 : you do not have rights for NEW profile ' || p_new );
       end;
    end if;
    if v_err = 0 then
       if v_old_rt <> v_new_rt then
           v_err:=1;
           raise_application_error( -20000, 'Error : 20000 : Both profiles must of same resource type'  );
       end if;
    end if;
   if v_err = 0 then
       l_sql := 'select * from cpe_user_profile where  is_active = ''Y''
                 and profile_id  = ' || p_old  ;
       open l_c for l_sql;
       loop
          fetch l_c into l_res; exit when l_c%notfound;
          
          v_up_id := 0 ;
          begin
             select max(id) into v_up_id from cpe_user_profile
             where profile_id = p_new and is_active = 'Y' and permitted_user_id = l_res.permitted_user_id;
          exception
            when others then v_up_id := 0 ;
          end;          
          if v_up_id = 0 then 
             insert into cpe_user_profile
               (profile_id,permitted_user_id,granted_by_user_id,expiry_date,change_note,created_by)
             values
               ( p_new, l_res.permitted_user_id, p_initiated_by,l_res.expiry_date,
                 'Assigned new profile '||v_new_name|| ' as part of REPLACE profile action, old profile was '||v_old_name, v_name);
             commit;
             insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
             values ( l_res.permitted_user_id,
                     ( select id from cpe_user_message_type where event_type = 14),
                     'You inherited new profile '|| v_new_name || ' as part of REPLACE profile', result,p_initiated_by);
             commit;
           end if;  
       end loop;
       close l_c;
    end if;

    if v_err = 0 then
       l_sql := 'select * from cpe_resource_mgmt where is_active = ''Y''
                 and profile_id  = ' || p_old  || ' and schedule_end_time > sysdate ';
       open l_c for l_sql;
       loop
          fetch l_c into l_res2; exit when l_c%notfound;
          update cpe_resource_mgmt
          set profile_id = p_new, change_note = change_note || ' [ profile changed to new due to REPLACE profile action ] '
          where id = l_res2.id;
          commit;
          insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
          values (  l_res2.owner_id,
                   ( select id from cpe_user_message_type where event_type = 14),
                   'Your resource ' ||
                    (select name from cpe_resource where id=l_res2.resource_id) ||
                   ' is inow applied with new profile ' || v_new_name || ' as part of REPLACE profile action', result,p_initiated_by);
          commit;
       end loop;
       close l_c;
    end if;

   if v_err = 0 then
       l_sql := 'select * from cpe_user_profile where  is_active = ''Y''
                 and profile_id  = ' || p_old  ;
       open l_c for l_sql;
       loop
          fetch l_c into l_res; exit when l_c%notfound;
          update cpe_user_profile set is_active='N' where id=l_res.id;
          commit;
          insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
          values ( l_res.permitted_user_id,
                   ( select id from cpe_user_message_type where event_type = 14),
                   'Your access to profile '|| v_old_name|| ' is revoked as part of REPLACE profile', result,p_initiated_by);
          commit;
       end loop;
       close l_c;
    end if;


    if v_err = 0 then
       update cpe_profile set is_active='N' where id = p_old;
       commit;
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
       values ( l_res.permitted_user_id,
                ( select id from cpe_user_message_type where event_type = 14),
                'Your profile '|| v_old_name|| ' is de-activated as part of REPLACE profile', result,p_initiated_by);
       commit;
    end if;

return result;
end REPLACE_PROFILE;
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

CREATE OR REPLACE FORCE VIEW "RAXAK3"."CPE_RESOURCE_COMPLIANCE" ("ID", "RESOURCE_ID", "RESOURCE_NAME", "IP_ADDR", "RESOURCE_STATUS", "HEALTH", 
        "PROFILE_NAME","COMPLIANCE_MODE", "COMPLIANCE_SCHEDULED_BY", "COMPLIANCE_STATUS", "COMPLIANCE_INFO", "COMPLIANCE_START_TIME", "COMPLIANCE_END_TIME",
        "SUCCESS_COUNT", "FAILED_COUNT", "MANUAL_COUNT", "SKIPPED_COUNT", "TOTAL_COUNT", "OWNER_ID", "OWNER_LOGIN", "ORGNAME", "RESOURCE_TYPE", "RESOURCE_VERSION", "ACCESS_STATUS", "STATUS_DATE") AS 
select  r.id, r.id resource_id, r.name  resource_name, ri."IP_ADDR", decode(r.is_active,'Y','Active','In-active') Resource_Status,
    (case nvl(l.overall_health,-1) when -1 then
        ( case l.overall_status when 'FAILED' then 'Last Run Unsuccessful'
                                when 'COMPLETE' then 'Last Run Unsuccessful'
                                when 'ABORTED' then 'Last Run Unsuccessful'
                                when 'SKIPPED' then 'Last Run Unsuccessful'
                                else 'Profile Run In-Progress'
          end
        )
    else cast(lpad(round(l.overall_health),3,0) as varchar(7))  end) health, 
    p.name Profile_name, decode(m.run_remediate,'N','Scan','Remediate') compliance_mode, m.created_by compliance_scheduled_by, l.overall_status compliance_status, l.overall_info compliance_info,
    l.actual_start_time compliance_start_time, l.actual_end_time compliance_end_time,
    rs."SUCCESS_COUNT",rs."FAILED_COUNT",rs."MANUAL_COUNT",rs."SKIPPED_COUNT",rs."TOTAL_COUNT",
    u.id owner_id, u.login_id owner_login, o.name orgname,
    t.level3 resource_type, v.resource_version resource_version, r.Status acces_status, r.status_date    
from cpe_resource r, cpe_resource_log l, cpe_profile p, cpe_resource_mgmt m, cpe_user u, cpe_organization o, cpe_resource_type t,
     cpe_resource_version v, cpe_user s,
     XMLTABLE('/ResourceInfo/Info' PASSING r.resource_info
      COLUMNS
          os_name PATH 'os_name',
          os_version PATH 'os_version',
          os_architecture PATH 'os_architecture',
          username PATH 'username',
          ip_addr PATH 'ip_addr') ri,
     XMLTABLE ('/ResourceLog/Info' PASSING l.log_xml
      COLUMNS
          success_count NUMBER PATH 'success_rules_count',
          failed_count NUMBER PATH 'failure_rules_count',
          manual_count NUMBER PATH 'manual_rules_count',
          skipped_count NUMBER PATH 'skipped_rules_count',
          total_count NUMBER PATH 'total_rules') rs
WHERE
     m.resource_id = r.id
and l.resource_mgmt_id = m.id
and l.id in (select id from cpe_resource_log
            where resource_mgmt_id IN
            (  (select ID from cpe_resource_mgmt where resource_id = r.id
            and profile_id NOT IN
             (SELECT ID FROM cpe_profile WHERE NAME ='Rule-by-rule Force Remediation -- Initiated by User')))
            )
and p.id = m.profile_id and u.id = r.owner_id and o.id = u.user_org_id and t.id = r.resource_type_id and v.id = r.resource_version_id and s.id = r.updated_by
/
PROMPT all done with functionas, procedures, view.
PROMPT Good bye. 