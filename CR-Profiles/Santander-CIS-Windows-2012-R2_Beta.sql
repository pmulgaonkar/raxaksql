select add_profile_data ('Santander-CIS-Windows-2012-R2 (Beta)' ,'Profile Customized by CloudRaxak' ,'Windows-based OS','' ,'2017-10-06' ,'Profile by Cloud Raxak') from dual;

select add_rule_data ('default','V-5001','SV-52882r1_rule','default','high','Add workstations to domain is set to Administrators (DC only).','This policy setting specifies which users can add computer workstations to a specific domain. For this policy setting to take effect, it must be assigned to the user as part of the Default Domain Controller Policy for the domain.  If users are allowed to add computers to the domain, tracking and management efforts would be hampered. Also, users could perform activities that are more difficult to trace because of their ability to create additional unauthorized domain computers.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Administrators:
Computer Configuration\Policies\Windows Settings\Security Settings\Local Policies\User Rights Assignment\Add workstations to domain.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5002','SV-52882r1_rule','default','high','Deny log on as a service include Guests users.','This security setting determines which service accounts are prevented from registering a process as a service. This policy setting supersedes the Log on as a service policy setting if an account is subject to both policies.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to include Guests:
Computer Configuration\Policies\Windows Settings\Security Settings\Local Policies\User Rights Assignment\Deny log on as a service.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5003','SV-52882r1_rule','default','high','Domain controller: LDAP server signing requirements is set to Require signing.','This policy setting determines whether the Lightweight Directory Access Protocol (LDAP) server requires LDAP clients to negotiate data signing.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Require signing:
Computer Configuration\Policies\Windows Settings\Security Settings\Local Policies\Security Options\Domain controller: LDAP server signing requirements.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NTDS\Parameters:ldapserverintegrity = 2.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5004','SV-52882r1_rule','default','high','Domain controller: Allow server operators to schedule tasks is set to Disabled (DC only).','This policy setting determines whether members of the Server Operators group are allowed to submit jobs by means of the AT schedule facility. The impact of this policy setting configuration should be small for most organizations.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Disabled:
Computer Configuration\Policies\Windows Settings\Security Settings\Local Policies\Security Options\Domain controller: Allow server operators to schedule tasks.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa:SubmitControl = 0.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5005','SV-52882r1_rule','default','high','Domain controller: Refuse machine account password changes is set to Disabled','This security setting determines whether domain controllers will refuse requests from member computers to change computer account passwords. By default, member computers change their computer account passwords every 30 days. If enabled, the domain controller will refuse computer account password change requests. If it is enabled, this setting does not allow a domain controller to accept any changes to a computer accounts password','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Disabled:
Computer Configuration\Policies\Windows Settings\Security Settings\Local Policies\Security Options\Domain controller: Refuse machine account password changes.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\Netlogon\Parameters:RefusePasswordChange = 0' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5006','SV-52882r1_rule','default','high','Microsoft network server: Server SPN target name validation level is set to Accept if provided by client or higher','This policy setting controls the level of validation a computer with shared folders or printers (the server) performs on the service principal name (SPN) that is provided by the client computer when it establishes a session using the server message block (SMB) protocol.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Accept if provided by client (configuring to Required from client also conforms with the benchmark):
Computer Configuration\Policies\Windows Settings\Security Settings\Local Policies\Security Options\Microsoft network server: Server SPN target name validation level.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\LanManServer\Parameters:SMBServerNameHardeningLevel = 1.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5008','SV-52882r1_rule','default','high','Windows NTP Client is set to Enabled.','This policy setting specifies whether the Windows NTP Client is enabled. Enabling the Windows NTP Client allows your computer to synchronize its computer clock with other NTP servers. You might want to disable this service if you decide to use a third-party time provider.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Enabled:
Computer Configuration\Policies\Administrative Templates\System\Windows Time Service\Time Providers\Enable Windows NTP Client.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient:Enabled = 1.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5009','SV-52882r1_rule','default','high','Disable IPv6 (TCPIP6 Parameter DisabledComponents is set to 0xff (255)) .','Internet Protocol version 6 (IPv6) is a set of protocols that computers use to exchange information over the Internet and over home and business networks. IPv6 allows for many more IP addresses to be assigned than IPv4 did. Older networking, hosts and operating systems may not support IPv6 natively.','F-45808r1_fix',
'To establish the recommended configuration, set the following Registry value to 0xff(255) (DWORD):
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TCPIP6\Parameters:DisabledComponents = 255.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Registry path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5010','SV-52882r1_rule','default','medium','Configure registry policy processing: Do not apply during periodic background processing is set to Enabled.','The Do not apply during periodic background processing option prevents the system from updating affected policies in the background while the computer is in use. When background updates are disabled, policy changes will not take effect until the next user logon or system restart.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Enabled:
Computer Configuration\Policies\Administrative Templates\System\Group Policy\Configure registry policy processing.
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F11D2-A89A-00C04FBBCFA2}\NoBackgroundPolicy' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5011','SV-52882r1_rule','default','high','Turn off handwriting personalization data sharing is set to Enabled.','This setting turns off data sharing from the handwriting recognition personalization tool.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Enabled:
Computer Configuration\Policies\Administrative Templates\System\Internet Communication Management\Internet Communication settings\Turn off handwriting personalization data sharing.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\TabletPC:PreventHandwritingDataSharing = 1.

This Group Policy setting is provided by the Group Policy template:
ShapeCollector.admx/adml that is included with the Microsoft Windows 7/2008R2,8/2012, 8.1/2012R2 and Windows 10 Administrative Templates.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5012','SV-52882r1_rule','default','high','Turn off Registration if URL connection is referring to Microsoft.com is enabled.','This policy setting specifies whether the Windows Registration Wizard connects to Microsoft.com for online registration.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Enabled:
Computer Configuration\Policies\Administrative Templates\System\Internet Communication Management\Internet Communication settings\Turn off Registration if URL connection is referring to Microsoft.com.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Registration Wizard Control:NoRegistration = 1.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5013','SV-52882r1_rule','default','high','Turn off the Windows Messenger Customer Experience Improvement Program is set to enabled.','This policy setting specifies whether Windows Messenger can collect anonymous information about how the Windows Messenger software and service is used.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Enabled:
Computer Configuration\Policies\Administrative Templates\System\Internet Communication Management\Internet Communication settings\Turn off the Windows Messenger Customer Experience Improvement Program.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5014','SV-52882r1_rule','default','high','Setup: Control Event Log behavior when the log file reaches its maximum size is disabled.','This policy setting controls Event Log behavior when the log file reaches its maximum size. If you enable this policy setting and a log file reaches its maximum size new events are not written to the log and are lost.
If you disable or do not configure this policy setting and a log file reaches its maximum size new events overwrite old events.','F-45808r1_fix',
'To establish the recommended configuration state via Group policy, set the following policy to Disabled:
Computer Configuration\Policies\Administrative Templates\Windows Components\Event Log Service\Security\Control Event Log behavior when the log file reaches its maximum size.
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\EventLog\Setup\Retention = 0' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5015','SV-52882r1_rule','default','high','Allow indexing of encrypted files is set to Disabled.','This policy setting allows encrypted items to be indexed. If you enable this policy setting indexing will attempt to decrypt and index the content (access restrictions will still apply).
If you disable this policy setting, the search service components (including non-Microsoft components) are expected not to index encrypted items or encrypted stores.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Disabled:
Computer Configuration\Policies\Administrative Templates\Windows Components\Search\Allow indexing of encrypted files.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search\AllowIndexingEncryptedStoresOrItems = 0.

Note: This Group Policy path does not exist by default.  
An additional Group Policy template (Search.admx/adml) is required - it is included with the Microsoft Windows Vista, 2008,7/2008R2, 8/2012, 8.1/2012R2 and Windows 10 Administrative Templates.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5016','SV-52882r1_rule','default','high','Turn on PowerShell Script Block Logging is set to Disabled','This policy setting enables logging of all PowerShell script input to the Microsoft-WindowsPowerShell/Operational event log.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Disabled:
Computer Configuration\Policies\Administrative Templates\Windows Components\Windows PowerShell\Turn on PowerShell Script Block Logging

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging:EnableScriptBlockLogging = 0

