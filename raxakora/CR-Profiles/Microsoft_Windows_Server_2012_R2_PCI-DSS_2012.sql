select add_profile_data ('Microsoft Windows Server 2012 R2 PCI-DSS_2012' ,'Profile Customized by CloudRaxak' ,'Windows-based OS','' ,'2015-06-16' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-56300','SV-50462r1_rule','default','high','
                  System must not configure to Audit Kerberos Authentication
             ','
                     This rule verifies that the system will be configured to audit "Kerberos Authentication" No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set Not to Audit for "Kerberos Authentication Service" auditpol /set /subcategory:"Kerberos Authentication Service" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security settings -> Advance Audit Policy Configuration -> Audit Policies -> System Audit Policies- Local Group Policy Object -> Account Logon -> "Audit Kerberos Authentication Services" with "No Auditing".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:
auditpol /get /subcategory:"Kerberos Authentication Service"

Category/Subcategory                 Setting
Account Logon
Kerberos Authentication Service      No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56301','SV-50462r1_rule','default','high','
                  System must not configure to Audit Kerberos Service Ticket Operations
             ','
                     This rule verifies that the system will be configured to audit "Kerberos Service Ticket Operations" No Auditing.
             ','F-56000','
   Open a Command Prompt with elevated privileges ("Run as Administrator") to set Not to Audit for "Kerberos Service Ticket Operations" auditpol /set /subcategory:"Kerberos service ticket Operations" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Kerberos Service Ticket Operations" with "No Auditing.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:
auditpol /get /subcategory:"Kerberos service ticket Operations"

Category/Subcategory                      Setting
Account Logon
Kerberos Service Ticket Operations      No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56302','SV-50462r1_rule','default','high','
  System must not configure to Audit Other Account Logon Events. ','
                     This rule verifies that the system will be configured to audit "Other Account Logon Events" No Auditing.
             ','F-56000','
  Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not Audit the "Other Account Logon Events" auditpol /Set /Subcategory:"Other Account Logon Events" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Other Account logon Events " with "No Auditing".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

auditpol /get /Subcategory:"Other Policy Change Events"

System audit policy
Category/Subcategory                      Setting
Account Logon
Other Account Logon Events            No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56303','SV-50462r1_rule','default','high','
  System must not configure to Audit Application Group Management
             ','
                     This rule verifies that the system will be configured to audit "Application Group Management" No Auditing.
             ','F-56000','
  Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Audit Application Group Management" policy auditpol /set /Subcategory:"Application Group Management" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Application Group Management " with "No Auditing".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").
Enter below Command to get the status:

Auditpol /get /Subcategory:"Application Group Management"

System audit policy
Category/Subcategory                      Setting
Account Management
Application Group Management           No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56304','SV-50462r1_rule','default','high','
  The system must be configured to audit Account Management - "Distribution Group Management" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "Distribution Group Management" to No Auditing.
             ','F-56000','
  Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Audit Distribution Group Management" policy auditpol /set /Subcategory:"Distribution Group Management" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Distribution Group Management" with No Auditing".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Distribution Group Management"

System audit policy
Category/Subcategory                      Setting
Account Management
Distribution Group Management           No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56305','SV-50462r1_rule','default','high','
  The system must be configured to audit Detailed Tracking - "DPAPI Activity" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "DPAPI Activity" to No Auditing.
             ','F-56000','
   Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "DPAPI Activity" policy auditpol /set /Subcategory:"DPAPI Activity" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Detailed Tracking -> "Audit DPAPI Activity" with No Auditing.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
    Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"DPAPI Activity"

System audit policy
Category/Subcategory                      Setting
Detailed Tracking
DPAPI Activity                            No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56306','SV-50462r1_rule','default','high','
  Configure to audit Detailed Tracking - "Process Termination" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "Process Termination" to No Auditing.
             ','F-56000','
  Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Process Termination" policy auditpol /set /Subcategory:"Process Termination" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Detailed Tracking -> "Audit Process Termination" with No Auditing.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Process Termination"

System audit policy
Category/Subcategory                      Setting
Detailed Tracking
Process Termination                            No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56307','SV-50462r1_rule','default','high','
  The system must be configured to audit Detailed Tracking - "RPC Events" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "RPC Events" to No Auditing.
             ','F-56000','
  Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "RPC Events" policy auditpol /set /Subcategory:"RPC Events" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Detailed Tracking -> "Audit RPC Events" with No Auditing.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"RPC Events"

System audit policy
Category/Subcategory                      Setting
Detailed Tracking
RPC Events                            No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56308','SV-50462r1_rule','default','high','
  System must not configure to Audit Account Lockout
             ','
                     This rule verifies that the system will be configured to audit "Account Lockout" to No Auditing.
             ','F-56000','
   Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to audit "Account Lockout" policy auditpol /set /Subcategory:"Account Lockout" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration ->Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> Set Account lockout threshold for invalid Login attempts to "No Auditing".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled", for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

auditpol /get /Subcategory:"Account Lockout"

System audit policy

Category/Subcategory                      Setting
Logon/Logoff
Account Lockout                         No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56309','SV-50462r1_rule','default','high','
  The system must be configured to audit Logon/Logoff - "IPsec Extended Mode" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "IPsec Extended Mode" to No Auditing.
             ','F-56000','
  Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "IPsec Extended Mode" policy auditpol /set /Subcategory:"IPsec Extended Mode" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Logon/Logoff -> "Audit IPsec Extended Mode" with No Auditing.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"IPsec Extended Mode"

System audit policy
Category/Subcategory                      Setting
Logon/Logoff
IPsec Extended Mode                            No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56310','SV-50462r1_rule','default','high','
  The system must be configured to audit Logon/Logoff - "IPsec Main Mode" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "IPsec Main Mode" to No Auditing.
             ','F-56000','
  Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "IPsec Main Mode" policy auditpol /set /Subcategory:"IPsec Main Mode" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Logon/Logoff -> "Audit IPsec Main Mode" with No Auditing.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"IPsec Main Mode"

System audit policy
Category/Subcategory                      Setting
Logon/Logoff
IPsec Main Mode                            No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56311','SV-50462r1_rule','default','high','
  The system must be configured to audit Logon/Logoff - "IPsec Quick Mode" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "IPsec Quick Mode" to No Auditing.
             ','F-56000','
  Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "IPsec Quick Mode" policy auditpol /set /Subcategory:"IPsec Quick Mode" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Logon/Logoff -> "Audit IPsec Quick Mode" with No Auditing.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
   Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"IPsec Quick Mode"

System audit policy
Category/Subcategory                      Setting
Logon/Logoff
IPsec Quick Mode                           No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56312','SV-50462r1_rule','default','high','
                   The system must be configured to audit Logon/Logoff - "Network Policy Server" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "Network Policy Server" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Network Policy Server" policy auditpol /set /Subcategory:"Network Policy Server" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Logon/Logoff -> "Audit Network Policy Server" with No Auditing.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Network Policy Server"

System audit policy
Category/Subcategory                      Setting
Logon/Logoff
Network Policy Server                           No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56313','SV-50462r1_rule','default','high','
                   System must not configure to audit "Other Logon/Logoff Events"
             ','
                     This rule verifies that the system will be configured to audit "Other Logon/Logoff Events" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to audit "Other Logon/Logoff Events" auditpol /set /Subcategory:"Other Logon/Logoff Events" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> Logon/Logoff -> Audit Other Logon/Logoff Events properties to "No Audit".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled", for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

auditpol /get /Subcategory:"Other Logon/Logoff Events"
System audit policy

Category/Subcategory                      Setting
Logon/Logoff
Other Logon/Logoff Events               No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56314','SV-50462r1_rule','default','high','
                   The system must be configured to audit Object Access - "Application Generated" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "Application Generated" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Application Generated" policy auditpol /set /Subcategory:"Application Generated" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Object Access -> "Audit Application Generated" with No Auditing.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Application Generated"

System audit policy
Category/Subcategory                      Setting
Object Access
Application Generated                     No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56315','SV-50462r1_rule','default','high','
                   The system must be configured to audit Object Access - "Central Access Policy Staging" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "Central Access Policy Staging" to No Auditing.
             ','F-56000','
                    Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Central Access Policy Staging" policy auditpol /set /Subcategory:"Central Access Policy Staging" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Object Access -> "Audit Central Access Policy Staging" with No Auditing.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Central Access Policy Staging"

System audit policy
Category/Subcategory                      Setting
Object Access
Central Access Policy Staging                           No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56316','SV-50462r1_rule','default','high','
                   System must not be configured to audit "Certification Services"
             ','
                     This rule verifies that the system will be configured to audit "Certification Services" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Certification Services" policy auditpol /set /Subcategory:"Certification Services" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" computer Configuration-> Windows Settings -> Security settings -> Advance Audit Policy Configuration -> Audit Policies -> System Audit Policies- Local Group Policy Object -> Object Access -> Audit Certification Services
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Certification Services"

System audit policy
Category/Subcategory                      Setting
Object Access
Certification Services                           No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56317','SV-50462r1_rule','default','high','
                   The system must be configured to audit  "Detailed File Share" to "No Auditing."
             ','
                     This rule verifies that the system will be configured to audit "Detailed File Share" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Detailed File Share" policy auditpol /set /Subcategory:"Detailed File Share" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Object Access -> "Detailed File Share" with "No Auditing".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Detailed File Share"

System audit policy
Category/Subcategory                      Setting
Object Access
Detailed File Share                       No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56318','SV-50462r1_rule','default','high','
                   The system must be configured to audit  "File Share" to "No Auditing"
             ','
                     This rule verifies that the system will be configured to audit "File Share" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "File share" policy auditpol /set /Subcategory:"File share" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Object Access -> "File share" with "No Auditing".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"File share"

System audit policy
Category/Subcategory                      Setting
Object Access
File share                           No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56319','SV-50462r1_rule','default','high','
                  The system must be configured to audit Object Access - File System failures.
             ','
                     This rule verifies that the system will be configured to audit "File System" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "File System" policy auditpol /set /Subcategory:"File System" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Object Access -> "Audit File System" with "Failure" selected.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"File System"

System audit policy
Category/Subcategory                      Setting
Object Access
File System                           No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56320','SV-50462r1_rule','default','high','
                   System must not be configured to audit Filtering Platform Connection events.
             ','
                     This rule verifies that the system will be configured to audit "Filtering Platform Connection" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Filtering Platform Connection" policy auditpol /set /Subcategory:"Filtering Platform Connection" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies – Local group Policy Object -> Object Access -> Audit Filtering Platform Connection
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Filtering Platform Connection"

System audit policy
Category/Subcategory                      Setting
Object Access
Filtering Platform Connection                          No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56321','SV-50462r1_rule','default','high','
                   The system must be configured to audit Object Access - Filtering Platform Packet Drop failures.
             ','
                     This rule verifies that the system will be configured to audit "Filtering Platform Packet Drop" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Filtering Platform Packet Drop" policy auditpol /set /Subcategory:"Filtering Platform Packet Drop" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Object Access -> "Filtering Platform Packet Drop" with "Failure" selected.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Filtering Platform Packet Drop"

System audit policy
Category/Subcategory                      Setting
Object Access
Filtering Platform Packet Drop                          No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56322','SV-50462r1_rule','default','high','
                   system must not configure to audit "Handle Manipulation" to No Auditing.
             ','
                     This rule verifies that the system will be configured to audit "Handle Manipulation" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to audit "Handle Manipulation" auditpol /set /Subcategory:"Handle Manipulation" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Object Access -> "Handle Manipulation" with "Failure" selected.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled", for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Handle Manipulation"

System audit policy
Category/Subcategory                      Setting
Object Access
Handle Manipulation                          No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56323','SV-50462r1_rule','default','high','
                   System must not be configured to audit "Other Object Access Events"
             ','
                     This rule verifies that the system will be configured to audit "Other Object Access Events" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Other Object Access Events" policy auditpol /set /Subcategory:"Other Object Access Events" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Confiiguration -> System Audit Policy – Local Group Policy -> Object Access -> Audit other Object Access Events
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Other Object Access Events"

System audit policy
Category/Subcategory                      Setting
Object Access
Other Object Access Events                          No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56324','SV-50462r1_rule','default','high','
                   System must not be configured to audit "Registry"
             ','
                     This rule verifies that the system will be configured to audit "Registry" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Registry" policy auditpol /set /Subcategory:"Registry" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> Audit Policies – Local group Policy Object -> Object Access -> Audit Registry.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Registry"

System audit policy
Category/Subcategory                      Setting
Object Access
Registry                                  No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56325','SV-50462r1_rule','default','high','
                   System must not be configured to audit "SAM"
             ','
                     This rule verifies that the system will be configured to audit "SAM" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "SAM" policy auditpol /set /Subcategory:"SAM" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration-> Audit Policies – Local group Policy Object -> Object Access -> Audit SAM ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"SAM"

System audit policy
Category/Subcategory                      Setting
Object Access
SAM                                       No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56326','SV-50462r1_rule','default','high','
                   System must not be configured to audit "Filtering Platform Policy Change"
             ','
                     This rule verifies that the system will be configured to audit "Filtering Platform Policy Change" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Filtering Platform Policy Change" policy auditpol /set /Subcategory:"Filtering Platform Policy Change" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Policy Change -> "Audit Filtering Platform Policy Change " with "success and Failure".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Filtering Platform Policy Change"

System audit policy
Category/Subcategory                      Setting
Policy Change
Filtering Platform Policy Change           No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56327','SV-50462r1_rule','default','high','
                   System must not be configured to audit "MPSSVC Rule-Level Policy Change"
             ','
                     This rule verifies that the system will be configured to audit "MPSSVC Rule-Level Policy Change" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "MPSSVC Rule-Level Policy Change" policy auditpol /set /Subcategory:"MPSSVC Rule-Level Policy Change" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> Audit Policies – Local group Policy Object -> Policy Change -> Audit MPSSVC Rule-level Policy Change.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"MPSSVC Rule-Level Policy Change"

System audit policy
Category/Subcategory                      Setting
Policy Change
MPSSVC Rule-Level Policy Change           No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56328','SV-50462r1_rule','default','high','
                   System must not be configured to audit "Other Policy Change Events"
             ','
                     This rule verifies that the system will be configured to audit "Other Policy Change Events" to No Auditing.
             ','F-56000','
                    Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Other Policy Change Events" policy auditpol /set /Subcategory:"Other Policy Change Events" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies ->Policy Change -> "Audit Other Policy Change Events" with "success and Failure".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Other Policy Change Events"

System audit policy
Category/Subcategory                      Setting
Policy Change
Other Policy Change Events                No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56329','SV-50462r1_rule','default','high','
                   The system must be configured to audit Privilege Use: Non Sensitive Privilege Use failures.
             ','
                     This rule verifies that the system will be configured to audit "Non Sensitive Privilege Use" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Non Sensitive Privilege Use" policy auditpol /set /Subcategory:"Non Sensitive Privilege Use" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Privilege Use -> "Non Sensitive Privilege Use" with "Failure" selected
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Non Sensitive Privilege Use"

System audit policy
Category/Subcategory                      Setting
Privilege Use
Non Sensitive Privilege Use               No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56331','SV-50462r1_rule','default','high','
                   System must not configure to audit "Other System Events".
             ','
                     This rule verifies that the system will be configured to audit "Other System Events" to No Auditing.
             ','F-56000','
                     Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to audit "Other System Events" auditpol /set /Subcategory:"Other System Events" /Success:Disable /Failure:Disable For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Other System Events" to "No Auditing".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled", for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

auditpol /get /Subcategory:"Other System Events"

System audit policy
Category/Subcategory                      Setting
Privilege Use
Other System Events               No Auditing

If auditPol result is not matched with required value then this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56332','SV-50462r1_rule','default','high','
                  The Windows Firewall must block unicast responses to multicast or broadcast messages for the Domain Profile.
             ','
                     The firewall included with Windows 2012 allows for more precise control of its configuration. To control these settings, within the Windows This profile applies when a computer is connected to a network and authenticates to a domain controller in the domain to which the computer belongs. This option is useful if you need to control whether this computer receives unicast responses to its outgoing multicast or broadcast messages. If you enable this rule setting and this computer sends multicast or broadcast messages to other computers, Windows Firewall with Advanced Security waits as long as three seconds for unicast responses from the other computers and then blocks all later responses. If you disable this rule setting and this computer sends a multicast or broadcast message to other computers, Windows Firewall with Advanced Security blocks the unicast responses sent by those other computers. The default setting is No.
             ','F-56000','
                     Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: DisableUnicastResponsesToMulticastBroadcast 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Unicast response, "Allow unicast response" to "No"' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE

Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: DisableUnicastResponsesToMulticastBroadcast

Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56333','SV-50462r1_rule','default','high','
                   The Windows Firewall local connection rules must not be merged with Group Policy settings for the Domain Profile.
             ','
                     This rule setting controls whether local administrators are allowed to create connection security rules that apply together with connection security rules configured by Group Policy. The default setting is Yes.
             ','F-56000','
                     Add the registry or update the value as follows:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: AllowLocalIPsecPolicyMerge 
Type: REG_DWORD 
Value: 1

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force 

Alternative method though goup policy: 
Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local connection security rules:" to "Yes(Default)"' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: AllowLocalIPsecPolicyMerge

Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56334','SV-50462r1_rule','default','high','
                   The Windows Firewall local firewall rules must not be merged with Group Policy settings for the Domain Profile.
             ','
                     This rule setting controls whether local administrators are allowed to create local firewall rules that apply together with firewall rules configured by Group Policy. The default setting is Yes.
             ','F-56000','
                    Add the registry or update the value as follows:
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: AllowLocalPolicyMerge 
Type: REG_DWORD 
Value: 1

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy:

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local Firewall rules:" to "Yes".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: AllowLocalPolicyMerge

Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56335','SV-50462r1_rule','default','high','
                   The Windows Firewall must display notifications when a program is blocked from receiving an inbound connection for the Domain Profile.
             ','
                     This profile applies when a computer is connected to a network and authenticates to a domain controller in the domain to which the computer belongs. Select this option to have Windows Firewall with Advanced Security display notifications to the user when a program is blocked from receiving inbound connections. The default setting is Yes (default).
             ','F-56000','
                     Add the registry or update the value as follows: 

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: DisableNotifications 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes (default)".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: DisableNotifications

Type: REG_DWORD
Value: 0
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56336','SV-50462r1_rule','default','high','
                   The Windows Firewall must be enabled for the Domain Profile.
             ','
                     This profile applies when a computer is connected to a network and authenticates to a domain controller in the domain to which the computer belongs. Select On to have Windows Firewall with Advanced Security use the settings for this profile to filter network traffic. If you select Off, Windows Firewall with Advanced Security will not use any of the firewall rules or connection security rules for this profile. The default setting is Enabled.
             ','F-56000','
                     Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: EnableFirewall 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Firewall state" to "On (recommended)".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: EnableFirewall

Type: REG_DWORD
Value: 1                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56337','SV-50462r1_rule','default','high','
                   The Windows Firewall must block unsolicited inbound connections for the Domain Profile.
             ','
                     This profile applies when a computer is connected to a network and authenticates to a domain controller in the domain to which the computer belongs. This rule setting determines the behavior for inbound connections that do not match an inbound firewall rule. The default setting is Block (default).
             ','F-56000','
                     Add the registry or update the value as follows:
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: DefaultInboundAction 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Inbound connections" to "Block (default)"             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: DefaultInboundAction

Type: REG_DWORD
Value: 1                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56338','SV-50462r1_rule','default','high','
                   The Windows Firewall must allow outbound connections, unless a rule explicitly blocks the connection for the Domain Profile.
             ','
                     This rule setting determines the behavior for outbound connections that do not match an outbound firewall rule. In Windows Vista, the default behavior is to allow connections unless there are firewall rules that block the connection. The default setting is Allow.
             ','F-56000','
                    Add the registry or update the value as follows:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: DefaultOutboundAction 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Outbound connections" to "Allow (default)" ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: DefaultOutboundAction

Type: REG_DWORD
Value: 0             ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56339','SV-50462r1_rule','default','high','
                   The Windows Firewall must block unicast responses to multicast or broadcast messages for the Private Profile.
             ','
                     This profile only applies if a user with local administrator privileges assigns it to a network that was previously set to use the Public profile. Microsoft recommends only changing the profile to Private for a trusted network. This option is useful if you need to control whether this computer receives unicast responses to its outgoing multicast or broadcast messages. If you enable this rule setting and this computer sends multicast or broadcast messages to other computers, Windows Firewall with Advanced Security waits as long as three seconds for unicast responses from the other computers and then blocks all later responses. If you disable this rule setting and this computer sends a multicast or broadcast message to other computers, Windows Firewall with Advanced Security blocks the unicast responses sent by those other computers. The default setting is No.
             ','F-56000','
                    Add the registry or update the value as follows:
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\
Value Name: DisableUnicastResponsesToMulticastBroadcast 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy:

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Unicast response, "Allow unicast response" to "No".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: DisableUnicastResponsesToMulticastBroadcast

Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56340','SV-50462r1_rule','default','high','
                   The Windows Firewall local connection rules must not be merged with Group Policy settings for the Private Profile.
             ','
                     This setting only controls whether local administrators are allowed to create connection security rules that apply together with connection security rules configured by Group Policy. The default setting is Yes (Default).
             ','F-56000','
                     Add the registry or update the value as follows:
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: AllowLocalIPsecPolicyMerge 
Type: REG_DWORD 
Value: 1

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local connection security rules:" to "Yes(Default)".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: AllowLocalIPsecPolicyMerge

Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56341','SV-50462r1_rule','default','high','
                   The Windows Firewall local firewall rules must not be merged with Group Policy settings for the Private Profile.
             ','
                     This setting controls whether local administrators are allowed to create local firewall rules that apply together with firewall rules configured by Group Policy. The default setting is Yes (Default).
             ','F-56000','
                     Add the registry or update the value as follows:
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: AllowLocalPolicyMerge 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local firewall rules:" to "Yes"(Default).
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: AllowLocalPolicyMerge

Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56342','SV-50462r1_rule','default','high','
                   The Windows Firewall must display notifications when a program is blocked from receiving an inbound connection for the Private Profile
             ','
                     This profile only applies if a user with local administrator privileges assigns it to a network that was previously set to use the Public profile. Microsoft recommends only changing the profile to Private for a trusted network. Select this option to have Windows Firewall with Advanced Security display notifications to the user when a program is blocked from receiving inbound connections. The default setting is Yes (Default).
             ','F-56000','
                     Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: DisableNotifications 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes (default)" ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: DisableNotifications

Type: REG_DWORD 
Value: 0
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56343','SV-50462r1_rule','default','high','
                   The Windows Firewall must be enabled for the Private Profile
             ','
                     This profile only applies if a user with local administrator privileges assigns it to a network that was previously set to use the Public profile. Microsoft recommends only changing the profile to Private for a trusted network. Select On to have Windows Firewall with Advanced Security use the settings for this profile to filter network traffic. If you select Off, Windows Firewall with Advanced Security will not use any of the firewall rules or connection security rules for this profile. The default setting is On (Recommended).
             ','F-56000','
                     Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: EnableFirewall 
Type: REG_DWORD 
Value: 1 If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> State, "Firewall state" to "On (recommended)"
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: EnableFirewall

Type: REG_DWORD
Value: 1                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56344','SV-50462r1_rule','default','high','
                   The Windows Firewall must block unsolicited inbound connections for the Private Profile.
             ','
                     This profile only applies if a user with local administrator privileges assigns it to a network that was previously set to use the Public profile. Microsoft recommends only changing the profile to Private for a trusted network. This rule setting determines the behavior for inbound connections that do not match an inbound firewall rule. The default setting is Block (Default).
             ','F-56000','
                     Add the registry or update the value as follow: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: DefaultInboundAction 
Type: REG_DWORD 
Value: 1 
If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Private Profile Tab -> State, "Inbound connections" to "Block (default)".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: DefaultInboundAction

Type: REG_DWORD
Value: 1
                    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56345','SV-50462r1_rule','default','high','
                   The Windows Firewall must allow outbound connections, unless a rule explicitly blocks the connection for the Private Profile.
             ','
                     This rule setting determines the behavior for outbound connections that do not match an outbound firewall rule. The default behavior is to allow connections unless there are firewall rules that block the connection. The default setting is Allow.
             ','F-56000','
                     Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: DefaultOutboundAction 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Private Profile Tab -> State, "Outbound connections" to "Allow (default)".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: DefaultOutboundAction

Type: REG_DWORD
Value: 0
                    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56346','SV-50462r1_rule','default','high','
                   The Windows Firewall must block unicast responses to multicast or broadcast messages for the Public Profile.
             ','
                     This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. This option is useful if you need to control whether this computer receives unicast responses to its outgoing multicast or broadcast messages. If you enable this rule setting and this computer sends multicast or broadcast messages to other computers, Windows Firewall with Advanced Security waits as long as three seconds for unicast responses from the other computers and then blocks all later responses. If you disable this rule setting and this computer sends a multicast or broadcast message to other computers, Windows Firewall with Advanced Security blocks the unicast responses sent by those other computers. The default setting is No.
             ','F-56000','
                     Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: DisableUnicastResponsesToMulticastBroadcast 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> Settings (select Customize) -> Unicast response, "Allow unicast response" to "No" ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: DisableUnicastResponsesToMulticastBroadcast

Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56347','SV-50462r1_rule','default','high','
                   The Windows Firewall local connection rules must not be merged with Group Policy settings for the Public Profile
             ','
                     This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. This rule setting controls whether local administrators are allowed to create connection security rules that apply together with connection security rules configured by Group Policy. If you configure this rule setting to No, administrators can still create firewall rules, but the rules will not be applied. The default setting is No.
             ','F-56000','
                    Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: AllowLocalIPsecPolicyMerge 
Type: REG_DWORD 
Value: 0

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force"

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local connection security rules:" to "No".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: AllowLocalIPsecPolicyMerge

Type: REG_DWORD
Value: 0
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56348','SV-50462r1_rule','default','high','
                   The Windows Firewall local firewall rules must not be merged with Group Policy settings for the Public Profile
             ','
                     This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. This rule setting controls whether local administrators are allowed to create local firewall rules that apply together with firewall rules configured by Group Policy. If you configure this rule setting to No, administrators can still create firewall rules, but the rules will not be applied. The default setting is No.
             ','F-56000','
                    Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: AllowLocalPolicyMerge 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local firewall rules:" to "No".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: AllowLocalPolicyMerge

Type: REG_DWORD
Value: 0                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56349','SV-50462r1_rule','default','high','
                   The Windows Firewall must display notifications when a program is blocked from receiving an inbound connection for the Public Profile
             ','
                     This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. Select this option to have Windows Firewall with Advanced Security display notifications to the user when a program is blocked from receiving inbound connections. The default setting is No.
             ','F-56000','
                    Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: DisableNotifications 
Type: REG_DWORD 
Value: 1

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: DisableNotifications

Type: REG_DWORD 
Value: 1 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56350','SV-50462r1_rule','default','high','
                  The Windows Firewall must be enabled for the Public Profile 
             ','
                     This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. Select On to have Windows Firewall with Advanced Security use the settings for this profile to filter network traffic. If you select Off, Windows Firewall with Advanced Security will not use any of the firewall rules or connection security rules for this profile. The default setting is On (Recommended).
             ','F-56000','
                     Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: EnableFirewall 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> State,"Firewall state" to ON.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: EnableFirewall

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56351','SV-50462r1_rule','default','high','
                   The Windows Firewall must block unsolicited inbound connections for the Public Profile.
             ','
                     This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. This rule setting determines the behavior for inbound connections that do not match an inbound firewall rule. The default setting is Block (Default).
             ','F-56000','
                     Add the registry or update the value as follow: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: DefaultInboundAction Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> State, "Inbound connections" to "Block (default)".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: DefaultInboundAction

Type: REG_DWORD
Value: 1 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56352','SV-50462r1_rule','default','high','
                   The Windows Firewall must allow outbound connections, unless a rule explicitly blocks the connection for the Public Profile.
             ','
                     This profile setting determines the behavior for outbound connections that do not match an outbound firewall rule. The default behavior is to allow connections unless there are firewall rules that block the connection. The default setting is Allow.
             ','F-56000','
                     Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: DefaultOutboundAction 
Type: REG_DWORD 
Value: 0 
If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Alternative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> State, "Outbound connections" to "Allow (default)".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: DefaultOutboundAction

Type: REG_DWORD
Value: 0 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56359','SV-50462r1_rule','default','high','
                   Windows Event Log Service must be Running and Startup must be set to "Automatic"
              ','
                     This rule verifies that Windows Event Log service is running and its startup type is set to "Automatic".
             ','F-56000','
                     Open Services Microsoft Management Console (MMC) snap-in and then right-click on "Windows Event Log" to Start and configure the Service Startup mode.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          Open Services Microsoft Management Console (MMC) snap-in and select "Windows Event Log" to check the status of Service.
                           
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56360','SV-50462r1_rule','default','high','
                   Verify time configuration - AnnounceFlags
             ','
                     This rule verifies that AnnounceFlags is set to 5.
             ','F-56000','
                     Add the registry or update the value as follows:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\W32Time\Config

Value Name: AnnounceFlags

Value Type: REG_DWORD 

Value: 5             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\W32Time\Config

Value Name: AnnounceFlags

Value Type: REG_DWORD 

Value: 5 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56361','SV-50462r1_rule','default','high','
                   Verify time configuration - Server type NTP
             ','
                     This rule verifies that server type is set to NTP.
             ','F-56000','
                    To change server type to Ntp add bellow registry


Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\Parameters

Value Name: Type

Value Type: REG_SZ 
Value: NTP             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\Parameters

Value Name: Type

Value Type: REG_SZ 
Value: NTP
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56362','SV-50462r1_rule','default','high','
                   Verify time configuration - Enable NTPServer
             ','
                     This rule verifies that NTPServer is enabled.
             ','F-56000','
Configure the following registry value:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer

Value Name: Enabled

Value Type: REG_DWORD 
Value: 1
                                  ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer

Value Name: Enabled

Value Type: REG_DWORD 
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56363','SV-50462r1_rule','default','high','
                   Verify time configuration - poll interval
             ','
                     This rule verifies that poll interval is set to 900 seconds.
             ','F-56000','
                     Configure the following registry value:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient

Value Name: SpecialPollInterval

Value Type: REG_DWORD Value: 900(15 mins)
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient

Value Name: SpecialPollInterval

Value Type: REG_DWORD Value: 900(15 mins)
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56364','SV-50462r1_rule','default','high','
                   Application Event Log must be configured to retained old events when the log file reaches its maximum size.
             ','
                     This rule setting controls Event Log behavior when the log file reaches its maximum size. Old events may or may not be retained according to the “Backup log automatically when full�? policy setting. The default setting for this rule is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Application 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 

Alternative method : 

"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> Control Event Log behavior when the log file reaches its maximum size" to Enabled "Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> Back up log automatically when full" to Enabled.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding: 


Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Application

Value Name: AutoBackupLogFiles
Value Name: Retention

Type: REG_SZ
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56365','SV-50462r1_rule','default','high','
                  A system must be logged on to before removing from a docking station.
             ','
                     This rule verifies whether a portable computer can be undocked if the user does not log on to the system. Enable this policy setting to eliminate a Logon requirement and allow use of an external hardware eject button to undock the computer. The default setting is Enabled.
             ','F-56000','
                    Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System 
Value Name: UndockWithoutLogon 
Value Type: REG_DWORD 
Value: 1 

Alternative method:

Configure the policy value

Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> “Devices: Allow Undock Without Having to Log On�? to "Enable". 
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding. 

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System

Value Name: UndockWithoutLogon

Value Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56366','SV-50462r1_rule','default','high','
                   Restrict CD-ROM access to locally logged-on user only
             ','
                     This rule verifies determines whether a CD-ROM is accessible to both local and remote users simultaneously. If you enable this policy setting, only the interactively logged-on user is allowed to access removable CD-ROM media. The default setting is Disabled.
             ','F-56000','
                     If the following registry value does not exist or is not configured as specified, this is a finding:

Registry path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
Value Name: AllocateCDRoms
Value Type: String
Value: 1. 
Alternative method : Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> Devices: Restrict CD-ROM access to locally logged-on user only to "Enabled".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
Value Name: AllocateCDRoms
Value Type: String
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56367','SV-50462r1_rule','default','high','
                  Restrict floppy access to locally logged-on user only
             ','
                     This rule verifies whether removable floppy media are accessible to both local and remote users simultaneously. If you enable this policy setting, only the interactively logged-on user is allowed to access removable floppy media. The default setting is Disabled.
             ','F-56000','
                    Configure Below registry value:

Registry path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
Value Name: AllocateFloppies
Value Type: String
Value: 1. 
.  Alternative method : Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> Devices: Restrict floppy access to locally logged-on user only to "Enabled".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          If the following registry value does not exist or is not configured as specified, this is a finding:

Registry path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon
Value Name: AllocateFloppies
Value Type: String
Value: 1 
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56369','SV-50462r1_rule','default','high','
                   Domain Controller authentication is required to unlock the workstation.
             ','
                     For domain accounts, this rule setting determines whether a domain controller must be contacted to unlock a computer. This rule setting addresses a potential vulnerability that is similar to one for the Interactive logon: Number of previous logons to cache (in case domain controller is not available) setting. A user could disconnect the network cable of the server, unlock the server with an old password, and unlock the server without authentication. The default setting for this rule is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ 
Value Name: ForceUnlockLogon 
Value Type: REG_DWORD 
Value: 1 

Alternative method : 

Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Require domain controller authentication to unlock workstation" to "Enabled". 
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding. 

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: ForceUnlockLogon

Value Type: REG_DWORD
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56370','SV-50462r1_rule','default','high','
                  Security Event Log must be configured to retained old events when the log file reaches its maximum size.
             ','
                     This rule setting controls Event Log behaviour when the log file reaches its maximum size. Old events may or may not be retained according to the “Backup log automatically when full�? policy setting. The default setting for this rule is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Security 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 

Alternative method : 

Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security-> Control Event Log behavior when the log file reaches its maximum size" to Enabled "Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security-> Back up log automatically when full" to Enabled
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding: 
Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Security

Value Name: AutoBackupLogFiles
Value Name: Retention

Type: REG_SZ
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56371','SV-50462r1_rule','default','high','
                   System must be configure to Shut down immediately when unable to log security audits
             ','
                     This rule verifies that the system will shut down if it is unable to log a security event to the Security Event log. For all profiles, the recommended state for this setting is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry Path: HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa 
Value Name: CrashOnAuditFail 
Value Type: REG_DWORD 
Value: 0 

Alternative method : 

Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> “Audit: Shut down system immediately if unable to log security audits�? to “Disabled�?.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 

Registry Path: HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa
Value Name: CrashOnAuditFail
Value Type: REG_DWORD 
Value: 0 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56372','SV-50462r1_rule','default','high','
                   System must be configure for clear virtual memory pagefile when system shutdown
             ','
                     This rule verifies whether the virtual memory page file is cleared when the computer is shut down. When this rule setting is enabled, it causes the system page file to be cleared each time that the computer shuts down gracefully. If you enable this policy setting, the hibernation file (Hiberfil.sys) is also zeroed out when hibernation is disabled on a portable computer. Server shutdowns and restarts will take longer and will be especially noticeable on servers with large page files. The default setting for this rule is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry path: HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management 
Value Name: ClearPageFileAtShutdown 
Value Type = REG_DWORD 
Value: 0 

Alternative method : 

Configure the policy value for Computer Configuration --> Windows Settings --> Security Settings --> Local Policies --> Security Options --> Shutdown: Clear Virtual Memory Pagefile to "Disabled".
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 

Registry path: HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Session Manager\Memory Management
Value Name: ClearPageFileAtShutdown
Value Type = REG_DWORD
Value: 0                           
                   ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56373','SV-50462r1_rule','default','high','
                   System Event Log must be configured to retained old events when the log file reaches its maximum size.
             ','
                     This rule setting controls Event Log behavior when the log file reaches its maximum size. Old events may or may not be retained according to the “Backup log automatically when full�? policy setting. The default setting for this rule is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\System 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 

Alternative method :

Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> Control Event Log behavior when the log file reaches its maximum size to Enabled Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> Back up log automatically when full to Enabled
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 


Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\System

Value Name: AutoBackupLogFiles
Value Name: Retention

Type: REG_SZ
Value: 1 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1075','SV-52840r1_rule','default','low','The shutdown option must not be available from the logon dialog box.','Displaying the shutdown button may allow individuals to shut down a system anonymously.  Only authenticated users should be allowed to shut down the system.  Preventing display of this button in the logon dialog box ensures that individuals who shut down the system are authorized and tracked in the system"s Security event log.','F-45766r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Shutdown: Allow system to be shutdown without having to log on" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000073','C-47157r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ShutdownWithoutLogon

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1115','SV-52857r1_rule','default','medium','The built-in administrator account must be renamed.','The built-in administrator account is a well-known account subject to attack.  Renaming this account to an unidentified name improves the protection of this account and the system.','F-45783r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Rename administrator account" to a name other than "Administrator".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000005','C-47174r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Accounts: Rename administrator account" is not set to a value other than "Administrator", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1150','SV-52863r1_rule','default','low','The built-in Microsoft password complexity filter must be enabled.','The use of complex passwords increases their strength against guessing and brute-force attacks.  This setting configures the system to verify that newly created passwords conform to the Windows password complexity policy.','F-45789r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Password must meet complexity requirements" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000008','C-47180r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for "Password must meet complexity requirements" is not set to "Enabled", this is a finding.

If the site is using a password filter that requires this setting be set to "Disabled" for the filter code to be used, this would not be considered a finding.  If this setting does not affect the use of an external password filter, it will be enabled for fall-back purposes.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1157','SV-52867r2_rule','default','medium','The Smart Card removal option must be configured to Force Logoff or Lock Workstation.','Unattended systems are susceptible to unauthorized use and must be locked.  Configuring a system to lock when a smart card is removed will ensure the system is inaccessible when unattended.','F-45793r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Smart card removal behavior" to  "Lock Workstation" or "Force Logoff".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000027','C-47184r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: SCRemoveOption

Value Type: REG_SZ
Value: 1 (Lock Workstation) or 2 (Force Logoff)

If configuring this on servers causes issues such as terminating users" remote sessions and the site has a policy in place that any other sessions on the servers such as administrative console logons, are manually locked or logged off when unattended or not in use, this would be acceptable. This must be documented with the ISSO.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1158','SV-52868r1_rule','default','low','The Recovery Console SET command must be disabled.','The Recovery Console SET command allows environment variables to be set in the Recovery Console.  This permits access to all drives and folders  and the copying of files to removable media, which could expose sensitive information.','F-45794r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Recovery console: Allow floppy copy and access to all drives and folders" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000072','C-47185r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path:
\Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\

Value Name: SetCommand

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1159','SV-52869r2_rule','default','high','The Recovery Console option must be set to prevent automatic logon to the system.','If this option is enabled, the Recovery Console does not require a password and automatically logs on to the system.  This could allow unauthorized administrative access to the system.','F-45795r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Recovery console: Allow automatic administrative logon" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000071','C-47186r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\

Value Name: SecurityLevel

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1165','SV-52873r1_rule','default','low','The computer account password must not be prevented from being reset.','Computer account passwords are changed automatically on a regular basis.  Disabling automatic password changes can make the system more vulnerable to malicious access.  Frequent password changes can be a significant safeguard for your system.  A new password for the computer account will be generated every 30 days.','F-45799r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Disable machine account password changes" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000015','C-47190r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: DisablePasswordChange

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-2372','SV-52880r1_rule','default','high','Reversible password encryption must be disabled.','Storing passwords using reversible encryption is essentially the same as storing clear-text versions of the passwords.  For this reason, this policy must never be enabled.','F-45806r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Store password using reversible encryption" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000009','C-47197r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for "Store password using reversible encryption" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-2374','SV-52879r2_rule','default','high','Autoplay must be disabled for all drives.','Allowing Autoplay to execute may introduce malicious code to a system.  Autoplay begins reading from a drive as soon media is inserted into the drive.  As a result, the setup file of programs or music on audio media may start.  By default, Autoplay is disabled on removable drives, such as the floppy disk drive (but not the CD-ROM drive) and on network drives.  Enabling this policy disables Autoplay on all drives.','F-45805r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Turn off AutoPlay" to "Enabled:All Drives".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-CC-000074','C-47196r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\

Value Name: NoDriveTypeAutoRun

Type: REG_DWORD
Value: 0x000000ff (255)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3479','SV-52920r1_rule','default','medium','The system must be configured to use Safe DLL Search Mode.','The default search behavior, when an application calls a function in a Dynamic Link Library (DLL), is to search the current directory, followed by the directories contained in the system"s path environment variable.  An unauthorized DLL, inserted into an application"s working directory, could allow malicious code to be run on the system.  Setting this policy value forces the system to search the %Systemroot% for the DLL before searching the current directory or the rest of the path.','F-45846r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)" to "Enabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000045','C-47225r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\

