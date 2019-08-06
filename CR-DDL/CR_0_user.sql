prompt this MUST be run as sys or system
Prompt and also edit user name....I could have passed as param, but left it to you to do so

create user raxak3 identified by raxak3 quota unlimited on USERS;
ALTER USER "RAXAK3" DEFAULT TABLESPACE "USERS" TEMPORARY TABLESPACE "TEMP" ACCOUNT UNLOCK ;
grant CONNECT to raxak3;
grant CREATE SESSION to raxak3;
grant ALTER SESSION to raxak3;
grant CREATE ANY PROCEDURE to raxak3;
grant CREATE ANY SEQUENCE to raxak3;
grant CREATE ANY SYNONYM to raxak3;
grant CREATE ANY TABLE to raxak3;
grant CREATE ANY TRIGGER to raxak3;
grant CREATE ANY VIEW to raxak3;
grant CREATE ANY TYPE to raxak3;
grant CREATE ANY JOB to raxak3;
grant execute on utl_http to raxak3 ;
grant execute on DBMS_NETWORK_ACL_ADMIN to raxak3;