Note: This Group Policy path does not exist by default. A newer version of the "powershellexecutionpolicy.admx/adml" Administrative Template is required - it is included with the Microsoft Windows 10 Administrative Templates..' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5017','SV-52882r1_rule','default','high','Turn on PowerShell Transcription is set to Disabled.','This Policy setting lets you capture the input and output of Windows PowerShell commands into text-based transcripts.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the following policy to Disabled:
Computer Configuration\Policies\Administrative Templates\Windows Components\Windows PowerShell\Turn on PowerShell Transcription.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription:EnableTranscripting = 0.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-5018','SV-52882r1_rule','default','high','Always install with elevated privileges is disabled.','This setting extends elevated privileges to all programs. This setting lets users install programs that require access to directories that the user might not have permission to view or change, including directories on highly restricted computers.If you disable this setting or do not configure it, the system applies the current users permissions when it installs programs that a system administrator does not distribute or offer.','F-45808r1_fix',
'To establish the recommended configuration via Group policy, set the policy to Disabled:
Computer Configuration\Policies\Administrative Templates\Windows Components\Windows Installer\Always install with elevated privileges.

This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\Installer\AlwaysInstallElevated = 0.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk',
'Navigate to the Group policy Path articulated in the Fix Description section and confirm it is set as prescribed.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1107','SV-52853r1_rule','default','medium','The password history must be configured to 24 passwords remembered.','A system is more vulnerable to unauthorized access when system users recycle the same password several times without being required to change to a unique password on a regularly scheduled basis.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45779r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Enforce password history" to "24" passwords remembered.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000004','C-47170r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

The value for "Enforce password history" is must be "24" passwords remembered,if not this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1104','SV-52851r1_rule','default','medium','The maximum password age must meet requirements.','The longer a password is in use, the greater the opportunity for someone to gain unauthorized knowledge of the passwords.   Scheduled changing of passwords hinders the ability of unauthorized system users to crack passwords and gain access to a system.','F-45777r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Maximum password age" to "60" days or less (excluding "0" which is unacceptable).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000005','C-47168r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Maximum password age" is greater than "60" days, this is a finding.  If the value is set to "0" (never expires), this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1105','SV-52852r1_rule','default','medium','The minimum password age must meet requirements.','Permitting passwords to be changed in immediate succession within the same day allows users to cycle passwords through their history database.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45778r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password age" to at least "1" day.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000006','C-47169r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password age" is set to "0" days ("Password can be changed immediately."), this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-6836','SV-52938r2_rule','default','medium','Passwords must, at a minimum, be 14 characters.','Information systems not protected with strong password schemes (including passwords of minimum length) provide the opportunity for anyone to crack the password, thus gaining access to the system and compromising the device, information, or the local network.','F-45864r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password length" to "14" characters.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000007','C-47243r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password length," is less than "14" characters, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1150','SV-52863r1_rule','default','low','The built-in Microsoft password complexity filter must be enabled.','The use of complex passwords increases their strength against guessing and brute-force attacks. The built-in Windows password complexity policy requires passwords to contain at least 3 of the 4 types of characters (numbers, upper- and lower-case letters, and special characters), as well as preventing the inclusion of user names or parts of.','F-45789r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Password must meet complexity requirements" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000008','C-47180r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for "Password must meet complexity requirements" is not set to "Enabled", this is a finding.

If the site is using a password filter that requires this setting be set to "Disabled" for the filter code to be used, this would not be considered a finding.  If this setting does not affect the use of an external password filter, it will be enabled for fall-back purposes.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-2372','SV-52880r1_rule','default','high','Reversible password encryption must be disabled.','Storing passwords using reversible encryption is essentially the same as storing clear-text versions of the passwords.  For this reason, this policy must never be enabled.','F-45806r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Store password using reversible encryption" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000009','C-47197r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for "Store password using reversible encryption" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1099','SV-52850r1_rule','default','medium','The lockout duration must be configured to require an administrator to unlock an account.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  This parameter specifies the period of time that an account will remain locked after the specified number of failed logon attempts.  A value of 0 will require an administrator to unlock the account.','F-45776r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout duration" to "0" minutes, "Account is locked out until administrator unlocks it".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000001','C-47167r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Account lockout duration" is not set to "0", requiring an administrator to unlock the account, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1098','SV-52849r1_rule','default','medium','The period of time before the bad logon counter is reset must meet minimum requirements.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  This parameter specifies the period of time that must pass after failed logon attempts before the counter is reset to 0.  The smaller this value is, the less effective the account lockout feature will be in protecting the local system.','F-45775r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Reset account lockout counter after" to at least "60" minutes.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000003','C-47166r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Reset account lockout counter after" value is less than "60" minutes, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1097','SV-52848r1_rule','default','medium','The number of allowed bad logon attempts must meet minimum requirements.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  The higher this value is, the less effective the account lockout feature will be in protecting the local system.  The number of bad logon attempts must be reasonably small to minimize the possibility of a successful password attack, while allowing for honest errors made during a normal user logon.','F-45774r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout threshold" to "3" or less invalid logon attempts (excluding "0" which is unacceptable).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-AC-000002','C-47165r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Account lockout threshold" is "0" or more than "3" attempts, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26469','SV-53120r1_rule','default','medium','Unauthorized accounts must not have the Access Credential Manager as a trusted caller user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access Credential Manager as a trusted caller" user right may be able to retrieve the credentials of other accounts from Credential Manager.','F-46046r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Access Credential Manager as a trusted caller" to be defined but containing no entries (blank).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000001','C-47426r1_chk','Verify the effective setting in Local Group Policy Editor.
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

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000002-MS','C-49426r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Access this computer from the network" user right, this is a finding:

Administrators
Authenticated Users

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1102','SV-52108r2_rule','default','high','Unauthorized accounts must not have the Act as part of the operating system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Act as part of the operating system" user right can assume the identity of any user and gain access to resources that user is authorized to access.  Any accounts with this right can take complete control of a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45133r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Act as part of the operating system" to be defined but containing no entries (blank).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000003','C-46925r1_chk','Verify the effective setting in Local Group Policy Editor.
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
Network Service' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000004','C-46926r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Adjust memory quotas for a process" user right, this is a finding:

Administrators
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26473','SV-53119r1_rule','default','medium','Unauthorized accounts must not have the Allow log on through Remote Desktop Services user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Allow log on through Remote Desktop Services" user right can access a system through Remote Desktop.','F-46045r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Allow log on through Remote Desktop Services" to only include the following accounts or groups:

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000006','C-47425r1_chk','Verify the effective setting in Local Group Policy Editor.
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

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000007','C-46928r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Back up files and directories" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26476','SV-53118r1_rule','default','medium','Unauthorized accounts must not have the Change the system time user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the system time" user right can change the system time, which can impact authentication, as well as affect time stamps on event log entries.','F-46044r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the system time" to only include the following accounts or groups:

Administrators
Local Service' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000009','C-47424r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the system time" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26477','SV-53117r1_rule','default','low','Unauthorized accounts must not have the Change the time zone user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the time zone" user right can change the time zone of a system.','F-46043r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the time zone" to only include the following accounts or groups:

Administrators
Local Service' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000010','C-47423r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the time zone" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26479','SV-52113r2_rule','default','high','Unauthorized accounts must not have the Create a token object user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Create a token object" user right allows a process to create an access token. This could be used to provide elevated rights and compromise a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45138r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create a token object" to be defined but containing no entries (blank).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000012','C-46930r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Create a token object" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26481','SV-53059r1_rule','default','medium','Unauthorized accounts must not have the Create permanent shared objects user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create permanent shared objects" user right could expose sensitive data by creating shared objects.','F-45985r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create permanent shared objects" to be defined but containing no entries (blank).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000014','C-47365r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Create permanent shared objects" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-18010','SV-52115r2_rule','default','high','Unauthorized accounts must not have the Debug programs user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Debug programs" user right can attach a debugger to any process or to the kernel, providing complete access to sensitive and critical operating system components.  This right is given to Administrators in the default configuration.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45140r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Debug programs" to only include the following accounts or groups:

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000016','C-46932r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Debug programs" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26483','SV-51502r1_rule','default','medium','The Deny log on as a batch job user right on member servers must be configured to prevent access from highly privileged domain accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on as a batch job" user right defines accounts that are prevented from logging on to the system as a batch job such, as Task Scheduler.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

