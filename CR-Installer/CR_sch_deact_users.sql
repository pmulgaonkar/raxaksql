set verify off
create or replace function deactivate_users
return varchar2 is
ret_str varchar2(1024);
pragma autonomous_transaction;
cursor c1 is select login_id from raxak3.cpe_user where login_id != 'raxak@cloudraxak.com';
v_login_id varchar2(64);
cursor c2 is select email from raxak3.auth_user where email != 'raxak@cloudraxak.com';
v_email varchar2(64);
begin
    ret_str := 'Successfully deactivated all Users';
    EXECUTE IMMEDIATE 'alter trigger raxak3.CPE_RESOURCE_TRIG5 disable';
    EXECUTE IMMEDIATE 'alter trigger raxak3.CPE_USER_TRIG4 disable';
    OPEN c1;
    LOOP
        FETCH c1 into v_login_id ; EXIT WHEN c1%notfound;
          update raxak3.cpe_user set is_active = 'N' where login_id = v_login_id;
        commit;
    END LOOP;
    CLOSE c1;
OPEN c2;
    LOOP
        FETCH c2 into v_email ; EXIT WHEN c2%notfound;
          update raxak3.auth_user set is_active = 0 where email = v_email;
        commit;
    END LOOP;
    CLOSE c2;
    EXECUTE IMMEDIATE 'alter trigger raxak3.CPE_RESOURCE_TRIG5 enable';
    EXECUTE IMMEDIATE 'alter trigger raxak3.CPE_USER_TRIG4 enable';
    return ret_str;
end ;
/
begin
dbms_scheduler.drop_job ('CR_SCHED_DEACTIVATE_USERS');
end;
/
begin
dbms_scheduler.create_job (
job_name => 'CR_SCHED_DEACTIVATE_USERS',
job_type => 'PLSQL_BLOCK',
START_DATE => (sysdate + &1 + 10),
repeat_interval => 'FREQ=MINUTELY',
enabled => TRUE,
job_action => '
begin
    declare
        v_str varchar2(2048);
    begin
        v_str := deactivate_users();
    end;
end;',
comments => 'deactivate all users except raxak on expiry date');
end;
/
BEGIN
    DBMS_SCHEDULER.enable(name=>'CR_SCHED_DEACTIVATE_USERS');
END;
/