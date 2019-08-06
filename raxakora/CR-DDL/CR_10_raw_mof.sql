--Comment the first line if a column RULE_CONFIG is already created.
--Column name RULE_CONFIG denotes the column for mof snippet for individual rules.
--ALTER TABLE "CPE_RULE_HEADER" ADD RULE_CONFIG BLOB;
--Also please ignore those erros which you get for V-56500 and V-56700
--they will be thrown because the clob field does not take that long string
--in it. If the mof snippet for V-56700 and V-56500 is updated please 
--do this manually.


UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry1ref
{
ResourceID = "[DSCRegistry]V-15696-1";
 ValueName = "AllowLLTDIOOndomain";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::20::9::DSCRegistry";
 RuleNumber = "V-15696-1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::32::9::DSCRegistry";
 RuleNumber = "V-15696-2";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::43::9::DSCRegistry";
 RuleNumber = "V-15696-3";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::54::9::DSCRegistry";
 RuleNumber = "V-15696-4";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15696'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry5ref
{
ResourceID = "[DSCRegistry]V-15697-1";
 ValueName = "AllowRspndrOndomain";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LLTD";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::65::9::DSCRegistry";
 RuleNumber = "V-15697-1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::76::3::DSCRegistry";
 RuleNumber = "V-15697-2";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::87::9::DSCRegistry";
 RuleNumber = "V-15697-3";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::98::9::DSCRegistry";
 RuleNumber = "V-15697-4";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15697'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry9ref
{
ResourceID = "[DSCRegistry]V-15666";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\policies\\Microsoft\\Peernet";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::109::3::DSCRegistry";
 RuleNumber = "V-15666";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15666'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry10ref
{
ResourceID = "[DSCRegistry]V-15667";
 ValueName = "NC_AllowNetBridge_NLA";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Network Connections";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::120::9::DSCRegistry";
 RuleNumber = "V-15667";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15667'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry11ref
{
ResourceID = "[DSCRegistry]V-21960";
 ValueName = "NC_StdDomainUserSetLocation";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Network Connections";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::131::9::DSCRegistry";
 RuleNumber = "V-21960";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21960'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry12ref
{
ResourceID = "[DSCRegistry]V-21961";
 ValueName = "Force_Tunneling";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::142::9::DSCRegistry";
 RuleNumber = "V-21961";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Enabled";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21961'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry13ref
{
ResourceID = "[DSCRegistry]V-26575";
 ValueName = "6to4_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::153::9::DSCRegistry";
 RuleNumber = "V-26575";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26575'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry14ref
{
ResourceID = "[DSCRegistry]V-26576";
 ValueName = "IPHTTPS_ClientState";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition\\IPHTTPS\\IPHTTPSInterface";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::164::9::DSCRegistry";
 RuleNumber = "V-26576";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26576'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry15ref
{
ResourceID = "[DSCRegistry]V-26577";
 ValueName = "ISATAP_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::175::3::DSCRegistry";
 RuleNumber = "V-26577";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26577'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry16ref
{
ResourceID = "[DSCRegistry]V-26578";
 ValueName = "Teredo_State";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\TCPIP\\v6Transition";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::186::3::DSCRegistry";
 RuleNumber = "V-26578";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "Disabled";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26578'  ; 

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry17ref
{
ResourceID = "[DSCRegistry]V-36673";
 ValueName = "EnableIPAutoConfigurationLimits";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::197::9::DSCRegistry";
 RuleNumber = "V-36673";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36673'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry18ref
{
ResourceID = "[DSCRegistry]V-15698-1";
 ValueName = "DisableFlashConfigRegistrar";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\Registrars";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::208::3::DSCRegistry";
 RuleNumber = "V-15698-1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15698'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry23ref
{
ResourceID = "[DSCRegistry]V-15699";
 ValueName = "DisableWcnUi";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WCN\\UI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::263::3::DSCRegistry";
 RuleNumber = "V-15699";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15699'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry24ref
{
ResourceID = "[DSCRegistry]V-21963";
 ValueName = "DoNotInstallCompatibleDriverFromWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::274::6::DSCRegistry";
 RuleNumber = "V-21963";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21963'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry25ref
{
ResourceID = "[DSCRegistry]V-36677";
 ValueName = "UseWindowsUpdate";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Servicing";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::285::6::DSCRegistry";
 RuleNumber = "V-36677";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36677'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry26ref
{
ResourceID = "[DSCRegistry]V-15700";
 ValueName = "AllowRemoteRPC";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::296::6::DSCRegistry";
 RuleNumber = "V-15700";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15700'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry27ref
{
ResourceID = "[DSCRegistry]V-15702";
 ValueName = "DisableSendGenericDriverNotFoundToWER";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::307::6::DSCRegistry";
 RuleNumber = "V-15702";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15702'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry28ref
{
ResourceID = "[DSCRegistry]V-15701";
 ValueName = "DisableSystemRestore";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::318::9::DSCRegistry";
 RuleNumber = "V-15701";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15701'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry29ref
{
ResourceID = "[DSCRegistry]V-21964";
 ValueName = "PreventDeviceMetadataFromNetwork";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\Device Metadata";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::329::6::DSCRegistry";
 RuleNumber = "V-21964";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21964'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry30ref
{
ResourceID = "[DSCRegistry]V-28504";
 ValueName = "DisableSendRequestAdditionalSoftwareToWER";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DeviceInstall\\Settings";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::340::7::DSCRegistry";
 RuleNumber = "V-28504";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-28504'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry31ref
{
ResourceID = "[DSCRegistry]V-21965";
 ValueName = "SearchOrderConfig";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::351::9::DSCRegistry";
 RuleNumber = "V-21965";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21965'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry32ref
{
ResourceID = "[DSCRegistry]V-36678";
 ValueName = "DriverServerSelection";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::362::9::DSCRegistry";
 RuleNumber = "V-36678";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36678'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry33ref
{
ResourceID = "[DSCRegistry]V-15703";
 ValueName = "DontPromptForWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::373::9::DSCRegistry";
 RuleNumber = "V-15703";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15703'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry34ref
{
ResourceID = "[DSCRegistry]V-36679";
 ValueName = "DriverLoadPolicy";
 Key = "HKLM:\\System\\CurrentControlSet\\Policies\\EarlyLaunch";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::384::3::DSCRegistry";
 RuleNumber = "V-36679";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36679'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry35ref
{
ResourceID = "[DSCRegistry]V-4448";
 ValueName = "NoGPOListChanges";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Group Policy\\{\n            RuleNumber = \"35378EAC-683F-11D2-A89A-00C04FBBCFA2}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::395::6::DSCRegistry";
 RuleNumber = "V-4448";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4448'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry36ref
{
ResourceID = "[DSCRegistry]V-3469";
 ValueName = "DisableBkGndGroupPolicy";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\system";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::407::6::DSCRegistry";
 RuleNumber = "V-3469";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3469'  ;


UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry37ref
{
ResourceID = "[DSCRegistry]V-36680";
 ValueName = "NoUseStoreOpenWith";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::418::6::DSCRegistry";
 RuleNumber = "V-36680";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36680'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry38ref
{
ResourceID = "[DSCRegistry]V-14260";
 ValueName = "DisableWebPnPDownload";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::429::7::DSCRegistry";
 RuleNumber = "V-14260";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14260'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry39ref
{
ResourceID = "[DSCRegistry]V-15672";
 ValueName = "MicrosoftEventVwrDisableLinks";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\EventViewer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::440::6::DSCRegistry";
 RuleNumber = "V-15672";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15672'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry40ref
{
ResourceID = "[DSCRegistry]V-15704";
 ValueName = "PreventHandwritingErrorReports";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\HandwritingErrorReports";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::451::3::DSCRegistry";
 RuleNumber = "V-15704";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15704'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry41ref
{
ResourceID = "[DSCRegistry]V-15674";
 ValueName = "NoInternetOpenWith";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::462::6::DSCRegistry";
 RuleNumber = "V-15674";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15674'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry42ref
{
ResourceID = "[DSCRegistry]V-14259";
 ValueName = "DisableHTTPPrinting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Printers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::473::6::DSCRegistry";
 RuleNumber = "V-14259";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14259'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry43ref
{
ResourceID = "[DSCRegistry]V-16020";
 ValueName = "CEIPEnable";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\SQMClient\\Windows";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::484::6::DSCRegistry";
 RuleNumber = "V-16020";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-16020'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry44ref
{
ResourceID = "[DSCRegistry]V-14261";
 ValueName = "DontSearchWindowsUpdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\DriverSearching";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::495::6::DSCRegistry";
 RuleNumber = "V-14261";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14261'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry45ref
{
ResourceID = "[DSCRegistry]V-36681";
 ValueName = "BlockUserInputMethodsForSignIn";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Control Panel\\International";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::507::6::DSCRegistry";
 RuleNumber = "V-36681";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36681'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry46ref
{
ResourceID = "[DSCRegistry]V-15680";
 ValueName = "LogonType";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::518::6::DSCRegistry";
 RuleNumber = "V-15680";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15680'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry47ref
{
ResourceID = "[DSCRegistry]V-36684";
 ValueName = "EnumerateLocalUsers";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::529::9::DSCRegistry";
 RuleNumber = "V-36684";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36684'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry48ref
{
ResourceID = "[DSCRegistry]V-36687";
 ValueName = "DisableLockScreenAppNotifications";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::540::6::DSCRegistry";
 RuleNumber = "V-36687";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36687'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry49ref
{
ResourceID = "[DSCRegistry]V-15705";
 ValueName = "DCSettingIndex";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\0e796bdb-100d-47d6-a2d5-f7d2daa51f51";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::551::6::DSCRegistry";
 RuleNumber = "V-15705";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15705'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry50ref
{
ResourceID = "[DSCRegistry]V-15706";
 ValueName = "ACSettingIndex";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Power\\PowerSettings\\0e796bdb-100d-47d6-a2d5-f7d2daa51f51";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::562::3::DSCRegistry";
 RuleNumber = "V-15706";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15706'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry51ref
{
ResourceID = "[DSCRegistry]V-3470";
 ValueName = "fAllowUnsolicited";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::573::3::DSCRegistry";
 RuleNumber = "V-3470";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3470'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry52ref
{
ResourceID = "[DSCRegistry]V-3343";
 ValueName = "fAllowToGetHelp";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::584::3::DSCRegistry";
 RuleNumber = "V-3343";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3343'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry53ref
{
ResourceID = "[DSCRegistry]V-15707";
 ValueName = "LoggingEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::595::3::DSCRegistry";
 RuleNumber = "V-15707";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15707'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry54ref
{
ResourceID = "[DSCRegistry]V-14254";
 ValueName = "EnableAuthEpResolution";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Rpc";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::606::9::DSCRegistry";
 RuleNumber = "V-14254";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14254'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry55ref
{
ResourceID = "[DSCRegistry]V-14253";
 ValueName = "RestrictRemoteClients";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Rpc";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::617::9::DSCRegistry";
 RuleNumber = "V-14253";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14253'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry56ref
{
ResourceID = "[DSCRegistry]V-36696";
 ValueName = "DisablePcaUI";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\AppCompat";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::628::9::DSCRegistry";
 RuleNumber = "V-36696";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36696'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry57ref
{
ResourceID = "[DSCRegistry]V-21967";
 ValueName = "DisableQueryRemoteServer";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\ScriptedDiagnosticsProvider\\Policy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::639::9::DSCRegistry";
 RuleNumber = "V-21967";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21967'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry58ref
{
ResourceID = "[DSCRegistry]V-21969";
 ValueName = "EnableQueryRemoteServer";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\ScriptedDiagnosticsProvider\\Policy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::651::6::DSCRegistry";
 RuleNumber = "V-21969";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21969'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry59ref
{
ResourceID = "[DSCRegistry]V-21970";
 ValueName = "ScenarioExecutionEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WDI\\{\n            RuleNumber = \"9c5a40da-b965-4fc3-8781-88dd50a6299d}";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::662::9::DSCRegistry";
 RuleNumber = "V-21970";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21970'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry60ref
{
ResourceID = "[DSCRegistry]V-36697";
 ValueName = "AllowAllTrustedApps";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Appx";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::675::3::DSCRegistry";
 RuleNumber = "V-36697";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36697'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry61ref
{
ResourceID = "[DSCRegistry]V-21971";
 ValueName = "DisableInventory";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\AppCompat";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::686::8::DSCRegistry";
 RuleNumber = "V-21971";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21971'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry62ref
{
ResourceID = "[DSCRegistry]V-21973";
 ValueName = "NoAutoplayfornonVolume";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::697::9::DSCRegistry";
 RuleNumber = "V-21973";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21973'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry63ref
{
ResourceID = "[DSCRegistry]V-22692";
 ValueName = "NoAutorun";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::708::3::DSCRegistry";
 RuleNumber = "V-22692";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-22692'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry64ref
{
ResourceID = "[DSCRegistry]V-36698";
 ValueName = "Enabled";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Biometrics";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::719::9::DSCRegistry";
 RuleNumber = "V-36698";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36698'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry65ref
{
ResourceID = "[DSCRegistry]V-36700";
 ValueName = "DisablePasswordReveal";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::730::9::DSCRegistry";
 RuleNumber = "V-36700";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36700'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry1ref
{
ResourceID = "[CustomRegistry]V-26579";
 Minimum = "32768";
 Registry = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-26579";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26579'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry2ref
{
ResourceID = "[CustomRegistry]V-26580";
 Minimum = "196608";
 Registry = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::751::2::CustomRegistry";
 RuleNumber = "V-26580";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26580'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry3ref
{
ResourceID = "[CustomRegistry]V-26581";
 Minimum = "32768";
 Registry = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::761::2::CustomRegistry";
 RuleNumber = "V-26581";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\Setup";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26581'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry4ref
{
ResourceID = "[CustomRegistry]V-26582";
 Minimum = "32768";
 Registry = "MaxSize";
 ValueType = "DWORD";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::771::2::CustomRegistry";
 RuleNumber = "V-26582";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\EventLog\\System";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26582'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry66ref
{
ResourceID = "[DSCRegistry]V-36707";
 ValueName = "EnableSmartScreen";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::781::3::DSCRegistry";
 RuleNumber = "V-36707";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36707'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry67ref
{
ResourceID = "[DSCRegistry]V-21980";
 ValueName = "NoDataExecutionPrevention";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::792::3::DSCRegistry";
 RuleNumber = "V-21980";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21980'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry68ref
{
ResourceID = "[DSCRegistry]V-15718";
 ValueName = "NoHeapTerminationOnCorruption";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::803::3::DSCRegistry";
 RuleNumber = "V-15718";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15718'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry69ref
{
ResourceID = "[DSCRegistry]V-15683";
 ValueName = "PreXPSP2ShellProtocolBehavior";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::814::3::DSCRegistry";
 RuleNumber = "V-15683";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15683'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry70ref
{
ResourceID = "[DSCRegistry]V-36708";
 ValueName = "DisableLocation";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\LocationAndSensors";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::825::3::DSCRegistry";
 RuleNumber = "V-36708";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36708'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry71ref
{
ResourceID = "[DSCRegistry]V-14247";
 ValueName = "DisablePasswordSaving";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::836::3::DSCRegistry";
 RuleNumber = "V-14247";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14247'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry72ref
{
ResourceID = "[DSCRegistry]V-14249";
 ValueName = "fDisableCdm";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::847::3::DSCRegistry";
 RuleNumber = "V-14249";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14249'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry73ref
{
ResourceID = "[DSCRegistry]V-3453";
 ValueName = "fPromptForPassword";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::858::3::DSCRegistry";
 RuleNumber = "V-3453";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3453'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry74ref
{
ResourceID = "[DSCRegistry]V-3454";
 ValueName = "MinEncryptionLevel";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::869::3::DSCRegistry";
 RuleNumber = "V-3454";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3454'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry75ref
{
ResourceID = "[DSCRegistry]V-3458";
 ValueName = "MaxIdleTime";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::880::9::DSCRegistry";
 RuleNumber = "V-3458";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "900000";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3458'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry76ref
{
ResourceID = "[DSCRegistry]V-3457";
 ValueName = "MaxDisconnectionTime";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::891::3::DSCRegistry";
 RuleNumber = "V-3457";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "60000";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3457'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry77ref
{
ResourceID = "[DSCRegistry]V-3456";
 ValueName = "DeleteTempDirsOnExit";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::902::3::DSCRegistry";
 RuleNumber = "V-3456";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3456'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry78ref
{
ResourceID = "[DSCRegistry]V-3455";
 ValueName = "PerSessionTempDir";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::913::3::DSCRegistry";
 RuleNumber = "V-3455";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3455'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry79ref
{
ResourceID = "[DSCRegistry]V-15682";
 ValueName = "DisableEnclosureDownload";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Internet Explorer\\Feeds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::924::3::DSCRegistry";
 RuleNumber = "V-15682";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15682'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry80ref
{
ResourceID = "[DSCRegistry]V-36709";
 ValueName = "AllowBasicAuthInClear";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Internet Explorer\\Feeds";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::935::9::DSCRegistry";
 RuleNumber = "V-36709";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36709'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry81ref
{
ResourceID = "[DSCRegistry]V-15713";
 ValueName = "SpyNetReporting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows Defender\\Spynet";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::946::9::DSCRegistry";
 RuleNumber = "V-15713";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15713'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry82ref
{
ResourceID = "[DSCRegistry]V-15714";
 ValueName = "LoggingDisabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::957::9::DSCRegistry";
 RuleNumber = "V-15714";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15714'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry83ref
{
ResourceID = "[DSCRegistry]V-15715";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::968::9::DSCRegistry";
 RuleNumber = "V-15715";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15715'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry84ref
{
ResourceID = "[DSCRegistry]V-15717";
 ValueName = "DontSendAdditionalData";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::979::3::DSCRegistry";
 RuleNumber = "V-15717";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15717'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry85ref
{
ResourceID = "[DSCRegistry]V-15685";
 ValueName = "EnableUserControl";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::990::3::DSCRegistry";
 RuleNumber = "V-15685";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15685'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry86ref
{
ResourceID = "[DSCRegistry]V-34974";
 ValueName = "AlwaysInstallElevated";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1001::3::DSCRegistry";
 RuleNumber = "V-34974";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-34974'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry87ref
{
ResourceID = "[DSCRegistry]V-15684";
 ValueName = "SafeForScripting";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1013::3::DSCRegistry";
 RuleNumber = "V-15684";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15684'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry88ref
{
ResourceID = "[DSCRegistry]V-15686";
 ValueName = "DisableLUAPatching";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Installer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1024::3::DSCRegistry";
 RuleNumber = "V-15686";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15686'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry89ref
{
ResourceID = "[DSCRegistry]V-15719";
 ValueName = "ReportControllerMissing";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1035::3::DSCRegistry";
 RuleNumber = "V-15719";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15719'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry90ref
{
ResourceID = "[DSCRegistry]V-15722";
 ValueName = "DisableOnline";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WMDRM";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1046::3::DSCRegistry";
 RuleNumber = "V-15722";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15722'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry91ref
{
ResourceID = "[DSCRegistry]V-15687";
 ValueName = "GroupPrivacyAcceptance";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WindowsMediaPlayer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1057::9::DSCRegistry";
 RuleNumber = "V-15687";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15687'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry92ref
{
ResourceID = "[DSCRegistry]V-3480";
 ValueName = "DisableAutoupdate";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\WindowsMediaPlayer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1068::3::DSCRegistry";
 RuleNumber = "V-3480";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3480'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry93ref
{
ResourceID = "[DSCRegistry]V-36712";
 ValueName = "AllowBasic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1078::9::DSCRegistry";
 RuleNumber = "V-36712";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36712'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry94ref
{
ResourceID = "[DSCRegistry]V-36713";
 ValueName = "AllowUnencryptedTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1090::3::DSCRegistry";
 RuleNumber = "V-36713";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36713'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry95ref
{
ResourceID = "[DSCRegistry]V-36714";
 ValueName = "AllowDigest";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Client";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1101::3::DSCRegistry";
 RuleNumber = "V-36714";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36714'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry96ref
{
ResourceID = "[DSCRegistry]V-36718";
 ValueName = "AllowBasic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1112::3::DSCRegistry";
 RuleNumber = "V-36718";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36718'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry97ref
{
ResourceID = "[DSCRegistry]V-36719";
 ValueName = "AllowUnencryptedTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1124::3::DSCRegistry";
 RuleNumber = "V-36719";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36719'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry98ref
{
ResourceID = "[DSCRegistry]V-36720";
 ValueName = "DisableRunAs";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\WinRM\\Service";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1135::3::DSCRegistry";
 RuleNumber = "V-36720";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36720'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry99ref
{
ResourceID = "[DSCRegistry]V-4447";
 ValueName = "fEncryptRPCTraffic";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1146::3::DSCRegistry";
 RuleNumber = "V-4447";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4447'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry100ref
{
ResourceID = "[DSCRegistry]V-3449";
 ValueName = "fSingleSessionPerUser";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1156::9::DSCRegistry";
 RuleNumber = "V-3449";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3449'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry101ref
{
ResourceID = "[DSCRegistry]V-15997";
 ValueName = "fDisableCcm";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1167::3::DSCRegistry";
 RuleNumber = "V-15997";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15997'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry102ref
{
ResourceID = "[DSCRegistry]V-15998";
 ValueName = "fDisableLPT";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1178::3::DSCRegistry";
 RuleNumber = "V-15998";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15998'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry103ref
{
ResourceID = "[DSCRegistry]V-16000";
 ValueName = "fEnableSmartCard";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1189::3::DSCRegistry";
 RuleNumber = "V-16000";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-16000'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry104ref
{
ResourceID = "[DSCRegistry]V-15999";
 ValueName = "fDisablePNPRedir";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1200::3::DSCRegistry";
 RuleNumber = "V-15999";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15999'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry105ref
{
ResourceID = "[DSCRegistry]V-16005";
 ValueName = "NoDisconnect";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1211::3::DSCRegistry";
 RuleNumber = "V-16005";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-16005'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry106ref
{
ResourceID = "[DSCRegistry]V-3344";
 ValueName = "LimitBlankPasswordUse";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1222::9::DSCRegistry";
 RuleNumber = "V-3344";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3344'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry107ref
{
ResourceID = "[DSCRegistry]V-14228";
 ValueName = "AuditBaseObjects";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1233::9::DSCRegistry";
 RuleNumber = "V-14228";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14228'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry108ref
{
ResourceID = "[DSCRegistry]V-14229";
 ValueName = "FullPrivilegeAuditing";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1244::9::DSCRegistry";
 RuleNumber = "V-14229";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Binary";
 ModuleName = "xDSCRegistry";
 ValueData = "00 ";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14229'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry109ref
{
ResourceID = "[DSCRegistry]V-14230";
 ValueName = "SCENoApplyLegacyAuditPolicy";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1256::9::DSCRegistry";
 RuleNumber = "V-14230";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14230'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry110ref
{
ResourceID = "[DSCRegistry]V-1171";
 ValueName = "AllocateDASD";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1267::9::DSCRegistry";
 RuleNumber = "V-1171";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1171'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry111ref
{
ResourceID = "[DSCRegistry]V-6831";
 ValueName = "RequireSignOrSeal";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1279::3::DSCRegistry";
 RuleNumber = "V-6831";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-6831'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry112ref
{
ResourceID = "[DSCRegistry]V-1163";
 ValueName = "SealSecureChannel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1291::3::DSCRegistry";
 RuleNumber = "V-1163";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1163'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry113ref
{
ResourceID = "[DSCRegistry]V-1164";
 ValueName = "SignSecureChannel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1303::3::DSCRegistry";
 RuleNumber = "V-1164";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1164'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry114ref
{
ResourceID = "[DSCRegistry]V-1165";
 ValueName = "DisablePasswordChange";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1315::9::DSCRegistry";
 RuleNumber = "V-1165";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1165'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry15ref
{
ResourceID = "[CustomRegistry]V-3373";
 Minimum = "1";
 Registry = "MaximumPasswordAge";
 ValueType = "DWORD";
 Maximum = "30";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-3373";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 ModuleVersion = "1.0";
};' WHERE NAME='V-3373'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry116ref
{
ResourceID = "[DSCRegistry]V-3374";
 ValueName = "RequireStrongKey";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netlogon\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1337::3::DSCRegistry";
 RuleNumber = "V-3374";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3374'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry117ref
{
ResourceID = "[DSCRegistry]V-11806";
 ValueName = "DontDisplayLastUserName";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1349::3::DSCRegistry";
 RuleNumber = "V-11806";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-11806'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry118ref
{
ResourceID = "[DSCRegistry]V-1154";
 ValueName = "DisableCAD";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1362::3::DSCRegistry";
 RuleNumber = "V-1154";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1154'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry22ref
{
ResourceID = "[CustomRegistry]V-36773"; 
 Minimum = "1";
 Registry = "InactivityTimeoutSecs";
 ValueType = "DWORD";
 Maximum = "900";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-36773";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";
};' WHERE NAME='V-36773'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry5ref
{
ResourceID = "[CustomRegistry]V-1089";
 RuleStatus = "Default";
 Registry = "LegalNoticeText";
 ValueType = "STRING";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1386::3::CustomRegistry";
 RuleNumber = "V-1089";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 DesiredValue = "You are accessing a Private Information System, all rights reserved";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1089';

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry6ref
{
ResourceID = "[CustomRegistry]V-26359";
 RuleStatus = "Default";
 Registry = "LegalNoticeCaption";
 ValueType = "STRING";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1396::3::CustomRegistry";
 RuleNumber = "V-26359";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 DesiredValue = "Notice and Consent Banner";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26359'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry7ref
{
ResourceID = "[CustomRegistry]V-1090";
 RuleStatus = "Default";
 Registry = "CachedLogonsCount";
 ValueType = "STRING";
 Maximum = "2";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1406::3::CustomRegistry";
 RuleNumber = "V-1090";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1090'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry8ref
{
ResourceID = "[CustomRegistry]V-1172";
 Minimum = "14";
 Registry = "PasswordExpiryWarning";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1416::3::CustomRegistry";
 RuleNumber = "V-1172";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1172'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry9ref
{
ResourceID = "[CustomRegistry]V-1157";
 Minimum = "1";
 Registry = "SCRemoveOption";
 ValueType = "STRING";
 Maximum = "2";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1426::5::CustomRegistry";
 RuleNumber = "V-1157";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 DesiredValue = "";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1157'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry120ref
{
ResourceID = "[DSCRegistry]V-6832";
 ValueName = "RequireSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1438::3::DSCRegistry";
 RuleNumber = "V-6832";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-6832'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry121ref
{
ResourceID = "[DSCRegistry]V-1166";
 ValueName = "EnableSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1449::3::DSCRegistry";
 RuleNumber = "V-1166";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1166'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry122ref
{
ResourceID = "[DSCRegistry]V-1141";
 ValueName = "EnablePlainTextPassword";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanmanWorkstation\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1460::3::DSCRegistry";
 RuleNumber = "V-1141";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1141'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry10ref
{
ResourceID = "[CustomRegistry]V-1174";
 RuleStatus = "Default";
 Registry = "AutoDisconnect";
 ValueType = "Dword";
 Maximum = "15";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1471::9::CustomRegistry";
 RuleNumber = "V-1174";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1174'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry123ref
{
ResourceID = "[DSCRegistry]V-6833";
 ValueName = "RequireSecuritySignature";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1481::9::DSCRegistry";
 RuleNumber = "V-6833";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-6833'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry124ref
{
ResourceID = "[DSCRegistry]V-1162";
 ValueName = "EnableSecuritySignature1";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1493::9::DSCRegistry";
 RuleNumber = "V-1162";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1162'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry125ref
{
ResourceID = "[DSCRegistry]V-1136";
 ValueName = "EnableForcedLogoff";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1504::3::DSCRegistry";
 RuleNumber = "V-1136";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1136'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry126ref
{
ResourceID = "[DSCRegistry]V-21950";
 ValueName = "SmbServerNameHardeningLevel";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1515::3::DSCRegistry";
 RuleNumber = "V-21950";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21950'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry127ref
{
ResourceID = "[DSCRegistry]V-1145";
 ValueName = "AutoAdminLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1527::3::DSCRegistry";
 RuleNumber = "V-1145";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1145'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry128ref
{
ResourceID = "[DSCRegistry]V-21955";
 ValueName = "DisableIpSourceRouting";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1539::3::DSCRegistry";
 RuleNumber = "V-21955";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21955'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry129ref
{
ResourceID = "[DSCRegistry]V-4110";
 ValueName = "DisableIPSourceRouting";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1551::3::DSCRegistry";
 RuleNumber = "V-4110";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};
' WHERE NAME='V-4110'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry130ref
{
ResourceID = "[DSCRegistry]V-4111";
 ValueName = "EnableICMPRedirect";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1562::3::DSCRegistry";
 RuleNumber = "V-4111";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4111'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry11ref
{
ResourceID = "[CustomRegistry]V-4113";
 RuleStatus = "Default";
 Registry = "KeepAliveTime";
 ValueType = "Dword";
 Maximum = "300000";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1573::9::CustomRegistry";
 RuleNumber = "V-4113";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4113'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry131ref
{
ResourceID = "[DSCRegistry]V-14232";
 ValueName = "NoDefaultExempt";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\IPSEC";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1583::3::DSCRegistry";
 RuleNumber = "V-14232";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14232'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry132ref
{
ResourceID = "[DSCRegistry]V-4116";
 ValueName = "NoNameReleaseOnDemand";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Netbt\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1594::3::DSCRegistry";
 RuleNumber = "V-4116";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4116'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry133ref
{
ResourceID = "[DSCRegistry]V-4112";
 ValueName = "PerformRouterDiscovery";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1606::3::DSCRegistry";
 RuleNumber = "V-4112";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4112'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry134ref
{
ResourceID = "[DSCRegistry]V-3479";
 ValueName = "SafeDllSearchMode";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1617::3::DSCRegistry";
 RuleNumber = "V-3479";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3479'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry135ref
{
ResourceID = "[DSCRegistry]V-4442";
 ValueName = "ScreenSaverGracePeriod";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1629::3::DSCRegistry";
 RuleNumber = "V-4442";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4442'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry21ref
{
ResourceID = "[CustomRegistry]V-21956"; 
 Registry = "TcpMaxDataRetransmissions";
 ValueType = "DWORD";
 Maximum = "3";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-21956";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 ModuleVersion = "1.0";
};' WHERE NAME='V-21956'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry18ref
{
ResourceID = "[CustomRegistry]V-4438";
 Registry = "TcpMaxDataRetransmissions";
 ValueType = "DWORD";
 Maximum = "3";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-4438";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip\\Parameters";
 ModuleVersion = "1.0";
};' WHERE NAME='V-4438'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry12ref
{
ResourceID = "[CustomRegistry]V-4108";
 RuleStatus = "Default";
 Registry = "WarningLevel";
 ValueType = "Dword";
 Maximum = "90";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1664::3::CustomRegistry";
 RuleNumber = "V-4108";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Services\\Eventlog\\Security";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4108'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry138ref
{
ResourceID = "[DSCRegistry]V-26283";
 ValueName = "RestrictAnonymousSAM";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1674::3::DSCRegistry";
 RuleNumber = "V-26283";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-26283'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry139ref
{
ResourceID = "[DSCRegistry]V-1093";
 ValueName = "RestrictAnonymous";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1685::3::DSCRegistry";
 RuleNumber = "V-1093";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1093'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry140ref
{
ResourceID = "[DSCRegistry]V-3376";
 ValueName = "DisableDomainCreds";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1696::3::DSCRegistry";
 RuleNumber = "V-3376";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3376'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry141ref
{
ResourceID = "[DSCRegistry]V-3377";
 ValueName = "EveryoneIncludesAnonymous";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1707::3::DSCRegistry";
 RuleNumber = "V-3377";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3377'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry142ref
{
ResourceID = "[DSCRegistry]V-3338";
 ValueName = "NullSessionPipes";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1718::3::DSCRegistry";
 RuleNumber = "V-3338";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3338'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry16ref
{
ResourceID = "[CustomRegistry]V-3339";
 Registry = "Machine";
 ValueType = "MultiString";
 DesiredValue = "System\\CurrentControlSet\\Control\\ProductOptions,System\\CurrentControlSet\\Control\\Server Applications,Software\\Microsoft\\Windows NT\\CurrentVersion";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-3339";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Control\\SecurePipeServers\\Winreg\\AllowedExactPaths";
 ModuleVersion = "1.0";
};' WHERE NAME='V-3339'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry19ref
{
ResourceID = "[CustomRegistry]V-4443";
 Registry = "Machine";
 ValueType = "MultiString";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-4443";
 DesiredValue = "Software\\Microsoft\\OLAP Server,Software\\Microsoft\\Windows NT\\CurrentVersion\\Perflib,Software\\Microsoft\\Windows NT\\CurrentVersion\\Print,Software\\Microsoft\\Windows NT\\CurrentVersion\\Windows,System\\CurrentControlSet\\Control\\ContentIndex,System\\CurrentControlSet\\Control\\Print\\Printers,System\\CurrentControlSet\\Control\\Terminal Server,System\\CurrentControlSet\\Control\\Terminal Server\\UserConfig,System\\CurrentControlSet\\Control\\Terminal Server\\DefaultUserConfiguration,System\\CurrentControlSet\\Services\\Eventlog,System\\CurrentControlSet\\Services\\Sysmonlog";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\System\\CurrentControlSet\\Control\\SecurePipeServers\\Winreg\\AllowedPaths";
 ModuleVersion = "1.0";
};' WHERE NAME='V-4443';

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry145ref
{
ResourceID = "[DSCRegistry]V-6834";
 ValueName = "RestrictNullSessAccess";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1764::9::DSCRegistry";
 RuleNumber = "V-6834";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-6834'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry146ref
{
ResourceID = "[DSCRegistry]V-3340";
 ValueName = "NullSessionShares";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LanManServer\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1775::3::DSCRegistry";
 RuleNumber = "V-3340";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3340'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry147ref
{
ResourceID = "[DSCRegistry]V-3378";
 ValueName = "ForceGuest";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1786::3::DSCRegistry";
 RuleNumber = "V-3378";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3378'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry148ref
{
ResourceID = "[DSCRegistry]V-21951";
 ValueName = "UseMachineId";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1796::3::DSCRegistry";
 RuleNumber = "V-21951";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21951'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry149ref
{
ResourceID = "[DSCRegistry]V-21952";
 ValueName = "allownullsessionfallback";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1807::3::DSCRegistry";
 RuleNumber = "V-21952";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21952'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry150ref
{
ResourceID = "[DSCRegistry]V-3379";
 ValueName = "NoLMHash";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1818::9::DSCRegistry";
 RuleNumber = "V-3379";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3379'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry151ref
{
ResourceID = "[DSCRegistry]V-1153";
 ValueName = "LmCompatibilityLevel";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1829::3::DSCRegistry";
 RuleNumber = "V-1153";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1153'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry152ref
{
ResourceID = "[DSCRegistry]V-3381";
 ValueName = "LDAPClientIntegrity";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\LDAP";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1840::3::DSCRegistry";
 RuleNumber = "V-3381";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3381'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry153ref
{
ResourceID = "[DSCRegistry]V-3382";
 ValueName = "NTLMMinClientSec";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1851::3::DSCRegistry";
 RuleNumber = "V-3382";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "537395200";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3382'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry154ref
{
ResourceID = "[DSCRegistry]V-3666";
 ValueName = "NTLMMinServerSec";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\MSV1_0";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1862::3::DSCRegistry";
 RuleNumber = "V-3666";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "537395200";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3666'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry155ref
{
ResourceID = "[DSCRegistry]V-1159";
 ValueName = "SecurityLevel";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Setup\\RecoveryConsole";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1873::9::DSCRegistry";
 RuleNumber = "V-1159";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1159'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry156ref
{
ResourceID = "[DSCRegistry]V-1158";
 ValueName = "SetCommand";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\CurrentVersion\\Setup\\RecoveryConsole";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1884::3::DSCRegistry";
 RuleNumber = "V-1158";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1158'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry157ref
{
ResourceID = "[DSCRegistry]V-1075";
 ValueName = "ShutdownWithoutLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1895::3::DSCRegistry";
 RuleNumber = "V-1075";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1075'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry158ref
{
ResourceID = "[DSCRegistry]V-3383";
 ValueName = "Enabled";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Lsa\\FIPSAlgorithmPolicy";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1906::5::DSCRegistry";
 RuleNumber = "V-3383";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3383'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry159ref
{
ResourceID = "[DSCRegistry]V-3385";
 ValueName = "ObCaseInsensitive";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Kernel";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1917::3::DSCRegistry";
 RuleNumber = "V-3385";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3385'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry160ref
{
ResourceID = "[DSCRegistry]V-1173";
 ValueName = "ProtectionMode";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1928::3::DSCRegistry";
 RuleNumber = "V-1173";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1173'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry161ref
{
ResourceID = "[DSCRegistry]V-14234";
 ValueName = "FilterAdministratorToken";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1939::3::DSCRegistry";
 RuleNumber = "V-14234";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14234'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry20ref
{
ResourceID = "[CustomRegistry]V-14235";
 Minimum = "1";
 Registry = "ConsentPromptBehaviorAdmin";
 ValueType = "DWORD";
 Maximum = "4";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-14235";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 ModuleVersion = "1.0";
};' WHERE NAME='V-14235'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry163ref
{
ResourceID = "[DSCRegistry]V-14236";
 ValueName = "ConsentPromptBehaviorUser";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1961::3::DSCRegistry";
 RuleNumber = "V-14236";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14236'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry164ref
{
ResourceID = "[DSCRegistry]V-14237";
 ValueName = "EnableInstallerDetection";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1972::3::DSCRegistry";
 RuleNumber = "V-14237";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14237'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry165ref
{
ResourceID = "[DSCRegistry]V-16008";
 ValueName = "ValidateAdminCodeSignatures";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1983::3::DSCRegistry";
 RuleNumber = "V-16008";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-16008'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry166ref
{
ResourceID = "[DSCRegistry]V-14239";
 ValueName = "EnableSecureUIAPaths";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::1994::3::DSCRegistry";
 RuleNumber = "V-14239";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14239'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry167ref
{
ResourceID = "[DSCRegistry]V-14240";
 ValueName = "EnableLUA";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2005::9::DSCRegistry";
 RuleNumber = "V-14240";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14240'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry168ref
{
ResourceID = "[DSCRegistry]V-14241";
 ValueName = "PromptOnSecureDesktop";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2016::3::DSCRegistry";
 RuleNumber = "V-14241";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14241'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry169ref
{
ResourceID = "[DSCRegistry]V-14242";
 ValueName = "EnableVirtualization";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2027::3::DSCRegistry";
 RuleNumber = "V-14242";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14242'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry170ref
{
ResourceID = "[DSCRegistry]V-15991";
 ValueName = "EnableUIADesktopToggle";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2038::3::DSCRegistry";
 RuleNumber = "V-15991";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15991'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry171ref
{
ResourceID = "[DSCRegistry]V-4446";
 ValueName = "AuthenticodeEnabled";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Safer\\CodeIdentifiers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2049::3::DSCRegistry";
 RuleNumber = "V-4446";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4446'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry172ref
{
ResourceID = "[DSCRegistry]V-4445";
 ValueName = "Optional";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Session Manager\\Subsystems";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2060::3::DSCRegistry";
 RuleNumber = "V-4445";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "MultiString";
 ModuleName = "xDSCRegistry";
 ValueData = "";
 ModuleVersion = "1.0";

};' WHERE NAME='V-4445'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry173ref
{
ResourceID = "[DSCRegistry]V-1151";
 ValueName = "AddPrinterDrivers";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\Print\\Providers\\LanMan Print Services\\Servers";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2071::3::DSCRegistry";
 RuleNumber = "V-1151";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1151'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry174ref
{
ResourceID = "[DSCRegistry]V-2374";
 ValueName = "NoDriveTypeAutoRun";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2084::3::DSCRegistry";
 RuleNumber = "V-2374";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "255";
 ModuleVersion = "1.0";

};' WHERE NAME='V-2374'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry175ref
{
ResourceID = "[DSCRegistry]V-14243";
 ValueName = "EnumerateAdministrators";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2095::5::DSCRegistry";
 RuleNumber = "V-14243";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14243'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry176ref
{
ResourceID = "[DSCRegistry]V-36439";
 ValueName = "LocalAccountTokenFilterPolicy";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2106::5::DSCRegistry";
 RuleNumber = "V-36439";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-36439'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry177ref
{
ResourceID = "[DSCRegistry]V-21953";
 ValueName = "AllowOnlineID";
 Key = "HKLM:\\System\\CurrentControlSet\\Control\\LSA\\pku2u\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2117::5::DSCRegistry";
 RuleNumber = "V-21953";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21953'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry178ref
{
ResourceID = "[DSCRegistry]V-21954";
 ValueName = "SupportedEncryptionTypes";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System\\Kerberos\\Parameters\\";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2128::5::DSCRegistry";
 RuleNumber = "V-21954";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21954';

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry179ref
{
ResourceID = "[DSCRegistry]V-57453";
 ValueName = "BypassDataThrottling";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2139::5::DSCRegistry";
 RuleNumber = "V-57453";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57453'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry180ref
{
ResourceID = "[DSCRegistry]V-57455";
 ValueName = "DontShowUI";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2150::7::DSCRegistry";
 RuleNumber = "V-57455";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57455'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry181ref
{
ResourceID = "[DSCRegistry]V-57463";
 ValueName = "DisableArchive";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2161::7::DSCRegistry";
 RuleNumber = "V-57463";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57463'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry182ref
{
ResourceID = "[DSCRegistry]V-57465";
 ValueName = "ConfigureArchive";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2172::7::DSCRegistry";
 RuleNumber = "V-57465";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57465'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry13ref
{
ResourceID = "[CustomRegistry]V-57467";
 Minimum = "100";
 Registry = "MaxArchiveCount";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2183::5::CustomRegistry";
 RuleNumber = "V-57467";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57467'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry183ref
{
ResourceID = "[DSCRegistry]V-57469";
 ValueName = "DisableQueue";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2193::7::DSCRegistry";
 RuleNumber = "V-57469";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57469'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry184ref
{
ResourceID = "[DSCRegistry]V-57471";
 ValueName = "ForceQueue";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2204::7::DSCRegistry";
 RuleNumber = "V-57471";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57471'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry14ref
{
ResourceID = "[CustomRegistry]V-57473";
 Minimum = "50";
 Registry = "MaxQueueCount";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2215::5::CustomRegistry";
 RuleNumber = "V-57473";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57473'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry185ref
{
ResourceID = "[DSCRegistry]V-57475";
 ValueName = "QueuePesterInterval";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2225::7::DSCRegistry";
 RuleNumber = "V-57475";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57475'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry186ref
{
ResourceID = "[DSCRegistry]V-57477";
 ValueName = "DefaultConsent";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting\\Consent";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2236::7::DSCRegistry";
 RuleNumber = "V-57477";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "4";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57477'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry187ref
{
ResourceID = "[DSCRegistry]V-57479";
 ValueName = "DefaultOverrideBehavior";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Windows Error Reporting\\Consent";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2247::7::DSCRegistry";
 RuleNumber = "V-57479";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57479'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry188ref
{
ResourceID = "[DSCRegistry]V-57639";
 ValueName = "ForceKeyProtection";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Cryptography";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2258::7::DSCRegistry";
 RuleNumber = "V-57639";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "2";
 ModuleVersion = "1.0";

};' WHERE NAME='V-57639'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege1ref
{
ResourceID = "[Privilege]V-26469";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-26469";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeTrustedCredManAccessPrivilege";
 Operation = "Remove All";

};' WHERE NAME='V-26469'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege2ref
{
ResourceID = "[Privilege]V-26470";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "BUILTIN\\Authenticated Users"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2280::9::Privilege";
 RuleNumber = "V-26470";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeNetworkLogonRight";
 Operation = "Allow Only";

};' WHERE NAME='V-26470'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege3ref
{
ResourceID = "[Privilege]V-1102";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2290::9::Privilege";
 RuleNumber = "V-1102";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeTcbPrivilege";
 Operation = "Remove All";

};' WHERE NAME='V-1102'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege4ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseQuotaPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26471'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege5ref
{
ResourceID = "[Privilege]V-26472";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2307::9::Privilege";
 RuleNumber = "V-26472";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeInteractiveLogonRight";
 Operation = "Allow Only";

};
' WHERE NAME='V-26472'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege6ref
{
ResourceID = "[Privilege]V-26473";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2316::9::Privilege";
 RuleNumber = "V-26473";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeRemoteInteractiveLogonRight";
 Operation = "Allow Only";

};' WHERE NAME='V-26473'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege7ref
{
ResourceID = "[Privilege]V-26474";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2325::9::Privilege";
 RuleNumber = "V-26474";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeBackupPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26474'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege8ref
{
ResourceID = "[Privilege]V-26475";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators",
    "BUILTIN\\Authenticated Users",
    "NT AUTHORITY\\LOCAL SERVICE",
    "NT AUTHORITY\\NETWORK SERVICE",
    "Window Manager\\Window Manager Group"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2334::9::Privilege";
 RuleNumber = "V-26475";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeChangeNotifyPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26475';

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege9ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemtimePrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26476'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege10ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeTimeZonePrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26477'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege11ref
{
ResourceID = "[Privilege]V-26478";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2360::9::Privilege";
 RuleNumber = "V-26478";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreatePagefilePrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26478'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege12ref
{
ResourceID = "[Privilege]V-26479";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2370::9::Privilege";
 RuleNumber = "V-26479";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateTokenPrivilege";
 Operation = "Remove All";

};' WHERE NAME='V-26479'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege13ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateGlobalPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26480'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege14ref
{
ResourceID = "[Privilege]V-26481";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2387::9::Privilege";
 RuleNumber = "V-26481";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreatePermanentPrivilege";
 Operation = "Remove All";

};' WHERE NAME='V-26481'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege15ref
{
ResourceID = "[Privilege]V-26482";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2395::9::Privilege";
 RuleNumber = "V-26482";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeCreateSymbolicLinkPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26482'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege16ref
{
ResourceID = "[Privilege]V-18010";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2404::9::Privilege";
 RuleNumber = "V-18010";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeDebugPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-18010'  ;


UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege18ref
{
ResourceID = "[Privilege]V-26483";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2422::9::Privilege";
 RuleNumber = "V-26483";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyBatchLogonRight";
 Operation = "Add";

};' WHERE NAME='V-26483'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege19ref
{
ResourceID = "[Privilege]V-26485";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2443::9::Privilege";
 RuleNumber = "V-26485";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyInteractiveLogonRight";
 Operation = "Add";

};' WHERE NAME='V-26485'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege20ref
{
ResourceID = "[Privilege]V-26486";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Guests"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2452::9::Privilege";
 RuleNumber = "V-26486";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeDenyRemoteInteractiveLogonRight";
 Operation = "Add";

};' WHERE NAME='V-26486';

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege21ref
{
ResourceID = "[Privilege]V-26487";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2461::9::Privilege";
 RuleNumber = "V-26487";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeEnableDelegationPrivilege";
 Operation = "Remove All";

};' WHERE NAME='V-26487'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege22ref
{
ResourceID = "[Privilege]V-26488";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2469::9::Privilege";
 RuleNumber = "V-26488";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeRemoteShutdownPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26488'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege23ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeAuditPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26489'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege24ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeImpersonatePrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26490'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege25ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseWorkingSetPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26491'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege26ref
{
ResourceID = "[Privilege]V-26492";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2505::9::Privilege";
 RuleNumber = "V-26492";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeIncreaseBasePriorityPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26492'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege27ref
{
ResourceID = "[Privilege]V-26493";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2514::9::Privilege";
 RuleNumber = "V-26493";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeLoadDriverPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26493'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege28ref
{
ResourceID = "[Privilege]V-26494";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2523::9::Privilege";
 RuleNumber = "V-26494";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeLockMemoryPrivilege";
 Operation = "Remove All";

};' WHERE NAME='V-26494'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege29ref
{
ResourceID = "[Privilege]V-26495";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2531::9::Privilege";
 RuleNumber = "V-26495";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeBatchLogonRight";
 Operation = "Allow Only";

};' WHERE NAME='V-26495'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege30ref
{
ResourceID = "[Privilege]V-26496";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2540::9::Privilege";
 RuleNumber = "V-26496";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeSecurityPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26496'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege31ref
{
ResourceID = "[Privilege]V-26497";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2549::9::Privilege";
 RuleNumber = "V-26497";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeRelabelPrivilege";
 Operation = "Remove All";

};' WHERE NAME='V-26497'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege32ref
{
ResourceID = "[Privilege]V-26498";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2557::9::Privilege";
 RuleNumber = "V-26498";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemEnvironmentPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26498'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege33ref
{
ResourceID = "[Privilege]V-26499";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2566::9::Privilege";
 RuleNumber = "V-26499";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeManageVolumePrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26499'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege34ref
{
ResourceID = "[Privilege]V-26500";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2575::9::Privilege";
 RuleNumber = "V-26500";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeProfileSingleProcessPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26500'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege35ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeSystemProfilePrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26501'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege36ref
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeAssignPrimaryTokenPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26503'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege37ref
{
ResourceID = "[Privilege]V-26504";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2602::9::Privilege";
 RuleNumber = "V-26504";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeRestorePrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26504'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege38ref
{
ResourceID = "[Privilege]V-26505";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2611::9::Privilege";
 RuleNumber = "V-26505";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeShutdownPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26505'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege39ref
{
ResourceID = "[Privilege]V-26506";
 RuleStatus = "Default";
 Members = {
    "BUILTIN\\Administrators"
};
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2620::9::Privilege";
 RuleNumber = "V-26506";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeTakeOwnershipPrivilege";
 Operation = "Allow Only";

};' WHERE NAME='V-26506'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol1ref
{
ResourceID = "[AuditPol]V-26529";
 RuleStatus = "Default";
 AuditPolicy = "Credential Validation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-26529";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26529'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol2ref
{
ResourceID = "[AuditPol]V-26530";
 RuleStatus = "Default";
 AuditPolicy = "Credential Validation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2641::9::AuditPol";
 RuleNumber = "V-26530";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26530'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol3ref
{
ResourceID = "[AuditPol]V-26531";
 RuleStatus = "Default";
 AuditPolicy = "Computer Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2649::9::AuditPol";
 RuleNumber = "V-26531";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26531'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol4ref
{
ResourceID = "[AuditPol]V-26532";
 RuleStatus = "Default";
 AuditPolicy = "Computer Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2657::9::AuditPol";
 RuleNumber = "V-26532";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26532'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol5ref
{
ResourceID = "[AuditPol]V-26533";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Management Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2665::9::AuditPol";
 RuleNumber = "V-26533";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26533'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol6ref
{
ResourceID = "[AuditPol]V-26534";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Management Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2673::9::AuditPol";
 RuleNumber = "V-26534";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26534'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol7ref
{
ResourceID = "[AuditPol]V-26535";
 RuleStatus = "Default";
 AuditPolicy = "Security Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2681::9::AuditPol";
 RuleNumber = "V-26535";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26535'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol8ref
{
ResourceID = "[AuditPol]V-26536";
 RuleStatus = "Default";
 AuditPolicy = "Security Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2689::9::AuditPol";
 RuleNumber = "V-26536";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26536'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol9ref
{
ResourceID = "[AuditPol]V-26537";
 RuleStatus = "Default";
 AuditPolicy = "User Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2697::9::AuditPol";
 RuleNumber = "V-26537";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26537'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol10ref
{
ResourceID = "[AuditPol]V-26538";
 RuleStatus = "Default";
 AuditPolicy = "User Account Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2705::9::AuditPol";
 RuleNumber = "V-26538";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26538'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol11ref
{
ResourceID = "[AuditPol]V-26539";
 RuleStatus = "Default";
 AuditPolicy = "Process Creation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2713::9::AuditPol";
 RuleNumber = "V-26539";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26539'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol12ref
{
ResourceID = "[AuditPol]V-26540";
 RuleStatus = "Default";
 AuditPolicy = "Logoff";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2721::9::AuditPol";
 RuleNumber = "V-26540";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26540'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol13ref
{
ResourceID = "[AuditPol]V-26541";
 RuleStatus = "Default";
 AuditPolicy = "Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2729::9::AuditPol";
 RuleNumber = "V-26541";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26541'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol14ref
{
ResourceID = "[AuditPol]V-26542";
 RuleStatus = "Default";
 AuditPolicy = "Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2737::9::AuditPol";
 RuleNumber = "V-26542";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26542'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol15ref
{
ResourceID = "[AuditPol]V-26543";
 RuleStatus = "Default";
 AuditPolicy = "Special Logon";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2745::9::AuditPol";
 RuleNumber = "V-26543";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26543'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol16ref
{
ResourceID = "[AuditPol]V-26546";
 RuleStatus = "Default";
 AuditPolicy = "Audit Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2753::9::AuditPol";
 RuleNumber = "V-26546";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26546'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol17ref
{
ResourceID = "[AuditPol]V-26547";
 RuleStatus = "Default";
 AuditPolicy = "Audit Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2761::9::AuditPol";
 RuleNumber = "V-26547";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26547'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol18ref
{
ResourceID = "[AuditPol]V-26548";
 RuleStatus = "Default";
 AuditPolicy = "Authentication Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2769::9::AuditPol";
 RuleNumber = "V-26548";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26548'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol19ref
{
ResourceID = "[AuditPol]V-26549";
 RuleStatus = "Default";
 AuditPolicy = "Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2777::9::AuditPol";
 RuleNumber = "V-26549";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26549'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol20ref
{
ResourceID = "[AuditPol]V-26550";
 RuleStatus = "Default";
 AuditPolicy = "Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2785::9::AuditPol";
 RuleNumber = "V-26550";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26550'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol21ref
{
ResourceID = "[AuditPol]V-26551";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Driver";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2793::9::AuditPol";
 RuleNumber = "V-26551";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26551'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol22ref
{
ResourceID = "[AuditPol]V-26552";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Driver";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2801::9::AuditPol";
 RuleNumber = "V-26552";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26552'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol23ref
{
ResourceID = "[AuditPol]V-26553";
 RuleStatus = "Default";
 AuditPolicy = "Security State Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2809::9::AuditPol";
 RuleNumber = "V-26553";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26553'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol24ref
{
ResourceID = "[AuditPol]V-26554";
 RuleStatus = "Default";
 AuditPolicy = "Security State Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2817::9::AuditPol";
 RuleNumber = "V-26554";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26554'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol25ref
{
ResourceID = "[AuditPol]V-26555";
 RuleStatus = "Default";
 AuditPolicy = "Security System Extension";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2825::9::AuditPol";
 RuleNumber = "V-26555";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26555'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol26ref
{
ResourceID = "[AuditPol]V-26556";
 RuleStatus = "Default";
 AuditPolicy = "Security System Extension";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2833::9::AuditPol";
 RuleNumber = "V-26556";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26556'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol27ref
{
ResourceID = "[AuditPol]V-26557";
 RuleStatus = "Default";
 AuditPolicy = "System Integrity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2841::9::AuditPol";
 RuleNumber = "V-26557";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26557'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol28ref
{
ResourceID = "[AuditPol]V-26558";
 RuleStatus = "Default";
 AuditPolicy = "System Integrity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2849::9::AuditPol";
 RuleNumber = "V-26558";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-26558'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity1ref
{
ResourceID = "[AccountSecurity]V-1097";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "3";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2870::9::AccountSecurity";
 RuleNumber = "V-1097";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutThreshold";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1097'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity2ref
{
ResourceID = "[AccountSecurity]V-1098";
 Minimum = "60";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2879::8::AccountSecurity";
 RuleNumber = "V-1098";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutWindow";
 ModuleVersion = "1.1";

DependsOn = {
    "[AccountSecurity]V-1099"};
};
instance of AccountSecurity as $AccountSecurity3ref
{
ResourceID = "[AccountSecurity]V-1099";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2888::9::AccountSecurity";
 RuleNumber = "V-1099";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutDuration";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1098'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity3ref
{
ResourceID = "[AccountSecurity]V-1099";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2888::9::AccountSecurity";
 RuleNumber = "V-1099";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LockoutDuration";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1099' ;

-- V-1098 depends on V-1099.
--UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='' WHERE NAME='V-1099'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity4ref
{
ResourceID = "[AccountSecurity]V-1107";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2896::9::AccountSecurity";
 RuleNumber = "V-1107";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "24";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "UniquePW";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1107'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity5ref
{
ResourceID = "[AccountSecurity]V-1104";
 Minimum = "1";
 RuleStatus = "Default";
 Maximum = "60";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2904::9::AccountSecurity";
 RuleNumber = "V-1104";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MaxPWAge";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1104'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity6ref
{
ResourceID = "[AccountSecurity]V-1105";
 Minimum = "1";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2913::9::AccountSecurity";
 RuleNumber = "V-1105";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MinPWAge";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1105'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity7ref
{
ResourceID = "[AccountSecurity]V-6836";
 Minimum = "14";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2921::9::AccountSecurity";
 RuleNumber = "V-6836";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "MinPWLen";
 ModuleVersion = "1.1";

};' WHERE NAME='V-6836'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity8ref
{
ResourceID = "[AccountSecurity]V-3380";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2929::9::AccountSecurity";
 RuleNumber = "V-3380";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "0";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "ForceLogoff";
 ModuleVersion = "1.1";

};' WHERE NAME='V-3380'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity9ref
{
ResourceID = "[AccountSecurity]V-1113";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2937::9::AccountSecurity";
 RuleNumber = "V-1113";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "DisableGuest";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1113'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity10ref
{
ResourceID = "[AccountSecurity]V-1114";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2954::9::AccountSecurity";
 RuleNumber = "V-1114";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Visitor";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameGuest";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1114'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCService as $DSCService1ref
{
ResourceID = "[DSCService]V-40206";
 RuleStatus = "Default";
 RuleNumber = "V-40206";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3015::6::DSCService";
 Name = "SCPolicySvc";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";

};' WHERE NAME='V-40206'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry38ref
{
ResourceID = "[GPRegistry]V-57600-1";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4108::9::GPRegistry";
 RuleNumber = "V-57600-1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowRedirect";

};' WHERE NAME='V-57600'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry189ref
{
ResourceID = "[DSCRegistry]V-14256";
 ValueName = "NoWebServices";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3034::6::DSCRegistry";
 RuleNumber = "V-14256";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14256'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry190ref
{
ResourceID = "[DSCRegistry]V-15676";
 ValueName = "NoOnlinePrintsWizard";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3045::7::DSCRegistry";
 RuleNumber = "V-15676";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15676'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry191ref
{
ResourceID = "[DSCRegistry]V-15709";
 ValueName = "DownloadGameInfo";
 Key = "HKLM:\\\\Software\\Policies\\Microsoft\\Windows\\GameUX";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3056::7::DSCRegistry";
 RuleNumber = "V-15709";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-15709'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry192ref
{
ResourceID = "[DSCRegistry]V-14262";
 ValueName = "DisabledComponents";
 Key = "HKLM:\\System\\CurrentControlSet\\Services\\Tcpip6\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3067::7::DSCRegistry";
 RuleNumber = "V-14262";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "255";
 ModuleVersion = "1.0";

};' WHERE NAME='V-14262';


UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry193ref
{
ResourceID = "[DSCRegistry]V-21975";
 ValueName = "DisableHomeGroup";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\Homegroup";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3091::8::DSCRegistry";
 RuleNumber = "V-21975";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21975'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry194ref
{
ResourceID = "[DSCRegistry]V-16001";
 ValueName = "RedirectOnlyDefaultClientPrinter ";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows NT\\Terminal Services";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3102::8::DSCRegistry";
 RuleNumber = "V-16001";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-16001'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry195ref
{
ResourceID = "[DSCRegistry]V-21974";
 ValueName = "GameUpdateOptions";
 Key = "HKLM:\\Software\\Policies\\Microsoft\\Windows\\GameUX";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3122::8::DSCRegistry";
 RuleNumber = "V-21974";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21974'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry196ref
{
ResourceID = "[DSCRegistry]V-21978";
 ValueName = "Disabled";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer\\WAU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3133::9::DSCRegistry";
 RuleNumber = "V-21978";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-21978';

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol29ref
{
ResourceID = "[AuditPol]V-56300";
 RuleStatus = "Default";
 AuditPolicy = "Kerberos Authentication Service";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3146::9::AuditPol";
 RuleNumber = "V-56300";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56300'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol30ref
{
ResourceID = "[AuditPol]V-56301";
 RuleStatus = "Default";
 AuditPolicy = "Kerberos Service Ticket Operations";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3154::9::AuditPol";
 RuleNumber = "V-56301";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56301'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol31ref
{
ResourceID = "[AuditPol]V-56302";
 RuleStatus = "Default";
 AuditPolicy = "Other Account Logon Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3162::9::AuditPol";
 RuleNumber = "V-56302";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56302'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol32ref
{
ResourceID = "[AuditPol]V-56303";
 RuleStatus = "Default";
 AuditPolicy = "Application Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3170::9::AuditPol";
 RuleNumber = "V-56303";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56303'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol33ref
{
ResourceID = "[AuditPol]V-56304";
 RuleStatus = "Default";
 AuditPolicy = "Distribution Group Management";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3178::9::AuditPol";
 RuleNumber = "V-56304";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56304'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol34ref
{
ResourceID = "[AuditPol]V-56305";
 RuleStatus = "Default";
 AuditPolicy = "DPAPI Activity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3186::9::AuditPol";
 RuleNumber = "V-56305";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56305'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol35ref
{
ResourceID = "[AuditPol]V-56306";
 RuleStatus = "Default";
 AuditPolicy = "Process Termination";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3194::9::AuditPol";
 RuleNumber = "V-56306";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56306'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol36ref
{
ResourceID = "[AuditPol]V-56307";
 RuleStatus = "Default";
 AuditPolicy = "RPC Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3202::9::AuditPol";
 RuleNumber = "V-56307";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56307'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol37ref
{
ResourceID = "[AuditPol]V-56308";
 RuleStatus = "Default";
 AuditPolicy = "Account Lockout";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3210::9::AuditPol";
 RuleNumber = "V-56308";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56308'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol38ref
{
ResourceID = "[AuditPol]V-56309";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Extended Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3218::9::AuditPol";
 RuleNumber = "V-56309";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56309'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol39ref
{
ResourceID = "[AuditPol]V-56310";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Main Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3226::9::AuditPol";
 RuleNumber = "V-56310";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56310'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol40ref
{
ResourceID = "[AuditPol]V-56311";
 RuleStatus = "Default";
 AuditPolicy = "IPsec Quick Mode";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3234::9::AuditPol";
 RuleNumber = "V-56311";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};
' WHERE NAME='V-56311'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol41ref
{
ResourceID = "[AuditPol]V-56312";
 RuleStatus = "Default";
 AuditPolicy = "Network Policy Server";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3242::9::AuditPol";
 RuleNumber = "V-56312";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56312'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol42ref
{
ResourceID = "[AuditPol]V-56313";
 RuleStatus = "Default";
 AuditPolicy = "Other Logon/Logoff Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3250::9::AuditPol";
 RuleNumber = "V-56313";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56313'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol43ref
{
ResourceID = "[AuditPol]V-56314";
 RuleStatus = "Default";
 AuditPolicy = "Application Generated";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3258::9::AuditPol";
 RuleNumber = "V-56314";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56314'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol44ref
{
ResourceID = "[AuditPol]V-56315";
 RuleStatus = "Default";
 AuditPolicy = "Central Policy Staging";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3266::9::AuditPol";
 RuleNumber = "V-56315";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56315'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol45ref
{
ResourceID = "[AuditPol]V-56316";
 RuleStatus = "Default";
 AuditPolicy = "Certification Services";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3274::9::AuditPol";
 RuleNumber = "V-56316";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56316'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol46ref
{
ResourceID = "[AuditPol]V-56317";
 RuleStatus = "Default";
 AuditPolicy = "Detailed File Share";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3282::9::AuditPol";
 RuleNumber = "V-56317";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56317'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol47ref
{
ResourceID = "[AuditPol]V-56318";
 RuleStatus = "Default";
 AuditPolicy = "File Share";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3290::9::AuditPol";
 RuleNumber = "V-56318";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56318'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol48ref
{
ResourceID = "[AuditPol]V-56319";
 RuleStatus = "Default";
 AuditPolicy = "File System";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3298::9::AuditPol";
 RuleNumber = "V-56319";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56319'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol49ref
{
ResourceID = "[AuditPol]V-56320";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Connection";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3306::9::AuditPol";
 RuleNumber = "V-56320";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56320'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol50ref
{
ResourceID = "[AuditPol]V-56321";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Packet Drop";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3314::9::AuditPol";
 RuleNumber = "V-56321";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56321'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol51ref
{
ResourceID = "[AuditPol]V-56322";
 RuleStatus = "Default";
 AuditPolicy = "Handle Manipulation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3322::9::AuditPol";
 RuleNumber = "V-56322";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56322'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol52ref
{
ResourceID = "[AuditPol]V-56323";
 RuleStatus = "Default";
 AuditPolicy = "Other Object Access Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3330::9::AuditPol";
 RuleNumber = "V-56323";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56323'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol53ref
{
ResourceID = "[AuditPol]V-56324";
 RuleStatus = "Default";
 AuditPolicy = "Registry";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3338::9::AuditPol";
 RuleNumber = "V-56324";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56324'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol54ref
{
ResourceID = "[AuditPol]V-56325";
 RuleStatus = "Default";
 AuditPolicy = "SAM";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3346::9::AuditPol";
 RuleNumber = "V-56325";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56325'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol55ref
{
ResourceID = "[AuditPol]V-56326";
 RuleStatus = "Default";
 AuditPolicy = "Filtering Platform Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3354::9::AuditPol";
 RuleNumber = "V-56326";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56326'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol56ref
{
ResourceID = "[AuditPol]V-56327";
 RuleStatus = "Default";
 AuditPolicy = "MPSSVC Rule-Level Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3362::9::AuditPol";
 RuleNumber = "V-56327";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56327'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol57ref
{
ResourceID = "[AuditPol]V-56328";
 RuleStatus = "Default";
 AuditPolicy = "Other Policy Change Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3370::9::AuditPol";
 RuleNumber = "V-56328";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56328'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol58ref
{
ResourceID = "[AuditPol]V-56329";
 RuleStatus = "Default";
 AuditPolicy = "Non Sensitive Privilege Use";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3378::9::AuditPol";
 RuleNumber = "V-56329";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56329'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol59ref
{
ResourceID = "[AuditPol]V-56331";
 RuleStatus = "Default";
 AuditPolicy = "Other System Events";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3393::9::AuditPol";
 RuleNumber = "V-56331";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56331'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol60ref
{
ResourceID = "[AuditPol]V-56379";
 RuleStatus = "Default";
 AuditPolicy = "Kernel Object";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3400::9::AuditPol";
 RuleNumber = "V-56379";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56379'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry1ref
{
ResourceID = "[GPRegistry]V-56332";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3408::9::GPRegistry";
 RuleNumber = "V-56332";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";

};' WHERE NAME='V-56332'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry2ref
{
ResourceID = "[GPRegistry]V-56333";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3419::9::GPRegistry";
 RuleNumber = "V-56333";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";

};' WHERE NAME='V-56333'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry3ref
{
ResourceID = "[GPRegistry]V-56334";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3430::9::GPRegistry";
 RuleNumber = "V-56334";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";

};' WHERE NAME='V-56334'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry4ref
{
ResourceID = "[GPRegistry]V-56335";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3441::9::GPRegistry";
 RuleNumber = "V-56335";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";

};' WHERE NAME='V-56335'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry5ref
{
ResourceID = "[GPRegistry]V-56336";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3452::9::GPRegistry";
 RuleNumber = "V-56336";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";

};' WHERE NAME='V-56336'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry6ref
{
ResourceID = "[GPRegistry]V-56337";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3463::9::GPRegistry";
 RuleNumber = "V-56337";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";

};' WHERE NAME='V-56337'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry7ref
{
ResourceID = "[GPRegistry]V-56338";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3474::9::GPRegistry";
 RuleNumber = "V-56338";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";

};' WHERE NAME='V-56338'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry8ref
{
ResourceID = "[GPRegistry]V-56339";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3485::9::GPRegistry";
 RuleNumber = "V-56339";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";

};' WHERE NAME='V-56339'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry9ref
{
ResourceID = "[GPRegistry]V-56340";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3496::9::GPRegistry";
 RuleNumber = "V-56340";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";

};' WHERE NAME='V-56340'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry10ref
{
ResourceID = "[GPRegistry]V-56341";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3507::9::GPRegistry";
 RuleNumber = "V-56341";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";

};' WHERE NAME='V-56341'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry11ref
{
ResourceID = "[GPRegistry]V-56342";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3518::9::GPRegistry";
 RuleNumber = "V-56342";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";

};' WHERE NAME='V-56342'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry12ref
{
ResourceID = "[GPRegistry]V-56343";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3529::9::GPRegistry";
 RuleNumber = "V-56343";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";

};' WHERE NAME='V-56343'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry13ref
{
ResourceID = "[GPRegistry]V-56344";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3540::9::GPRegistry";
 RuleNumber = "V-56344";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";

};' WHERE NAME='V-56344'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry14ref
{
ResourceID = "[GPRegistry]V-56345";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PrivateProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3551::9::GPRegistry";
 RuleNumber = "V-56345";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";

};' WHERE NAME='V-56345'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry15ref
{
ResourceID = "[GPRegistry]V-56346";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3562::9::GPRegistry";
 RuleNumber = "V-56346";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DisableUnicastResponsesToMulticastBroadcast";

};' WHERE NAME='V-56346'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry16ref
{
ResourceID = "[GPRegistry]V-56347";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3573::9::GPRegistry";
 RuleNumber = "V-56347";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalIPsecPolicyMerge";

};' WHERE NAME='V-56347'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry17ref
{
ResourceID = "[GPRegistry]V-56348";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3584::9::GPRegistry";
 RuleNumber = "V-56348";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowLocalPolicyMerge";

};' WHERE NAME='V-56348'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry18ref
{
ResourceID = "[GPRegistry]V-56349";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3595::9::GPRegistry";
 RuleNumber = "V-56349";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";

};' WHERE NAME='V-56349'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry19ref
{
ResourceID = "[GPRegistry]V-56350";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3606::9::GPRegistry";
 RuleNumber = "V-56350";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";

};' WHERE NAME='V-56350'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry20ref
{
ResourceID = "[GPRegistry]V-56351";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3617::9::GPRegistry";
 RuleNumber = "V-56351";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "DefaultInboundAction";

};' WHERE NAME='V-56351'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry21ref
{
ResourceID = "[GPRegistry]V-56352";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\PublicProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3628::9::GPRegistry";
 RuleNumber = "V-56352";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DefaultOutboundAction";

};' WHERE NAME='V-56352'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCService as $DSCService3ref
{
ResourceID = "[DSCService]V-56359";
 RuleStatus = "Default";
 State = "Running";
 RuleNumber = "V-56359";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3640::9::DSCService";
 Name = "EventLog";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56359'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry197ref
{
ResourceID = "[DSCRegistry]V-56360";
 ValueName = "AnnounceFlags";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Config";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3649::8::DSCRegistry";
 RuleNumber = "V-56360";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "5";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56360'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry198ref
{
ResourceID = "[DSCRegistry]V-56361";
 ValueName = "Type";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\Parameters";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3661::9::DSCRegistry";
 RuleNumber = "V-56361";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "NTP";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56361'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry199ref
{
ResourceID = "[DSCRegistry]V-56362";
 ValueName = "Enabled";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\TimeProviders\\NtpServer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3671::9::DSCRegistry";
 RuleNumber = "V-56362";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56362'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry200ref
{
ResourceID = "[DSCRegistry]V-56363";
 ValueName = "SpecialPollInterval";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Services\\W32Time\\TimeProviders\\NtpClient";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3681::9::DSCRegistry";
 RuleNumber = "V-56363";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "900";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56363'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry201ref
{
ResourceID = "[DSCRegistry]V-56371";
 ValueName = "crashonauditfail";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Lsa";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3691::9::DSCRegistry";
 RuleNumber = "V-56371";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56371'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry202ref
{
ResourceID = "[DSCRegistry]V-56372";
 ValueName = "ClearPageFileAtShutdown";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\Session Manager\\Memory Management";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3701::9::DSCRegistry";
 RuleNumber = "V-56372";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56372'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry22ref
{
ResourceID = "[GPRegistry]V-56364-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Application";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3712::9::GPRegistry";
 RuleNumber = "V-56364-1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' WHERE NAME='V-56364'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry203ref
{
ResourceID = "[DSCRegistry]V-56365";
 ValueName = "undockwithoutlogon";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\system";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3736::9::DSCRegistry";
 RuleNumber = "V-56365";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56365'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry204ref
{
ResourceID = "[DSCRegistry]V-56366";
 ValueName = "AllocateCDRoms";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3747::9::DSCRegistry";
 RuleNumber = "V-56366";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56366'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry205ref
{
ResourceID = "[DSCRegistry]V-56367";
 ValueName = "AllocateFloppies";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows NT\\CurrentVersion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3758::9::DSCRegistry";
 RuleNumber = "V-56367";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56367'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry206ref
{
ResourceID = "[DSCRegistry]V-56369";
 ValueName = "ForceUnlockLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows NT\\Currentversion\\Winlogon";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3769::9::DSCRegistry";
 RuleNumber = "V-56369";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56369'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry24ref
{
ResourceID = "[GPRegistry]V-56370-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\Security";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3780::9::GPRegistry";
 RuleNumber = "V-56370-1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' WHERE NAME='V-56370'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry26ref
{
ResourceID = "[GPRegistry]V-56373-1";
 Manual = "True";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\EventLog\\System";
 Category = "EventLog";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3803::9::GPRegistry";
 RuleNumber = "V-56373-1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "String";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "Retention";

};' WHERE NAME='V-56373'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol61ref
{
ResourceID = "[AuditPol]V-56378";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3827::9::AuditPol";
 RuleNumber = "V-56378";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56378'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of SystemCheck as $SystemCheck1ref
{
ResourceID = "[SystemCheck]V-56353";
 Manual = "False";
 RuleNumber = "V-56353";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "DNS";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56353'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of SystemCheck as $SystemCheck2ref
{
ResourceID = "[SystemCheck]V-56356";
 Manual = "False";
 RuleNumber = "V-56356";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3850::9::SystemCheck";
 Category = "TimeServer";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56356'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of SystemCheck as $SystemCheck3ref
{
ResourceID = "[SystemCheck]V-56357";
 Manual = "False";
 RuleNumber = "V-56357";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3858::9::SystemCheck";
 Category = "Services";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56357'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of SystemCheck as $SystemCheck4ref
{
ResourceID = "[SystemCheck]V-56358";
 Manual = "False";
 RuleNumber = "V-56358";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3866::9::SystemCheck";
 Category = "Software";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56358'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry28ref
{
ResourceID = "[GPRegistry]V-56500-1";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\DomainProfile\\IcmpSettings";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3893::9::GPRegistry";
 RuleNumber = "V-56500-1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
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
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "AllowRedirect";

};' WHERE NAME='V-56500'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry48ref
{
ResourceID = "[GPRegistry]V-56512";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4222::9::GPRegistry";
 RuleNumber = "V-56512";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";
 ValueName = "DisableNotifications";

};' WHERE NAME='V-56512'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of GPRegistry as $GPRegistry49ref
{
ResourceID = "[GPRegistry]V-56513";
 Manual = "False";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\WindowsFirewall\\StandardProfile";
 Category = "Firewall";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4234::9::GPRegistry";
 RuleNumber = "V-56513";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "DWord";
 ModuleName = "xGPRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";
 ValueName = "EnableFirewall";

};' WHERE NAME='V-56513'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry207ref
{
ResourceID = "[DSCRegistry]V-56526";
 ValueName = "AUOptions";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4285::9::DSCRegistry";
 RuleNumber = "V-56526";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "3";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56526'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry208ref
{
ResourceID = "[DSCRegistry]V-56528";
 ValueName = "NoRDS";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Conferencing";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4295::9::DSCRegistry";
 RuleNumber = "V-56528";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56528'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry209ref
{
ResourceID = "[DSCRegistry]V-56529";
 ValueName = "NoAUShutdownOption";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4305::9::DSCRegistry";
 RuleNumber = "V-56529";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56529'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry210ref
{
ResourceID = "[DSCRegistry]V-56533";
 ValueName = "EnableSecureCredentialPrompting";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\policies\\CredUI";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4335::9::DSCRegistry";
 RuleNumber = "V-56533";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56533'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of CustomRegistry as $CustomRegistry23ref
{
ResourceID = "[CustomRegistry]V-56534-1";
 Registry = "RescheduleWaitTimeEnabled";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-56534-1";
 DesiredValue = "1";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 ModuleVersion = "1.0";
};

instance of CustomRegistry as $CustomRegistry24ref
{
ResourceID = "[CustomRegistry]V-56534-2";
 Minimum = "15";
 Registry = "RescheduleWaitTime";
 ValueType = "Dword";
 RuleStatus = "Default";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::741::2::CustomRegistry";
 RuleNumber = "V-56534-2";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xCustomRegistry";
 Path = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\Windows\\WindowsUpdate\\AU";
 ModuleVersion = "1.0";
};' WHERE NAME='V-56534'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry213ref
{
ResourceID = "[DSCRegistry]V-56539";
 ValueName = "NtfsDisable8dot3NameCreation";
 Key = "HKLM:\\SYSTEM\\CurrentControlSet\\Control\\FileSystem";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4383::9::DSCRegistry";
 RuleNumber = "V-56539";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56539'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry214ref
{
ResourceID = "[DSCRegistry]V-56542";
 ValueName = "DisableContentFileUpdates";
 Key = "HKLM:\\SOFTWARE\\Policies\\Microsoft\\SearchCompanion";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4393::9::DSCRegistry";
 RuleNumber = "V-56542";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56542'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry215ref
{
ResourceID = "[DSCRegistry]V-56543";
 ValueName = "NoPublishingWizard";
 Key = "HKLM:\\SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Policies\\Explorer";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4403::9::DSCRegistry";
 RuleNumber = "V-56543";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "1";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56543'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Secpol as $Secpol1ref
{
ResourceID = "[Secpol]V-1150";
 Manual = "False";
 Desired = "Enable";
 RuleStatus = "Scan";
 Policy = "PasswordComplexity";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4513::9::Secpol";
 RuleNumber = "V-1150";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1150'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Secpol as $Secpol2ref
{
ResourceID = "[Secpol]V-2372";
 Manual = "False";
 Desired = "Disable";
 RuleStatus = "Scan";
 Policy = "ClearTextPassword";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4520::9::Secpol";
 RuleNumber = "V-2372";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' WHERE NAME='V-2372'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Secpol as $Secpol3ref
{
ResourceID = "[Secpol]V-3337";
 Manual = "False";
 RuleStatus = "Default";
 Policy = "SIDTranslation";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4527::9::Secpol";
 RuleNumber = "V-3337";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xSecpol";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3337'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCRegistry as $DSCRegistry217ref
{
ResourceID = "[DSCRegistry]V-3372";
 ValueName = "UndockWithoutLogon";
 Key = "HKLM:\\Software\\Microsoft\\Windows\\CurrentVersion\\Policies\\System";
 Ensure = "Present";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4543::8::DSCRegistry";
 RuleNumber = "V-3372";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ValueType = "Dword";
 ModuleName = "xDSCRegistry";
 ValueData = "0";
 ModuleVersion = "1.0";

};' WHERE NAME='V-3372';

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol64ref
{
ResourceID = "[AuditPol]V-57633";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4554::8::AuditPol";
 RuleNumber = "V-57633";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Success";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-57633'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol65ref
{
ResourceID = "[AuditPol]V-57635";
 RuleStatus = "Default";
 AuditPolicy = "Authorization Policy Change";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::4562::8::AuditPol";
 RuleNumber = "V-57635";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "Failure";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";

};' WHERE NAME='V-57635'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCService as $DSCService2ref
{
ResourceID = "[DSCService]V-56511";
 RuleStatus = "Default";
 State = "Running";
 RuleNumber = "V-56511";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3023::6::DSCService";
 Name = "WerSvc";
 StartupType = "Automatic";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";

};' WHERE NAME='V-56511'  ;


UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity12ref
{
ResourceID = "[AccountSecurity]V-56375";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3876::9::AccountSecurity";
 RuleNumber = "V-56375";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "LastLoginTime";
 ModuleVersion = "1.1";

};' WHERE NAME='V-56375'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AccountSecurity as $AccountSecurity14ref
{
ResourceID = "[AccountSecurity]V-1115";
 Manual = "False";
 RuleStatus = "Default";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2945::9::AccountSecurity";
 RuleNumber = "V-1115";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "NotAdmin";
 ModuleName = "xAccountSecurity";
 AccountPolicy = "RenameAdministrator";
 ModuleVersion = "1.1";

};' WHERE NAME='V-1115'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of SystemCheck as $SystemCheck13ref
{
ResourceID = "[SystemCheck]V-1073";
 Manual = "False";
 RuleNumber = "V-1073";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 RuleStatus = "Default";
 Desired = "7601";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "BuildNumber";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1073'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of SystemCheck as $SystemCheck14ref
{
ResourceID = "[SystemCheck]V-1081";
 Manual = "False";
 RuleNumber = "V-1081";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 RuleStatus = "Default";
 Desired = "true";
 SourceInfo = "C:\\\\Users\\\\Administrator\\\\All-rules-testing-profiles.ps1::3835::9::SystemCheck";
 Category = "NTFS";
 ModuleName = "xSystemCheck";
 ModuleVersion = "1.0";

};' WHERE NAME='V-1081'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of DSCService as $DSCService10ref
{
ResourceID = "[DSCService]V-26604";
 RuleStatus = "Default";
 RuleNumber = "V-26604";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::3015::6::DSCService";
 Name = "p2pimsvc";
 State = "Stopped";
 StartupType = "Disabled";
 ModuleName = "xDSCService";
 ModuleVersion = "1.0";
};' WHERE NAME='V-26604'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of AuditPol as $AuditPol66ref
{
ResourceID = "[AuditPol]V-36667";
 RuleStatus = "Default";
 AuditPolicy = "Removable storage";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2633::9::AuditPol";
 RuleNumber = "V-36667";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 Desired = "No Auditing";
 ModuleName = "xAuditPol";
 ModuleVersion = "1.1";
};' WHERE NAME='V-36667'  ;

UPDATE "CPE_RULE_HEADER" SET RULE_CONFIG='instance of Privilege as $Privilege40ref
{
ResourceID = "[Privilege]V-56540";
 RuleStatus = "Default";
 ModuleVersion = "1.0";
 SourceInfo = "C:\\Users\\Administrator\\All-rules-testing-profiles.ps1::2272::9::Privilege";
 RuleNumber = "V-56540";
 Severity = "'||CRITICALITY_ID||'";
 RuleId = "'||id||'";
 ModuleName = "xPrivilege";
 Privilege = "SeSyncAgentPrivilege";
 Operation = "Remove All";
};' WHERE NAME='V-56540'  ;