The Guests group must be assigned to prevent unauthenticated access.','F-44652r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny log on as a batch job" to include the following:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

All Systems:
Guests Group' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000018-MS','C-46807r1_chk','Verify the effective setting in Local Group Policy Editor.
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
Guests Group' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000020-MS','C-49587r1_chk','Verify the effective setting in Local Group Policy Editor.
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

Automated benchmarks will look for these groups.  Use of other methods will require manual validation.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000021-MS','C-58027r1_chk','Verify the effective setting in Local Group Policy Editor.
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

The "Enable computer and user accounts to be trusted for delegation" user right allows the "Trusted for Delegation" setting to be changed.  This could potentially allow unauthorized users to impersonate other users.','F-44649r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Enable computer and user accounts to be trusted for delegation" to be defined but containing no entries (blank).' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000022-MS','C-46805r1_chk','Verify the effective setting in Local Group Policy Editor.
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

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000023','C-47356r1_chk','Verify the effective setting in Local Group Policy Editor.
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
Network Service' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000024','C-46933r1_chk','Verify the effective setting in Local Group Policy Editor.
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

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000027','C-46936r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Increase scheduling priority" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26493','SV-53043r1_rule','default','medium','Unauthorized accounts must not have the Load and unload device drivers user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Load and unload device drivers" user right allows device drivers to dynamically be loaded on a system by a user.  This could potentially be used to install malicious code by an attacker.','F-45969r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Load and unload device drivers" to only include the following accounts or groups:

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000028','C-47349r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Load and unload device drivers" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26495','SV-52120r2_rule','default','medium','Unauthorized accounts must not have the Log on as a batch job user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Log on as a batch job" user right allows accounts to log on using the task scheduler service, which must be restricted.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45145r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Log on as a batch job" to only include the following accounts or groups:

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000030','C-46938r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Log on as a batch job" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26496','SV-53039r2_rule','default','medium','Unauthorized accounts must not have the Manage auditing and security log user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Manage auditing and security log" user right can manage the security log and change auditing configurations.  This could be used to clear evidence of tampering.','F-45965r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Manage auditing and security log" to only include the following accounts or groups:

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000032','C-47345r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Manage auditing and security log" user right, this is a finding:

Administrators

If the site has an Auditors group that further limits this privilege this would not be a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26497','SV-53033r1_rule','default','medium','Unauthorized accounts must not have the Modify an object label user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Modify an object label" user right can change the integrity label of an object.  This could potentially be used to execute code at a higher privilege.','F-45958r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Modify an object label" to be defined but containing no entries (blank).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000033','C-47338r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Modify an object label" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26498','SV-53029r1_rule','default','medium','Unauthorized accounts must not have the Modify firmware environment values user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Modify firmware environment values" user right can change hardware configuration environment variables.  This could result in hardware failures or a DoS.','F-45955r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Modify firmware environment values" to only include the following accounts or groups:

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000034','C-47334r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Modify firmware environment values" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26499','SV-53025r1_rule','default','medium','Unauthorized accounts must not have the Perform volume maintenance tasks user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Perform volume maintenance tasks" user right can manage volume and disk configurations.  They could potentially delete volumes, resulting in data loss or a DoS.','F-45951r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Perform volume maintenance tasks" to only include the following accounts or groups:

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000035','C-47330r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Perform volume maintenance tasks" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26500','SV-53022r1_rule','default','medium','Unauthorized accounts must not have the Profile single process user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile single process" user right can monitor nonsystem processes performance.  An attacker could potentially use this to identify processes to attack.','F-45948r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Profile single process" to only include the following accounts or groups:

Administrators' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000036','C-47328r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Profile single process" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26501','SV-53019r1_rule','default','medium','Unauthorized accounts must not have the Profile system performance user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile system performance" user right can monitor system processes performance.  An attacker could potentially use this to identify processes to attack.','F-45945r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Profile system performance" to only include the following accounts or groups:

Administrators
NT Service\WdiServiceHost' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000037','C-47325r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Profile system performance" user right, this is a finding:

Administrators
NT Service\WdiServiceHost','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26503','SV-52121r2_rule','default','medium','Unauthorized accounts must not have the Replace a process level token user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Replace a process level token" user right allows one process or service to start another process or service with a different security access token.  A user with this right could use this to impersonate another account.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45146r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Replace a process level token" to only include the following accounts or groups:

Local Service
Network Service' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-UR-000039','C-46939r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Replace a process level token" user right, this is a finding:

Local Service
Network Service','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1154','SV-52866r1_rule','default','medium','The Ctrl+Alt+Del security attention sequence for logons must be enabled.','Disabling the Ctrl+Alt+Del security attention sequence can compromise system security.  Because only Windows responds to the Ctrl+Alt+Del security sequence, a user can be assured that any passwords entered following that sequence are sent only to Windows.  If the sequence requirement is eliminated, malicious programs can request and receive a user"s Windows password.  Disabling this sequence also suppresses a custom logon banner.','F-45792r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Do not require CTRL+ALT+DEL" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000019','C-47183r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DisableCAD

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1157','SV-52867r2_rule','default','medium','The Smart Card removal option must be configured to Force Logoff or Lock Workstation.','Unattended systems are susceptible to unauthorized use and must be locked.  Configuring a system to lock when a smart card is removed will ensure the system is inaccessible when unattended.','F-45793r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Smart card removal behavior" to  "Lock Workstation" or "Force Logoff".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000027','C-47184r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: SCRemoveOption

Value Type: REG_SZ
Value: 1 (Lock Workstation) or 2 (Force Logoff)

If configuring this on servers causes issues such as terminating users" remote sessions and the site has a policy in place that any other sessions on the servers such as administrative console logons, are manually locked or logged off when unattended or not in use, this would be acceptable. This must be documented with the ISSO.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1113','SV-52855r1_rule','default','medium','The built-in guest account must be disabled.','A system faces an increased vulnerability threat if the built-in guest account is not disabled.  This account is a known account that exists on all Windows systems and cannot be deleted.  This account is initialized during the installation of the operating system with no password assigned.','F-45781r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Guest account status" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000003','C-47172r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Accounts: Guest account status" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1114','SV-52856r1_rule','default','medium','The built-in guest account must be renamed.','The built-in guest account is a well-known user account on all Windows systems and, as initially installed, does not require a password.  This can allow access to system resources by unauthorized users.  Renaming this account to an unidentified name improves the protection of this account and the system.','F-45782r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Rename guest account" to a name other than "Guest".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000006','C-47173r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Accounts: Rename guest account" is not set to a value other than "Guest", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56371','SV-50462r1_rule','default','high','
System must be configure to Shut down immediately when unable to log security audits','
This rule verifies that the system will shut down if it is unable to log a security event to the Security Event log. For all profiles, the recommended state for this setting is Disabled.','F-56000','
Configure the following registry value: 
Registry Path: HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa 
Value Name: CrashOnAuditFail 
Value Type: REG_DWORD 
Value: 0 

Altenative method : 

Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> Audit: Shut down system immediately if unable to log security audits to Disabled.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 

Registry Path: HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa
Value Name: CrashOnAuditFail
Value Type: REG_DWORD 
Value: 0 ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1171','SV-52875r1_rule','default','medium','Ejection of removable NTFS media must be restricted to Administrators.','Removable hard drives, if they are not properly configured, can be formatted and ejected by users who are not members of the Administrators Group.  Formatting and ejecting removable NTFS media must only be done by administrators.','F-45801r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Devices: Allowed to format and eject removable media" to "Administrators".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000011','C-47192r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: AllocateDASD

Value Type: REG_SZ
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1151','SV-52214r2_rule','default','low','The print driver installation privilege must be restricted to administrators.','Allowing users to install drivers can introduce malware or cause the instability of a system.  Print driver installation should be restricted to administrators.','F-45233r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Devices: Prevent users from installing printer drivers" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000089','C-46960r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers\

