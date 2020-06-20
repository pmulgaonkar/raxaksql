--TODO : Gneralize everthing like the way it is done for
--       rules V-57600 and V-56500.
create or replace function create_mof (
P_STR IN CLOB,
P_NAME IN VARCHAR
) return VARCHAR2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);
begin
    result := 'OK';
    begin
        UPDATE CPE_RULE_HEADER SET RULE_CONFIG= to_clob ( P_STR )
           WHERE  name=P_NAME;
        commit;            
        exception
           when others then result := 'could not insert mof snippet';
    end;    
    return result;
end;
/

create or replace function add_mof_data 
return varchar2 is
PRAGMA AUTONOMOUS_TRANSACTION;
result VARCHAR2(256);v_total number; v_success number;
v_str CLOB;
v_severity NUMBER;
v_ruleid NUMBER;
begin
   
    v_total := 0 ; v_success := 0;
    result := 'result : ';
    

   select 'instance of DSCRegistry as $DSCRegistry1ref
{
ResourceID = "[DSCRegistry]V-15696-1";
 ValueName = "AllowLLTDIOOndomain";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::20::9::DSCRegistry";
 RuleNumber = "V-15696-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15696' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15696')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry2ref
{
ResourceID = "[DSCRegistry]V-15696-2";
 ValueName = "AllowLLTDIOOnPublicNet";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::32::9::DSCRegistry";
 RuleNumber = "V-15696-2";
Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15696' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15696')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry3ref
{
ResourceID = "[DSCRegistry]V-15696-3";
 ValueName = "EnableLLTDIO";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::43::9::DSCRegistry";
 RuleNumber = "V-15696-3";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15696' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15696')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry4ref
{
ResourceID = "[DSCRegistry]V-15696-4";
 ValueName = "ProhibitLLTDIOOnPrivateNet";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::54::9::DSCRegistry";
 RuleNumber = "V-15696-4";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15696' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15696')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15696' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry5ref
{
ResourceID = "[DSCRegistry]V-15697-1";
 ValueName = "AllowRspndrOndomain";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::65::9::DSCRegistry";
 RuleNumber = "V-15697-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15697' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15697')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry6ref
{
ResourceID = "[DSCRegistry]V-15697-2";
 ValueName = "AllowRspndrOnPublicNet";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::76::3::DSCRegistry";
 RuleNumber = "V-15697-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15697' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15697')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry7ref
{
ResourceID = "[DSCRegistry]V-15697-3";
 ValueName = "EnableRspndr";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::87::9::DSCRegistry";
 RuleNumber = "V-15697-3";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15697' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15697')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry8ref
{
ResourceID = "[DSCRegistry]V-15697-4";
 ValueName = "ProhibitRspndrOnPrivateNet";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::98::9::DSCRegistry";
 RuleNumber = "V-15697-4";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15697' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15697')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15697' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry9ref
{
ResourceID = "[DSCRegistry]V-15666";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\policies\\Microsoft\\Peernet";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::109::3::DSCRegistry";
 RuleNumber = "V-15666";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15666' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15666')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15666' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry10ref
{
ResourceID = "[DSCRegistry]V-15667";
 ValueName = "NC_AllowNetBridge_NLA";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Network Connections";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-15667";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15667' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15667')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15667' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry11ref
{
ResourceID = "[DSCRegistry]V-21960";
 ValueName = "NC_StdDomainUserSetLocation";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Network Connections";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::131::9::DSCRegistry";
 RuleNumber = "V-21960";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21960' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21960')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21960' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry12ref
{
ResourceID = "[DSCRegistry]V-21961";
 ValueName = "Force_Tunneling";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::142::9::DSCRegistry";
 RuleNumber = "V-21961";
Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21961' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21961')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Enabled";
 ModuleVersion = "1.0";
   
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21961' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---
 
  select 'instance of DSCRegistry as $DSCRegistry13ref
{
ResourceID = "[DSCRegistry]V-26575";
 ValueName = "6to4_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::153::9::DSCRegistry";
 RuleNumber = "V-26575";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26575' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26575')) || 
'";

 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26575' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry14ref
{
ResourceID = "[DSCRegistry]V-26576";
 ValueName = "IPHTTPS_ClientState";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition\\IPHTTPS\\IPHTTPSInterface";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::164::9::DSCRegistry";
 RuleNumber = "V-26576";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26576' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26576')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' into v_str from dual ;
     
  if create_mof ( v_str , 'V-26576' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry15ref
{
ResourceID = "[DSCRegistry]V-26577";
 ValueName = "ISATAP_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-26577";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26577' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26577')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26577' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry16ref
{
ResourceID = "[DSCRegistry]V-26578";
 ValueName = "Teredo_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::186::3::DSCRegistry";
 RuleNumber = "V-26578";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26578' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26578')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";

};' into v_str from dual ;   

  if create_mof ( v_str , 'V-26578' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry17ref
{
ResourceID = "[DSCRegistry]V-36673";
 ValueName = "EnableIPAutoConfigurationLimits";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::197::9::DSCRegistry";
 RuleNumber = "V-36673";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36673' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36673')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36673' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry18ref
{
ResourceID = "[DSCRegistry]V-15698-1";
 ValueName = "DisableFlashConfigRegistrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::208::3::DSCRegistry";
 RuleNumber = "V-15698-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry19ref
{
ResourceID = "[DSCRegistry]V-15698-2";
 ValueName = "DisableInBand802DOT11Registrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::219::6::DSCRegistry";
 RuleNumber = "V-15698-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry20ref
{
ResourceID = "[DSCRegistry]V-15698-3";
 ValueName = "DisableUPnPRegistrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::230::6::DSCRegistry";
 RuleNumber = "V-15698-3";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry21ref
{
ResourceID = "[DSCRegistry]V-15698-4";
 ValueName = "DisableWPDRegistrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::241::6::DSCRegistry";
 RuleNumber = "V-15698-4";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry22ref
{
ResourceID = "[DSCRegistry]V-15698-5";
 ValueName = "EnableRegistrars";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::252::6::DSCRegistry";
 RuleNumber = "V-15698-5";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15698')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;   

  if create_mof ( v_str , 'V-15698' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry23ref
{
ResourceID = "[DSCRegistry]V-15699";
 ValueName = "DisableWcnUi";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\UI";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::263::3::DSCRegistry";
 RuleNumber = "V-15699";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15699' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15699')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15699' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry24ref
{
ResourceID = "[DSCRegistry]V-21963";
 ValueName = "DoNotInstallCompatibleDriverFromWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::274::6::DSCRegistry";
 RuleNumber = "V-21963";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21963' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21963')) || 
'";

 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21963' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry25ref
{
ResourceID = "[DSCRegistry]V-36677";
 ValueName = "UseWindowsUpdate";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Servicing";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::285::6::DSCRegistry";
 RuleNumber = "V-36677";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36677' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36677')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-36677' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry26ref
{
ResourceID = "[DSCRegistry]V-15700";
 ValueName = "AllowRemoteRPC";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::296::6::DSCRegistry";
 RuleNumber = "V-15700";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15700' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15700')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15700' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry27ref
{
ResourceID = "[DSCRegistry]V-15702";
 ValueName = "DisableSendGenericDriverNotFoundToWER";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::307::6::DSCRegistry";
 RuleNumber = "V-15702";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15702' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15702')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15702' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry28ref
{
ResourceID = "[DSCRegistry]V-15701";
 ValueName = "DisableSystemRestore";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::318::9::DSCRegistry";
 RuleNumber = "V-15701";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15701' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15701')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15701' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry29ref
{
ResourceID = "[DSCRegistry]V-21964";
 ValueName = "PreventDeviceMetadataFromNetwork";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Device Metadata";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::329::6::DSCRegistry";
 RuleNumber = "V-21964";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21964' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21964')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-21964' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry30ref
{
ResourceID = "[DSCRegistry]V-28504";
 ValueName = "DisableSendRequestAdditionalSoftwareToWER";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::340::7::DSCRegistry";
 RuleNumber = "V-28504";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-28504' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-28504')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-28504' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry31ref
{
ResourceID = "[DSCRegistry]V-21965";
 ValueName = "SearchOrderConfig";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::351::9::DSCRegistry";
 RuleNumber = "V-21965";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21965' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21965')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21965' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry32ref
{
ResourceID = "[DSCRegistry]V-36678";
 ValueName = "DriverServerSelection";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::362::9::DSCRegistry";
 RuleNumber = "V-36678";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36678' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36678')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36678' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry33ref
{
ResourceID = "[DSCRegistry]V-15703";
 ValueName = "DontPromptForWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::373::9::DSCRegistry";
 RuleNumber = "V-15703";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15703' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15703')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15703' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry34ref
{
ResourceID = "[DSCRegistry]V-36679";
 ValueName = "DriverLoadPolicy";
 Key = "HKLM:\\System\\CurrentControlSet\\Policies\\EarlyLaunch";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::384::3::DSCRegistry";
 RuleNumber = "V-36679";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36679' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36679')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36679' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry35ref
{
ResourceID = "[DSCRegistry]V-4448";
 ValueName = "NoGPOListChanges";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Group Policy\\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::395::6::DSCRegistry";
 RuleNumber = "V-4448";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4448' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4448')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-4448' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry36ref
{
ResourceID = "[DSCRegistry]V-3469";
 ValueName = "DisableBkGndGroupPolicy";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\system";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::407::6::DSCRegistry";
 RuleNumber = "V-3469";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3469' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3469')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3469' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry37ref
{
ResourceID = "[DSCRegistry]V-36680";
 ValueName = "NoUseStoreOpenWith";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::418::6::DSCRegistry";
 RuleNumber = "V-36680";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36680' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36680')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36680' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry38ref
{
ResourceID = "[DSCRegistry]V-14260";
 ValueName = "DisableWebPnPDownload";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::429::7::DSCRegistry";
 RuleNumber = "V-14260";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14260' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14260')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14260' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry39ref
{
ResourceID = "[DSCRegistry]V-15672";
 ValueName = "MicrosoftEventVwrDisableLinks";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\EventViewer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::440::6::DSCRegistry";
 RuleNumber = "V-15672";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15672' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15672')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15672' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry40ref
{
ResourceID = "[DSCRegistry]V-15704";
 ValueName = "PreventHandwritingErrorReports";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\HandwritingErrorReports";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::451::3::DSCRegistry";
 RuleNumber = "V-15704";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15704' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15704')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15704' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry41ref
{
ResourceID = "[DSCRegistry]V-15674";
 ValueName = "NoInternetOpenWith";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::462::6::DSCRegistry";
 RuleNumber = "V-15674";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15674' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15674')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15674' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry42ref
{
ResourceID = "[DSCRegistry]V-14259";
 ValueName = "DisableHTTPPrinting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::473::6::DSCRegistry";
 RuleNumber = "V-14259";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14259' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14259')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14259' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry43ref
{
ResourceID = "[DSCRegistry]V-16020";
 ValueName = "CEIPEnable";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\SQMClient\\Windows";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::484::6::DSCRegistry";
 RuleNumber = "V-16020";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16020' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16020')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-16020' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry44ref
{
ResourceID = "[DSCRegistry]V-14261";
 ValueName = "DontSearchWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::495::6::DSCRegistry";
 RuleNumber = "V-14261";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14261' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14261')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14261' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry45ref
{
ResourceID = "[DSCRegistry]V-36681";
 ValueName = "BlockUserInputMethodsForSignIn";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Control Panel\\International";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::507::6::DSCRegistry";
 RuleNumber = "V-36681";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36681' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36681')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36681' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry46ref
{
ResourceID = "[DSCRegistry]V-15680";
 ValueName = "LogonType";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::518::6::DSCRegistry";
 RuleNumber = "V-15680";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15680' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15680')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15680' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry47ref
{
ResourceID = "[DSCRegistry]V-36684";
 ValueName = "EnumerateLocalUsers";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::529::9::DSCRegistry";
 RuleNumber = "V-36684";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36684' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36684')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36684' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry48ref
{
ResourceID = "[DSCRegistry]V-36687";
 ValueName = "DisableLockScreenAppNotifications";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::540::6::DSCRegistry";
 RuleNumber = "V-36687";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36687' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36687')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36687' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry49ref
{
ResourceID = "[DSCRegistry]V-15705";
 ValueName = "DCSettingIndex";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\0e796bdb-100d-47d6-a2d5-f7d2daa51f51";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::551::6::DSCRegistry";
 RuleNumber = "V-15705";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15705' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15705')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15705' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry50ref
{
ResourceID = "[DSCRegistry]V-15706";
 ValueName = "ACSettingIndex";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\0e796bdb-100d-47d6-a2d5-f7d2daa51f51";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::562::3::DSCRegistry";
 RuleNumber = "V-15706";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15706' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15706')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15706' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry51ref
{
ResourceID = "[DSCRegistry]V-3470";
 ValueName = "fAllowUnsolicited";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::573::3::DSCRegistry";
 RuleNumber = "V-3470";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3470' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3470')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3470' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry52ref
{
ResourceID = "[DSCRegistry]V-3343";
 ValueName = "fAllowToGetHelp";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::584::3::DSCRegistry";
 RuleNumber = "V-3343";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3343' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3343')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-3343' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry53ref
{
ResourceID = "[DSCRegistry]V-15707";
 ValueName = "LoggingEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::595::3::DSCRegistry";
 RuleNumber = "V-15707";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15707' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15707')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15707' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry54ref
{
ResourceID = "[DSCRegistry]V-14254";
 ValueName = "EnableAuthEpResolution";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Rpc";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::606::9::DSCRegistry";
 RuleNumber = "V-14254";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14254' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14254')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14254' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry55ref
{
ResourceID = "[DSCRegistry]V-14253";
 ValueName = "RestrictRemoteClients";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Rpc";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::617::9::DSCRegistry";
 RuleNumber = "V-14253";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14253' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14253')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14253' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry56ref
{
ResourceID = "[DSCRegistry]V-36696";
 ValueName = "DisablePcaUI";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\AppCompat";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::628::9::DSCRegistry";
 RuleNumber = "V-36696";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36696' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36696')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36696' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry57ref
{
ResourceID = "[DSCRegistry]V-21967";
 ValueName = "DisableQueryRemoteServer";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\ScriptedDiagnosticsProvider\\Policy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::639::9::DSCRegistry";
 RuleNumber = "V-21967";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21967' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21967')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-21967' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry58ref
{
ResourceID = "[DSCRegistry]V-21969";
 ValueName = "EnableQueryRemoteServer";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\ScriptedDiagnosticsProvider\\Policy";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::651::6::DSCRegistry";
 RuleNumber = "V-21969";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21969' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21969')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21969' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry59ref
{
ResourceID = "[DSCRegistry]V-21970";
 ValueName = "ScenarioExecutionEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WDI\\{9c5a40da-b965-4fc3-8781-88dd50a6299d}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::662::9::DSCRegistry";
 RuleNumber = "V-21970";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21970' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21970')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21970' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry60ref
{
ResourceID = "[DSCRegistry]V-36697";
 ValueName = "AllowAllTrustedApps";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Appx";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::675::3::DSCRegistry";
 RuleNumber = "V-36697";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36697' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36697')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36697' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry61ref
{
ResourceID = "[DSCRegistry]V-21971";
 ValueName = "DisableInventory";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\AppCompat";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::686::8::DSCRegistry";
 RuleNumber = "V-21971";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21971' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21971')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21971' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry62ref
{
ResourceID = "[DSCRegistry]V-21973";
 ValueName = "NoAutoplayfornonVolume";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::697::9::DSCRegistry";
 RuleNumber = "V-21973";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21973' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21973')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21973' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry63ref
{
ResourceID = "[DSCRegistry]V-22692";
 ValueName = "NoAutorun";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::708::3::DSCRegistry";
 RuleNumber = "V-22692";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-22692' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-22692')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;   

  if create_mof ( v_str , 'V-22692' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry64ref
{
ResourceID = "[DSCRegistry]V-36698";
 ValueName = "Enabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Biometrics";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::719::9::DSCRegistry";
 RuleNumber = "V-36698";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36698' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36698')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-36698' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry65ref
{
ResourceID = "[DSCRegistry]V-36700";
 ValueName = "DisablePasswordReveal";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::730::9::DSCRegistry";
 RuleNumber = "V-36700";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36700' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36700')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36700' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry1ref
{
ResourceID = "[CustomRegistry]V-26579";
 Minimum = "32768";
 ValueName = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-26579";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26579' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26579')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26579' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry2ref
{
ResourceID = "[CustomRegistry]V-26580";
 Minimum = "196608";
 ValueName = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::751::2::CustomRegistry";
 RuleNumber = "V-26580";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26580' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26580')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26580' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry3ref
{
ResourceID = "[CustomRegistry]V-26581";
 Minimum = "32768";
 ValueName = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::761::2::CustomRegistry";
 RuleNumber = "V-26581";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26581' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26581')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Setup";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26581' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     select 'instance of CustomRegistry as $CustomRegistry4ref
{
ResourceID = "[CustomRegistry]V-26582";
 Minimum = "32768";
 ValueName = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::771::2::CustomRegistry";
 RuleNumber = "V-26582";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26582' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26582')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\System";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26582' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry66ref
{
ResourceID = "[DSCRegistry]V-36707";
 ValueName = "EnableSmartScreen";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::781::3::DSCRegistry";
 RuleNumber = "V-36707";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36707' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36707')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36707' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry67ref
{
ResourceID = "[DSCRegistry]V-21980";
 ValueName = "NoDataExecutionPrevention";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::792::3::DSCRegistry";
 RuleNumber = "V-21980";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21980' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21980')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21980' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry68ref
{
ResourceID = "[DSCRegistry]V-15718";
 ValueName = "NoHeapTerminationOnCorruption";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::803::3::DSCRegistry";
 RuleNumber = "V-15718";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15718' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15718')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15718' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry69ref
{
ResourceID = "[DSCRegistry]V-15683";
 ValueName = "PreXPSP2ShellProtocolBehavior";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::814::3::DSCRegistry";
 RuleNumber = "V-15683";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15683' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15683')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15683' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry70ref
{
ResourceID = "[DSCRegistry]V-36708";
 ValueName = "DisableLocation";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LocationAndSensors";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::825::3::DSCRegistry";
 RuleNumber = "V-36708";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36708' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36708')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36708' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry71ref
{
ResourceID = "[DSCRegistry]V-14247";
 ValueName = "DisablePasswordSaving";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::836::3::DSCRegistry";
 RuleNumber = "V-14247";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14247' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14247')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14247' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry72ref
{
ResourceID = "[DSCRegistry]V-14249";
 ValueName = "fDisableCdm";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::847::3::DSCRegistry";
 RuleNumber = "V-14249";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14249' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14249')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14249' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry78ref
{
ResourceID = "[DSCRegistry]V-3455";
 ValueName = "PerSessionTempDir";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::913::3::DSCRegistry";
 RuleNumber = "V-3455";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3455' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3455')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3455' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry73ref
{
ResourceID = "[DSCRegistry]V-3453";
 ValueName = "fPromptForPassword";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::858::3::DSCRegistry";
 RuleNumber = "V-3453";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3453' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3453')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3453' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry74ref
{
ResourceID = "[DSCRegistry]V-3454";
 ValueName = "MinEncryptionLevel";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::869::3::DSCRegistry";
 RuleNumber = "V-3454";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3454' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3454')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-3454' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry75ref
{
ResourceID = "[DSCRegistry]V-3458";
 ValueName = "MaxIdleTime";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::880::9::DSCRegistry";
 RuleNumber = "V-3458";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3458' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3458')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "900000";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-3458' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry76ref
{
ResourceID = "[DSCRegistry]V-3457";
 ValueName = "MaxDisconnectionTime";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::891::3::DSCRegistry";
 RuleNumber = "V-3457";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3457' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3457')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "60000";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-3457' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry77ref
{
ResourceID = "[DSCRegistry]V-3456";
 ValueName = "DeleteTempDirsOnExit";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::902::3::DSCRegistry";
 RuleNumber = "V-3456";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3456' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3456')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3456' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry79ref
{
ResourceID = "[DSCRegistry]V-15682";
 ValueName = "DisableEnclosureDownload";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Internet Explorer\\Feeds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::924::3::DSCRegistry";
 RuleNumber = "V-15682";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15682' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15682')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15682' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry80ref
{
ResourceID = "[DSCRegistry]V-36709";
 ValueName = "AllowBasicAuthInClear";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Internet Explorer\\Feeds";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::935::9::DSCRegistry";
 RuleNumber = "V-36709";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36709' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36709')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-36709' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry81ref
{
ResourceID = "[DSCRegistry]V-15713";
 ValueName = "SpyNetReporting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows Defender\\Spynet";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::946::9::DSCRegistry";
 RuleNumber = "V-15713";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15713' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15713')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15713' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry82ref
{
ResourceID = "[DSCRegistry]V-15714";
 ValueName = "LoggingDisabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::957::9::DSCRegistry";
 RuleNumber = "V-15714";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15714' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15714')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15714' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry83ref
{
ResourceID = "[DSCRegistry]V-15715";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::968::9::DSCRegistry";
 RuleNumber = "V-15715";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15715' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15715')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15715' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry84ref
{
ResourceID = "[DSCRegistry]V-15717";
 ValueName = "DontSendAdditionalData";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::979::3::DSCRegistry";
 RuleNumber = "V-15717";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15717' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15717')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15717' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry85ref
{
ResourceID = "[DSCRegistry]V-15685";
 ValueName = "EnableUserControl";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::990::3::DSCRegistry";
 RuleNumber = "V-15685";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15685' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15685')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15685' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     select 'instance of DSCRegistry as $DSCRegistry86ref
{
ResourceID = "[DSCRegistry]V-34974";
 ValueName = "AlwaysInstallElevated";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1001::3::DSCRegistry";
 RuleNumber = "V-34974";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-34974' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-34974')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-34974' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry87ref
{
ResourceID = "[DSCRegistry]V-15684";
 ValueName = "SafeForScripting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1013::3::DSCRegistry";
 RuleNumber = "V-15684";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15684' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15684')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-15684' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry88ref
{
ResourceID = "[DSCRegistry]V-15686";
 ValueName = "DisableLUAPatching";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1024::3::DSCRegistry";
 RuleNumber = "V-15686";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15686' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15686')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15686' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry89ref
{
ResourceID = "[DSCRegistry]V-15719";
 ValueName = "ReportControllerMissing";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1035::3::DSCRegistry";
 RuleNumber = "V-15719";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15719' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15719')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15719' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry90ref
{
ResourceID = "[DSCRegistry]V-15722";
 ValueName = "DisableOnline";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WMDRM";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1046::3::DSCRegistry";
 RuleNumber = "V-15722";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15722' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15722')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15722' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry91ref
{
ResourceID = "[DSCRegistry]V-15687";
 ValueName = "GroupPrivacyAcceptance";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WindowsMediaPlayer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1057::9::DSCRegistry";
 RuleNumber = "V-15687";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15687' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15687')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15687' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry92ref
{
ResourceID = "[DSCRegistry]V-3480";
 ValueName = "DisableAutoupdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WindowsMediaPlayer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1068::3::DSCRegistry";
 RuleNumber = "V-3480";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3480' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3480')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3480' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry93ref
{
ResourceID = "[DSCRegistry]V-36712";
 ValueName = "AllowBasic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1078::9::DSCRegistry";
 RuleNumber = "V-36712";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36712' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36712')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36712' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry94ref
{
ResourceID = "[DSCRegistry]V-36713";
 ValueName = "AllowUnencryptedTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1090::3::DSCRegistry";
 RuleNumber = "V-36713";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36713' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36713')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36713' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry95ref
{
ResourceID = "[DSCRegistry]V-36714";
 ValueName = "AllowDigest";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1101::3::DSCRegistry";
 RuleNumber = "V-36714";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36714' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36714')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36714' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry96ref
{
ResourceID = "[DSCRegistry]V-36718";
 ValueName = "AllowBasic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1112::3::DSCRegistry";
 RuleNumber = "V-36718";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36718' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36718')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36718' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry97ref
{
ResourceID = "[DSCRegistry]V-36719";
 ValueName = "AllowUnencryptedTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1124::3::DSCRegistry";
 RuleNumber = "V-36719";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36719' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36719')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36719' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry98ref
{
ResourceID = "[DSCRegistry]V-36720";
 ValueName = "DisableRunAs";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1135::3::DSCRegistry";
 RuleNumber = "V-36720";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36720' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36720')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-36720' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry99ref
{
ResourceID = "[DSCRegistry]V-4447";
 ValueName = "fEncryptRPCTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1146::3::DSCRegistry";
 RuleNumber = "V-4447";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4447' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4447')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-4447' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry100ref
{
ResourceID = "[DSCRegistry]V-3449";
 ValueName = "fSingleSessionPerUser";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1156::9::DSCRegistry";
 RuleNumber = "V-3449";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3449' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3449')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-3449' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry101ref
{
ResourceID = "[DSCRegistry]V-15997";
 ValueName = "fDisableCcm";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1167::3::DSCRegistry";
 RuleNumber = "V-15997";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15997' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15997')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15997' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry102ref
{
ResourceID = "[DSCRegistry]V-15998";
 ValueName = "fDisableLPT";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1178::3::DSCRegistry";
 RuleNumber = "V-15998";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15998' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15998')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15998' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry103ref
{
ResourceID = "[DSCRegistry]V-16000";
 ValueName = "fEnableSmartCard";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1189::3::DSCRegistry";
 RuleNumber = "V-16000";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16000' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16000')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-16000' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry104ref
{
ResourceID = "[DSCRegistry]V-15999";
 ValueName = "fDisablePNPRedir";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1200::3::DSCRegistry";
 RuleNumber = "V-15999";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15999' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15999')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-15999' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry105ref
{
ResourceID = "[DSCRegistry]V-16005";
 ValueName = "NoDisconnect";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1211::3::DSCRegistry";
 RuleNumber = "V-16005";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16005' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16005')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-16005' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry106ref
{
ResourceID = "[DSCRegistry]V-3344";
 ValueName = "LimitBlankPasswordUse";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1222::9::DSCRegistry";
 RuleNumber = "V-3344";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3344' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3344')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3344' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry107ref
{
ResourceID = "[DSCRegistry]V-14228";
 ValueName = "AuditBaseObjects";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1233::9::DSCRegistry";
 RuleNumber = "V-14228";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14228' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14228')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14228' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry108ref
{
ResourceID = "[DSCRegistry]V-14229";
 ValueName = "FullPrivilegeAuditing";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1244::9::DSCRegistry";
 RuleNumber = "V-14229";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14229' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14229')) || 
'";
 ValueType = "Binary";
 ModuleName = "xDSCRegistry";
 ValueData = "00 ";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14229' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry109ref
{
ResourceID = "[DSCRegistry]V-14230";
 ValueName = "SCENoApplyLegacyAuditPolicy";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\  Administrator\\All-rules-testing-profiles.ps1::1256::9::DSCRegistry";
 RuleNumber = "V-14230";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14230' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14230')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14230' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry110ref
{
ResourceID = "[DSCRegistry]V-1171";
 ValueName = "AllocateDASD";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1267::9::DSCRegistry";
 RuleNumber = "V-1171";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1171' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1171')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1171' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry111ref
{
ResourceID = "[DSCRegistry]V-6831";
 ValueName = "RequireSignOrSeal";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1279::3::DSCRegistry";
 RuleNumber = "V-6831";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6831' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6831')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6831' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry112ref
{
ResourceID = "[DSCRegistry]V-1163";
 ValueName = "SealSecureChannel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1291::3::DSCRegistry";
 RuleNumber = "V-1163";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1163' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1163')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1163' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry113ref
{
ResourceID = "[DSCRegistry]V-1164";
 ValueName = "SignSecureChannel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1303::3::DSCRegistry";
 RuleNumber = "V-1164";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1164' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1164')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1164' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry114ref
{
ResourceID = "[DSCRegistry]V-1165";
 ValueName = "DisablePasswordChange";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1315::9::DSCRegistry";
 RuleNumber = "V-1165";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1165' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1165')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1165' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry15ref
{
ResourceID = "[CustomRegistry]V-3373";
 Minimum = "1";
 ValueName = "MaximumPasswordAge";
 ValueType = "DWORD";
 Maximum = "30";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-3373";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3373' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3373')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 ModuleVersion = "1.0";
};' into v_str from dual ;

  if create_mof ( v_str , 'V-3373' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry116ref
{
ResourceID = "[DSCRegistry]V-3374";
 ValueName = "RequireStrongKey";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1337::3::DSCRegistry";
 RuleNumber = "V-3374";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3374' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3374')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3374' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry117ref
{
ResourceID = "[DSCRegistry]V-11806";
 ValueName = "DontDisplayLastUserName";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1349::3::DSCRegistry";
 RuleNumber = "V-11806";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-11806' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-11806')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-11806' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry118ref
{
ResourceID = "[DSCRegistry]V-1154";
 ValueName = "DisableCAD";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1362::3::DSCRegistry";
 RuleNumber = "V-1154";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1154' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1154')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1154' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry22ref
{
ResourceID = "[CustomRegistry]V-36773"; 
 Minimum = "1";
 ValueName = "InactivityTimeoutSecs";
 ValueType = "DWORD";
 Maximum = "900";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-36773";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36773' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36773')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";
};' into v_str from dual ;

  if create_mof ( v_str , 'V-36773' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry5ref
{
ResourceID = "[CustomRegistry]V-1089";
 RuleStatus = "Default";
 ValueName = "LegalNoticeText";
 ValueType = "STRING";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1386::3::CustomRegistry";
 RuleNumber = "V-1089";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-1089') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-1089' )|| 
'";
 Desired = "You are accessing a Private Information System, all rights reserved";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1089' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry6ref
{
ResourceID = "[CustomRegistry]V-26359";
 RuleStatus = "Default";
 ValueName = "LegalNoticeCaption";
 ValueType = "STRING";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1396::3::CustomRegistry";
 RuleNumber = "V-26359";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26359' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26359')) || 
'";
 Desired = "Notice and Consent Banner";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26359' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry7ref
{
ResourceID = "[CustomRegistry]V-1090";
 RuleStatus = "Default";
 ValueName = "CachedLogonsCount";
 ValueType = "STRING";
 Maximum = "4";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1406::3::CustomRegistry";
 RuleNumber = "V-1090";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1090' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1090')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1090' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry8ref
{
ResourceID = "[CustomRegistry]V-1172";
 Minimum = "14";
 ValueName = "PasswordExpiryWarning";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1416::3::CustomRegistry";
 RuleNumber = "V-1172";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1172' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1172')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1172' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry9ref
{
ResourceID = "[CustomRegistry]V-1157";
 Minimum = "1";
 ValueName = "SCRemoveOption";
 ValueType = "STRING";
 Maximum = "2";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1426::5::CustomRegistry";
 RuleNumber = "V-1157";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1157' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1157')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1157' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry120ref
{
ResourceID = "[DSCRegistry]V-6832";
 ValueName = "RequireSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1438::3::DSCRegistry";
 RuleNumber = "V-6832";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6832' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6832')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6832' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry121ref
{
ResourceID = "[DSCRegistry]V-1166";
 ValueName = "EnableSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1449::3::DSCRegistry";
 RuleNumber = "V-1166";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1166' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1166')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1166' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry122ref
{
ResourceID = "[DSCRegistry]V-1141";
 ValueName = "EnablePlainTextPassword";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1460::3::DSCRegistry";
 RuleNumber = "V-1141";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1141' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1141')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1141' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry10ref
{
ResourceID = "[CustomRegistry]V-1174";
 RuleStatus = "Default";
 ValueName = "AutoDisconnect";
 ValueType = "Dword";
 Minimum = "1";
 Maximum = "15";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1471::9::CustomRegistry";
 RuleNumber = "V-1174";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1174' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1174')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1174' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry123ref
{
ResourceID = "[DSCRegistry]V-6833";
 ValueName = "RequireSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1481::9::DSCRegistry";
 RuleNumber = "V-6833";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6833' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6833')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6833' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry124ref
{
ResourceID = "[DSCRegistry]V-1162";
 ValueName = "EnableSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1493::9::DSCRegistry";
 RuleNumber = "V-1162";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1162' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1162')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1162' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry125ref
{
ResourceID = "[DSCRegistry]V-1136";
 ValueName = "EnableForcedLogoff";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1504::3::DSCRegistry";
 RuleNumber = "V-1136";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1136' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1136')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1136' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry126ref
{
ResourceID = "[DSCRegistry]V-21950";
 ValueName = "SmbServerNameHardeningLevel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1515::3::DSCRegistry";
 RuleNumber = "V-21950";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21950' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21950')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-21950' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry127ref
{
ResourceID = "[DSCRegistry]V-1145";
 ValueName = "AutoAdminLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1527::3::DSCRegistry";
 RuleNumber = "V-1145";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1145' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1145')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1145' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry128ref
{
ResourceID = "[DSCRegistry]V-21955";
 ValueName = "DisableIpSourceRouting";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1539::3::DSCRegistry";
 RuleNumber = "V-21955";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21955' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21955')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-21955' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry129ref
{
ResourceID = "[DSCRegistry]V-4110";
 ValueName = "DisableIPSourceRouting";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1551::3::DSCRegistry";
 RuleNumber = "V-4110";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4110' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4110')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-4110' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry130ref
{
ResourceID = "[DSCRegistry]V-4111";
 ValueName = "EnableICMPRedirect";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1562::3::DSCRegistry";
 RuleNumber = "V-4111";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4111' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4111')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-4111' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry11ref
{
ResourceID = "[CustomRegistry]V-4113";
 RuleStatus = "Default";
 Minimum = "1";
 ValueName = "KeepAliveTime";
 ValueType = "Dword";
 Maximum = "300000";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1573::9::CustomRegistry";
 RuleNumber = "V-4113";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4113' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4113')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-4113' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry131ref
{
ResourceID = "[DSCRegistry]V-14232";
 ValueName = "NoDefaultExempt";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\IPSEC";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1583::3::DSCRegistry";
 RuleNumber = "V-14232";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14232' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14232')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14232' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry132ref
{
ResourceID = "[DSCRegistry]V-4116";
 ValueName = "NoNameReleaseOnDemand";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netbt\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1594::3::DSCRegistry";
 RuleNumber = "V-4116";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4116' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4116')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-4116' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry133ref
{
ResourceID = "[DSCRegistry]V-4112";
 ValueName = "PerformRouterDiscovery";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1606::3::DSCRegistry";
 RuleNumber = "V-4112";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4112' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4112')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-4112' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry134ref
{
ResourceID = "[DSCRegistry]V-3479";
 ValueName = "SafeDllSearchMode";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1617::3::DSCRegistry";
 RuleNumber = "V-3479";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3479' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3479')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-3479' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry25ref
{
ResourceID = "[CustomRegistry]V-4442"; 
 ValueName = "ScreenSaverGracePeriod";
 ValueType = "String";
 Maximum = "3";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-4442";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4442' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4442')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-4442' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry21ref
{
ResourceID = "[CustomRegistry]V-21956"; 
 ValueName = "TcpMaxDataRetransmissions";
 ValueType = "DWORD";
 Maximum = "3";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-21956";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21956' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21956')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 ModuleVersion = "1.0";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21956' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry18ref
{
ResourceID = "[CustomRegistry]V-4438";
 ValueName = "TcpMaxDataRetransmissions";
 ValueType = "DWORD";
 Maximum = "3";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-4438";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4438' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4438')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 ModuleVersion = "1.0";
};' into v_str from dual ;

  if create_mof ( v_str , 'V-4438' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry12ref
{
ResourceID = "[CustomRegistry]V-4108";
 RuleStatus = "Default";
 ValueName = "WarningLevel";
 ValueType = "Dword";
 Desired = "50,60,70,80,90";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1664::3::CustomRegistry";
 RuleNumber = "V-4108";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4108' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4108')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Eventlog\\Security";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-4108' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry138ref
{
ResourceID = "[DSCRegistry]V-26283";
 ValueName = "RestrictAnonymousSAM";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1674::3::DSCRegistry";
 RuleNumber = "V-26283";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26283' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26283')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26283' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry139ref
{
ResourceID = "[DSCRegistry]V-1093";
 ValueName = "RestrictAnonymous";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1685::3::DSCRegistry";
 RuleNumber = "V-1093";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1093' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1093')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1093' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry140ref
{
ResourceID = "[DSCRegistry]V-3376";
 ValueName = "DisableDomainCreds";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1696::3::DSCRegistry";
 RuleNumber = "V-3376";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3376' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3376')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3376' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry141ref
{
ResourceID = "[DSCRegistry]V-3377";
 ValueName = "EveryoneIncludesAnonymous";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1707::3::DSCRegistry";
 RuleNumber = "V-3377";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3377' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3377')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3377' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry142ref
{
ResourceID = "[DSCRegistry]V-3338";
 ValueName = "NullSessionPipes";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1718::3::DSCRegistry";
 RuleNumber = "V-3338";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3338' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3338')) || 
'";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-3338' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry16ref
{
ResourceID = "[CustomRegistry]V-3339";
 ValueName = "Machine";
 ValueType = "MultiString";
 Desired = "System\\CurrentControlSet\\Control\\ProductOptions,System\\CurrentControlSet\\Control\\Server Applications,Software\\Microsoft\\Windows NT\\CurrentVersion";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-3339";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3339' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3339')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\SecurePipeServers\\Winreg\\AllowedExactPaths";
 ModuleVersion = "1.0";
};' into v_str from dual ;  

  if create_mof ( v_str , 'V-3339' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of CustomRegistry as $CustomRegistry19ref
{
ResourceID = "[CustomRegistry]V-4443";
 ValueName = "Machine";
 ValueType = "MultiString";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-4443";
 Desired = "Software\\Microsoft\\OLAP Server,Software\\Microsoft\\Windows NT\\CurrentVersion\\Perflib,Software\\Microsoft\\Windows NT\\CurrentVersion\\Print,Software\\Microsoft\\Windows NT\\CurrentVersion\\Windows,System\\CurrentControlSet\\Control\\ContentIndex,System\\CurrentControlSet\\Control\\Print\\Printers,System\\CurrentControlSet\\Control\\Terminal Server,System\\CurrentControlSet\\Control\\Terminal Server\\UserConfig,System\\CurrentControlSet\\Control\\Terminal Server\\DefaultUserConfiguration,System\\CurrentControlSet\\Services\\Eventlog,System\\CurrentControlSet\\Services\\Sysmonlog";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-4443') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-4443' )|| 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\SecurePipeServers\\Winreg\\AllowedPaths";
 ModuleVersion = "1.0";
};' into v_str from dual ;

  if create_mof ( v_str , 'V-4443' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry145ref
{
ResourceID = "[DSCRegistry]V-6834";
 ValueName = "RestrictNullSessAccess";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1764::9::DSCRegistry";
 RuleNumber = "V-6834";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6834' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6834')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6834' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry146ref
{
ResourceID = "[DSCRegistry]V-3340";
 ValueName = "NullSessionShares";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1775::3::DSCRegistry";
 RuleNumber = "V-3340";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3340' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3340')) || 
'";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3340' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry147ref
{
ResourceID = "[DSCRegistry]V-3378";
 ValueName = "ForceGuest";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1786::3::DSCRegistry";
 RuleNumber = "V-3378";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3378' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3378')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3378' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry148ref
{
ResourceID = "[DSCRegistry]V-21951";
 ValueName = "UseMachineId";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1796::3::DSCRegistry";
 RuleNumber = "V-21951";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21951' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21951')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-21951' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry149ref
{
ResourceID = "[DSCRegistry]V-21952";
 ValueName = "allownullsessionfallback";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1807::3::DSCRegistry";
 RuleNumber = "V-21952";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21952' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21952')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-21952' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry150ref
{
ResourceID = "[DSCRegistry]V-3379";
 ValueName = "NoLMHash";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1818::9::DSCRegistry";
 RuleNumber = "V-3379";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3379' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3379')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3379' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry151ref
{
ResourceID = "[DSCRegistry]V-1153";
 ValueName = "LmCompatibilityLevel";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1829::3::DSCRegistry";
 RuleNumber = "V-1153";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1153' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1153')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1153' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry152ref
{
ResourceID = "[DSCRegistry]V-3381";
 ValueName = "LDAPClientIntegrity";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LDAP";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1840::3::DSCRegistry";
 RuleNumber = "V-3381";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3381' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3381')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3381' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry153ref
{
ResourceID = "[DSCRegistry]V-3382";
 ValueName = "NTLMMinClientSec";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1851::3::DSCRegistry";
 RuleNumber = "V-3382";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3382' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3382')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "537395200";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3382' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry154ref
{
ResourceID = "[DSCRegistry]V-3666";
 ValueName = "NTLMMinServerSec";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1862::3::DSCRegistry";
 RuleNumber = "V-3666";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3666' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3666')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "537395200";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3666' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry155ref
{
ResourceID = "[DSCRegistry]V-1159";
 ValueName = "SecurityLevel";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Setup\\RecoveryConsole";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1873::9::DSCRegistry";
 RuleNumber = "V-1159";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1159' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1159')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1159' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry156ref
{
ResourceID = "[DSCRegistry]V-1158";
 ValueName = "SetCommand";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Setup\\RecoveryConsole";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1884::3::DSCRegistry";
 RuleNumber = "V-1158";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1158' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1158')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1158' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry157ref
{
ResourceID = "[DSCRegistry]V-1075";
 ValueName = "ShutdownWithoutLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1895::3::DSCRegistry";
 RuleNumber = "V-1075";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1075' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1075')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-1075' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry158ref
{
ResourceID = "[DSCRegistry]V-3383";
 ValueName = "Enabled";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\FIPSAlgorithmPolicy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1906::5::DSCRegistry";
 RuleNumber = "V-3383";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3383' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3383')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-3383' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry159ref
{
ResourceID = "[DSCRegistry]V-3385";
 ValueName = "ObCaseInsensitive";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Kernel";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1917::3::DSCRegistry";
 RuleNumber = "V-3385";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3385' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3385')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-3385' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry160ref
{
ResourceID = "[DSCRegistry]V-1173";
 ValueName = "ProtectionMode";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1928::3::DSCRegistry";
 RuleNumber = "V-1173";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1173' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1173')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1173' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry161ref
{
ResourceID = "[DSCRegistry]V-14234";
 ValueName = "FilterAdministratorToken";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1939::3::DSCRegistry";
 RuleNumber = "V-14234";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14234' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14234')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14234' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry20ref
{
ResourceID = "[CustomRegistry]V-14235";
 Minimum = "1";
 ValueName = "ConsentPromptBehaviorAdmin";
 ValueType = "DWORD";
 Maximum = "4";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-14235";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14235' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14235')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14235' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry163ref
{
ResourceID = "[DSCRegistry]V-14236";
 ValueName = "ConsentPromptBehaviorUser";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1961::3::DSCRegistry";
 RuleNumber = "V-14236";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14236' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14236')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14236' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry164ref
{
ResourceID = "[DSCRegistry]V-14237";
 ValueName = "EnableInstallerDetection";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1972::3::DSCRegistry";
 RuleNumber = "V-14237";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14237' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14237')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14237' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry165ref
{
ResourceID = "[DSCRegistry]V-16008";
 ValueName = "ValidateAdminCodeSignatures";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1983::3::DSCRegistry";
 RuleNumber = "V-16008";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16008' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16008')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-16008' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry166ref
{
ResourceID = "[DSCRegistry]V-14239";
 ValueName = "EnableSecureUIAPaths";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1994::3::DSCRegistry";
 RuleNumber = "V-14239";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14239' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14239')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14239' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry167ref
{
ResourceID = "[DSCRegistry]V-14240";
 ValueName = "EnableLUA";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2005::9::DSCRegistry";
 RuleNumber = "V-14240";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14240' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14240')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14240' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry168ref
{
ResourceID = "[DSCRegistry]V-14241";
 ValueName = "PromptOnSecureDesktop";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2016::3::DSCRegistry";
 RuleNumber = "V-14241";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14241' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14241')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-14241' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry169ref
{
ResourceID = "[DSCRegistry]V-14242";
 ValueName = "EnableVirtualization";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2027::3::DSCRegistry";
 RuleNumber = "V-14242";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14242' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14242')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14242' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry170ref
{
ResourceID = "[DSCRegistry]V-15991";
 ValueName = "EnableUIADesktopToggle";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2038::3::DSCRegistry";
 RuleNumber = "V-15991";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15991' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15991')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15991' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry171ref
{
ResourceID = "[DSCRegistry]V-4446";
 ValueName = "AuthenticodeEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Safer\\CodeIdentifiers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2049::3::DSCRegistry";
 RuleNumber = "V-4446";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4446' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4446')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-4446' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry172ref
{
ResourceID = "[DSCRegistry]V-4445";
 ValueName = "Optional";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Subsystems";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2060::3::DSCRegistry";
 RuleNumber = "V-4445";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4445' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4445')) || 
'";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-4445' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry173ref
{
ResourceID = "[DSCRegistry]V-1151";
 ValueName = "AddPrinterDrivers";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Print\\Providers\\LanMan Print Services\\Servers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2071::3::DSCRegistry";
 RuleNumber = "V-1151";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1151' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1151')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1151' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry174ref
{
ResourceID = "[DSCRegistry]V-2374";
 ValueName = "NoDriveTypeAutoRun";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2084::3::DSCRegistry";
 RuleNumber = "V-2374";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-2374' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-2374')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "255";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-2374' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry175ref
{
ResourceID = "[DSCRegistry]V-14243";
 ValueName = "EnumerateAdministrators";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\CredUI";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2095::5::DSCRegistry";
 RuleNumber = "V-14243";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14243' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14243')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14243' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry176ref
{
ResourceID = "[DSCRegistry]V-36439";
 ValueName = "LocalAccountTokenFilterPolicy";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2106::5::DSCRegistry";
 RuleNumber = "V-36439";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36439' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36439')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36439' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry177ref
{
ResourceID = "[DSCRegistry]V-21953";
 ValueName = "AllowOnlineID";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA\\pku2u\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2117::5::DSCRegistry";
 RuleNumber = "V-21953";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21953' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21953')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21953' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry178ref
{
ResourceID = "[DSCRegistry]V-21954";
 ValueName = "SupportedEncryptionTypes";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\Kerberos\\Parameters\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2128::5::DSCRegistry";
 RuleNumber = "V-21954";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-21954') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-21954' )|| 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2147483644";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21954' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry179ref
{
ResourceID = "[DSCRegistry]V-57453";
 ValueName = "BypassDataThrottling";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2139::5::DSCRegistry";
 RuleNumber = "V-57453";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57453' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57453')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57453' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry180ref
{
ResourceID = "[DSCRegistry]V-57455";
 ValueName = "DontShowUI";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2150::7::DSCRegistry";
 RuleNumber = "V-57455";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57455' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57455')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57455' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry181ref
{
ResourceID = "[DSCRegistry]V-57463";
 ValueName = "DisableArchive";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2161::7::DSCRegistry";
 RuleNumber = "V-57463";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57463' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57463')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57463' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry182ref
{
ResourceID = "[DSCRegistry]V-57465";
 ValueName = "ConfigureArchive";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2172::7::DSCRegistry";
 RuleNumber = "V-57465";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57465' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57465')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57465' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry13ref
{
ResourceID = "[CustomRegistry]V-57467";
 Minimum = "100";
 ValueName = "MaxArchiveCount";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2183::5::CustomRegistry";
 RuleNumber = "V-57467";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57467' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57467')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57467' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry183ref
{
ResourceID = "[DSCRegistry]V-57469";
 ValueName = "DisableQueue";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2193::7::DSCRegistry";
 RuleNumber = "V-57469";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57469' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57469')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57469' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry184ref
{
ResourceID = "[DSCRegistry]V-57471";
 ValueName = "ForceQueue";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2204::7::DSCRegistry";
 RuleNumber = "V-57471";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57471' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57471')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-57471' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of CustomRegistry as $CustomRegistry14ref
{
ResourceID = "[CustomRegistry]V-57473";
 Minimum = "50";
 ValueName = "MaxQueueCount";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2215::5::CustomRegistry";
 RuleNumber = "V-57473";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57473' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57473')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57473' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry185ref
{
ResourceID = "[DSCRegistry]V-57475";
 ValueName = "QueuePesterInterval";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2225::7::DSCRegistry";
 RuleNumber = "V-57475";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57475' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57475')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57475' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry186ref
{
ResourceID = "[DSCRegistry]V-57477";
 ValueName = "DefaultConsent";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting\\Consent";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2236::7::DSCRegistry";
 RuleNumber = "V-57477";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57477' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57477')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "4";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57477' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry187ref
{
ResourceID = "[DSCRegistry]V-57479";
 ValueName = "DefaultOverrideBehavior";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting\\Consent";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2247::7::DSCRegistry";
 RuleNumber = "V-57479";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57479' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57479')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-57479' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry188ref
{
ResourceID = "[DSCRegistry]V-57639";
 ValueName = "ForceKeyProtection";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Cryptography";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-57639";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57639' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57639')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57639' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege1ref
{
ResourceID = "[Privilege]V-26469";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-26469";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26469' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26469')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeTrustedCredManAccessPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26469' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege2ref
{
ResourceID = "[Privilege]V-26470";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT AUTHORITY\\Authenticated Users"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2280::9::Privilege";
 RuleNumber = "V-26470";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26470' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26470')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeNetworkLogonRight";
 Operation = "Add-Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26470' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege3ref
{
ResourceID = "[Privilege]V-1102";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2290::9::Privilege";
 RuleNumber = "V-1102";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1102' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1102')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeTcbPrivilege";
 Operation = "Remove All";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1102' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege4ref
{
ResourceID = "[Privilege]V-26471";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2298::9::Privilege";
 RuleNumber = "V-26471";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26471' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26471')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseQuotaPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26471' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege5ref
{
ResourceID = "[Privilege]V-26472";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2307::9::Privilege";
 RuleNumber = "V-26472";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26472' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26472')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeInteractiveLogonRight";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26472' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege6ref
{
ResourceID = "[Privilege]V-26473";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2316::9::Privilege";
 RuleNumber = "V-26473";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26473' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26473')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeRemoteInteractiveLogonRight";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26473' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege7ref
{
ResourceID = "[Privilege]V-26474";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2325::9::Privilege";
 RuleNumber = "V-26474";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26474' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26474')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeBackupPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26474' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege8ref
{
ResourceID = "[Privilege]V-26475";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT AUTHORITY\\Authenticated Users",
    "NT AUTHORITY\\LOCAL SERVICE",
    "NT AUTHORITY\\NETWORK SERVICE",
    "Window Manager\\Window Manager Group"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2334::9::Privilege";
 RuleNumber = "V-26475";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-26475') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-26475' )|| 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeChangeNotifyPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;
   
  if create_mof ( v_str , 'V-26475' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of Privilege as $Privilege9ref
{
ResourceID = "[Privilege]V-26476";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Local Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2343::9::Privilege";
 RuleNumber = "V-26476";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26476' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26476')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemtimePrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26476' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege10ref
{
ResourceID = "[Privilege]V-26477";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Local Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2352::9::Privilege";
 RuleNumber = "V-26477";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26477' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26477')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeTimeZonePrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26477' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege11ref
{
ResourceID = "[Privilege]V-26478";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2360::9::Privilege";
 RuleNumber = "V-26478";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26478' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26478')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreatePagefilePrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26478' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege12ref
{
ResourceID = "[Privilege]V-26479";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2370::9::Privilege";
 RuleNumber = "V-26479";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26479' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26479')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateTokenPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26479' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege13ref
{
ResourceID = "[Privilege]V-26480";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Service",
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2378::9::Privilege";
 RuleNumber = "V-26480";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26480' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26480')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateGlobalPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26480' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege14ref
{
ResourceID = "[Privilege]V-26481";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2387::9::Privilege";
 RuleNumber = "V-26481";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26481' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26481')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreatePermanentPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26481' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege15ref
{
ResourceID = "[Privilege]V-26482";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2395::9::Privilege";
 RuleNumber = "V-26482";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26482' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26482')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateSymbolicLinkPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26482' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of Privilege as $Privilege16ref
{
ResourceID = "[Privilege]V-18010";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2404::9::Privilege";
 RuleNumber = "V-18010";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-18010' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-18010')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDebugPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-18010' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege18ref
{
ResourceID = "[Privilege]V-26483";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2422::9::Privilege";
 RuleNumber = "V-26483";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26483' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26483')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyBatchLogonRight";
 Operation = "Add";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26483' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege19ref
{
ResourceID = "[Privilege]V-26485";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2443::9::Privilege";
 RuleNumber = "V-26485";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26485' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26485')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyInteractiveLogonRight";
 Operation = "Add";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26485' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege20ref
{
ResourceID = "[Privilege]V-26486";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2452::9::Privilege";
 RuleNumber = "V-26486";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-26486') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-26486' )|| 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyRemoteInteractiveLogonRight";
 Operation = "Add";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26486' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege21ref
{
ResourceID = "[Privilege]V-26487";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2461::9::Privilege";
 RuleNumber = "V-26487";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26487' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26487')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeEnableDelegationPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26487' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege22ref
{
ResourceID = "[Privilege]V-26488";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2469::9::Privilege";
 RuleNumber = "V-26488";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26488' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26488')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeRemoteShutdownPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26488' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege23ref
{
ResourceID = "[Privilege]V-26489";
 RuleStatus = "Default";
 Members = {
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2478::9::Privilege";
 RuleNumber = "V-26489";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26489' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26489')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeAuditPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;
     
  if create_mof ( v_str , 'V-26489' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege24ref
{
ResourceID = "[Privilege]V-26490";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Service",
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2487::9::Privilege";
 RuleNumber = "V-26490";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26490' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26490')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeImpersonatePrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26490' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of Privilege as $Privilege25ref
{
ResourceID = "[Privilege]V-26491";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Local Service",
    "Window Manager\\Window Manager Group"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2496::9::Privilege";
 RuleNumber = "V-26491";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26491' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26491')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseWorkingSetPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26491' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege26ref
{
ResourceID = "[Privilege]V-26492";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2505::9::Privilege";
 RuleNumber = "V-26492";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26492' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26492')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseBasePriorityPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26492' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege27ref
{
ResourceID = "[Privilege]V-26493";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2514::9::Privilege";
 RuleNumber = "V-26493";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26493' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26493')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeLoadDriverPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26493' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of Privilege as $Privilege28ref
{
ResourceID = "[Privilege]V-26494";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2523::9::Privilege";
 RuleNumber = "V-26494";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26494' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26494')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeLockMemoryPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26494' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of Privilege as $Privilege29ref
{
ResourceID = "[Privilege]V-26495";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2531::9::Privilege";
 RuleNumber = "V-26495";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26495' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26495')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeBatchLogonRight";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26495' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of Privilege as $Privilege30ref
{
ResourceID = "[Privilege]V-26496";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2540::9::Privilege";
 RuleNumber = "V-26496";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26496' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26496')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeSecurityPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26496' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     select 'instance of Privilege as $Privilege31ref
{
ResourceID = "[Privilege]V-26497";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2549::9::Privilege";
 RuleNumber = "V-26497";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26497' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26497')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeRelabelPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26497' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

     select 'instance of Privilege as $Privilege32ref
{
ResourceID = "[Privilege]V-26498";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2557::9::Privilege";
 RuleNumber = "V-26498";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26498' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26498')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemEnvironmentPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26498' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of Privilege as $Privilege33ref
{
ResourceID = "[Privilege]V-26499";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2566::9::Privilege";
 RuleNumber = "V-26499";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26499' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26499')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeManageVolumePrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26499' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege34ref
{
ResourceID = "[Privilege]V-26500";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2575::9::Privilege";
 RuleNumber = "V-26500";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26500' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26500')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeProfileSingleProcessPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26500' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege35ref
{
ResourceID = "[Privilege]V-26501";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Service\\WdiServiceHost"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2584::9::Privilege";
 RuleNumber = "V-26501";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26501' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26501')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemProfilePrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26501' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege36ref
{
ResourceID = "[Privilege]V-26503";
 RuleStatus = "Default";
 Members = {
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2593::9::Privilege";
 RuleNumber = "V-26503";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26503' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26503')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeAssignPrimaryTokenPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26503' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege37ref
{
ResourceID = "[Privilege]V-26504";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2602::9::Privilege";
 RuleNumber = "V-26504";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26504' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26504')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeRestorePrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26504' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege38ref
{
ResourceID = "[Privilege]V-26505";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2611::9::Privilege";
 RuleNumber = "V-26505";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26505' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26505')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeShutdownPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26505' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege39ref
{
ResourceID = "[Privilege]V-26506";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2620::9::Privilege";
 RuleNumber = "V-26506";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26506' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26506')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeTakeOwnershipPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26506' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol1ref
{
ResourceID = "[AuditPol]V-26529";
 RuleStatus = "Default";
 AuditPolicy = "Credential Validation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-26529";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26529' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26529')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26529' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol2ref
{
ResourceID = "[AuditPol]V-26530";
 RuleStatus = "Default";
 AuditPolicy = "Credential Validation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2641::9::AuditPol";
 RuleNumber = "V-26530";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26530' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26530')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26530' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol3ref
{
ResourceID = "[AuditPol]V-26531";
 RuleStatus = "Default";
 AuditPolicy = "Computer Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2649::9::AuditPol";
 RuleNumber = "V-26531";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26531' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26531')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26531' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol4ref
{
ResourceID = "[AuditPol]V-26532";
 RuleStatus = "Default";
 AuditPolicy = "Computer Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2657::9::AuditPol";
 RuleNumber = "V-26532";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26532' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26532')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26532' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol5ref
{
ResourceID = "[AuditPol]V-26533";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Management Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2665::9::AuditPol";
 RuleNumber = "V-26533";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26533' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26533')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26533' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol6ref
{
ResourceID = "[AuditPol]V-26534";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Management Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2673::9::AuditPol";
 RuleNumber = "V-26534";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26534' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26534')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26534' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol7ref
{
ResourceID = "[AuditPol]V-26535";
 RuleStatus = "Default";
 AuditPolicy = "Security Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2681::9::AuditPol";
 RuleNumber = "V-26535";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26535' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26535')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26535' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol8ref
{
ResourceID = "[AuditPol]V-26536";
 RuleStatus = "Default";
 AuditPolicy = "Security Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2689::9::AuditPol";
 RuleNumber = "V-26536";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26536' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26536')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26536' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of AuditPol as $AuditPol9ref
{
ResourceID = "[AuditPol]V-26537";
 RuleStatus = "Default";
 AuditPolicy = "User Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2697::9::AuditPol";
 RuleNumber = "V-26537";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26537' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26537')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26537' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol10ref
{
ResourceID = "[AuditPol]V-26538";
 RuleStatus = "Default";
 AuditPolicy = "User Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2705::9::AuditPol";
 RuleNumber = "V-26538";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26538' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26538')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  

  if create_mof ( v_str , 'V-26538' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol11ref
{
ResourceID = "[AuditPol]V-26539";
 RuleStatus = "Default";
 AuditPolicy = "Process Creation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2713::9::AuditPol";
 RuleNumber = "V-26539";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26539' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26539')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26539' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol12ref
{
ResourceID = "[AuditPol]V-26540";
 RuleStatus = "Default";
 AuditPolicy = "Logoff";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2721::9::AuditPol";
 RuleNumber = "V-26540";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26540' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26540')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26540' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol13ref
{
ResourceID = "[AuditPol]V-26541";
 RuleStatus = "Default";
 AuditPolicy = "Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2729::9::AuditPol";
 RuleNumber = "V-26541";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26541' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26541')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26541' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol14ref
{
ResourceID = "[AuditPol]V-26542";
 RuleStatus = "Default";
 AuditPolicy = "Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2737::9::AuditPol";
 RuleNumber = "V-26542";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26542' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26542')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26542' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol15ref
{
ResourceID = "[AuditPol]V-26543";
 RuleStatus = "Default";
 AuditPolicy = "Special Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2745::9::AuditPol";
 RuleNumber = "V-26543";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26543' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26543')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26543' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol16ref
{
ResourceID = "[AuditPol]V-26546";
 RuleStatus = "Default";
 AuditPolicy = "Audit Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2753::9::AuditPol";
 RuleNumber = "V-26546";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26546' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26546')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26546' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol17ref
{
ResourceID = "[AuditPol]V-26547";
 RuleStatus = "Default";
 AuditPolicy = "Audit Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2761::9::AuditPol";
 RuleNumber = "V-26547";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26547' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26547')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26547' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol18ref
{
ResourceID = "[AuditPol]V-26548";
 RuleStatus = "Default";
 AuditPolicy = "Authentication Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2769::9::AuditPol";
 RuleNumber = "V-26548";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26548' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26548')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26548' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol19ref
{
ResourceID = "[AuditPol]V-26549";
 RuleStatus = "Default";
 AuditPolicy = "Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2777::9::AuditPol";
 RuleNumber = "V-26549";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26549' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26549')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26549' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol20ref
{
ResourceID = "[AuditPol]V-26550";
 RuleStatus = "Default";
 AuditPolicy = "Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2785::9::AuditPol";
 RuleNumber = "V-26550";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26550' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26550')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26550' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of AuditPol as $AuditPol21ref
{
ResourceID = "[AuditPol]V-26551";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Driver";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2793::9::AuditPol";
 RuleNumber = "V-26551";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26551' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26551')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-26551' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of AuditPol as $AuditPol22ref
{
ResourceID = "[AuditPol]V-26552";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Driver";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2801::9::AuditPol";
 RuleNumber = "V-26552";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26552' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26552')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26552' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol23ref
{
ResourceID = "[AuditPol]V-26553";
 RuleStatus = "Default";
 AuditPolicy = "Security State Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2809::9::AuditPol";
 RuleNumber = "V-26553";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26553' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26553')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26553' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol24ref
{
ResourceID = "[AuditPol]V-26554";
 RuleStatus = "Default";
 AuditPolicy = "Security State Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2817::9::AuditPol";
 RuleNumber = "V-26554";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26554' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26554')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26554' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol25ref
{
ResourceID = "[AuditPol]V-26555";
 RuleStatus = "Default";
 AuditPolicy = "Security System Extension";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2825::9::AuditPol";
 RuleNumber = "V-26555";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26555' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26555')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26555' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol26ref
{
ResourceID = "[AuditPol]V-26556";
 RuleStatus = "Default";
 AuditPolicy = "Security System Extension";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2833::9::AuditPol";
 RuleNumber = "V-26556";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26556' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26556')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26556' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol27ref
{
ResourceID = "[AuditPol]V-26557";
 RuleStatus = "Default";
 AuditPolicy = "System Integrity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2841::9::AuditPol";
 RuleNumber = "V-26557";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26557' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26557')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26557' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol28ref
{
ResourceID = "[AuditPol]V-26558";
 RuleStatus = "Default";
 AuditPolicy = "System Integrity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2849::9::AuditPol";
 RuleNumber = "V-26558";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26558' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26558')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-26558' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity1ref
{
ResourceID = "[AccountSecurity]V-1097";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "3";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2870::9::AccountSecurity";
 RuleNumber = "V-1097";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1097' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1097')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutThreshold";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1097') = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity2ref
{
ResourceID = "[AccountSecurity]V-1098";
 Minimum = "60";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2879::8::AccountSecurity";
 RuleNumber = "V-1098";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1098' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1098')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutWindow";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1098' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

-- V-1098 depends on V-1099.
--     v_str := ''  ; 

   select 'instance of AccountSecurity as $AccountSecurity3ref
{
ResourceID = "[AccountSecurity]V-1099";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2888::9::AccountSecurity";
 RuleNumber = "V-1099";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-1099') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-1099' )|| 
'";
 Desired = "No";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutDuration";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1099' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity4ref
{
ResourceID = "[AccountSecurity]V-1107";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2896::9::AccountSecurity";
 RuleNumber = "V-1107";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1107' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1107')) || 
'";
 Desired = "24";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "UniquePW";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-1107' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity5ref
{
ResourceID = "[AccountSecurity]V-1104";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "60";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2904::9::AccountSecurity";
 RuleNumber = "V-1104";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1104' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1104')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MaxPWAge";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1104' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity6ref
{
ResourceID = "[AccountSecurity]V-1105";
 Minimum = "1";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2913::9::AccountSecurity";
 RuleNumber = "V-1105";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1105' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1105')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MinPWAge";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-1105' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity7ref
{
ResourceID = "[AccountSecurity]V-6836";
 Minimum = "14";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2921::9::AccountSecurity";
 RuleNumber = "V-6836";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6836' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6836')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MinPWLen";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6836' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity8ref
{
ResourceID = "[AccountSecurity]V-3380";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2929::9::AccountSecurity";
 RuleNumber = "V-3380";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3380' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-3380')) || 
'";
 Desired = "0";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "ForceLogoff";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-3380' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity9ref
{
ResourceID = "[AccountSecurity]V-1113";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2937::9::AccountSecurity";
 RuleNumber = "V-1113";
 Desired = "Disable";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1113' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1113')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "DisableGuest";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-1113' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity10ref
{
ResourceID = "[AccountSecurity]V-1114";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2954::9::AccountSecurity";
 RuleNumber = "V-1114";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1114' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1114')) || 
'";
 Desired = "Visitor";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameGuest";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1114' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCService as $DSCService1ref
{
ResourceID = "[DSCService]V-40206";
 RuleStatus = "Default";
 RuleNumber = "V-40206";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-40206' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-40206')) || 
'";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3015::6::DSCService";
 Name = "SCPolicySvc";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-40206' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select max(CRITICALITY_ID)  into v_severity from cpe_rule_header where name = 'V-57600' ;   
   select max(id)  into v_ruleid from cpe_rule_header where name = 'V-57600';

   v_str := 'instance of GPRegistry as $GPRegistry38ref
{
ResourceID = "[GPRegistry]V-57600-1";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4108::9::GPRegistry";
 RuleNumber = "V-57600-1";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundEchoRequest";

};

instance of GPRegistry as $GPRegistry39ref
{
ResourceID = "[GPRegistry]V-57600-2";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4119::9::GPRegistry";
 RuleNumber = "V-57600-2";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundMaskRequest";

};

instance of GPRegistry as $GPRegistry40ref
{
ResourceID = "[GPRegistry]V-57600-3";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4130::9::GPRegistry";
 RuleNumber = "V-57600-3";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundRouterRequest";

};

instance of GPRegistry as $GPRegistry41ref
{
ResourceID = "[GPRegistry]V-57600-4";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4141::9::GPRegistry";
 RuleNumber = "V-57600-4";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundTimestampRequest";

};

instance of GPRegistry as $GPRegistry42ref
{
ResourceID = "[GPRegistry]V-57600-5";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4152::9::GPRegistry";
 RuleNumber = "V-57600-5";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundDestinationUnreachable";

};

instance of GPRegistry as $GPRegistry43ref
{
ResourceID = "[GPRegistry]V-57600-6";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4163::9::GPRegistry";
 RuleNumber = "V-57600-6";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundPacketTooBig";

};

instance of GPRegistry as $GPRegistry44ref
{
ResourceID = "[GPRegistry]V-57600-7";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4174::9::GPRegistry";
 RuleNumber = "V-57600-7";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundParameterProblem";

};

instance of GPRegistry as $GPRegistry45ref
{
ResourceID = "[GPRegistry]V-57600-8";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4186::9::GPRegistry";
 RuleNumber = "V-57600-8";
 Severity = "'||
 v_severity||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundSourceQuench";

};

instance of GPRegistry as $GPRegistry46ref
{
ResourceID = "[GPRegistry]V-57600-9";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4198::9::GPRegistry";
 RuleNumber = "V-57600-9";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundTimeExceeded";

};

instance of GPRegistry as $GPRegistry47ref
{
ResourceID = "[GPRegistry]V-57600-10";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4210::9::GPRegistry";
 RuleNumber = "V-57600-10";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowRedirect";

};';

 


  if create_mof ( v_str , 'V-57600' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry189ref
{
ResourceID = "[DSCRegistry]V-14256";
 ValueName = "NoWebServices";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-14256";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14256' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-14256')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14256' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry190ref
{
ResourceID = "[DSCRegistry]V-15676";
 ValueName = "NoOnlinePrintsWizard";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3045::7::DSCRegistry";
 RuleNumber = "V-15676";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15676' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15676')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15676' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry191ref
{
ResourceID = "[DSCRegistry]V-15709";
 ValueName = "DownloadGameInfo";
 Key = "HKLM:\\\\Software\\Policies\\Microsoft\\Windows\\GameUX";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3056::7::DSCRegistry";
 RuleNumber = "V-15709";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15709' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-15709')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-15709' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry192ref
{
ResourceID = "[DSCRegistry]V-14262";
 ValueName = "DisabledComponents";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3067::7::DSCRegistry";
 RuleNumber = "V-14262";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-14262') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-14262' )|| 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "255";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-14262' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry193ref
{
ResourceID = "[DSCRegistry]V-21975";
 ValueName = "DisableHomeGroup";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Homegroup";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3091::8::DSCRegistry";
 RuleNumber = "V-21975";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21975' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21975')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-21975' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry194ref
{
ResourceID = "[DSCRegistry]V-16001";
 ValueName = "RedirectOnlyDefaultClientPrinter";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3102::8::DSCRegistry";
 RuleNumber = "V-16001";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16001' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-16001')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-16001' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry195ref
{
ResourceID = "[DSCRegistry]V-21974";
 ValueName = "GameUpdateOptions";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\GameUX";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3122::8::DSCRegistry";
 RuleNumber = "V-21974";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21974' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-21974')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-21974' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry196ref
{
ResourceID = "[DSCRegistry]V-21978";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\WAU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3133::9::DSCRegistry";
 RuleNumber = "V-21978";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-21978') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-21978' )|| 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;
   
  if create_mof ( v_str , 'V-21978' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol29ref
{
ResourceID = "[AuditPol]V-56300";
 RuleStatus = "Default";
 AuditPolicy = "Kerberos Authentication Service";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3146::9::AuditPol";
 RuleNumber = "V-56300";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56300' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56300')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56300' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol30ref
{
ResourceID = "[AuditPol]V-56301";
 RuleStatus = "Default";
 AuditPolicy = "Kerberos Service Ticket Operations";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3154::9::AuditPol";
 RuleNumber = "V-56301";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56301' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56301')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56301' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol31ref
{
ResourceID = "[AuditPol]V-56302";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Logon Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3162::9::AuditPol";
 RuleNumber = "V-56302";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56302' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56302')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56302' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol32ref
{
ResourceID = "[AuditPol]V-56303";
 RuleStatus = "Default";
 AuditPolicy = "Application Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3170::9::AuditPol";
 RuleNumber = "V-56303";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56303' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56303')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56303' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol33ref
{
ResourceID = "[AuditPol]V-56304";
 RuleStatus = "Default";
 AuditPolicy = "Distribution Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3178::9::AuditPol";
 RuleNumber = "V-56304";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56304' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56304')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56304' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol34ref
{
ResourceID = "[AuditPol]V-56305";
 RuleStatus = "Default";
 AuditPolicy = "DPAPI Activity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3186::9::AuditPol";
 RuleNumber = "V-56305";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56305' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56305')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56305' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol35ref
{
ResourceID = "[AuditPol]V-56306";
 RuleStatus = "Default";
 AuditPolicy = "Process Termination";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3194::9::AuditPol";
 RuleNumber = "V-56306";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56306' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56306')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56306' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol36ref
{
ResourceID = "[AuditPol]V-56307";
 RuleStatus = "Default";
 AuditPolicy = "RPC Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3202::9::AuditPol";
 RuleNumber = "V-56307";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56307' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56307')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56307' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol37ref
{
ResourceID = "[AuditPol]V-56308";
 RuleStatus = "Default";
 AuditPolicy = "Account Lockout";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3210::9::AuditPol";
 RuleNumber = "V-56308";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56308' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56308')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56308' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol38ref
{
ResourceID = "[AuditPol]V-56309";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Extended Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3218::9::AuditPol";
 RuleNumber = "V-56309";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56309' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56309')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56309' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol39ref
{
ResourceID = "[AuditPol]V-56310";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Main Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3226::9::AuditPol";
 RuleNumber = "V-56310";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56310' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56310')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56310' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol40ref
{
ResourceID = "[AuditPol]V-56311";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Quick Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3234::9::AuditPol";
 RuleNumber = "V-56311";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56311' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56311')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56311' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol41ref
{
ResourceID = "[AuditPol]V-56312";
 RuleStatus = "Default";
 AuditPolicy = "Network Policy Server";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3242::9::AuditPol";
 RuleNumber = "V-56312";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56312' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56312')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56312' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol42ref
{
ResourceID = "[AuditPol]V-56313";
 RuleStatus = "Default";
 AuditPolicy = "Other Logon/Logoff Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3250::9::AuditPol";
 RuleNumber = "V-56313";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56313' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56313')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56313' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol43ref
{
ResourceID = "[AuditPol]V-56314";
 RuleStatus = "Default";
 AuditPolicy = "Application Generated";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3258::9::AuditPol";
 RuleNumber = "V-56314";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56314' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56314')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56314' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol44ref
{
ResourceID = "[AuditPol]V-56315";
 RuleStatus = "Default";
 AuditPolicy = "Central Policy Staging";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3266::9::AuditPol";
 RuleNumber = "V-56315";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56315' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56315')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56315' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol45ref
{
ResourceID = "[AuditPol]V-56316";
 RuleStatus = "Default";
 AuditPolicy = "Certification Services";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3274::9::AuditPol";
 RuleNumber = "V-56316";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56316' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56316')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56316' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of AuditPol as $AuditPol46ref
{
ResourceID = "[AuditPol]V-56317";
 RuleStatus = "Default";
 AuditPolicy = "Detailed File Share";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3282::9::AuditPol";
 RuleNumber = "V-56317";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56317' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56317')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
  
  if create_mof ( v_str , 'V-56317' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol47ref
{
ResourceID = "[AuditPol]V-56318";
 RuleStatus = "Default";
 AuditPolicy = "File Share";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3290::9::AuditPol";
 RuleNumber = "V-56318";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56318' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56318')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56318' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol48ref
{
ResourceID = "[AuditPol]V-56319";
 RuleStatus = "Default";
 AuditPolicy = "File System";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3298::9::AuditPol";
 RuleNumber = "V-56319";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56319' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56319')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56319' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol49ref
{
ResourceID = "[AuditPol]V-56320";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Connection";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3306::9::AuditPol";
 RuleNumber = "V-56320";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56320' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56320')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56320' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol50ref
{
ResourceID = "[AuditPol]V-56321";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Packet Drop";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3314::9::AuditPol";
 RuleNumber = "V-56321";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56321' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56321')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56321' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol51ref
{
ResourceID = "[AuditPol]V-56322";
 RuleStatus = "Default";
 AuditPolicy = "Handle Manipulation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3322::9::AuditPol";
 RuleNumber = "V-56322";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56322' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56322')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56322' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol52ref
{
ResourceID = "[AuditPol]V-56323";
 RuleStatus = "Default";
 AuditPolicy = "Other Object Access Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3330::9::AuditPol";
 RuleNumber = "V-56323";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56323' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56323')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56323' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol53ref
{
ResourceID = "[AuditPol]V-56324";
 RuleStatus = "Default";
 AuditPolicy = "Registry";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3338::9::AuditPol";
 RuleNumber = "V-56324";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56324' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56324')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56324' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol54ref
{
ResourceID = "[AuditPol]V-56325";
 RuleStatus = "Default";
 AuditPolicy = "SAM";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3346::9::AuditPol";
 RuleNumber = "V-56325";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56325' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56325')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56325' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol55ref
{
ResourceID = "[AuditPol]V-56326";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3354::9::AuditPol";
 RuleNumber = "V-56326";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56326' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56326')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56326' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol56ref
{
ResourceID = "[AuditPol]V-56327";
 RuleStatus = "Default";
 AuditPolicy = "MPSSVC Rule-Level Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3362::9::AuditPol";
 RuleNumber = "V-56327";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56327' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56327')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56327' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of AuditPol as $AuditPol57ref
{
ResourceID = "[AuditPol]V-56328";
 RuleStatus = "Default";
 AuditPolicy = "Other Policy Change Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3370::9::AuditPol";
 RuleNumber = "V-56328";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56328' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56328')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
  
  if create_mof ( v_str , 'V-56328' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol58ref
{
ResourceID = "[AuditPol]V-56329";
 RuleStatus = "Default";
 AuditPolicy = "Non Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3378::9::AuditPol";
 RuleNumber = "V-56329";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56329' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56329')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56329' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol59ref
{
ResourceID = "[AuditPol]V-56331";
 RuleStatus = "Default";
 AuditPolicy = "Other System Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3393::9::AuditPol";
 RuleNumber = "V-56331";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56331' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56331')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
    
  if create_mof ( v_str , 'V-56331' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol60ref
{
ResourceID = "[AuditPol]V-56379";
 RuleStatus = "Default";
 AuditPolicy = "Kernel Object";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3400::9::AuditPol";
 RuleNumber = "V-56379";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56379' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56379')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56379' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry1ref
{
ResourceID = "[GPRegistry]V-56332";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3408::9::GPRegistry";
 RuleNumber = "V-56332";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56332' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56332')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Domain:UnicastResponseToMulticast:Disable";
 PolicyName = "Allow unicast response";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56332' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry2ref
{
ResourceID = "[GPRegistry]V-56333";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3419::9::GPRegistry";
 RuleNumber = "V-56333";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56333' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56333')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56333' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry3ref
{
ResourceID = "[GPRegistry]V-56334";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3430::9::GPRegistry";
 RuleNumber = "V-56334";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56334' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56334')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56334' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry4ref
{
ResourceID = "[GPRegistry]V-56335";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3441::9::GPRegistry";
 RuleNumber = "V-56335";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56335' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56335')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Domain:InboundUserNotification:Disable";
 PolicyName = "Display a notification";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56335' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry5ref
{
ResourceID = "[GPRegistry]V-56336";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3452::9::GPRegistry";
 RuleNumber = "V-56336";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56336' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56336')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Domain:State:ON";
 PolicyName = "Firewall State";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56336' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry6ref
{
ResourceID = "[GPRegistry]V-56337";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3463::9::GPRegistry";
 RuleNumber = "V-56337";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56337' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56337')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Domain:Firewall Policy:BlockInbound";
 PolicyName = "Inbound connections";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56337' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry7ref
{
ResourceID = "[GPRegistry]V-56338";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3474::9::GPRegistry";
 RuleNumber = "V-56338";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56338' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56338')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 Property = "Domain:Firewall Policy:AllowOutbound";
 PolicyName = "Outbound connections";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56338' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry8ref
{
ResourceID = "[GPRegistry]V-56339";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3485::9::GPRegistry";
 RuleNumber = "V-56339";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56339' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56339')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Private:UnicastResponseToMulticast:Disable";
 PolicyName = "Allow unicast response";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56339' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of GPRegistry as $GPRegistry9ref
{
ResourceID = "[GPRegistry]V-56340";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3496::9::GPRegistry";
 RuleNumber = "V-56340";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56340' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56340')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56340' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry10ref
{
ResourceID = "[GPRegistry]V-56341";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3507::9::GPRegistry";
 RuleNumber = "V-56341";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56341' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56341')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56341' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry11ref
{
ResourceID = "[GPRegistry]V-56342";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3518::9::GPRegistry";
 RuleNumber = "V-56342";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56342' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56342')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Private:InboundUserNotification:Disable";
 PolicyName = "Display a notification";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56342' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry12ref
{
ResourceID = "[GPRegistry]V-56343";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3529::9::GPRegistry";
 RuleNumber = "V-56343";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56343' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56343')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Private:State:ON";
 PolicyName = "Firewall State";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56343' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry13ref
{
ResourceID = "[GPRegistry]V-56344";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3540::9::GPRegistry";
 RuleNumber = "V-56344";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56344' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56344')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Private:Firewall Policy:BlockInbound";
 PolicyName = "Inbound connections";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56344' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry14ref
{
ResourceID = "[GPRegistry]V-56345";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3551::9::GPRegistry";
 RuleNumber = "V-56345";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56345' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56345')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 Property = "Private:Firewall Policy:AllowOutbound";
 PolicyName = "Outbound connections";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56345' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry15ref
{
ResourceID = "[GPRegistry]V-56346";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3562::9::GPRegistry";
 RuleNumber = "V-56346";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56346' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56346')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Public:UnicastResponseToMulticast:Disable";
 PolicyName = "Allow unicast response";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56346' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry16ref
{
ResourceID = "[GPRegistry]V-56347";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3573::9::GPRegistry";
 RuleNumber = "V-56347";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56347' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56347')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56347' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry17ref
{
ResourceID = "[GPRegistry]V-56348";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3584::9::GPRegistry";
 RuleNumber = "V-56348";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56348' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56348')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56348' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry18ref
{
ResourceID = "[GPRegistry]V-56349";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3595::9::GPRegistry";
 RuleNumber = "V-56349";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56349' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56349')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Public:InboundUserNotification:Disable";
 PolicyName = "Display a notification";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56349' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry19ref
{
ResourceID = "[GPRegistry]V-56350";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3606::9::GPRegistry";
 RuleNumber = "V-56350";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56350' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56350')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Public:State:ON";
 PolicyName = "Firewall State";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56350' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of GPRegistry as $GPRegistry20ref
{
ResourceID = "[GPRegistry]V-56351";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3617::9::GPRegistry";
 RuleNumber = "V-56351";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56351' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56351')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Public:Firewall Policy:BlockInbound";
 PolicyName = "Inbound connections";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";

};' into v_str from dual ;
  

  if create_mof ( v_str , 'V-56351' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of GPRegistry as $GPRegistry21ref
{
ResourceID = "[GPRegistry]V-56352";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3628::9::GPRegistry";
 RuleNumber = "V-56352";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56352' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56352')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 Property = "Public:Firewall Policy:AllowOutbound";
 PolicyName = "Outbound connections";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";

};' into v_str from dual ;
    

  if create_mof ( v_str , 'V-56352' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCService as $DSCService3ref
{
ResourceID = "[DSCService]V-56359";
 RuleStatus = "Default";
 State = "Running";
 RuleNumber = "V-56359";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56359' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56359')) || 
'";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3640::9::DSCService";
 Name = "EventLog";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56359' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry197ref
{
ResourceID = "[DSCRegistry]V-56360";
 ValueName = "AnnounceFlags";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Config";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3649::8::DSCRegistry";
 RuleNumber = "V-56360";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56360' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56360')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56360' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry198ref
{
ResourceID = "[DSCRegistry]V-56361";
 ValueName = "Type";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3661::9::DSCRegistry";
 RuleNumber = "V-56361";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56361' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56361')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "NTP";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56361' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry199ref
{
ResourceID = "[DSCRegistry]V-56362";
 ValueName = "Enabled";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\TimeProviders\\NtpServer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3671::9::DSCRegistry";
 RuleNumber = "V-56362";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56362' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56362')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56362' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry200ref
{
ResourceID = "[DSCRegistry]V-56363";
 ValueName = "SpecialPollInterval";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\TimeProviders\\NtpClient";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3681::9::DSCRegistry";
 RuleNumber = "V-56363";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56363' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56363')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "900";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56363' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry201ref
{
ResourceID = "[DSCRegistry]V-56371";
 ValueName = "crashonauditfail";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3691::9::DSCRegistry";
 RuleNumber = "V-56371";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56371' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56371')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56371' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry202ref
{
ResourceID = "[DSCRegistry]V-56372";
 ValueName = "ClearPageFileAtShutdown";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3701::9::DSCRegistry";
 RuleNumber = "V-56372";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56372' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56372')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56372' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry22ref
{
ResourceID = "[GPRegistry]V-56364-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3712::9::GPRegistry";
 RuleNumber = "V-56364-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56364' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56364')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";

};

instance of GPRegistry as $GPRegistry23ref
{
ResourceID = "[GPRegistry]V-56364-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3724::9::GPRegistry";
 RuleNumber = "V-56364-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56364' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56364')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56364' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry203ref
{
ResourceID = "[DSCRegistry]V-56365";
 ValueName = "undockwithoutlogon";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\system";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3736::9::DSCRegistry";
 RuleNumber = "V-56365";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56365' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56365')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56365' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry204ref
{
ResourceID = "[DSCRegistry]V-56366";
 ValueName = "AllocateCDRoms";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3747::9::DSCRegistry";
 RuleNumber = "V-56366";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56366' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56366')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;
    
  if create_mof ( v_str , 'V-56366' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry205ref
{
ResourceID = "[DSCRegistry]V-56367";
 ValueName = "AllocateFloppies";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3758::9::DSCRegistry";
 RuleNumber = "V-56367";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56367' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56367')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56367' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry206ref
{
ResourceID = "[DSCRegistry]V-56369";
 ValueName = "ForceUnlockLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\Currentversion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3769::9::DSCRegistry";
 RuleNumber = "V-56369";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56369' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56369')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56369' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry24ref
{
ResourceID = "[GPRegistry]V-56370-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3780::9::GPRegistry";
 RuleNumber = "V-56370-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56370' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56370')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";

};

instance of GPRegistry as $GPRegistry25ref
{
ResourceID = "[GPRegistry]V-56370-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3792::9::GPRegistry";
 RuleNumber = "V-56370-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56370' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56370')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56370' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of GPRegistry as $GPRegistry26ref
{
ResourceID = "[GPRegistry]V-56373-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\System";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3803::9::GPRegistry";
 RuleNumber = "V-56373-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56373' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56373')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";

};

instance of GPRegistry as $GPRegistry27ref
{
ResourceID = "[GPRegistry]V-56373-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\System";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3815::9::GPRegistry";
 RuleNumber = "V-56373-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56373' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56373')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56373' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol61ref
{
ResourceID = "[AuditPol]V-56378";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3827::9::AuditPol";
 RuleNumber = "V-56378";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56378' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56378')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
   

  if create_mof ( v_str , 'V-56378' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of SystemCheck as $SystemCheck1ref
{
ResourceID = "[SystemCheck]V-56353";
 Manual = "False";
 RuleNumber = "V-56353";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56353' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56353')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "DNS";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56353' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of SystemCheck as $SystemCheck2ref
{
ResourceID = "[SystemCheck]V-56356";
 Manual = "False";
 RuleNumber = "V-56356";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56356' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56356')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3850::9::SystemCheck";
 Category = "TimeServer";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56356' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of SystemCheck as $SystemCheck3ref
{
ResourceID = "[SystemCheck]V-56357";
 Manual = "False";
 RuleNumber = "V-56357";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56357' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56357')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3858::9::SystemCheck";
 Category = "Services";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56357' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of SystemCheck as $SystemCheck4ref
{
ResourceID = "[SystemCheck]V-56358";
 Manual = "False";
 RuleNumber = "V-56358";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56358' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56358')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3866::9::SystemCheck";
 Category = "Software";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56358' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select max(CRITICALITY_ID)  into v_severity from cpe_rule_header where name = 'V-56500' ;   
  select max(id)  into v_ruleid from cpe_rule_header where name = 'V-56500';

  v_str := 'instance of GPRegistry as $GPRegistry28ref
{
ResourceID = "[GPRegistry]V-56500-1";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3893::9::GPRegistry";
 RuleNumber = "V-56500-1";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundEchoRequest";

};

instance of GPRegistry as $GPRegistry29ref
{
ResourceID = "[GPRegistry]V-56500-2";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3904::9::GPRegistry";
 RuleNumber = "V-56500-2";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundMaskRequest";

};

instance of GPRegistry as $GPRegistry30ref
{
ResourceID = "[GPRegistry]V-56500-3";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3915::9::GPRegistry";
 RuleNumber = "V-56500-3";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundRouterRequest";

};

instance of GPRegistry as $GPRegistry31ref
{
ResourceID = "[GPRegistry]V-56500-4";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3926::9::GPRegistry";
 RuleNumber = "V-56500-4";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowInboundTimestampRequest";

};

instance of GPRegistry as $GPRegistry32ref
{
ResourceID = "[GPRegistry]V-56500-5";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3937::9::GPRegistry";
 RuleNumber = "V-56500-5";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundDestinationUnreachable";

};

instance of GPRegistry as $GPRegistry33ref
{
ResourceID = "[GPRegistry]V-56500-6";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3948::9::GPRegistry";
 RuleNumber = "V-56500-6";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundPacketTooBig";

};

instance of GPRegistry as $GPRegistry34ref
{
ResourceID = "[GPRegistry]V-56500-7";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3959::9::GPRegistry";
 RuleNumber = "V-56500-7";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundParameterProblem";

};

instance of GPRegistry as $GPRegistry35ref
{
ResourceID = "[GPRegistry]V-56500-8";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3970::9::GPRegistry";
 RuleNumber = "V-56500-8";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundSourceQuench";

};

instance of GPRegistry as $GPRegistry36ref
{
ResourceID = "[GPRegistry]V-56500-9";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3981::9::GPRegistry";
 RuleNumber = "V-56500-9";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowOutboundTimeExceeded";

};

instance of GPRegistry as $GPRegistry37ref
{
ResourceID = "[GPRegistry]V-56500-10";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3992::9::GPRegistry";
 RuleNumber = "V-56500-10";
 Severity = "'||
 v_severity ||
'";
 RuleId = "'|| 
 v_ruleid || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowRedirect";

};' ;
  
  if create_mof ( v_str , 'V-56500' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry48ref
{
ResourceID = "[GPRegistry]V-56512";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4222::9::GPRegistry";
 RuleNumber = "V-56512";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56512' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56512')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56512' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of GPRegistry as $GPRegistry49ref
{
ResourceID = "[GPRegistry]V-56513";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4234::9::GPRegistry";
 RuleNumber = "V-56513";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56513' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56513')) || 
'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56513' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry207ref
{
ResourceID = "[DSCRegistry]V-56526";
 ValueName = "AUOptions";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4285::9::DSCRegistry";
 RuleNumber = "V-56526";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56526' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56526')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56526' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry208ref
{
ResourceID = "[DSCRegistry]V-56528";
 ValueName = "NoRDS";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Conferencing";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4295::9::DSCRegistry";
 RuleNumber = "V-56528";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56528' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56528')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56528' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry209ref
{
ResourceID = "[DSCRegistry]V-56529";
 ValueName = "NoAUShutdownOption";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4305::9::DSCRegistry";
 RuleNumber = "V-56529";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56529' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56529')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56529' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry210ref
{
ResourceID = "[DSCRegistry]V-56533";
 ValueName = "EnableSecureCredentialPrompting";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4335::9::DSCRegistry";
 RuleNumber = "V-56533";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56533' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56533')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56533' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of CustomRegistry as $CustomRegistry23ref
{
ResourceID = "[CustomRegistry]V-56534-1";
 ValueName = "RescheduleWaitTimeEnabled";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-56534-1";
 Desired = "1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56534' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56534')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 ModuleVersion = "1.0";
};

instance of CustomRegistry as $CustomRegistry24ref
{
ResourceID = "[CustomRegistry]V-56534-2";
 Minimum = "15";
 ValueName = "RescheduleWaitTime";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-56534-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56534' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56534')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 ModuleVersion = "1.0";
};' into v_str from dual ;

  if create_mof ( v_str , 'V-56534' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry213ref
{
ResourceID = "[DSCRegistry]V-56539";
 ValueName = "NtfsDisable8dot3NameCreation";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\FileSystem";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4383::9::DSCRegistry";
 RuleNumber = "V-56539";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56539' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56539')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56539' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

    select 'instance of DSCRegistry as $DSCRegistry214ref
{
ResourceID = "[DSCRegistry]V-56542";
 ValueName = "DisableContentFileUpdates";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\SearchCompanion";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4393::9::DSCRegistry";
 RuleNumber = "V-56542";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56542' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56542')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56542' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry215ref
{
ResourceID = "[DSCRegistry]V-56543";
 ValueName = "NoPublishingWizard";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4403::9::DSCRegistry";
 RuleNumber = "V-56543";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56543' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56543')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56543' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Secpol as $Secpol1ref
{
ResourceID = "[Secpol]V-1150";
 Manual = "False";
 Desired = "Enable";
 RuleStatus = "Default";
 Policy = "PasswordComplexity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4513::9::Secpol";
 RuleNumber = "V-1150";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-1150') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-1150' )|| 
'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1150' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Secpol as $Secpol2ref
{
ResourceID = "[Secpol]V-2372";
 Manual = "False";
 Desired = "Disable";
 RuleStatus = "Default";
 Policy = "ClearTextPassword";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4520::9::Secpol";
 RuleNumber = "V-2372";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-2372') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-2372' )|| 
'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-2372' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Secpol as $Secpol3ref
{
ResourceID = "[Secpol]V-3337";
 Manual = "False";
 Desired = "Disable";
 RuleStatus = "Default";
 Policy = "LSAAnonymousNameLookup";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4527::9::Secpol";
 RuleNumber = "V-3337";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-3337') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-3337' )|| 
'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-3337' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry217ref
{
ResourceID = "[DSCRegistry]V-3372";
 ValueName = "UndockWithoutLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4543::8::DSCRegistry";
 RuleNumber = "V-3372";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-3372') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-3372' )|| 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-3372' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol62ref
{
ResourceID = "[AuditPol]V-57633";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4554::8::AuditPol";
 RuleNumber = "V-57633";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57633' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57633')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57633' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AuditPol as $AuditPol63ref
{
ResourceID = "[AuditPol]V-57635";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4562::8::AuditPol";
 RuleNumber = "V-57635";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57635' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57635')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-57635' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCService as $DSCService2ref
{
ResourceID = "[DSCService]V-56511";
 RuleStatus = "Default";
 State = "Running";
 RuleNumber = "V-56511";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56511' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56511')) || 
'";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3023::6::DSCService";
 Name = "WerSvc";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-56511' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity12ref
{
ResourceID = "[AccountSecurity]V-56375";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3876::9::AccountSecurity";
 RuleNumber = "V-56375";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56375' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56375')) || 
'";
 Desired = "";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LastLoginTime";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-56375' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of AccountSecurity as $AccountSecurity13ref
{
ResourceID = "[AccountSecurity]V-1115";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2945::9::AccountSecurity";
 RuleNumber = "V-1115";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1115' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1115')) || 
'";
 Desired = "NotAdmin";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameAdministrator";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1115' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of SystemCheck as $SystemCheck7ref
{
ResourceID = "[SystemCheck]V-1073";
 Manual = "False";
 RuleNumber = "V-1073";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1073' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1073')) || 
'";
 RuleStatus = "Default";
 Desired = "7601,9200";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "BuildNumber";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1073' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of SystemCheck as $SystemCheck8ref
{
ResourceID = "[SystemCheck]V-1081";
 Manual = "False";
 RuleNumber = "V-1081";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1081' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1081')) || 
'";
 RuleStatus = "Default";
 Desired = "true";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "NTFS";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1081' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCService as $DSCService10ref
{
ResourceID = "[DSCService]V-26604";
 RuleStatus = "Default";
 RuleNumber = "V-26604";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26604' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26604')) || 
'";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3015::6::DSCService";
 Name = "p2pimsvc";
 State = "Stopped";
 StartupType = "Disabled";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26604' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of AuditPol as $AuditPol64ref
{
ResourceID = "[AuditPol]V-36667";
 RuleStatus = "Default";
 AuditPolicy = "Removable storage";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-36667";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36667' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-36667')) || 
'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-36667' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of Privilege as $Privilege40ref
{
ResourceID = "[Privilege]V-56540";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-56540";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56540' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56540')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeSyncAgentPrivilege";
 Operation = "Remove All";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56540' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of DSCRegistry as $DSCRegistry218ref
{
ResourceID = "[DSCRegistry]V-4444";
 ValueName = "ForceKeyProtection";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Cryptography";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4543::8::DSCRegistry";
 RuleNumber = "V-4444";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4444' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-4444')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-4444' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of Privilege as $Privilege41ref
{
ResourceID = "[Privilege]V-26502";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2620::9::Privilege";
 RuleNumber = "V-26502";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26502' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-26502')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeUndockPrivilege";
 Operation = "Allow Only";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-26502' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---
select 'instance of SystemCheck as $SystemCheck5ref
{
ResourceID = "[SystemCheck]V-56381";
 Manual = "True";
 RuleNumber = "V-56381";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56381' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56381')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "Patch";
 Desired = "KB4012212,6.1.7601.23689";
 Link = "https://'||(Select Domain from DJANGO_SITE where ID = '1')||'/static/files/CustomSetup_Windows/patch/KB4012212.msu";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";
 
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56381' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of SystemCheck as $SystemCheck6ref
{
ResourceID = "[SystemCheck]V-56380";
 Manual = "True";
 RuleNumber = "V-56380";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56380' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56380')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "Patch";
 Desired = "KB4012213,6.3.9600.18604";
 Link = "https://'||(Select Domain from DJANGO_SITE where ID = '1')||'/static/files/CustomSetup_Windows/patch/KB4012213.msu";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";
 
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56380' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---


select 'instance of EventViewer as $EventViewer1ref
{
ResourceID = "[EventViewer]V-57721";
 Ensure = "Present";
 RuleNumber = "V-57721";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57721' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-57721')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::EventViewer";
 ModuleName = "xEventViewer";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-57721' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege42ref
{
ResourceID = "[Privilege]V-1155";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2422::9::Privilege";
 RuleNumber = "V-1155";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1155' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1155')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyNetworkLogonRight";
 Operation = "Add";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-1155' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of SystemCheck as $SystemCheck9ref
{
ResourceID = "[SystemCheck]V-56382";
 Manual = "True";
 RuleNumber = "V-56382";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56382' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-56382')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "Patch";
 Desired = "KB4012214,6.2.9200.22099";
 Link = "https://'||(Select Domain from DJANGO_SITE where ID = '1')||'/static/files/CustomSetup_Windows/patch/KB4012214.msu";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";
 
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-56382' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity14ref
{
ResourceID = "[AccountSecurity]V-73315";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2896::9::AccountSecurity";
 RuleNumber = "V-73315";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73315' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73315')) || 
'";
 Desired = "24";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "UniquePW";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73315' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity15ref
{
ResourceID = "[AccountSecurity]V-73317";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "60";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2904::9::AccountSecurity";
 RuleNumber = "V-73317";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73317' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73317')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MaxPWAge";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73317' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity16ref
{
ResourceID = "[AccountSecurity]V-73319";
 Minimum = "1";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2913::9::AccountSecurity";
 RuleNumber = "V-73319";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73319' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73319')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MinPWAge";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73319' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity17ref
{
ResourceID = "[AccountSecurity]V-73321";
 Minimum = "14";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2921::9::AccountSecurity";
 RuleNumber = "V-73321";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73321' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73321')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MinPWLen";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73321' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Secpol as $Secpol4ref
{
ResourceID = "[Secpol]V-73323";
 Manual = "False";
 Desired = "Enable";
 RuleStatus = "Default";
 Policy = "PasswordComplexity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4513::9::Secpol";
 RuleNumber = "V-73323";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-73323') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-73323' )|| 
'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73323' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Secpol as $Secpol5ref
{
ResourceID = "[Secpol]V-73325";
 Manual = "False";
 Desired = "Disable";
 RuleStatus = "Default";
 Policy = "ClearTextPassword";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4520::9::Secpol";
 RuleNumber = "V-73325";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-73325') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-73325' )|| 
'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73325' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol65ref
{
ResourceID = "[AuditPol]V-73413";
 RuleStatus = "Default";
 AuditPolicy = "Credential Validation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-73413";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73413' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73413')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73413' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol66ref
{
ResourceID = "[AuditPol]V-73415";
 RuleStatus = "Default";
 AuditPolicy = "Credential Validation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2641::9::AuditPol";
 RuleNumber = "V-73415";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73415' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73415')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73415' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol67ref
{
ResourceID = "[AuditPol]V-73419";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Management Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2665::9::AuditPol";
 RuleNumber = "V-73419";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73419' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73419')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73419' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol68ref
{
ResourceID = "[AuditPol]V-73421";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Management Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2673::9::AuditPol";
 RuleNumber = "V-73421";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73421' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73421')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73421' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol69ref
{
ResourceID = "[AuditPol]V-73423";
 RuleStatus = "Default";
 AuditPolicy = "Security Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2681::9::AuditPol";
 RuleNumber = "V-73423";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73423' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73423')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73423' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol70ref
{
ResourceID = "[AuditPol]V-73425";
 RuleStatus = "Default";
 AuditPolicy = "Security Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2689::9::AuditPol";
 RuleNumber = "V-73425";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73425' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73425')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73425' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol71ref
{
ResourceID = "[AuditPol]V-73427";
 RuleStatus = "Default";
 AuditPolicy = "User Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2697::9::AuditPol";
 RuleNumber = "V-73427";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73427' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73427')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73427' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol72ref
{
ResourceID = "[AuditPol]V-73429";
 RuleStatus = "Default";
 AuditPolicy = "User Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2705::9::AuditPol";
 RuleNumber = "V-73429";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73429' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73429')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  

  if create_mof ( v_str , 'V-73429' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol73ref
{
ResourceID = "[AuditPol]V-73449";
 RuleStatus = "Default";
 AuditPolicy = "Logoff";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2721::9::AuditPol";
 RuleNumber = "V-73449";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73449' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73449')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73449' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol74ref
{
ResourceID = "[AuditPol]V-73451";
 RuleStatus = "Default";
 AuditPolicy = "Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2729::9::AuditPol";
 RuleNumber = "V-73451";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73451' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73451')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73451' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol75ref
{
ResourceID = "[AuditPol]V-73453";
 RuleStatus = "Default";
 AuditPolicy = "Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2737::9::AuditPol";
 RuleNumber = "V-73453";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73453' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73453')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73453' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol76ref
{
ResourceID = "[AuditPol]V-73455";
 RuleStatus = "Default";
 AuditPolicy = "Special Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2745::9::AuditPol";
 RuleNumber = "V-73455";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73455' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73455')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73455' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol77ref
{
ResourceID = "[AuditPol]V-73461";
 RuleStatus = "Default";
 AuditPolicy = "Audit Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2753::9::AuditPol";
 RuleNumber = "V-73461";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73461' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73461')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73461' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol78ref
{
ResourceID = "[AuditPol]V-73463";
 RuleStatus = "Default";
 AuditPolicy = "Audit Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2761::9::AuditPol";
 RuleNumber = "V-73463";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73463' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73463')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73463' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol79ref
{
ResourceID = "[AuditPol]V-73465";
 RuleStatus = "Default";
 AuditPolicy = "Authentication Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2769::9::AuditPol";
 RuleNumber = "V-73465";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73465' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73465')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73465' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol80ref
{
ResourceID = "[AuditPol]V-73469";
 RuleStatus = "Default";
 AuditPolicy = "Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2777::9::AuditPol";
 RuleNumber = "V-73469";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73469' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73469')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73469' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol81ref
{
ResourceID = "[AuditPol]V-73471";
 RuleStatus = "Default";
 AuditPolicy = "Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2785::9::AuditPol";
 RuleNumber = "V-73471";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73471' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73471')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73471' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol82ref
{
ResourceID = "[AuditPol]V-73473";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Driver";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2793::9::AuditPol";
 RuleNumber = "V-73473";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73473' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73473')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73473' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol83ref
{
ResourceID = "[AuditPol]V-73475";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Driver";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2801::9::AuditPol";
 RuleNumber = "V-73475";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73475' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73475')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73475' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol84ref
{
ResourceID = "[AuditPol]V-73481";
 RuleStatus = "Default";
 AuditPolicy = "Security State Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2809::9::AuditPol";
 RuleNumber = "V-73481";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73481' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73481')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73481' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---


select 'instance of AuditPol as $AuditPol85ref
{
ResourceID = "[AuditPol]V-73483";
 RuleStatus = "Default";
 AuditPolicy = "Security System Extension";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2825::9::AuditPol";
 RuleNumber = "V-73483";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73483' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73483')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73483' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol86ref
{
ResourceID = "[AuditPol]V-73485";
 RuleStatus = "Default";
 AuditPolicy = "Security System Extension";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2833::9::AuditPol";
 RuleNumber = "V-73485";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73485' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73485')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73485' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol87ref
{
ResourceID = "[AuditPol]V-73489";
 RuleStatus = "Default";
 AuditPolicy = "System Integrity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2841::9::AuditPol";
 RuleNumber = "V-73489";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73489' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73489')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73489' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol88ref
{
ResourceID = "[AuditPol]V-73491";
 RuleStatus = "Default";
 AuditPolicy = "System Integrity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2849::9::AuditPol";
 RuleNumber = "V-73491";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73491' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73491')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73491' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry221ref
{
ResourceID = "[DSCRegistry]V-73499";
 ValueName = "DisableIpSourceRouting";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1539::3::DSCRegistry";
 RuleNumber = "V-73499";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73499' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73499')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73499' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry222ref
{
ResourceID = "[DSCRegistry]V-73501";
 ValueName = "DisableIPSourceRouting";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1551::3::DSCRegistry";
 RuleNumber = "V-73501";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73501' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73501')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73501' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry223ref
{
ResourceID = "[DSCRegistry]V-73503";
 ValueName = "EnableICMPRedirect";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1562::3::DSCRegistry";
 RuleNumber = "V-73503";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73503' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73503')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73503' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry224ref
{
ResourceID = "[DSCRegistry]V-73505";
 ValueName = "NoNameReleaseOnDemand";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netbt\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1594::3::DSCRegistry";
 RuleNumber = "V-73505";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73505' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73505')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73505' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry225ref
{
ResourceID = "[DSCRegistry]V-73525";
 ValueName = "NoGPOListChanges";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Group Policy\\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::395::6::DSCRegistry";
 RuleNumber = "V-73525";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73525' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73525')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73525' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry226ref
{
ResourceID = "[DSCRegistry]V-73527";
 ValueName = "DisableWebPnPDownload";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::429::7::DSCRegistry";
 RuleNumber = "V-73527";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73527' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73527')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73527' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry227ref
{
ResourceID = "[DSCRegistry]V-73529";
 ValueName = "DisableHTTPPrinting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::473::6::DSCRegistry";
 RuleNumber = "V-73529";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73529' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73529')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73529' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry228ref
{
ResourceID = "[DSCRegistry]V-73537";
 ValueName = "DCSettingIndex";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\0e796bdb-100d-47d6-a2d5-f7d2daa51f51";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::551::6::DSCRegistry";
 RuleNumber = "V-73537";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73537' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73537')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73537' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry229ref
{
ResourceID = "[DSCRegistry]V-73539";
 ValueName = "ACSettingIndex";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\0e796bdb-100d-47d6-a2d5-f7d2daa51f51";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::562::3::DSCRegistry";
 RuleNumber = "V-73539";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73539' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73539')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73539' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry230ref
{
ResourceID = "[DSCRegistry]V-73543";
 ValueName = "DisableInventory";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\AppCompat";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::686::8::DSCRegistry";
 RuleNumber = "V-73543";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73543' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73543')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73543' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry231ref
{
ResourceID = "[DSCRegistry]V-73545";
 ValueName = "NoAutoplayfornonVolume";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::697::9::DSCRegistry";
 RuleNumber = "V-73545";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73545' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73545')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73545' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry232ref
{
ResourceID = "[DSCRegistry]V-73547";
 ValueName = "NoAutorun";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::708::3::DSCRegistry";
 RuleNumber = "V-73547";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73547' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73547')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;   

  if create_mof ( v_str , 'V-73547' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry233ref
{
ResourceID = "[DSCRegistry]V-73549";
 ValueName = "NoDriveTypeAutoRun";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2084::3::DSCRegistry";
 RuleNumber = "V-73549";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73549' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73549')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "255";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73549' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---


select 'instance of DSCRegistry as $DSCRegistry234ref
{
ResourceID = "[DSCRegistry]V-73487";
 ValueName = "EnumerateAdministrators";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2095::5::DSCRegistry";
 RuleNumber = "V-73487";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73487' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73487')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73487' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry31ref
{
ResourceID = "[CustomRegistry]V-73553";
 Minimum = "32768";
 ValueName = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-73553";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73553' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73553')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73553' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry32ref
{
ResourceID = "[CustomRegistry]V-73555";
 Minimum = "196608";
 ValueName = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::751::2::CustomRegistry";
 RuleNumber = "V-73555";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73555' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73555')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73555' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry33ref
{
ResourceID = "[CustomRegistry]V-73557";
 Minimum = "32768";
 ValueName = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::761::2::CustomRegistry";
 RuleNumber = "V-73557";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73557' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73557')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Setup";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73557' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry235ref
{
ResourceID = "[DSCRegistry]V-73561";
 ValueName = "NoDataExecutionPrevention";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::792::3::DSCRegistry";
 RuleNumber = "V-73561";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73561' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73561')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73561' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry236ref
{
ResourceID = "[DSCRegistry]V-73563";
 ValueName = "NoHeapTerminationOnCorruption";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::803::3::DSCRegistry";
 RuleNumber = "V-73563";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73563' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73563')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73563' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry237ref
{
ResourceID = "[DSCRegistry]V-73565";
 ValueName = "PreXPSP2ShellProtocolBehavior";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::814::3::DSCRegistry";
 RuleNumber = "V-73565";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73565' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73565')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73565' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry238ref
{
ResourceID = "[DSCRegistry]V-73567";
 ValueName = "DisablePasswordSaving";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::836::3::DSCRegistry";
 RuleNumber = "V-73567";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73567' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73567')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73567' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry239ref
{
ResourceID = "[DSCRegistry]V-73569";
 ValueName = "fDisableCdm";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::847::3::DSCRegistry";
 RuleNumber = "V-73569";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73569' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73569')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73569' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry240ref
{
ResourceID = "[DSCRegistry]V-73571";
 ValueName = "fPromptForPassword";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::858::3::DSCRegistry";
 RuleNumber = "V-73571";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73571' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73571')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73571' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry241ref
{
ResourceID = "[DSCRegistry]V-73573";
 ValueName = "fEncryptRPCTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1146::3::DSCRegistry";
 RuleNumber = "V-73573";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73573' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73573')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73573' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry242ref
{
ResourceID = "[DSCRegistry]V-73575";
 ValueName = "MinEncryptionLevel";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::869::3::DSCRegistry";
 RuleNumber = "V-73575";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73575' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73575')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73575' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry243ref
{
ResourceID = "[DSCRegistry]V-73577";
 ValueName = "DisableEnclosureDownload";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Internet Explorer\\Feeds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::924::3::DSCRegistry";
 RuleNumber = "V-73577";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73577' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73577')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73577' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry244ref
{
ResourceID = "[DSCRegistry]V-73579";
 ValueName = "AllowBasicAuthInClear";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Internet Explorer\\Feeds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::935::9::DSCRegistry";
 RuleNumber = "V-73579";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73579' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73579')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73579' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry245ref
{
ResourceID = "[DSCRegistry]V-73583";
 ValueName = "EnableUserControl";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::990::3::DSCRegistry";
 RuleNumber = "V-73583";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73583' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73583')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73583' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry246ref
{
ResourceID = "[DSCRegistry]V-73585";
 ValueName = "AlwaysInstallElevated";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1001::3::DSCRegistry";
 RuleNumber = "V-73585";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73585' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73585')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73585' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry247ref
{
ResourceID = "[DSCRegistry]V-73587";
 ValueName = "SafeForScripting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1013::3::DSCRegistry";
 RuleNumber = "V-73587";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73587' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73587')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73587' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry248ref
{
ResourceID = "[DSCRegistry]V-73593";
 ValueName = "AllowBasic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1078::9::DSCRegistry";
 RuleNumber = "V-73593";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73593' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73593')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73593' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry249ref
{
ResourceID = "[DSCRegistry]V-73595";
 ValueName = "AllowUnencryptedTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1090::3::DSCRegistry";
 RuleNumber = "V-73595";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73595' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73595')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73595' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry250ref
{
ResourceID = "[DSCRegistry]V-73597";
 ValueName = "AllowDigest";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1101::3::DSCRegistry";
 RuleNumber = "V-73597";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73597' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73597')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73597' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry251ref
{
ResourceID = "[DSCRegistry]V-73599";
 ValueName = "AllowBasic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1112::3::DSCRegistry";
 RuleNumber = "V-73599";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73599' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73599')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73599' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry252ref
{
ResourceID = "[DSCRegistry]V-73601";
 ValueName = "AllowUnencryptedTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1124::3::DSCRegistry";
 RuleNumber = "V-73601";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73601' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73601')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73601' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry253ref
{
ResourceID = "[DSCRegistry]V-73603";
 ValueName = "DisableRunAs";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1135::3::DSCRegistry";
 RuleNumber = "V-73603";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73603' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73603')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73603' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry254ref
{
ResourceID = "[DSCRegistry]V-73495";
 ValueName = "LocalAccountTokenFilterPolicy";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2106::5::DSCRegistry";
 RuleNumber = "V-73495";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73495' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73495')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73495' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry255ref
{
ResourceID = "[DSCRegistry]V-73533";
 ValueName = "EnumerateLocalUsers";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::529::9::DSCRegistry";
 RuleNumber = "V-73533";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73533' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73533')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73533' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry256ref
{
ResourceID = "[DSCRegistry]V-73541";
 ValueName = "RestrictRemoteClients";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Rpc";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::617::9::DSCRegistry";
 RuleNumber = "V-73541";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73541' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73541')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73541' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry34ref
{
ResourceID = "[CustomRegistry]V-73651";
 RuleStatus = "Default";
 ValueName = "CachedLogonsCount";
 ValueType = "STRING";
 Maximum = "4";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1406::3::CustomRegistry";
 RuleNumber = "V-73651";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73651' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73651')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73651' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege43ref
{
ResourceID = "[Privilege]V-73733";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT AUTHORITY\\Authenticated Users"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2280::9::Privilege";
 RuleNumber = "V-73733";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73733' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73733')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeNetworkLogonRight";
 Operation = "Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73733' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege44ref
{
ResourceID = "[Privilege]V-73759";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2422::9::Privilege";
 RuleNumber = "V-73759";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73759' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73759')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyNetworkLogonRight";
 Operation = "Add";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73759' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege45ref
{
ResourceID = "[Privilege]V-73763";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2422::9::Privilege";
 RuleNumber = "V-73763";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73763' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73763')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyBatchLogonRight";
 Operation = "Add";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73763' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege46ref
{
ResourceID = "[Privilege]V-73771";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2443::9::Privilege";
 RuleNumber = "V-73771";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73771' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73771')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyInteractiveLogonRight";
 Operation = "Add";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73771' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege47ref
{
ResourceID = "[Privilege]V-73775";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2452::9::Privilege";
 RuleNumber = "V-73775";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-73775') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-73775' )|| 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyRemoteInteractiveLogonRight";
 Operation = "Add";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73775' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege48ref
{
ResourceID = "[Privilege]V-73779";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2461::9::Privilege";
 RuleNumber = "V-73779";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73779' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73779')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeEnableDelegationPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73779' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity18ref
{
ResourceID = "[AccountSecurity]V-73809";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2937::9::AccountSecurity";
 RuleNumber = "V-73809";
 Desired = "Disable";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73809' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73809')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "DisableGuest";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73809' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry257ref
{
ResourceID = "[DSCRegistry]V-73621";
 ValueName = "LimitBlankPasswordUse";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1222::9::DSCRegistry";
 RuleNumber = "V-73621";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73621' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73621')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73621' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity19ref
{
ResourceID = "[AccountSecurity]V-73623";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2945::9::AccountSecurity";
 RuleNumber = "V-73623";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73623' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73623')) || 
'";
 Desired = "NotAdmin";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameAdministrator";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73623' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity20ref
{
ResourceID = "[AccountSecurity]V-73625";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2954::9::AccountSecurity";
 RuleNumber = "V-73625";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73625' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73625')) || 
'";
 Desired = "Visitor";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameGuest";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73625' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry258ref
{
ResourceID = "[DSCRegistry]V-73627";
 ValueName = "SCENoApplyLegacyAuditPolicy";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\  Administrator\\All-rules-testing-profiles.ps1::1256::9::DSCRegistry";
 RuleNumber = "V-73627";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73627' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73627')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73627' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry259ref
{
ResourceID = "[DSCRegistry]V-73633";
 ValueName = "RequireSignOrSeal";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1279::3::DSCRegistry";
 RuleNumber = "V-73633";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73633' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73633')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73633' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry260ref
{
ResourceID = "[DSCRegistry]V-73635";
 ValueName = "SealSecureChannel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1291::3::DSCRegistry";
 RuleNumber = "V-73635";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73635' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73635')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73635' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry261ref
{
ResourceID = "[DSCRegistry]V-73637";
 ValueName = "SignSecureChannel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1303::3::DSCRegistry";
 RuleNumber = "V-73637";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73637' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73637')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73637' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry262ref
{
ResourceID = "[DSCRegistry]V-73639";
 ValueName = "DisablePasswordChange";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1315::9::DSCRegistry";
 RuleNumber = "V-73639";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73639' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73639')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73639' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry35ref
{
ResourceID = "[CustomRegistry]V-73641";
 Minimum = "1";
 ValueName = "MaximumPasswordAge";
 ValueType = "DWORD";
 Maximum = "30";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-73641";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73641' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73641')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 ModuleVersion = "1.0";
};' into v_str from dual ;

  if create_mof ( v_str , 'V-73641' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry263ref
{
ResourceID = "[DSCRegistry]V-73643";
 ValueName = "RequireStrongKey";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1337::3::DSCRegistry";
 RuleNumber = "V-73643";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73643' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73643')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73643' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry36ref
{
ResourceID = "[CustomRegistry]V-73645"; 
 Minimum = "1";
 ValueName = "InactivityTimeoutSecs";
 ValueType = "DWORD";
 Maximum = "900";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-73645";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73645' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73645')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";
};' into v_str from dual ;

  if create_mof ( v_str , 'V-73645' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry37ref
{
ResourceID = "[CustomRegistry]V-73647";
 RuleStatus = "Default";
 ValueName = "LegalNoticeText";
 ValueType = "STRING";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1386::3::CustomRegistry";
 RuleNumber = "V-73647";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-73647') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-73647' )|| 
'";
 Desired = "You are accessing a Private Information System, all rights reserved";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73647' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry38ref
{
ResourceID = "[CustomRegistry]V-73649";
 RuleStatus = "Default";
 ValueName = "LegalNoticeCaption";
 ValueType = "STRING";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1396::3::CustomRegistry";
 RuleNumber = "V-73649";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73649' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73649')) || 
'";
 Desired = "Notice and Consent Banner";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73649' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry39ref
{
ResourceID = "[CustomRegistry]V-73807";
 Minimum = "1";
 ValueName = "SCRemoveOption";
 ValueType = "STRING";
 Maximum = "2";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1426::5::CustomRegistry";
 RuleNumber = "V-73807";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73807' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73807')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73807' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry264ref
{
ResourceID = "[DSCRegistry]V-73653";
 ValueName = "RequireSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1438::3::DSCRegistry";
 RuleNumber = "V-73653";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73653' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73653')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73653' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry265ref
{
ResourceID = "[DSCRegistry]V-73655";
 ValueName = "EnableSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1449::3::DSCRegistry";
 RuleNumber = "V-73655";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73655' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73655')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73655' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry266ref
{
ResourceID = "[DSCRegistry]V-73657";
 ValueName = "EnablePlainTextPassword";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1460::3::DSCRegistry";
 RuleNumber = "V-73657";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73657' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73657')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73657' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry40ref
{
ResourceID = "[CustomRegistry]V-73659";
 RuleStatus = "Default";
 ValueName = "AutoDisconnect";
 ValueType = "Dword";
 Minimum = "1";
 Maximum = "15";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1471::9::CustomRegistry";
 RuleNumber = "V-73659";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73659' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73659')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73659' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry267ref
{
ResourceID = "[DSCRegistry]V-73661";
 ValueName = "RequireSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1481::9::DSCRegistry";
 RuleNumber = "V-73661";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73661' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73661')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73661' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry268ref
{
ResourceID = "[DSCRegistry]V-73663";
 ValueName = "EnableSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1493::9::DSCRegistry";
 RuleNumber = "V-73663";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73663' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73663')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73663' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Secpol as $Secpol6ref
{
ResourceID = "[Secpol]V-73665";
 Manual = "False";
 Desired = "Disable";
 RuleStatus = "Default";
 Policy = "LSAAnonymousNameLookup";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4527::9::Secpol";
 RuleNumber = "V-73665";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-73665') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-73665' )|| 
'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73665' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry269ref
{
ResourceID = "[DSCRegistry]V-73667";
 ValueName = "RestrictAnonymousSAM";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1674::3::DSCRegistry";
 RuleNumber = "V-73667";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73667' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73667')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73667' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry270ref
{
ResourceID = "[DSCRegistry]V-73669";
 ValueName = "RestrictAnonymous";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1685::3::DSCRegistry";
 RuleNumber = "V-73669";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73669' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73669')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73669' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry271ref
{
ResourceID = "[DSCRegistry]V-73671";
 ValueName = "DisableDomainCreds";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1696::3::DSCRegistry";
 RuleNumber = "V-73671";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73671' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73671')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73671' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry272ref
{
ResourceID = "[DSCRegistry]V-73673";
 ValueName = "EveryoneIncludesAnonymous";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1707::3::DSCRegistry";
 RuleNumber = "V-73673";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73673' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73673')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73673' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry273ref
{
ResourceID = "[DSCRegistry]V-73675";
 ValueName = "RestrictNullSessAccess";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1764::9::DSCRegistry";
 RuleNumber = "V-73675";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73675' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73675')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73675' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry274ref
{
ResourceID = "[DSCRegistry]V-73679";
 ValueName = "UseMachineId";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1796::3::DSCRegistry";
 RuleNumber = "V-73679";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73679' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73679')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73679' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry275ref
{
ResourceID = "[DSCRegistry]V-73681";
 ValueName = "allownullsessionfallback";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1807::3::DSCRegistry";
 RuleNumber = "V-73681";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73681' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73681')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73681' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry276ref
{
ResourceID = "[DSCRegistry]V-73683";
 ValueName = "AllowOnlineID";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA\\pku2u\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2117::5::DSCRegistry";
 RuleNumber = "V-73683";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73683' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73683')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73683' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry277ref
{
ResourceID = "[DSCRegistry]V-73687";
 ValueName = "NoLMHash";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1818::9::DSCRegistry";
 RuleNumber = "V-73687";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73687' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73687')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73687' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity21ref
{
ResourceID = "[AccountSecurity]V-73689";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2929::9::AccountSecurity";
 RuleNumber = "V-73689";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73689' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73689')) || 
'";
 Desired = "0";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "ForceLogoff";
 ModuleVersion = "1.1";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73689' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry278ref
{
ResourceID = "[DSCRegistry]V-73691";
 ValueName = "LmCompatibilityLevel";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1829::3::DSCRegistry";
 RuleNumber = "V-73691";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73691' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73691')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73691' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry279ref
{
ResourceID = "[DSCRegistry]V-73693";
 ValueName = "LDAPClientIntegrity";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LDAP";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1840::3::DSCRegistry";
 RuleNumber = "V-73693";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73693' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73693')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73693' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry280ref
{
ResourceID = "[DSCRegistry]V-73695";
 ValueName = "NTLMMinClientSec";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1851::3::DSCRegistry";
 RuleNumber = "V-73695";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73695' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73695')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "537395200";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73695' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry281ref
{
ResourceID = "[DSCRegistry]V-73697";
 ValueName = "NTLMMinServerSec";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1862::3::DSCRegistry";
 RuleNumber = "V-73697";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73697' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73697')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "537395200";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73697' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry282ref
{
ResourceID = "[DSCRegistry]V-73699";
 ValueName = "ForceKeyProtection";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Cryptography";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-73699";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73699' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73699')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73699' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry283ref
{
ResourceID = "[DSCRegistry]V-73703";
 ValueName = "ObCaseInsensitive";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Kernel";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1917::3::DSCRegistry";
 RuleNumber = "V-73703";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73703' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73703')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73703' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry284ref
{
ResourceID = "[DSCRegistry]V-73705";
 ValueName = "ProtectionMode";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1928::3::DSCRegistry";
 RuleNumber = "V-73705";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73705' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73705')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73705' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry285ref
{
ResourceID = "[DSCRegistry]V-73707";
 ValueName = "FilterAdministratorToken";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1939::3::DSCRegistry";
 RuleNumber = "V-73707";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73707' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73707')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73707' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry286ref
{
ResourceID = "[DSCRegistry]V-73709";
 ValueName = "EnableUIADesktopToggle";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2038::3::DSCRegistry";
 RuleNumber = "V-73709";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73709' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73709')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73709' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry41ref
{
ResourceID = "[CustomRegistry]V-73711";
 Minimum = "1";
 ValueName = "ConsentPromptBehaviorAdmin";
 ValueType = "DWORD";
 Maximum = "4";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-73711";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73711' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73711')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73711' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry287ref
{
ResourceID = "[DSCRegistry]V-73713";
 ValueName = "ConsentPromptBehaviorUser";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1961::3::DSCRegistry";
 RuleNumber = "V-73713";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73713' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73713')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73713' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry288ref
{
ResourceID = "[DSCRegistry]V-73715";
 ValueName = "EnableInstallerDetection";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1972::3::DSCRegistry";
 RuleNumber = "V-73715";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73715' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73715')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73715' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry289ref
{
ResourceID = "[DSCRegistry]V-73717";
 ValueName = "EnableSecureUIAPaths";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1994::3::DSCRegistry";
 RuleNumber = "V-73717";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73717' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73717')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73717' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry290ref
{
ResourceID = "[DSCRegistry]V-73719";
 ValueName = "EnableLUA";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2005::9::DSCRegistry";
 RuleNumber = "V-73719";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73719' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73719')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73719' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   
select 'instance of DSCRegistry as $DSCRegistry291ref
{
ResourceID = "[DSCRegistry]V-73721";
 ValueName = "EnableVirtualization";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2027::3::DSCRegistry";
 RuleNumber = "V-73721";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73721' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73721')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73721' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege49ref
{
ResourceID = "[Privilege]V-73729";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-73729";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73729' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73729')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeTrustedCredManAccessPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73729' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege50ref
{
ResourceID = "[Privilege]V-73735";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2290::9::Privilege";
 RuleNumber = "V-73735";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73735' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73735')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeTcbPrivilege";
 Operation = "Remove All";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73735' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege51ref
{
ResourceID = "[Privilege]V-73739";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2307::9::Privilege";
 RuleNumber = "V-73739";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73739' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73739')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeInteractiveLogonRight";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73739' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege52ref
{
ResourceID = "[Privilege]V-73743";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2325::9::Privilege";
 RuleNumber = "V-73743";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73743' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73743')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeBackupPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73743' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege53ref
{
ResourceID = "[Privilege]V-73745";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2360::9::Privilege";
 RuleNumber = "V-73745";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73745' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73745')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreatePagefilePrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73745' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege54ref
{
ResourceID = "[Privilege]V-73747";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2370::9::Privilege";
 RuleNumber = "V-73747";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73747' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73747')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateTokenPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73747' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege55ref
{
ResourceID = "[Privilege]V-73749";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Service",
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2378::9::Privilege";
 RuleNumber = "V-73749";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73749' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73749')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateGlobalPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73749' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege56ref
{
ResourceID = "[Privilege]V-73751";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2387::9::Privilege";
 RuleNumber = "V-73751";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73751' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73751')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreatePermanentPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73751' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege57ref
{
ResourceID = "[Privilege]V-73753";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2395::9::Privilege";
 RuleNumber = "V-73753";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73753' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73753')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateSymbolicLinkPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73753' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege58ref
{
ResourceID = "[Privilege]V-73755";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2404::9::Privilege";
 RuleNumber = "V-73755";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73755' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73755')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDebugPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73755' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---


select 'instance of Privilege as $Privilege59ref
{
ResourceID = "[Privilege]V-73781";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2469::9::Privilege";
 RuleNumber = "V-73781";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73781' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73781')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeRemoteShutdownPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73781' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege60ref
{
ResourceID = "[Privilege]V-73783";
 RuleStatus = "Default";
 Members = {
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2478::9::Privilege";
 RuleNumber = "V-73783";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73783' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73783')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeAuditPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;
     
  if create_mof ( v_str , 'V-73783' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege61ref
{
ResourceID = "[Privilege]V-73785";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "NT Authority\\Service",
    "NT Authority\\Local Service",
    "NT Authority\\Network Service"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2487::9::Privilege";
 RuleNumber = "V-73785";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73785' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73785')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeImpersonatePrivilege";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73785' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege62ref
{
ResourceID = "[Privilege]V-73787";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2505::9::Privilege";
 RuleNumber = "V-73787";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73787' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73787')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseBasePriorityPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73787' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege63ref
{
ResourceID = "[Privilege]V-73789";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2514::9::Privilege";
 RuleNumber = "V-73789";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73789' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73789')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeLoadDriverPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73789' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

  select 'instance of Privilege as $Privilege64ref
{
ResourceID = "[Privilege]V-73791";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2523::9::Privilege";
 RuleNumber = "V-73791";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73791' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73791')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeLockMemoryPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73791' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege65ref
{
ResourceID = "[Privilege]V-73793";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2540::9::Privilege";
 RuleNumber = "V-73793";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73793' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73793')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeSecurityPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73793' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege66ref
{
ResourceID = "[Privilege]V-73795";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2557::9::Privilege";
 RuleNumber = "V-73795";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73795' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73795')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemEnvironmentPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73795' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege67ref
{
ResourceID = "[Privilege]V-73797";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2566::9::Privilege";
 RuleNumber = "V-73797";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73797' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73797')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeManageVolumePrivilege";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73797' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege68ref
{
ResourceID = "[Privilege]V-73799";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2575::9::Privilege";
 RuleNumber = "V-73799";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73799' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73799')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeProfileSingleProcessPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-73799' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege69ref
{
ResourceID = "[Privilege]V-73801";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2602::9::Privilege";
 RuleNumber = "V-73801";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73801' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73801')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeRestorePrivilege";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73801' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege70ref
{
ResourceID = "[Privilege]V-73803";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2620::9::Privilege";
 RuleNumber = "V-73803";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73803' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73803')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeTakeOwnershipPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73803' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of SystemCheck as $SystemCheck10ref
{
ResourceID = "[SystemCheck]V-73239";
 Manual = "False";
 RuleNumber = "V-73239";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73239' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73239')) || 
'";
 RuleStatus = "Default";
 Desired = "1607";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "BuildNumber";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73239' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---


select 'instance of AccountSecurity as $AccountSecurity22ref
{
ResourceID = "[AccountSecurity]V-73309";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2888::9::AccountSecurity";
 RuleNumber = "V-73309";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-73309') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-73309' )|| 
'";
 Minimum = "15";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutDuration";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73309' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity23ref
{
ResourceID = "[AccountSecurity]V-73311";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "3";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2870::9::AccountSecurity";
 RuleNumber = "V-73311";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73311' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73311')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutThreshold";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73311') = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity24ref
{
ResourceID = "[AccountSecurity]V-73313";
 Minimum = "15";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2879::8::AccountSecurity";
 RuleNumber = "V-73313";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73313' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73313')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutWindow";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73313' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol89ref
{
ResourceID = "[AuditPol]V-73443";
 RuleStatus = "Default";
 AuditPolicy = "Account Lockout";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3210::9::AuditPol";
 RuleNumber = "V-73443";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73443' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73443')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73443' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol90ref
{
ResourceID = "[AuditPol]V-73457";
 RuleStatus = "Default";
 AuditPolicy = "Removable storage";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-73457";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73457' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73457')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73457' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol91ref
{
ResourceID = "[AuditPol]V-73467";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3827::9::AuditPol";
 RuleNumber = "V-73467";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73467' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73467')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
   

  if create_mof ( v_str , 'V-73467' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol92ref
{
ResourceID = "[AuditPol]V-73477";
 RuleStatus = "Default";
 AuditPolicy = "Other System Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3393::9::AuditPol";
 RuleNumber = "V-73477";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73477' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73477')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
    
  if create_mof ( v_str , 'V-73477' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry292ref
{
ResourceID = "[DSCRegistry]V-73559";
 ValueName = "EnableSmartScreen";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::781::3::DSCRegistry";
 RuleNumber = "V-73559";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73559' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73559')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73559' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry293ref
{
ResourceID = "[DSCRegistry]V-73685";
 ValueName = "SupportedEncryptionTypes";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\Kerberos\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2128::5::DSCRegistry";
 RuleNumber = "V-73685";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-73685') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-73685' )|| 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2147483640";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73685' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol93ref
{
ResourceID = "[AuditPol]V-73431";
 RuleStatus = "Default";
 AuditPolicy = "Plug and Play Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3393::9::AuditPol";
 RuleNumber = "V-73431";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73431' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73431')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
    
  if create_mof ( v_str , 'V-73431' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol94ref
{
ResourceID = "[AuditPol]V-73445";
 RuleStatus = "Default";
 AuditPolicy = "Account Lockout";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3393::9::AuditPol";
 RuleNumber = "V-73445";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73445' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73445')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
    
  if create_mof ( v_str , 'V-73445' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol95ref
{
ResourceID = "[AuditPol]V-73447";
 RuleStatus = "Default";
 AuditPolicy = "Group Membership";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3393::9::AuditPol";
 RuleNumber = "V-73447";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73447' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73447')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
    
  if create_mof ( v_str , 'V-73447' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol96ref
{
ResourceID = "[AuditPol]V-73459";
 RuleStatus = "Default";
 AuditPolicy = "Removable Storage";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2721::9::AuditPol";
 RuleNumber = "V-73459";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73459' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73459')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73459' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol97ref
{
ResourceID = "[AuditPol]V-73479";
 RuleStatus = "Default";
 AuditPolicy = "Other System Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3393::9::AuditPol";
 RuleNumber = "V-73479";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73479' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73479')) || 
'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
    
  if create_mof ( v_str , 'V-73479' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry294ref
{
ResourceID = "[DSCRegistry]V-73493";
 ValueName = "NoLockScreenSlideshow";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Personalization";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73493";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73493' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73493')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73493' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry295ref
{
ResourceID = "[DSCRegistry]V-73497";
 ValueName = "UseLogonCredential";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\SecurityProviders\\Wdigest";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73497";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73497' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73497')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73497' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry296ref
{
ResourceID = "[DSCRegistry]V-73507";
 ValueName = "AllowInsecureGuestAuth";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\LanmanWorkstation";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73507";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73507' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73507')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73507' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry299ref
{
ResourceID = "[DSCRegistry]V-73511";
 ValueName = "ProcessCreationIncludeCmdLine_Enabled";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\Audit";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73511";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73511' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73511')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73511' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry300ref
{
ResourceID = "[DSCRegistry]V-73531";
 ValueName = "DontDisplayNetworkSelectionUI";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73531";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73531' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73531')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73531' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry301ref
{
ResourceID = "[DSCRegistry]V-73535";
 ValueName = "MitigationOptions_FontBocking";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\MitigationOptions";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73535";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73535' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73535')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "1000000000000";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73535' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry42ref
{
ResourceID = "[CustomRegistry]V-73551";
 Minimum = "0";
 Maximum = "1";
 ValueName = "AllowTelemetry";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-73551";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73551' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73551')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DataCollection";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73551' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry302ref
{
ResourceID = "[DSCRegistry]V-73581";
 ValueName = "AllowIndexingEncryptedStoresOrItems";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73581";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73581' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73581')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73581' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry303ref
{
ResourceID = "[DSCRegistry]V-73589";
 ValueName = "DisableAutomaticRestartSignOn";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73589";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73589' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73589')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73589' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry304ref
{
ResourceID = "[DSCRegistry]V-73591";
 ValueName = "EnableScriptBlockLogging";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\PowerShell\\ScriptBlockLogging";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73591";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73591' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73591')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73591' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry305ref
{
ResourceID = "[DSCRegistry]V-73677";
 ValueName = "RestrictRemoteSAM";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\PowerShell\\ScriptBlockLogging";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-73677";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73677' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73677')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "O:BAG:BAD:(A;;RC;;;BA)";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-73677' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of SystemCheck as $SystemCheck11ref
{
ResourceID = "[SystemCheck]V-73000";
 Manual = "True";
 RuleNumber = "V-73000";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73000' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-73000')) || 
'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "Patch";
 Desired = "KB4013429,10.0.14393.953";
 Link = "http://download.windowsupdate.com/c/msdownload/update/software/secu/2017/03/windows10.0-kb4013429-x64_delta_24521980a64972e99692997216f9d2cf73803b37.msu";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";
 
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-73000' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege100ref
{
ResourceID = "[Privilege]V-5001";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"    
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2280::9::Privilege";
 RuleNumber = "V-5001";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5001' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5001')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeMachineAccountPrivilege";
 Operation = "Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-5001' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of Privilege as $Privilege101ref
{
ResourceID = "[Privilege]V-5002";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"    
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2280::9::Privilege";
 RuleNumber = "V-5002";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5002' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5002')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyServiceLogonRight";
 Operation = "Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-5002' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry401ref
{
ResourceID = "[DSCRegistry]V-5003";
 ValueName = "LDAPServerIntegrity";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\NTDS\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5003";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5003' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5003')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5003' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry402ref
{
ResourceID = "[DSCRegistry]V-5004";
 ValueName = "SubmitControl";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5004";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5004' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5004')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5004' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry403ref
{
ResourceID = "[DSCRegistry]V-5005";
 ValueName = "RefusePasswordChange";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5005";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5005' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5005')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5005' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry404ref
{
ResourceID = "[DSCRegistry]V-5006";
 ValueName = "SMBServerNameHardeningLevel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5006";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5006' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5006')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5006' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry406ref
{
ResourceID = "[DSCRegistry]V-5008";
 ValueName = "Enabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NtpClient";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5008";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5008' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5008')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5008' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry407ref
{
ResourceID = "[DSCRegistry]V-5009";
 ValueName = "DisabledComponents";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\TCPIP6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5009";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5009' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5009')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "255";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5009' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry408ref
{
ResourceID = "[DSCRegistry]V-5010";
 ValueName = "NoBackgroundPolicy";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Group Policy\\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5010";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5010' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5010')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5010' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry409ref
{
ResourceID = "[DSCRegistry]V-5011";
 ValueName = "PreventHandwritingDataSharing";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TabletPC";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5011";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5011' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5011')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5011' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry410ref
{
ResourceID = "[DSCRegistry]V-5012";
 ValueName = "NoRegistration";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Registration Wizard";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5012";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5012' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5012')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5012' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry411ref
{
ResourceID = "[DSCRegistry]V-5013";
 ValueName = "CEIP";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Messenger\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5013";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5013' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5013')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5013' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry412ref
{
ResourceID = "[DSCRegistry]V-5014";
 ValueName = "Retention";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Setup";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5014";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5014' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5014')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5014' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry413ref
{
ResourceID = "[DSCRegistry]V-5015";
 ValueName = "AllowIndexingEncryptedStoresOrItems";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Search";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5015";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5015' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5015')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5015' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry414ref
{
ResourceID = "[DSCRegistry]V-5016";
 ValueName = "EnableScriptBlockLogging";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\PowerShell\\ScriptBlockLogging";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5016";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5016' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5016')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5016' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry415ref
{
ResourceID = "[DSCRegistry]V-5017";
 ValueName = "EnableTranscripting";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\PowerShell\\Transcription";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5017";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5017' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5017')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5017' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry416ref
{
ResourceID = "[DSCRegistry]V-5018";
 ValueName = "AlwaysInstallElevated";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer\\AlwaysInstallElevated";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-5018";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5018' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-5018')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-5018' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

-- MOF for CIS Rules (Different Value)
--CIS 1.2.1 (L1) Mapped Rule V-1099
select 'instance of AccountSecurity as $AccountSecurity61ref
{
ResourceID = "[AccountSecurity]V-6001";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6001::9::AccountSecurity";
 RuleNumber = "V-6001";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-6001') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-6001' )|| 
'";
 Minimum = "15";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutDuration";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6001' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 1.2.2 (L1) Mapped Rule V-1097
select 'instance of AccountSecurity as $AccountSecurity62ref
{
ResourceID = "[AccountSecurity]V-6002";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "10";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6002::9::AccountSecurity";
 RuleNumber = "V-6002";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6002' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6002')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutThreshold";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6002') = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 1.2.3 (L1) Mapped Rule V-1098
select 'instance of AccountSecurity as $AccountSecurity63ref
{
ResourceID = "[AccountSecurity]V-6003";
 Minimum = "15";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1098::8::AccountSecurity";
 RuleNumber = "V-6003";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6003' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6003')) || 
'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutWindow";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6003' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.2.7 (L1) Mapped Rule V-26473
select 'instance of Privilege as $Privilege81ref
{
ResourceID = "[Privilege]V-6004";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "BUILTIN\\Remote Desktop Users"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6004::9::Privilege";
 RuleNumber = "V-6004";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6004' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6004')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeRemoteInteractiveLogonRight";
 Operation = "Add-Allow Only";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6004' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.2.17 (L1) Mapped Rule V-1155
select 'instance of Privilege as $Privilege82ref
{
ResourceID = "[Privilege]V-6005";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests",
    "NT AUTHORITY\\Local account and member of Administrators group"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6005::9::Privilege";
 RuleNumber = "V-6005";
 Manual = "True";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6005' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6005')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyNetworkLogonRight";
 Operation = "Add";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-6005' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.2.21 (L1) Mapped Rule V-26486
select 'instance of Privilege as $Privilege83ref
{
ResourceID = "[Privilege]V-6006";
 RuleStatus = "Default";
 Manual = "True";
 Members = {
    "BUILTIN\\Guests",
    "NT AUTHORITY\\Local account"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6006::9::Privilege";
 RuleNumber = "V-6006";
 Severity = "'||
 (select max(CRITICALITY_ID) from cpe_rule_header where name='V-6006') ||
'";
 RuleId = "'|| 
 (select max(id) from cpe_rule_header where name='V-6006' )|| 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyRemoteInteractiveLogonRight";
 Operation = "Add";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6006' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.3.7.7 (L1) Mapped Rule V-1172
select 'instance of CustomRegistry as $CustomRegistry51ref
{
ResourceID = "[CustomRegistry]V-6007";
 Minimum = "5";
 Maximum = "14";
 ValueName = "PasswordExpiryWarning";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6007::3::CustomRegistry";
 RuleNumber = "V-6007";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6007' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6007')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6007' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.3.7.9 (L1) Mapped Rule V-1157
select 'instance of CustomRegistry as $CustomRegistry52ref
{
ResourceID = "[CustomRegistry]V-6008";
 Minimum = "1";
 ValueName = "SCRemoveOption";
 ValueType = "STRING";
 Maximum = "3";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6008::5::CustomRegistry";
 RuleNumber = "V-6008";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6008' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6008')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6008' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.3.9.5 (L1) Mapped Rule V-21950
select 'instance of CustomRegistry as $CustomRegistry53ref
{
ResourceID = "[CustomRegistry]V-6009";
 Minimum = "1";
 ValueName = "SmbServerNameHardeningLevel";
 ValueType = "Dword";
 Maximum = "2";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6009::5::CustomRegistry";
 RuleNumber = "V-6009";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6009' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6009')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6009' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.3.11.8 (L1) Mapped Rule V-3381 
select 'instance of CustomRegistry as $CustomRegistry54ref
{
ResourceID = "[CustomRegistry]V-6010";
 Minimum = "1";
 ValueName = "LDAPClientIntegrity";
 ValueType = "Dword";
 Maximum = "2";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6010::5::CustomRegistry";
 RuleNumber = "V-6010";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6010' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6010')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LDAP";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6010' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 17.2.1 (L1) Mapped Rule V-56303
select 'instance of AuditPol as $AuditPol101ref
{
ResourceID = "[AuditPol]V-6011";
 RuleStatus = "Default";
 AuditPolicy = "Application Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6011::9::AuditPol";
 RuleNumber = "V-6011";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6011' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6011')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6011' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 17.5.1 (L1) Mapped Rule V-56308
select 'instance of AuditPol as $AuditPol102ref
{
ResourceID = "[AuditPol]V-6012";
 RuleStatus = "Default";
 AuditPolicy = "Account Lockout";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6012::9::AuditPol";
 RuleNumber = "V-6012";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6012' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6012')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6012' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 17.5.4 (L1) Mapped Rule V-56313
select 'instance of AuditPol as $AuditPol103ref
{
ResourceID = "[AuditPol]V-6013";
 RuleStatus = "Default";
 AuditPolicy = "Other Logon/Logoff Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6013::9::AuditPol";
 RuleNumber = "V-6013";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6013' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6013')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6013' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 17.6.1 (L1) Mapped Rule V-56323
select 'instance of AuditPol as $AuditPol104ref
{
ResourceID = "[AuditPol]V-6014";
 RuleStatus = "Default";
 AuditPolicy = "Other Object Access Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6014::9::AuditPol";
 RuleNumber = "V-6014";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6014' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6014')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6014' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 17.6.2 (L1) Mapped Rule V-36667
select 'instance of AuditPol as $AuditPol105ref
{
ResourceID = "[AuditPol]V-6015";
 RuleStatus = "Default";
 AuditPolicy = "Removable storage";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6015::9::AuditPol";
 RuleNumber = "V-6015";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6015' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6015')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6015' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 17.9.2 (L1) Mapped Rule V-56331
select 'instance of AuditPol as $AuditPol106ref
{
ResourceID = "[AuditPol]V-6016";
 RuleStatus = "Default";
 AuditPolicy = "Other System Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6016::9::AuditPol";
 RuleNumber = "V-6016";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6016' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6016')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ;
    
  if create_mof ( v_str , 'V-6016' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.4.5 (L2) Mapped Rule V-4113
select 'instance of DSCRegistry as $DSCRegistry341ref
{
ResourceID = "[DSCRegistry]V-6017";
 ValueName = "KeepAliveTime";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6017::9::DSCRegistry";
 RuleNumber = "V-6017";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6017' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6017')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "300000";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6017' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.4.10 (L2) Mapped Rule V-21956
select 'instance of CustomRegistry as $CustomRegistry56ref
{
ResourceID = "[CustomRegistry]V-6018"; 
 ValueName = "TcpMaxDataRetransmissions";
 ValueType = "DWORD";
 Desired = "3";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::6018::2::CustomRegistry";
 RuleNumber = "V-6018";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6018' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6018')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 ModuleVersion = "1.0";
};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6018' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.4.11 (L2) Mapped Rule V-4438
select 'instance of CustomRegistry as $CustomRegistry57ref
{
ResourceID = "[CustomRegistry]V-6019";
 ValueName = "TcpMaxDataRetransmissions";
 ValueType = "DWORD";
 Desired = "3";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::6019::2::CustomRegistry";
 RuleNumber = "V-6019";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6019' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6019')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 ModuleVersion = "1.0";
};' into v_str from dual ;

  if create_mof ( v_str , 'V-6019' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.3.1 (L1) Mapped Rule V-73511
select 'instance of DSCRegistry as $DSCRegistry311ref
{
ResourceID = "[DSCRegistry]V-6020";
 ValueName = "ProcessCreationIncludeCmdLine_Enabled";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\Audit";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6020::9::DSCRegistry";
 RuleNumber = "V-6020";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6020' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6020')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6020' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---


--CIS 18.8.14.1 (L1) Mapped Rule V-36679
select 'instance of DSCRegistry as $DSCRegistry312ref
{
ResourceID = "[DSCRegistry]V-6021";
 ValueName = "DriverLoadPolicy";
 Key = "HKLM:\\System\\CurrentControlSet\\Policies\\EarlyLaunch";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6021::3::DSCRegistry";
 RuleNumber = "V-6021";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6021' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6021')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6021' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.26.1.1 (L1) Mapped Rule V-56364
select 'instance of GPRegistry as $GPRegistry51ref
{
ResourceID = "[GPRegistry]V-6022-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6021::9::GPRegistry";
 RuleNumber = "V-6022-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6022' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6022')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";

};

instance of GPRegistry as $GPRegistry52ref
{
ResourceID = "[GPRegistry]V-6022-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6021::9::GPRegistry";
 RuleNumber = "V-6022-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6022' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6022')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6022' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.26.2.1 (L1) Mapped Rule V-56370
select 'instance of GPRegistry as $GPRegistry53ref
{
ResourceID = "[GPRegistry]V-6023-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6023::9::GPRegistry";
 RuleNumber = "V-6023-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6023' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6023')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";

};

instance of GPRegistry as $GPRegistry54ref
{
ResourceID = "[GPRegistry]V-6023-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6023::9::GPRegistry";
 RuleNumber = "V-6023-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6023' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6023')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6023' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.26.4.1 (L1) Mapped Rule V-56373
select 'instance of GPRegistry as $GPRegistry55ref
{
ResourceID = "[GPRegistry]V-6024-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\System";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6024::9::GPRegistry";
 RuleNumber = "V-6024-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6024' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6024')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";

};

instance of GPRegistry as $GPRegistry56ref
{
ResourceID = "[GPRegistry]V-6024-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\System";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6024::9::GPRegistry";
 RuleNumber = "V-6024-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6024' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6024')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6024' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.81.2.1 (L1) Mapped Rule V-57477
select 'instance of DSCRegistry as $DSCRegistry313ref
{
ResourceID = "[DSCRegistry]V-6025";
 ValueName = "DefaultConsent";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting\\Consent";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6025::7::DSCRegistry";
 RuleNumber = "V-6025";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6025' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6025')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6025' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.95.1 (L1) Mapped Rule V-73591
    select 'instance of CustomRegistry as $CustomRegistry61ref
{
ResourceID = "[CustomRegistry]V-6026";
 Desired = "0";
 ValueName = "EnableScriptBlockLogging";
 ValueType = "DWORD";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-6026";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6026' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6026')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\PowerShell\\ScriptBlockLogging";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6026' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.2.19 (L1)
select 'instance of Privilege as $Privilege84ref
{
ResourceID = "[Privilege]V-6027";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6027::9::Privilege";
 RuleNumber = "V-6027";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6027' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6027')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyServiceLogonRight";
 Operation = "Add";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-6027' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 2.3.1.2 (L1)
select 'instance of DSCRegistry as $DSCRegistry315ref
{
ResourceID = "[DSCRegistry]V-6029";
 ValueName = "NoConnectedUser";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\system";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6029::9::DSCRegistry";
 RuleNumber = "V-6029";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6029' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6029')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6029' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.1.5 (L1)
select 'instance of GPRegistry as $GPRegistry57ref
{
ResourceID = "[GPRegistry]V-6030";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6030::9::GPRegistry";
 RuleNumber = "V-6030";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6030' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6030')) || 
'";
 ValueType = "STRING";
 ModuleName = "xGPRegistry";
 ValueData = "%SYSTEMROOT%\\System32\\logfiles\\firewall\\domainfw.log";
 Property = "Domain:FileName:%SYSTEMROOT%\\System32\\logfiles\\firewall\\domainfw.log";
 PolicyName = "Domain Logging";
 ModuleVersion = "1.0";
 ValueName = "LogFilePath";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6030' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.1.6 (L1)
select 'instance of GPRegistry as $GPRegistry58ref
{
ResourceID = "[GPRegistry]V-6031";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6031::9::GPRegistry";
 RuleNumber = "V-6031";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6031' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6031')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "16384";
 Property = "Domain:MaxFileSize:16384";
 PolicyName = "Domain Logging Size Limit";
 ModuleVersion = "1.0";
 ValueName = "LogFileSize";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6031' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.1.7 (L1)
select 'instance of GPRegistry as $GPRegistry59ref
{
ResourceID = "[GPRegistry]V-6032";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6032::9::GPRegistry";
 RuleNumber = "V-6032";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6032' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6032')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Domain:LogDroppedConnections:Enable";
 PolicyName = "Domain Logging Log dropped packets";
 ModuleVersion = "1.0";
 ValueName = "LogDroppedPackets";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6032' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.1.8 (L1)
select 'instance of GPRegistry as $GPRegistry60ref
{
ResourceID = "[GPRegistry]V-6033";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6032::9::GPRegistry";
 RuleNumber = "V-6033";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6033' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6033')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Domain:LogAllowedConnections:Enable";
 PolicyName = "Domain Logging Log successful connections";
 ModuleVersion = "1.0";
 ValueName = "LogSuccessfulConnections";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6033' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.2.5 (L1)
select 'instance of GPRegistry as $GPRegistry61ref
{
ResourceID = "[GPRegistry]V-6034";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6034::9::GPRegistry";
 RuleNumber = "V-6034";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6034' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6034')) || 
'";
 ValueType = "STRING";
 ModuleName = "xGPRegistry";
 ValueData = "%SYSTEMROOT%\\System32\\logfiles\\firewall\\privatefw.log";
 Property = "Private:FileName:%SYSTEMROOT%\\System32\\logfiles\\firewall\\privatefw.log";
 PolicyName = "Private Logging";
 ModuleVersion = "1.0";
 ValueName = "LogFilePath";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6034' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.2.6 (L1)
select 'instance of GPRegistry as $GPRegistry62ref
{
ResourceID = "[GPRegistry]V-6035";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6035::9::GPRegistry";
 RuleNumber = "V-6035";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6035' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6035')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "16384";
 Property = "Private:MaxFileSize:16384";
 PolicyName = "Private Logging Size Limit";
 ModuleVersion = "1.0";
 ValueName = "LogFileSize";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6035' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.2.7 (L1)
select 'instance of GPRegistry as $GPRegistry63ref
{
ResourceID = "[GPRegistry]V-6036";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6036::9::GPRegistry";
 RuleNumber = "V-6036";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6036' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6036')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Private:LogDroppedConnections:Enable";
 PolicyName = "Private Logging Log dropped packets";
 ModuleVersion = "1.0";
 ValueName = "LogDroppedPackets";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6036' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.2.8 (L1)
select 'instance of GPRegistry as $GPRegistry64ref
{
ResourceID = "[GPRegistry]V-6037";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6037::9::GPRegistry";
 RuleNumber = "V-6037";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6037' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6037')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Private:LogAllowedConnections:Enable";
 PolicyName = "Private Logging Log successful connections";
 ModuleVersion = "1.0";
 ValueName = "LogSuccessfulConnections";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6037' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.3.7 (L1)
select 'instance of GPRegistry as $GPRegistry65ref
{
ResourceID = "[GPRegistry]V-6038";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6038::9::GPRegistry";
 RuleNumber = "V-6038";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6038' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6038')) || 
'";
 ValueType = "STRING";
 ModuleName = "xGPRegistry";
 ValueData = "%SYSTEMROOT%\\System32\\logfiles\\firewall\\publicfw.log";
 Property = "Public:FileName:%SYSTEMROOT%\\System32\\logfiles\\firewall\\publicfw.log";
 PolicyName = "Public Logging";
 ModuleVersion = "1.0";
 ValueName = "LogFilePath";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6038' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.3.8 (L1)
select 'instance of GPRegistry as $GPRegistry66ref
{
ResourceID = "[GPRegistry]V-6039";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6039::9::GPRegistry";
 RuleNumber = "V-6039";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6039' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6039')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "16384";
 Property = "Public:MaxFileSize:16384";
 PolicyName = "Public Logging Size Limit";
 ModuleVersion = "1.0";
 ValueName = "LogFileSize";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6039' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.3.9 (L1)
select 'instance of GPRegistry as $GPRegistry67ref
{
ResourceID = "[GPRegistry]V-6040";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6040::9::GPRegistry";
 RuleNumber = "V-6040";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6040' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6040')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Public:LogDroppedConnections:Enable";
 PolicyName = "Public Logging Log dropped packets";
 ModuleVersion = "1.0";
 ValueName = "LogDroppedPackets";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6040' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 9.3.10 (L1)
select 'instance of GPRegistry as $GPRegistry68ref
{
ResourceID = "[GPRegistry]V-6041";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile\\Logging";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6041::9::GPRegistry";
 RuleNumber = "V-6041";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6041' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6041')) || 
'";
 ValueType = "DWORD";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 Property = "Public:LogAllowedConnections:Enable";
 PolicyName = "Public Logging Log successful connections";
 ModuleVersion = "1.0";
 ValueName = "LogSuccessfulConnections";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6041' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.1.1.1 (L1)
select 'instance of DSCRegistry as $DSCRegistry317ref
{
ResourceID = "[DSCRegistry]V-6042";
 ValueName = "NoLockScreenCamera";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Personalization";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6042::9::DSCRegistry";
 RuleNumber = "V-6042";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6042' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6042')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6042' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.5.21.1 (L1) 
select 'instance of DSCRegistry as $DSCRegistry316ref
{
ResourceID = "[DSCRegistry]V-6055";
 ValueName = "fMinimizeConnections";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WcmSvc\\GroupPolicy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6055::9::DSCRegistry";
 RuleNumber = "V-6055";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6055' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6055')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6055' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.5.21.2 (L2)
select 'instance of DSCRegistry as $DSCRegistry318ref
{
ResourceID = "[DSCRegistry]V-6056";
 ValueName = "fBlockNonDomain";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WcmSvc\\GroupPolicy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6056::9::DSCRegistry";
 RuleNumber = "V-6056";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6055' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6056')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6056' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.21.2 (L1)
select 'instance of DSCRegistry as $DSCRegistry319ref
{
ResourceID = "[DSCRegistry]V-6058";
 ValueName = "NoBackgroundPolicy";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Group Policy\\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6058::9::DSCRegistry";
 RuleNumber = "V-6058";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6058' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6058')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6058' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.22.1.4 (L2)
select 'instance of DSCRegistry as $DSCRegistry320ref
{
ResourceID = "[DSCRegistry]V-6060";
 ValueName = "ExitOnMSICW";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Internet Connection Wizard";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6060::9::DSCRegistry";
 RuleNumber = "V-6060";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6060' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6060')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6060' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.22.1.7 (L2)
select 'instance of DSCRegistry as $DSCRegistry321ref
{
ResourceID = "[DSCRegistry]V-6061";
 ValueName = "NoRegistration";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Registration Wizard Control";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6061::9::DSCRegistry";
 RuleNumber = "V-6061";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6061' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6061')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6061' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.22.1.11 (L2)
select 'instance of DSCRegistry as $DSCRegistry322ref
{
ResourceID = "[DSCRegistry]V-6062";
 ValueName = "CEIP";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Messenger\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6062::9::DSCRegistry";
 RuleNumber = "V-6062";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6062' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6062')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6062' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.22.1.13 (L2)
select 'instance of DSCRegistry as $DSCRegistry323ref
{
ResourceID = "[DSCRegistry]V-6063-1";
 ValueName = "DoReport";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\PCHealth\\ErrorReporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6063::9::DSCRegistry";
 RuleNumber = "V-6063-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6063' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6063')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry324ref
{
ResourceID = "[DSCRegistry]V-6063-2";
 ValueName = "Disabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6063::9::DSCRegistry";
 RuleNumber = "V-6063-2";
Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6063' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6063')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6063' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.27.2 (L1)
select 'instance of DSCRegistry as $DSCRegistry325ref
{
ResourceID = "[DSCRegistry]V-6064";
 ValueName = "DontEnumerateConnectedUsers";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6064::9::DSCRegistry";
 RuleNumber = "V-6064";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6064' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6064')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6064' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.27.5 (L1)
select 'instance of DSCRegistry as $DSCRegistry326ref
{
ResourceID = "[DSCRegistry]V-6065";
 ValueName = "BlockDomainPicturePassword";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6065::9::DSCRegistry";
 RuleNumber = "V-6065";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6065' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6065')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6065' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.27.6 (L1)
select 'instance of DSCRegistry as $DSCRegistry327ref
{
ResourceID = "[DSCRegistry]V-6066";
 ValueName = "AllowDomainPINLogon";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6066::9::DSCRegistry";
 RuleNumber = "V-6066";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6066' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6066')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6066' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.46.1 (L2)
select 'instance of DSCRegistry as $DSCRegistry328ref
{
ResourceID = "[DSCRegistry]V-6067";
 ValueName = "DisabledByGroupPolicy";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\AdvertisingInfo";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6067::9::DSCRegistry";
 RuleNumber = "V-6067";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6067' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6067')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6067' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.49.1.1 (L2)
select 'instance of DSCRegistry as $DSCRegistry329ref
{
ResourceID = "[DSCRegistry]V-6068";
 ValueName = "Enabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NtpClient";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6068::9::DSCRegistry";
 RuleNumber = "V-6068";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6068' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6068')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6068' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.49.1.1 (L2)
select 'instance of DSCRegistry as $DSCRegistry330ref
{
ResourceID = "[DSCRegistry]V-6069";
 ValueName = "Enabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\W32time\\TimeProviders\\NtpServer";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6069::9::DSCRegistry";
 RuleNumber = "V-6069";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6069' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6069')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6069' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.6.1 (L1)
select 'instance of DSCRegistry as $DSCRegistry331ref
{
ResourceID = "[DSCRegistry]V-6070";
 ValueName = "MSAOptional";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\system";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6070::9::DSCRegistry";
 RuleNumber = "V-6070";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6070' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6070')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6070' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.26.3.1 (L1)
select 'instance of GPRegistry as $GPRegistry69ref
{
ResourceID = "[GPRegistry]V-6079-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Setup";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6024::9::GPRegistry";
 RuleNumber = "V-6079-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6079' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6079')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AutoBackupLogFiles";

};

instance of GPRegistry as $GPRegistry70ref
{
ResourceID = "[GPRegistry]V-6079-2";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Setup";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6079::9::GPRegistry";
 RuleNumber = "V-6079-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6079' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6079')) || 
'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6079' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.39.1.1 (L2)
select 'instance of DSCRegistry as $DSCRegistry340ref
{
ResourceID = "[DSCRegistry]V-6080";
 ValueName = "DisableWindowsLocationProvider";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\LocationAndSensors";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6080::9::DSCRegistry";
 RuleNumber = "V-6080";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6080' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6080')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6080' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.52.1 (L1)
select 'instance of DSCRegistry as $DSCRegistry332ref
{
ResourceID = "[DSCRegistry]V-6081";
 ValueName = "DisableFileSyncNGSC";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\OneDrive";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6081::9::DSCRegistry";
 RuleNumber = "V-6081";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6081' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6081')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6081' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.76.3.1 (L1)
select 'instance of DSCRegistry as $DSCRegistry333ref
{
ResourceID = "[DSCRegistry]V-6085";
 ValueName = "LocalSettingOverrideSpynetReporting";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Spynet";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6085::9::DSCRegistry";
 RuleNumber = "V-6085";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6085' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6085')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6085' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.76.7.1 (L1)
select 'instance of DSCRegistry as $DSCRegistry334ref
{
ResourceID = "[DSCRegistry]V-6086";
 ValueName = "DisableBehaviorMonitoring";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Real-Time Protection";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6086::9::DSCRegistry";
 RuleNumber = "V-6086";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6086' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6086')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6086' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.76.9.1 (L2)
select 'instance of DSCRegistry as $DSCRegistry335ref
{
ResourceID = "[DSCRegistry]V-6087";
 ValueName = "DisableGenericRePorts";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6087::9::DSCRegistry";
 RuleNumber = "V-6087";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6087' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6087')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6087' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.76.10.1 (L1)
select 'instance of DSCRegistry as $DSCRegistry336ref
{
ResourceID = "[DSCRegistry]V-6088";
 ValueName = "DisableRemovableDriveScanning";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Scan";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6088::9::DSCRegistry";
 RuleNumber = "V-6088";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6088' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6088')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6088' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.76.10.2 (L1)
select 'instance of DSCRegistry as $DSCRegistry337ref
{
ResourceID = "[DSCRegistry]V-6089";
 ValueName = "DisableEmailScanning";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows Defender\\Scan";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6089::9::DSCRegistry";
 RuleNumber = "V-6089";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6089' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6089')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6089' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.76.14 (L1)
select 'instance of DSCRegistry as $DSCRegistry338ref
{
ResourceID = "[DSCRegistry]V-6090";
 ValueName = "DisableAntiSpyware";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows Defender";
 Ensure = "Present";
 KeyExist = "Absent";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6090::9::DSCRegistry";
 RuleNumber = "V-6090";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6090' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6090')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6090' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.81.3 (L1)
select 'instance of DSCRegistry as $DSCRegistry339ref
{
ResourceID = "[DSCRegistry]V-6092";
 ValueName = "AutoApproveOSDumps";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6092::9::DSCRegistry";
 RuleNumber = "V-6092";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6092' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6092')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6092' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.95.2 (L1)
    select 'instance of CustomRegistry as $CustomRegistry62ref
{
ResourceID = "[CustomRegistry]V-6093";
 Desired = "0";
 ValueName = "EnableTranscripting";
 ValueType = "DWORD";
 RuleStatus = "Default";
 Manual = "True";
 KeyExist = "Absent";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-6093";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6093' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6093')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\PowerShell\\Transcription";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6093' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AccountSecurity as $AccountSecurity64ref
{
ResourceID = "[AccountSecurity]V-6028";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2945::9::AccountSecurity";
 RuleNumber = "V-6028";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6028' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6028')) || 
'";
 Desired = "Disabled";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "DisabledAdministrator";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6028' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.3.2 (L1)
select 'instance of CustomRegistry as $CustomRegistry58ref
{
ResourceID = "[CustomRegistry]V-6049";
 Desired = "4";
 ValueName = "Start";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6049::5::CustomRegistry";
 RuleNumber = "V-6049";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6049' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6049')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\mrxsmb10";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6049' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.3.3 (L1)
select 'instance of CustomRegistry as $CustomRegistry59ref
{
ResourceID = "[CustomRegistry]V-6050";
 Desired = "0";
 ValueName = "SMB1";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6050::5::CustomRegistry";
 RuleNumber = "V-6050";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6050' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6050')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\LanmanServer\\Parameters";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6050' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.3.4 (L1)
select 'instance of CustomRegistry as $CustomRegistry60ref
{
ResourceID = "[CustomRegistry]V-6051";
 Desired = "0";
 ValueName = "DisableExceptionChainValidation";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6051::5::CustomRegistry";
 RuleNumber = "V-6051";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6051' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6051')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Kernel";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6051' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.5.4.1 (L1)
select 'instance of CustomRegistry as $CustomRegistry75ref
{
ResourceID = "[CustomRegistry]V-6052";
 Desired = "2";
 ValueName = "NodeType";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6052::5::CustomRegistry";
 RuleNumber = "V-6052";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6052' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6052')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\NetBT\\Parameters";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6052' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.5.4.2 (L1)
select 'instance of CustomRegistry as $CustomRegistry76ref
{
ResourceID = "[CustomRegistry]V-6053";
 Desired = "0";
 ValueName = "EnableMulticast";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6053::5::CustomRegistry";
 RuleNumber = "V-6053";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6053' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6053')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\DNSClient";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6053' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.5.14.1 (L1)
select 'instance of CustomRegistry as $CustomRegistry63ref
{
ResourceID = "[CustomRegistry]V-6054-1";
 Desired = "RequireMutualAuthentication=1, RequireIntegrity=1";
 ValueName = "\\\\*\\SYSVOL";
 ValueType = "String";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6054-1::5::CustomRegistry";
 RuleNumber = "V-6054-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6054' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6054')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\NetworkProvider\\HardenedPaths";
 ModuleVersion = "1.0";

};

instance of CustomRegistry as $CustomRegistry64ref
{
ResourceID = "[CustomRegistry]V-6054-2";
 Desired = "RequireMutualAuthentication=1, RequireIntegrity=1";
 ValueName = "\\\\*\\NETLOGON";
 ValueType = "String";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6054-2::5::CustomRegistry";
 RuleNumber = "V-6054-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6054' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6054')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\NetworkProvider\\HardenedPaths";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6054' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.4.1 (L1)
select 'instance of CustomRegistry as $CustomRegistry65ref
{
ResourceID = "[CustomRegistry]V-6057";
 Desired = "1";
 ValueName = "RestrictedRemoteAdministration";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6057::5::CustomRegistry";
 RuleNumber = "V-6057";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6057' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6057')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CredentialsDelegation";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6057' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.8.22.1.2 (L2)
select 'instance of CustomRegistry as $CustomRegistry66ref
{
ResourceID = "[CustomRegistry]V-6059";
 Desired = "1";
 ValueName = "PreventHandwritingDataSharing";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6059::5::CustomRegistry";
 RuleNumber = "V-6059";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6059' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6059')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\TabletPC"; 
 Link = "https://'||(Select Domain from DJANGO_SITE where ID = '1')||'/static/files/CustomSetup_Windows/gpo_template/ShapeCollector";
 PolicyName = "Turn off handwriting personalization data sharing#SPLITComputer Configuration\\Policies\\Administrative Templates\\System\\Internet Communication Management\\Internet Communication settings";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6059' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.60.3 (L2)
select 'instance of CustomRegistry as $CustomRegistry67ref
{
ResourceID = "[CustomRegistry]V-6083";
 Desired = "3";
 ValueName = "ConnectedSearchPrivacy";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6083::5::CustomRegistry";
 RuleNumber = "V-6083";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6083' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6083')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Windows Search"; 
 Link = "https://'||(Select Domain from DJANGO_SITE where ID = '1')||'/static/files/CustomSetup_Windows/gpo_template/Search";
 PolicyName = "Set what information is shared in Search#SPLITComputer Configuration\\Policies\\Administrative Templates\\Windows Components\\Search";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6083' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.80.1.1 (L1)
select 'instance of CustomRegistry as $CustomRegistry69ref
{
ResourceID = "[CustomRegistry]V-6091-1";
 Desired = "1";
 ValueName = "EnableSmartScreen";
 Manual = "True";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6091::5::CustomRegistry";
 RuleNumber = "V-6091-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6091' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6091')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System";
 ModuleVersion = "1.0";

};

instance of CustomRegistry as $CustomRegistry77ref
{
ResourceID = "[CustomRegistry]V-6091-2";
 Desired = "Warn and prevent bypass";
 ValueName = "ShellSmartScreenLevel";
  Manual = "True";
 ValueType = "String";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6091-2::5::CustomRegistry";
 RuleNumber = "V-6091-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6091' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6091')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\System";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6091' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.97.2.2 (L2)
select 'instance of CustomRegistry as $CustomRegistry70ref
{
ResourceID = "[CustomRegistry]V-6094";
 Desired = "0";
 ValueName = "AllowAutoConfig";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6094::5::CustomRegistry";
 RuleNumber = "V-6094";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6094' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6094')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6094' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.98.1 (L2)
select 'instance of CustomRegistry as $CustomRegistry71ref
{
ResourceID = "[CustomRegistry]V-6095";
 Desired = "0";
 ValueName = "AllowRemoteShellAccess";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6095::5::CustomRegistry";
 RuleNumber = "V-6095";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6095' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6095')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WinRM\\Service\\WinRS";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6095' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.101.2 (L1)
select 'instance of CustomRegistry as $CustomRegistry72ref
{
ResourceID = "[CustomRegistry]V-6096";
 Minimum = "2";
 Maximum = "4";
 ValueName = "NoAutoUpdate";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6096::5::CustomRegistry";
 RuleNumber = "V-6096";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6096' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6096')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6096' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.101.3 (L1)
select 'instance of CustomRegistry as $CustomRegistry73ref
{
ResourceID = "[CustomRegistry]V-6097";
 Desired = "0";
 ValueName = "ScheduledInstallDay";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6097::5::CustomRegistry";
 RuleNumber = "V-6097";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6097' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6097')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6097' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--CIS 18.9.101.4 (L1)
select 'instance of CustomRegistry as $CustomRegistry74ref
{
ResourceID = "[CustomRegistry]V-6098";
 Desired = "0";
 ValueName = "NoAutoRebootWithLoggedOnUsers";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 KeyExist = "Absent";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6098::5::CustomRegistry";
 RuleNumber = "V-6098";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6098' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6098')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6098' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

---CIS 2012 R2 and 2016 New Rules 

select 'instance of DSCRegistry as $DSCRegistry348ref
{
ResourceID = "[DSCRegistry]V-6115-1";
 ValueName = "AntiDetours";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\EMET\\SysSettings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::20::9::DSCRegistry";
 RuleNumber = "V-6115-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6115' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6115')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry349ref
{
ResourceID = "[DSCRegistry]V-6115-2";
 ValueName = "BannedFunctions";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\EMET\\SysSettings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::32::9::DSCRegistry";
 RuleNumber = "V-6115-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6115' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6115')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry350ref
{
ResourceID = "[DSCRegistry]V-6115-3";
 ValueName = "DeepHooks";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\EMET\\SysSettings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::43::9::DSCRegistry";
 RuleNumber = "V-6115-3";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6115' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6115')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry351ref
{
ResourceID = "[DSCRegistry]V-6115-4";
 ValueName = "ExploitAction";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\EMET\\SysSettings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::54::9::DSCRegistry";
 RuleNumber = "V-6115-4";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6115' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6115')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6115' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry352ref
{
ResourceID = "[DSCRegistry]V-6116";
 ValueName = "*\\Internet Explorer\\iexplore.exe";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\EMET\\Defaults";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::109::3::DSCRegistry";
 RuleNumber = "V-6116";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6116' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6116')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "+EAF+ eaf_modules:mshtml.dll;flash*.ocx;jscript*.dll;vbscript.dll;vgx.dll +ASR asr_modules:npjpi*.dll;jp2iexp.dll;vgx.dll;msxml4*.dll;wshom.ocx;scrrun.dll;vbscript.dll asr_zones:1;2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6116' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

--Check values and create MOF for rules V-6117 & V-6118 & V-6119
--Check values and create MOF for rules V-6120 & V-6121

select 'instance of DSCRegistry as $DSCRegistry353ref
{
ResourceID = "[DSCRegistry]V-6122";
 ValueName = "ASLR";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\EMET\\SysSettings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::109::3::DSCRegistry";
 RuleNumber = "V-6122";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6122' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6122')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6122' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry354ref
{
ResourceID = "[DSCRegistry]V-6123";
 ValueName = "DEP";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\EMET\\SysSettings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::109::3::DSCRegistry";
 RuleNumber = "V-6123";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6123' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6123')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6123' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry355ref
{
ResourceID = "[DSCRegistry]V-6124";
 ValueName = "SEHOP";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\EMET\\SysSettings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::109::3::DSCRegistry";
 RuleNumber = "V-6124";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6124' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6124')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6124' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege100ref
{
ResourceID = "[Privilege]V-6099";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-6099";
 Members = {
    "BUILTIN\\Administrators"    
};
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6099' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6099')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeMachineAccountPrivilege";
 Operation = "Add-Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6099' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege101ref
{
ResourceID = "[Privilege]V-6100";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-6100";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6100' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6100')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeBatchLogonRight";
 Operation = "Add-Allow Only";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6100' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of Privilege as $Privilege102ref
{
ResourceID = "[Privilege]V-6101";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-6101";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6101' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6101')) || 
'";
 ModuleName = "xPrivilege";
 Privilege = "SeSyncAgentPrivilege";
 Operation = "Remove All";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6101' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry400ref
{
ResourceID = "[DSCRegistry]V-6102";
 ValueName = "SubmitControl";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6102";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6102' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6102')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6102' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry401ref
{
ResourceID = "[CustomRegistry]V-6103";
 Desired = "2";
 ValueName = "LDAPServerIntegrity";
 ValueType = "Dword";
 RuleStatus = "Default";
 Manual = "True";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6098::5::CustomRegistry";
 RuleNumber = "V-6103";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6103' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6103')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\NTDS\\Parameters";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6103' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry343ref
{
ResourceID = "[DSCRegistry]V-6104";
 ValueName = "RefusePasswordChange";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6104";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6104' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6104')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6104' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry380ref
{
ResourceID = "[DSCRegistry]V-6146";
 ValueName = "restrictremotesam";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6146";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6146' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6146')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "O:BAG:BAD:(A;;RC;;;BA)" ;
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6146' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol403ref
{
ResourceID = "[AuditPol]V-6105";
 RuleStatus = "Default";
 AuditPolicy = "Distribution Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-6105";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6105' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6105')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6105' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol375ref
{
ResourceID = "[AuditPol]V-6143";
 RuleStatus = "Default";
 AuditPolicy = "Plug and Play Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-6143";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6143' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6143')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6143' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol404ref
{
ResourceID = "[AuditPol]V-6106";
 RuleStatus = "Default";
 AuditPolicy = "Directory Service Access";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-6106";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6106' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6106')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6106' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol405ref
{
ResourceID = "[AuditPol]V-6107";
 RuleStatus = "Default";
 AuditPolicy = "Directory Service Changes";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-6107";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6107' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6107')) || 
'";
 Desired = "Success and Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6107' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of AuditPol as $AuditPol376ref
{
ResourceID = "[AuditPol]V-6144";
 RuleStatus = "Default";
 AuditPolicy = "Group Membership";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-6144";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6144' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6144')) || 
'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6144' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry357ref
{
ResourceID = "[DSCRegistry]V-6126";
 ValueName = "AllowInputPersonalization";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\InputPersonalization";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::20::9::DSCRegistry";
 RuleNumber = "V-6126";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6126' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6126')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6126' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry344ref
{
ResourceID = "[DSCRegistry]V-6108";
 ValueName = "DllName";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon\\GPExtensions\\{D76B9641-3288-4f75-942D-087DE603E3EA}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6108";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6108' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6108')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "C:\\Program Files\\LAPS\\CSE\\AdmPwd.dll";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6108' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry345ref
{
ResourceID = "[DSCRegistry]V-6109";
 ValueName = "PwdExpirationProtectionEnabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft Services\\AdmPwd";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6109";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6109' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6109')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6109' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry346ref
{
ResourceID = "[DSCRegistry]V-6110";
 ValueName = "AdmPwdEnabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft Services\\AdmPwd";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6110";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6110' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6110')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6110' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry347ref
{
ResourceID = "[DSCRegistry]V-6111";
 ValueName = "PasswordComplexity";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft Services\\AdmPwd";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6111";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6111' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6111')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "4";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6111' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry406ref
{
ResourceID = "[CustomRegistry]V-6112";
 Minimum = "15";
 Maximum = "64";
 ValueName = "PasswordLength";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6098::5::CustomRegistry";
 RuleNumber = "V-6112";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6112' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6112')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft Services\\AdmPwd";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6112' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of CustomRegistry as $CustomRegistry40ref
{
ResourceID = "[CustomRegistry]V-6113";
 Minimum = "1";
 Maximum = "30";
 ValueName = "PasswordAgeDays";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::6098::5::CustomRegistry";
 RuleNumber = "V-6113";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6113' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6113')) || 
'";
 ModuleName = "xCustomRegistry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft Services\\AdmPwd";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6113' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry358ref
{
ResourceID = "[DSCRegistry]V-6127";
 ValueName = "EnableFontProviders";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6127";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6127' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6127')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  


  if create_mof ( v_str , 'V-6127' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry359ref
{
ResourceID = "[DSCRegistry]V-6128";
 ValueName = "NC_ShowSharedAccessUI";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Network Connections";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6128";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6128' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6128')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;  

  if create_mof ( v_str , 'V-6128' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry361ref
{
ResourceID = "[DSCRegistry]V-6129";
 ValueName = "EnableCdp";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6129";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6129' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6129')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6129' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry362ref
{
ResourceID = "[DSCRegistry]V-6130-1";
 ValueName = "DevicePKInitBehavior";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\kerberos\\parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6130-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6130' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6130')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

}; 

instance of DSCRegistry as $DSCRegistry363ref
{
ResourceID = "[DSCRegistry]V-6130-2";
 ValueName = "DevicePKInitEnabled";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\kerberos\\parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6130-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6130' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6130')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6130' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry364ref
{
ResourceID = "[DSCRegistry]V-6131";
 ValueName = "BlockUserFromShowingAccountDetailsOnSignin";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6131";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6131' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6131')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6131' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry382ref
{
ResourceID = "[DSCRegistry]V-6145";
 ValueName = "MitigationOptions_FontBocking";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\MitigationOptions";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6145";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6145' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6145')) || 
'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "1000000000000";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6145' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry365ref
{
ResourceID = "[DSCRegistry]V-6132";
 ValueName = "DCSettingIndex";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Power\\PowerSettings\\f15576e8-98b7-4186-b944-eafa664402d9";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6132";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6132' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6132')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6132' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry366ref
{
ResourceID = "[DSCRegistry]V-6133";
 ValueName = "AllowSharedLocalAppData";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\AppModel\\StateManager";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6133";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6133' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6133')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6133' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry367ref
{
ResourceID = "[DSCRegistry]V-6134";
 ValueName = "AllowCamera";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Camera";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6134";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6134' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6134')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6134' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry368ref
{
ResourceID = "[DSCRegistry]V-6135";
 ValueName = "DisableWindowsConsumerFeatures";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\CloudContent";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6135";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6135' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6135')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6135' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry369ref
{
ResourceID = "[DSCRegistry]V-6136";
 ValueName = "RequirePinForPairing";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Connect";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6136";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6136' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6136')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6136' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry370ref
{
ResourceID = "[DSCRegistry]V-6137";
 ValueName = "AllowTelemetry";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6137";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6137' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6137')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6137' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

	select 'instance of DSCRegistry as $DSCRegistry371ref
{
ResourceID = "[DSCRegistry]V-6138";
 ValueName = "DoNotShowFeedbackNotifications";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\DataCollection";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6138";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6138' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6138')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1" ;
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6138' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

	select 'instance of DSCRegistry as $DSCRegistry372ref
{
ResourceID = "[DSCRegistry]V-6139";
 ValueName = "AllowBuildPreview";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\PreviewBuilds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6139";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6139' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6139')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0" ;
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6139' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry401ref

{
ResourceID = "[DSCRegistry]V-6125";
 ValueName = "NoGenTicket";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\CurrentVersion\\Software Protection Platform";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::109::3::DSCRegistry";
 RuleNumber = "V-6125";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6125' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6125')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6125' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of DSCRegistry as $DSCRegistry373ref
{
ResourceID = "[DSCRegistry]V-6140";
 ValueName = "AllowSuggestedAppsInWindowsInkWorkspace";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsInkWorkspace";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6140";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6140' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6140')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0" ;
 ModuleVersion = "1.0";

};' into v_str from dual ;


  if create_mof ( v_str , 'V-6140' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

	select 'instance of DSCRegistry as $DSCRegistry374ref
{
ResourceID = "[DSCRegistry]V-6141";
 ValueName = "AllowWindowsInkWorkspace";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsInkWorkspace";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6141";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6141' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6141')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0" ;
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6141' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---


	select 'instance of DSCRegistry as $DSCRegistry375ref
{
ResourceID = "[DSCRegistry]V-6142-1";
 ValueName = "DeferQualityUpdates";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6142-1";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6142' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6142')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};

instance of DSCRegistry as $DSCRegistry376ref
{
ResourceID = "[DSCRegistry]V-6142-2";
 ValueName = "DeferQualityUpdatesPeriodInDays";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows NT\\MitigationOptions:";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-6142-2";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6142' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6142')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ;

  if create_mof ( v_str , 'V-6142' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

	select 'instance of DSCRegistry as $DSCRegistry348ref
{
ResourceID = "[DSCRegistry]V-6147";
 ValueName = "AllowInsecureGuestAuth";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\LanmanWorkstation";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6147";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6147' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6147')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6147' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

	select 'instance of DSCRegistry as $DSCRegistry349ref
{
ResourceID = "[DSCRegistry]V-6148";
 ValueName = "EnhancedAntiSpoofing";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Biometrics\\FacialFeatures";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6148";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6148' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6148')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6148' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

   select 'instance of DSCRegistry as $DSCRegistry350ref
{
ResourceID = "[DSCRegistry]V-6149";
 ValueName = "EnableConfigFlighting";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\PreviewBuilds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-6149";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6149' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-6149')) || 
'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-6149' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---


  select 'instance of AccountSecurity as $AccountSecurity403ref
{
ResourceID = "[AccountSecurity]V-1114";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2954::9::AccountSecurity";
 RuleNumber = "V-1114";
 Severity = "'||
 (select CRITICALITY_ID from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1114' )) ||
'";
 RuleId = "'|| 
 (select id from cpe_rule_header where id IN 
                   (select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c 
                    where  a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and 
                    c.id = b.base_rule_id and c.name= 'V-1114')) || 
'";
 Desired = "Visitor";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameGuest";
 ModuleVersion = "1.1";

};' into v_str from dual ; 

  if create_mof ( v_str , 'V-1114' ) = 'OK' then v_success := v_success + 1; end if; 
  v_total := v_total + 1;
---

select 'instance of SystemCheck as $SystemCheck12ref
{
ResourceID = "[SystemCheck]V-6114";
Manual = "False";
RuleNumber = "V-6114";
Severity = "'||
(select CRITICALITY_ID from cpe_rule_header where id IN
(select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c
where a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and
c.id = b.base_rule_id and c.name= 'V-6114' )) ||
'";
RuleId = "'||
(select id from cpe_rule_header where id IN
(select max(c.id) from cpe_profile a, cpe_profile_member b , cpe_rule_header c
where a.created_by = 'Profile by Cloud Raxak' and b.profile_id = a.id and
c.id = b.base_rule_id and c.name= 'V-6114')) ||
'";
RuleStatus = "Default";
SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
Category = "EMET";
Desired = "5.52";
ModuleName = "xSystemCheck";
ModuleVersion = "1.0";

};' into v_str from dual ;

if create_mof ( v_str , 'V-6114' ) = 'OK' then v_success := v_success + 1; end if;
v_total := v_total + 1;
---

  result := result || ' Total attempted : ' || v_total || ' , Total success : ' || v_success;
  return result;
end;
/

select add_mof_data() from dual;
--/

declare
cursor c1 is select ID, RULE_CONFIG from CPE_RULE_HEADER where RULE_CONFIG is not null;
rule_id number;
rid number;
rule_config CLOB;
new_config CLOB;
Begin
OPEN c1;
    LOOP
    FETCH c1 into rule_id,rule_config ; EXIT WHEN c1%notfound;    
    SELECT REGEXP_REPLACE(rule_config,'RuleId = .*;','RuleId = "'||rule_id||'";' ) into new_config FROM DUAL;
    rid := rule_id;
    UPDATE CPE_RULE_HEADER SET RULE_CONFIG= to_clob (new_config) where id = rid;    
    end loop;
    commit;
    close c1;
END;
/
