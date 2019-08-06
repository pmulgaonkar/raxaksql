select add_profile_data ('Microsoft Windows Server 2012 R2 ISO-27002-v1_2012' ,'Profile Customized by CloudRaxak' ,'Windows-based OS','' ,'2015-06-16' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-26529','SV-53013r2_rule','default','medium','The system must be configured to audit Account Logon - Credential Validation successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential validation records events related to validation tests on credentials for a user account logon.','F-45940r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Credential Validation" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000001','C-47320r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Logon -> Credential Validation - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26530','SV-53011r2_rule','default','medium','The system must be configured to audit Account Logon - Credential Validation failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential validation records events related to validation tests on credentials for a user account logon.','F-45938r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Credential Validation" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000002','C-47318r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Logon -> Credential Validation - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26531','SV-52234r3_rule','default','medium','The system must be configured to audit Account Management - Computer Account Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Computer Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling computer accounts.','F-45249r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Computer Account Management" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000011','C-46972r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Computer Account Management - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26532','SV-52235r3_rule','default','medium','The system must be configured to audit Account Management - Computer Account Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Computer Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling computer accounts.','F-45250r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Computer Account Management" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000012','C-46973r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Computer Account Management - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26533','SV-53009r1_rule','default','medium','The system must be configured to audit Account Management - Other Account Management Events successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Other Account Management Events records events such as the access of a password hash or the Password Policy Checking API being called.','F-45936r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Other Account Management Events" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000015','C-47317r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Other Account Management Events - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26534','SV-53008r1_rule','default','medium','The system must be configured to audit Account Management - Other Account Management Events failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Other Account Management Events records events such as the access of a password hash or the Password Policy Checking API being called.','F-45935r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Other Account Management Events" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000016','C-47315r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Other Account Management Events - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26535','SV-53007r2_rule','default','medium','The system must be configured to audit Account Management - Security Group Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security Group Management records events such as creating, deleting, or changing security groups, including changes in group members.','F-45934r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Security Group Management" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000017','C-47314r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Security Group Management - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26536','SV-53005r2_rule','default','medium','The system must be configured to audit Account Management - Security Group Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security Group Management records events such as creating, deleting, or changing security groups, including changes in group members.','F-45932r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Security Group Management" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000018','C-47312r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Security Group Management - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26537','SV-53003r2_rule','default','medium','The system must be configured to audit Account Management - User Account Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.','F-45930r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit User Account Management" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000019','C-47310r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> User Account Management - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26538','SV-53001r2_rule','default','medium','The system must be configured to audit Account Management - User Account Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.','F-45928r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit User Account Management" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000020','C-47308r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> User Account Management - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26539','SV-52999r1_rule','default','medium','The system must be configured to audit Detailed Tracking - Process Creation successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Process Creation records events related to the creation of a process and the source.','F-45926r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Detailed Tracking -> "Audit Process Creation" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000023','C-47306r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Detailed Tracking -> Process Creation - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26540','SV-52996r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logoff successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logoff records user logoffs.  If this is an interactive logoff, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45923r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logoff" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000045','C-47303r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logoff - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26541','SV-52994r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logon successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logon records user logons.  If this is an interactive logon, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45921r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logon" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000047','C-47301r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logon - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26542','SV-52993r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logon failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logon records user logons.  If this is an interactive logon, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45920r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logon" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000048','C-47300r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logon - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26543','SV-52987r1_rule','default','medium','The system must be configured to audit Logon/Logoff - Special Logon successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Special Logon records special logons which have administrative privileges and can be used to elevate processes.','F-45913r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Special Logon" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000053','C-47293r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Special Logon - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26546','SV-52983r1_rule','default','medium','The system must be configured to audit Policy Change - Audit Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.','F-45909r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Audit Policy Change" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000085','C-47289r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Audit Policy Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26547','SV-52982r1_rule','default','medium','The system must be configured to audit Policy Change - Audit Policy Change failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.','F-45908r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Audit Policy Change" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000086','C-47288r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Audit Policy Change - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26548','SV-52981r1_rule','default','medium','The system must be configured to audit Policy Change - Authentication Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Authentication Policy Change records events related to changes in authentication policy, including Kerberos policy and Trust changes.','F-45907r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Authentication Policy Change" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000087','C-47287r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Authentication Policy Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26549','SV-52980r1_rule','default','medium','The system must be configured to audit Privilege Use - Sensitive Privilege Use successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Sensitive Privilege Use records events related to use of sensitive privileges, such as "Act as part of the operating system" or "Debug programs".','F-45906r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Privilege Use -> "Audit Sensitive Privilege Use" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000101','C-47286r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Privilege Use -> Sensitive Privilege Use - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26550','SV-52979r1_rule','default','medium','The system must be configured to audit Privilege Use - Sensitive Privilege Use failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Sensitive Privilege Use records events related to use of sensitive privileges, such as "Act as part of the operating system" or "Debug programs".','F-45905r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Privilege Use -> "Audit Sensitive Privilege Use" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000102','C-47285r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Privilege Use -> Sensitive Privilege Use - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26551','SV-52978r1_rule','default','medium','The system must be configured to audit System - IPsec Driver successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

IPsec Driver records events related to the IPSec Driver such as dropped packets.','F-45904r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit IPsec Driver" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000103','C-47284r2_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> IPsec Driver - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26552','SV-52977r1_rule','default','medium','The system must be configured to audit System - IPsec Driver failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

IPsec Driver records events related to the IPsec Driver such as dropped packets.','F-45903r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit IPsec Driver" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000104','C-47283r2_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> IPsec Driver - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26553','SV-52976r1_rule','default','medium','The system must be configured to audit System - Security State Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security State Change records events related to changes in the security state, such as startup and shutdown of the system.','F-45902r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security State Change" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000107','C-47282r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security State Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26554','SV-52975r1_rule','default','medium','The system must be configured to audit System - Security State Change failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security State Change records events related to changes in the security state, such as startup and shutdown of the system.','F-45901r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security State Change" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000108','C-47281r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security State Change - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26555','SV-52974r1_rule','default','medium','The system must be configured to audit System - Security System Extension successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security System Extension records events related to extension code being loaded by the security subsystem.','F-45900r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security System Extension" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000109','C-47280r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security System Extension - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26556','SV-52973r1_rule','default','medium','The system must be configured to audit System - Security System Extension failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security System Extension records events related to extension code being loaded by the security subsystem.','F-45899r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security System Extension" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000110','C-47279r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security System Extension - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26558','SV-52971r1_rule','default','medium','The system must be configured to audit System - System Integrity failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

System Integrity records events related to violations of integrity to the security subsystem.','F-45897r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit System Integrity" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000112','C-47277r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> System Integrity - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57633','SV-72043r1_rule','default','medium','The system must be configured to audit Policy Change - Authorization Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Authorization Policy Change records events related to changes in user rights, such as Create a token object.','F-62835r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Authorization Policy Change" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000089','C-58455r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Authorization Policy Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14229','SV-52943r1_rule','default','medium','Auditing of Backup and Restore Privileges must be turned off.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
This setting prevents the system from generating audit events for every file backed up or restored, which could fill the security log in Windows, making it difficult to identify actual issues.','F-45869r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Audit: Audit the use of Backup and Restore privilege" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000008','C-47249r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: FullPrivilegeAuditing

Value Type: REG_BINARY
Value: 00','Customized rule by Cloud Raxak') from dual;
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

Altenative method : 

Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> â€œAudit: Shut down system immediately if unable to log security auditsâ€? to â€œDisabledâ€?.
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 

Registry Path: HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa
Value Name: CrashOnAuditFail
Value Type: REG_DWORD 
Value: 0 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57635','SV-72045r1_rule','default','medium','The system must be configured to audit Policy Change - Authorization Policy Change failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Authorization Policy Change records events related to changes in user rights, such as Create a token object.','F-62837r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Authorization Policy Change" with "Failure" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000090','C-58457r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Authorization Policy Change - Failure','Customized rule by Cloud Raxak') from dual;
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Unicast response, "Allow unicast response" to "No"' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 
Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local connection security rules:" to "Yes(Default)"' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy:

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local Firewall rules:" to "Yes".
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes (default)".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Firewall state" to "On (recommended)".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Inbound connections" to "Block (default)"             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Outbound connections" to "Allow (default)" ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy:

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Unicast response, "Allow unicast response" to "No".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local connection security rules:" to "Yes(Default)".
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local firewall rules:" to "Yes"(Default).
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes (default)" ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> State, "Firewall state" to "On (recommended)"
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Private Profile Tab -> State, "Inbound connections" to "Block (default)".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Private Profile Tab -> State, "Outbound connections" to "Allow (default)".
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> Settings (select Customize) -> Unicast response, "Allow unicast response" to "No" ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local connection security rules:" to "No".
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local firewall rules:" to "No".
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> State,"Firewall state" to ON.
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> State, "Inbound connections" to "Block (default)".
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> State, "Outbound connections" to "Allow (default)".
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
                          If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: DefaultOutboundAction

Type: REG_DWORD
Value: 0 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1102','SV-52108r2_rule','default','high','Unauthorized accounts must not have the Act as part of the operating system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Act as part of the operating system" user right can assume the identity of any user and gain access to resources that user is authorized to access.  Any accounts with this right can take complete control of a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45133r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Act as part of the operating system" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000003','C-46925r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups (to include administrators), are granted the "Act as part of the operating system" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-18010','SV-52115r2_rule','default','high','Unauthorized accounts must not have the Debug programs user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Debug programs" user right can attach a debugger to any process or to the kernel, providing complete access to sensitive and critical operating system components.  This right is given to Administrators in the default configuration.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45140r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Debug programs" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000016','C-46932r1_chk','Verify the effective setting in Local Group Policy Editor.
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

' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000017-MS','C-58025r2_chk','Verify the effective setting in Local Group Policy Editor.
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
select add_rule_data ('default','V-26469','SV-53120r1_rule','default','medium','Unauthorized accounts must not have the Access Credential Manager as a trusted caller user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access Credential Manager as a trusted caller" user right may be able to retrieve the credentials of other accounts from Credential Manager.','F-46046r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Access Credential Manager as a trusted caller" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000001','C-47426r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Access Credential Manager as a trusted caller" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26470','SV-51499r3_rule','default','medium','Unauthorized accounts must not have the Access this computer from the network user right on member servers.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access this computer from the network" user right may access resources on the system, and must be limited to those that require it.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-49518r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Access this computer from the network" to only include the following accounts or groups:

Administrators
Authenticated Users

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000002-MS','C-49426r2_chk','Verify the effective setting in Local Group Policy Editor.
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
Network Service' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000004','C-46926r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Adjust memory quotas for a process" user right, this is a finding:

Administrators
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26472','SV-52110r2_rule','default','medium','Unauthorized accounts must not have the Allow log on locally user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Allow log on locally" user right can log on interactively to a system.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45135r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Allow log on locally" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000005','C-46927r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Allow log on locally" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26473','SV-53119r1_rule','default','medium','Unauthorized accounts must not have the Allow log on through Remote Desktop Services user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Allow log on through Remote Desktop Services" user right can access a system through Remote Desktop.','F-46045r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Allow log on through Remote Desktop Services" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000006','C-47425r1_chk','Verify the effective setting in Local Group Policy Editor.
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

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000007','C-46928r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Back up files and directories" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26475','SV-52112r2_rule','default','low','Unauthorized accounts must not have the Bypass traverse checking user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Bypass traverse checking" user right can pass through folders when browsing even if they do not have the "Traverse Folder" access permission. They could potentially view sensitive file and folder names.  They would not have additional access to the files and folders unless it is granted through permissions.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45137r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Bypass traverse checking" to only include the following accounts or groups:

Administrators
Authenticated Users
Local Service
Network Service
Window Manager\Window Manager Group

Windows 2008 R2:
Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Bypass traverse checking" to only include the following accounts or groups:

Administrators
Authenticated Users
Local Service
Network Service
' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000008','C-46929r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Bypass traverse checking" user right, this is a finding:

Administrators
Authenticated Users
Local Service
Network Service
Window Manager\Window Manager Group','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26476','SV-53118r1_rule','default','medium','Unauthorized accounts must not have the Change the system time user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the system time" user right can change the system time, which can impact authentication, as well as affect time stamps on event log entries.','F-46044r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the system time" to only include the following accounts or groups:

Administrators
Local Service' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000009','C-47424r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the system time" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26477','SV-53117r1_rule','default','low','Unauthorized accounts must not have the Change the time zone user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the time zone" user right can change the time zone of a system.','F-46043r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the time zone" to only include the following accounts or groups:

Administrators
Local Service' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000010','C-47423r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the time zone" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26478','SV-53063r1_rule','default','medium','Unauthorized accounts must not have the Create a pagefile user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create a pagefile" user right can change the size of a pagefile, which could affect system performance.','F-45989r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create a pagefile" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000011','C-47369r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create a pagefile" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26479','SV-52113r2_rule','default','high','Unauthorized accounts must not have the Create a token object user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Create a token object" user right allows a process to create an access token. This could be used to provide elevated rights and compromise a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45138r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create a token object" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000012','C-46930r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Create a token object" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26481','SV-53059r1_rule','default','medium','Unauthorized accounts must not have the Create permanent shared objects user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create permanent shared objects" user right could expose sensitive data by creating shared objects.','F-45985r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create permanent shared objects" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000014','C-47365r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Create permanent shared objects" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26482','SV-53054r2_rule','default','medium','Unauthorized accounts must not have the Create symbolic links user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create symbolic links" user right can create pointers to other objects, which could potentially expose the system to attack.','F-66511r1_fix','Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Create symbolic links" to only include the following accounts or groups:

Administrators

Systems that have the Hyper-V role will also have "Virtual Machines" given this user right.  If this needs to be added manually, enter it as "NT Virtual Machine\Virtual Machines".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000015','C-61747r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create symbolic links" user right, this is a finding:

Administrators

Systems that have the Hyper-V role will also have "Virtual Machines" given this user right (this may be displayed as "NT Virtual Machine\Virtual Machines").  This is not a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26483','SV-51502r1_rule','default','medium','The Deny log on as a batch job user right on member servers must be configured to prevent access from highly privileged domain accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on as a batch job" user right defines accounts that are prevented from logging on to the system as a batch job such, as Task Scheduler.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

The Guests group must be assigned to prevent unauthenticated access.','F-44652r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny log on as a batch job" to include the following:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

All Systems:
Guests Group' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000018-MS','C-46807r1_chk','Verify the effective setting in Local Group Policy Editor.
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
Guests Group' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000020-MS','C-49587r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on locally" user right, this is a finding:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from this.

All Systems:
Guests Group','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26486','SV-51509r3_rule','default','medium','The Deny log on through Remote Desktop Services user right on member servers must be configured to prevent access from highly privileged domain accounts and local administrator accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on through Remote Desktop Services" user right defines the accounts that are prevented from logging on using Remote Desktop Services.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

Local administrator accounts on domain-joined systems must also be assigned this right to decrease the risk of lateral movement resulting from credential theft attacks.

The Guests group must be assigned this right to prevent unauthenticated access.','F-62389r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny log on through Remote Desktop Services" to include the following:

Domain Systems Only:
Enterprise Admins group
Domain Admins group
*All Local Administrator Accounts:
*Systems with the new built-in security groups - use "Local account" or "Local account and member of Administrators group".
**Systems that do not have the new built-in security groups - use the "DenyNetworkAccess" or "DeniedNetworkAccess" group (see V-45589).
Do not use the built-in Administrators group. This group must contain the appropriate accounts/groups responsible for administering the system.

All Systems:
Guests group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from denying the Enterprise Admins and Domain Admins groups.

*Windows 8.1 and Windows Server 2012 R2 added new built-in security groups, "Local account" and "Local account and member of Administrators group" for assigning permissions and rights to local accounts.
Microsoft Security Advisory Patch 2871997 adds these groups to Windows 7, Windows 8, Windows Server 2008 R2 and Windows Server 2012.
Assign the group "Local account and member of Administrators group" or the more restrictive "Local account".

**Documentation and scripts supporting the use of this group to restrict local administrative accounts was changed at one point.  The original name "DeniedNetworkAccess", was changed to "DenyNetworkAccess".

Automated benchmarks will look for these groups.  Use of other methods will require manual validation.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000021-MS','C-58027r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on through Remote Desktop Services" user right, this is a finding:

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

*Windows 8.1 and Windows Server 2012 R2 added new built-in security groups, "Local account" and "Local account and member of Administrators group" for assigning permissions and rights to local accounts.
Microsoft Security Advisory Patch 2871997 adds these groups to Windows 7, Windows 8, Windows Server 2008 R2 and Windows Server 2012.
Assign the group "Local account and member of Administrators group" or the more restrictive "Local account".

**Documentation and scripts supporting the use of this group to restrict local administrative accounts was changed at one point.  The original name "DeniedNetworkAccess", was changed to "DenyNetworkAccess".

Automated benchmarks will look for these groups.  Use of other methods will require manual validation.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26487','SV-51500r1_rule','default','medium','Unauthorized accounts must not have the Enable computer and user accounts to be trusted for delegation user right on member servers.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Enable computer and user accounts to be trusted for delegation" user right allows the "Trusted for Delegation" setting to be changed.  This could potentially allow unauthorized users to impersonate other users.','F-44649r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Enable computer and user accounts to be trusted for delegation" to be defined but containing no entries (blank).

Windows 2008R2:

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Enable computer and user accounts to be trusted for delegation" to only include the following accounts or groups:
      Administrators

' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000022-MS','C-46805r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Enable computer and user accounts to be trusted for delegation" user right, this is a finding.

Windows 2008R2:

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.
If any user accounts or groups other than the following are granted the "Enable computer and user accounts to be trusted for delegation" right, this is a finding:
Administrators

','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26488','SV-53050r1_rule','default','medium','Unauthorized accounts must not have the Force shutdown from a remote system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Force shutdown from a remote system" user right can remotely shut down a system, which could result in a DoS.','F-45976r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Force shutdown from a remote system" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000023','C-47356r1_chk','Verify the effective setting in Local Group Policy Editor.
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
Network Service' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000024','C-46933r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Generate security audits" user right, this is a finding:

Local Service
Network Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26491','SV-53047r1_rule','default','medium','Unauthorized accounts must not have the Increase a process working set user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Increase a process working set" user right can change the size of a process"s working set, potentially causing performance issues or a DoS.','F-45973r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Increase a process working set" to only include the following accounts or groups:

Administrators
Local Service
Window Manager\Window Manager Group' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000026','C-47353r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Increase a process working set" user right, this is a finding:

Administrators
Local Service
Window Manager\Window Manager Group','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26492','SV-52118r2_rule','default','medium','Unauthorized accounts must not have the Increase scheduling priority user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Increase scheduling priority" user right can change a scheduling priority causing performance issues or a DoS.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45143r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Increase scheduling priority" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000027','C-46936r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Increase scheduling priority" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26493','SV-53043r1_rule','default','medium','Unauthorized accounts must not have the Load and unload device drivers user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Load and unload device drivers" user right allows device drivers to dynamically be loaded on a system by a user.  This could potentially be used to install malicious code by an attacker.','F-45969r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Load and unload device drivers" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000028','C-47349r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Load and unload device drivers" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26494','SV-52119r2_rule','default','medium','Unauthorized accounts must not have the Lock pages in memory user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Lock pages in memory" user right allows physical memory to be assigned to processes, which could cause performance issues or a DoS.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45144r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Lock pages in memory" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000029','C-46937r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Lock pages in memory" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26495','SV-52120r2_rule','default','medium','Unauthorized accounts must not have the Log on as a batch job user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Log on as a batch job" user right allows accounts to log on using the task scheduler service, which must be restricted.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45145r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Log on as a batch job" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000030','C-46938r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Log on as a batch job" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26496','SV-53039r2_rule','default','medium','Unauthorized accounts must not have the Manage auditing and security log user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Manage auditing and security log" user right can manage the security log and change auditing configurations.  This could be used to clear evidence of tampering.','F-45965r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Manage auditing and security log" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000032','C-47345r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Manage auditing and security log" user right, this is a finding:

Administrators

If the site has an Auditors group that further limits this privilege this would not be a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26497','SV-53033r1_rule','default','medium','Unauthorized accounts must not have the Modify an object label user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Modify an object label" user right can change the integrity label of an object.  This could potentially be used to execute code at a higher privilege.','F-45958r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Modify an object label" to be defined but containing no entries (blank).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000033','C-47338r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Modify an object label" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26499','SV-53025r1_rule','default','medium','Unauthorized accounts must not have the Perform volume maintenance tasks user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Perform volume maintenance tasks" user right can manage volume and disk configurations.  They could potentially delete volumes, resulting in data loss or a DoS.','F-45951r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Perform volume maintenance tasks" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000035','C-47330r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Perform volume maintenance tasks" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26500','SV-53022r1_rule','default','medium','Unauthorized accounts must not have the Profile single process user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile single process" user right can monitor nonsystem processes performance.  An attacker could potentially use this to identify processes to attack.','F-45948r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Profile single process" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000036','C-47328r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Profile single process" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26501','SV-53019r1_rule','default','medium','Unauthorized accounts must not have the Profile system performance user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile system performance" user right can monitor system processes performance.  An attacker could potentially use this to identify processes to attack.','F-45945r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Profile system performance" to only include the following accounts or groups:

Administrators
NT Service\WdiServiceHost' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000037','C-47325r1_chk','Verify the effective setting in Local Group Policy Editor.
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

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000040','C-46940r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Restore files and directories" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26505','SV-53016r1_rule','default','medium','Unauthorized accounts must not have the Shut down the system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Shut down the system" user right can interactively shut down a system, which could result in a DoS.','F-45943r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Shut down the system" to only include the following accounts or groups:

Administrators' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-UR-000041','C-47323r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Shut down the system" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15672','SV-53017r1_rule','default','low','Event Viewer Events.asp links must be turned off.','Viewing events is a function of administrators, who must not access the internet with privileged accounts.  This setting will disable  Events.asp hyperlinks in Event Viewer to prevent links to the internet from within events.','F-45944r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> "Turn off Event Viewer "Events.asp" links" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000033','C-47324r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\EventViewer\

Value Name: MicrosoftEventVwrDisableLinks

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56373','SV-50462r1_rule','default','high','
                   System Event Log must be configured to retained old events when the log file reaches its maximum size.
             ','
                     This rule setting controls Event Log behavior when the log file reaches its maximum size. Old events may or may not be retained according to the â€œBackup log automatically when fullâ€? policy setting. The default setting for this rule is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\System 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 

Altenative method :

Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> Control Event Log behavior when the log file reaches its maximum size to Enabled Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> Back up log automatically when full to Enabled
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 


Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\System

Value Name: AutoBackupLogFiles
Value Name: Retention

Type: REG_SZ
Value: 1 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56370','SV-50462r1_rule','default','high','
                  Security Event Log must be configured to retained old events when the log file reaches its maximum size.
             ','
                     This rule setting controls Event Log behaviour when the log file reaches its maximum size. Old events may or may not be retained according to the â€œBackup log automatically when fullâ€? policy setting. The default setting for this rule is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Security 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 

Altenative method : 

Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security-> Control Event Log behavior when the log file reaches its maximum size" to Enabled "Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security-> Back up log automatically when full" to Enabled
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding: 
Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Security

Value Name: AutoBackupLogFiles
Value Name: Retention

Type: REG_SZ
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56364','SV-50462r1_rule','default','high','
                   Application Event Log must be configured to retained old events when the log file reaches its maximum size.
             ','
                     This rule setting controls Event Log behavior when the log file reaches its maximum size. Old events may or may not be retained according to the â€œBackup log automatically when fullâ€? policy setting. The default setting for this rule is Disabled.
             ','F-56000','
                     Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Application 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 

Altenative method : 

"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> Control Event Log behavior when the log file reaches its maximum size" to Enabled "Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> Back up log automatically when full" to Enabled.
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding: 


Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Application

Value Name: AutoBackupLogFiles
Value Name: Retention

Type: REG_SZ
Value: 1
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36712','SV-51752r1_rule','default','high','The Windows Remote Management (WinRM) client must not use Basic authentication.','Basic authentication uses plain text passwords that could be used to compromise a system.','F-44827r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Client -> "Allow Basic authentication" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000123','C-46881r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowBasic

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36714','SV-51754r1_rule','default','medium','The Windows Remote Management (WinRM) client must not use Digest authentication.','Digest authentication is not as strong as other options and may be subject to man-in-the-middle attacks.','F-44829r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Client -> "Disallow Digest authentication" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000125','C-46883r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowDigest

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36718','SV-51755r2_rule','default','high','The Windows Remote Management (WinRM) service must not use Basic authentication.','Basic authentication uses plain text passwords that could be used to compromise a system.','F-44830r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Service -> "Allow Basic authentication" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000126','C-46884r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Service\

Value Name: AllowBasic

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36720','SV-51757r1_rule','default','medium','The Windows Remote Management (WinRM) service must not store RunAs credentials.','Storage of administrative credentials could allow unauthorized access.  Disallowing the storage of RunAs credentials for Windows Remote Management will prevent them from being used with plug-ins.','F-44832r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Service -> "Disallow WinRM from storing RunAs credentials" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000128','C-46886r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Service\

Value Name: DisableRunAs

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
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
System\CurrentControlSet\Services\Sysmonlog' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000057','C-47236r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

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
select add_rule_data ('default','V-3339','SV-52883r2_rule','default','high','Unauthorized remotely accessible registry paths must not be configured.','The registry is integral to the function, security, and stability of the Windows system.  Some processes may require remote access to the registry.  This setting controls which registry paths are accessible from a remote computer.  These registry paths must be limited, as they could give unauthorized individuals access to the registry.','F-45809r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Remotely accessible registry paths" with the following entries:

System\CurrentControlSet\Control\ProductOptions
System\CurrentControlSet\Control\Server Applications
Software\Microsoft\Windows NT\CurrentVersion' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000056','C-47200r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\

Value Name: Machine

Value Type: REG_MULTI_SZ
Value: see below

System\CurrentControlSet\Control\ProductOptions
System\CurrentControlSet\Control\Server Applications
Software\Microsoft\Windows NT\CurrentVersion

Legitimate applications may add entries to this registry value.  If an application requires these entries to function properly and is documented with the ISSO, this would not be a finding. Documentation must contain supporting information from the vendor"s instructions.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15700','SV-53094r1_rule','default','medium','Remote access to the Plug and Play interface must be disabled for device installation.','Remote access to the Plug and Play interface could potentially allow connections by unauthorized devices.  This setting configures remote access to the Plug and Play interface and must be disabled.','F-46020r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Device Installation -> "Allow remote access to the Plug and Play interface" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000019','C-47400r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\DeviceInstall\Settings\

Value Name: AllowRemoteRPC

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15698','SV-53085r1_rule','default','medium','The configuration of wireless devices using Windows Connect Now must be disabled.','Windows Connect Now allows the discovery and configuration of devices over wireless.  Wireless devices must be managed.  If a rogue device is connected to a system, there is potential for sensitive information to be compromised.','F-46011r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Windows Connect Now -> "Configuration of wireless settings using Windows Connect Now" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000012','C-47391r2_chk','If the following registry values do not exist or are not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WCN\Registrars\

Value Name: DisableFlashConfigRegistrar
Value Name: DisableInBand802DOT11Registrar
Value Name: DisableUPnPRegistrar
Value Name: DisableWPDRegistrar
Value Name: EnableRegistrars

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15699','SV-53089r1_rule','default','medium','The Windows Connect Now wizards must be disabled.','Windows Connect Now provides wizards for tasks such as "Set up a wireless router or access point" and must not be available to users.  Functions such as these may allow unauthorized connections to a system and the potential for sensitive information to be compromised.','F-46015r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Windows Connect Now -> "Prohibit access of the Windows Connect Now wizards" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000013','C-47395r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WCN\UI\

Value Name: DisableWcnUi

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26582','SV-52963r1_rule','default','medium','The System event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45889r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000087','C-47269r2_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\System\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768 or greater','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26581','SV-52964r1_rule','default','medium','The Setup event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45890r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Setup -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000086','C-47270r2_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Setup\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26580','SV-52965r1_rule','default','medium','The Security event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45891r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security -> "Specify the maximum log size (KB)" to at minimum "Enabled:196608".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000085','C-47271r3_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Security\

Value Name:  MaxSize

Type: REG_DWORD
Value: 196608 or greater','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14234','SV-52946r1_rule','default','medium','User Account Control approval mode for the built-in Administrator must be enabled.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures the built-in Administrator account so that it runs in Admin Approval Mode.','F-45872r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Admin Approval Mode for the Built-in Administrator account" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000077','C-47252r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: FilterAdministratorToken

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14235','SV-52947r1_rule','default','medium','User Account Control must, at minimum, prompt administrators for consent.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures the elevation requirements for logged on administrators to complete a task that requires raised privileges.','F-45873r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode" to "Prompt for consent".

More secure options for this setting would also be acceptable (e.g., Prompt for credentials, Prompt for consent (or credentials) on the secure desktop).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000078','C-47253r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorAdmin

Value Type: REG_DWORD
Value: 4 (Prompt for consent)
3 (Prompt for credentials)
2 (Prompt for consent on the secure desktop)
1 (Prompt for credentials on the secure desktop)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14236','SV-52948r1_rule','default','medium','User Account Control must automatically deny standard user requests for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting controls the behavior of elevation when requested by a standard user account.','F-45874r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Behavior of the elevation prompt for standard users" to "Automatically deny elevation requests".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000079','C-47254r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorUser

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14237','SV-52949r1_rule','default','medium','User Account Control must be configured to detect application installations and prompt for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting requires Windows to respond to application installation requests by prompting for credentials.','F-45875r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Detect application installations and prompt for elevation" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000080','C-47255r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableInstallerDetection

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14239','SV-52950r1_rule','default','medium','User Account Control must only elevate UIAccess applications that are installed in secure locations.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures Windows to only allow applications installed in a secure location on the file system, such as the Program Files or the Windows\System32 folders, to run with elevated privileges.','F-45876r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Only elevate UIAccess applications that are installed in secure locations" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000082','C-47256r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableSecureUIAPaths

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14240','SV-52951r1_rule','default','medium','User Account Control must run all administrators in Admin Approval Mode, enabling UAC.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting enables UAC.','F-45877r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Run all administrators in Admin Approval Mode" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000083','C-47257r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableLUA

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14241','SV-52952r1_rule','default','medium','User Account Control must switch to the secure desktop when prompting for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting ensures that the elevation prompt is only used in secure desktop mode.','F-45878r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Switch to the secure desktop when prompting for elevation" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000084','C-47258r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: PromptOnSecureDesktop

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14242','SV-52953r1_rule','default','medium','User Account Control must virtualize file and registry write failures to per-user locations.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures non-UAC-compliant applications to run in virtualized file and registry entries in per-user locations, allowing them to run.','F-45879r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Virtualize file and registry write failures to per-user locations" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000085','C-47259r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableVirtualization

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-16008','SV-53142r1_rule','default','medium','Windows must elevate all applications in User Account Control, not just signed ones.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures whether Windows elevates all applications, or only signed ones.','F-46068r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Only elevate executables that are signed and validated" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000081','C-47448r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ValidateAdminCodeSignatures

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15991','SV-52223r2_rule','default','medium','UIAccess applications must not be allowed to prompt for elevation without using the secure desktop.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting prevents User Interface Accessibility programs from disabling the secure desktop for elevation prompts.','F-45241r1_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000086','C-46966r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableUIADesktopToggle

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3380','SV-52893r1_rule','default','medium','The system must be configured to force users to log off when their allowed logon hours expire.','Limiting logon hours can help protect data by only allowing access during specified times.  This setting controls whether or not users are forced to log off when their allowed logon hours expire.  If logon hours are set for users, this must be enforced.','F-45819r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Force logoff when logon hours expire" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000066','C-47210r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Network security: Force logoff when logon hours expire" is not set to "Enabled", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1099','SV-52850r1_rule','default','medium','The lockout duration must be configured to require an administrator to unlock an account.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  This parameter specifies the period of time that an account will remain locked after the specified number of failed logon attempts.  A value of 0 will require an administrator to unlock the account.','F-45776r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout duration" to "0" minutes, "Account is locked out until administrator unlocks it".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AC-000001','C-47167r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Account lockout duration" is not set to "0", requiring an administrator to unlock the account, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1097','SV-52848r1_rule','default','medium','The number of allowed bad logon attempts must meet minimum requirements.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  The higher this value is, the less effective the account lockout feature will be in protecting the local system.  The number of bad logon attempts must be reasonably small to minimize the possibility of a successful password attack, while allowing for honest errors made during a normal user logon.','F-45774r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout threshold" to "3" or less invalid logon attempts (excluding "0" which is unacceptable).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AC-000002','C-47165r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Account lockout threshold" is "0" or more than "3" attempts, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1098','SV-52849r1_rule','default','medium','The period of time before the bad logon counter is reset must meet minimum requirements.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  This parameter specifies the period of time that must pass after failed logon attempts before the counter is reset to 0.  The smaller this value is, the less effective the account lockout feature will be in protecting the local system.','F-45775r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Reset account lockout counter after" to at least "60" minutes.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AC-000003','C-47166r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Reset account lockout counter after" value is less than "60" minutes, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1089','SV-52845r2_rule','default','medium','The required legal notice must be configured to display before console logon.','Failure to display the logon banner prior to a logon attempt will negate legal proceedings resulting from unauthorized access to system resources.','F-45771r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Message text for users attempting to log on" to the following:

You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.

By using this IS (which includes any device attached to this IS), you consent to the following conditions:

-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations.

-At any time, the USG may inspect and seize data stored on this IS.

-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.

-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.

-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants.  Such communications and work product are private and confidential.  See User Agreement for details.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000022','C-47162r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

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
select add_rule_data ('default','V-26359','SV-53121r2_rule','default','low','The Windows dialog box title for the legal banner must be configured.','Failure to display the logon banner prior to a logon attempt will negate legal proceedings resulting from unauthorized access to system resources.','F-46047r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Message title for users attempting to log on" to "DoD Notice and Consent Banner", "US Department of Defense Warning Statement", or a site-defined equivalent.

If a site-defined title is used, it can in no case contravene or modify the language of the banner text required in V-1089.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000023','C-47427r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: LegalNoticeCaption

Value Type: REG_SZ
Value: See message title options below

"DoD Notice and Consent Banner", "US Department of Defense Warning Statement", or a site-defined equivalent.

If a site-defined title is used, it can in no case contravene or modify the language of the banner text required in V-1089.

Automated tools may only search for the titles defined above. If a site-defined title is used, a manual review will be required.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3449','SV-52216r2_rule','default','medium','Remote Desktop Services must limit users to one remote session.','Allowing multiple Remote Desktop Services sessions could consume resources.  There is also potential to make a secondary connection to a system with compromised credentials.','F-45235r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Connections -> "Restrict Remote Desktop Services users to a single Remote Desktop Services Session" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000131','C-46962r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fSingleSessionPerUser

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36773','SV-51596r1_rule','default','medium','The machine inactivity limit must be set to 15 minutes, locking the system with the screensaver.','Unattended systems are susceptible to unauthorized use and should be locked when unattended.  The screen saver should be set at a maximum of 15 minutes and be password protected.  This protects critical and sensitive data from exposure to unauthorized personnel with physical access to the computer.','F-44717r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Machine inactivity limit" to "900" seconds" or less.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000021','C-46851r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: InactivityTimeoutSecs

Value Type: REG_DWORD
Value: 0x00000384 (900) (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-4442','SV-52930r1_rule','default','low','The system must be configured to have password protection take effect within a limited time frame when the screen saver becomes active.','Allowing more than several seconds makes the computer vulnerable to a potential attack from someone walking up to the console to attempt to log on to the system before the lock takes effect.','F-45856r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)" to "5" or less.

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000046','C-47235r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: ScreenSaverGracePeriod

Value Type: REG_SZ
Value: 5 (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1174','SV-52878r2_rule','default','low','The amount of idle time required before suspending a session must be properly set.','Open sessions can increase the avenues of attack on a system.  This setting is used to control when a computer disconnects an inactive SMB session.  If client activity resumes, the session is automatically reestablished.  This protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.','F-45804r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Amount of idle time required before suspending a session" to "15" minutes or less.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000031','C-47195r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: AutoDisconnect

Value Type: REG_DWORD
Value: 15 (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3458','SV-52903r2_rule','default','medium','Remote Desktop Services must be configured to disconnect an idle session after the specified time period.','This setting controls how long a session may be idle before it is automatically disconnected from the server.  Users must disconnect if they plan on being away from their terminals for extended periods of time.  Idle sessions must be disconnected after 15 minutes.','F-45829r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Session Time Limits -> "Set time limit for active but idle Remote Desktop Services sessions" to "Enabled", and the "Idle session limit" to 15 minutes or less, excluding "0", which equates to "Never".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000101','C-47220r2_chk','If the following registry value does not exist or its value is set to "0" or greater than "15" minutes, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: MaxIdleTime

Type: REG_DWORD
Value: 0x000dbba0 (900000) or less but not 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3457','SV-52902r2_rule','default','medium','Remote Desktop Services must be configured to set a time limit for disconnected sessions.','This setting controls how long a session will remain open if it is unexpectedly terminated.  Such sessions use system resources and must be terminated as soon as possible.','F-45828r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Session Time Limits -> "Set time limit for disconnected sessions" to "Enabled", and "End a disconnected session" to "1 minute".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000102','C-47219r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: MaxDisconnectionTime

Type: REG_DWORD
Value: 0x0000ea60 (60000)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3456','SV-52901r1_rule','default','medium','Remote Desktop Services must delete temporary folders when a session is terminated.','Remote desktop session temporary folders must always be deleted after a session is over to prevent hard disk clutter and potential leakage of information.  This setting controls the deletion of the temporary folders when the session is terminated.','F-45827r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Temporary Folders -> "Do not delete temp folder upon exit" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000103','C-47218r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: DeleteTempDirsOnExit

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1136','SV-52860r1_rule','default','low','Users must be forcibly disconnected when their logon hours expire.','Users must not be permitted to remain logged on to the network after they have exceeded their permitted logon hours.  In many cases, this indicates that a user forgot to log off before leaving for the day.  However, it may also indicate that a user is attempting unauthorized access at a time when the system may be less closely monitored.  Forcibly disconnecting users when logon hours expire protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.','F-45786r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Disconnect clients when logon hours expire" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000034','C-47177r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: EnableForcedLogoff

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56511','SV-71667r1_rule','default','medium','The Windows Error Reporting Service must be running and configured to start automatically.','Windows Error Reporting information can be used to help diagnose day-to-day software issues, as well as help discover malicious code and possibly zero-day attacks on systems.','F-62433r2_fix','Configure the Start Type of the Windows Error Reporting Service to "Automatic" and ensure the service has a status of "Running".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000001','C-58069r2_chk','Verify the Start Type and Status of the Windows Error Reporting Service.

Run "Services.msc".
If the Windows Error Reporting Service does not have a Status of "Running" and a Start Type of "Automatic", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57473','SV-71941r1_rule','default','medium','The maximum number of error reports to queue on a system must be configured to 50 or greater.','The error reporting queue is stored locally on the system and contains the error reports until they have been manually removed or automatically sent to the local collector or DOD-wide collector (if defined).  Once a report has been sent to a collector, it is moved to the report archive.  Old reports are deleted as new ones arrive once the maximum limit has been met.','F-62747r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Advanced Error Reporting Settings -> "Configure Report Queue" to "Enabled" with "Maximum number of reports to queue:" set to "50" or greater.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000015','C-58379r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  MaxQueueCount

Type:  REG_DWORD
Value:  0x00000032 (50)  (or greater)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57471','SV-71931r1_rule','default','medium','The system must be configured to add all error reports to the queue.','Error reports are queued for sending to an error reporting site when the queueing behavior is set to Always Queue.  This will maintain the reports in the queue until a connection can be made to the collection server.','F-62737r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Advanced Error Reporting Settings -> "Configure Report Queue" to "Enabled" with "Queuing behavior:" to "Always queue".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000014','C-58369r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  ForceQueue

Type:  REG_DWORD
Value:  1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57465','SV-71899r1_rule','default','medium','The system must be configured to store all data in the error report archive.','The error reporting archive is stored locally on the system and is created after an error report has been sent to the local collector or DOD-wide collector (if defined).  Storing all data, including memory contents, adds data that is very helpful in analyzing the errors.','F-62707r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Advanced Error Reporting Settings -> "Configure Report Archive" to "Enabled" with "Store All" selected for "Archive behavior:".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000011','C-58339r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  ConfigureArchive

Type:  REG_DWORD
Value:  0x00000002 (2)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57479','SV-71971r1_rule','default','medium','The system must be configured to permit the default consent levels of Windows Error Reporting to override any other consent policy setting.','This setting determines the behavior of the "Configure Default Consent" setting in relation to custom consent settings.  Enabling this allows the default consent levels of Windows Error Reporting to always override any other consent policy setting.','F-62777r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Consent -> "Ignore custom consent settings" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000018','C-58409r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent\

Value Name:  DefaultOverrideBehavior

Type:  REG_DWORD
Value:  1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57453','SV-71847r1_rule','default','medium','The system must be configured to collect multiple error reports of the same event type.','Multiple error reports of the same error type are useful in diagnosing potential system configuration issues, as well as intrusion activity.  This setting controls whether error reporting collects additional, second-level report data even if a CAB file containing data about the event types has already been collected.','F-62637r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> "Do not throttle additional data" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000005','C-58277r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  BypassDataThrottling

Type:  REG_DWORD
Value:  1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15717','SV-53136r2_rule','default','medium','The system must be configured to allow a local or DOD-wide collector to request additional error reporting diagnostic data to be sent.','Sending additional error reporting data provides valuable system diagnostic and vulnerability information that would otherwise not be generated nor collected.  This setting controls whether additional data in support of error reports can be sent to a local or DOD-wide reporting site.','F-62513r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> "Do not send additional data" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000004','C-58153r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  DontSendAdditionalData

Type:  REG_DWORD
Value:  0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15714','SV-53135r2_rule','default','medium','The system must be configured to save Error Reporting events and messages to the system event log.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  This setting ensures that Error Reporting events will be saved in the system event log.','F-46061r3_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> "Disable logging" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000003','C-47441r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  LoggingDisabled

Type:  REG_DWORD
Value:  0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15715','SV-71721r1_rule','default','medium','The system must be configured to generate error reports.','Enabling Windows Error Reporting generates information useful to system administrators and forensics analysts for diagnosing system problems and investigating intrusions.  If Windows Error Reporting is turned off, valuable system diagnostic and vulnerability information may be lost.','F-62501r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> "Disable Windows Error Reporting" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000002','C-58139r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  Disabled

Type:  REG_DWORD
Value:  0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57463','SV-71889r1_rule','default','medium','The system must be configured to archive error reports.','The error reporting archive is stored locally on the system, and is created after an error report has been sent to the local collector or DOD-wide collector (if defined).  This creates a backup of the error reporting.','F-62697r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Advanced Error Reporting Settings -> "Configure Report Archive" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000010','C-58329r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  DisableArchive

Type:  REG_DWORD
Value:  0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57467','SV-71909r1_rule','default','medium','The maximum number of error reports to archive on a system must be configured to 100 or greater.','The retention of archived reports provides a history.  Older reports are automatically deleted as new reports are generated once the maximum limit has been met.  The archive is stored locally on the system and is created after the error report has been sent to the local collector or DOD-wide collector (if defined).','F-62717r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Advanced Error Reporting Settings -> "Configure Report Archive" to "Enabled" with "Maximum number of reports to store:" set to "100" or greater.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000012','C-58349r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  MaxArchiveCount

Type:  REG_DWORD
Value:  0x00000064 (100)  (or greater)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36698','SV-51739r1_rule','default','medium','The use of biometrics must be disabled.','Allowing biometrics may bypass required authentication methods.  Biometrics may only be used as an additional authentication factor where an enhanced strength of identity credential is necessary or desirable.  Additional factors must be met per DoD policy.','F-44814r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Biometrics -> "Allow the use of biometrics" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000075','C-46868r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Biometrics\

Value Name: Enabled

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-16000','SV-52230r2_rule','default','medium','The system must be configured to ensure smart card devices can be redirected to the Remote Desktop session.  (Remote Desktop Services Role).','Enabling the redirection of smart card devices allows their use within Remote Desktop sessions.','F-45247r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow smart card device redirection" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000134','C-46970r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fEnableSmartCard

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1157','SV-52867r2_rule','default','medium','The Smart Card removal option must be configured to Force Logoff or Lock Workstation.','Unattended systems are susceptible to unauthorized use and must be locked.  Configuring a system to lock when a smart card is removed will ensure the system is inaccessible when unattended.','F-45793r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Smart card removal behavior" to  "Lock Workstation" or "Force Logoff".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000027','C-47184r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: SCRemoveOption

Value Type: REG_SZ
Value: 1 (Lock Workstation) or 2 (Force Logoff)

If configuring this on servers causes issues such as terminating users" remote sessions and the site has a policy in place that any other sessions on the servers such as administrative console logons, are manually locked or logged off when unattended or not in use, this would be acceptable. This must be documented with the ISSO.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3344','SV-52886r1_rule','default','high','Local accounts with blank passwords must be restricted to prevent access from the network.','An account without a password can allow unauthorized access to a system as only the username would be required.  Password policies should prevent accounts with blank passwords from existing on a system.  However, if a local account with a blank password did exist, enabling this setting will prevent network access, limiting the account to local console logon only.','F-45812r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Limit local account use of blank passwords to console logon only" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000004','C-47203r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: LimitBlankPasswordUse

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-6836','SV-52938r2_rule','default','medium','Passwords must, at a minimum, be 14 characters.','Information systems not protected with strong password schemes (including passwords of minimum length) provide the opportunity for anyone to crack the password, thus gaining access to the system and compromising the device, information, or the local network.','F-45864r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password length" to "14" characters.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AC-000007','C-47243r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password length," is less than "14" characters, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1104','SV-52851r1_rule','default','medium','The maximum password age must meet requirements.','The longer a password is in use, the greater the opportunity for someone to gain unauthorized knowledge of the passwords.   Scheduled changing of passwords hinders the ability of unauthorized system users to crack passwords and gain access to a system.','F-45777r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Maximum password age" to "60" days or less (excluding "0" which is unacceptable).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AC-000005','C-47168r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Maximum password age" is greater than "60" days, this is a finding.  If the value is set to "0" (never expires), this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1107','SV-52853r1_rule','default','medium','The password history must be configured to 24 passwords remembered.','A system is more vulnerable to unauthorized access when system users recycle the same password several times without being required to change to a unique password on a regularly scheduled basis.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45779r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Enforce password history" to "24" passwords remembered.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AC-000004','C-47170r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

The value for "Enforce password history" is must be "24" passwords remembered,if not this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1105','SV-52852r1_rule','default','medium','The minimum password age must meet requirements.','Permitting passwords to be changed in immediate succession within the same day allows users to cycle passwords through their history database.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45778r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password age" to at least "1" day.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AC-000006','C-47169r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password age" is set to "0" days ("Password can be changed immediately."), this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1172','SV-52876r1_rule','default','low','Users must be warned in advance of their passwords expiring.','Creating strong passwords that can be remembered by users requires some thought.  By giving the user advance warning, the user has time to construct a sufficiently strong password.  This setting configures the system to display a warning to users telling them how many days are left before their password expires.','F-45802r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Prompt user to change password before expiration" to "14" days or more.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000025','C-47193r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: PasswordExpiryWarning

Value Type: REG_DWORD
Value: 14 (or greater)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1163','SV-52871r2_rule','default','medium','Outgoing secure channel traffic must be encrypted when possible.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted.  If this policy is enabled, outgoing secure channel traffic will be encrypted.','F-45797r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally encrypt secure channel data (when possible)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000013','C-47188r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SealSecureChannel

Value Type: REG_DWORD
Value: 1

If the value for "Domain Member: Digitally encrypt or sign secure channel data (always)" is set to "Enabled", this can be NA (see V-6831).','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36719','SV-51756r2_rule','default','medium','The Windows Remote Management (WinRM) service must not allow unencrypted traffic.','Unencrypted remote access to a system can allow sensitive information to be compromised.  Windows remote management connections must be encrypted to prevent this.','F-44831r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Service -> "Allow unencrypted traffic" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000127','C-46885r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Service\

Value Name: AllowUnencryptedTraffic

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36713','SV-51753r2_rule','default','medium','The Windows Remote Management (WinRM) client must not allow unencrypted traffic.','Unencrypted remote access to a system can allow sensitive information to be compromised.  Windows remote management connections must be encrypted to prevent this.','F-44828r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Client -> "Allow unencrypted traffic" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000124','C-46882r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowUnencryptedTraffic

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3454','SV-52899r2_rule','default','medium','Remote Desktop Services must be configured with the client connection encryption set to the required level.','Remote connections must be encrypted to prevent interception of data or sensitive information. Selecting "High Level" will ensure encryption of Remote Desktop Services sessions in both directions.','F-45825r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Security -> "Set client connection encryption level" to "Enabled" and "High Level".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000100','C-47216r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: MinEncryptionLevel

Type: REG_DWORD
Value: 3','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-21952','SV-53177r1_rule','default','medium','NTLM must be prevented from falling back to a Null session.','NTLM sessions that are allowed to fall back to Null (unauthenticated) sessions may gain unauthorized access.','F-46103r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Allow LocalSystem NULL session fallback" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000062','C-47483r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\LSA\MSV1_0\

Value Name: allownullsessionfallback

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-2372','SV-52880r1_rule','default','high','Reversible password encryption must be disabled.','Storing passwords using reversible encryption is essentially the same as storing clear-text versions of the passwords.  For this reason, this policy must never be enabled.','F-45806r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Store password using reversible encryption" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AC-000009','C-47197r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for "Store password using reversible encryption" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3374','SV-52888r2_rule','default','medium','The system must be configured to require a strong session key.','A computer connecting to a domain controller will establish a secure channel.  Requiring strong session keys enforces 128-bit encryption between systems.','F-45814r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Require strong (Windows 2000 or Later) session key" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000017','C-47205r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireStrongKey

Value Type: REG_DWORD
Value: 1

This setting may prevent a system from being joined to a domain if not configured consistently between systems.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1141','SV-52861r1_rule','default','medium','Unencrypted passwords must not be sent to a third-party SMB Server.','Some non-Microsoft SMB servers only support unencrypted (plain text) password authentication.  Sending plain text passwords across the network, when authenticating to an SMB server, reduces the overall security of the environment.  Check with the vendor of the SMB server to see if there is a way to support encrypted password authentication.','F-45787r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Send unencrypted password to connect to third-party SMB servers" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000030','C-47178r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: EnablePlainTextPassword

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57639','SV-72049r1_rule','default','medium','Users must be required to enter a password to access private keys stored in the computer.','If the private key is discovered, an attacker can use the key to authenticate as an authorized user and gain access to the network infrastructure.

The cornerstone of the PKI is the private key used to encrypt or digitally sign information.

If the private key is stolen, this will lead to the compromise of the authentication and non-repudiation gained through PKI because the attacker can use the private key to digitally sign documents and pretend to be the authorized user.

Both the holders of a digital certificate and the issuing authority must protect the computers, storage devices, or whatever they use to keep the private keys.','F-62841r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System cryptography: Force strong key protection for user keys stored in the computer" to "User must enter a password each time they use a key".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000092','C-58461r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Cryptography\

Value Name:  ForceKeyProtection

Type:  REG_DWORD
Value:  2','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1171','SV-52875r1_rule','default','medium','Ejection of removable NTFS media must be restricted to Administrators.','Removable hard drives, if they are not properly configured, can be formatted and ejected by users who are not members of the Administrators Group.  Formatting and ejecting removable NTFS media must only be done by administrators.','F-45801r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Devices: Allowed to format and eject removable media" to "Administrators".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000011','C-47192r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: AllocateDASD

Value Type: REG_SZ
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-2374','SV-52879r2_rule','default','high','Autoplay must be disabled for all drives.','Allowing Autoplay to execute may introduce malicious code to a system.  Autoplay begins reading from a drive as soon media is inserted into the drive.  As a result, the setup file of programs or music on audio media may start.  By default, Autoplay is disabled on removable drives, such as the floppy disk drive (but not the CD-ROM drive) and on network drives.  Enabling this policy disables Autoplay on all drives.','F-45805r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Turn off AutoPlay" to "Enabled:All Drives".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000074','C-47196r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\

Value Name: NoDriveTypeAutoRun

Type: REG_DWORD
Value: 0x000000ff (255)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-21973','SV-53126r2_rule','default','high','Autoplay must be turned off for non-volume devices.','Allowing Autoplay to execute may introduce malicious code to a system.  Autoplay begins reading from a drive as soon as media is inserted into the drive.  As a result, the setup file of programs or music on audio media may start.  This setting will disable Autoplay for non-volume devices (such as Media Transfer Protocol (MTP) devices).','F-46052r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Disallow Autoplay for non-volume devices" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000072','C-47432r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Explorer\

Value Name: NoAutoplayfornonVolume

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3480','SV-53130r1_rule','default','medium','Windows Media Player must be configured to prevent automatic checking for updates.','Uncontrolled system updates can introduce issues to a system.  The automatic check for updates performed by Windows Media Player must be disabled to ensure a constant platform and to prevent the introduction of unknown\untested software on the system.','F-46056r1_fix','If Windows Media Player is installed, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Media Player -> "Prevent Automatic Updates" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000122','C-47436r1_chk','Windows Media Player is not installed by default.  If it is not installed, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsMediaPlayer\

Value Name: DisableAutoupdate

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14259','SV-52997r1_rule','default','medium','Printing over HTTP must be prevented.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents the client computer from printing over HTTP, which allows the computer to print to printers on the intranet as well as the Internet.','F-45924r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> "Turn off printing over HTTP" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000039','C-47304r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Printers\

Value Name: DisableHTTPPrinting

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14260','SV-52998r1_rule','default','medium','Downloading print driver packages over HTTP must be prevented.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents the computer from downloading print driver packages over HTTP.','F-45925r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> "Turn off downloading of print drivers over HTTP" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000032','C-47305r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Printers\

Value Name: DisableWebPnPDownload

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-36709','SV-51749r1_rule','default','medium','Basic authentication for RSS feeds over HTTP must be turned off.','Basic authentication uses plain text passwords that could be used to compromise a system.','F-44824r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> RSS Feeds -> "Turn on Basic feed authentication over HTTP" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-CC-000106','C-46878r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Internet Explorer\Feeds\

Value Name: AllowBasicAuthInClear

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1145','SV-52107r2_rule','default','medium','Automatic logons must be disabled.','Allowing a system to automatically log on when the machine is booted could give access to any unauthorized individual who restarts the computer.  Automatic logon with administrator privileges would give full access to an unauthorized individual.','F-45132r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)" to "Disabled".

Ensure no passwords are stored in the "DefaultPassword" registry value noted below:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: DefaultPassword

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000036','C-46924r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: AutoAdminLogon

Type: REG_SZ
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-4110','SV-52924r1_rule','default','low','The system must be configured to prevent IP source routing.','Configuring the system to disable IP source routing protects against spoofing.','F-45850r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)" to "Highest protection, source routing is completely disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000038','C-47229r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: DisableIPSourceRouting

Value Type: REG_DWORD
Value: 2','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3479','SV-52920r1_rule','default','medium','The system must be configured to use Safe DLL Search Mode.','The default search behavior, when an application calls a function in a Dynamic Link Library (DLL), is to search the current directory, followed by the directories contained in the system"s path environment variable.  An unauthorized DLL, inserted into an application"s working directory, could allow malicious code to be run on the system.  Setting this policy value forces the system to search the %Systemroot% for the DLL before searching the current directory or the rest of the path.','F-45846r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)" to "Enabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000045','C-47225r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\

Value Name: SafeDllSearchMode

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1159','SV-52869r2_rule','default','high','The Recovery Console option must be set to prevent automatic logon to the system.','If this option is enabled, the Recovery Console does not require a password and automatically logs on to the system.  This could allow unauthorized administrative access to the system.','F-45795r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Recovery console: Allow automatic administrative logon" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000071','C-47186r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Setup\RecoveryConsole\

Value Name: SecurityLevel

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-14228','SV-53129r1_rule','default','medium','Auditing the Access of Global System Objects must be turned off.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
This setting prevents the system from setting up a default system access control list for certain system objects, which could create a very large number of security events, filling the security log in Windows and making it difficult to identify actual issues.','F-46055r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Audit: Audit the access of global system objects" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000007','C-47435r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: AuditBaseObjects

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1173','SV-52877r1_rule','default','low','The default permissions of global system objects must be increased.','Windows systems maintain a global list of shared system resources such as DOS device names, mutexes, and semaphores.  Each type of object is created with a default DACL that specifies who can access the objects with what permissions.  If this policy is enabled, the default DACL is stronger, allowing nonadministrative users to read shared objects, but not modify shared objects that they did not create.','F-45803r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000076','C-47194r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\

Value Name: ProtectionMode

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1165','SV-52873r1_rule','default','low','The computer account password must not be prevented from being reset.','Computer account passwords are changed automatically on a regular basis.  Disabling automatic password changes can make the system more vulnerable to malicious access.  Frequent password changes can be a significant safeguard for your system.  A new password for the computer account will be generated every 30 days.','F-45799r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Disable machine account password changes" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000015','C-47190r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: DisablePasswordChange

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1154','SV-52866r1_rule','default','medium','The Ctrl+Alt+Del security attention sequence for logons must be enabled.','Disabling the Ctrl+Alt+Del security attention sequence can compromise system security.  Because only Windows responds to the Ctrl+Alt+Del security sequence, a user can be assured that any passwords entered following that sequence are sent only to Windows.  If the sequence requirement is eliminated, malicious programs can request and receive a user"s Windows password.  Disabling this sequence also suppresses a custom logon banner.','F-45792r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Do not require CTRL+ALT+DEL" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000019','C-47183r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DisableCAD

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-11806','SV-52941r1_rule','default','low','The system must be configured to prevent the display of the last username on the logon screen.','Displaying the username of the last logged on user provides half of the userid/password equation that an unauthorized person would need to gain access.  The username of the last user to log on to a system must not be displayed.','F-45867r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Do not display last user name" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000018','C-47247r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DontDisplayLastUserName

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3379','SV-52892r2_rule','default','high','The system must be configured to prevent the storage of the LAN Manager hash of passwords.','The LAN Manager hash uses a weak encryption algorithm and there are several tools available that use this hash to retrieve account passwords.  This setting controls whether or not a LAN Manager hash of the password is stored in the SAM the next time the password is changed.','F-45818r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Do not store LAN Manager hash value on next password change" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000065','C-47209r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: NoLMHash

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1090','SV-52846r2_rule','default','low','Caching of logon credentials must be limited.','The default Windows configuration caches the last logon credentials for users who log on interactively to a system.  This feature is provided for system availability reasons, such as the user"s machine being disconnected from the network or domain controllers being unavailable.  Even though the credential cache is well-protected, if a system is attacked, an unauthorized individual may isolate the password to a domain user account using a password-cracking program and gain access to the domain.','F-66507r2_fix','If the system is not a member of a domain, this is NA.

Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive Logon: Number of previous logons to cache (in case Domain Controller is not available)" to "4" logons or less.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000024','C-61743r2_chk','If the system is not a member of a domain, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name:  CachedLogonsCount

Value Type:  REG_SZ
Value:  4 (or less)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3381','SV-52894r1_rule','default','medium','The system must be configured to the required LDAP client signing level.','This setting controls the signing requirements for LDAP clients.  This setting must be set to Negotiate signing or Require signing, depending on the environment and type of LDAP server in use.','F-45820r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: LDAP client signing requirements" to "Negotiate signing" at a minimum.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000068','C-47211r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LDAP\

Value Name: LDAPClientIntegrity

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3377','SV-52890r1_rule','default','medium','The system must be configured to prevent anonymous users from having the same rights as the Everyone group.','Access by anonymous users must be restricted.  If this setting is enabled, then anonymous users have the same rights and permissions as the built-in Everyone group.  Anonymous users must not have these permissions or rights.','F-45816r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Let everyone permissions apply to anonymous users" to "Disabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000054','C-47207r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: EveryoneIncludesAnonymous

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26283','SV-53122r1_rule','default','high','Anonymous enumeration of SAM accounts must not be allowed.','Anonymous enumeration of SAM accounts allows anonymous log on users (null session connections) to list all accounts names, thus providing a list of potential points to attack the system.','F-46048r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow anonymous enumeration of SAM accounts" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000051','C-47428r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymousSAM

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1093','SV-52847r1_rule','default','high','Anonymous enumeration of shares must be restricted.','Allowing anonymous logon users (null session connections) to list all account names and enumerate all shared resources can provide a map of potential points to attack the system.','F-45773r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow anonymous enumeration of SAM accounts and shares" to "Enabled".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000052','C-47164r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymous

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3382','SV-52895r1_rule','default','medium','The system must be configured to meet the minimum session security requirement for NTLM SSP-based clients.','Microsoft has implemented a variety of security support providers for use with RPC sessions.  All of the options must be enabled to ensure the maximum security level.','F-45821r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Minimum session security for NTLM SSP based (including secure RPC) clients" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000069','C-47212r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinClientSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3666','SV-52922r1_rule','default','medium','The system must be configured to meet the minimum session security requirement for NTLM SSP-based servers.','Microsoft has implemented a variety of security support providers for use with RPC sessions.  All of the options must be enabled to ensure the maximum security level.','F-45848r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Minimum session security for NTLM SSP based (including secure RPC) servers" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000070','C-47227r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinServerSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57477','SV-71961r1_rule','default','medium','The system must be configured to automatically consent to send all data requested by a local or DOD-wide error collection site.','Configuring error reporting to send all requested data ensures all relevant data associated with the error report is captured for later analysis.  This setting determines the default consent behavior of Windows Error Reporting.','F-62767r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Consent -> "Configure Default consent" to "Enabled" with "Send all data" selected for "Consent level".' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-ER-000017','C-58399r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent\

Value Name:  DefaultConsent

Type:  REG_DWORD
Value:  0x00000004 (4)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26557','SV-52972r1_rule','default','medium','The system must be configured to audit System - System Integrity successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

System Integrity records events related to violations of integrity to the security subsystem.','F-45898r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit System Integrity" with "Success" selected.' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-AU-000111','C-47278r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> System Integrity - Success','Customized rule by Cloud Raxak') from dual;
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

Value: 5             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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
Value: NTP             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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
                                  ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
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
             ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','Windows 2012','','
                           If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\TimeProviders\NtpClient

Value Name: SpecialPollInterval

Value Type: REG_DWORD Value: 900(15 mins)
                     ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56380','SV-72067r1_rule','default','high','Microsoft Security Bulletin MS17-010 â€“ Critical should be Installed. (WannaCry)','This security update resolves vulnerabilities in Microsoft Windows. The most severe of the vulnerabilities could allow remote code execution if an attacker sends specially crafted messages to a Microsoft Server Message Block 1.0 (SMBv1) server.','F-62859r3_fix','            
      Install Security Update KB4012213 for Microsoft Windows SMB Server.
      Download Patch from here: https://technet.microsoft.com/en-us/library/security/ms17-010.aspx
      ' , 'Microsoft Windows Server 2012 R2 ISO-27002-v1_2012','Profile Customized by CloudRaxak','WN12-SO-000010','C-58479r1_chk','Open Control Panel next go to Programs  and then go to Programs and Features. Click on View installed Updates and check security updates.       
        Check KB4012213 Critical Patch is Installed. If not then this is a finding.
        ','Customized rule by Cloud Raxak') from dual;