Value Name: AddPrinterDrivers

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-6831','SV-52934r2_rule','default','medium','Outgoing secure channel traffic must be encrypted or signed.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted.  If this policy is enabled, outgoing secure channel traffic will be encrypted and signed.','F-45860r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally encrypt or sign secure channel data (always)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000012','C-47239r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireSignOrSeal

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1163','SV-52871r2_rule','default','medium','Outgoing secure channel traffic must be encrypted when possible.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted.  If this policy is enabled, outgoing secure channel traffic will be encrypted.','F-45797r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally encrypt secure channel data (when possible)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000013','C-47188r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SealSecureChannel

Value Type: REG_DWORD
Value: 1

If the value for "Domain Member: Digitally encrypt or sign secure channel data (always)" is set to "Enabled", this can be NA (see V-6831).','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1164','SV-52872r2_rule','default','medium','Outgoing secure channel traffic must be signed when possible.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but the channel is not integrity checked.  If this policy is enabled, outgoing secure channel traffic will be signed.','F-45798r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally sign secure channel data (when possible)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000014','C-47189r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SignSecureChannel

Value Type: REG_DWORD
Value: 1

If the value for "Domain Member: Digitally encrypt or sign secure channel data (always)" is set to "Enabled", this can be NA (see V-6831).','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1165','SV-52873r1_rule','default','low','The computer account password must not be prevented from being reset.','Computer account passwords are changed automatically on a regular basis.  Disabling automatic password changes can make the system more vulnerable to malicious access.  Frequent password changes can be a significant safeguard for your system.  A new password for the computer account will be generated every 30 days.','F-45799r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Disable machine account password changes" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000015','C-47190r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: DisablePasswordChange

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3373','SV-52887r1_rule','default','low','The maximum age for machine account passwords must be set to requirements.','Computer account passwords are changed automatically on a regular basis.  This setting controls the maximum password age that a machine account may have.  This setting must be set to no more than 30 days, ensuring the machine changes its password monthly.','F-45813r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Maximum machine account password age" to "30" or less (excluding "0" which is unacceptable).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000016','C-47204r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: MaximumPasswordAge

Value Type: REG_DWORD
Value: 30 (or less, but not 0)','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3374','SV-52888r2_rule','default','medium','The system must be configured to require a strong session key.','A computer connecting to a domain controller will establish a secure channel.  Requiring strong session keys enforces 128-bit encryption between systems.','F-45814r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Require strong (Windows 2000 or Later) session key" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000017','C-47205r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireStrongKey

Value Type: REG_DWORD
Value: 1

This setting may prevent a system from being joined to a domain if not configured consistently between systems.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-11806','SV-52941r1_rule','default','low','The system must be configured to prevent the display of the last username on the logon screen.','Displaying the username of the last logged on user provides half of the userid/password equation that an unauthorized person would need to gain access.  The username of the last user to log on to a system must not be displayed.','F-45867r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Do not display last user name" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000018','C-47247r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DontDisplayLastUserName

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1090','SV-52846r2_rule','default','low','Caching of logon credentials must be limited.','The default Windows configuration caches the last logon credentials for users who log on interactively to a system.  This feature is provided for system availability reasons, such as the user"s machine being disconnected from the network or domain controllers being unavailable.  Even though the credential cache is well-protected, if a system is attacked, an unauthorized individual may isolate the password to a domain user account using a password-cracking program and gain access to the domain.','F-66507r2_fix','If the system is not a member of a domain, this is NA.

Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive Logon: Number of previous logons to cache (in case Domain Controller is not available)" to "4" logons or less.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000024','C-61743r2_chk','If the system is not a member of a domain, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name:  CachedLogonsCount

Value Type:  REG_SZ
Value:  4 (or less)','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1172','SV-52876r1_rule','default','low','Users must be warned in advance of their passwords expiring.','Creating strong passwords that can be remembered by users requires some thought.  By giving the user advance warning, the user has time to construct a sufficiently strong password.  This setting configures the system to display a warning to users telling them how many days are left before their password expires.','F-45802r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Prompt user to change password before expiration" to "14" days or more.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000025','C-47193r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: PasswordExpiryWarning

Value Type: REG_DWORD
Value: 14 (or greater)','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1166','SV-52874r2_rule','default','medium','The Windows SMB client must be enabled to perform SMB packet signing when possible.','The server message block (SMB) protocol provides the basis for many network operations.   If this policy is enabled, the SMB client will request packet signing when communicating with an SMB server that is enabled or required to perform SMB packet signing.','F-45800r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Digitally sign communications (if server agrees)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000029','C-47191r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: EnableSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1174','SV-52878r2_rule','default','low','The amount of idle time required before suspending a session must be properly set.','Open sessions can increase the avenues of attack on a system.  This setting is used to control when a computer disconnects an inactive SMB session.  If client activity resumes, the session is automatically reestablished.  This protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.','F-45804r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Amount of idle time required before suspending a session" to "15" minutes or less.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000031','C-47195r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: AutoDisconnect

Value Type: REG_DWORD
Value: 15 (or less)','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-6832','SV-52935r2_rule','default','medium','The Windows SMB client must be configured to always perform SMB packet signing.','The server message block (SMB) protocol provides the basis for many network operations.  Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB client will only communicate with an SMB server that performs SMB packet signing.','F-45861r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Digitally sign communications (always)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000028','C-47240r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: RequireSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-6833','SV-52936r2_rule','default','medium','The Windows SMB server must be configured to always perform SMB packet signing.','The server message block (SMB) protocol provides the basis for many network operations.  Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB server will only communicate with an SMB client that performs SMB packet signing.','F-45862r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Digitally sign communications (always)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000032','C-47241r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: RequireSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1162','SV-52870r2_rule','default','medium','The Windows SMB server must perform SMB packet signing when possible.','The server message block (SMB) protocol provides the basis for many network operations.   Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB server will negotiate SMB packet signing as requested by the client.','F-45796r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Digitally sign communications (if client agrees)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000033','C-47187r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: EnableSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1136','SV-52860r1_rule','default','low','Users must be forcibly disconnected when their logon hours expire.','Users must not be permitted to remain logged on to the network after they have exceeded their permitted logon hours.  In many cases, this indicates that a user forgot to log off before leaving for the day.  However, it may also indicate that a user is attempting unauthorized access at a time when the system may be less closely monitored.  Forcibly disconnecting users when logon hours expire protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.','F-45786r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Disconnect clients when logon hours expire" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000034','C-47177r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: EnableForcedLogoff

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1141','SV-52861r1_rule','default','medium','Unencrypted passwords must not be sent to a third-party SMB Server.','Some non-Microsoft SMB servers only support unencrypted (plain text) password authentication.  Sending plain text passwords across the network, when authenticating to an SMB server, reduces the overall security of the environment.  Check with the vendor of the SMB server to see if there is a way to support encrypted password authentication.','F-45787r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Send unencrypted password to connect to third-party SMB servers" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000030','C-47178r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: EnablePlainTextPassword

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3337','SV-52882r1_rule','default','high','Anonymous SID/Name translation must not be allowed.','Allowing anonymous SID/Name translation can provide sensitive information for accessing a system.  Only authorized users must be able to perform such translations.','F-45808r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Allow anonymous SID/Name translation" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Network access: Allow anonymous SID/Name translation" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26283','SV-53122r1_rule','default','high','Anonymous enumeration of SAM accounts must not be allowed.','Anonymous enumeration of SAM accounts allows anonymous log on users (null session connections) to list all accounts names, thus providing a list of potential points to attack the system.','F-46048r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow anonymous enumeration of SAM accounts" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000051','C-47428r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymousSAM

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1093','SV-52847r1_rule','default','high','Anonymous enumeration of shares must be restricted.','Allowing anonymous logon users (null session connections) to list all account names and enumerate all shared resources can provide a map of potential points to attack the system.','F-45773r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow anonymous enumeration of SAM accounts and shares" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000052','C-47164r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymous

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3377','SV-52890r1_rule','default','medium','The system must be configured to prevent anonymous users from having the same rights as the Everyone group.','Access by anonymous users must be restricted.  If this setting is enabled, then anonymous users have the same rights and permissions as the built-in Everyone group.  Anonymous users must not have these permissions or rights.','F-45816r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Let everyone permissions apply to anonymous users" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000054','C-47207r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: EveryoneIncludesAnonymous

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3338','SV-51497r2_rule','default','high','Named pipes that can be accessed anonymously must be configured to contain no values on member servers.','Named pipes that can be accessed anonymously provide the potential for gaining unauthorized system access.  Pipes are internal system communications processes.  They are identified internally by ID numbers that vary between systems.  To make access to these processes easier, these pipes are given names that do not vary between systems.  This setting controls which of these pipes anonymous users may access.','F-44296r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Named pipes that can be accessed anonymously" to be defined but containing no entries (blank).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000055-MS','C-46573r4_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: NullSessionPipes