Value Name: SafeDllSearchMode

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-4110','SV-52924r1_rule','default','low','The system must be configured to prevent IP source routing.','Configuring the system to disable IP source routing protects against spoofing.','F-45850r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)" to "Highest protection, source routing is completely disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000038','C-47229r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: DisableIPSourceRouting

Value Type: REG_DWORD
Value: 2','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14239','SV-52950r1_rule','default','medium','User Account Control must only elevate UIAccess applications that are installed in secure locations.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures Windows to only allow applications installed in a secure location on the file system, such as the Program Files or the Windows\System32 folders, to run with elevated privileges.','F-45876r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Only elevate UIAccess applications that are installed in secure locations" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000082','C-47256r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableSecureUIAPaths

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-21955','SV-53180r2_rule','default','low','IPv6 source routing must be configured to the highest protection level.','Configuring the system to disable IPv6 source routing protects against spoofing.','F-46106r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)" to "Highest protection, source routing is completely disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000037','C-47486r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\

Value Name: DisableIPSourceRouting

Type: REG_DWORD
Value: 2','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26470','SV-51499r3_rule','default','medium','Unauthorized accounts must not have the Access this computer from the network user right on member servers.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access this computer from the network" user right may access resources on the system, and must be limited to those that require it.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-49518r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Access this computer from the network" to only include the following accounts or groups:

Administrators
Authenticated Users

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000002-MS','C-49426r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Access this computer from the network" user right, this is a finding:

Administrators
Authenticated Users

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26471','SV-52109r2_rule','default','medium','Unauthorized accounts must not have the Adjust memory quotas for a process user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Adjust memory quotas for a process" user right can adjust memory that is available to processes, and could be used in a denial of service (DoS) attack.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45134r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Adjust memory quotas for a process" to only include the following accounts or groups:

Administrators
Local Service
Network Service' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000004','C-46926r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Adjust memory quotas for a process" user right, this is a finding:

Administrators
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26475','SV-52112r2_rule','default','low','Unauthorized accounts must not have the Bypass traverse checking user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Bypass traverse checking" user right can pass through folders when browsing even if they do not have the "Traverse Folder" access permission. They could potentially view sensitive file and folder names.  They would not have additional access to the files and folders unless it is granted through permissions.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45137r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Bypass traverse checking" to only include the following accounts or groups:

Administrators,
Authenticated Users,
Local Service,
Network Service,
Window Manager\Window Manager Group' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000008','C-46929r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Bypass traverse checking" user right, this is a finding:

Administrators
Authenticated Users
Local Service
Network Service
Window Manager\Window Manager Group','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26479','SV-52113r2_rule','default','high','Unauthorized accounts must not have the Create a token object user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Create a token object" user right allows a process to create an access token. This could be used to provide elevated rights and compromise a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45138r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create a token object" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000012','C-46930r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Create a token object" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26480','SV-52114r2_rule','default','medium','Unauthorized accounts must not have the Create global objects user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create global objects" user right can create objects that are available to all sessions, which could affect processes in other users" sessions.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45139r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create global objects" to only include the following accounts or groups:

Administrators
Service
Local Service
Network Service' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000013','C-46931r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create global objects" user right, this is a finding:

Administrators
Service
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26490','SV-52117r2_rule','default','medium','Unauthorized accounts must not have the Impersonate a client after authentication user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Impersonate a client after authentication" user right allows a program to impersonate another user or account to run on their behalf.  An attacker could potentially use this to elevate privileges.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45142r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Impersonate a client after authentication" to only include the following accounts or groups:

Administrators
Service
Local Service
Network Service' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000025','C-46934r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Impersonate a client after authentication" user right, this is a finding:

Administrators
Service
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26491','SV-53047r1_rule','default','medium','Unauthorized accounts must not have the Increase a process working set user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Increase a process working set" user right can change the size of a process"s working set, potentially causing performance issues or a DoS.','F-45973r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Increase a process working set" to only include the following accounts or groups:

Administrators
Local Service
Window Manager\Window Manager Group' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000026','C-47353r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Increase a process working set" user right, this is a finding:

Administrators
Local Service
Window Manager\Window Manager Group','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26494','SV-52119r2_rule','default','medium','Unauthorized accounts must not have the Lock pages in memory user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Lock pages in memory" user right allows physical memory to be assigned to processes, which could cause performance issues or a DoS.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45144r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Lock pages in memory" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000029','C-46937r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Lock pages in memory" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26498','SV-53029r1_rule','default','medium','Unauthorized accounts must not have the Modify firmware environment values user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Modify firmware environment values" user right can change hardware configuration environment variables.  This could result in hardware failures or a DoS.','F-45955r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Modify firmware environment values" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000034','C-47334r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Modify firmware environment values" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26503','SV-52121r2_rule','default','medium','Unauthorized accounts must not have the Replace a process level token user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Replace a process level token" user right allows one process or service to start another process or service with a different security access token.  A user with this right could use this to impersonate another account.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45146r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Replace a process level token" to only include the following accounts or groups:

Local Service
Network Service' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000039','C-46939r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Replace a process level token" user right, this is a finding:

Local Service
Network Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26506','SV-52123r2_rule','default','medium','Unauthorized accounts must not have the Take ownership of files or other objects user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Take ownership of files or other objects" user right can take ownership of objects and make changes.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45148r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Take ownership of files or other objects" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000042','C-46941r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Take ownership of files or other objects" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1097','SV-52848r1_rule','default','medium','The number of allowed bad logon attempts must meet minimum requirements.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  The higher this value is, the less effective the account lockout feature will be in protecting the local system.  The number of bad logon attempts must be reasonably small to minimize the possibility of a successful password attack, while allowing for honest errors made during a normal user logon.','F-45774r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout threshold" to "3" or less invalid logon attempts (excluding "0" which is unacceptable).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000002','C-47165r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Account lockout threshold" is "0" or more than "3" attempts, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1098','SV-52849r1_rule','default','medium','The period of time before the bad logon counter is reset must meet minimum requirements.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  This parameter specifies the period of time that must pass after failed logon attempts before the counter is reset to 0.  The smaller this value is, the less effective the account lockout feature will be in protecting the local system.','F-45775r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Reset account lockout counter after" to at least "60" minutes.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000003','C-47166r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Reset account lockout counter after" value is less than "60" minutes, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1099','SV-52850r1_rule','default','medium','The lockout duration must be configured to require an administrator to unlock an account.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  This parameter specifies the period of time that an account will remain locked after the specified number of failed logon attempts.  A value of 0 will require an administrator to unlock the account.','F-45776r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout duration" to "0" minutes, "Account is locked out until administrator unlocks it".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000001','C-47167r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Account lockout duration" is not set to "0", requiring an administrator to unlock the account, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1104','SV-52851r1_rule','default','medium','The maximum password age must meet requirements.','The longer a password is in use, the greater the opportunity for someone to gain unauthorized knowledge of the passwords.   Scheduled changing of passwords hinders the ability of unauthorized system users to crack passwords and gain access to a system.','F-45777r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Maximum password age" to "60" days or less (excluding "0" which is unacceptable).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000005','C-47168r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Maximum password age" is greater than "60" days, this is a finding.  If the value is set to "0" (never expires), this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1114','SV-52856r1_rule','default','medium','The built-in guest account must be renamed.','The built-in guest account is a well-known user account on all Windows systems and, as initially installed, does not require a password.  This can allow access to system resources by unauthorized users.  Renaming this account to an unidentified name improves the protection of this account and the system.','F-45782r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Rename guest account" to a name other than "Guest".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000006','C-47173r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Accounts: Rename guest account" is not set to a value other than "Guest", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1105','SV-52852r1_rule','default','medium','The minimum password age must meet requirements.','Permitting passwords to be changed in immediate succession within the same day allows users to cycle passwords through their history database.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45778r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password age" to at least "1" day.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000006','C-47169r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password age" is set to "0" days ("Password can be changed immediately."), this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3344','SV-52886r1_rule','default','high','Local accounts with blank passwords must be restricted to prevent access from the network.','An account without a password can allow unauthorized access to a system as only the username would be required.  Password policies should prevent accounts with blank passwords from existing on a system.  However, if a local account with a blank password did exist, enabling this setting will prevent network access, limiting the account to local console logon only.','F-45812r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Limit local account use of blank passwords to console logon only" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000004','C-47203r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: LimitBlankPasswordUse

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14228','SV-53129r1_rule','default','medium','Auditing the Access of Global System Objects must be turned off.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
This setting prevents the system from setting up a default system access control list for certain system objects, which could create a very large number of security events, filling the security log in Windows and making it difficult to identify actual issues.','F-46055r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Audit: Audit the access of global system objects" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000007','C-47435r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: AuditBaseObjects

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14229','SV-52943r1_rule','default','medium','Auditing of Backup and Restore Privileges must be turned off.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
This setting prevents the system from generating audit events for every file backed up or restored, which could fill the security log in Windows, making it difficult to identify actual issues.','F-45869r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Audit: Audit the use of Backup and Restore privilege" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000008','C-47249r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: FullPrivilegeAuditing

