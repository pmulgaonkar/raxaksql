set verify off
update cpe_user set auth_user_id = 1 where parent_id is null;
commit;
ALTER TABLE CPE_USER ADD CONSTRAINT CPE_USER_FK_5 FOREIGN KEY ( AUTH_USER_ID ) REFERENCES AUTH_USER ( ID ) ON DELETE CASCADE ;

ALTER TABLE CPE_USER disable CONSTRAINT CPE_USER_FK_1 ;
ALTER TABLE CPE_USER disable CONSTRAINT CPE_USER_FK_2 ;
ALTER TABLE CPE_USER disable CONSTRAINT CPE_USER_FK_3 ;
ALTER TABLE CPE_USER disable CONSTRAINT CPE_USER_FK_4 ;
ALTER TRIGGER CPE_USER_TRIG1 DISABLE;
ALTER TRIGGER CPE_USER_TRIG3 DISABLE;
ALTER TRIGGER CPE_USER_TRIG4 DISABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG3 DISABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG4 DISABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG5 DISABLE;
ALTER TABLE CPE_ORGANIZATION disable CONSTRAINT CPE_ORGANIZATION_FK_1 ;

create or replace TRIGGER CPE_USER_TEMP_TRIG1 before INSERT ON CPE_USER for each row
begin
    select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
    select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER CPE_USER_TEMP_TRIG1 ENABLE;
/
-- Updating Quota cost/runs per month and Quota expiry date for Raxak account
UPDATE CPE_USER SET QUOTA_RESOURCE = &4, QUOTA_COST_PER_MONTH = 500000, QUOTA_RUNS_PER_MONTH = 500000, QUOTA_EXPIRY_DATE = (sysdate + &2 + 20), USER_VIEW_TYPE ='All_Org', RES_VIEW_TYPE = 'All_Org';
-- Creating custom User
INSERT INTO CPE_USER ( LOGIN_ID,AUTH_TYPE_ID,USER_TYPE_ID,
                       PARENT_ID,CREATED_BY,USER_CREATE_DATE,USER_EXPIRY_DATE,
                       QUOTA_RESOURCE,QUOTA_COST_PER_MONTH,QUOTA_RUNS_PER_MONTH,QUOTA_EXPIRY_DATE,USAGE_RESOURCE,USAGE_RUNS,USAGE_COST,
                       REMEDIATE_PRIVILEDGE,IS_ACTIVE,AUTH_USER_ID,USER_VIEW_TYPE,RES_VIEW_TYPE)
VALUES ('&1',(SELECT ID FROM CPE_AUTH_TYPE WHERE NAME='Local Authentication'),(SELECT ID FROM CPE_USER_TYPE WHERE user_type = '00' ),
        (SELECT MIN(ID) FROM CPE_USER),'raxak@cloudraxak.com',sysdate,(sysdate + &2 + 10),
        &4,500000,500000,(sysdate + &2 + 10),0,0,0,
        'Y','Y',(SELECT ID FROM AUTH_USER WHERE USERNAME = '&1'),'All_Org','All_Org' );
-- Updating Quota cost/runs per month and Quota expiry date for Cloud Org
UPDATE CPE_ORGANIZATION SET QUOTA_EXPIRY_DATE = (sysdate + &2 + 20), QUOTA_RESOURCE = &4, QUOTA_RUNS_PER_MONTH = 500000, QUOTA_COST_PER_MONTH = 500000;
-- Creating custom Org
INSERT INTO CPE_ORGANIZATION (NAME,OWNER_ID,PARENT_ID,CREATED_BY,QUOTA_RESOURCE,QUOTA_RUNS_PER_MONTH,QUOTA_COST_PER_MONTH,QUOTA_EXPIRY_DATE,USAGE_RESOURCE,USAGE_RUNS,USAGE_COST)
VALUES ('&3', (SELECT ID FROM CPE_USER WHERE LOGIN_ID = '&1'), (SELECT ID FROM CPE_ORGANIZATION),'&1', &4,500000,500000, (sysdate + &2 + 10), 0,0,0 );
-- Setting access for specific profiles for custom Users
INSERT INTO CPE_USER_PROFILE (PERMITTED_USER_ID, GRANTED_BY_USER_ID, CREATED_BY ,GRANTED_DATE ,EXPIRY_DATE, PROFILE_ID ,IS_ACTIVE)
    SELECT (SELECT id from CPE_USER where login_id = '&1'),(SELECT id from CPE_USER where login_id = 'raxak@cloudraxak.com'),'Profile by Cloud Raxak',sysdate, (sysdate + &2 + 10), id ,'Y' from cpe_profile
            where name in ('CIS Microsoft Windows Server 2012 R2','Microsoft Windows Server 2012 R2 DISA-MissionCriticalClassified_2012','Microsoft Windows Server 2012 R2 PCI-DSS_2012',
                           'Microsoft Windows Server 2008 R2 DISA-MissionCriticalClassified_2008','Microsoft Windows Server 2008 R2 PCI-DSS_2008',
                           'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
                           '[debian-based Linux] DISA - Mission Critical Classified (Subset)', '[debian-based Linux] DISA - Mission Critical Classified (Full)',
                           '[debian-based Linux] PCI-DSS Compliance (Full)','[debian-based Linux] CIS Profile - Ubuntu 18.04 (Subset)',
                           '[rpm-based Linux] DISA - Mission Critical Classified (Full)','[rpm-based Linux] DISA - Mission Critical Classified (Subset)','[rpm-based Linux] PCI-DSS Compliance (Full)',
                           '[rpm-based Linux] CIS Profile (Subset)','[debian-based Linux] CIS Profile (Subset)',
                           'Microsoft Windows Server 2008 R2 Master Profile','Microsoft Windows Server 2012 R2 Master Profile',
                           '[debian-based Linux] Master Profile','[rpm-based Linux] Master Profile');
-- Updating custom user Org ID - ID of custom Org
UPDATE CPE_USER SET USER_ORG_ID = ( SELECT ID FROM CPE_ORGANIZATION WHERE NAME = '&3') WHERE LOGIN_ID = '&1';

DROP TRIGGER CPE_USER_TEMP_TRIG1;
ALTER TABLE CPE_USER enable CONSTRAINT CPE_USER_FK_1 ;
ALTER TABLE CPE_USER enable CONSTRAINT CPE_USER_FK_2 ;
ALTER TABLE CPE_USER enable CONSTRAINT CPE_USER_FK_3 ;
ALTER TABLE CPE_USER ENABLE CONSTRAINT CPE_USER_FK_4 ;
ALTER TRIGGER CPE_USER_TRIG1 ENABLE;
ALTER TRIGGER CPE_USER_TRIG3 ENABLE;
ALTER TRIGGER CPE_USER_TRIG4 ENABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG3 ENABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG4 ENABLE;
ALTER TRIGGER CPE_ORGANIZATION_TRIG5 ENABLE;
ALTER TABLE CPE_ORGANIZATION ENABLE CONSTRAINT CPE_ORGANIZATION_FK_1 ;
grant select on cpe_user to sys;
grant update on cpe_user to sys;
grant select on auth_user to sys;
grant update on auth_user to sys;

insert into cpe_user_preference (preference_xml,user_id)
values
(  XMLTYPE('<Info><MyIP> &5 </MyIP></Info>'),
  (select id from cpe_user where parent_id is null)
) ;
commit;