Value Type: REG_MULTI_SZ
Value: (blank)

Legitimate applications may add entries to this registry value. If an application requires these entries to function properly and is documented with the ISSO, this would not be a finding.  Documentation must contain supporting information from the vendor"s instructions.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-6834','SV-52937r1_rule','default','high','Anonymous access to Named Pipes and Shares must be restricted.','Allowing anonymous access to named pipes or shares provides the potential for unauthorized system access.  This setting restricts access to those defined in "Network access: Named Pipes that can be accessed anonymously" and "Network access: Shares that can be accessed anonymously",  both of which must be blank under other requirements.','F-45863r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Restrict anonymous access to Named Pipes and Shares" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000058','C-47242r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: RestrictNullSessAccess

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3340','SV-52884r1_rule','default','high','Network shares that can be accessed anonymously must not be allowed.','Anonymous access to network shares provides the potential for gaining unauthorized system access by network users.  This could lead to the exposure or corruption of sensitive data.','F-45810r1_fix','Ensure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Shares that can be accessed anonymously" contains no entries (blank).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000059','C-47201r2_chk','If the following registry value does not exist, this is not a finding:

If the following registry value does exist and is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: NullSessionShares

Value Type: REG_MULTI_SZ
Value: (Blank)','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3378','SV-52891r1_rule','default','medium','The system must be configured to use the Classic security model.','Windows includes two network-sharing security models - Classic and Guest only.  With the Classic model, local accounts must be password protected; otherwise, anyone can use guest user accounts to access shared system resources.','F-45817r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Sharing and security model for local accounts" to "Classic - local users authenticate as themselves".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000060','C-47208r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: ForceGuest

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-21952','SV-53177r1_rule','default','medium','NTLM must be prevented from falling back to a Null session.','NTLM sessions that are allowed to fall back to Null (unauthenticated) sessions may gain unauthorized access.','F-46103r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Allow LocalSystem NULL session fallback" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000062','C-47483r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\LSA\MSV1_0\

Value Name: allownullsessionfallback

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-21953','SV-53178r1_rule','default','medium','PKU2U authentication using online identities must be prevented.','PKU2U is a peer-to-peer authentication protocol.   This setting prevents online identities from authenticating to domain-joined systems.  Authentication will be centrally managed with Windows user accounts.','F-46104r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Allow PKU2U authentication requests to this computer to use online identities" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000063','C-47484r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\LSA\pku2u\

Value Name: AllowOnlineID

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1153','SV-52865r1_rule','default','high','The LanMan authentication level must be set to send NTLMv2 response only, and to refuse LM and NTLM.','The Kerberos v5 authentication protocol is the default for authentication of users who are logging on to domain accounts.  NTLM, which is less secure, is retained in later Windows versions  for compatibility with clients and servers that are running earlier versions of Windows or applications that still use it.  It is also used to authenticate logons to stand-alone computers that are running later versions.','F-45791r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: LAN Manager authentication level" to "Send NTLMv2 response only. Refuse LM AND NTLM".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000067','C-47182r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: LmCompatibilityLevel

Value Type: REG_DWORD
Value: 5','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3379','SV-52892r2_rule','default','high','The system must be configured to prevent the storage of the LAN Manager hash of passwords.','The LAN Manager hash uses a weak encryption algorithm and there are several tools available that use this hash to retrieve account passwords.  This setting controls whether or not a LAN Manager hash of the password is stored in the SAM the next time the password is changed.','F-45818r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Do not store LAN Manager hash value on next password change" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000065','C-47209r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: NoLMHash

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3382','SV-52895r1_rule','default','medium','The system must be configured to meet the minimum session security requirement for NTLM SSP-based clients.','Microsoft has implemented a variety of security support providers for use with RPC sessions.  All of the options must be enabled to ensure the maximum security level.','F-45821r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Minimum session security for NTLM SSP based (including secure RPC) clients" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000069','C-47212r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinClientSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56362','SV-50462r1_rule','default','high','Verify time configuration - Enable NTPServer','This rule verifies that NTPServer is enabled.','F-56000','
Configure the following registry value:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer

Value Name: Enabled

Value Type: REG_DWORD 
Value: 1' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \System\CurrentControlSet\Services\W32Time\TimeProviders\NtpServer

Value Name: Enabled

Value Type: REG_DWORD 
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1075','SV-52840r1_rule','default','low','The shutdown option must not be available from the logon dialog box.','Displaying the shutdown button may allow individuals to shut down a system anonymously.  Only authenticated users should be allowed to shut down the system.  Preventing display of this button in the logon dialog box ensures that individuals who shut down the system are authorized and tracked in the system"s Security event log.','F-45766r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Shutdown: Allow system to be shutdown without having to log on" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000073','C-47157r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ShutdownWithoutLogon

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3385','SV-52897r1_rule','default','medium','The system must be configured to require case insensitivity for non-Windows subsystems.','This setting controls the behavior of non-Windows subsystems when dealing with the case of arguments or commands.  Case sensitivity could lead to the access of files or commands that must be restricted.  To prevent this from happening, case insensitivity restrictions must be required.','F-45823r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System objects: Require case insensitivity for non-Windows subsystems" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000075','C-47214r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\Kernel\

Value Name: ObCaseInsensitive

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1173','SV-52877r1_rule','default','low','The default permissions of global system objects must be increased.','Windows systems maintain a global list of shared system resources such as DOS device names, mutexes, and semaphores.  Each type of object is created with a default DACL that specifies who can access the objects with what permissions.  If this policy is enabled, the default DACL is stronger, allowing nonadministrative users to read shared objects, but not modify shared objects that they did not create.','F-45803r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000076','C-47194r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\

Value Name: ProtectionMode

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14234','SV-52946r1_rule','default','medium','User Account Control approval mode for the built-in Administrator must be enabled.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures the built-in Administrator account so that it runs in Admin Approval Mode.','F-45872r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Admin Approval Mode for the Built-in Administrator account" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000077','C-47252r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: FilterAdministratorToken

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15991','SV-52223r2_rule','default','medium','UIAccess applications must not be allowed to prompt for elevation without using the secure desktop.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting prevents User Interface Accessibility programs from disabling the secure desktop for elevation prompts.','F-45241r1_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000086','C-46966r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableUIADesktopToggle

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14235','SV-52947r1_rule','default','medium','User Account Control must, at minimum, prompt administrators for consent.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures the elevation requirements for logged on administrators to complete a task that requires raised privileges.','F-45873r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode" to "Prompt for consent".

More secure options for this setting would also be acceptable (e.g., Prompt for credentials, Prompt for consent (or credentials) on the secure desktop).' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000078','C-47253r2_chk','UAC requirements are NA on Server Core installations.

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

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Behavior of the elevation prompt for standard users" to "Automatically deny elevation requests".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000079','C-47254r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorUser

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14237','SV-52949r1_rule','default','medium','User Account Control must be configured to detect application installations and prompt for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting requires Windows to respond to application installation requests by prompting for credentials.','F-45875r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Detect application installations and prompt for elevation" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000080','C-47255r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableInstallerDetection

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14239','SV-52950r1_rule','default','medium','User Account Control must only elevate UIAccess applications that are installed in secure locations.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures Windows to only allow applications installed in a secure location on the file system, such as the Program Files or the Windows\System32 folders, to run with elevated privileges.','F-45876r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Only elevate UIAccess applications that are installed in secure locations" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000082','C-47256r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableSecureUIAPaths

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14240','SV-52951r1_rule','default','medium','User Account Control must run all administrators in Admin Approval Mode, enabling UAC.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting enables UAC.','F-45877r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Run all administrators in Admin Approval Mode" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000083','C-47257r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableLUA

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14241','SV-52952r1_rule','default','medium','User Account Control must switch to the secure desktop when prompting for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting ensures that the elevation prompt is only used in secure desktop mode.','F-45878r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Switch to the secure desktop when prompting for elevation" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000084','C-47258r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: PromptOnSecureDesktop

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14242','SV-52953r1_rule','default','medium','User Account Control must virtualize file and registry write failures to per-user locations.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures non-UAC-compliant applications to run in virtualized file and registry entries in per-user locations, allowing them to run.','F-45879r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Virtualize file and registry write failures to per-user locations" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000085','C-47259r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableVirtualization

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-1145','SV-52107r2_rule','default','medium','Automatic logons must be disabled.','Allowing a system to automatically log on when the machine is booted could give access to any unauthorized individual who restarts the computer.  Automatic logon with administrator privileges would give full access to an unauthorized individual.If the DefaultName or DefaultDomainName in the same registry path contain an administrator account name and the DefaultPassword contains a value, this is a CAT I finding.','F-45132r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)" to "Disabled".