Value Type: REG_BINARY
Value: 00','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14230','SV-52944r1_rule','default','medium','Audit policy using subcategories must be enabled.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
This setting allows administrators to enable more precise auditing capabilities.','F-45870r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000009','C-47250r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: SCENoApplyLegacyAuditPolicy

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1171','SV-52875r1_rule','default','medium','Ejection of removable NTFS media must be restricted to Administrators.','Removable hard drives, if they are not properly configured, can be formatted and ejected by users who are not members of the Administrators Group.  Formatting and ejecting removable NTFS media must only be done by administrators.','F-45801r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Devices: Allowed to format and eject removable media" to "Administrators".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000011','C-47192r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: AllocateDASD

Value Type: REG_SZ
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-6831','SV-52934r2_rule','default','medium','Outgoing secure channel traffic must be encrypted or signed.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted.  If this policy is enabled, outgoing secure channel traffic will be encrypted and signed.','F-45860r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally encrypt or sign secure channel data (always)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000012','C-47239r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireSignOrSeal

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1163','SV-52871r2_rule','default','medium','Outgoing secure channel traffic must be encrypted when possible.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted.  If this policy is enabled, outgoing secure channel traffic will be encrypted.','F-45797r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally encrypt secure channel data (when possible)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000013','C-47188r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SealSecureChannel

Value Type: REG_DWORD
Value: 1

If the value for "Domain Member: Digitally encrypt or sign secure channel data (always)" is set to "Enabled", this can be NA (see V-6831).','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1164','SV-52872r2_rule','default','medium','Outgoing secure channel traffic must be signed when possible.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but the channel is not integrity checked.  If this policy is enabled, outgoing secure channel traffic will be signed.','F-45798r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally sign secure channel data (when possible)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000014','C-47189r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SignSecureChannel

Value Type: REG_DWORD
Value: 1

If the value for "Domain Member: Digitally encrypt or sign secure channel data (always)" is set to "Enabled", this can be NA (see V-6831).','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3373','SV-52887r1_rule','default','low','The maximum age for machine account passwords must be set to requirements.','Computer account passwords are changed automatically on a regular basis.  This setting controls the maximum password age that a machine account may have.  This setting must be set to no more than 30 days, ensuring the machine changes its password monthly.','F-45813r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Maximum machine account password age" to "30" or less (excluding "0" which is unacceptable).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000016','C-47204r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: MaximumPasswordAge

Value Type: REG_DWORD
Value: 30 (or less, but not 0)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3374','SV-52888r2_rule','default','medium','The system must be configured to require a strong session key.','A computer connecting to a domain controller will establish a secure channel.  Requiring strong session keys enforces 128-bit encryption between systems.','F-45814r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Require strong (Windows 2000 or Later) session key" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000017','C-47205r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireStrongKey

Value Type: REG_DWORD
Value: 1

This setting may prevent a system from being joined to a domain if not configured consistently between systems.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-11806','SV-52941r1_rule','default','low','The system must be configured to prevent the display of the last username on the logon screen.','Displaying the username of the last logged on user provides half of the userid/password equation that an unauthorized person would need to gain access.  The username of the last user to log on to a system must not be displayed.','F-45867r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Do not display last user name" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000018','C-47247r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DontDisplayLastUserName

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1154','SV-52866r1_rule','default','medium','The Ctrl+Alt+Del security attention sequence for logons must be enabled.','Disabling the Ctrl+Alt+Del security attention sequence can compromise system security.  Because only Windows responds to the Ctrl+Alt+Del security sequence, a user can be assured that any passwords entered following that sequence are sent only to Windows.  If the sequence requirement is eliminated, malicious programs can request and receive a user"s Windows password.  Disabling this sequence also suppresses a custom logon banner.','F-45792r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Do not require CTRL+ALT+DEL" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000019','C-47183r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DisableCAD

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1089','SV-52845r2_rule','default','medium','The required legal notice must be configured to display before console logon.','Failure to display the logon banner prior to a logon attempt will negate legal proceedings resulting from unauthorized access to system resources.','F-45771r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Message text for users attempting to log on" to the following:

You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.

By using this IS (which includes any device attached to this IS), you consent to the following conditions:

-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations.

-At any time, the USG may inspect and seize data stored on this IS.

-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.

-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.

-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants.  Such communications and work product are private and confidential.  See User Agreement for details.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000022','C-47162r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: LegalNoticeText

Value Type: REG_SZ
Value: See message text below

You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.

By using this IS (which includes any device attached to this IS), you consent to the following conditions:

-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations.

-At any time, the USG may inspect and seize data stored on this IS.

-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.

-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.

-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants.  Such communications and work product are private and confidential.  See User Agreement for details.

Any OS versions that do not support the full text version must state the following:
"I"ve read AND consent to terms in IS user agreem"t."

Deviations are not permitted except as authorized by the Deputy Assistant Secretary of Defense for Information and Identity Assurance.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1090','SV-52846r2_rule','default','low','Caching of logon credentials must be limited.','The default Windows configuration caches the last logon credentials for users who log on interactively to a system.  This feature is provided for system availability reasons, such as the user"s machine being disconnected from the network or domain controllers being unavailable.  Even though the credential cache is well-protected, if a system is attacked, an unauthorized individual may isolate the password to a domain user account using a password-cracking program and gain access to the domain.','F-66507r2_fix','If the system is not a member of a domain, this is NA.

Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive Logon: Number of previous logons to cache (in case Domain Controller is not available)" to "4" logons or less.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000024','C-61743r2_chk','If the system is not a member of a domain, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name:  CachedLogonsCount

Value Type:  REG_SZ
Value:  4 (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1172','SV-52876r1_rule','default','low','Users must be warned in advance of their passwords expiring.','Creating strong passwords that can be remembered by users requires some thought.  By giving the user advance warning, the user has time to construct a sufficiently strong password.  This setting configures the system to display a warning to users telling them how many days are left before their password expires.','F-45802r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Prompt user to change password before expiration" to "14" days or more.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000025','C-47193r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: PasswordExpiryWarning

Value Type: REG_DWORD
Value: 14 (or greater)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-6832','SV-52935r2_rule','default','medium','The Windows SMB client must be configured to always perform SMB packet signing.','The server message block (SMB) protocol provides the basis for many network operations.  Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB client will only communicate with an SMB server that performs SMB packet signing.','F-45861r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Digitally sign communications (always)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000028','C-47240r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: RequireSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1166','SV-52874r2_rule','default','medium','The Windows SMB client must be enabled to perform SMB packet signing when possible.','The server message block (SMB) protocol provides the basis for many network operations.   If this policy is enabled, the SMB client will request packet signing when communicating with an SMB server that is enabled or required to perform SMB packet signing.','F-45800r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Digitally sign communications (if server agrees)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000029','C-47191r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: EnableSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1141','SV-52861r1_rule','default','medium','Unencrypted passwords must not be sent to a third-party SMB Server.','Some non-Microsoft SMB servers only support unencrypted (plain text) password authentication.  Sending plain text passwords across the network, when authenticating to an SMB server, reduces the overall security of the environment.  Check with the vendor of the SMB server to see if there is a way to support encrypted password authentication.','F-45787r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Send unencrypted password to connect to third-party SMB servers" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000030','C-47178r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: EnablePlainTextPassword

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1174','SV-52878r2_rule','default','low','The amount of idle time required before suspending a session must be properly set.','Open sessions can increase the avenues of attack on a system.  This setting is used to control when a computer disconnects an inactive SMB session.  If client activity resumes, the session is automatically reestablished.  This protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.','F-45804r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Amount of idle time required before suspending a session" to "15" minutes or less.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000031','C-47195r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: AutoDisconnect

Value Type: REG_DWORD
Value: 15 (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-6833','SV-52936r2_rule','default','medium','The Windows SMB server must be configured to always perform SMB packet signing.','The server message block (SMB) protocol provides the basis for many network operations.  Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB server will only communicate with an SMB client that performs SMB packet signing.','F-45862r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Digitally sign communications (always)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000032','C-47241r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: RequireSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1162','SV-52870r2_rule','default','medium','The Windows SMB server must perform SMB packet signing when possible.','The server message block (SMB) protocol provides the basis for many network operations.   Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB server will negotiate SMB packet signing as requested by the client.','F-45796r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Digitally sign communications (if client agrees)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000033','C-47187r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: EnableSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1136','SV-52860r1_rule','default','low','Users must be forcibly disconnected when their logon hours expire.','Users must not be permitted to remain logged on to the network after they have exceeded their permitted logon hours.  In many cases, this indicates that a user forgot to log off before leaving for the day.  However, it may also indicate that a user is attempting unauthorized access at a time when the system may be less closely monitored.  Forcibly disconnecting users when logon hours expire protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.','F-45786r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Disconnect clients when logon hours expire" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000034','C-47177r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: EnableForcedLogoff

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1145','SV-52107r2_rule','default','medium','Automatic logons must be disabled.','Allowing a system to automatically log on when the machine is booted could give access to any unauthorized individual who restarts the computer.  Automatic logon with administrator privileges would give full access to an unauthorized individual.','F-45132r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)" to "Disabled".

Ensure no passwords are stored in the "DefaultPassword" registry value noted below:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: DefaultPassword

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000036','C-46924r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: AutoAdminLogon

Type: REG_SZ
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-4442','SV-52930r1_rule','default','low','The system must be configured to have password protection take effect within a limited time frame when the screen saver becomes active.','Allowing more than several seconds makes the computer vulnerable to a potential attack from someone walking up to the console to attempt to log on to the system before the lock takes effect.','F-45856r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)" to "5" or less.

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000046','C-47235r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: ScreenSaverGracePeriod

