select add_profile_data ('[Windows Server] UndoDemonstrationProfile' ,'Profile Customized by CloudRaxak' ,'Windows-based OS','' ,'2015-06-16' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-15702','SV-53105r1_rule','default','low','An Error Report must not be sent when a generic device driver is installed.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents an error report from being sent when a generic device driver is installed.','F-46030r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Device Installation -> "Do not send a Windows error report when a generic driver is installed on a device" to "Enabled".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000020','C-47410r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\DeviceInstall\Settings\

Value Name: DisableSendGenericDriverNotFoundToWER

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-34974','SV-52954r1_rule','default','high','The Windows Installer Always install with elevated privileges option must be disabled.','Standard user accounts must not be granted elevated privileges.  Enabling Windows Installer to elevate privileges when installing applications can allow malicious persons and applications to gain full control of a system.','F-45880r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Installer -> "Always install with elevated privileges" to "Disabled".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000116','C-47260r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Installer\

Value Name: AlwaysInstallElevated

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-21960','SV-53182r1_rule','default','low','Domain users must be required to elevate when setting a networks location.','Selecting an incorrect network location may allow greater exposure of a system.  Elevation is required by default on nondomain systems to change network location.  This setting configures elevation to also be required on domain-joined systems.','F-46108r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Network Connections -> "Require domain users to elevate when setting a network"s location" to "Enabled".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000005','C-47488r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Network Connections\

Value Name: NC_StdDomainUserSetLocation

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-21961','SV-53183r1_rule','default','low','All Direct Access traffic must be routed through the internal network.','Routing all Direct Access  traffic through the internal network allows monitoring and prevents split tunneling.','F-46109r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Network Connections -> "Route all traffic through the internal network" to "Enabled: Enabled State".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000006','C-47489r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\TCPIP\v6Transition\

Value Name: Force_Tunneling

Type: REG_SZ
Value: Enabled','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-22692','SV-53124r2_rule','default','high','The default Autorun behavior must be configured to prevent Autorun commands.','Allowing Autorun commands to execute may introduce malicious code to a system.  Configuring this setting prevents Autorun commands from executing.','F-46050r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Set the default behavior for AutoRun" to "Enabled:Do not execute any autorun commands".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000073','C-47430r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\

Value Name: NoAutorun

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3480','SV-53130r1_rule','default','medium','Windows Media Player must be configured to prevent automatic checking for updates.','Uncontrolled system updates can introduce issues to a system.  The automatic check for updates performed by Windows Media Player must be disabled to ensure a constant platform and to prevent the introduction of unknown\untested software on the system.','F-46056r1_fix','If Windows Media Player is installed, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Media Player -> "Prevent Automatic Updates" to "Enabled".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000122','C-47436r1_chk','Windows Media Player is not installed by default.  If it is not installed, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsMediaPlayer\

Value Name: DisableAutoupdate

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15680','SV-53036r2_rule','default','low','The classic logon screen must be required for user logons.','The classic logon screen requires users to enter a logon name and password to access a system.  The simple logon screen or Welcome screen displays  usernames for selection, providing part of the necessary logon information.','F-66505r3_fix','If the system is a member of a domain, this is NA.

Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Logon >> "Always use classic logon" to "Enabled".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000049-MS','C-61741r2_chk','If the system is a member of a domain, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name:  LogonType

Type:  REG_DWORD
Value:  0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-15701','SV-53099r1_rule','default','low','A system restore point must be created when a new device driver is installed.','A system restore point allows a rollback if an issue is  encountered when a new device driver is installed.','F-46025r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Device Installation -> "Prevent creation of a system restore point during device activity that would normally prompt creation of a restore point" to "Disabled".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000021','C-47405r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\DeviceInstall\Settings\

Value Name: DisableSystemRestore

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3343','SV-52885r1_rule','default','high','Solicited Remote Assistance must not be allowed.','Remote assistance allows another user to view or take control of the local session of a user.  Solicited assistance is help that is specifically requested by the local user.  This may allow unauthorized parties access to the resources on the computer.','F-45811r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Assistance -> "Configure Solicited Remote Assistance" to "Disabled".

Windows 2008 R2:
      Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Assistance "Solicited Remote Assistance" to "Disabled".
' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-CC-000059','C-47202r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fAllowToGetHelp

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-3344','SV-52886r1_rule','default','high','Local accounts with blank passwords must be restricted to prevent access from the network.','An account without a password can allow unauthorized access to a system as only the username would be required.  Password policies should prevent accounts with blank passwords from existing on a system.  However, if a local account with a blank password did exist, enabling this setting will prevent network access, limiting the account to local console logon only.','F-45812r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Limit local account use of blank passwords to console logon only" to "Enabled".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-SO-000004','C-47203r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: LimitBlankPasswordUse

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1075','SV-52840r1_rule','default','low','The shutdown option must not be available from the logon dialog box.','Displaying the shutdown button may allow individuals to shut down a system anonymously.  Only authenticated users should be allowed to shut down the system.  Preventing display of this button in the logon dialog box ensures that individuals who shut down the system are authorized and tracked in the system"s Security event log.','F-45766r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Shutdown: Allow system to be shutdown without having to log on" to "Disabled".' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-SO-000073','C-47157r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ShutdownWithoutLogon

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26477','SV-53117r1_rule','default','low','Unauthorized accounts must not have the Change the time zone user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the time zone" user right can change the time zone of a system.','F-46043r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the time zone" to only include the following accounts or groups:

Administrators
Local Service' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-UR-000010','C-47423r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the time zone" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1102','SV-52108r2_rule','default','high','Unauthorized accounts must not have the Act as part of the operating system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Act as part of the operating system" user right can assume the identity of any user and gain access to resources that user is authorized to access.  Any accounts with this right can take complete control of a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45133r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Act as part of the operating system" to be defined but containing no entries (blank).' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-UR-000003','C-46925r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups (to include administrators), are granted the "Act as part of the operating system" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26471','SV-52109r2_rule','default','medium','Unauthorized accounts must not have the Adjust memory quotas for a process user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Adjust memory quotas for a process" user right can adjust memory that is available to processes, and could be used in a denial of service (DoS) attack.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45134r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Adjust memory quotas for a process" to only include the following accounts or groups:

Administrators
Local Service
Network Service' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-UR-000004','C-46926r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Adjust memory quotas for a process" user right, this is a finding:

Administrators
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26488','SV-53050r1_rule','default','medium','Unauthorized accounts must not have the Force shutdown from a remote system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Force shutdown from a remote system" user right can remotely shut down a system, which could result in a DoS.','F-45976r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Force shutdown from a remote system" to only include the following accounts or groups:

Administrators' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-UR-000023','C-47356r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Force shutdown from a remote system" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26474','SV-52111r2_rule','default','medium','Unauthorized accounts must not have the back up files and directories user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Back up files and directories" user right can circumvent file and directory permissions and could allow access to sensitive data.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45136r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Back up files and directories" to only include the following accounts or groups:

Administrators' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-UR-000007','C-46928r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Back up files and directories" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26476','SV-53118r1_rule','default','medium','Unauthorized accounts must not have the Change the system time user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the system time" user right can change the system time, which can impact authentication, as well as affect time stamps on event log entries.','F-46044r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the system time" to only include the following accounts or groups:

Administrators
Local Service' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-UR-000009','C-47424r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the system time" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-18010','SV-52115r2_rule','default','high','Unauthorized accounts must not have the Debug programs user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Debug programs" user right can attach a debugger to any process or to the kernel, providing complete access to sensitive and critical operating system components.  This right is given to Administrators in the default configuration.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45140r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Debug programs" to only include the following accounts or groups:

Administrators' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-UR-000016','C-46932r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Debug programs" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26529','SV-53013r2_rule','default','medium','The system must be configured to audit Account Logon - Credential Validation successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential validation records events related to validation tests on credentials for a user account logon.','F-45940r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Credential Validation" with "Success" selected.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AU-000001','C-47320r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Logon -> Credential Validation - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26530','SV-53011r2_rule','default','medium','The system must be configured to audit Account Logon - Credential Validation failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential validation records events related to validation tests on credentials for a user account logon.','F-45938r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Credential Validation" with "Failure" selected.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AU-000002','C-47318r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Logon -> Credential Validation - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26531','SV-52234r3_rule','default','medium','The system must be configured to audit Account Management - Computer Account Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Computer Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling computer accounts.','F-45249r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Computer Account Management" with "Success" selected.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AU-000011','C-46972r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Computer Account Management - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26532','SV-52235r3_rule','default','medium','The system must be configured to audit Account Management - Computer Account Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Computer Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling computer accounts.','F-45250r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Computer Account Management" with "Failure" selected.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AU-000012','C-46973r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Computer Account Management - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26546','SV-52983r1_rule','default','medium','The system must be configured to audit Policy Change - Audit Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.','F-45909r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Audit Policy Change" with "Success" selected.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AU-000085','C-47289r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Audit Policy Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26547','SV-52982r1_rule','default','medium','The system must be configured to audit Policy Change - Audit Policy Change failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.','F-45908r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Audit Policy Change" with "Failure" selected.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AU-000086','C-47288r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Audit Policy Change - Failure','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26539','SV-52999r1_rule','default','medium','The system must be configured to audit Detailed Tracking - Process Creation successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Process Creation records events related to the creation of a process and the source.','F-45926r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Detailed Tracking -> "Audit Process Creation" with "Success" selected.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AU-000023','C-47306r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Detailed Tracking -> Process Creation - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1097','SV-52848r1_rule','default','medium','The number of allowed bad logon attempts must meet minimum requirements.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  The higher this value is, the less effective the account lockout feature will be in protecting the local system.  The number of bad logon attempts must be reasonably small to minimize the possibility of a successful password attack, while allowing for honest errors made during a normal user logon.','F-45774r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout threshold" to "3" or less invalid logon attempts (excluding "0" which is unacceptable).' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AC-000002','C-47165r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Account lockout threshold" is "0" or more than "3" attempts, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1107','SV-52853r1_rule','default','medium','The password history must be configured to 24 passwords remembered.','A system is more vulnerable to unauthorized access when system users recycle the same password several times without being required to change to a unique password on a regularly scheduled basis.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45779r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Enforce password history" to "24" passwords remembered.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AC-000004','C-47170r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

The value for "Enforce password history" is must be "24" passwords remembered,if not this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1104','SV-52851r1_rule','default','medium','The maximum password age must meet requirements.','The longer a password is in use, the greater the opportunity for someone to gain unauthorized knowledge of the passwords.   Scheduled changing of passwords hinders the ability of unauthorized system users to crack passwords and gain access to a system.','F-45777r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Maximum password age" to "60" days or less (excluding "0" which is unacceptable).' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AC-000005','C-47168r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Maximum password age" is greater than "60" days, this is a finding.  If the value is set to "0" (never expires), this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-1105','SV-52852r1_rule','default','medium','The minimum password age must meet requirements.','Permitting passwords to be changed in immediate succession within the same day allows users to cycle passwords through their history database.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45778r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password age" to at least "1" day.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AC-000006','C-47169r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password age" is set to "0" days ("Password can be changed immediately."), this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-6836','SV-52938r2_rule','default','medium','Passwords must, at a minimum, be 14 characters.','Information systems not protected with strong password schemes (including passwords of minimum length) provide the opportunity for anyone to crack the password, thus gaining access to the system and compromising the device, information, or the local network.','F-45864r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password length" to "14" characters.' , '[Windows Server] UndoDemonstrationProfile','Profile Customized by CloudRaxak','WN12-AC-000007','C-47243r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password length," is less than "14" characters, this is a finding.','Customized rule by Cloud Raxak') from dual;