Ensure no passwords are stored in the "DefaultPassword" registry value noted below:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: DefaultPassword

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000036','C-46924r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: AutoAdminLogon

Type: REG_SZ
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-4110','SV-52924r1_rule','default','low','The system must be configured to prevent IP source routing.','Configuring the system to disable IP source routing protects against spoofing.','F-45850r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)" to "Highest protection, source routing is completely disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000038','C-47229r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: DisableIPSourceRouting

Value Type: REG_DWORD
Value: 2','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-21955','SV-53180r2_rule','default','low','IPv6 source routing must be configured to the highest protection level.','Configuring the system to disable IPv6 source routing protects against spoofing.','F-46106r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)" to "Highest protection, source routing is completely disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000037','C-47486r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\

Value Name: DisableIPSourceRouting

Type: REG_DWORD
Value: 2','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15696','SV-53072r1_rule','default','medium','The Mapper I/O network protocol (LLTDIO) driver must be disabled.','The Mapper I/O network protocol (LLTDIO) driver allows the discovery of the connected network and allows various options to be enabled.  Disabling this helps protect the system from potentially discovering and connecting to unauthorized devices.','F-45998r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Link-Layer Topology Discovery -> "Turn on Mapper I/O (LLTDIO) driver" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000001','C-47378r2_chk','If the following registry values do not exist or are not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\LLTD\

Value Name: AllowLLTDIOOndomain
Value Name: AllowLLTDIOOnPublicNet
Value Name: EnableLLTDIO
Value Name: ProhibitLLTDIOOnPrivateNet

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15697','SV-53081r1_rule','default','medium','The Responder network protocol driver must be disabled.','The Responder network protocol driver allows a computer to be discovered and located on a network.  Disabling this helps protect the system from potentially being discovered and connected to by unauthorized devices.','F-46007r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Link-Layer Topology Discovery -> "Turn on Responder (RSPNDR) driver" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000002','C-47387r2_chk','If the following registry values do not exist or are not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\LLTD\

Value Name: AllowRspndrOndomain
Value Name: AllowRspndrOnPublicNet
Value Name: EnableRspndr
Value Name: ProhibitRspndrOnPrivateNet

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15666','SV-53012r1_rule','default','medium','Windows Peer-to-Peer networking services must be turned off.','Peer-to-Peer applications can allow unauthorized access to a system and exposure of sensitive data.  This setting will turn off the Microsoft Peer-to-Peer Networking Service.','F-45939r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Microsoft Peer-to-Peer Networking Services -> "Turn off Microsoft Peer-to-Peer Networking Services" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000003','C-47319r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Peernet\

Value Name: Disabled

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15667','SV-53014r2_rule','default','medium','Network Bridges must be prohibited in Windows.','A Network Bridge can connect two or more network segments, allowing unauthorized access or exposure of sensitive data.  This setting prevents a Network Bridge from being installed and configured.','F-45941r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Network Connections -> "Prohibit installation and configuration of Network Bridge on your DNS domain network" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000004','C-47321r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Network Connections\

Value Name: NC_AllowNetBridge_NLA

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-21960','SV-53182r1_rule','default','low','Domain users must be required to elevate when setting a networks location.','Selecting an incorrect network location may allow greater exposure of a system.  Elevation is required by default on nondomain systems to change network location.  This setting configures elevation to also be required on domain-joined systems.','F-46108r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Network Connections -> "Require domain users to elevate when setting a network"s location" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000005','C-47488r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Network Connections\

Value Name: NC_StdDomainUserSetLocation

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15698','SV-53085r1_rule','default','medium','The configuration of wireless devices using Windows Connect Now must be disabled.','Windows Connect Now allows the discovery and configuration of devices over wireless.  Wireless devices must be managed.  If a rogue device is connected to a system, there is potential for sensitive information to be compromised.','F-46011r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Windows Connect Now -> "Configuration of wireless settings using Windows Connect Now" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000012','C-47391r2_chk','If the following registry values do not exist or are not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WCN\Registrars\

Value Name: DisableFlashConfigRegistrar
Value Name: DisableInBand802DOT11Registrar
Value Name: DisableUPnPRegistrar
Value Name: DisableWPDRegistrar
Value Name: EnableRegistrars

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15699','SV-53089r1_rule','default','medium','The Windows Connect Now wizards must be disabled.','Windows Connect Now provides wizards for tasks such as "Set up a wireless router or access point" and must not be available to users.  Functions such as these may allow unauthorized connections to a system and the potential for sensitive information to be compromised.','F-46015r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Windows Connect Now -> "Prohibit access of the Windows Connect Now wizards" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000013','C-47395r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WCN\UI\

Value Name: DisableWcnUi

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-36439','SV-51590r2_rule','default','medium','Local administrator accounts must have their privileged token filtered to prevent elevated privileges from being used over the network on domain systems.','A compromised local administrator account can provide means for an attacker to move laterally between domain systems.

With User Account Control enabled, filtering the privileged token for local administrator accounts will prevent the elevated privileges of these accounts from being used over the network.','F-44715r2_fix','Configure the following registry value:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System

Value Name:  LocalAccountTokenFilterPolicy

Type:  REG_DWORD
Value:  0' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-RG-000003-MS','C-46849r2_chk','If the system is not a member of a domain, this is NA.
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System

Value Name:  LocalAccountTokenFilterPolicy

Type:  REG_DWORD
Value:  0

This setting may cause issues with some network scanning tools if local administrative accounts are used remotely. Scans should use domain accounts where possible. If a local administrative account must be used, temporarily enabling the privileged token by configuring the registry value to 1 may be required.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-4448','SV-52933r1_rule','default','medium','Group Policy objects must be reprocessed even if they have not changed.','Enabling this setting and then selecting the "Process even if the Group Policy objects have not changed" option ensures that the policies will be reprocessed even if none have been changed.  This way, any unauthorized changes are forced to match the domain-based group policy settings again.','F-45859r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Group Policy -> "Configure registry policy processing" to "Enabled" and select the option "Process even if the Group Policy objects have not changed".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000028','C-47238r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\

Value Name: NoGPOListChanges

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3469','SV-52906r1_rule','default','medium','Group Policies must be refreshed in the background if the user is logged on.','If this setting is enabled, then Group Policy settings are not refreshed while a user is currently logged on.  This could lead to instances when a user does not have the latest changes to a policy applied and is therefore operating in an insecure context.','F-45832r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Group Policy -> "Turn off background refresh of Group Policy" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000029','C-47221r2_chk','Review the registry.
If the following registry value does not exist, this is not a finding (this is the expected result from configuring the policy as outlined in the Fix section.):
If the following registry value exists but is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\system\

Value Name: DisableBkGndGroupPolicy

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14260','SV-52998r1_rule','default','medium','Downloading print driver packages over HTTP must be prevented.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents the computer from downloading print driver packages over HTTP.','F-45925r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> "Turn off downloading of print drivers over HTTP" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000032','C-47305r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Printers\

