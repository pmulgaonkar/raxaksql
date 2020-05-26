create or replace TRIGGER "ACCESSATTEMPT_TRIG0" AFTER INSERT on DEFENDER_ACCESSATTEMPT FOR EACH ROW
DECLARE
user_id number(16); org_id number(16); usage_type varchar2(64); event_type varchar2(256); event_trigger varchar2(256); user_type_id number(16);
BEGIN
	SELECT id,user_org_id,user_view_type,user_type_id INTO user_id,org_id,usage_type,user_type_id  FROM CPE_USER cu WHERE LOGIN_ID=:NEW.USERNAME;

	IF (:NEW.login_valid = 1) THEN
		event_type := 'Successful login attempt';
		event_trigger := 'Successful login attempt by ' || :NEW.USERNAME ;
	ELSE
		event_type := 'Failed login attempt';
		event_trigger := 'Failed login attempt by ' || :NEW.USERNAME ;
	END IF;
	insert into cpe_usage_log ( user_id, org_id, usage_type, event_type, event_trigger, event_value, mon_rrrr, created_by, CREATE_DATE,USER_TYPE_ID)
          values (user_id, org_id, usage_type, event_type, event_trigger, :NEW.login_valid, (select to_char(sysdate,'Mon-rrrr') from dual), :NEW.USERNAME, (select SYSDATE from dual),user_type_id) ;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
			insert into cpe_usage_log (event_type, event_trigger, event_value, mon_rrrr, created_by, CREATE_DATE )
          	values ('Unknown User', 'Some unknown user tried logging as ' ||:NEW.USERNAME, :NEW.login_valid, (select to_char(sysdate,'Mon-rrrr') from dual), :NEW.USERNAME, (select SYSDATE from dual)) ;
END;

/
ALTER TRIGGER "ACCESSATTEMPT_TRIG0" ENABLE;
/
