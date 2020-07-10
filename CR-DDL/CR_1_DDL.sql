PROMPT Creating CLEAN slate.....delete all old junk


drop table CPE_AUTH_TYPE 			cascade constraints purge;
drop table CPE_AZURE_VM             cascade constraints purge;
drop table CPE_CRITICALITY_TYPE 		cascade constraints purge;
drop table CPE_GROUP_FUNCTIONAL_TYPE		cascade constraints purge;
drop table CPE_GROUP_GFT_MEMBER			cascade constraints purge;
drop table CPE_GROUP_GRT_MEMBER			cascade constraints purge;
drop table CPE_GROUP_RESOURCE_TYPE		cascade constraints purge;
drop table CPE_MEMBER_RULE_PARAMETER		cascade constraints purge;
drop table CPE_ORGANIZATION			cascade constraints purge;
drop table CPE_PROFILE				cascade constraints purge;
drop table CPE_PROFILE_SUPPORT_MATRIX		cascade constraints purge;
drop table CPE_PROFILE_INFO			cascade constraints purge;
drop table CPE_PROFILE_MEMBER			cascade constraints purge;
drop table CPE_VIEW_LEVEL      cascade constraints purge;
drop table CPE_RESOURCE				cascade constraints purge;
drop table CPE_RESOURCE_LOG			cascade constraints purge;
drop table CPE_RESOURCE_LOG_DETAIL		cascade constraints purge;
drop table CPE_RESOURCE_MGMT			cascade constraints purge;
drop table CPE_RESOURCE_TYPE			cascade constraints purge;
drop table CPE_RES_MGMT_EXCEPTION		cascade constraints purge;
drop table CPE_RESOURCE_VERSION			cascade constraints purge;
drop table CPE_RULE				cascade constraints purge;
drop table CPE_RULE_FUNCTIONAL_GROUP_TYPE	cascade constraints purge;
drop table CPE_RULE_HEADER			cascade constraints purge;
drop table CPE_RULE_PARAMETER			cascade constraints purge;
drop table CPE_USER				cascade constraints purge;
drop table CPE_USER_MESSAGES			cascade constraints purge;
drop table CPE_USER_MESSAGE_TYPE		cascade constraints purge;
drop table CPE_USER_PREFERENCE			cascade constraints purge;
drop table CPE_USER_PROFILE			cascade constraints purge;
drop table CPE_USER_RELATION			cascade constraints purge;
drop table CPE_USER_TYPE			cascade constraints purge;
drop table CPE_SYS_ERROR_MESSAGE		cascade constraints purge;
drop table CPE_USAGE_LOG			cascade constraints purge;
drop table Appliance_Details			cascade constraints purge;
drop table LDAP_SERVER_CONFIG			cascade constraints purge;

drop sequence CPE_SYSTEM_SEQ;

BEGIN
  DBMS_XMLSCHEMA.deleteSchema('http://www.cloudraxak.com/schemas/profile_info.xsd',4);
END;
/
BEGIN
  DBMS_XMLSCHEMA.deleteSchema('http://www.cloudraxak.com/schemas/profile_data.xsd',4);
END;
/
BEGIN
  DBMS_XMLSCHEMA.deleteSchema('http://www.cloudraxak.com/schemas/resource_info.xsd',4);
END;
/
BEGIN
  DBMS_XMLSCHEMA.deleteSchema('http://www.cloudraxak.com/schemas/resource_log.xsd',4);
END;
/
BEGIN
  DBMS_XMLSCHEMA.deleteSchema('http://www.cloudraxak.com/schemas/resource_log_detail.xsd',4);
END;
/
BEGIN
  DBMS_XMLSCHEMA.deleteSchema('http://www.cloudraxak.com/schemas/organization_info.xsd',4);
END;
/


PROMPT Start with sequence creation
CREATE SEQUENCE  "CPE_SYSTEM_SEQ"  MINVALUE 1 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
PROMPT create access list needed for calling API
BEGIN
        DBMS_NETWORK_ACL_ADMIN.CREATE_ACL('CR-Release-3-00.xml', 'HTTP access ACL', 'RAXAK3', TRUE, 'connect');
        DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE('CR-Release-3-00.xml', 'RAXAK3', TRUE, 'connect');
        DBMS_NETWORK_ACL_ADMIN.ADD_PRIVILEGE('CR-Release-3-00.xml', 'RAXAK3', TRUE, 'resolve');
        DBMS_NETWORK_ACL_ADMIN.ASSIGN_ACL('CR-Release-3-00.xml', '*');
END;
/