Value Name: DisableWebPnPDownload

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14256','SV-32398r1_rule','default','medium','Web publishing and online ordering wizards will be prevented from downloading a list of providers.','This check verifies that the system is configured to prevent Windows from downloading a list of providers for the Web publishing and online ordering wizards.','F-13581r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication setting â€˜Turn off Internet download for Web publishing and online ordering wizardsâ€™ to â€œEnabledâ€?.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','5.126','http://oval.mitre.org/XMLSchema/oval-definitions-5','If the following registry value doesnâ€™t exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Subkey: \Software\Microsoft\Windows\CurrentVersion\Policies\Explorer

Value Name: NoWebServices

Type: REG_DWORD
Value: 1 ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15676','SV-32414r1_rule','default','low','The Order Prints Online wizard will be turned off.','This check verifies that the â€œOrder Prints Onlineâ€? task is not available in Windows Explorer.','F-15543r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -gt; Internet Communication Management -> Internet Communication settings â€œTurn off the â€œOrder Printsâ€? picture taskâ€? to â€œEnabledâ€?.' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','5.219','http://oval.mitre.org/XMLSchema/oval-definitions-5','If the following registry value doesnâ€™t exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Subkey: \Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\

Value Name: NoOnlinePrintsWizard

Type: REG_DWORD
Value: 1 ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56543','SV-50462r1_rule','default','high','The system configuration for "Publish to Web" task for files and folders must be turned off.','
This rule defines whether to make the tasks for publishing files, folders and selected items to web available from File and Folder Tasks in Window folders. For all profiles, the recommended state for this setting is Enabled.','F-56000','
Configure the following registry value:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer

Value Name: NoPublishingWizard

Type: REG_DWORD
Value: 1
' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer

Value Name: NoPublishingWizard

Type: REG_DWORD
Value: 1 ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-16020','SV-53143r1_rule','default','medium','The Windows Customer Experience Improvement Program must be disabled.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting ensures the Windows Customer Experience Improvement Program is disabled so information is not passed to the vendor.','F-46069r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication Settings -> "Turn off Windows Customer Experience Improvement Program" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000045','C-47449r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\SQMClient\Windows\

Value Name: CEIPEnable

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15715','SV-71721r1_rule','default','medium','The system must be configured to generate error reports.','Enabling Windows Error Reporting generates information useful to system administrators and forensics analysts for diagnosing system problems and investigating intrusions.  If Windows Error Reporting is turned off, valuable system diagnostic and vulnerability information may be lost.','F-62501r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> "Disable Windows Error Reporting" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-ER-000002','C-58139r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\

Value Name:  Disabled

Type:  REG_DWORD
Value:  0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15705','SV-53131r1_rule','default','medium','Users must be prompted to authenticate on resume from sleep (on battery).','Authentication must always be required when accessing a system.  This setting ensures the user is prompted for a password on resume from sleep (on battery).','F-46057r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Power Management -> Sleep Settings -> "Require a password when a computer wakes (on battery)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000054','C-47437r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\

Value Name: DCSettingIndex

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15706','SV-53132r1_rule','default','medium','The user must be prompted to authenticate on resume from sleep (plugged in).','Authentication must always be required when accessing a system.  This setting ensures the user is prompted for a password on resume from sleep (plugged in).','F-46058r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Power Management -> Sleep Settings -> "Require a password when a computer wakes (plugged in)" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000055','C-47438r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\

Value Name: ACSettingIndex

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3470','SV-52917r1_rule','default','medium','The system must be configured to prevent unsolicited remote assistance offers.','Remote assistance allows another user to view or take control of the local session of a user.  Unsolicited remote assistance is help that is offered by the remote user.  This may allow unauthorized parties access to the resources on the computer.','F-45843r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Assistance -> "Configure Offer Remote Assistance" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000058','C-47222r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fAllowUnsolicited

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3343','SV-52885r1_rule','default','high','Solicited Remote Assistance must not be allowed.','Remote assistance allows another user to view or take control of the local session of a user.  Solicited assistance is help that is specifically requested by the local user.  This may allow unauthorized parties access to the resources on the computer.','F-45811r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Assistance -> "Configure Solicited Remote Assistance" to "Disabled".
Windows 2008 R2:Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Assistance "Solicited Remote Assistance" to "Disabled".' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000059','C-47202r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fAllowToGetHelp

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-21967','SV-53187r1_rule','default','low','Microsoft Support Diagnostic Tool (MSDT) interactive communication with Microsoft must be prevented.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents the MSDT from communicating with and sending collected data to Microsoft, the default support provider.','F-46113r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Troubleshooting and Diagnostics -> Microsoft Support Diagnostic Tool -> "Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000066','C-47493r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy\

Value Name: DisableQueryRemoteServer

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-21970','SV-53128r1_rule','default','low','Responsiveness events must be prevented from being aggregated and sent to Microsoft.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents responsiveness events from being aggregated and sent to Microsoft.','F-46054r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Troubleshooting and Diagnostics -> Windows Performance PerfTrack -> "Enable/Disable PerfTrack" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000068','C-47434r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}\

Value Name: ScenarioExecutionEnabled

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-21973','SV-53126r2_rule','default','high','Autoplay must be turned off for non-volume devices.','Allowing Autoplay to execute may introduce malicious code to a system.  Autoplay begins reading from a drive as soon as media is inserted into the drive.  As a result, the setup file of programs or music on audio media may start.  This setting will disable Autoplay for non-volume devices (such as Media Transfer Protocol (MTP) devices).','F-46052r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Disallow Autoplay for non-volume devices" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000072','C-47432r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Explorer\

Value Name: NoAutoplayfornonVolume

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-22692','SV-53124r2_rule','default','high','The default Autorun behavior must be configured to prevent Autorun commands.','Allowing Autorun commands to execute may introduce malicious code to a system.  Configuring this setting prevents Autorun commands from executing.','F-46050r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Set the default behavior for AutoRun" to "Enabled:Do not execute any autorun commands".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000073','C-47430r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\

Value Name: NoAutorun

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-2374','SV-52879r2_rule','default','high','Autoplay must be disabled for all drives.','Allowing Autoplay to execute may introduce malicious code to a system.  Autoplay begins reading from a drive as soon media is inserted into the drive.  As a result, the setup file of programs or music on audio media may start.  By default, Autoplay is disabled on removable drives, such as the floppy disk drive (but not the CD-ROM drive) and on network drives.  Enabling this policy disables Autoplay on all drives.','F-45805r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Turn off AutoPlay" to "Enabled:All Drives".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000074','C-47196r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\

Value Name: NoDriveTypeAutoRun

Type: REG_DWORD
Value: 0x000000ff (255)','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-36700','SV-51740r1_rule','default','medium','The password reveal button must not be displayed.','Visible passwords may be seen by nearby persons, compromising them.  The password reveal button can be used to display an entered password and must not be allowed.','F-44815r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Credential User Interface -> "Do not display the password reveal button" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000076','C-46869r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\CredUI\

Value Name: DisablePasswordReveal

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14243','SV-52955r1_rule','default','medium','The system must require username and password to elevate a running application.','Enumeration of administrator accounts when elevating can provide part of the logon information to an unauthorized user.  This setting configures the system to always require users to type in a username and password to elevate a running application.','F-45881r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Credential User Interface -> "Enumerate administrator accounts on elevation" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000077','C-47261r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\CredUI\

Value Name: EnumerateAdministrators

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56364','SV-50462r1_rule','default','high','Application Event Log must be configured to retained old events when the log file reaches its maximum size.','
This rule setting controls Event Log behavior when the log file reaches its maximum size. Old events may or may not be retained according to the â€œBackup log automatically when fullâ€? policy setting. The default setting for this rule is Disabled.','F-56000','
Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Application 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 

Altenative method : 

"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> Control Event Log behavior when the log file reaches its maximum size" to Enabled "Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> Back up log automatically when full" to Enabled.' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Application

Value Name: AutoBackupLogFiles
Value Name: Retention

Type: REG_SZ
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26579','SV-52966r1_rule','default','medium','The Application event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45892r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000084','C-47272r3_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Application\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56370','SV-50462r1_rule','default','high','Security Event Log must be configured to retained old events when the log file reaches its maximum size.','
This rule setting controls Event Log behaviour when the log file reaches its maximum size. Old events may or may not be retained according to the â€œBackup log automatically when fullâ€? policy setting. The default setting for this rule is Disabled.','F-56000','
Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Security 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 