Value Type: REG_SZ
Value: 5 (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-4108','SV-52923r2_rule','default','low','The system must generate an audit event when the audit log reaches a percentage of full threshold.','When the audit log reaches a given percent full, an audit event is written to the security log.  It is recorded as a successful audit event under the category of System.  This option may be especially useful if the audit logs are set to be cleared manually.','F-45849r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning" to "90" or less.

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000049','C-47228r2_chk','If the system is configured to write to an audit server, or is configured to automatically archive full logs, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Eventlog\Security\

Value Name: WarningLevel

Value Type: REG_DWORD
Value: 90 (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1093','SV-52847r1_rule','default','high','Anonymous enumeration of shares must be restricted.','Allowing anonymous logon users (null session connections) to list all account names and enumerate all shared resources can provide a map of potential points to attack the system.','F-45773r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow anonymous enumeration of SAM accounts and shares" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000052','C-47164r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymous

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3377','SV-52890r1_rule','default','medium','The system must be configured to prevent anonymous users from having the same rights as the Everyone group.','Access by anonymous users must be restricted.  If this setting is enabled, then anonymous users have the same rights and permissions as the built-in Everyone group.  Anonymous users must not have these permissions or rights.','F-45816r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Let everyone permissions apply to anonymous users" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000054','C-47207r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: EveryoneIncludesAnonymous

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3339','SV-52883r2_rule','default','high','Unauthorized remotely accessible registry paths must not be configured.','The registry is integral to the function, security, and stability of the Windows system.  Some processes may require remote access to the registry.  This setting controls which registry paths are accessible from a remote computer.  These registry paths must be limited, as they could give unauthorized individuals access to the registry.','F-45809r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Remotely accessible registry paths" with the following entries:

System\CurrentControlSet\Control\ProductOptions
System\CurrentControlSet\Control\Server Applications
Software\Microsoft\Windows NT\CurrentVersion' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000056','C-47200r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\

Value Name: Machine

Value Type: REG_MULTI_SZ
Value: see below

System\CurrentControlSet\Control\ProductOptions
System\CurrentControlSet\Control\Server Applications
Software\Microsoft\Windows NT\CurrentVersion

Legitimate applications may add entries to this registry value.  If an application requires these entries to function properly and is documented with the ISSO, this would not be a finding. Documentation must contain supporting information from the vendor"s instructions.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-4443','SV-52931r2_rule','default','high','Unauthorized remotely accessible registry paths and sub-paths must not be configured.','The registry is integral to the function, security, and stability of the Windows system.  Some processes may require remote access to the registry.  This setting controls which registry paths and sub-paths are accessible from a remote computer.  These registry paths must be limited, as they could give unauthorized individuals access to the registry.','F-45857r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Remotely accessible registry paths and sub-paths" with the following entries:

Software\Microsoft\OLAP Server
Software\Microsoft\Windows NT\CurrentVersion\Perflib
Software\Microsoft\Windows NT\CurrentVersion\Print
Software\Microsoft\Windows NT\CurrentVersion\Windows
System\CurrentControlSet\Control\ContentIndex
System\CurrentControlSet\Control\Print\Printers
System\CurrentControlSet\Control\Terminal Server
System\CurrentControlSet\Control\Terminal Server\UserConfig
System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration
System\CurrentControlSet\Services\Eventlog
System\CurrentControlSet\Services\Sysmonlog' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000057','C-47236r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedPaths\

Value Name: Machine

Value Type: REG_MULTI_SZ
Value: see below

Software\Microsoft\OLAP Server
Software\Microsoft\Windows NT\CurrentVersion\Perflib
Software\Microsoft\Windows NT\CurrentVersion\Print
Software\Microsoft\Windows NT\CurrentVersion\Windows
System\CurrentControlSet\Control\ContentIndex
System\CurrentControlSet\Control\Print\Printers
System\CurrentControlSet\Control\Terminal Server
System\CurrentControlSet\Control\Terminal Server\UserConfig
System\CurrentControlSet\Control\Terminal Server\DefaultUserConfiguration
System\CurrentControlSet\Services\Eventlog
System\CurrentControlSet\Services\Sysmonlog

Legitimate applications may add entries to this registry value. If an application requires these entries to function properly and is documented with the ISSO, this would not be a finding.  Documentation must contain supporting information from the vendor"s instructions.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-6834','SV-52937r1_rule','default','high','Anonymous access to Named Pipes and Shares must be restricted.','Allowing anonymous access to named pipes or shares provides the potential for unauthorized system access.  This setting restricts access to those defined in "Network access: Named Pipes that can be accessed anonymously" and "Network access: Shares that can be accessed anonymously",  both of which must be blank under other requirements.','F-45863r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Restrict anonymous access to Named Pipes and Shares" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000058','C-47242r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: RestrictNullSessAccess

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3378','SV-52891r1_rule','default','medium','The system must be configured to use the Classic security model.','Windows includes two network-sharing security models - Classic and Guest only.  With the Classic model, local accounts must be password protected; otherwise, anyone can use guest user accounts to access shared system resources.','F-45817r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Sharing and security model for local accounts" to "Classic - local users authenticate as themselves".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000060','C-47208r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: ForceGuest

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3379','SV-52892r2_rule','default','high','The system must be configured to prevent the storage of the LAN Manager hash of passwords.','The LAN Manager hash uses a weak encryption algorithm and there are several tools available that use this hash to retrieve account passwords.  This setting controls whether or not a LAN Manager hash of the password is stored in the SAM the next time the password is changed.','F-45818r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Do not store LAN Manager hash value on next password change" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000065','C-47209r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: NoLMHash

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1153','SV-52865r1_rule','default','high','The LanMan authentication level must be set to send NTLMv2 response only, and to refuse LM and NTLM.','The Kerberos v5 authentication protocol is the default for authentication of users who are logging on to domain accounts.  NTLM, which is less secure, is retained in later Windows versions  for compatibility with clients and servers that are running earlier versions of Windows or applications that still use it.  It is also used to authenticate logons to stand-alone computers that are running later versions.','F-45791r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: LAN Manager authentication level" to "Send NTLMv2 response only. Refuse LM AND NTLM".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000067','C-47182r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: LmCompatibilityLevel

Value Type: REG_DWORD
Value: 5','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3381','SV-52894r1_rule','default','medium','The system must be configured to the required LDAP client signing level.','This setting controls the signing requirements for LDAP clients.  This setting must be set to Negotiate signing or Require signing, depending on the environment and type of LDAP server in use.','F-45820r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: LDAP client signing requirements" to "Negotiate signing" at a minimum.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000068','C-47211r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LDAP\

Value Name: LDAPClientIntegrity

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3382','SV-52895r1_rule','default','medium','The system must be configured to meet the minimum session security requirement for NTLM SSP-based clients.','Microsoft has implemented a variety of security support providers for use with RPC sessions.  All of the options must be enabled to ensure the maximum security level.','F-45821r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Minimum session security for NTLM SSP based (including secure RPC) clients" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000069','C-47212r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinClientSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3666','SV-52922r1_rule','default','medium','The system must be configured to meet the minimum session security requirement for NTLM SSP-based servers.','Microsoft has implemented a variety of security support providers for use with RPC sessions.  All of the options must be enabled to ensure the maximum security level.','F-45848r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Minimum session security for NTLM SSP based (including secure RPC) servers" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000070','C-47227r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinServerSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3385','SV-52897r1_rule','default','medium','The system must be configured to require case insensitivity for non-Windows subsystems.','This setting controls the behavior of non-Windows subsystems when dealing with the case of arguments or commands.  Case sensitivity could lead to the access of files or commands that must be restricted.  To prevent this from happening, case insensitivity restrictions must be required.','F-45823r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System objects: Require case insensitivity for non-Windows subsystems" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000075','C-47214r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\Kernel\

Value Name: ObCaseInsensitive

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1173','SV-52877r1_rule','default','low','The default permissions of global system objects must be increased.','Windows systems maintain a global list of shared system resources such as DOS device names, mutexes, and semaphores.  Each type of object is created with a default DACL that specifies who can access the objects with what permissions.  If this policy is enabled, the default DACL is stronger, allowing nonadministrative users to read shared objects, but not modify shared objects that they did not create.','F-45803r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000076','C-47194r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\

Value Name: ProtectionMode

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14234','SV-52946r1_rule','default','medium','User Account Control approval mode for the built-in Administrator must be enabled.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures the built-in Administrator account so that it runs in Admin Approval Mode.','F-45872r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Admin Approval Mode for the Built-in Administrator account" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000077','C-47252r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: FilterAdministratorToken

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14235','SV-52947r1_rule','default','medium','User Account Control must, at minimum, prompt administrators for consent.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures the elevation requirements for logged on administrators to complete a task that requires raised privileges.','F-45873r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode" to "Prompt for consent".

More secure options for this setting would also be acceptable (e.g., Prompt for credentials, Prompt for consent (or credentials) on the secure desktop).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000078','C-47253r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorAdmin

Value Type: REG_DWORD
Value: 4 (Prompt for consent)
3 (Prompt for credentials)
2 (Prompt for consent on the secure desktop)
1 (Prompt for credentials on the secure desktop)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26283','SV-53122r1_rule','default','high','Anonymous enumeration of SAM accounts must not be allowed.','Anonymous enumeration of SAM accounts allows anonymous log on users (null session connections) to list all accounts names, thus providing a list of potential points to attack the system.','F-46048r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow anonymous enumeration of SAM accounts" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000051','C-47428r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymousSAM

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14236','SV-52948r1_rule','default','medium','User Account Control must automatically deny standard user requests for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting controls the behavior of elevation when requested by a standard user account.','F-45874r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Behavior of the elevation prompt for standard users" to "Automatically deny elevation requests".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000079','C-47254r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorUser

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26359','SV-53121r2_rule','default','low','The Windows dialog box title for the legal banner must be configured.','Failure to display the logon banner prior to a logon attempt will negate legal proceedings resulting from unauthorized access to system resources.','F-46047r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Message title for users attempting to log on" to "DoD Notice and Consent Banner", "US Department of Defense Warning Statement", or a site-defined equivalent.

If a site-defined title is used, it can in no case contravene or modify the language of the banner text required in V-1089.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000023','C-47427r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: LegalNoticeCaption

Value Type: REG_SZ
Value: See message title options below

"DoD Notice and Consent Banner", "US Department of Defense Warning Statement", or a site-defined equivalent.

If a site-defined title is used, it can in no case contravene or modify the language of the banner text required in V-1089.

Automated tools may only search for the titles defined above. If a site-defined title is used, a manual review will be required.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14237','SV-52949r1_rule','default','medium','User Account Control must be configured to detect application installations and prompt for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting requires Windows to respond to application installation requests by prompting for credentials.','F-45875r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Detect application installations and prompt for elevation" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000080','C-47255r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableInstallerDetection

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-16008','SV-53142r1_rule','default','medium','Windows must elevate all applications in User Account Control, not just signed ones.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures whether Windows elevates all applications, or only signed ones.','F-46068r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Only elevate executables that are signed and validated" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000081','C-47448r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ValidateAdminCodeSignatures

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14240','SV-52951r1_rule','default','medium','User Account Control must run all administrators in Admin Approval Mode, enabling UAC.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting enables UAC.','F-45877r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Run all administrators in Admin Approval Mode" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000083','C-47257r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableLUA

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14241','SV-52952r1_rule','default','medium','User Account Control must switch to the secure desktop when prompting for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting ensures that the elevation prompt is only used in secure desktop mode.','F-45878r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Switch to the secure desktop when prompting for elevation" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000084','C-47258r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: PromptOnSecureDesktop

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14242','SV-52953r1_rule','default','medium','User Account Control must virtualize file and registry write failures to per-user locations.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures non-UAC-compliant applications to run in virtualized file and registry entries in per-user locations, allowing them to run.','F-45879r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Virtualize file and registry write failures to per-user locations" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000085','C-47259r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableVirtualization

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15991','SV-52223r2_rule','default','medium','UIAccess applications must not be allowed to prompt for elevation without using the secure desktop.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting prevents User Interface Accessibility programs from disabling the secure desktop for elevation prompts.','F-45241r1_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000086','C-46966r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableUIADesktopToggle

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-4446','SV-52221r2_rule','default','medium','Software certificate restriction policies must be enforced.','Software restriction policies help to protect users and computers from executing unauthorized code such as viruses and Trojans horses.  This setting must be enabled to enforce certificate rules in software restriction policies.','F-45239r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System settings: Use Certificate Rules on Windows Executables for Software Restriction Policies" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000087','C-46965r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Safer\CodeIdentifiers\

Value Name: AuthenticodeEnabled

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1151','SV-52214r2_rule','default','low','The print driver installation privilege must be restricted to administrators.','Allowing users to install drivers can introduce malware or cause the instability of a system.  Print driver installation should be restricted to administrators.','F-45233r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Devices: Prevent users from installing printer drivers" to "Enabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000089','C-46960r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers\

Value Name: AddPrinterDrivers

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26469','SV-53120r1_rule','default','medium','Unauthorized accounts must not have the Access Credential Manager as a trusted caller user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access Credential Manager as a trusted caller" user right may be able to retrieve the credentials of other accounts from Credential Manager.','F-46046r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Access Credential Manager as a trusted caller" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000001','C-47426r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Access Credential Manager as a trusted caller" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1102','SV-52108r2_rule','default','high','Unauthorized accounts must not have the Act as part of the operating system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Act as part of the operating system" user right can assume the identity of any user and gain access to resources that user is authorized to access.  Any accounts with this right can take complete control of a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45133r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Act as part of the operating system" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000003','C-46925r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups (to include administrators), are granted the "Act as part of the operating system" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26472','SV-52110r2_rule','default','medium','Unauthorized accounts must not have the Allow log on locally user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Allow log on locally" user right can log on interactively to a system.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45135r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Allow log on locally" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000005','C-46927r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Allow log on locally" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26473','SV-53119r1_rule','default','medium','Unauthorized accounts must not have the Allow log on through Remote Desktop Services user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Allow log on through Remote Desktop Services" user right can access a system through Remote Desktop.','F-46045r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Allow log on through Remote Desktop Services" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000006','C-47425r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Allow log on through Remote Desktop Services" user right, this is a finding:

Administrators

If the system serves the Remote Desktop Services role, the Remote Desktop Users group may be included.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26474','SV-52111r2_rule','default','medium','Unauthorized accounts must not have the back up files and directories user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Back up files and directories" user right can circumvent file and directory permissions and could allow access to sensitive data.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45136r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Back up files and directories" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000007','C-46928r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Back up files and directories" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26476','SV-53118r1_rule','default','medium','Unauthorized accounts must not have the Change the system time user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the system time" user right can change the system time, which can impact authentication, as well as affect time stamps on event log entries.','F-46044r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the system time" to only include the following accounts or groups:

Administrators
Local Service' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000009','C-47424r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the system time" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26477','SV-53117r1_rule','default','low','Unauthorized accounts must not have the Change the time zone user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the time zone" user right can change the time zone of a system.','F-46043r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the time zone" to only include the following accounts or groups:

Administrators
Local Service' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000010','C-47423r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the time zone" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26478','SV-53063r1_rule','default','medium','Unauthorized accounts must not have the Create a pagefile user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create a pagefile" user right can change the size of a pagefile, which could affect system performance.','F-45989r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create a pagefile" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000011','C-47369r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create a pagefile" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26481','SV-53059r1_rule','default','medium','Unauthorized accounts must not have the Create permanent shared objects user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create permanent shared objects" user right could expose sensitive data by creating shared objects.','F-45985r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create permanent shared objects" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000014','C-47365r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Create permanent shared objects" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26482','SV-53054r2_rule','default','medium','Unauthorized accounts must not have the Create symbolic links user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create symbolic links" user right can create pointers to other objects, which could potentially expose the system to attack.','F-66511r1_fix','Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Create symbolic links" to only include the following accounts or groups:

Administrators

Systems that have the Hyper-V role will also have "Virtual Machines" given this user right.  If this needs to be added manually, enter it as "NT Virtual Machine\Virtual Machines".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000015','C-61747r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create symbolic links" user right, this is a finding:

Administrators

Systems that have the Hyper-V role will also have "Virtual Machines" given this user right (this may be displayed as "NT Virtual Machine\Virtual Machines").  This is not a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-18010','SV-52115r2_rule','default','high','Unauthorized accounts must not have the Debug programs user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Debug programs" user right can attach a debugger to any process or to the kernel, providing complete access to sensitive and critical operating system components.  This right is given to Administrators in the default configuration.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45140r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Debug programs" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000016','C-46932r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Debug programs" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1155','SV-51501r3_rule','default','medium','The Deny access to this computer from the network user right on member servers must be configured to prevent access from highly privileged domain accounts and local administrator accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny access to this computer from the network" user right defines the accounts that are prevented from logging on from the network.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

Local administrator accounts on domain-joined systems must also be assigned this right to decrease the risk of lateral movement resulting from credential theft attacks.

The Guests group must be assigned this right to prevent unauthenticated access.','F-62387r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny access to this computer from the network" to include the following:

Domain Systems Only:
Enterprise Admins group
Domain Admins group
*Systems with the new built-in security groups - use "Local account" or "Local account and member of Administrators group".
**Systems that do not have the new built-in security groups - use the "DenyNetworkAccess" or "DeniedNetworkAccess" group (see V-45589).
Do not use the built-in Administrators group. This group must contain the appropriate accounts/groups responsible for administering the system.

All Systems:
Guests group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from denying the Enterprise Admins and Domain Admins groups.

*Windows 8.1 and Windows Server 2012 R2 added new built-in security groups, "Local account" and "Local account and member of Administrators group", for assigning permissions and rights to local accounts.
Microsoft Security Advisory Patch 2871997 adds these groups to Windows 7, Windows 8, Windows Server 2008 R2, and Windows Server 2012.
Assign the group "Local account and member of Administrators group" or the more restrictive "Local account".

**Documentation and scripts supporting the use of this group to restrict local administrative accounts were changed at one point.  The original name, "DeniedNetworkAccess", was changed to "DenyNetworkAccess".

Automated benchmarks will look for the groups referenced in the requirement.  Use of other methods will require manual validation.

Windows 2008 R2:

Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Deny access to this computer from the network" to include the following.

Domain Systems Only:
Enterprise Admins group
Domain Admins group
Local account (see Note below)

All Systems:
Guests group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from denying the Enterprise Admins and Domain Admins groups.

' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000017-MS','C-58025r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny access to this computer from the network" user right, this is a finding:

Domain Systems Only:
Enterprise Admins group
Domain Admins group
All Local Administrator Accounts:
*Systems with the new built-in security groups - use "Local account" or "Local account and member of Administrators group".
**Systems that do not have the new built-in security groups - use the "DenyNetworkAccess" or "DeniedNetworkAccess" group (see V-45589).
Do not use the built-in Administrators group.  This group must contain the appropriate accounts/groups responsible for administering the system.

All Systems:
Guests group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from denying the Enterprise Admins and Domain Admins groups.

*Windows 8.1 and Windows Server 2012 R2 added new built-in security groups, "Local account" and "Local account and member of Administrators group", for assigning permissions and rights to local accounts.
Microsoft Security Advisory Patch 2871997 adds these groups to Windows 7, Windows 8, Windows Server 2008 R2, and Windows Server 2012.
Assign the group "Local account and member of Administrators group" or the more restrictive "Local account".

**Documentation and scripts supporting the use of this group to restrict local administrative accounts were changed at one point.  The original name, "DeniedNetworkAccess", was changed to "DenyNetworkAccess".

Automated benchmarks will look for the groups referenced in the requirement.  Use of other methods will require manual validation.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26483','SV-51502r1_rule','default','medium','The Deny log on as a batch job user right on member servers must be configured to prevent access from highly privileged domain accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on as a batch job" user right defines accounts that are prevented from logging on to the system as a batch job such, as Task Scheduler.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

The Guests group must be assigned to prevent unauthenticated access.','F-44652r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny log on as a batch job" to include the following:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

All Systems:
Guests Group' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000018-MS','C-46807r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on as a batch job" user right, this is a finding:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

All Systems:
Guests Group','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26485','SV-51508r2_rule','default','medium','The Deny log on locally user right on member servers must be configured to prevent access from highly privileged domain accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on locally" user right defines accounts that are prevented from logging on interactively.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

The Guests group must be assigned this right to prevent unauthenticated access.','F-49929r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny log on locally" to include the following:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from this.

All Systems:
Guests Group' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000020-MS','C-49587r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on locally" user right, this is a finding:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from this.

All Systems:
Guests Group','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26488','SV-53050r1_rule','default','medium','Unauthorized accounts must not have the Force shutdown from a remote system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Force shutdown from a remote system" user right can remotely shut down a system, which could result in a DoS.','F-45976r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Force shutdown from a remote system" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000023','C-47356r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Force shutdown from a remote system" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26489','SV-52116r2_rule','default','medium','Unauthorized accounts must not have the Generate security audits user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Generate security audits" user right specifies users and processes that can generate Security Log audit records, which must only be the system service accounts defined.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45141r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Generate security audits" to only include the following accounts or groups:

Local Service
Network Service' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000024','C-46933r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Generate security audits" user right, this is a finding:

Local Service
Network Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26492','SV-52118r2_rule','default','medium','Unauthorized accounts must not have the Increase scheduling priority user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Increase scheduling priority" user right can change a scheduling priority causing performance issues or a DoS.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45143r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Increase scheduling priority" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000027','C-46936r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Increase scheduling priority" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26493','SV-53043r1_rule','default','medium','Unauthorized accounts must not have the Load and unload device drivers user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Load and unload device drivers" user right allows device drivers to dynamically be loaded on a system by a user.  This could potentially be used to install malicious code by an attacker.','F-45969r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Load and unload device drivers" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000028','C-47349r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Load and unload device drivers" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26496','SV-53039r2_rule','default','medium','Unauthorized accounts must not have the Manage auditing and security log user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Manage auditing and security log" user right can manage the security log and change auditing configurations.  This could be used to clear evidence of tampering.','F-45965r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Manage auditing and security log" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000032','C-47345r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Manage auditing and security log" user right, this is a finding:

Administrators

If the site has an Auditors group that further limits this privilege this would not be a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26497','SV-53033r1_rule','default','medium','Unauthorized accounts must not have the Modify an object label user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Modify an object label" user right can change the integrity label of an object.  This could potentially be used to execute code at a higher privilege.','F-45958r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Modify an object label" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000033','C-47338r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Modify an object label" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26499','SV-53025r1_rule','default','medium','Unauthorized accounts must not have the Perform volume maintenance tasks user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Perform volume maintenance tasks" user right can manage volume and disk configurations.  They could potentially delete volumes, resulting in data loss or a DoS.','F-45951r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Perform volume maintenance tasks" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000035','C-47330r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Perform volume maintenance tasks" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26500','SV-53022r1_rule','default','medium','Unauthorized accounts must not have the Profile single process user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile single process" user right can monitor nonsystem processes performance.  An attacker could potentially use this to identify processes to attack.','F-45948r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Profile single process" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000036','C-47328r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Profile single process" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26501','SV-53019r1_rule','default','medium','Unauthorized accounts must not have the Profile system performance user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile system performance" user right can monitor system processes performance.  An attacker could potentially use this to identify processes to attack.','F-45945r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Profile system performance" to only include the following accounts or groups:

Administrators
NT Service\WdiServiceHost' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000037','C-47325r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Profile system performance" user right, this is a finding:

Administrators
NT Service\WdiServiceHost','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26504','SV-52122r2_rule','default','medium','Unauthorized accounts must not have the Restore files and directories user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Restore files and directories" user right can circumvent file and directory permissions and could allow access to sensitive data.  It could also be used to overwrite more current data.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45147r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Restore files and directories" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000040','C-46940r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Restore files and directories" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26529','SV-53013r2_rule','default','medium','The system must be configured to audit Account Logon - Credential Validation successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential validation records events related to validation tests on credentials for a user account logon.','F-45940r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Credential Validation" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000001','C-47320r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Logon -> Credential Validation - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26505','SV-53016r1_rule','default','medium','Unauthorized accounts must not have the Shut down the system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Shut down the system" user right can interactively shut down a system, which could result in a DoS.','F-45943r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Shut down the system" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000041','C-47323r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Shut down the system" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26530','SV-53011r2_rule','default','medium','The system must be configured to audit Account Logon - Credential Validation failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential validation records events related to validation tests on credentials for a user account logon.','F-45938r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Credential Validation" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000002','C-47318r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Logon -> Credential Validation - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26531','SV-52234r3_rule','default','medium','The system must be configured to audit Account Management - Computer Account Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Computer Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling computer accounts.','F-45249r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Computer Account Management" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000011','C-46972r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Computer Account Management - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26533','SV-53009r1_rule','default','medium','The system must be configured to audit Account Management - Other Account Management Events successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Other Account Management Events records events such as the access of a password hash or the Password Policy Checking API being called.','F-45936r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Other Account Management Events" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000015','C-47317r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Other Account Management Events - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26534','SV-53008r1_rule','default','medium','The system must be configured to audit Account Management - Other Account Management Events failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Other Account Management Events records events such as the access of a password hash or the Password Policy Checking API being called.','F-45935r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Other Account Management Events" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000016','C-47315r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Other Account Management Events - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26535','SV-53007r2_rule','default','medium','The system must be configured to audit Account Management - Security Group Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security Group Management records events such as creating, deleting, or changing security groups, including changes in group members.','F-45934r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Security Group Management" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000017','C-47314r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Security Group Management - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26536','SV-53005r2_rule','default','medium','The system must be configured to audit Account Management - Security Group Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security Group Management records events such as creating, deleting, or changing security groups, including changes in group members.','F-45932r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Security Group Management" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000018','C-47312r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Security Group Management - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26537','SV-53003r2_rule','default','medium','The system must be configured to audit Account Management - User Account Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.','F-45930r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit User Account Management" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000019','C-47310r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> User Account Management - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26538','SV-53001r2_rule','default','medium','The system must be configured to audit Account Management - User Account Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.','F-45928r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit User Account Management" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000020','C-47308r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> User Account Management - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26539','SV-52999r1_rule','default','medium','The system must be configured to audit Detailed Tracking - Process Creation successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Process Creation records events related to the creation of a process and the source.','F-45926r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Detailed Tracking -> "Audit Process Creation" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000023','C-47306r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Detailed Tracking -> Process Creation - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26540','SV-52996r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logoff successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logoff records user logoffs.  If this is an interactive logoff, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45923r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logoff" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000045','C-47303r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logoff - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26541','SV-52994r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logon successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logon records user logons.  If this is an interactive logon, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45921r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logon" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000047','C-47301r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logon - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26542','SV-52993r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logon failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logon records user logons.  If this is an interactive logon, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45920r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logon" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000048','C-47300r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logon - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26543','SV-52987r1_rule','default','medium','The system must be configured to audit Logon/Logoff - Special Logon successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Special Logon records special logons which have administrative privileges and can be used to elevate processes.','F-45913r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Special Logon" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000053','C-47293r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Special Logon - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26546','SV-52983r1_rule','default','medium','The system must be configured to audit Policy Change - Audit Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.','F-45909r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Audit Policy Change" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000085','C-47289r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Audit Policy Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26547','SV-52982r1_rule','default','medium','The system must be configured to audit Policy Change - Audit Policy Change failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.','F-45908r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Audit Policy Change" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000086','C-47288r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Audit Policy Change - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26548','SV-52981r1_rule','default','medium','The system must be configured to audit Policy Change - Authentication Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Authentication Policy Change records events related to changes in authentication policy, including Kerberos policy and Trust changes.','F-45907r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Authentication Policy Change" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000087','C-47287r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Authentication Policy Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26549','SV-52980r1_rule','default','medium','The system must be configured to audit Privilege Use - Sensitive Privilege Use successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Sensitive Privilege Use records events related to use of sensitive privileges, such as "Act as part of the operating system" or "Debug programs".','F-45906r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Privilege Use -> "Audit Sensitive Privilege Use" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000101','C-47286r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Privilege Use -> Sensitive Privilege Use - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26550','SV-52979r1_rule','default','medium','The system must be configured to audit Privilege Use - Sensitive Privilege Use failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Sensitive Privilege Use records events related to use of sensitive privileges, such as "Act as part of the operating system" or "Debug programs".','F-45905r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Privilege Use -> "Audit Sensitive Privilege Use" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000102','C-47285r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Privilege Use -> Sensitive Privilege Use - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26551','SV-52978r1_rule','default','medium','The system must be configured to audit System - IPsec Driver successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

IPsec Driver records events related to the IPSec Driver such as dropped packets.','F-45904r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit IPsec Driver" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000103','C-47284r2_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> IPsec Driver - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26552','SV-52977r1_rule','default','medium','The system must be configured to audit System - IPsec Driver failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

IPsec Driver records events related to the IPsec Driver such as dropped packets.','F-45903r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit IPsec Driver" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000104','C-47283r2_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> IPsec Driver - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26579','SV-52966r1_rule','default','medium','The Application event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45892r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-CC-000084','C-47272r3_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Application\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26580','SV-52965r1_rule','default','medium','The Security event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45891r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security -> "Specify the maximum log size (KB)" to at minimum "Enabled:196608".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-CC-000085','C-47271r3_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Security\

Value Name:  MaxSize

Type: REG_DWORD
Value: 196608 or greater','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26582','SV-52963r1_rule','default','medium','The System event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45889r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-CC-000087','C-47269r2_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\System\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768 or greater','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-34974','SV-52954r1_rule','default','high','The Windows Installer Always install with elevated privileges option must be disabled.','Standard user accounts must not be granted elevated privileges.  Enabling Windows Installer to elevate privileges when installing applications can allow malicious persons and applications to gain full control of a system.','F-45880r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Installer -> "Always install with elevated privileges" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-CC-000116','C-47260r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Installer\

Value Name: AlwaysInstallElevated

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36773','SV-51596r1_rule','default','medium','The machine inactivity limit must be set to 15 minutes, locking the system with the screensaver.','Unattended systems are susceptible to unauthorized use and should be locked when unattended.  The screen saver should be set at a maximum of 15 minutes and be password protected.  This protects critical and sensitive data from exposure to unauthorized personnel with physical access to the computer.','F-44717r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Machine inactivity limit" to "900" seconds" or less.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000021','C-46851r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: InactivityTimeoutSecs

Value Type: REG_DWORD
Value: 0x00000384 (900) (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56378','SV-50462r1_rule','default','high','
                 The system must be configured to audit policy change - "Authorization Policy Change" to No Auditing.
             ','
                     This rule determines whether the Transport Layer Security/Secure Sockets Layer (TLS/SSL) Security Provider supports only the TLS_RSA_WITH_3DES_EDE_CBC_SHA cipher suite. Although this policy setting increases security, most public Web sites that are secured with TLS or SSL do not support these algorithms. The default setting for this rule is Enabled.
             ','F-56000','
Use the AuditPol tool to set the Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").

"Auditpol /set /subcategory:"Authorization Policy Change" /Success:disable /Failure:disable".
                ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
    Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration: -Open a Command Prompt with elevated privileges ("Run as Administrator"). -Enter "AuditPol /get /Subcategory:"Authorization Policy Change"

Compare the AuditPol settings with the following. If the system does not audit the following, this is a finding.
 
policy change -> "Authorization Policy Change" - No Auditing
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56353','SV-50462r1_rule','default','high','
  The DNS servers used must be legitimate
             ','
                     User should review the list of DNS servers and ensure that it is legitimate. This rule produces a list of DNS servers for review.
             ','F-56000','
   User should review the list of DNS servers and ensure that it is legitimate.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
    To get the list of DNS servers

Go to the

Control Panel ->  Network and Internet  -> Network and sharing Center -> Ethernet ->  click on Details.

(or)

Run "ipconfig /all" from a command prompt session .

If any DNS server is not an legitamate server, this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56356','SV-50462r1_rule','default','high','
                   The authorized time sources must be legitimate
             ','
                     User Intervention Required: User should enter the name of authorized time source(s) as appropriate. This rule verifies that authorized time source(s) is (are) configured.
             ','F-56000','
   To configure the Windows time service
Ex:

C:\>w32tm /config /update /manualpeerlist:"0.pool.ntp.org,0x8 1.pool.ntp.org,0x8 2.pool.ntp.org,0x8 3.pool.ntp.org,0x8" /syncfromflags:MANUAL

Once that is configured we need to restart the time service by either doing net stop/start w32time or via the Services Control Panel on Windows Time.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
    To query the time service about its current status run the following command.

C:\> w32tm /query /status

This will display the time source (it will either state Source: Local CMOS Clock or time.windows.com)

If the authorized time source(s) is (are)  not configured this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56357','SV-50462r1_rule','default','high','
                   The list of currently running services must be legitimate.
             ','
                     User Intervention Required: User should review the list of services that are running on the system and ensure that it is legitimate. This rule produces a list of services that are running on the system for review.
             ','F-56000','
   User should review the list of services that are running on the system and ensure that it is legitimate.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
    To verify the list of running services on the system

Go to the

servermanager>tools>Services

or run the following command:

Get-Service | Where Status -eq "Running" | Out-GridView
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56358','SV-50462r1_rule','default','high','
                   The list of installed software components must be legitimate.
             ','
                     User Intervention Required: User should review the lists of installed system components and ensure that it is legitimate. This rule produces a list of installed system components for review.
             ','F-56000','
   User should review the lists of installed system components and ensure that it is legitimate.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
    To verify the installed system components go to the

ControlPanel -> Programs -> Programs and Features

(or)

Run the following command:

Get-WindowsFeature | where { $_.installState -eq "installed"}

If not found any legitimate installed system components this is a finding.
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56375','SV-50462r1_rule','default','high','
                   Inactive Accounts which have not been logged in for more than 90 days must be disabled.
             ','
                     This rule verifies that inactive accounts over 90 days old are locked.
             ','F-56000','
   Disable the user(s) those are not logged in since last 90 Days:
C:\Users\Administrator>dsquery user -name * -inactive 12 -limit 0 | findstr /v Administrator | dsmod user -disabled yes

By Powershell

Use Disable-ADAccount in conjunction with Search-ADAccount. Get the name of the inactive account since 90 days by Search-ADAccount.
             ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
    Get the name of the INACTIVE ACCOUNTS :

wmic useraccount list status
DSQUERY user -inactive 12

When you get the "degraded" in status column, it means account is INACTIVE

By powershell

Search-ADAccount -UsersOnly -AccountInactive -TimeSpan 90d | ?{$_.enabled -eq $True} | Get-ADUser -Properties Name, sAMAccountName, givenName, sn | Select Name, sAMAccountName, givenName, sn
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1107','SV-52853r1_rule','default','medium','The password history must be configured to 24 passwords remembered.','A system is more vulnerable to unauthorized access when system users recycle the same password several times without being required to change to a unique password on a regularly scheduled basis.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45779r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Enforce password history" to "24" passwords remembered.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000004','C-47170r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

The value for "Enforce password history" is must be "24" passwords remembered,if not this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56379','SV-50462r1_rule','default','high','
                  The system must be configured to audit Object Access - "Kernel Object" to No Auditing.
             ','
                     This rule determines whether the Transport Layer Security/Secure Sockets Layer (TLS/SSL) Security Provider supports only the TLS_RSA_WITH_3DES_EDE_CBC_SHA cipher suite. Although this policy setting increases security, most public Web sites that are secured with TLS or SSL do not support these algorithms. The default setting for this rule is Enabled.
             ','F-56000','
   Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Kernel Object" policy 

auditpol /set /Subcategory:"Kernel Object" /Success:Disable/Failure:Disable 

For Reference ths policy: Follow below path and Select On Checkbox without Select "Success" and "Failure" 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Object Access -> "Kernel Object" with No Auditing.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','Windows 2012','','
    Security Option "Audit: Force audit policy subcategory settings to override audit policy category settings" must be set to "Enabled" , for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:

Open a Command Prompt with elevated privileges ("Run as Administrator").

Enter below Command to get the status:

Auditpol /get /Subcategory:"Kernel Object"

System audit policy
Category/Subcategory                      Setting
Object Access
Kernel Object                                     No Auditing

If auditPol result is not matched with required value then this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-6836','SV-52938r2_rule','default','medium','Passwords must, at a minimum, be 14 characters.','Information systems not protected with strong password schemes (including passwords of minimum length) provide the opportunity for anyone to crack the password, thus gaining access to the system and compromising the device, information, or the local network.','F-45864r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password length" to "14" characters.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AC-000007','C-47243r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password length," is less than "14" characters, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26487','SV-51500r1_rule','default','medium','Unauthorized accounts must not have the Enable computer and user accounts to be trusted for delegation user right on member servers.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Enable computer and user accounts to be trusted for delegation" user right allows the "Trusted for Delegation" setting to be changed.  This could potentially allow unauthorized users to impersonate other users.','F-44649r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Enable computer and user accounts to be trusted for delegation" to be defined but containing no entries (blank).

Windows 2008R2:

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Enable computer and user accounts to be trusted for delegation" to only include the following accounts or groups:
      Administrators

' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-UR-000022-MS','C-46805r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Enable computer and user accounts to be trusted for delegation" user right, this is a finding.

Windows 2008R2:

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.
If any user accounts or groups other than the following are granted the "Enable computer and user accounts to be trusted for delegation" right, this is a finding:
Administrators

','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26553','SV-52976r1_rule','default','medium','The system must be configured to audit System - Security State Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security State Change records events related to changes in the security state, such as startup and shutdown of the system.','F-45902r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security State Change" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000107','C-47282r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security State Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26554','SV-52975r1_rule','default','medium','The system must be configured to audit System - Security State Change failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security State Change records events related to changes in the security state, such as startup and shutdown of the system.','F-45901r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security State Change" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000108','C-47281r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security State Change - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26555','SV-52974r1_rule','default','medium','The system must be configured to audit System - Security System Extension successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security System Extension records events related to extension code being loaded by the security subsystem.','F-45900r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security System Extension" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000109','C-47280r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security System Extension - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26556','SV-52973r1_rule','default','medium','The system must be configured to audit System - Security System Extension failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security System Extension records events related to extension code being loaded by the security subsystem.','F-45899r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security System Extension" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000110','C-47279r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security System Extension - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26557','SV-52972r1_rule','default','medium','The system must be configured to audit System - System Integrity successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

System Integrity records events related to violations of integrity to the security subsystem.','F-45898r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit System Integrity" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000111','C-47278r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> System Integrity - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26558','SV-52971r1_rule','default','medium','The system must be configured to audit System - System Integrity failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

System Integrity records events related to violations of integrity to the security subsystem.','F-45897r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit System Integrity" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000112','C-47277r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> System Integrity - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3337','SV-52882r1_rule','default','high','Anonymous SID/Name translation must not be allowed.','Allowing anonymous SID/Name translation can provide sensitive information for accessing a system.  Only authorized users must be able to perform such translations.','F-45808r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Allow anonymous SID/Name translation" to "Disabled".' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Network access: Allow anonymous SID/Name translation" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36667','SV-51604r1_rule','default','medium','The system must be configured to audit Object Access - Removable Storage.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Removable Storage auditing under Object Access records events related to access attempts on file system objects on removable storage devices.','F-44725r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Object Access -> "Audit Removable Storage" with "No Auditing" selected.' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-AU-000082','C-46854r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*"

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Object Access -> Removable Storage - No Auditing','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56380','SV-72067r1_rule','default','high','Microsoft Security Bulletin MS17-010 – Critical should be Installed. (WannaCry)','This security update resolves vulnerabilities in Microsoft Windows. The most severe of the vulnerabilities could allow remote code execution if an attacker sends specially crafted messages to a Microsoft Server Message Block 1.0 (SMBv1) server.','F-62859r3_fix','            
      Install Security Update KB4012213 for Microsoft Windows SMB Server.
      Download Patch from here: https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
      ' , 'Microsoft Windows Server 2012 R2 PCI-DSS_2012','Profile Customized by CloudRaxak','WN12-SO-000010','C-58479r1_chk','Open Control Panel next go to Programs  and then go to Programs and Features. Click on View installed Updates and check security updates.       
        Check KB4012213 Critical Patch is Installed. If not then this is a finding.
        ','Customized rule by Cloud Raxak') from dual;