PROMPT now register XSDs
BEGIN
  DBMS_XMLSCHEMA.registerSchema(
'http://www.cloudraxak.com/schemas/profile_info.xsd',
'<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <xs:element name="ProfileInfo">
   <xs:complexType>
     <xs:sequence>
       <xs:element minOccurs="1" maxOccurs="1" name="Info">
         <xs:complexType>
           <xs:sequence>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="total_rules"/>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="cost_to_scan"/>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="cost_to_remediate"/>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="rule_low"/>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="rule_medium"/>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="rule_high"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:float" name="rule_critical"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:float" name="rule_insane"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:float" name="rule_default"/>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="weight"/>
           </xs:sequence>
           <xs:attribute type="xs:string" name="Name"/>
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

BEGIN
  DBMS_XMLSCHEMA.registerSchema(
'http://www.cloudraxak.com/schemas/profile_data.xsd',
'<xs:schema attributeFormDefault="unqualified" elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="ProfileData">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="Profile">
          <xs:complexType>
            <xs:sequence>
              <xs:element type="xs:string" name="title"/>
              <xs:element type="xs:string" name="description"/>
              <xs:element name="select" maxOccurs="unbounded" minOccurs="0">
                <xs:complexType>
                  <xs:simpleContent>
                    <xs:extension base="xs:string">
                      <xs:attribute type="xs:string" name="idref" use="optional"/>
                      <xs:attribute type="xs:string" name="rule_id" use="optional"/>
                      <xs:attribute type="xs:string" name="selected" use="optional"/>
                    </xs:extension>
                  </xs:simpleContent>
                </xs:complexType>
              </xs:element>
            </xs:sequence>
            <xs:attribute type="xs:string" name="id"/>
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

BEGIN
  DBMS_XMLSCHEMA.registerSchema(
'http://www.cloudraxak.com/schemas/resource_log.xsd',
'<xs:schema elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <xs:element name="ResourceLog">
   <xs:complexType>
     <xs:sequence>
       <xs:element minOccurs="1" maxOccurs="1"  name="Info">
         <xs:complexType>
           <xs:sequence>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:string" name="execution_mode"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="code_version"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:string" name="execution_status"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:float" name="total_rules_count"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="total_rules"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:float" name="success_rules_count"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:float" name="failure_rules_count"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="manual_rules_count"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="skipped_rules_count"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:float" name="high_severity_success"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:float" name="high_severity_failure"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="high_severity_manual"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="high_severity_skipped"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:float" name="medium_severity_success"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:float" name="medium_severity_failure"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="medium_severity_manual"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="medium_severity_skipped"/>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="low_severity_success"/>
             <xs:element minOccurs="1" maxOccurs="1" type="xs:float" name="low_severity_failure"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="low_severity_manual"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="low_severity_skipped"/>
           </xs:sequence>
           <xs:attribute type="xs:string" name="profile_name"/>
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

BEGIN
  DBMS_XMLSCHEMA.registerSchema(
'http://www.cloudraxak.com/schemas/resource_log_detail.xsd',
'<xs:schema elementFormDefault="qualified" xmlns:xs="http://www.w3.org/2001/XMLSchema">
 <xs:element name="ResourceLogDetail">
   <xs:complexType>
     <xs:sequence>
       <xs:element minOccurs="1" maxOccurs="1" name="Info">
         <xs:complexType>
           <xs:sequence>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="rule_number"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:string" name="rule_id"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="rule_console"/>
             <xs:element minOccurs="1" maxOccurs="1"  type="xs:string" name="execution_status"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="outcome"/>
            <xs:element minOccurs="0" maxOccurs="1"  type="xs:float" name="health_value"/>
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

BEGIN
DBMS_XMLSCHEMA.registerSchema(
'http://www.cloudraxak.com/schemas/organization_info.xsd',
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
<xs:element name="OrganizationInfo">
   <xs:complexType>
     <xs:sequence>
       <xs:element minOccurs="1" maxOccurs="1"  name="Info">
         <xs:complexType>
           <xs:sequence>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="public_key"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="private_key"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="passphrase"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="cert_pem"/>
             <xs:element minOccurs="0" maxOccurs="1"  type="xs:string" name="private_pem"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_userid"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_password"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_access_ID"/>
             <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_access_key"/>
            <xs:element minOccurs="0" maxOccurs="1" type="URLtype" name="MP_endpoint_URL"/>
           <xs:element minOccurs="0" maxOccurs="1" type="IPtype"  name="MP_endpoint_ip"/>
            <xs:element minOccurs="0" maxOccurs="1" type="xs:string" name="MP_version"/>
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

PROMPT now let us create few tables
CREATE TABLE Appliance_Details
  (
    ID                     NUMBER (16) NOT NULL,
    host                   VARCHAR2 (64),
    disk_avail             NUMBER (16),
    disk_used              NUMBER (16),
    disk_size		       NUMBER (16),
    uptime                 VARCHAR2 (64),
    reboot                 VARCHAR2 (1024),
    orgs_active            NUMBER (8),
    orgs_inactive          NUMBER (8),
    users_active           NUMBER (8),
    users_inactive         NUMBER (8),
    resources_by_type      VARCHAR2 (4000),
    resources_by_version   VARCHAR2 (4000),
    resources_active       NUMBER (8),
    resources_inactive     NUMBER (8),
    default_profile        VARCHAR2 (1000),
    custom_profile         VARCHAR2 (2000),
    total_compliance       VARCHAR2 (2000),
    month_compliance       VARCHAR2 (2000),
    code_version           VARCHAR2 (64),
    code_difference        VARCHAR2 (4000),
    CREATED_BY             VARCHAR2 (64),
    CREATE_DATE            TIMESTAMP
  );

CREATE TABLE CPE_APP_LOG_LIST
(
    ID NUMBER (16) NOT NULL ,
    APPLIANCE_ID NUMBER (16) ,
    RESOURCE_NAME VARCHAR2 (64) NOT NULL ,
    OWNER VARCHAR2 (64) NOT NULL ,
    ORGANIZATION VARCHAR2(64),
    HEALTH NUMBER (8),
    PROFILE VARCHAR2 (1024) ,
    TIME_STAMP TIMESTAMP,
    SCHEDULE_CREATED_BY VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP,
    LOG_DETAILS VARCHAR2(256),
    IS_ACTIVE CHAR(1),
    RESOURCE_TYPE VARCHAR2(64),
    COMPLIANCE_MODE CHAR(1),
    SOURCE VARCHAR2(64),
    STATUS VARCHAR(10)
);


CREATE TABLE CPE_APP_CLUSTER
(
    ID NUMBER (16) NOT NULL ,
    APPLIANCE_NAME VARCHAR2 (32) ,
    GUID VARCHAR2 (64),
    IP VARCHAR2 (64) NOT NULL ,
    SOURCE VARCHAR2(64),
    REMOTE_ID NUMBER (16) ,
    TOKEN VARCHAR2 (128),
    UPDATED_BY VARCHAR2 (64) ,
    UPDATE_DATE TIMESTAMP,
    CREATED_BY VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP,
    IS_ACTIVE CHAR(1),
    ACCESS_STATUS VARCHAR(128)
);

CREATE TABLE CPE_AUTH_TYPE
  (
    ID          NUMBER (16) NOT NULL ,
    AUTH_TYPE   VARCHAR2 (2) ,
    NAME        VARCHAR2 (64) ,
    IS_ACTIVE   CHAR (1) ,
    CREATED_BY  VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP ,
    UPDATED_BY  VARCHAR2 (16) ,
    UPDATE_DATE TIMESTAMP
  ) ;
CREATE TABLE CPE_AZURE_VM
  (
    ID                 NUMBER(16,0) NOT NULL ENABLE,
    OWNER_ID           NUMBER(16,0) NOT NULL ENABLE,
    SUBSCRIPTION_ID    VARCHAR2(64 BYTE) NOT NULL ENABLE,
    RESOURCE_NAME      VARCHAR2(64 BYTE),
    REGISTERED         CHAR(1 BYTE),
    AZURE_PARENT_ID    NUMBER(16,0),
    OS_TYPE            VARCHAR2(20 BYTE),
    PROVIDER           VARCHAR2(20 BYTE),
    GUID               VARCHAR2(64 BYTE),
    RESOURCE_GROUP     VARCHAR2(64 BYTE),
    RESOURCE_TYPE      VARCHAR2(20 BYTE),
    CREATED_BY         VARCHAR2(64 BYTE),
    CREATE_DATE        TIMESTAMP (6),
    UPDATED_BY         VARCHAR2(64 BYTE),
    UPDATE_DATE        TIMESTAMP (6)
  ) ;
CREATE TABLE CPE_CRITICALITY_TYPE
  (
    ID          NUMBER (16) NOT NULL ,
    NAME        VARCHAR2 (8) ,
    DESCRIPTION VARCHAR2 (64) ,
    IS_ACTIVE   CHAR (1) ,
    CREATED_BY  VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP ,
    UPDATED_BY  VARCHAR2 (64) ,
    UPDATE_DATE TIMESTAMP
  ) ;
CREATE TABLE CPE_GROUP_FUNCTIONAL_TYPE
  (
    ID          NUMBER (16) NOT NULL ,
    NAME        VARCHAR2 (64) ,
    OWNER_ID    NUMBER (16) NOT NULL ,
    IS_ACTIVE   CHAR (1) ,
    CHANGE_NOTE VARCHAR2(1024),
    CREATED_BY  VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP ,
    UPDATED_BY  VARCHAR2 (64) ,
    UPDATE_DATE TIMESTAMP
  ) ;
CREATE TABLE CPE_GROUP_GFT_MEMBER
  (
    ID          NUMBER (16) NOT NULL ,
    GROUP_ID    NUMBER (16) NOT NULL ,
    RESOURCE_ID NUMBER (16) NOT NULL ,
    IS_ACTIVE   CHAR (1) ,
    CREATED_BY  VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP ,
    UPDATED_BY  VARCHAR2 (64) ,
    UPDATE_DATE TIMESTAMP
  ) ;
CREATE TABLE CPE_GROUP_GRT_MEMBER
  (
    ID                     NUMBER (16) NOT NULL ,
    GROUP_ID               NUMBER (16) NOT NULL ,
    RESOURCE_ID            NUMBER (16) NOT NULL ,
    GROUP_RESOURCE_TYPE_ID NUMBER (16) NOT NULL ,
    IS_ACTIVE              CHAR (1) ,
    CREATED_BY             VARCHAR2 (64) ,
    CREATE_DATE            TIMESTAMP ,
    UPDATED_BY             VARCHAR2 (64) ,
    UPDATE_DATE            TIMESTAMP
  ) ;
CREATE TABLE CPE_GROUP_RESOURCE_TYPE
  (
    ID               NUMBER (16) NOT NULL ,
    NAME             VARCHAR2 (64) ,
    RESOURCE_TYPE_ID NUMBER (16) NOT NULL ,
    RESOURCE_ID      NUMBER (16) ,
    OWNER_ID         NUMBER (16) NOT NULL ,
    IS_ACTIVE        CHAR (1) ,
    CHANGE_NOTE      VARCHAR2(1024),
    CREATED_BY       VARCHAR2 (64) ,
    CREATE_DATE      TIMESTAMP ,
    UPDATED_BY       VARCHAR2 (64) ,
    UPDATE_DATE      TIMESTAMP
  ) ;
CREATE TABLE CPE_MEMBER_RULE_PARAMETER
  (
    ID                NUMBER (16) NOT NULL ,
    PROFILE_MEMBER_ID NUMBER (16) NOT NULL ,
    NAME              VARCHAR2 (64) ,
    VALUE             VARCHAR2 (64) ,
    IS_ACTIVE         CHAR (1) ,
    CREATED_BY        VARCHAR2 (64) ,
    CREATE_DATE       TIMESTAMP ,
    UPDATED_BY        VARCHAR2 (64) ,
    UPDATE_DATE       TIMESTAMP
  ) ;
CREATE TABLE CPE_ORGANIZATION
  (
    ID                   NUMBER (16) NOT NULL ,
    PARENT_ID            NUMBER (16) ,
    NAME                 VARCHAR2 (64) NOT NULL,
    OWNER_ID             NUMBER (16) NOT NULL ,
    IS_ACTIVE            CHAR (1) ,
    ORG_INFO		 XMLTYPE ,
    QUOTA_RESOURCE       NUMBER (8) ,
    QUOTA_RUNS_PER_MONTH NUMBER (8) ,
    QUOTA_COST_PER_MONTH NUMBER (10,2) ,
    QUOTA_EXPIRY_DATE    TIMESTAMP,
    USAGE_RESOURCE       NUMBER (8) ,
    USAGE_RUNS           NUMBER (8) ,
    USAGE_COST           NUMBER (10,2) ,
    CREATED_BY           VARCHAR2 (64) ,
    CREATE_DATE          TIMESTAMP ,
    UPDATED_BY           VARCHAR2 (64) ,
    UPDATE_DATE          TIMESTAMP
  )
  XMLType COLUMN ORG_INFO XMLSCHEMA "http://www.cloudraxak.com/schemas/organization_info.xsd" ELEMENT "OrganizationInfo"
  ;
CREATE TABLE CPE_PROFILE
  (
    ID                  NUMBER (16) NOT NULL ,
    NAME                VARCHAR2 (1024) ,
    PROFILE_TYPE        VARCHAR2(1024),
    VERSION		NUMBER(8),
    CHANGE_NOTE	        VARCHAR2(1024),
    PROFILE_REF_URL     VARCHAR2(1024),
    PARENT_PROFILE_ID	NUMBER (16),
    OWNER_ID            NUMBER (16) NOT NULL ,
    RESOURCE_TYPE_ID    NUMBER (16) NOT NULL ,
    PROFILE_CREATE_DATE TIMESTAMP ,
    PROFILE_EXPIRY_DATE TIMESTAMP ,
    PROFILE_REF_ID	NUMBER (16),
    PROFILE_STRENGTH	NUMBER (8,3),
    IS_ACTIVE           CHAR (1) ,
    CREATED_BY          VARCHAR2 (64) ,
    CREATE_DATE         TIMESTAMP ,
    UPDATED_BY          VARCHAR2 (64) ,
    UPDATE_DATE         TIMESTAMP
  ) ;
CREATE TABLE CPE_PROFILE_SUPPORT_MATRIX
  (
    ID                  NUMBER (16) NOT NULL ,
    PROFILE_ID		NUMBER (16) NOT NULL ,
    RESOURCE_TYPE_ID	NUMBER (16) NOT NULL ,
    RESOURCE_VERSION_ID	NUMBER (16) NOT NULL ,
    IS_ACTIVE           CHAR (1) ,
    CREATED_BY          VARCHAR2 (64) ,
    CREATE_DATE         TIMESTAMP ,
    UPDATED_BY          VARCHAR2 (64) ,
    UPDATE_DATE         TIMESTAMP
  ) ;
CREATE TABLE CPE_PROFILE_INFO
  (
    ID         		NUMBER (16) NOT NULL ,
    PROFILE_ID 		NUMBER (16) NOT NULL ,
    PROFILE_INFO	XMLTYPE ,
    PROFILE_DATA	XMLTYPE ,
    PROFILE_MOF         CLOB,
    MOF_CHKSUM          VARCHAR2(1024),
    IS_ACTIVE           CHAR (1) ,
    CREATED_BY  	VARCHAR2 (64) ,
    CREATE_DATE 	TIMESTAMP ,
    UPDATED_BY  	VARCHAR2 (64) ,
    UPDATE_DATE 	TIMESTAMP
  )
    XMLType COLUMN PROFILE_INFO XMLSCHEMA "http://www.cloudraxak.com/schemas/profile_info.xsd" ELEMENT "ProfileInfo"
    XMLType COLUMN PROFILE_DATA XMLSCHEMA "http://www.cloudraxak.com/schemas/profile_data.xsd" ELEMENT "ProfileData"
  ;
CREATE TABLE CPE_PROFILE_MEMBER
  (
    ID             	NUMBER (16) NOT NULL ,
    PROFILE_ID     	NUMBER (16) NOT NULL ,
    PARENT_PROFILE_ID 	NUMBER (16) NOT NULL ,
    BASE_RULE_ID   	NUMBER (16) NOT NULL ,
    CRITICALITY_ID 	NUMBER (16) NOT NULL ,
    WEIGHT         	NUMBER (8) ,
    OVERRIDE_TYPE	CHAR(1),
    OVERRIDE_CREATED_BY NUMBER(16),
    OVERRIDE_START_DATE	TIMESTAMP,
    OVERRIDE_END_DATE   TIMESTAMP,
    IS_ACTIVE           CHAR (1) ,
    CREATED_BY     	VARCHAR2 (64) ,
    CREATE_DATE    	TIMESTAMP ,
    UPDATED_BY     	VARCHAR2 (64) ,
    UPDATE_DATE    	TIMESTAMP
  ) ;

CREATE TABLE CPE_VIEW_LEVEL
   (
    ID            NUMBER (16) NOT NULL ,
    NAME          VARCHAR2 (64) ,
    VIEW_TYPE    VARCHAR2(10 BYTE),
    IS_ACTIVE     CHAR (1) ,
    CREATED_BY    VARCHAR2 (64) ,
    CREATE_DATE   TIMESTAMP ,
    UPDATED_BY    VARCHAR2 (64) ,
    UPDATE_DATE   TIMESTAMP
   );

CREATE TABLE CPE_RESOURCE
  (
    ID                  NUMBER (16) NOT NULL ,
    CR_GUID             VARCHAR2 (64) ,
    RESOURCE_TYPE_ID    NUMBER (16) NOT NULL ,
    RESOURCE_VERSION_ID NUMBER (16) NOT NULL ,
    OWNER_ID            NUMBER (16) NOT NULL ,
    NAME		VARCHAR2(64),
    RESOURCE_INFO	XMLTYPE,
    IS_ACTIVE           CHAR (1) ,
    CHANGE_NOTE         VARCHAR2(1024),
    STATUS		VARCHAR2(1024),
    STATUS_DATE		TIMESTAMP,
    CREATED_BY          VARCHAR2 (64) ,
    CREATE_DATE         TIMESTAMP ,
    UPDATED_BY          VARCHAR2 (64) ,
    UPDATE_DATE         TIMESTAMP
  )
 XMLType COLUMN RESOURCE_INFO XMLSCHEMA "http://www.cloudraxak.com/schemas/resource_info.xsd" ELEMENT "ResourceInfo"
;
CREATE TABLE CPE_RESOURCE_LOG
  (
    ID                   NUMBER (16) NOT NULL ,
    RESOURCE_MGMT_ID     NUMBER (16) NOT NULL ,
    PROFILE_INFO_ID      NUMBER (16) NOT NULL ,
    RUN_PARAMETER	 XMLTYPE,
    RUN_MOF		 CLOB,
    SCHEDULED_START_TIME TIMESTAMP ,
    ACTUAL_START_TIME    TIMESTAMP ,
    ACTUAL_END_TIME      TIMESTAMP ,
    OVERALL_HEALTH       NUMBER (9,2) ,
    OVERALL_STATUS       VARCHAR2(16) ,
    OVERALL_INFO         VARCHAR2(4000) ,
    PROFILE_REF_ID	 NUMBER (16),
    PROFILE_STRENGTH	 NUMBER (8,3),
    RAW_LOG 		 CLOB ,
    CONSOLE_LOG_XML 	 XMLTYPE ,
    LOG_XML 		 XMLTYPE ,
    CREATED_BY  	 VARCHAR2 (64) ,
    CREATE_DATE 	 TIMESTAMP ,
    UPDATED_BY  	 VARCHAR2 (64) ,
    UPDATE_DATE 	 TIMESTAMP
  )
XMLType COLUMN LOG_XML XMLSCHEMA "http://www.cloudraxak.com/schemas/resource_log.xsd" ELEMENT "ResourceLog"
;
CREATE TABLE CPE_RESOURCE_LOG_DETAIL
  (
    ID                       NUMBER (16) NOT NULL ,
    RESOURCE_LOG_ID          NUMBER (16) NOT NULL ,
    RULE_ID                  NUMBER (16) NOT NULL ,
    RULE_FUNCTIONAL_GROUP_ID NUMBER (16) NOT NULL ,
    RESOURCE_VERSION_ID      NUMBER (16) NOT NULL ,
    RULE_STATUS              VARCHAR2 (8) ,
    RULE_CRITICALITY         VARCHAR2 (8) ,
    RULE_WEIGHT              NUMBER (8) ,
    LOG_DATA                 VARCHAR2 (64) ,
    LOG_XML                  XMLTYPE,
    CREATED_BY               VARCHAR2 (64) ,
    CREATE_DATE              TIMESTAMP ,
    UPDATED_BY               VARCHAR2 (64) ,
    UPDATE_DATE              TIMESTAMP
  )
--- XMLType COLUMN LOG_XML XMLSCHEMA "http://www.cloudraxak.com/schemas/resource_log_detail.xsd" ELEMENT "ResourceLogDetail"
;
CREATE TABLE CPE_RESOURCE_MGMT
  (
    ID                     NUMBER (16) NOT NULL ,
    OWNER_ID               NUMBER (16) NOT NULL ,
    RESOURCE_ID            NUMBER (16) NOT NULL ,
    PROFILE_ID             NUMBER (16) NOT NULL ,
    RUN_REMEDIATE          CHAR (1) ,
    SCHEDULE_START_TIME    TIMESTAMP ,
    SCHEDULE_FREQUENCY     NUMBER (8) ,
    SCHEDULE_CREATE_TIME   TIMESTAMP ,
    SCHEDULE_END_TIME      TIMESTAMP ,
    SCHEDULE_NEXT_RUN_TIME TIMESTAMP ,
    IS_ACTIVE              CHAR (1) ,
    CHANGE_NOTE            VARCHAR2(1024),
    RUN_STATUS             VARCHAR2(64),
    RUN_COST_SCAN          NUMBER (9,2) ,
    RUN_COST_REMEDIATE     NUMBER (9,2) ,
    LAST_RUN_ID            NUMBER (16)  ,
    CREATED_BY             VARCHAR2 (64) ,
    CREATE_DATE            TIMESTAMP ,
    UPDATED_BY             VARCHAR2 (64) ,
    UPDATE_DATE            TIMESTAMP,
    GROUP_ID               NUMBER (16)
  ) ;
CREATE TABLE CPE_RES_MGMT_EXCEPTION
  (
    ID                  NUMBER (16) NOT NULL ,
    RESOURCE_MGMT_ID    NUMBER (16) NOT NULL ,
    PROFILE_MEMBER_ID   NUMBER (16) NOT NULL,
    OVERRIDE_TYPE	CHAR(1), -- values "S"can-only, s"K"ip this rule, "M"ark successful, "R"emediate
    OVERRIDE_CREATED_BY NUMBER(16),
    OVERRIDE_START_DATE	TIMESTAMP,
    OVERRIDE_END_DATE   TIMESTAMP,
    IS_ACTIVE           CHAR (1) ,
    CHANGE_NOTE         VARCHAR2(1024),
    CREATED_BY     	VARCHAR2 (64) ,
    CREATE_DATE    	TIMESTAMP ,
    UPDATED_BY     	VARCHAR2 (64) ,
    UPDATE_DATE    	TIMESTAMP
  ) ;
CREATE TABLE CPE_RESOURCE_TYPE
  (
    ID          	NUMBER (16) NOT NULL ,
    LEVEL1      	VARCHAR2 (64) ,
    LEVEL2      	VARCHAR2 (64) ,
    LEVEL3      	VARCHAR2 (64) ,
    DESCRIPTION 	VARCHAR2 (64) ,
    REF_PROFILE_ID	NUMBER (16),
    IS_ACTIVE   	CHAR (1) ,
    CREATED_BY  	VARCHAR2 (64) ,
    CREATE_DATE 	TIMESTAMP ,
    UPDATED_BY  	VARCHAR2 (64) ,
    UPDATE_DATE 	TIMESTAMP
  ) ;
CREATE TABLE CPE_RESOURCE_VERSION
  (
    ID               NUMBER (16) NOT NULL ,
    RESOURCE_VERSION VARCHAR2 (64) ,
    RESOURCE_TYPE    NUMBER (16) NOT NULL ,
    DESCRIPTION      VARCHAR2 (64) ,
    IS_ACTIVE        CHAR (1) ,
    CREATED_BY       VARCHAR2 (64) ,
    CREATE_DATE      TIMESTAMP ,
    UPDATED_BY       VARCHAR2 (64) ,
    UPDATE_DATE      TIMESTAMP
  ) ;
CREATE TABLE CPE_RULE
  (
    ID                  NUMBER (16) NOT NULL ,
    BASE_RULE_ID        NUMBER (16) NOT NULL ,
    RESOURCE_VERSION_ID NUMBER (16) NOT NULL ,
    IS_ACTIVE		CHAR(1),
    TECH_DESCRIPTION    VARCHAR2 (2096) ,
    DIRECTIVE           VARCHAR2 (2096) ,
    SUCCESS_CRITERIA    VARCHAR2 (1024) ,
    FAILURE_CRITERIA    VARCHAR2 (1024) ,
    CREATED_BY          VARCHAR2 (64) ,
    CREATE_DATE         TIMESTAMP ,
    UPDATED_BY          VARCHAR2 (64) ,
    UPDATE_DATE         TIMESTAMP
  ) ;
CREATE TABLE CPE_RULE_FUNCTIONAL_GROUP_TYPE
  (
    ID          NUMBER (16) NOT NULL ,
    NAME        VARCHAR2 (64) ,
    DESCRIPTION VARCHAR2 (64) ,
    IS_ACTIVE   CHAR (1) ,
    CREATED_BY  VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP ,
    UPDATED_BY  VARCHAR2 (64) ,
    UPDATE_DATE TIMESTAMP
  ) ;
CREATE TABLE CPE_RULE_HEADER
  (
    ID                NUMBER (16) NOT NULL ,
    NAME              VARCHAR2 (2048),
    RULE_ID           VARCHAR2 (2048),
    CUSTOM_VERSION    NUMBER (8),
    VERSION           VARCHAR2(2048),
    TITLE             VARCHAR2(2048),
    DESCRIPTION       VARCHAR2 (4000),
    FIX_ID            VARCHAR2(2048),
    FIX_TEXT          VARCHAR2(4000),
    CHECK_ID          VARCHAR2(2048),
    CHECK_TEXT        VARCHAR2(4000),
    RULE_FUNC_TYPE_ID NUMBER (16) NOT NULL ,
    WEIGHT            NUMBER (8) ,
    CRITICALITY_ID    NUMBER (16) NOT NULL ,
    COST_SCAN         NUMBER (9,2) ,
    COST_REMEDIATE    NUMBER (9,2) ,
    PARAM_EDITABLE    CHAR (1) ,
    RULE_CONFIG	      CLOB,
    IS_ACTIVE         CHAR (1) ,
    CREATED_BY        VARCHAR2 (64) ,
    CREATE_DATE       TIMESTAMP ,
    UPDATED_BY        VARCHAR2 (64) ,
    UPDATE_DATE       TIMESTAMP
  ) ;
CREATE TABLE CPE_RULE_PARAMETER
  (
    ID          NUMBER (16) NOT NULL ,
    RULE_ID     NUMBER (16) NOT NULL ,
    VALUE       VARCHAR2 (64) ,
    NAME        VARCHAR2 (64) ,
    IS_ACTIVE   CHAR (1) ,
    CREATED_BY  VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP ,
    UPDATED_BY  VARCHAR2 (64) ,
    UPDATE_DATE TIMESTAMP
  ) ;
CREATE TABLE CPE_USER
  (
    ID                   NUMBER (16) NOT NULL ,
    LOGIN_ID             VARCHAR2 (64) ,
    IS_ACTIVE            CHAR (1) ,
    AUTH_TYPE_ID         NUMBER (16) NOT NULL ,
    USER_TYPE_ID         NUMBER (16) NOT NULL ,
    USER_ORG_ID          NUMBER (16)  ,
    PARENT_ID            NUMBER (16)  ,
    AUTH_USER_ID	 NUMBER (16)  ,
    USER_CREATE_DATE     TIMESTAMP ,
    USER_EXPIRY_DATE     TIMESTAMP ,
    QUOTA_RESOURCE       NUMBER (8) ,
    QUOTA_RUNS_PER_MONTH NUMBER (8) ,
    QUOTA_COST_PER_MONTH NUMBER (10,2) ,
    QUOTA_EXPIRY_DATE    TIMESTAMP,
    REMEDIATE_PRIVILEDGE CHAR (1) ,
    RES_VIEW_TYPE            VARCHAR2 (64) ,
    USER_VIEW_TYPE            VARCHAR2 (64) ,
    USAGE_RESOURCE       NUMBER (8) ,
    USAGE_RUNS           NUMBER (8) ,
    USAGE_COST           NUMBER (10,2) ,
    CREATED_BY           VARCHAR2 (64) ,
    CREATE_DATE          TIMESTAMP ,
    UPDATED_BY           VARCHAR2 (64) ,
    UPDATE_DATE          TIMESTAMP
  ) ;
CREATE TABLE CPE_USER_MESSAGES
  (
    ID             	NUMBER (16) NOT NULL ,
    MESSAGE_DATE   	TIMESTAMP ,
    TARGET_USER_ID 	NUMBER (16) NOT NULL ,
    EVENT_TYPE_ID  	NUMBER (16) NOT NULL ,
    TRIGGER_EVENT  	VARCHAR2 (256) ,
    MESSAGE_TEXT   	VARCHAR2 (256) ,
    READ_STATUS    	CHAR (1) ,
    IS_ACTIVE		VARCHAR2(1),
    CREATED_BY     	VARCHAR2 (64) ,
    CREATE_DATE    	TIMESTAMP ,
    UPDATED_BY     	VARCHAR2 (64) ,
    UPDATE_DATE    	TIMESTAMP
  ) ;
CREATE TABLE CPE_USER_MESSAGE_TYPE
  (
    ID          	NUMBER (16) NOT NULL ,
    EVENT_TYPE  	NUMBER (8) ,
    EVENT_CATEGORY	VARCHAR2 (16),
    EVENT_ENTITY	VARCHAR2 (16),
    DESCRIPTION 	VARCHAR2 (64) ,
    IS_ACTIVE   	CHAR (1) ,
    CREATED_BY  	VARCHAR2 (64) ,
    CREATE_DATE 	TIMESTAMP ,
    UPDATED_BY  	VARCHAR2 (64) ,
    UPDATE_DATE 	TIMESTAMP
  ) ;
CREATE TABLE CPE_USER_PREFERENCE
  (
    ID       		NUMBER (16) NOT NULL ,
    USER_ID 		NUMBER (16) NOT NULL ,
    PREFERENCE_XML 	XMLTYPE ,
    SAVED_DATE  	TIMESTAMP ,
    IS_ACTIVE   	CHAR (1) ,
    CREATED_BY  	VARCHAR2 (64) ,
    CREATE_DATE 	TIMESTAMP ,
    UPDATED_BY  	VARCHAR2 (64) ,
    UPDATE_DATE 	TIMESTAMP
  ) ;
CREATE TABLE CPE_USER_PROFILE
  (
    ID                 NUMBER (16) NOT NULL ,
    PROFILE_ID         NUMBER (16) NOT NULL ,
    PERMITTED_USER_ID  NUMBER (16) NOT NULL ,
    GRANTED_BY_USER_ID NUMBER (16) NOT NULL ,
    GRANTED_DATE       TIMESTAMP ,
    EXPIRY_DATE        TIMESTAMP ,
    IS_ACTIVE          CHAR (1) ,
    CHANGE_NOTE        VARCHAR2(1024),
    CREATED_BY         VARCHAR2 (64) ,
    CREATE_DATE        TIMESTAMP ,
    UPDATED_BY         VARCHAR2 (64) ,
    UPDATE_DATE        TIMESTAMP
  ) ;
CREATE TABLE CPE_USER_RELATION
  (
    ID          NUMBER (16) ,
    PARENT_ID   NUMBER (16) NOT NULL ,
    CHILD_ID    NUMBER (16) NOT NULL ,
    IS_ACTIVE   CHAR (1) ,
    CREATED_BY  VARCHAR2 (64) ,
    CREATE_DATE TIMESTAMP ,
    UPDATED_BY  VARCHAR2 (64) ,
    UPDATE_DATE TIMESTAMP
  ) ;
CREATE TABLE CPE_USER_TYPE
  (
    ID          	NUMBER (16) NOT NULL ,
    USER_TYPE   	VARCHAR2 (2) ,
    PRIVILEDGE_TYPE  	NUMBER(2),
    NAME        	VARCHAR2 (64) ,
    IS_ACTIVE           CHAR (1) ,
    CREATED_BY  	VARCHAR2 (64) ,
    CREATE_DATE 	TIMESTAMP ,
    UPDATED_BY  	VARCHAR2 (64) ,
    UPDATE_DATE 	TIMESTAMP
  ) ;
CREATE TABLE CPE_SYS_ERROR_MESSAGE
  (
    ID          	NUMBER (16) NOT NULL ,
    ERROR_NUMBER   	NUMBER (8) ,
    ERROR_TEXT        	VARCHAR2 (256) ,
    CREATED_BY  	VARCHAR2 (64) ,
    CREATE_DATE 	TIMESTAMP ,
    UPDATED_BY  	VARCHAR2 (64) ,
    UPDATE_DATE 	TIMESTAMP
  ) ;
CREATE TABLE CPE_USAGE_LOG
  (
    ID			NUMBER (16) NOT NULL,
    USAGE_TYPE		VARCHAR2(256),
    USER_ID		NUMBER (16) ,
    ORG_ID		NUMBER (16) ,
    RESOURCE_ID		NUMBER (16),
    RESOURCE_MGMT_ID	NUMBER (16),
    EVENT_TYPE          VARCHAR2(256) NOT NULL,
    EVENT_TRIGGER       VARCHAR2(256),
    EVENT_TRIGGER_BY    NUMBER(16),
    EVENT_VALUE		NUMBER (10,2),
    MON_RRRR		VARCHAR2 (8) ,
    CREATED_BY          VARCHAR2 (64) ,
    CREATE_DATE         TIMESTAMP ,
    UPDATED_BY          VARCHAR2 (64) ,
    UPDATE_DATE         TIMESTAMP  ,
    USER_TYPE_ID NUMBER (16),
    SEVERITY NUMBER (16)
  ) ;

CREATE TABLE LDAP_SERVER_CONFIG
   (
      ID NUMBER (16) NOT NULL,
      AUTH_LDAP_SERVER_URI VARCHAR2 (64) NOT NULL,
      AUTH_LDAP_BIND_DN VARCHAR2 (64) NOT NULL ,
      BIND_SEARCH VARCHAR2 (64) NOT NULL,
      BIND_PASSWORD VARCHAR2(64),
      CREATE_DATE TIMESTAMP,
      CREATED_BY VARCHAR2 (64),
      UPDATED_BY VARCHAR2 (64),
      UPDATE_DATE TIMESTAMP
   );



PROMPT Add some table constraints
PROMPT let us start with primary keys
ALTER TABLE Appliance_Details ADD CONSTRAINT Appliance_Details_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_APP_LOG_LIST ADD CONSTRAINT CPE_APP_LOG_LIST_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_APP_CLUSTER ADD CONSTRAINT CPE_APP_CLUSTER_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_AUTH_TYPE ADD CONSTRAINT CPE_AUTH_TYPE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_AZURE_VM ADD CONSTRAINT CPE_AZURE_VM PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_CRITICALITY_TYPE ADD CONSTRAINT CPE_CRITICALITY_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_GROUP_FUNCTIONAL_TYPE ADD CONSTRAINT CPE_GFT_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_GROUP_GFT_MEMBER ADD CONSTRAINT CPE_GROUP_GFT_MEMBER_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_GROUP_GRT_MEMBER ADD CONSTRAINT CPE_GROUP_GRT_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_GROUP_RESOURCE_TYPE ADD CONSTRAINT CPE_GRT_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_MEMBER_RULE_PARAMETER ADD CONSTRAINT CPE_MRP_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_ORGANIZATION ADD CONSTRAINT CPE_ORGNIZATION_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_PROFILE ADD CONSTRAINT CPE_PROFILE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_PROFILE_SUPPORT_MATRIX ADD CONSTRAINT CPE_PROFILE_SM_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_PROFILE_INFO ADD CONSTRAINT CPE_PROFILE_INFO_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_PROFILE_MEMBER ADD CONSTRAINT CPE_PROFILE_MEMBER_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_VIEW_LEVEL ADD CONSTRAINT CPE_VIEW_LEVEL_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RESOURCE ADD CONSTRAINT CPE_RESOURCE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RESOURCE_LOG ADD CONSTRAINT CPE_RESOURCE_LOG_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RESOURCE_LOG_DETAIL ADD CONSTRAINT CPE_RESOURCE_LOG_DETAIL_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RESOURCE_MGMT ADD CONSTRAINT CPE_RESOURCE_MGMT_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RES_MGMT_EXCEPTION ADD CONSTRAINT CPE_RES_MGMT_EXCEPTION_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RESOURCE_TYPE ADD CONSTRAINT CPE_RESOURCE_TYPE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RESOURCE_VERSION ADD CONSTRAINT CPE_RESOURCE_VERSION_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RULE ADD CONSTRAINT CPE_RULE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RULE_FUNCTIONAL_GROUP_TYPE ADD CONSTRAINT CPE_RFGT_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RULE_HEADER ADD CONSTRAINT CPE_RULE_HEADER_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_RULE_PARAMETER ADD CONSTRAINT CPE_RULE_PARAMETER_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_USER ADD CONSTRAINT CPE_USER_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_USER_MESSAGES ADD CONSTRAINT CPE_USER_MESSAGE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_USER_MESSAGE_TYPE ADD CONSTRAINT CPE_USER_MESSAGE_TYPE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_USER_PREFERENCE ADD CONSTRAINT CPE_USER_PREFERENCE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_USER_PROFILE ADD CONSTRAINT CPE_USER_PROFILE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_USER_RELATION ADD CONSTRAINT CPE_USER_RELATION_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_USER_TYPE ADD CONSTRAINT CPE_USER_TYPE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_SYS_ERROR_MESSAGE ADD CONSTRAINT CPE_SYS_ERROR_MESSAGE_PK PRIMARY KEY ( ID ) ;
ALTER TABLE CPE_USAGE_LOG ADD CONSTRAINT CPE_USAGE_LOG_PK PRIMARY KEY ( ID ) ;
ALTER TABLE LDAP_SERVER_CONFIG ADD CONSTRAINT LDAP_SERVER_CONFIG_PK PRIMARY KEY ( ID ) ;


PROMPT now add some unique constraints
ALTER TABLE CPE_APP_CLUSTER ADD CONSTRAINT CPE_APP_CLUSTER_UNQ_1 UNIQUE ( GUID,SOURCE ) ;
ALTER TABLE CPE_APP_CLUSTER ADD CONSTRAINT CPE_APP_CLUSTER_UNQ_2 UNIQUE ( APPLIANCE_NAME ) ;
ALTER TABLE CPE_RESOURCE_VERSION ADD CONSTRAINT CPE_RESOURCE_VERSION_UNQ_1 UNIQUE ( RESOURCE_TYPE , RESOURCE_VERSION ) ;
ALTER TABLE CPE_RESOURCE_TYPE ADD CONSTRAINT CPE_RESOURCE_TYPE_UNQ_1 UNIQUE ( LEVEL1 , LEVEL2 , LEVEL3 ) ;
ALTER TABLE CPE_RESOURCE_TYPE ADD CONSTRAINT CPE_RESOURCE_TYPE_UNQ_2 UNIQUE ( LEVEL3 ) ;
ALTER TABLE CPE_RESOURCE ADD CONSTRAINT CPE_RESOURCE_UNQ_1 UNIQUE ( CR_GUID ) ;
ALTER TABLE CPE_PROFILE ADD CONSTRAINT CPE_PROFILE_UNQ_1 UNIQUE ( OWNER_ID , NAME , profile_TYPE , version) ;
ALTER TABLE CPE_PROFILE_MEMBER ADD CONSTRAINT CPE_PROFILE_MEMBER_UNQ_1 UNIQUE ( profile_id, base_rule_id ) ;
ALTER TABLE CPE_ORGANIZATION ADD CONSTRAINT CPE_ORGANIZATION_UNQ_1 UNIQUE ( PARENT_ID , NAME ) ;
ALTER TABLE CPE_GROUP_RESOURCE_TYPE ADD CONSTRAINT CPE_GRT_UNQ_1 UNIQUE ( NAME , OWNER_ID ) ;
ALTER TABLE CPE_GROUP_FUNCTIONAL_TYPE ADD CONSTRAINT CPE_GFT_UNQ_1 UNIQUE ( NAME , OWNER_ID ) ;
ALTER TABLE CPE_CRITICALITY_TYPE ADD CONSTRAINT CPE_CRITICALITY_TYPE_UNQ_1 UNIQUE ( NAME ) ;
ALTER TABLE CPE_AUTH_TYPE ADD CONSTRAINT CPE_AUTH_TYPE_UNQ_1 UNIQUE ( AUTH_TYPE ) ;
ALTER TABLE CPE_AZURE_VM ADD CONSTRAINT CPE_AZURE_VM_UNQ_1 UNIQUE ( GUID ) ;
ALTER TABLE CPE_RULE_FUNCTIONAL_GROUP_TYPE ADD CONSTRAINT CPE_RFGT__UNQ_1 UNIQUE ( NAME ) ;
ALTER TABLE CPE_RULE_HEADER ADD CONSTRAINT CPE_RULE_HEADER_UNQ_1 UNIQUE ( NAME , RULE_ID , custom_version) ;
ALTER TABLE CPE_USER ADD CONSTRAINT CPE_USER_UNQ_1 UNIQUE ( LOGIN_ID ) ;
ALTER TABLE CPE_USER ADD CONSTRAINT CPE_USER_UNQ_2 UNIQUE ( AUTH_USER_ID ) ;
ALTER TABLE CPE_USER_MESSAGE_TYPE ADD CONSTRAINT CPE_UMT_UNQ_1 UNIQUE ( EVENT_TYPE ) ;
ALTER TABLE CPE_USER_TYPE ADD CONSTRAINT CPE_USER_TYPE_UNQ_1 UNIQUE ( USER_TYPE ) ;
ALTER TABLE CPE_VIEW_LEVEL ADD CONSTRAINT CPE_VIEW_LEVEL_UNQ_1 UNIQUE ( VIEW_TYPE ) ;


PROMPT Now add referential constraints
ALTER TABLE CPE_APP_LOG_LIST
	ADD CONSTRAINT CPE_APP_LOG_LIST_FK_1 FOREIGN KEY ( APPLIANCE_ID ) REFERENCES CPE_APP_CLUSTER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_AZURE_VM
	ADD CONSTRAINT CPE_AZURE_VM_FK_1 FOREIGN KEY ( AZURE_PARENT_ID ) REFERENCES CPE_RESOURCE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_GROUP_FUNCTIONAL_TYPE
	ADD CONSTRAINT CPE_GFT_FK_1 FOREIGN KEY ( OWNER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_GROUP_GFT_MEMBER
	ADD CONSTRAINT CPE_GROUP_GFT_MEMBER_FK_1 FOREIGN KEY ( GROUP_ID ) REFERENCES CPE_GROUP_FUNCTIONAL_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_GROUP_GFT_MEMBER
	ADD CONSTRAINT CPE_GROUP_GFT_MEMBER_FK_2 FOREIGN KEY ( RESOURCE_ID ) REFERENCES CPE_RESOURCE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_GROUP_GRT_MEMBER
	ADD CONSTRAINT CPE_GROUP_GRT_MEMBER_FK_1 FOREIGN KEY ( GROUP_ID ) REFERENCES CPE_GROUP_RESOURCE_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_GROUP_GRT_MEMBER
	ADD CONSTRAINT CPE_GROUP_GRT_MEMBER_FK_2 FOREIGN KEY ( GROUP_RESOURCE_TYPE_ID ) REFERENCES CPE_RESOURCE_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_GROUP_GRT_MEMBER
	ADD CONSTRAINT CPE_GROUP_GRT_MEMBER_FK_3 FOREIGN KEY ( RESOURCE_ID ) REFERENCES CPE_RESOURCE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_GROUP_RESOURCE_TYPE
	ADD CONSTRAINT CPE_GRT_FK_1 FOREIGN KEY ( OWNER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_GROUP_RESOURCE_TYPE
	ADD CONSTRAINT CPE_GRT_FK_2 FOREIGN KEY ( RESOURCE_TYPE_ID ) REFERENCES CPE_RESOURCE_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_ORGANIZATION
	ADD CONSTRAINT CPE_ORGANIZATION_FK_1 FOREIGN KEY ( PARENT_ID ) REFERENCES CPE_ORGANIZATION ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_ORGANIZATION
	ADD CONSTRAINT CPE_ORGANIZATION_FK_2 FOREIGN KEY ( OWNER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE
	ADD CONSTRAINT CPE_PROFILE_FK_1 FOREIGN KEY ( OWNER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE
	ADD CONSTRAINT CPE_PROFILE_FK_2 FOREIGN KEY ( RESOURCE_TYPE_ID ) REFERENCES CPE_RESOURCE_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_SUPPORT_MATRIX
	ADD CONSTRAINT CPE_PROFILE_SM_FK_1 FOREIGN KEY ( PROFILE_ID ) REFERENCES CPE_PROFILE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_SUPPORT_MATRIX
	ADD CONSTRAINT CPE_PROFILE_SM_FK_2 FOREIGN KEY ( RESOURCE_TYPE_ID ) REFERENCES CPE_RESOURCE_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_SUPPORT_MATRIX
	ADD CONSTRAINT CPE_PROFILE_SM_FK_3 FOREIGN KEY ( RESOURCE_VERSION_ID ) REFERENCES CPE_RESOURCE_VERSION ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_INFO
	ADD CONSTRAINT CPE_PROFILE_INFO_FK_1 FOREIGN KEY ( PROFILE_ID ) REFERENCES CPE_PROFILE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_MEMBER_RULE_PARAMETER
	ADD CONSTRAINT CPE_PROFILE_MEMBER_FK_1v1 FOREIGN KEY ( PROFILE_MEMBER_ID ) REFERENCES CPE_PROFILE_MEMBER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_MEMBER
	ADD CONSTRAINT CPE_PROFILE_MEMBER_FK_1 FOREIGN KEY ( PROFILE_ID ) REFERENCES CPE_PROFILE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_MEMBER
	ADD CONSTRAINT CPE_PROFILE_MEMBER_FK_2 FOREIGN KEY ( CRITICALITY_ID ) REFERENCES CPE_CRITICALITY_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_MEMBER
	ADD CONSTRAINT CPE_PROFILE_MEMBER_FK_3 FOREIGN KEY ( BASE_RULE_ID ) REFERENCES CPE_RULE_HEADER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_MEMBER
	ADD CONSTRAINT CPE_PROFILE_MEMBER_FK_4 FOREIGN KEY ( PARENT_PROFILE_ID ) REFERENCES CPE_PROFILE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_PROFILE_MEMBER
	ADD CONSTRAINT CPE_PROFILE_MEMBER_FK_5 FOREIGN KEY ( OVERRIDE_CREATED_BY ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE
	ADD CONSTRAINT CPE_RESOURCE_FK_1 FOREIGN KEY ( RESOURCE_TYPE_ID ) REFERENCES CPE_RESOURCE_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE
	ADD CONSTRAINT CPE_RESOURCE_FK_2 FOREIGN KEY ( RESOURCE_VERSION_ID ) REFERENCES CPE_RESOURCE_VERSION ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE
	ADD CONSTRAINT CPE_RESOURCE_FK_3 FOREIGN KEY ( OWNER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_LOG_DETAIL
	ADD CONSTRAINT CPE_RESOURCE_LOG_DETAIL_FK_1 FOREIGN KEY ( RESOURCE_LOG_ID ) REFERENCES CPE_RESOURCE_LOG ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_LOG_DETAIL
	ADD CONSTRAINT CPE_RESOURCE_LOG_DETAIL_FK_2 FOREIGN KEY ( RULE_ID ) REFERENCES CPE_RULE_HEADER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_LOG_DETAIL
	ADD CONSTRAINT CPE_RESOURCE_LOG_DETAIL_FK_3 FOREIGN KEY ( RULE_FUNCTIONAL_GROUP_ID )
        REFERENCES CPE_RULE_FUNCTIONAL_GROUP_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_LOG_DETAIL
	ADD CONSTRAINT CPE_RESOURCE_LOG_DETAIL_FK_4 FOREIGN KEY ( RESOURCE_VERSION_ID ) REFERENCES CPE_RESOURCE_VERSION ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_LOG
	ADD CONSTRAINT CPE_RESOURCE_LOG_FK_1 FOREIGN KEY ( RESOURCE_MGMT_ID ) REFERENCES CPE_RESOURCE_MGMT ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_LOG
	ADD CONSTRAINT CPE_RESOURCE_LOG_FK_2 FOREIGN KEY ( PROFILE_INFO_ID ) REFERENCES CPE_PROFILE_INFO ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_MGMT
	ADD CONSTRAINT CPE_RESOURCE_MGMT_FK_1 FOREIGN KEY ( OWNER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_MGMT
	ADD CONSTRAINT CPE_RESOURCE_MGMT_FK_2 FOREIGN KEY ( RESOURCE_ID ) REFERENCES CPE_RESOURCE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_MGMT
	ADD CONSTRAINT CPE_RESOURCE_MGMT_FK_3 FOREIGN KEY ( PROFILE_ID ) REFERENCES CPE_PROFILE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_MGMT
	ADD CONSTRAINT CPE_RESOURCE_MGMT_FK_4 FOREIGN KEY ( LAST_RUN_ID ) REFERENCES CPE_RESOURCE_LOG ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_MGMT
    ADD CONSTRAINT CPE_RESOURCE_MGMT_FK_5 FOREIGN KEY ( GROUP_ID ) REFERENCES CPE_GROUP_FUNCTIONAL_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_TYPE
	ADD CONSTRAINT CPE_RESOURCE_TYPE_FK_1 FOREIGN KEY ( REF_PROFILE_ID ) REFERENCES CPE_PROFILE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RESOURCE_VERSION
	ADD CONSTRAINT CPE_RESOURCE_VERSION_FK_1 FOREIGN KEY ( RESOURCE_TYPE ) REFERENCES CPE_RESOURCE_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RULE
	ADD CONSTRAINT CPE_RULE_FK_1 FOREIGN KEY ( RESOURCE_VERSION_ID ) REFERENCES CPE_RESOURCE_VERSION ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RULE
	ADD CONSTRAINT CPE_RULE_FK_2 FOREIGN KEY ( BASE_RULE_ID ) REFERENCES CPE_RULE_HEADER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RULE_HEADER
	ADD CONSTRAINT CPE_RULE_HEADER_FK_1 FOREIGN KEY ( CRITICALITY_ID ) REFERENCES CPE_CRITICALITY_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RULE_HEADER
	ADD CONSTRAINT CPE_RULE_HEADER_FK_2 FOREIGN KEY ( RULE_FUNC_TYPE_ID ) REFERENCES CPE_RULE_FUNCTIONAL_GROUP_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RULE_PARAMETER
	ADD CONSTRAINT CPE_RULE_PARAMETER_FK_1 FOREIGN KEY ( RULE_ID ) REFERENCES CPE_RULE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER
	ADD CONSTRAINT CPE_USER_FK_1 FOREIGN KEY ( PARENT_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER
	ADD CONSTRAINT CPE_USER_FK_2 FOREIGN KEY ( AUTH_TYPE_ID ) REFERENCES CPE_AUTH_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER
	ADD CONSTRAINT CPE_USER_FK_3 FOREIGN KEY ( USER_TYPE_ID ) REFERENCES CPE_USER_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER
	ADD CONSTRAINT CPE_USER_FK_4 FOREIGN KEY ( USER_ORG_ID ) REFERENCES CPE_ORGANIZATION ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER_MESSAGES
	ADD CONSTRAINT CPE_USER_MESSAGES_FK_1 FOREIGN KEY ( TARGET_USER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER_MESSAGES
	ADD CONSTRAINT CPE_USER_MESSAGES_FK_2 FOREIGN KEY ( EVENT_TYPE_ID ) REFERENCES CPE_USER_MESSAGE_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER_PREFERENCE
	ADD CONSTRAINT CPE_USER_PREFERENCE_FK_1 FOREIGN KEY ( USER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER_PROFILE
	ADD CONSTRAINT CPE_USER_PROFILE_FK_1 FOREIGN KEY ( PERMITTED_USER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER_PROFILE
	ADD CONSTRAINT CPE_USER_PROFILE_FK_2 FOREIGN KEY ( GRANTED_BY_USER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER_PROFILE
	ADD CONSTRAINT CPE_USER_PROFILE_FK_3 FOREIGN KEY ( PROFILE_ID ) REFERENCES CPE_PROFILE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER_RELATION
	ADD CONSTRAINT CPE_USER_RELATION_FK_1 FOREIGN KEY ( CHILD_ID ) REFERENCES CPE_USER_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USER_RELATION
	ADD CONSTRAINT CPE_USER_RELATION_FK_2 FOREIGN KEY ( PARENT_ID ) REFERENCES CPE_USER_TYPE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RES_MGMT_EXCEPTION
	ADD CONSTRAINT CPE_RES_MGMT_EXCEPTION_FK_1 FOREIGN KEY ( RESOURCE_MGMT_ID ) REFERENCES CPE_RESOURCE_MGMT ( ID ) ON DELETE CASCADE ;
-- ALTER TABLE CPE_RES_MGMT_EXCEPTION
--	ADD CONSTRAINT CPE_RES_MGMT_EXCEPTION_FK_2 FOREIGN KEY ( PROFILE_MEMBER_ID ) REFERENCES CPE_PROFILE_MEMBER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_RES_MGMT_EXCEPTION
	ADD CONSTRAINT CPE_RES_MGMT_EXCEPTION_FK_3 FOREIGN KEY ( OVERRIDE_CREATED_BY ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USAGE_LOG
	ADD CONSTRAINT CPE_USAGE_LOG_FK_1 FOREIGN KEY ( USER_ID ) REFERENCES CPE_USER ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USAGE_LOG
	ADD CONSTRAINT CPE_USAGE_LOG_FK_2 FOREIGN KEY ( ORG_ID ) REFERENCES CPE_ORGANIZATION ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USAGE_LOG
	ADD CONSTRAINT CPE_USAGE_LOG_FK_3 FOREIGN KEY ( RESOURCE_ID ) REFERENCES CPE_RESOURCE ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USAGE_LOG
	ADD CONSTRAINT CPE_USAGE_LOG_FK_4 FOREIGN KEY ( RESOURCE_MGMT_ID ) REFERENCES CPE_RESOURCE_MGMT ( ID ) ON DELETE CASCADE ;
ALTER TABLE CPE_USAGE_LOG
	ADD CONSTRAINT CPE_USAGE_LOG_FK_5 FOREIGN KEY ( user_type_id ) REFERENCES CPE_USER_TYPE ( ID ) ON DELETE CASCADE ;

PROMPT add check constraints
ALTER TABLE CPE_APP_CLUSTER ADD CONSTRAINT CPE_APP_CLUSTER_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_APP_LOG_LIST ADD CONSTRAINT CPE_APP_LOG_LIST_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_AUTH_TYPE ADD CONSTRAINT CPE_AUTH_TYPE_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_AZURE_VM ADD CONSTRAINT CPE_AZURE_VM_CHK1 CHECK (registered IN ('Y','N') );
ALTER TABLE CPE_CRITICALITY_TYPE ADD CONSTRAINT CPE_CRITICALITY_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_GROUP_FUNCTIONAL_TYPE ADD CONSTRAINT CPE_GFT_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_GROUP_GFT_MEMBER ADD CONSTRAINT CPE_GROUP_GFT_MEMBER_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_GROUP_GRT_MEMBER ADD CONSTRAINT CPE_GROUP_GRT_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_GROUP_RESOURCE_TYPE ADD CONSTRAINT CPE_GRT_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_MEMBER_RULE_PARAMETER ADD CONSTRAINT CPE_MRP_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_ORGANIZATION ADD CONSTRAINT CPE_ORGNIZATION_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_PROFILE ADD CONSTRAINT CPE_PROFILE_CHK1 CHECK (is_active IN ('Y','N','I','R') );
ALTER TABLE CPE_PROFILE_SUPPORT_MATRIX ADD CONSTRAINT CPE_PROFILE_SM_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_PROFILE_INFO ADD CONSTRAINT CPE_PROFILE_INFO_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_PROFILE_MEMBER ADD CONSTRAINT CPE_PROFILE_MEMBER_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_VIEW_LEVEL ADD CONSTRAINT CPE_VIEW_LEVEL_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RESOURCE ADD CONSTRAINT CPE_RESOURCE_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RESOURCE_MGMT ADD CONSTRAINT CPE_RESOURCE_MGMT_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RESOURCE_MGMT ADD CONSTRAINT CPE_RESOURCE_MGMT_CHK2 CHECK (run_remediate IN ('Y','N') );
ALTER TABLE CPE_RES_MGMT_EXCEPTION ADD CONSTRAINT CPE_RES_MGMT_EXCEPTION_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RESOURCE_TYPE ADD CONSTRAINT CPE_RESOURCE_TYPE_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RESOURCE_VERSION ADD CONSTRAINT CPE_RESOURCE_VERSION_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RULE ADD CONSTRAINT CPE_RULE_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RULE_FUNCTIONAL_GROUP_TYPE ADD CONSTRAINT CPE_RFGT_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RULE_HEADER ADD CONSTRAINT CPE_RULE_HEADER_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_RULE_PARAMETER ADD CONSTRAINT CPE_RULE_PARAMETER_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_USER ADD CONSTRAINT CPE_USER_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_USER ADD CONSTRAINT CPE_USER_CHK2 CHECK (remediate_priviledge IN ('Y','N') );
ALTER TABLE CPE_USER ADD CONSTRAINT CPE_USER_CHK3 CHECK (RES_VIEW_TYPE IN ('User','Org','All_Org') );
ALTER TABLE CPE_USER ADD CONSTRAINT CPE_USER_CHK4 CHECK (USER_VIEW_TYPE IN ('User','Org','All_Org','N/A') );
ALTER TABLE CPE_USER_MESSAGES ADD CONSTRAINT CPE_USER_MESSAGES_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_USER_MESSAGE_TYPE ADD CONSTRAINT CPE_USER_MESSAGE_TYPE_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_USER_PREFERENCE ADD CONSTRAINT CPE_USER_PREFERENCE_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_USER_PROFILE ADD CONSTRAINT CPE_USER_PROFILE_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_USER_RELATION ADD CONSTRAINT CPE_USER_RELATION_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_USER_TYPE ADD CONSTRAINT CPE_USER_TYPE_CHK1 CHECK (is_active IN ('Y','N') );
ALTER TABLE CPE_USER_MESSAGE_TYPE ADD CONSTRAINT CPE_USER_MTYPE_CHK1
            CHECK ( event_category  IN ('Info','Warn','Error') );
ALTER TABLE CPE_USER_MESSAGE_TYPE ADD CONSTRAINT CPE_USER_MTYPE_CHK2
            CHECK ( event_entity  IN ('User','Profile','Resource','Org') );

ALTER TABLE CPE_RES_MGMT_EXCEPTION ADD CONSTRAINT CPE_RES_MGMT_EXCEPTION_CHK2 CHECK (override_type IN ('S','K','M','R') );

PROMPT add some data as triggers to make sure no one deletes any data....only makes it inactive
CREATE OR REPLACE TRIGGER "CPE_AUTH_TYPE_TRIG0" before delete on CPE_AUTH_TYPE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_AUTH_TYPE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_CRITICALITY_TYPE_TRIG0" before delete on CPE_CRITICALITY_TYPE  for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_CRITICALITY_TYPE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GFT_TRIG0" before delete on CPE_GROUP_FUNCTIONAL_TYPE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_GFT_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_GFT_MEMBER_TRIG0" before delete on CPE_GROUP_GFT_MEMBER for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_GROUP_GFT_MEMBER_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_GRT_MEMBER_TRIG0" before delete on CPE_GROUP_GRT_MEMBER for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_GROUP_GRT_MEMBER_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_RESOURCE_TYPE_TRIG0" before delete on CPE_GROUP_RESOURCE_TYPE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_GROUP_RESOURCE_TYPE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_MRP_TRIG0" before delete on CPE_MEMBER_RULE_PARAMETER for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_MRP_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_ORGANIZATION_TRIG0" before delete on CPE_ORGANIZATION for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_ORGANIZATION_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_PROFILE_TRIG0" before delete on CPE_PROFILE  for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_PROFILE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_PROFILE_SM_TRIG0" before delete on CPE_PROFILE_SUPPORT_MATRIX  for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_PROFILE_SM_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_PROFILE_INFO_TRIG0" before delete on CPE_PROFILE_INFO for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_PROFILE_INFO_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_PROFILE_MEMBER_TRIG0" before delete on CPE_PROFILE_MEMBER for each row
begin
--    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
   null;
end;
/
ALTER TRIGGER "CPE_PROFILE_MEMBER_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_VIEW_LEVEL_TRIG0" before delete on CPE_VIEW_LEVEL for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_VIEW_LEVEL_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_TRIG0" before delete on CPE_RESOURCE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RESOURCE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_LOG_TRIG0" before delete on CPE_RESOURCE_LOG for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RESOURCE_LOG_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_LOG_DETAIL_TRIG0" before delete on CPE_RESOURCE_LOG_DETAIL for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RESOURCE_LOG_DETAIL_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_MGMT_TRIG0" before delete on CPE_RESOURCE_MGMT  for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RESOURCE_MGMT_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_TYPE_TRIG0" before delete on CPE_RESOURCE_TYPE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RESOURCE_TYPE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RES_MGMT_EXCEPTION_TRIG0" before delete on CPE_RES_MGMT_EXCEPTION for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RES_MGMT_EXCEPTION_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_VERSION_TRIG0" before delete on CPE_RESOURCE_VERSION for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RESOURCE_VERSION_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_TRIG0" before delete on CPE_RULE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RULE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RFGT_TRIG0" before delete on CPE_RULE_FUNCTIONAL_GROUP_TYPE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RFGT_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_HEADER_TRIG0" before delete on CPE_RULE_HEADER for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RULE_HEADER_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_PARAMETER_TRIG0" before delete on CPE_RULE_PARAMETER for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_RULE_PARAMETER_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_TRIG0" before delete on CPE_USER for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_USER_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_MESSAGES_TRIG0" before delete on CPE_USER_MESSAGES for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_USER_MESSAGES_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_MESSAGE_TYPE_TRIG0" before delete on CPE_USER_MESSAGE_TYPE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_USER_MESSAGE_TYPE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_PREFERENCE_TRIG0" before delete on CPE_USER_PREFERENCE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_USER_PREFERENCE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_PROFILE_TRIG0" before delete on CPE_USER_PROFILE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_USER_PROFILE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_RELATION_TRIG0" before delete on CPE_USER_RELATION for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_USER_RELATION_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_TYPE_TRIG0" before delete on CPE_USER_TYPE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_USER_TYPE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_SYS_ERROR_MESSAGE_TRIG0" before delete on CPE_SYS_ERROR_MESSAGE for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_SYS_ERROR_MESSAGE_TRIG0" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USAGE_LOG_TRIG0" before delete on CPE_USAGE_LOG for each row
begin
    raise_application_error( -20032, 'Error : 20032 : Can not delete this record');
end;
/
ALTER TRIGGER "CPE_USAGE_LOG_TRIG0" ENABLE;
/
PROMPT now the regular stuff....insert update ....
create or replace TRIGGER Appliance_Details_TRIG1 before INSERT ON Appliance_Details for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "Appliance_Details_TRIG1" ENABLE;
/
create or replace TRIGGER CPE_APP_LOG_LIST_TRIG1 before INSERT ON CPE_APP_LOG_LIST for each row
begin
select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_APP_LOG_LIST_TRIG1" ENABLE;
/
create or replace TRIGGER CPE_APP_CLUSTER_TRIG1 before INSERT ON CPE_APP_CLUSTER for each row
begin
select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_APP_CLUSTER_TRIG1" ENABLE;
/
create or replace TRIGGER "CPE_APP_CLUSTER_TRIG2" before update on CPE_APP_CLUSTER for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_APP_CLUSTER_TRIG2"  ENABLE;
/
create or replace TRIGGER "CPE_AUTH_TYPE_TRIG1" before insert on CPE_AUTH_TYPE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_AUTH_TYPE_TRIG1"  ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_CRITICALITY_TYPE_TRIG1" before insert on CPE_CRITICALITY_TYPE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_CRITICALITY_TYPE_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GFT_TRIG1" before insert on CPE_GROUP_FUNCTIONAL_TYPE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_GFT_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_GFT_MEMBER_TRIG1" before insert on CPE_GROUP_GFT_MEMBER for each row
DECLARE
    v_ver number;
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_GROUP_GFT_MEMBER_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_GRT_MEMBER_TRIG1" before insert on CPE_GROUP_GRT_MEMBER for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_GROUP_GRT_MEMBER_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_RESOURCE_TYPE_TRIG1" before insert on CPE_GROUP_RESOURCE_TYPE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_GROUP_RESOURCE_TYPE_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_MRP_TRIG1" before insert on CPE_MEMBER_RULE_PARAMETER for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_MRP_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_ORGANIZATION_TRIG1" before insert on CPE_ORGANIZATION for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      select 0,0,0 into :new.usage_resource, :new.usage_runs, :new.usage_cost from dual;
end;
/
ALTER TRIGGER "CPE_ORGANIZATION_TRIG1" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_TRIG1" before insert on CPE_PROFILE for each row
declare
v_id number(16);
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      select 'I' into :new.IS_ACTIVE from dual;
      v_id := 0 ;
      begin
         select nvl(ref_profile_id,0) into v_id from cpe_resource_type
              where id = :new.resource_type_id;
         exception when others then v_id := 0;
      end;
      if v_id > 0 then select v_id into :new.profile_ref_id from dual; end if;
      begin
        select nvl(max(version)+1,1) into :new.version from cpe_profile
        where owner_id = :new.owner_id and name = :new.name and profile_type = :new.profile_type;
      exception
        when no_data_found then select 1 into :new.version from dual;
      end;
      v_id := 100;
      begin
	      select b.priviledge_type into v_id from cpe_user a, cpe_user_type b
            where  a.id = :new.owner_id and a.is_active ='Y' and
                b.id = a.user_type_id;
        exception
	      when no_data_found then raise_application_error ( -20000, 'Error : -20000 : User not found' );
	      when others then raise_application_error ( -20000, 'Error : -20000' );
      end;
      if v_id > 19 then
         raise_application_error ( -20000, 'Error : -20000 : Profile needs to be owned by SA and above');
      end if;
end;
/
ALTER TRIGGER "CPE_PROFILE_TRIG1" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_SM_TRIG1" before insert on CPE_PROFILE_SUPPORT_MATRIX for each row
declare
v_id number (16);
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      begin
        select b.id into v_id
        from cpe_resource_type a, cpe_resource_version b
        where a.id = :new.resource_type_id and a.is_active = 'Y' and a.id = b.resource_type
          and b.id = :new.resource_version_id and b.is_active = 'Y';
      exception
        when no_data_found then
             raise_application_error( -20000, 'Error : Support matrix need active resource type and version');
        when others then raise_application_error( -20000, 'Error : Unknown error');
      end;
      begin
        select a.id into v_id
        from cpe_profile a , cpe_resource_type b
        where a.id = :new.profile_id and a.is_active in ('Y','I')  and a.resource_type_id = :new.resource_type_id
          and b.id = a.resource_type_id and b.is_active = 'Y';
      exception
        when no_data_found then
             raise_application_error( -20000, 'Error : Support matrix needs SAME resource type for profile and matrix');
        when others then raise_application_error( -20000, 'Error : Unknown error');
      end;
end;
/
ALTER TRIGGER "CPE_PROFILE_SM_TRIG1" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_SM_TRIG2" before update on CPE_PROFILE_SUPPORT_MATRIX for each row
declare
v_id number (16);
begin
     if updating('id') OR updating ('profile_id') OR updating ('resource_type_id')
        OR updating('resource_version_id')  then
             raise_application_error( -20000, 'Error : you can not update these attributes');
     end if;
end;
/
ALTER TRIGGER "CPE_PROFILE_SM_TRIG2" ENABLE;
/

CREATE OR REPLACE TRIGGER "CPE_PROFILE_INFO_TRIG1" before insert on CPE_PROFILE_INFO for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_PROFILE_INFO_TRIG1" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_MEMBER_TRIG1" before insert on CPE_PROFILE_MEMBER for each row
DECLARE
  v_status varchar2 (1); v_id number (16);
  v_s1 number (8,3); v_s2 number (8,3);
  pragma autonomous_transaction;
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;

      begin
         select is_active into v_status from cpe_profile where id = :new.profile_id;
      exception
         when no_data_found then raise_application_error( -20000, 'Error : 20000');
      end;
      if (v_status = 'Y') THEN raise_application_error( -20027, 'Error : 20027'); end if;
      if (v_status = 'N') THEN raise_application_error( -20028, 'Error : 20028'); end if;


end;
/
ALTER TRIGGER "CPE_PROFILE_MEMBER_TRIG1" ENABLE;
/
create or replace TRIGGER "CPE_VIEW_LEVEL_TRIG1" before insert on CPE_VIEW_LEVEL for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_VIEW_LEVEL_TRIG1"  ENABLE;
/
create or replace TRIGGER "CPE_RESOURCE_TRIG1" before insert on CPE_RESOURCE for each row
DECLARE
v_id number(16);v_quota number(16); v_usage number(16); v_err number(1);
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
             start with id = ( select user_org_id from cpe_user where id = :new.owner_id) ;
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      if :new.created_by is null then
         select login_id into :new.created_by from cpe_user where id = :new.owner_id and is_active = 'Y';
      end if;
      v_id := 0 ;
      begin
         select id into v_id from cpe_user where id = :new.owner_id and is_active ='Y';
      exception
          when others then v_id := 0 ;
      end;
      if v_id = 0 then
         raise_application_error ( -20017, 'Error : 20017 : Unknown owner OR owner is not active');
      end if;
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
      if v_err = 1 then
         raise_application_error ( -20030, 'Error : 20030');
      else
         open c1;
         loop
            FETCH c1 into v_id,v_quota,v_usage; EXIT WHEN c1%notfound;
            begin
               update cpe_user set usage_resource = v_usage + 1 where id = v_id;
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
               update cpe_organization set usage_resource = v_usage + 1 where id = v_id;
               commit;
            exception
               when others then raise_application_error ( -20001, 'Error : 20001 : Error updating cpe_organization');
            end;
         end loop;
         close c2;
      end if;
end;

/
ALTER TRIGGER "CPE_RESOURCE_TRIG1" ENABLE;
/

create or replace TRIGGER "CPE_RESOURCE_TRIG2" after insert on CPE_RESOURCE for each row
DECLARE
v_id number(16);v_name varchar2(64);v_login varchar2(64);v_org_name varchar2(64);
cursor c1 is select id,login_id from cpe_user
             where is_active = 'Y'
             connect by prior parent_id = id start with id = :new.owner_id;
cursor c2 is select name from cpe_organization
             where is_active = 'Y'
             connect by prior parent_id = id
             start with id = ( select user_org_id from cpe_user where id = :new.owner_id and is_active = 'Y' ) ;
begin
    select login_id into v_name from cpe_user where id = :new.owner_id and is_active = 'Y';
	--insert into cpe_usage_log ( event_trigger_by, user_id, resource_id, event_type, event_trigger, event_value, created_by,org_id,USER_TYPE_ID,severity )
         --values ( :new.owner_id, :new.owner_id, :new.id , 'New resource added', 'Registered a new resource: '  || :new.name , 1 , v_name,v_org_id,user_type_id,6) ;
    open c1;
    loop
         FETCH c1 into v_id,v_login; EXIT WHEN c1%notfound;
         insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
         values ( v_id , ( select id from cpe_user_message_type where event_type = 8 and is_active = 'Y'),
                  'Hello ' || v_login || '  :  '|| v_name || ' registered new resource and your usage is increased  by 1',v_name);
    end loop;
    close c1;
    open c2;
    loop
         FETCH c2 into v_org_name; EXIT WHEN c2%notfound;
         insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by )
         values ( :new.owner_id, ( select id from cpe_user_message_type where event_type = 8 and is_active = 'Y'), 'Hello ' || v_org_name || '  :  '|| v_name || ' registered new resource and your usage is increased  by 1' , v_name) ;
    end loop;
    close c2;
end;

/
ALTER TRIGGER "CPE_RESOURCE_TRIG2" ENABLE;
/

CREATE OR REPLACE TRIGGER "CPE_RESOURCE_LOG_TRIG1" before insert on CPE_RESOURCE_LOG for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_RESOURCE_LOG_TRIG1" ENABLE;
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
               (sum((case rule_status when '1' then 1 when '0' then -1 when '-1' then -1 else 0 end) * rule_weight)) + sum(rule_weight)) / (2 * sum(rule_weight)) * 100 as decimal(8,2))) into v_health
               from cpe_resource_log_detail where resource_log_id = v_rlog_id and rule_status != -2;
             update cpe_resource_log set overall_health = v_health  where id = v_rlog_id;
          end if;
       end if;
    end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_LOG_DETAIL_TRIG1" ENABLE;
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
--      select ( :new.schedule_start_time + :new.schedule_frequency/1440   ) into :new.schedule_next_run_time from dual;
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
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_TYPE_TRIG1" before insert on CPE_RESOURCE_TYPE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_TYPE_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_VERSION_TRIG1" before insert on CPE_RESOURCE_VERSION for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_VERSION_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_TRIG1" before insert on CPE_RULE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_RULE_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RFGT_TRIG1" before insert on CPE_RULE_FUNCTIONAL_GROUP_TYPE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_RFGT_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_HEADER_TRIG1" before insert on CPE_RULE_HEADER for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      begin
        select nvl(max(custom_version)+1,1)  into :new.custom_version from cpe_rule_header
        where rule_id = :new.rule_id and name = :new.name and
              (  (nvl(fix_text,'a') != nvl(:new.fix_text,'a'))  OR (nvl(check_text,'a') != nvl(:new.check_text,'a')) );
      exception
        when no_data_found then select 1 into :new.custom_version from dual;
      end;
end;
/
ALTER TRIGGER "CPE_RULE_HEADER_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_PARAMETER_TRIG1" before insert on CPE_RULE_PARAMETER for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_RULE_PARAMETER_TRIG1" ENABLE;
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
CREATE OR REPLACE TRIGGER "CPE_USER_MESSAGES_TRIG1" before insert on CPE_USER_MESSAGES for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      select SYSDATE into :new.message_date from dual;
      select 'N' into :new.read_status from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_USER_MESSAGES_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_MESSAGE_TYPE_TRIG1" before insert on CPE_USER_MESSAGE_TYPE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_USER_MESSAGE_TYPE_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_PREFERENCE_TRIG1" before insert on CPE_USER_PREFERENCE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_USER_PREFERENCE_TRIG1" ENABLE;
/
create or replace TRIGGER "CPE_USER_PROFILE_TRIG1" before insert on CPE_USER_PROFILE for each row
DECLARE
v_id number(16); v_login varchar2(1024); v_id2 number(16);
pragma autonomous_transaction;
cursor c1 is select id,login_id from cpe_user where  id <> :new.permitted_user_id and is_active='Y'
connect by prior parent_id=id start with id = :new.permitted_user_id;
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      if :new.granted_date is null then select sysdate into :new.granted_date from dual; end if;
      v_id := 0 ;
      begin
        select id into v_id from cpe_user_profile
        where profile_id = :new.profile_id and is_active = 'Y' and permitted_user_id = :new.permitted_user_id;
      exception
        when others then v_id := 0 ;
      end;
      if v_id > 0 then
--         update cpe_user_profile set is_active = 'N' where id = v_id;
--         commit;
         raise_application_error ( -20000, '20000: User already has access to profile');
      end if;
      open c1;
      loop
         fetch c1 into v_id,v_login; exit when c1%notfound;
         begin
             select id into v_id2 from cpe_user_profile
             where profile_id = :new.profile_id and is_active = 'Y' and permitted_user_id = v_id;
         exception
             when others then v_id2 := 0 ;
         end;
         if v_id2 = 0 then
            insert into cpe_user_profile ( profile_id,permitted_user_id,granted_by_user_id )
            values ( :new.profile_id, v_id, :new.granted_by_user_id) ;
            commit;
            insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
            values ( v_id , ( select id from cpe_user_message_type where event_type = 14 and is_active = 'Y'),
                  'Hello ' || v_login || '  :  '||
                  ' You are granted access to profile '|| (select name from cpe_profile where id= :new.profile_id)
                  ,(select login_id from cpe_user where id = :new.granted_by_user_id)
                  );
             commit;
          end if;
    end loop;
    close c1;
end;
/
ALTER TRIGGER "CPE_USER_PROFILE_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_RELATION_TRIG1" before insert on CPE_USER_RELATION for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_USER_RELATION_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_TYPE_TRIG1" before insert on CPE_USER_TYPE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
end;
/
ALTER TRIGGER "CPE_USER_TYPE_TRIG1" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_SYS_ERROR_MESSAGE_TRIG1" before insert on CPE_SYS_ERROR_MESSAGE for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_SYS_ERROR_MESSAGE_TRIG1" ENABLE;
/

create or replace TRIGGER "CPE_RES_MGMT_EXCEPTION_TRIG1" before insert on CPE_RES_MGMT_EXCEPTION for each row
declare
v_id number(16);v_date timestamp;
v_rule_by_rule number(16);
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      if :new.is_active is null then select 'Y' into :new.is_active from dual ; end if;
      v_rule_by_rule := 0 ;
      begin
         select max(id) into v_rule_by_rule
                from cpe_profile where name ='Rule-by-rule Force Remediation -- Initiated by User'
                and is_active in ('Y','I');
      exception
         when others then v_rule_by_rule := 0 ;
      end;
      if v_rule_by_rule = 0 then
         begin
           select b.id into v_id from cpe_resource_mgmt a, cpe_profile_member b
           where  a.id = :new.resource_mgmt_id and b.profile_id = a.profile_id and
               b.id = :new.profile_member_id and a.is_active = 'Y' and b.is_active = 'Y';
         exception
            when no_data_found then raise_application_error( -20000, 'Error : Profile member not found');
            when others then raise_application_error( -20000, 'Error : Unknown error');
         end;
      end if;
      if ( (:new.override_start_date is null) OR (:new.override_start_date < sysdate) ) then
         raise_application_error( -20000, 'Error : Exception Start date can not be in past');
      end if;
      if ( (:new.override_end_date is null) OR (:new.override_end_date < sysdate) ) then
         raise_application_error( -20000, 'Error : Exception End date can not be in past');
      end if;
      begin
         select schedule_end_time into v_date from cpe_resource_mgmt
         where id = :new.resource_mgmt_id and is_active='Y';
      exception
        when no_data_found then raise_application_error( -20000, 'Error : Res Mgmt record not found');
        when others then raise_application_error( -20000, 'Error : Unknown error');
      end;
      if :new.override_start_date > v_date then
         raise_application_error( -20000, 'Error : Exception Start date can not be post res mgmt end date');
      end if;
      if :new.override_end_date > v_date then
         raise_application_error( -20000, 'Error : Exception End date can not be post res mgmt end date');
      end if;
end;
/
ALTER TRIGGER "CPE_RES_MGMT_EXCEPTION_TRIG1" ENABLE;
/

create or replace TRIGGER "CPE_RES_MGMT_EXCEPTION_TRIG2" before update on CPE_RES_MGMT_EXCEPTION for each row
declare
v_id number(16);v_date timestamp;
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
      if updating ('ID') or updating('resource_mgmt_id') or updating('profile_member_id')
      then
         raise_application_error ( -20000,'Error: you can not update these values');
      end if;
      begin
         select schedule_end_time into v_date from cpe_resource_mgmt
         where id = :old.resource_mgmt_id and is_active='Y';
      exception
        when no_data_found then raise_application_error( -20000, 'Error : Res Mgmt record not found');
        when others then raise_application_error( -20000, 'Error : Unknown error');
      end;
      if updating('override_start_date') then
         if ( (:new.override_start_date is null) OR (:new.override_start_date < sysdate) ) then
            raise_application_error( -20000, 'Error : Exception Start date can not be in past');
         end if;
         if :new.override_start_date > v_date then
            raise_application_error( -20000, 'Error : Exception Start date can not be post res mgmt end date');
         end if;
      end if;
      if updating('override_end_date') then
         if ( (:new.override_end_date is null) OR (:new.override_end_date < sysdate) ) then
            raise_application_error( -20000, 'Error : Exception End date can not be in past');
         end if;
         if :new.override_end_date > v_date then
            raise_application_error( -20000, 'Error : Exception End date can not be post res mgmt end date');
         end if;
      end if;
end;
/
ALTER TRIGGER "CPE_RES_MGMT_EXCEPTION_TRIG2" ENABLE;
/

CREATE OR REPLACE TRIGGER "CPE_USAGE_LOG_TRIG1" before insert on CPE_USAGE_LOG for each row
DECLARE
v_id number(16);
pragma autonomous_transaction;
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
      select to_char(sysdate,'Mon-rrrr') into :new.mon_rrrr from dual;
      -- if ( :new.user_id is NULL AND :new.org_id is NULL ) OR
      --    ( :new.user_id is not NULL AND :new.org_id is not NULL ) then
      --    raise_application_error ( -20000, 'Error: Only one ID is needed' );
      -- else
      --    if :new.user_id is not null then
      --       :new.usage_type := 'USER';
      --    end if;
      --    if :new.org_id is not null then
      --       :new.usage_type := 'ORG';
      --    end if;
      -- end if;
      -- if ( :new.resource_id is NULL AND :new.resource_mgmt_id is NULL ) OR
      --    ( :new.resource_id is not NULL AND :new.resource_mgmt_id is not NULL ) then
      --    raise_application_error ( -20000, 'Error: Only one ID is needed' );
      -- end if;
end;
/
ALTER TRIGGER "CPE_USAGE_LOG_TRIG1" ENABLE;
/

create or replace TRIGGER LDAP_SERVER_CONFIG_TRIG1 before insert on LDAP_SERVER_CONFIG for each row
begin
   select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
   select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "LDAP_SERVER_CONFIG_TRIG1" ENABLE;
/

prompt update triggers
create or replace TRIGGER "CPE_AUTH_TYPE_TRIG2" before update on CPE_AUTH_TYPE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_AUTH_TYPE_TRIG2"  ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_CRITICALITY_TYPE_TRIG2" before update on CPE_CRITICALITY_TYPE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_CRITICALITY_TYPE_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GFT_TRIG2" before update on CPE_GROUP_FUNCTIONAL_TYPE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_GFT_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_GFT_MEMBER_TRIG2" before update on CPE_GROUP_GFT_MEMBER for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_GROUP_GFT_MEMBER_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_GRT_MEMBER_TRIG2" before update on CPE_GROUP_GRT_MEMBER for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_GROUP_GRT_MEMBER_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_GROUP_RESOURCE_TYPE_TRIG2" before update on CPE_GROUP_RESOURCE_TYPE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_GROUP_RESOURCE_TYPE_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_MRP_TRIG2" before update on CPE_MEMBER_RULE_PARAMETER for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_MRP_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_ORGANIZATION_TRIG2" before update on CPE_ORGANIZATION for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_ORGANIZATION_TRIG2" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_TRIG2" before update on CPE_PROFILE for each row
DECLARE
v_id number (16); v_s1 number (8,3); v_s2 number (8,3);
pragma autonomous_transaction;
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
      if (:old.is_active = 'N') THEN raise_application_error( -20028, 'Error : 20028'); end if;
      if ( :new.is_active ='N' ) then
         update cpe_user_profile set is_active= 'N' where profile_id = :old.id and is_active='Y';
         commit;
      end if;

      begin
         select nvl(sum(case a.criticality_id when 6 then 1 when 7 then 2 when 8 then 3 else 0 end),0) into v_s1
         from cpe_profile_member a , cpe_profile b
         where a.is_active='Y' and b.id = a.profile_id and b.id = :old.id;
      exception
         when others then v_s1 := 0 ;
      end;
      begin
         select nvl(b.ref_profile_id,0) into v_id
         from cpe_resource_type b, cpe_profile a
         where b.is_active= 'Y' and a.id = :old.id and b.id = a.resource_type_id;
      exception
          when others then v_id := 0;
      end;
      begin
        select nvl(sum(case a.criticality_id when 6 then 1 when 7 then 2 when 8 then 3 else 0 end),0) into v_s2
        from cpe_profile_member a, cpe_profile b
        where a.is_active='Y' and b.id = a.profile_id
        and b.id = v_id;
      exception
        when others then v_s2 := 0;
      end ;
      if v_s2 = 0 then
        select v_s2 into :new.profile_strength from dual;
      else
        select ((v_s1 / v_s2) * 100) into :new.profile_strength from dual;
      end if;
      select v_id into :new.profile_ref_id from dual;
end;
/
ALTER TRIGGER "CPE_PROFILE_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_PROFILE_INFO_TRIG2" before update on CPE_PROFILE_INFO for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_PROFILE_INFO_TRIG2" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_MEMBER_TRIG2" before update on CPE_PROFILE_MEMBER for each row
DECLARE
v_status varchar2 (1);v_id number(16);
v_s1 number(8,3); v_s2 number (8,3);
pragma autonomous_transaction;
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
      begin
        select is_active into v_status from cpe_profile where id = :old.profile_id;
      exception
        when no_data_found then raise_application_error( -20000, 'Error : 20000');
      end;
      if (v_status = 'N') THEN raise_application_error( -20028, 'Error : 20028'); end if;


end;
/
ALTER TRIGGER "CPE_PROFILE_MEMBER_TRIG2" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_MEMBER_TRIG3" before delete on CPE_PROFILE_MEMBER for each row
DECLARE
v_status varchar2 (1); v_id number(16);
v_s1 number (8,3); v_s2 number (8,3);
pragma autonomous_transaction;
begin
      begin
        select is_active into v_status from cpe_profile where id = :old.profile_id;
      exception
        when no_data_found then raise_application_error( -20000, 'Error : 20000');
      end;
      if (v_status = 'Y') THEN raise_application_error( -20027, 'Error : 20027'); end if;
      if (v_status = 'N') THEN raise_application_error( -20028, 'Error : 20028'); end if;

end;
/
ALTER TRIGGER "CPE_PROFILE_MEMBER_TRIG3" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_MEMBER_TRIG4" after insert or delete or update on CPE_PROFILE_MEMBER for each row
DECLARE
v_status varchar2 (1); v_profile_id number(16);v_info_id number(16);v_id number(16);
v_s1 number (8,3); v_s2 number (8,3);
pragma autonomous_transaction;
begin
     if inserting then
        v_profile_id := :new.profile_id;
     end if;
     if deleting or updating then
        v_profile_id := :old.profile_id;
     end if;

     begin
         select id into v_info_id from cpe_profile_info where profile_id = v_profile_id;
     exception
         when no_data_found then v_info_id := 0;
     end;

     if v_info_id = 0 then
        begin
           insert into cpe_profile_info (profile_id,PROFILE_INFO, profile_data, profile_mof)
           values ( v_profile_id , xmltype(create_profile_info(v_profile_id)) ,
                    xmltype(create_profile_data(v_profile_id)) ,create_profile_mof(v_profile_id)  );
           commit;
        exception
           when others then raise_application_error( -20000, 'Error : 20000' || v_profile_id );
        end;
     else
        begin
            update cpe_profile_info
            set PROFILE_INFO=xmltype(create_profile_info(v_profile_id)) ,
                profile_data = xmltype(create_profile_data(v_profile_id)) ,
                profile_mof = create_profile_mof(v_profile_id)
            where id = v_info_id;
            commit;
        exception
            when others then raise_application_error( -20000, 'Error : 20000' || v_profile_id );
        end;
      end if;

      begin
          select nvl(sum(case a.criticality_id when 6 then 1 when 7 then 2 when 8 then 3 else 0 end),0) into v_s1
          from cpe_profile_member a , cpe_profile b
          where a.is_active='Y' and b.id = a.profile_id and b.id = v_profile_id;
      exception
         when others then v_s1 := 0 ;
      end;
      begin
         select nvl(b.ref_profile_id,0) into v_id
         from cpe_resource_type b, cpe_profile a
         where b.is_active= 'Y' and a.id = v_profile_id and b.id = a.resource_type_id;
      exception
          when others then v_id := 0;
      end;
      begin
        select nvl(sum(case a.criticality_id when 6 then 1 when 7 then 2 when 8 then 3 else 0 end),0) into v_s2
        from cpe_profile_member a, cpe_profile b
        where a.is_active='Y' and b.id = a.profile_id
        and b.id = v_id;
      exception
        when others then v_s2 := 0;
      end ;
      if v_s2 = 0 then
        update cpe_profile set profile_strength = v_s2 , profile_ref_id = v_id
               where id = v_profile_id;
        commit;
      else
        update cpe_profile set profile_strength = ((v_s1 / v_s2) * 100) , profile_ref_id = v_id
               where id = v_profile_id;
        commit;
      end if;
end;
/
ALTER TRIGGER "CPE_PROFILE_MEMBER_TRIG4" ENABLE;
/

create or replace TRIGGER "CPE_RESOURCE_TRIG3" before update on CPE_RESOURCE for each row
DECLARE
v_found number (1);v_id number(16);v_active varchar2(1);
--pragma autonomous_transaction;

cursor c3 is select id,is_active from cpe_user
             where id <> :old.owner_id
             connect by prior parent_id=id start with id= :old.owner_id ;
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
      if (:old.is_active = 'Y' AND :new.is_active = 'N' ) THEN
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
end;
/
ALTER TRIGGER "CPE_RESOURCE_TRIG3" ENABLE;
/

create or replace TRIGGER "CPE_RESOURCE_TRIG4" after update on CPE_RESOURCE for each row
DECLARE
v_id number(16);v_name varchar2(64);v_login varchar2(64);v_org_name varchar2(64);
cursor c1 is select id from cpe_user where is_active = 'Y'
             connect by prior parent_id = id start with id = :new.owner_id;
cursor c2 is select name from cpe_organization where is_active = 'Y'
             connect by prior parent_id = id
             start with id = ( select user_org_id from cpe_user where id = :new.owner_id and is_active = 'Y') ;
begin
--- not needed as we will allow then to reactivate resource
--    if (:old.is_active = 'N') THEN
--       raise_application_error( -20028, 'Error : 20028');
--    end if;
    if (:old.is_active = 'Y' AND :new.is_active = 'N' ) THEN
       select login_id into v_name from cpe_user where id = :old.owner_id and is_active = 'Y';
	   --insert into cpe_usage_log ( event_trigger_by, user_id, resource_id, event_type, event_trigger, event_value, created_by ,org_id,user_type_id,severity)
          --values ( :old.owner_id, :old.owner_id, :old.id , 'Resource deactivated',  ' Deactivated resource ' || :NEW.name, -1 , v_name,v_org_id,user_type_id,6) ;
       open c1;
       loop
          FETCH c1 into v_id; EXIT WHEN c1%notfound;
          insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
          values ( v_id , ( select id from cpe_user_message_type where event_type = 9 and is_active = 'Y' ),
                  'Hello ' || v_login || '  :  '|| v_name || ' UN-registered resource and your usage is reduced by 1',v_name);
       end loop;
       close c1;
       open c2;
       loop
          FETCH c2 into v_name; EXIT WHEN c2%notfound;
          insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
          values ( :new.owner_id, ( select id from cpe_user_message_type where event_type = 8 and is_active = 'Y'), 'Hello '|| v_name || ' deactivated resource '  || :NEW.name, v_name);
       end loop;
       close c2;

       update cpe_resource_mgmt set is_active='N',
             change_note = change_note || ' [ because resource ' || :old.name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss') || ' ] '
            where owner_id = :old.owner_id and resource_id = :old.id and is_active = 'Y';
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( :old.owner_id ,( select id from cpe_user_message_type where event_type = 9),
               'You scheduled profile application was cancelled because resource ' || :old.name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
               'Profile application cancelled as resource was inactivated' ,'System Generated Event');

     end if;
    if (:old.is_active = 'N' AND :new.is_active = 'Y' ) THEN
       select login_id into v_name from cpe_user where id = :new.owner_id and is_active = 'Y';
	   --insert into cpe_usage_log ( event_trigger_by, user_id, resource_id, event_type, event_trigger, event_value, created_by,org_id,user_type_id,severity )
          --values ( :new.owner_id, :new.owner_id, :new.id , 'Resource activated', 'Activated resource ' || :NEW.name, -1 , v_name,v_org_id,user_type_id,6) ;
       open c1;
       loop
          FETCH c1 into v_id; EXIT WHEN c1%notfound;
         insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
         values ( v_id , ( select id from cpe_user_message_type where event_type = 8 and is_active = 'Y' ),
                  'Hello ' || v_login || '  :  '|| v_name || ' Re-Activated old resource and your usage is increased by 1',v_name);
       end loop;
       close c1;
       open c2;
       loop
          FETCH c2 into v_org_name; EXIT WHEN c2%notfound;
          insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,created_by)
          values ( :new.owner_id, ( select id from cpe_user_message_type where event_type = 8 and is_active = 'Y'), 'Hello '|| v_name || ' updated resource '  || :NEW.name, v_name) ;
       end loop;
       close c2;
     end if;

end;

/
ALTER TRIGGER "CPE_RESOURCE_TRIG4" ENABLE;
/

create or replace TRIGGER "CPE_RESOURCE_TRIG5" after update on CPE_RESOURCE for each row
DECLARE
v_id number(16);v_quota number(16); v_usage number(16); v_err number(1);v_auth_id number(16);
v_old_owner number(16); v_new_owner number(16); v_active varchar2(1);v_found number (1);
pragma autonomous_transaction;
cursor c0 is select id,
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when quota_expiry_date < sysdate then 0
             else quota_resource
             end quota_resource,
             usage_resource from cpe_user
             where is_active = 'Y'
             connect by prior parent_id = id start with id = :old.owner_id;
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
             start with id = ( select user_org_id from cpe_user where id = :old.owner_id and is_active = 'Y') ;
cursor c4 is select id,
             case when quota_expiry_date is null then decode(quota_resource,-1,99999999,quota_resource)
             when quota_expiry_date < sysdate then 0
             else quota_resource
             end quota_resource,
             usage_resource
             from cpe_user
             connect by prior parent_id=id start with id= :new.owner_id;
cursor c5 is select id,is_active from cpe_user
             --where id <> :old.owner_id
             connect by prior parent_id=id start with id= :old.owner_id ;
begin
      if (:old.is_active = 'Y' AND :new.is_active = 'N' ) THEN
         open c0;
         loop
            FETCH c0 into v_id,v_quota,v_usage; EXIT WHEN c0%notfound;
            begin
               update cpe_user set usage_resource = v_usage - 1 where id = v_id;
               commit;
            exception
               when others then raise_application_error ( -20001, 'Error : 20001 : Error updating cpe_user');
            end;
         end loop;
         close c0;
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
       if updating ('owner_id')  and (:old.owner_id <> :new.owner_id) then
         if :new.is_active = 'Y' then
          open c5;
          loop
              FETCH c5 into v_id,v_active; EXIT WHEN c5%notfound;
              if v_active = 'Y' then
                 begin
                   update cpe_user set usage_resource = usage_resource - 1 where id = v_id;
                 exception
                   when others then null;
                 end;
              end if;
          end loop;
          commit;
          close c5;
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
ALTER TRIGGER "CPE_RESOURCE_TRIG5" ENABLE;
/

--CREATE OR REPLACE TRIGGER "CPE_RESOURCE_LOG_DETAIL_TRIG2" before update on CPE_RESOURCE_LOG_DETAIL for each row
--begin
--    raise_application_error( -20032, 'Error : 20032 : Can not update this record');
--end;
--/
--ALTER TRIGGER "CPE_RESOURCE_LOG_DETAIL_TRIG2" ENABLE;
--/

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
end;
/
ALTER TRIGGER "CPE_RESOURCE_MGMT_TRIG2" ENABLE;
/

CREATE OR REPLACE TRIGGER "CPE_RESOURCE_TYPE_TRIG2" before update on CPE_RESOURCE_TYPE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_RESOURCE_TYPE_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RESOURCE_VERSION_TRIG2" before update on CPE_RESOURCE_VERSION for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_RESOURCE_VERSION_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_TRIG2" before update on CPE_RULE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "CPE_RULE_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RFGT_TRIG2" before update on CPE_RULE_FUNCTIONAL_GROUP_TYPE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_RFGT_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_HEADER_TRIG2" before update on CPE_RULE_HEADER for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_RULE_HEADER_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_RULE_PARAMETER_TRIG2" before update on CPE_RULE_PARAMETER for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_RULE_PARAMETER_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_TRIG2" before update on CPE_USER for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_USER_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_MESSAGES_TRIG2" before update on CPE_USER_MESSAGES for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_USER_MESSAGES_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_MESSAGE_TYPE_TRIG2" before update on CPE_USER_MESSAGE_TYPE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_USER_MESSAGE_TYPE_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_PREFERENCE_TRIG2" before update on CPE_USER_PREFERENCE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_USER_PREFERENCE_TRIG2" ENABLE;
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
CREATE OR REPLACE TRIGGER "CPE_USER_RELATION_TRIG2" before update on CPE_USER_RELATION for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_USER_RELATION_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_USER_TYPE_TRIG2" before update on CPE_USER_TYPE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_USER_TYPE_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "CPE_SYS_ERROR_MESSAGE_TRIG2" before update on CPE_SYS_ERROR_MESSAGE for each row
begin
      if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
      select SYSDATE into :new.UPDATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_SYS_ERROR_MESSAGE_TRIG2" ENABLE;
/
CREATE OR REPLACE TRIGGER "LDAP_SERVER_CONFIG_TRIG2" before update on LDAP_SERVER_CONFIG for each row
begin
     if :new.updated_by is null then select user into :new.updated_by from dual ; end if;
     select SYSDATE into :new.UPDATE_DATE from dual; end;
/
ALTER TRIGGER "LDAP_SERVER_CONFIG_TRIG2"  ENABLE;
/

CREATE OR REPLACE TRIGGER "CPE_USAGE_LOG_TRIG2" before update or delete on CPE_USAGE_LOG for each row
begin
    raise_application_error( -20029, 'Error : 20029 : Can not update or delete this record');
end;
/
ALTER TRIGGER "CPE_USAGE_LOG_TRIG2" ENABLE;
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
                  if v_ptype = 0 OR v_ptype <= 20 and v_ptype >= 10 then
                     select sysdate + 7 into v_expiry from dual;
                  else
                     raise_application_error ( -20001, 'Error : 20001 : Error : User does not have suitable parent');
                  end if;
               end if;
               v_found := 1;
               begin
                   select v_id into :new.parent_id from dual;
                   select 0,0,0 into :new.usage_resource, :new.usage_runs ,:new.usage_cost from dual;
                   if :new.user_expiry_date > v_expiry then
                       select v_expiry into :new.user_expiry_date from dual;
                    end if;
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
       if updating ('quota_resource') then
          IF (:new.quota_resource < 0  OR  :new.quota_resource > v_qr )
             THEN raise_application_error( -20005, 'Error : 20005');
          END IF;
          IF (:new.quota_resource < :new.usage_resource  OR  :new.quota_resource < :old.usage_resource )
             THEN raise_application_error( -20033, 'Error : 20033');
          END IF;
       end if;

--       IF ( (:new.quota_runs_per_month  > v_qrpm) OR ( :new.quota_runs_per_month < 0 AND v_qrpm < 99999999 )  )
       if updating ('quota_runs_per_month') then
          IF ( ( :new.quota_runs_per_month < 0 AND v_qrpm < 99999999 )  )
            	THEN raise_application_error( -20006, 'Error : 20006');
          END IF;
       end if;
       if updating ('quota_cost_per_month') then
--       IF ( (:new.quota_cost_per_month  > v_qcpm) OR ( :new.quota_cost_per_month < 0 AND v_qcpm < 99999999 )  )
         IF ( ( :new.quota_cost_per_month < 0 AND v_qcpm < 99999999 )  )
            THEN raise_application_error( -20007, 'Error : 20007' || :new.id);
         END IF;
       end if;
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
-- commenting following check
--      IF :new.user_org_id <> v_uoid THEN
--         begin
--  	       select ID into v_user_org_id FROM CPE_ORGANIZATION
--                 where id = :new.user_org_id and is_active = 'Y'
--	         connect by prior ID = PARENT_ID start with ID = v_uoid;
--  	       exception when no_data_found then raise_application_error( -20026, 'Error : 20026');
--         end;
--      END IF;
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
          raise_application_error( -20205, 'Error : Quota expiry date can not exceed Parent Quota expiry date.');
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
create or replace TRIGGER "CPE_ORGANIZATION_TRIG4"  before INSERT  on CPE_ORGANIZATION for each row
DECLARE
v_id number(16);
v_owner_id number(16);
pragma autonomous_transaction;
begin

   select USER_ORG_ID into v_id from CPE_USER where ID = :new.owner_id and is_active = 'Y' ;

   IF :new.parent_id <> v_id THEN
	   begin
	     select ID into v_owner_id FROM CPE_ORGANIZATION where id = :new.parent_id and is_active = 'Y'
	          connect by prior ID = PARENT_ID start with ID = v_id;
	     exception
	          when no_data_found then v_owner_id := -1;
	    end;
	    IF ( :new.parent_id <> v_owner_id )
	        THEN raise_application_error( -20008, 'Error : 20008');
	    END IF;
    END IF;
end;
/
ALTER TRIGGER "CPE_ORGANIZATION_TRIG4" ENABLE;
/
create or replace TRIGGER CPE_AZURE_VM_TRIG1 before INSERT ON CPE_AZURE_VM for each row
begin
      select CPE_SYSTEM_SEQ.nextval into :new.ID from dual;
      select SYSDATE into :new.CREATE_DATE from dual;
end;
/
ALTER TRIGGER "CPE_AZURE_VM_TRIG1" ENABLE;
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

create or replace TRIGGER "CPE_USER_TRIG5"  before insert or update on CPE_USER for each row
DECLARE

v_priv NUMBER(8);
v_id number(16); v_ut_id number(16);v_date timestamp;
v_res number(8);v_runs number(8);
pragma autonomous_transaction;

begin

   if inserting then
      v_ut_id := :new.user_type_id;
      select sysdate into v_date from dual;
      select 2 into v_res from dual;
      select 5 into v_runs from dual;
   end if;
   if updating then
      v_date := :old.user_expiry_date; v_res := :old.quota_resource;
      v_runs := :old.quota_runs_per_month;
      if updating('user_type_id') then
         v_ut_id := :new.user_type_id;
      else
         v_ut_id := :old.user_type_id;
      end if;
   end if;

   begin
     select priviledge_type into v_priv from cpe_user_type where id = v_ut_id;
   exception
     when others then v_priv := 0;
   end;

   if v_priv > 90 then
      if inserting then
         if :new.user_expiry_date is null then
            select sysdate+5 into :new.user_expiry_date from dual;
         else
            if :new.user_expiry_date > sysdate + 5 then
               raise_application_error (-20201,'Error: Interim User life is only 5 days');
            end if;
        end if;
         if :new.quota_resource is null then
            select 2 into :new.quota_resource from dual;
         else
            if :new.quota_resource > 2 then
               raise_application_error (-20202,'Error: Interim User can only register 2 resources');
            end if;
        end if;
         if :new.quota_runs_per_month is null then
            select 5 into :new.quota_runs_per_month from dual;
         else
            if :new.quota_runs_per_month > 5 then
               raise_application_error (-20203,'Error: Interim User can only run 5 profiles');
            end if;
        end if;
      end if;
      if updating then
        if updating('user_expiry_date') then
           if :new.user_expiry_date > v_date  then
              raise_application_error (-20201,'Error: Interim User life is only 5 days');
           end if;
        end if;
        if updating('quota_resource') then
           if :new.quota_resource > 2 then
              raise_application_error (-20202,'Error: Interim User can only register 2 resources');
           end if;
        end if;
        if updating('quota_runs_per_month') then
           if :new.quota_runs_per_month > 5 then
               raise_application_error (-20203,'Error: Interim User can only run 5 profiles');
           end if;
        end if;
      end if;
   end if;
end;
/
ALTER TRIGGER "CPE_USER_TRIG5" ENABLE;
/

create or replace TRIGGER "CPE_ORGANIZATION_TRIG5"  after update on CPE_ORGANIZATION for each row
DECLARE
v_self_id number(16); v_parent_id number(16);v_parent_name varchar2(64);v_self_name varchar2(64);v_org_id number(16);
c_id number(16);c_message varchar2(1024);c_name varchar2(1024);c_id2 number(16);
type c_cur_cur is ref cursor; c_cur c_cur_cur;
pragma autonomous_transaction;
begin

select nvl(parent_id,-1) into c_id from cpe_organization where id = :old.id;
if c_id < 0 then
    null;
else

select nvl(parent_id,-1) into c_id from cpe_organization
       where id = ( select parent_id from cpe_organization where id = :old.id);
select id,parent_id,name  into v_self_id,v_parent_id,v_self_name from cpe_organization where id = :old.id;
select name into v_parent_name from cpe_organization where id = v_parent_id;

if updating ('is_active') and :new.is_active = 'N' and :old.is_active = 'Y' then
--- this org  is not at top of tree
  if c_id > 0 then

--- 1. all my children go to my parent
    open c_cur for
         'select id,login_id from cpe_user where is_active = :status and user_org_id = :id ' USING 'Y', v_self_id;
    loop
       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
       update cpe_user set user_org_id = v_parent_id where id = c_id;
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( c_id ,( select id from cpe_user_message_type where event_type = 12),
               'You now belong to  '|| v_parent_name || ' because old org ' || v_self_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
               'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 2. all my child orgs go to parent org
       update cpe_organization set parent_id = v_parent_id where parent_id = v_self_id and is_active = 'Y';
       commit;
  else
--- my parent parent is null
--- 1. first  take care of orgs
    open c_cur for
         'select id, name from cpe_organization
          where is_active = :status and id <> :id1
          connect by prior id = parent_id start with id= :id2 '
          USING 'Y', v_self_id , v_self_id ;
    loop
       fetch c_cur into c_id,c_name;exit when c_cur%notfound;
       update cpe_organization set is_active = 'N'  where id = c_id;
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( (select max(id) from cpe_user where parent_id is null) ,
               ( select id from cpe_user_message_type where event_type = 12),
              'Cloud Raxak lost business from '||
               ( select name from cpe_organization where id=v_org_id )
              || ' because the parent org ' || v_self_name || ' and thus the child Org ' || c_name || ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
              'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
--- 2. now make all users unactive
    open c_cur for
       'select id,login_id,parent_id from cpe_user where is_active = :status and user_org_id = :id
               and parent_id = (select max(id) from cpe_user where parent_id is null)
          order by 3 desc '
          USING 'Y', :old.id  ;
    loop
       fetch c_cur into c_id,c_name,c_id2;exit when c_cur%notfound;
       update cpe_user  set is_active = 'N'  where id = c_id and is_active = 'Y';
       insert into cpe_user_messages ( target_user_id, event_type_id, trigger_event,message_text,created_by)
              values ( (select max(id) from cpe_user where parent_id is null) ,
               ( select id from cpe_user_message_type where event_type = 12),
                c_name || ' is being made inactive due to organization '||
                v_self_name ||  ' was made inactive at ' || to_char(sysdate,'dd-Mon-rrrr hh24:mi:ss'),
              'User status changed' ,'System Generated Event');
       commit;
    end loop;
    close c_cur;
  end if;
end if;
end if;
end;
/
ALTER TRIGGER "CPE_ORGANIZATION_TRIG5" ENABLE;
/

create or replace TRIGGER "CPE_ORGANIZATION_TRIG9" before insert OR update on CPE_ORGANIZATION for each row
begin
     if updating('org_info') then
        XMLTYPE.schemavalidate(:new.org_info) ;
     end if;
end;
/
ALTER TRIGGER "CPE_ORGANIZATION_TRIG9" ENABLE;
/
create or replace TRIGGER "CPE_PROFILE_INFO_TRIG9" before insert OR update on CPE_PROFILE_INFO for each row
begin
     if updating('profile_info') then
        XMLTYPE.schemavalidate(:new.profile_info) ;
     end if;
     if updating('profile_data') then
        XMLTYPE.schemavalidate(:new.profile_data) ;
     end if;
end;
/
ALTER TRIGGER "CPE_PROFILE_INFO_TRIG9" ENABLE;
/
create or replace TRIGGER "CPE_RESOURCE_TRIG9" before insert OR update on CPE_RESOURCE for each row
begin
     if updating('resource_info') then
        XMLTYPE.schemavalidate(:new.resource_info) ;
     end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_TRIG9" ENABLE;
/
create or replace TRIGGER "CPE_RESOURCE_LOG_TRIG9" before insert OR update on CPE_RESOURCE_LOG for each row
begin
     if updating('log_xml') then
        XMLTYPE.schemavalidate(:new.log_xml) ;
     end if;
end;
/
ALTER TRIGGER "CPE_RESOURCE_LOG_TRIG9" ENABLE;
/


create or replace TRIGGER "CPE_RESOURCE_TRIG7" after update on CPE_RESOURCE for each row
DECLARE
pragma autonomous_transaction;
v_id number(16);
cursor c0 is select id from cpe_group_functional_type
             where is_active='Y'
             and id not in (
                select a.id from cpe_group_functional_type a , cpe_group_gft_member b
                where b.group_id = a.id and a.is_active='Y' and b.is_active='Y'
                group by a.id,a.name
                           );
begin
    if updating ('is_active') then
      if (:old.is_active = 'Y' AND :new.is_active = 'N' ) THEN
         begin
            update cpe_group_gft_member set is_active='N' where resource_id = :old.id and is_active = 'Y';
            commit;
         exception
            when others then NULL;
         end;
      end if;
    end if;
    open c0;
    loop
        FETCH c0 into v_id; EXIT WHEN c0%notfound;
        begin
           update cpe_group_functional_type set is_active='N' where id = v_id;
           commit;
        exception
           when others then NULL;
        end;
     end loop;
     close c0;
end;

/
ALTER TRIGGER "CPE_RESOURCE_TRIG7" ENABLE;
/

create or replace TRIGGER "CPE_RESOURCE_LOG_TRIG3" AFTER  INSERT or UPDATE on CPE_RESOURCE_LOG FOR EACH ROW
DECLARE
user_id number(16); org_id number(16); usage_type varchar2(64); event_type varchar2(256); event_trigger varchar2(256); user_type_id number(16); owner number(16);
user_name varchar2(64); r_id number(16); r_name varchar2(64); r_type_id number(16); schedule_type varchar2(64); rem_type varchar2(64); r_type varchar2(64);
BEGIN
	SELECT CREATED_BY,RESOURCE_ID,RUN_REMEDIATE,owner_id INTO user_name,r_id,schedule_type,owner FROM CPE_RESOURCE_MGMT WHERE id=:NEW.RESOURCE_MGMT_ID;
	SELECT RESOURCE_TYPE_ID,NAME INTO r_type_id,r_name FROM CPE_RESOURCE WHERE id = r_id;
	SELECT level3 INTO r_type from CPE_RESOURCE_TYPE WHERE id=r_type_id;
	IF (schedule_type = 'N') THEN
		rem_type := 'scanning';
	ELSE
		rem_type := 'remediation';
	END IF;
	IF user_name = 'System Generated Schedule' THEN
		SELECT user_org_id,user_view_type,user_type_id INTO org_id,usage_type,user_type_id  FROM CPE_USER WHERE ID=owner;
		user_id := owner;
		event_trigger := 'System generated scheduled ' || rem_type || ' got  ' || :NEW.OVERALL_STATUS || ' due to ' || :NEW.overall_info;
	ELSE
		SELECT id,user_org_id,user_view_type,user_type_id INTO user_id,org_id,usage_type,user_type_id  FROM CPE_USER WHERE LOGIN_ID=user_name;
		event_trigger := 'Scheduled ' || rem_type || ' got  ' || :NEW.OVERALL_STATUS || ' due to ' || :NEW.overall_info;
	END IF;

	IF :NEW.OVERALL_STATUS = 'ABORTED' OR :NEW.OVERALL_STATUS = 'SKIPPED' THEN
		insert into cpe_usage_log ( user_id, org_id, usage_type, event_type, event_trigger, event_value, mon_rrrr, created_by,
		create_date,user_type_id,resource_id,resource_mgmt_id,severity)
          values (user_id, org_id, usage_type, 'Scheduled scan/remediation status', event_trigger, 1, (select to_char(sysdate,'Mon-rrrr') from dual),
         user_name, (select SYSDATE from dual),user_type_id,r_id,:NEW.RESOURCE_MGMT_ID,6);
	END IF;
	EXCEPTION
		WHEN NO_DATA_FOUND THEN
        	raise_application_error( -20000, 'Error : Data not found');
END;

/
ALTER TRIGGER "CPE_RESOURCE_LOG_TRIG3" ENABLE;
/

/
ALTER TRIGGER "CPE_RESOURCE_LOG_TRIG3" ENABLE;
/
PROMPT all done with DDL portion
PROMPT Good bye.