Altenative method : 

Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security-> Control Event Log behavior when the log file reaches its maximum size" to Enabled "Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security-> Back up log automatically when full" to Enabled' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 
Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Security

Value Name: AutoBackupLogFiles
Value Name: Retention

Type: REG_SZ
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26580','SV-52965r1_rule','default','medium','The Security event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45891r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security -> "Specify the maximum log size (KB)" to at minimum "Enabled:196608".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000085','C-47271r3_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Security\

Value Name:  MaxSize

Type: REG_DWORD
Value: 196608 or greater','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26581','SV-52964r1_rule','default','medium','The Setup event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45890r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Setup -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000086','C-47270r2_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Setup\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26582','SV-52963r1_rule','default','medium','The System event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45889r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000087','C-47269r2_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\System\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768 or greater','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15718','SV-53137r1_rule','default','low','Turning off File Explorer heap termination on corruption must be disabled.','Legacy plug-in applications may continue to function when a File Explorer session has become corrupt.  Disabling this feature will prevent this.','F-46063r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> File Explorer -> "Turn off heap termination on corruption" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000090','C-47443r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Explorer\

Value Name: NoHeapTerminationOnCorruption

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14247','SV-52958r1_rule','default','medium','Passwords must not be saved in the Remote Desktop Client.','Saving passwords in the Remote Desktop Client could allow an unauthorized user to establish a remote desktop session to another system.  The system must be configured to prevent users from saving passwords in the Remote Desktop Client.','F-45884r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Connection Client -> "Do not allow passwords to be saved" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000096','C-47264r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: DisablePasswordSaving

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3449','SV-52216r2_rule','default','medium','Remote Desktop Services must limit users to one remote session.','Allowing multiple Remote Desktop Services sessions could consume resources.  There is also potential to make a secondary connection to a system with compromised credentials.','F-45235r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Connections -> "Restrict Remote Desktop Services users to a single Remote Desktop Services Session" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000131','C-46962r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fSingleSessionPerUser

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15997','SV-52224r2_rule','default','medium','Users must be prevented from mapping local COM ports and redirecting data from the Remote Desktop Session Host to local COM ports.  (Remote Desktop Services Role).','Preventing the redirection of Remote Desktop session data to a client computer"s COM ports helps reduce possible exposure of sensitive data.','F-45242r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow COM port redirection" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000132','C-46967r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisableCcm

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-14249','SV-52959r1_rule','default','medium','Local drives must be prevented from sharing with Remote Desktop Session Hosts.  (Remote Desktop Services Role).','Preventing users from sharing the local drives on their client computers to Remote Session Hosts that they access helps reduce possible exposure of sensitive data.','F-45885r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow drive redirection" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000098','C-47265r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisableCdm

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15998','SV-52226r2_rule','default','medium','Users must be prevented from mapping local LPT ports and redirecting data from the Remote Desktop Session Host to local LPT ports.  (Remote Desktop Services Role).','Preventing the redirection of Remote Desktop session data to a client computer"s LPT ports helps reduce possible exposure of sensitive data.','F-45244r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow LPT port redirection" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000133','C-46968r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisableLPT

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15700','SV-53094r1_rule','default','medium','Remote access to the Plug and Play interface must be disabled for device installation.','Remote access to the Plug and Play interface could potentially allow connections by unauthorized devices.  This setting configures remote access to the Plug and Play interface and must be disabled.','F-46020r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Device Installation -> "Allow remote access to the Plug and Play interface" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000019','C-47400r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\DeviceInstall\Settings\

Value Name: AllowRemoteRPC

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15999','SV-52229r2_rule','default','medium','Users must be prevented from redirecting Plug and Play devices to the Remote Desktop Session Host.  (Remote Desktop Services Role).','Preventing the redirection of Plug and Play devices in Remote Desktop sessions helps reduce possible exposure of sensitive data.','F-45246r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow supported Plug and Play device redirection" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000135','C-46969r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisablePNPRedir

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3453','SV-52898r1_rule','default','medium','Remote Desktop Services must always prompt a client for passwords upon connection.','This setting controls the ability of users to supply passwords automatically as part of their remote desktop connection.  Disabling this setting would allow anyone to use the stored credentials in a connection item to connect to the terminal server.','F-45824r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Security -> "Always prompt for password upon connection" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000099','C-47215r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fPromptForPassword

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-3454','SV-52899r2_rule','default','medium','Remote Desktop Services must be configured with the client connection encryption set to the required level.','Remote connections must be encrypted to prevent interception of data or sensitive information. Selecting "High Level" will ensure encryption of Remote Desktop Services sessions in both directions.','F-45825r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Security -> "Set client connection encryption level" to "Enabled" and "High Level".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000100','C-47216r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: MinEncryptionLevel

Type: REG_DWORD
Value: 3','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15682','SV-53040r1_rule','default','medium','Attachments must be prevented from being downloaded from RSS feeds.','Attachments from RSS feeds may not be secure.  This setting will prevent attachments from being downloaded from RSS feeds.','F-45966r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> RSS Feeds -> "Prevent downloading of enclosures" to "Enabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000105','C-47346r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Internet Explorer\Feeds\

Value Name: DisableEnclosureDownload

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15713','SV-53134r2_rule','default','medium','Microsoft Active Protection Service membership must be disabled.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this feature will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.  This setting disables Microsoft Active Protection Service membership and reporting.','F-62313r2_fix','Windows 2012 R2:
Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Defender -> MAPS -> "Join Microsoft MAPS" to "Disabled".

Windows 2012:
Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Defender -> "Configure Microsoft Active Protection Service Reporting" to "Disabled".

Windows 2008 R2:
Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Defender -> "Configure Microsoft Spynet Reporting" to "Disabled".' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000111','C-47440r4_chk','If the following registry value exists and is set to "1" (Basic) or "2" (Advanced), this is a finding:

If the registry value does not exist, this is not a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows Defender\SpyNet\

Value Name:  SpyNetReporting

Type:  REG_DWORD
Value:  1 or 2 = a Finding','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-57477','SV-71961r1_rule','default','medium','The system must be configured to automatically consent to send all data requested by a local or DOD-wide error collection site.','Configuring error reporting to send all requested data ensures all relevant data associated with the error report is captured for later analysis.  This setting determines the default consent behavior of Windows Error Reporting.','F-62767r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Consent -> "Configure Default consent" to "Enabled" with "Send all data" selected for "Consent level".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-ER-000017','C-58399r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent\

Value Name:  DefaultConsent

Type:  REG_DWORD
Value:  0x00000004 (4)','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15685','SV-53061r1_rule','default','medium','Users must be prevented from changing installation options.','Installation options for applications are typically controlled by administrators.  This setting prevents users from changing installation options that may bypass security features.','F-45986r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Installer -> "Allow user control over installs" to "Disabled".' , 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000115','C-47366r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Installer\

Value Name: EnableUserControl

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-34974','SV-52954r1_rule','default','high','The Windows Installer Always install with elevated privileges option must be disabled.','Standard user accounts must not be granted elevated privileges.  Enabling Windows Installer to elevate privileges when installing applications can allow malicious persons and applications to gain full control of a system.','F-45880r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Installer -> "Always install with elevated privileges" to "Disabled".' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000116','C-47260r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Installer\

Value Name: AlwaysInstallElevated

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-15684','SV-53056r2_rule','default','medium','Users must be notified if a web-based program attempts to install software.','Users must be aware of attempted program installations.  This setting ensures users are notified if a web-based program attempts to install software.','F-45982r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Installer -> "Prevent Internet Explorer security prompt for Windows Installer scripts" to "Disabled".', 
'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-CC-000117','C-47359r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Installer\

Value Name: SafeForScripting

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-4442','SV-52930r1_rule','default','low','The system must be configured to have password protection take effect within a limited time frame when the screen saver becomes active.','Allowing more than several seconds makes the computer vulnerable to a potential attack from someone walking up to the console to attempt to log on to the system before the lock takes effect.','F-45856r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)" to "5" or less.

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'Santander-CIS-Windows-2012-R2 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000046','C-47235r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: ScreenSaverGracePeriod

Value Type: REG_SZ
Value: 5 (or less)','Customized rule by Cloud Raxak') from dual;