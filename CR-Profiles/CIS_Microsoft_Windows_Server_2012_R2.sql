select add_profile_data ('CIS Microsoft Windows Server 2012 R2' ,'Profile Customized by CloudRaxak' ,'Windows-based OS','' ,'2018-08-01' ,'Profile by Cloud Raxak') from dual;

--1 Account Policies
--1.1 Password Policy

--CIS 1.1.1 (L1)
select add_rule_data ('default','V-1107','SV-52853r1_rule','default','medium','The password history must be configured to 24 passwords remembered.','A system is more vulnerable to unauthorized access when system users recycle the same password several times without being required to change to a unique password on a regularly scheduled basis.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45779r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Enforce password history" to "24" passwords remembered.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AC-000004','C-47170r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

The value for "Enforce password history" is must be "24" passwords remembered,if not this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 1.1.2 (L1) 
select add_rule_data ('default','V-1104','SV-52851r1_rule','default','medium','The maximum password age must meet requirements.','The longer a password is in use, the greater the opportunity for someone to gain unauthorized knowledge of the passwords.   Scheduled changing of passwords hinders the ability of unauthorized system users to crack passwords and gain access to a system.','F-45777r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Maximum password age" to "60" days or less (excluding "0" which is unacceptable).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AC-000005','C-47168r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Maximum password age" is greater than "60" days, this is a finding.  If the value is set to "0" (never expires), this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 1.1.3 (L1)
select add_rule_data ('default','V-1105','SV-52852r1_rule','default','medium','The minimum password age must meet requirements.','Permitting passwords to be changed in immediate succession within the same day allows users to cycle passwords through their history database.  This enables users to effectively negate the purpose of mandating periodic password changes.','F-45778r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password age" to at least "1" day.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AC-000006','C-47169r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password age" is set to "0" days ("Password can be changed immediately."), this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 1.1.4 (L1)
select add_rule_data ('default','V-6836','SV-52938r2_rule','default','medium','Passwords must, at a minimum, be 14 characters.','Information systems not protected with strong password schemes (including passwords of minimum length) provide the opportunity for anyone to crack the password, thus gaining access to the system and compromising the device, information, or the local network.','F-45864r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Minimum password length" to "14" characters.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AC-000007','C-47243r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for the "Minimum password length," is less than "14" characters, this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 1.1.5 (L1)
select add_rule_data ('default','V-1150','SV-52863r1_rule','default','low','The built-in Microsoft password complexity filter must be enabled.','The use of complex passwords increases their strength against guessing and brute-force attacks. The built-in Windows password complexity policy requires passwords to contain at least 3 of the 4 types of characters (numbers, upper- and lower-case letters, and special characters), as well as preventing the inclusion of user names or parts of.','F-45789r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Password must meet complexity requirements" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AC-000008','C-47180r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for "Password must meet complexity requirements" is not set to "Enabled", this is a finding.

If the site is using a password filter that requires this setting be set to "Disabled" for the filter code to be used, this would not be considered a finding.  If this setting does not affect the use of an external password filter, it will be enabled for fall-back purposes.','Customized rule by Cloud Raxak') from dual;

--CIS 1.1.6 (L1)
select add_rule_data ('default','V-2372','SV-52880r1_rule','default','high','Reversible password encryption must be disabled.','Storing passwords using reversible encryption is essentially the same as storing clear-text versions of the passwords.  For this reason, this policy must never be enabled.','F-45806r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy -> "Store password using reversible encryption" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AC-000009','C-47197r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Password Policy.

If the value for "Store password using reversible encryption" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;


--2.2 User Assigment Rights

--CIS 2.2.1 (L1)
select add_rule_data ('default','V-26469','SV-53120r1_rule','default','medium','Unauthorized accounts must not have the Access Credential Manager as a trusted caller user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access Credential Manager as a trusted caller" user right may be able to retrieve the credentials of other accounts from Credential Manager.','F-46046r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Access Credential Manager as a trusted caller" to be defined but containing no entries (blank).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000001','C-47426r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Access Credential Manager as a trusted caller" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.2 (L1)
select add_rule_data ('default','V-26470','SV-51499r3_rule','default','medium','Unauthorized accounts must not have the Access this computer from the network user right on member servers.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access this computer from the network" user right may access resources on the system, and must be limited to those that require it.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-49518r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Access this computer from the network" to only include the following accounts or groups:

Administrators
Authenticated Users

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000002-MS','C-49426r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Access this computer from the network" user right, this is a finding:

Administrators
Authenticated Users

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.3 (L1)
select add_rule_data ('default','V-1102','SV-52108r2_rule','default','high','Unauthorized accounts must not have the Act as part of the operating system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Act as part of the operating system" user right can assume the identity of any user and gain access to resources that user is authorized to access.  Any accounts with this right can take complete control of a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45133r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Act as part of the operating system" to be defined but containing no entries (blank).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000003','C-46925r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups (to include administrators), are granted the "Act as part of the operating system" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.5 (L1)
select add_rule_data ('default','V-26471','SV-52109r2_rule','default','medium','Unauthorized accounts must not have the Adjust memory quotas for a process user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Adjust memory quotas for a process" user right can adjust memory that is available to processes, and could be used in a denial of service (DoS) attack.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45134r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Adjust memory quotas for a process" to only include the following accounts or groups:

Administrators
Local Service
Network Service' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000004','C-46926r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Adjust memory quotas for a process" user right, this is a finding:

Administrators
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.6 (L1)
select add_rule_data ('default','V-26472','SV-52110r2_rule','default','medium','Unauthorized accounts must not have the Allow log on locally user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Allow log on locally" user right can log on interactively to a system.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45135r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Allow log on locally" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000005','C-46927r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Allow log on locally" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.8 (L1)
select add_rule_data ('default','V-26474','SV-52111r2_rule','default','medium','Unauthorized accounts must not have the back up files and directories user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Back up files and directories" user right can circumvent file and directory permissions and could allow access to sensitive data.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45136r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Back up files and directories" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000007','C-46928r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Back up files and directories" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.9 (L1)
select add_rule_data ('default','V-26476','SV-53118r1_rule','default','medium','Unauthorized accounts must not have the Change the system time user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the system time" user right can change the system time, which can impact authentication, as well as affect time stamps on event log entries.','F-46044r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the system time" to only include the following accounts or groups:

Administrators
Local Service' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000009','C-47424r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the system time" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.10 (L1)
select add_rule_data ('default','V-26477','SV-53117r1_rule','default','low','Unauthorized accounts must not have the Change the time zone user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Change the time zone" user right can change the time zone of a system.','F-46043r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Change the time zone" to only include the following accounts or groups:

Administrators
Local Service' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000010','C-47423r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Change the time zone" user right, this is a finding:

Administrators
Local Service','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.11 (L1)
select add_rule_data ('default','V-26478','SV-53063r1_rule','default','medium','Unauthorized accounts must not have the Create a pagefile user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create a pagefile" user right can change the size of a pagefile, which could affect system performance.','F-45989r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create a pagefile" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000011','C-47369r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create a pagefile" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.12 (L1)
select add_rule_data ('default','V-26479','SV-52113r2_rule','default','high','Unauthorized accounts must not have the Create a token object user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Create a token object" user right allows a process to create an access token. This could be used to provide elevated rights and compromise a system.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45138r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create a token object" to be defined but containing no entries (blank).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000012','C-46930r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Create a token object" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.13 (L1)
select add_rule_data ('default','V-26480','SV-52114r2_rule','default','medium','Unauthorized accounts must not have the Create global objects user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create global objects" user right can create objects that are available to all sessions, which could affect processes in other users" sessions.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45139r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create global objects" to only include the following accounts or groups:

Administrators
Service
Local Service
Network Service' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000013','C-46931r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create global objects" user right, this is a finding:

Administrators
Service
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.14 (L1)
select add_rule_data ('default','V-26481','SV-53059r1_rule','default','medium','Unauthorized accounts must not have the Create permanent shared objects user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create permanent shared objects" user right could expose sensitive data by creating shared objects.','F-45985r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Create permanent shared objects" to be defined but containing no entries (blank).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000014','C-47365r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Create permanent shared objects" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.15 (L1)
select add_rule_data ('default','V-26482','SV-53054r2_rule','default','medium','Unauthorized accounts must not have the Create symbolic links user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create symbolic links" user right can create pointers to other objects, which could potentially expose the system to attack.','F-66511r1_fix','Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Create symbolic links" to only include the following accounts or groups:

Administrators

Systems that have the Hyper-V role will also have "Virtual Machines" given this user right.  If this needs to be added manually, enter it as "NT Virtual Machine\Virtual Machines".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000015','C-61747r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create symbolic links" user right, this is a finding:

Administrators

Systems that have the Hyper-V role will also have "Virtual Machines" given this user right (this may be displayed as "NT Virtual Machine\Virtual Machines").  This is not a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.16 (L1)
select add_rule_data ('default','V-18010','SV-52115r2_rule','default','high','Unauthorized accounts must not have the Debug programs user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Debug programs" user right can attach a debugger to any process or to the kernel, providing complete access to sensitive and critical operating system components.  This right is given to Administrators in the default configuration.If an application requires this user right, this can be downgraded to a CAT III if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45140r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Debug programs" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000016','C-46932r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Debug programs" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.18 (L1)
select add_rule_data ('default','V-26483','SV-51502r1_rule','default','medium','The Deny log on as a batch job user right on member servers must be configured to prevent access from highly privileged domain accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on as a batch job" user right defines accounts that are prevented from logging on to the system as a batch job such, as Task Scheduler.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

The Guests group must be assigned to prevent unauthenticated access.','F-44652r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny log on as a batch job" to include the following:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

All Systems:
Guests Group' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000018-MS','C-46807r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on as a batch job" user right, this is a finding:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

All Systems:
Guests Group','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.20 (L1)
select add_rule_data ('default','V-26485','SV-51508r2_rule','default','medium','The Deny log on locally user right on member servers must be configured to prevent access from highly privileged domain accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on locally" user right defines accounts that are prevented from logging on interactively.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

The Guests group must be assigned this right to prevent unauthenticated access.','F-49929r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny log on locally" to include the following:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from this.

All Systems:
Guests Group' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000020-MS','C-49587r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on locally" user right, this is a finding:

Domain Systems Only:
Enterprise Admins Group
Domain Admins Group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from this.

All Systems:
Guests Group','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.22 (L1)
select add_rule_data ('default','V-26487','SV-51500r1_rule','default','medium','Unauthorized accounts must not have the Enable computer and user accounts to be trusted for delegation user right on member servers.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Enable computer and user accounts to be trusted for delegation" user right allows the "Trusted for Delegation" setting to be changed.  This could potentially allow unauthorized users to impersonate other users.','F-44649r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Enable computer and user accounts to be trusted for delegation" to be defined but containing no entries (blank).' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000022-MS','C-46805r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Enable computer and user accounts to be trusted for delegation" user right, this is a finding.

Windows 2008R2:

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.
If any user accounts or groups other than the following are granted the "Enable computer and user accounts to be trusted for delegation" right, this is a finding:
Administrators

','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.23 (L1)
select add_rule_data ('default','V-26488','SV-53050r1_rule','default','medium','Unauthorized accounts must not have the Force shutdown from a remote system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Force shutdown from a remote system" user right can remotely shut down a system, which could result in a DoS.','F-45976r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Force shutdown from a remote system" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000023','C-47356r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Force shutdown from a remote system" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.24 (L1)
select add_rule_data ('default','V-26489','SV-52116r2_rule','default','medium','Unauthorized accounts must not have the Generate security audits user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Generate security audits" user right specifies users and processes that can generate Security Log audit records, which must only be the system service accounts defined.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45141r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Generate security audits" to only include the following accounts or groups:

Local Service
Network Service' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000024','C-46933r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Generate security audits" user right, this is a finding:

Local Service
Network Service','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.25 (L1)
select add_rule_data ('default','V-26490','SV-52117r2_rule','default','medium','Unauthorized accounts must not have the Impersonate a client after authentication user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Impersonate a client after authentication" user right allows a program to impersonate another user or account to run on their behalf.  An attacker could potentially use this to elevate privileges.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45142r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Impersonate a client after authentication" to only include the following accounts or groups:

Administrators
Service
Local Service
Network Service' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000025','C-46934r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Impersonate a client after authentication" user right, this is a finding:

Administrators
Service
Local Service
Network Service','Customized rule by Cloud Raxak') from dual;


--CIS 2.2.26 (L1)
select add_rule_data ('default','V-26492','SV-52118r2_rule','default','medium','Unauthorized accounts must not have the Increase scheduling priority user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Increase scheduling priority" user right can change a scheduling priority causing performance issues or a DoS.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45143r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Increase scheduling priority" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000027','C-46936r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Increase scheduling priority" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.27 (L1)
select add_rule_data ('default','V-26493','SV-53043r1_rule','default','medium','Unauthorized accounts must not have the Load and unload device drivers user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Load and unload device drivers" user right allows device drivers to dynamically be loaded on a system by a user.  This could potentially be used to install malicious code by an attacker.','F-45969r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Load and unload device drivers" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000028','C-47349r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Load and unload device drivers" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.28 (L1)
select add_rule_data ('default','V-26494','SV-52119r2_rule','default','medium','Unauthorized accounts must not have the Lock pages in memory user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Lock pages in memory" user right allows physical memory to be assigned to processes, which could cause performance issues or a DoS.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45144r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Lock pages in memory" to be defined but containing no entries (blank).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000029','C-46937r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Lock pages in memory" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.30 (L1)
select add_rule_data ('default','V-26496','SV-53039r2_rule','default','medium','Unauthorized accounts must not have the Manage auditing and security log user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Manage auditing and security log" user right can manage the security log and change auditing configurations.  This could be used to clear evidence of tampering.','F-45965r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Manage auditing and security log" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000032','C-47345r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Manage auditing and security log" user right, this is a finding:

Administrators

If the site has an Auditors group that further limits this privilege this would not be a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.31 (L1)
select add_rule_data ('default','V-26497','SV-53033r1_rule','default','medium','Unauthorized accounts must not have the Modify an object label user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Modify an object label" user right can change the integrity label of an object.  This could potentially be used to execute code at a higher privilege.','F-45958r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Modify an object label" to be defined but containing no entries (blank).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000033','C-47338r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups are granted the "Modify an object label" user right, this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.32 (L1)
select add_rule_data ('default','V-26498','SV-53029r1_rule','default','medium','Unauthorized accounts must not have the Modify firmware environment values user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Modify firmware environment values" user right can change hardware configuration environment variables.  This could result in hardware failures or a DoS.','F-45955r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Modify firmware environment values" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000034','C-47334r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Modify firmware environment values" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.33 (L1)
select add_rule_data ('default','V-26499','SV-53025r1_rule','default','medium','Unauthorized accounts must not have the Perform volume maintenance tasks user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Perform volume maintenance tasks" user right can manage volume and disk configurations.  They could potentially delete volumes, resulting in data loss or a DoS.','F-45951r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Perform volume maintenance tasks" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000035','C-47330r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Perform volume maintenance tasks" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.34 (L1)
select add_rule_data ('default','V-26500','SV-53022r1_rule','default','medium','Unauthorized accounts must not have the Profile single process user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile single process" user right can monitor nonsystem processes performance.  An attacker could potentially use this to identify processes to attack.','F-45948r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Profile single process" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000036','C-47328r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Profile single process" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.35 (L1)
select add_rule_data ('default','V-26501','SV-53019r1_rule','default','medium','Unauthorized accounts must not have the Profile system performance user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile system performance" user right can monitor system processes performance.  An attacker could potentially use this to identify processes to attack.','F-45945r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Profile system performance" to only include the following accounts or groups:

Administrators
NT Service\WdiServiceHost' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000037','C-47325r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Profile system performance" user right, this is a finding:

Administrators
NT Service\WdiServiceHost','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.36 (L1)
select add_rule_data ('default','V-26503','SV-52121r2_rule','default','medium','Unauthorized accounts must not have the Replace a process level token user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Replace a process level token" user right allows one process or service to start another process or service with a different security access token.  A user with this right could use this to impersonate another account.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45146r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Replace a process level token" to only include the following accounts or groups:

Local Service
Network Service' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000039','C-46939r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Replace a process level token" user right, this is a finding:

Local Service
Network Service','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.37 (L1)
select add_rule_data ('default','V-26504','SV-52122r2_rule','default','medium','Unauthorized accounts must not have the Restore files and directories user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Restore files and directories" user right can circumvent file and directory permissions and could allow access to sensitive data.  It could also be used to overwrite more current data.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45147r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Restore files and directories" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000040','C-46940r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Restore files and directories" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.38 (L1)
select add_rule_data ('default','V-26505','SV-53016r1_rule','default','medium','Unauthorized accounts must not have the Shut down the system user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Shut down the system" user right can interactively shut down a system, which could result in a DoS.','F-45943r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Shut down the system" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000041','C-47323r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Shut down the system" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;

--CIS 2.2.40 (L1)
select add_rule_data ('default','V-26506','SV-52123r2_rule','default','medium','Unauthorized accounts must not have the Take ownership of files or other objects user right.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Take ownership of files or other objects" user right can take ownership of objects and make changes.If an application requires this user right, this can be downgraded to not a finding if the following conditions are met:
Vendor documentation must support the requirement for having the user right.
The requirement must be documented with the ISSO.
The application account must meet requirements for application account passwords, such as length (V-36661) and required changes frequency (V-36662).','F-45148r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Take ownership of files or other objects" to only include the following accounts or groups:

Administrators' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-UR-000042','C-46941r1_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Take ownership of files or other objects" user right, this is a finding:

Administrators','Customized rule by Cloud Raxak') from dual;


--Security Options
--2.3.1 Accounts
--CIS 2.3.1.3 (L1)
select add_rule_data ('default','V-1113','SV-52855r1_rule','default','medium','The built-in guest account must be disabled.','A system faces an increased vulnerability threat if the built-in guest account is not disabled.  This account is a known account that exists on all Windows systems and cannot be deleted.  This account is initialized during the installation of the operating system with no password assigned.','F-45781r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Guest account status" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000003','C-47172r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Accounts: Guest account status" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.1.4 (L1)
select add_rule_data ('default','V-3344','SV-52886r1_rule','default','high','Local accounts with blank passwords must be restricted to prevent access from the network.','An account without a password can allow unauthorized access to a system as only the username would be required.  Password policies should prevent accounts with blank passwords from existing on a system.  However, if a local account with a blank password did exist, enabling this setting will prevent network access, limiting the account to local console logon only.','F-45812r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Limit local account use of blank passwords to console logon only" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000004','C-47203r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: LimitBlankPasswordUse

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.1.5 (L1)
select add_rule_data ('default','V-1115','SV-52857r1_rule','default','medium','The built-in administrator account must be renamed.','The built-in administrator account is a well-known account subject to attack.  Renaming this account to an unidentified name improves the protection of this account and the system.','F-45783r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Rename administrator account" to a name other than "Administrator".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000005','C-47174r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Accounts: Rename administrator account" is not set to a value other than "Administrator", this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.1.6 (L1)
select add_rule_data ('default','V-1114','SV-52856r1_rule','default','medium','The built-in guest account must be renamed.','The built-in guest account is a well-known user account on all Windows systems and, as initially installed, does not require a password.  This can allow access to system resources by unauthorized users.  Renaming this account to an unidentified name improves the protection of this account and the system.','F-45782r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Accounts: Rename guest account" to a name other than "Guest".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000006','C-47173r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Accounts: Rename guest account" is not set to a value other than "Guest", this is a finding.','Customized rule by Cloud Raxak') from dual;


--2.3.2 Audit
--CIS 2.3.2.1 (L1)
select add_rule_data ('default','V-14230','SV-52944r1_rule','default','medium','Audit policy using subcategories must be enabled.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
This setting allows administrators to enable more precise auditing capabilities.','F-45870r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000009','C-47250r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: SCENoApplyLegacyAuditPolicy

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.2.2 (L1)
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
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 

Registry Path: HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa
Value Name: CrashOnAuditFail
Value Type: REG_DWORD 
Value: 0 ','Customized rule by Cloud Raxak') from dual;


--2.3.4 Devices
--CIS 2.3.4.1 (L1)
select add_rule_data ('default','V-1171','SV-52875r1_rule','default','medium','Ejection of removable NTFS media must be restricted to Administrators.','Removable hard drives, if they are not properly configured, can be formatted and ejected by users who are not members of the Administrators Group.  Formatting and ejecting removable NTFS media must only be done by administrators.','F-45801r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Devices: Allowed to format and eject removable media" to "Administrators".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000011','C-47192r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: AllocateDASD

Value Type: REG_SZ
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.4.2 (L1)
select add_rule_data ('default','V-1151','SV-52214r2_rule','default','low','The print driver installation privilege must be restricted to administrators.','Allowing users to install drivers can introduce malware or cause the instability of a system.  Print driver installation should be restricted to administrators.','F-45233r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Devices: Prevent users from installing printer drivers" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000089','C-46960r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers\

Value Name: AddPrinterDrivers

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--2.3.6 Domain Member
--CIS 2.3.6.1 (L1)
select add_rule_data ('default','V-6831','SV-52934r2_rule','default','medium','Outgoing secure channel traffic must be encrypted or signed.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted.  If this policy is enabled, outgoing secure channel traffic will be encrypted and signed.','F-45860r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally encrypt or sign secure channel data (always)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000012','C-47239r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireSignOrSeal

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.6.2 (L1)
select add_rule_data ('default','V-1163','SV-52871r2_rule','default','medium','Outgoing secure channel traffic must be encrypted when possible.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted.  If this policy is enabled, outgoing secure channel traffic will be encrypted.','F-45797r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally encrypt secure channel data (when possible)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000013','C-47188r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SealSecureChannel

Value Type: REG_DWORD
Value: 1

If the value for "Domain Member: Digitally encrypt or sign secure channel data (always)" is set to "Enabled", this can be NA (see V-6831).','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.6.3 (L1)
select add_rule_data ('default','V-1164','SV-52872r2_rule','default','medium','Outgoing secure channel traffic must be signed when possible.','Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but the channel is not integrity checked.  If this policy is enabled, outgoing secure channel traffic will be signed.','F-45798r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Digitally sign secure channel data (when possible)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000014','C-47189r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SignSecureChannel

Value Type: REG_DWORD
Value: 1

If the value for "Domain Member: Digitally encrypt or sign secure channel data (always)" is set to "Enabled", this can be NA (see V-6831).','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.6.4 (L1)
select add_rule_data ('default','V-1165','SV-52873r1_rule','default','low','The computer account password must not be prevented from being reset.','Computer account passwords are changed automatically on a regular basis.  Disabling automatic password changes can make the system more vulnerable to malicious access.  Frequent password changes can be a significant safeguard for your system.  A new password for the computer account will be generated every 30 days.','F-45799r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Disable machine account password changes" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000015','C-47190r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: DisablePasswordChange

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.6.5 (L1)
select add_rule_data ('default','V-3373','SV-52887r1_rule','default','low','The maximum age for machine account passwords must be set to requirements.','Computer account passwords are changed automatically on a regular basis.  This setting controls the maximum password age that a machine account may have.  This setting must be set to no more than 30 days, ensuring the machine changes its password monthly.','F-45813r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Maximum machine account password age" to "30" or less (excluding "0" which is unacceptable).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000016','C-47204r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: MaximumPasswordAge

Value Type: REG_DWORD
Value: 30 (or less, but not 0)','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.6.6 (L1)
select add_rule_data ('default','V-3374','SV-52888r2_rule','default','medium','The system must be configured to require a strong session key.','A computer connecting to a domain controller will establish a secure channel.  Requiring strong session keys enforces 128-bit encryption between systems.','F-45814r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Domain member: Require strong (Windows 2000 or Later) session key" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000017','C-47205r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireStrongKey

Value Type: REG_DWORD
Value: 1

This setting may prevent a system from being joined to a domain if not configured consistently between systems.','Customized rule by Cloud Raxak') from dual;


--2.3.7 Interactive logon
--CIS 2.3.7.1 (L1)
select add_rule_data ('default','V-11806','SV-52941r1_rule','default','low','The system must be configured to prevent the display of the last username on the logon screen.','Displaying the username of the last logged on user provides half of the userid/password equation that an unauthorized person would need to gain access.  The username of the last user to log on to a system must not be displayed.','F-45867r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Do not display last user name" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000018','C-47247r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DontDisplayLastUserName

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.7.2 (L1)
select add_rule_data ('default','V-1154','SV-52866r1_rule','default','medium','The Ctrl+Alt+Del security attention sequence for logons must be enabled.','Disabling the Ctrl+Alt+Del security attention sequence can compromise system security.  Because only Windows responds to the Ctrl+Alt+Del security sequence, a user can be assured that any passwords entered following that sequence are sent only to Windows.  If the sequence requirement is eliminated, malicious programs can request and receive a user"s Windows password.  Disabling this sequence also suppresses a custom logon banner.','F-45792r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Do not require CTRL+ALT+DEL" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000019','C-47183r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DisableCAD

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.7.3 (L1)
select add_rule_data ('default','V-36773','SV-51596r1_rule','default','medium','The machine inactivity limit must be set to 15 minutes, locking the system with the screensaver.','Unattended systems are susceptible to unauthorized use and should be locked when unattended.  The screen saver should be set at a maximum of 15 minutes and be password protected.  This protects critical and sensitive data from exposure to unauthorized personnel with physical access to the computer.','F-44717r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Machine inactivity limit" to "900" seconds" or less.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000021','C-46851r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: InactivityTimeoutSecs

Value Type: REG_DWORD
Value: 0x00000384 (900) (or less)','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.7.4 (L1)
select add_rule_data ('default','V-1089','SV-52845r2_rule','default','medium','The required legal notice must be configured to display before console logon.','Failure to display the logon banner prior to a logon attempt will negate legal proceedings resulting from unauthorized access to system resources.','F-45771r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Message text for users attempting to log on" to the following:

You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.

By using this IS (which includes any device attached to this IS), you consent to the following conditions:

-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations.

-At any time, the USG may inspect and seize data stored on this IS.

-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.

-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.

-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants.  Such communications and work product are private and confidential.  See User Agreement for details.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000022','C-47162r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

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

--CIS 2.3.7.5 (L1)
select add_rule_data ('default','V-26359','SV-53121r2_rule','default','low','The Windows dialog box title for the legal banner must be configured.','Failure to display the logon banner prior to a logon attempt will negate legal proceedings resulting from unauthorized access to system resources.','F-46047r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Message title for users attempting to log on" to "DoD Notice and Consent Banner", "US Department of Defense Warning Statement", or a site-defined equivalent.

If a site-defined title is used, it can in no case contravene or modify the language of the banner text required in V-1089.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000023','C-47427r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: LegalNoticeCaption

Value Type: REG_SZ
Value: See message title options below

"DoD Notice and Consent Banner", "US Department of Defense Warning Statement", or a site-defined equivalent.

If a site-defined title is used, it can in no case contravene or modify the language of the banner text required in V-1089.

Automated tools may only search for the titles defined above. If a site-defined title is used, a manual review will be required.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.7.6 (L2)
select add_rule_data ('default','V-1090','SV-52846r2_rule','default','low','Caching of logon credentials must be limited.','The default Windows configuration caches the last logon credentials for users who log on interactively to a system.  This feature is provided for system availability reasons, such as the user"s machine being disconnected from the network or domain controllers being unavailable.  Even though the credential cache is well-protected, if a system is attacked, an unauthorized individual may isolate the password to a domain user account using a password-cracking program and gain access to the domain.','F-66507r2_fix','If the system is not a member of a domain, this is NA.

Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive Logon: Number of previous logons to cache (in case Domain Controller is not available)" to "4" logons or less.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000024','C-61743r2_chk','If the system is not a member of a domain, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name:  CachedLogonsCount

Value Type:  REG_SZ
Value:  4 (or less)','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.7.8 (L1)
select add_rule_data ('default','V-56369','SV-50462r1_rule','default','high','
Domain Controller authentication is required to unlock the workstation.',
'For domain accounts, this rule setting determines whether a domain controller must be contacted to unlock a computer. This rule setting addresses a potential vulnerability that is similar to one for the Interactive logon: Number of previous logons to cache (in case domain controller is not available) setting. A user could disconnect the network cable of the server, unlock the server with an old password, and unlock the server without authentication. The default setting for this rule is Disabled.','F-56000','
Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\ 
Value Name: ForceUnlockLogon 
Value Type: REG_DWORD 
Value: 1 

Altenative method : 

Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Require domain controller authentication to unlock workstation" to "Enabled". ' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding. 

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: ForceUnlockLogon

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--2.3.8 Microsoft network client
--CIS 2.3.8.1 (L1)
select add_rule_data ('default','V-6832','SV-52935r2_rule','default','medium','The Windows SMB client must be configured to always perform SMB packet signing.','The server message block (SMB) protocol provides the basis for many network operations.  Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB client will only communicate with an SMB server that performs SMB packet signing.','F-45861r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Digitally sign communications (always)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000028','C-47240r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: RequireSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.8.2 (L1)
select add_rule_data ('default','V-1166','SV-52874r2_rule','default','medium','The Windows SMB client must be enabled to perform SMB packet signing when possible.','The server message block (SMB) protocol provides the basis for many network operations.   If this policy is enabled, the SMB client will request packet signing when communicating with an SMB server that is enabled or required to perform SMB packet signing.','F-45800r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Digitally sign communications (if server agrees)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000029','C-47191r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: EnableSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.8.3 (L1)
select add_rule_data ('default','V-1141','SV-52861r1_rule','default','medium','Unencrypted passwords must not be sent to a third-party SMB Server.','Some non-Microsoft SMB servers only support unencrypted (plain text) password authentication.  Sending plain text passwords across the network, when authenticating to an SMB server, reduces the overall security of the environment.  Check with the vendor of the SMB server to see if there is a way to support encrypted password authentication.','F-45787r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network client: Send unencrypted password to connect to third-party SMB servers" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000030','C-47178r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: EnablePlainTextPassword

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--2.3.9 Microsoft network server
--CIS 2.3.9.1 (L1)
select add_rule_data ('default','V-1174','SV-52878r2_rule','default','low','The amount of idle time required before suspending a session must be properly set.','Open sessions can increase the avenues of attack on a system.  This setting is used to control when a computer disconnects an inactive SMB session.  If client activity resumes, the session is automatically reestablished.  This protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.','F-45804r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Amount of idle time required before suspending a session" to "15" minutes or less.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000031','C-47195r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: AutoDisconnect

Value Type: REG_DWORD
Value: 15 (or less)','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.9.2 (L1)
select add_rule_data ('default','V-6833','SV-52936r2_rule','default','medium','The Windows SMB server must be configured to always perform SMB packet signing.','The server message block (SMB) protocol provides the basis for many network operations.  Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB server will only communicate with an SMB client that performs SMB packet signing.','F-45862r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Digitally sign communications (always)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000032','C-47241r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: RequireSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.9.3 (L1)
select add_rule_data ('default','V-1162','SV-52870r2_rule','default','medium','The Windows SMB server must perform SMB packet signing when possible.','The server message block (SMB) protocol provides the basis for many network operations.   Digitally signed SMB packets aid in preventing man-in-the-middle attacks.  If this policy is enabled, the SMB server will negotiate SMB packet signing as requested by the client.','F-45796r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Digitally sign communications (if client agrees)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000033','C-47187r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: EnableSecuritySignature

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.9.4 (L1)
select add_rule_data ('default','V-1136','SV-52860r1_rule','default','low','Users must be forcibly disconnected when their logon hours expire.','Users must not be permitted to remain logged on to the network after they have exceeded their permitted logon hours.  In many cases, this indicates that a user forgot to log off before leaving for the day.  However, it may also indicate that a user is attempting unauthorized access at a time when the system may be less closely monitored.  Forcibly disconnecting users when logon hours expire protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.','F-45786r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Disconnect clients when logon hours expire" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000034','C-47177r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: EnableForcedLogoff

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--2.3.10 Network access
--CIS 2.3.10.1 (L1)
select add_rule_data ('default','V-3337','SV-52882r1_rule','default','high','Anonymous SID/Name translation must not be allowed.','Allowing anonymous SID/Name translation can provide sensitive information for accessing a system.  Only authorized users must be able to perform such translations.','F-45808r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Allow anonymous SID/Name translation" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000050','C-47199r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Network access: Allow anonymous SID/Name translation" is not set to "Disabled", this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.2 (L1)
select add_rule_data ('default','V-26283','SV-53122r1_rule','default','high','Anonymous enumeration of SAM accounts must not be allowed.','Anonymous enumeration of SAM accounts allows anonymous log on users (null session connections) to list all accounts names, thus providing a list of potential points to attack the system.','F-46048r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow anonymous enumeration of SAM accounts" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000051','C-47428r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymousSAM

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.3 (L1)
select add_rule_data ('default','V-1093','SV-52847r1_rule','default','high','Anonymous enumeration of shares must be restricted.','Allowing anonymous logon users (null session connections) to list all account names and enumerate all shared resources can provide a map of potential points to attack the system.','F-45773r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow anonymous enumeration of SAM accounts and shares" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000052','C-47164r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymous

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.4 (L2)
select add_rule_data ('default','V-3376','SV-52889r1_rule','default','medium','The system must be configured to prevent the storage of passwords and credentials.','This setting controls the storage of passwords and credentials for network authentication on the local system.  Such credentials must not be stored on the local machine, as that may lead to account compromise.','F-45815r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Do not allow storage of passwords and credentials for network authentication" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000053','C-47206r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: DisableDomainCreds

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.5 (L1)
select add_rule_data ('default','V-3377','SV-52890r1_rule','default','medium','The system must be configured to prevent anonymous users from having the same rights as the Everyone group.','Access by anonymous users must be restricted.  If this setting is enabled, then anonymous users have the same rights and permissions as the built-in Everyone group.  Anonymous users must not have these permissions or rights.','F-45816r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Let everyone permissions apply to anonymous users" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000054','C-47207r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: EveryoneIncludesAnonymous

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.6 (L1)
select add_rule_data ('default','V-3338','SV-51497r2_rule','default','high','Named pipes that can be accessed anonymously must be configured to contain no values on member servers.','Named pipes that can be accessed anonymously provide the potential for gaining unauthorized system access.  Pipes are internal system communications processes.  They are identified internally by ID numbers that vary between systems.  To make access to these processes easier, these pipes are given names that do not vary between systems.  This setting controls which of these pipes anonymous users may access.','F-44296r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Named pipes that can be accessed anonymously" to be defined but containing no entries (blank).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000055-MS','C-46573r4_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: NullSessionPipes

Value Type: REG_MULTI_SZ
Value: (blank)

Legitimate applications may add entries to this registry value. If an application requires these entries to function properly and is documented with the ISSO, this would not be a finding.  Documentation must contain supporting information from the vendor"s instructions.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.7 (L1)
select add_rule_data ('default','V-3339','SV-52883r2_rule','default','high','Unauthorized remotely accessible registry paths must not be configured.','The registry is integral to the function, security, and stability of the Windows system.  Some processes may require remote access to the registry.  This setting controls which registry paths are accessible from a remote computer.  These registry paths must be limited, as they could give unauthorized individuals access to the registry.','F-45809r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Remotely accessible registry paths" with the following entries:

System\CurrentControlSet\Control\ProductOptions
System\CurrentControlSet\Control\Server Applications
Software\Microsoft\Windows NT\CurrentVersion' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000056','C-47200r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\SecurePipeServers\Winreg\AllowedExactPaths\

Value Name: Machine

Value Type: REG_MULTI_SZ
Value: see below

System\CurrentControlSet\Control\ProductOptions
System\CurrentControlSet\Control\Server Applications
Software\Microsoft\Windows NT\CurrentVersion

Legitimate applications may add entries to this registry value.  If an application requires these entries to function properly and is documented with the ISSO, this would not be a finding. Documentation must contain supporting information from the vendor"s instructions.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.8 (L1)
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
System\CurrentControlSet\Services\Sysmonlog' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000057','C-47236r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

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

--CIS 2.3.10.9 (L1)
select add_rule_data ('default','V-6834','SV-52937r1_rule','default','high','Anonymous access to Named Pipes and Shares must be restricted.','Allowing anonymous access to named pipes or shares provides the potential for unauthorized system access.  This setting restricts access to those defined in "Network access: Named Pipes that can be accessed anonymously" and "Network access: Shares that can be accessed anonymously",  both of which must be blank under other requirements.','F-45863r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Restrict anonymous access to Named Pipes and Shares" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000058','C-47242r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: RestrictNullSessAccess

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.10 (L1)
select add_rule_data ('default','V-3340','SV-52884r1_rule','default','high','Network shares that can be accessed anonymously must not be allowed.','Anonymous access to network shares provides the potential for gaining unauthorized system access by network users.  This could lead to the exposure or corruption of sensitive data.','F-45810r1_fix','Ensure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Shares that can be accessed anonymously" contains no entries (blank).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000059','C-47201r2_chk','If the following registry value does not exist, this is not a finding:

If the following registry value does exist and is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: NullSessionShares

Value Type: REG_MULTI_SZ
Value: (Blank)','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.10.11 (L1)
select add_rule_data ('default','V-3378','SV-52891r1_rule','default','medium','The system must be configured to use the Classic security model.','Windows includes two network-sharing security models - Classic and Guest only.  With the Classic model, local accounts must be password protected; otherwise, anyone can use guest user accounts to access shared system resources.','F-45817r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network access: Sharing and security model for local accounts" to "Classic - local users authenticate as themselves".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000060','C-47208r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: ForceGuest

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--2.3.11 Network security
--CIS 2.3.11.1 (L1)
select add_rule_data ('default','V-21951','SV-53176r1_rule','default','medium','Services using Local System that use Negotiate when reverting to NTLM authentication must use the computer identity vs. authenticating anonymously.','Services using Local System that use Negotiate when reverting to NTLM authentication may gain unauthorized access if allowed to authenticate anonymously vs. using the computer identity.','F-46102r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Allow Local System to use computer identity for NTLM" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000061','C-47482r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\LSA\

Value Name: UseMachineId

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.2 (L1)
select add_rule_data ('default','V-21952','SV-53177r1_rule','default','medium','NTLM must be prevented from falling back to a Null session.','NTLM sessions that are allowed to fall back to Null (unauthenticated) sessions may gain unauthorized access.','F-46103r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Allow LocalSystem NULL session fallback" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000062','C-47483r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\LSA\MSV1_0\

Value Name: allownullsessionfallback

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.3 (L1)
select add_rule_data ('default','V-21953','SV-53178r1_rule','default','medium','PKU2U authentication using online identities must be prevented.','PKU2U is a peer-to-peer authentication protocol.   This setting prevents online identities from authenticating to domain-joined systems.  Authentication will be centrally managed with Windows user accounts.','F-46104r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Allow PKU2U authentication requests to this computer to use online identities" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000063','C-47484r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\LSA\pku2u\

Value Name: AllowOnlineID

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.4 (L1)
select add_rule_data ('default','V-21954','SV-53179r2_rule','default','medium','The use of DES encryption suites must not be allowed for Kerberos encryption.','Certain encryption types are no longer considered secure.  By default, Windows 2012/R2 does not use the DES encryption suites.  If the configuration of allowed Kerberos encryption suites is needed, the DES encryption suites must not be included.','F-66513r3_fix','The default system configuration does not use DES encryption for Kerberos and supports this requirement.  If Kerberos encryption types must be configured, ensure the following are not selected:

DES_CBC_CRC
DES_CBC_MD5

If the policy for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Configure encryption types allowed for Kerberos" is configured, only the following selections are allowed:

RC4_HMAC_MD5
AES128_HMAC_SHA1
AES256_HMAC_SHA1
Future encryption types' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000064','C-61749r2_chk','Verify whether the registry key below exists.  If it does not exist or the value is "0", this is not a finding.
If the registry key exists and contains a value other than "0", continue below.

The values are determined by the selection of encryption suites in the policy Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network Security: Configure encryption types allowed for Kerberos".

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters\
Value Name:  SupportedEncryptionTypes
Type:  REG_DWORD

Due to the number of possible combinations that may include the DES encryption types, it is not possible to include all acceptable values as viewed directly in the registry.

If the registry key does exist, the value must be converted to binary to determine configuration of specific bits.  This will determine whether this is a finding.

Note the value for the registry key.
For example, when all suites, including the DES suites are selected, the value will be "0x7fffffff (2147483647)".

Open the Windows calculator (Run/Search for "calc").
Select "View", then "Programmer".
Select "Dword" and either "Hex" or "Dec".
Enter the appropriate form of the value found for the registry key (e.g., Hex - enter 0x7fffffff, Dec - enter 2147483647)
Select "Bin".
The returned value may vary in length, up to 32 characters.
If the either of 2 right most characters are "1", this is a finding.
If the both of 2 right most characters are "0", this is not a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.5 (L1)
select add_rule_data ('default','V-3379','SV-52892r2_rule','default','high','The system must be configured to prevent the storage of the LAN Manager hash of passwords.','The LAN Manager hash uses a weak encryption algorithm and there are several tools available that use this hash to retrieve account passwords.  This setting controls whether or not a LAN Manager hash of the password is stored in the SAM the next time the password is changed.','F-45818r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Do not store LAN Manager hash value on next password change" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000065','C-47209r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: NoLMHash

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.6 (L1)
select add_rule_data ('default','V-3380','SV-52893r1_rule','default','medium','The system must be configured to force users to log off when their allowed logon hours expire.','Limiting logon hours can help protect data by only allowing access during specified times.  This setting controls whether or not users are forced to log off when their allowed logon hours expire.  If logon hours are set for users, this must be enforced.','F-45819r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Force logoff when logon hours expire" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000066','C-47210r2_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options.

If the value for "Network security: Force logoff when logon hours expire" is not set to "Enabled", this is a finding.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.7 (L1)
select add_rule_data ('default','V-1153','SV-52865r1_rule','default','high','The LanMan authentication level must be set to send NTLMv2 response only, and to refuse LM and NTLM.','The Kerberos v5 authentication protocol is the default for authentication of users who are logging on to domain accounts.  NTLM, which is less secure, is retained in later Windows versions  for compatibility with clients and servers that are running earlier versions of Windows or applications that still use it.  It is also used to authenticate logons to stand-alone computers that are running later versions.','F-45791r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: LAN Manager authentication level" to "Send NTLMv2 response only. Refuse LM AND NTLM".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000067','C-47182r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\

Value Name: LmCompatibilityLevel

Value Type: REG_DWORD
Value: 5','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.9 (L1)
select add_rule_data ('default','V-3382','SV-52895r1_rule','default','medium','The system must be configured to meet the minimum session security requirement for NTLM SSP-based clients.','Microsoft has implemented a variety of security support providers for use with RPC sessions.  All of the options must be enabled to ensure the maximum security level.','F-45821r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Minimum session security for NTLM SSP based (including secure RPC) clients" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000069','C-47212r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinClientSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.10 (L1)
select add_rule_data ('default','V-3666','SV-52922r1_rule','default','medium','The system must be configured to meet the minimum session security requirement for NTLM SSP-based servers.','Microsoft has implemented a variety of security support providers for use with RPC sessions.  All of the options must be enabled to ensure the maximum security level.','F-45848r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: Minimum session security for NTLM SSP based (including secure RPC) servers" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000070','C-47227r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinServerSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)','Customized rule by Cloud Raxak') from dual;


--2.3.13 Shutdown
--CIS 2.3.13.1 (L1)
select add_rule_data ('default','V-1075','SV-52840r1_rule','default','low','The shutdown option must not be available from the logon dialog box.','Displaying the shutdown button may allow individuals to shut down a system anonymously.  Only authenticated users should be allowed to shut down the system.  Preventing display of this button in the logon dialog box ensures that individuals who shut down the system are authorized and tracked in the system"s Security event log.','F-45766r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Shutdown: Allow system to be shutdown without having to log on" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000073','C-47157r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ShutdownWithoutLogon

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--2.3.15 System objects
--CIS 2.3.15.1 (L1)
select add_rule_data ('default','V-3385','SV-52897r1_rule','default','medium','The system must be configured to require case insensitivity for non-Windows subsystems.','This setting controls the behavior of non-Windows subsystems when dealing with the case of arguments or commands.  Case sensitivity could lead to the access of files or commands that must be restricted.  To prevent this from happening, case insensitivity restrictions must be required.','F-45823r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System objects: Require case insensitivity for non-Windows subsystems" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000075','C-47214r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\Kernel\

Value Name: ObCaseInsensitive

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.15.2 (L1)
select add_rule_data ('default','V-1173','SV-52877r1_rule','default','low','The default permissions of global system objects must be increased.','Windows systems maintain a global list of shared system resources such as DOS device names, mutexes, and semaphores.  Each type of object is created with a default DACL that specifies who can access the objects with what permissions.  If this policy is enabled, the default DACL is stronger, allowing nonadministrative users to read shared objects, but not modify shared objects that they did not create.','F-45803r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "System objects: Strengthen default permissions of internal system objects (e.g. Symbolic Links)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000076','C-47194r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\

Value Name: ProtectionMode

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--2.3.17 User Account Control
--CIS 2.3.17.1 (L1)
select add_rule_data ('default','V-14234','SV-52946r1_rule','default','medium','User Account Control approval mode for the built-in Administrator must be enabled.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures the built-in Administrator account so that it runs in Admin Approval Mode.','F-45872r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Admin Approval Mode for the Built-in Administrator account" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000077','C-47252r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: FilterAdministratorToken

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.17.2 (L1)
select add_rule_data ('default','V-15991','SV-52223r2_rule','default','medium','UIAccess applications must not be allowed to prompt for elevation without using the secure desktop.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting prevents User Interface Accessibility programs from disabling the secure desktop for elevation prompts.','F-45241r1_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000086','C-46966r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableUIADesktopToggle

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.17.3 (L1)
select add_rule_data ('default','V-14235','SV-52947r1_rule','default','medium','User Account Control must, at minimum, prompt administrators for consent.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures the elevation requirements for logged on administrators to complete a task that requires raised privileges.','F-45873r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode" to "Prompt for consent".

More secure options for this setting would also be acceptable (e.g., Prompt for credentials, Prompt for consent (or credentials) on the secure desktop).' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000078','C-47253r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorAdmin

Value Type: REG_DWORD
Value: 4 (Prompt for consent)
3 (Prompt for credentials)
2 (Prompt for consent on the secure desktop)
1 (Prompt for credentials on the secure desktop)','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.17.4 (L1)
select add_rule_data ('default','V-14236','SV-52948r1_rule','default','medium','User Account Control must automatically deny standard user requests for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting controls the behavior of elevation when requested by a standard user account.','F-45874r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Behavior of the elevation prompt for standard users" to "Automatically deny elevation requests".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000079','C-47254r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorUser

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.17.5 (L1)
select add_rule_data ('default','V-14237','SV-52949r1_rule','default','medium','User Account Control must be configured to detect application installations and prompt for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting requires Windows to respond to application installation requests by prompting for credentials.','F-45875r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Detect application installations and prompt for elevation" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000080','C-47255r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableInstallerDetection

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.17.6 (L1)
select add_rule_data ('default','V-14239','SV-52950r1_rule','default','medium','User Account Control must only elevate UIAccess applications that are installed in secure locations.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures Windows to only allow applications installed in a secure location on the file system, such as the Program Files or the Windows\System32 folders, to run with elevated privileges.','F-45876r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Only elevate UIAccess applications that are installed in secure locations" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000082','C-47256r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableSecureUIAPaths

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.17.7 (L1)
select add_rule_data ('default','V-14240','SV-52951r1_rule','default','medium','User Account Control must run all administrators in Admin Approval Mode, enabling UAC.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting enables UAC.','F-45877r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Run all administrators in Admin Approval Mode" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000083','C-47257r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableLUA

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.17.8 (L1)
select add_rule_data ('default','V-14241','SV-52952r1_rule','default','medium','User Account Control must switch to the secure desktop when prompting for elevation.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting ensures that the elevation prompt is only used in secure desktop mode.','F-45878r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Switch to the secure desktop when prompting for elevation" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000084','C-47258r2_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: PromptOnSecureDesktop

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.17.9 (L1)
select add_rule_data ('default','V-14242','SV-52953r1_rule','default','medium','User Account Control must virtualize file and registry write failures to per-user locations.','User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized.  This setting configures non-UAC-compliant applications to run in virtualized file and registry entries in per-user locations, allowing them to run.','F-45879r2_fix','UAC requirements are NA on Server Core installations.

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "User Account Control: Virtualize file and registry write failures to per-user locations" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000085','C-47259r1_chk','UAC requirements are NA on Server Core installations.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableVirtualization

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--9.1 Domain Profile (Firewall)
--CIS 9.1.1 (L1)
select add_rule_data ('default','V-56336','SV-50462r1_rule','default','high','The Windows Firewall must be enabled for the Domain Profile.','
This profile applies when a computer is connected to a network and authenticates to a domain controller in the domain to which the computer belongs. Select On to have Windows Firewall with Advanced Security use the settings for this profile to filter network traffic. If you select Off, Windows Firewall with Advanced Security will not use any of the firewall rules or connection security rules for this profile. The default setting is Enabled.','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: EnableFirewall 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Firewall state" to "On (recommended)".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: EnableFirewall

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 9.1.2 (L1)
select add_rule_data ('default','V-56337','SV-50462r1_rule','default','high','The Windows Firewall must block unsolicited inbound connections for the Domain Profile.','This profile applies when a computer is connected to a network and authenticates to a domain controller in the domain to which the computer belongs. This rule setting determines the behavior for inbound connections that do not match an inbound firewall rule. The default setting is Block (default).','F-56000','
Add the registry or update the value as follows:
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: DefaultInboundAction 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Inbound connections" to "Block (default)"             ' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: DefaultInboundAction

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 9.1.3 (L1)
select add_rule_data ('default','V-56338','SV-50462r1_rule','default','high','The Windows Firewall must allow outbound connections, unless a rule explicitly blocks the connection for the Domain Profile.','This rule setting determines the behavior for outbound connections that do not match an outbound firewall rule. In Windows Vista, the default behavior is to allow connections unless there are firewall rules that block the connection. The default setting is Allow.','F-56000','
Add the registry or update the value as follows:

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: DefaultOutboundAction 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> State, "Outbound connections" to "Allow (default)" ' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: DefaultOutboundAction

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 9.1.4 (L1)
select add_rule_data ('default','V-56335','SV-50462r1_rule','default','high','
The Windows Firewall must display notifications when a program is blocked from receiving an inbound connection for the Domain Profile.','This profile applies when a computer is connected to a network and authenticates to a domain controller in the domain to which the computer belongs. Select this option to have Windows Firewall with Advanced Security display notifications to the user when a program is blocked from receiving inbound connections. The default setting is Yes (default).','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\ 
Value Name: DisableNotifications 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Domain Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes (default)".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\DomainProfile\

Value Name: DisableNotifications

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--9.2 Private Profile (Firewall)
--CIS 9.2.1 (L1)
select add_rule_data ('default','V-56343','SV-50462r1_rule','default','high','The Windows Firewall must be enabled for the Private Profile','
This profile only applies if a user with local administrator privileges assigns it to a network that was previously set to use the Public profile. Microsoft recommends only changing the profile to Private for a trusted network. Select On to have Windows Firewall with Advanced Security use the settings for this profile to filter network traffic. If you select Off, Windows Firewall with Advanced Security will not use any of the firewall rules or connection security rules for this profile. The default setting is On (Recommended).','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: EnableFirewall 
Type: REG_DWORD 
Value: 1 If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> State, "Firewall state" to "On (recommended)"
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: EnableFirewall

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 9.2.2 (L1)
select add_rule_data ('default','V-56344','SV-50462r1_rule','default','high','The Windows Firewall must block unsolicited inbound connections for the Private Profile.','This profile only applies if a user with local administrator privileges assigns it to a network that was previously set to use the Public profile. Microsoft recommends only changing the profile to Private for a trusted network. This rule setting determines the behavior for inbound connections that do not match an inbound firewall rule. The default setting is Block (Default).','F-56000','
Add the registry or update the value as follow: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: DefaultInboundAction 
Type: REG_DWORD 
Value: 1 
If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Private Profile Tab -> State, "Inbound connections" to "Block (default)".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: DefaultInboundAction

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 9.2.3 (L1)
select add_rule_data ('default','V-56345','SV-50462r1_rule','default','high','The Windows Firewall must allow outbound connections, unless a rule explicitly blocks the connection for the Private Profile.','This rule setting determines the behavior for outbound connections that do not match an outbound firewall rule. The default behavior is to allow connections unless there are firewall rules that block the connection. The default setting is Allow.','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: DefaultOutboundAction 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Private Profile Tab -> State, "Outbound connections" to "Allow (default)".
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: DefaultOutboundAction

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 9.2.4 (L1)
select add_rule_data ('default','V-56342','SV-50462r1_rule','default','high','
The Windows Firewall must display notifications when a program is blocked from receiving an inbound connection for the Private Profile','
This profile only applies if a user with local administrator privileges assigns it to a network that was previously set to use the Public profile. Microsoft recommends only changing the profile to Private for a trusted network. Select this option to have Windows Firewall with Advanced Security display notifications to the user when a program is blocked from receiving inbound connections. The default setting is Yes (Default).','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\ 
Value Name: DisableNotifications 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties (this link will be in the right pane) -> Private Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes (default)" ' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PrivateProfile\

Value Name: DisableNotifications

Type: REG_DWORD 
Value: 0','Customized rule by Cloud Raxak') from dual;


--9.3 Public Profile (Firewall)
--CIS 9.3.1 (L1)
select add_rule_data ('default','V-56350','SV-50462r1_rule','default','high','The Windows Firewall must be enabled for the Public Profile ','
This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. Select On to have Windows Firewall with Advanced Security use the settings for this profile to filter network traffic. If you select Off, Windows Firewall with Advanced Security will not use any of the firewall rules or connection security rules for this profile. The default setting is On (Recommended).','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: EnableFirewall 
Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> State,"Firewall state" to ON.
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: EnableFirewall

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 9.3.2 (L1)
select add_rule_data ('default','V-56351','SV-50462r1_rule','default','high','The Windows Firewall must block unsolicited inbound connections for the Public Profile.','
This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. This rule setting determines the behavior for inbound connections that do not match an inbound firewall rule. The default setting is Block (Default).','F-56000','
Add the registry or update the value as follow: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: DefaultInboundAction Type: REG_DWORD 
Value: 1 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> State, "Inbound connections" to "Block (default)".
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: DefaultInboundAction

Type: REG_DWORD
Value: 1 ','Customized rule by Cloud Raxak') from dual;

--CIS 9.3.3 (L1)
select add_rule_data ('default','V-56352','SV-50462r1_rule','default','high','The Windows Firewall must allow outbound connections, unless a rule explicitly blocks the connection for the Public Profile.','
This profile setting determines the behavior for outbound connections that do not match an outbound firewall rule. The default behavior is to allow connections unless there are firewall rules that block the connection. The default setting is Allow.','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: DefaultOutboundAction 
Type: REG_DWORD 
Value: 0 
If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> State, "Outbound connections" to "Allow (default)".
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: DefaultOutboundAction

Type: REG_DWORD
Value: 0 ','Customized rule by Cloud Raxak') from dual;

--CIS 9.3.4 (L1)
select add_rule_data ('default','V-56349','SV-50462r1_rule','default','high','
The Windows Firewall must display notifications when a program is blocked from receiving an inbound connection for the Public Profile','
This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. Select this option to have Windows Firewall with Advanced Security display notifications to the user when a program is blocked from receiving inbound connections. The default setting is No.','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: DisableNotifications 
Type: REG_DWORD 
Value: 1

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> select Public Profile Tab -> Settings (select Customize) -> Firewall settings, "Display a notification" to "Yes".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: DisableNotifications

Type: REG_DWORD 
Value: 1 ','Customized rule by Cloud Raxak') from dual;

--CIS 9.3.5 (L1)
select add_rule_data ('default','V-56348','SV-50462r1_rule','default','high','The Windows Firewall local firewall rules must not be merged with Group Policy settings for the Public Profile','
This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. This rule setting controls whether local administrators are allowed to create local firewall rules that apply together with firewall rules configured by Group Policy. If you configure this rule setting to No, administrators can still create firewall rules, but the rules will not be applied. The default setting is No.','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: AllowLocalPolicyMerge 
Type: REG_DWORD 
Value: 0 

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force" 

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local firewall rules:" to "No".
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: AllowLocalPolicyMerge

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 9.3.6 (L1)
select add_rule_data ('default','V-56347','SV-50462r1_rule','default','high','
The Windows Firewall local connection rules must not be merged with Group Policy settings for the Public Profile','
This profile is the default network location type when the computer is not connected to a domain. Public profile settings should be the most restrictive because the computer is connected to a public network where security cannot be as tightly controlled as within an IT environment. This rule setting controls whether local administrators are allowed to create connection security rules that apply together with connection security rules configured by Group Policy. If you configure this rule setting to No, administrators can still create firewall rules, but the rules will not be applied. The default setting is No.','F-56000','
Add the registry or update the value as follows: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\ 
Value Name: AllowLocalIPsecPolicyMerge 
Type: REG_DWORD 
Value: 0

If you have added the registry path if it did not exist previously, restart the firewall service by running "Get-Service MpsSvc | Restart-Service -Force"

Altenative method though goup policy: 

Configure the policy value for Computer Configuration -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile Tab -> Settings (select Customize) -> Rule merging, "Apply local connection security rules:" to "No".
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\WindowsFirewall\PublicProfile\

Value Name: AllowLocalIPsecPolicyMerge

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--17.1 Account Logon
--CIS 17.1.1 (L1)
select add_rule_data ('default','V-26529','SV-53013r2_rule','default','medium','The system must be configured to audit Account Logon - Credential Validation successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential validation records events related to validation tests on credentials for a user account logon.','F-45940r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Credential Validation" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000001','C-47320r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Logon -> Credential Validation - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26530','SV-53011r2_rule','default','medium','The system must be configured to audit Account Logon - Credential Validation failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential validation records events related to validation tests on credentials for a user account logon.','F-45938r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Logon -> "Audit Credential Validation" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000002','C-47318r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Logon -> Credential Validation - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.2.2 (L1)
select add_rule_data ('default','V-26531','SV-52234r3_rule','default','medium','The system must be configured to audit Account Management - Computer Account Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Computer Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling computer accounts.','F-45249r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Computer Account Management" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000011','C-46972r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Computer Account Management - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26532','SV-52235r3_rule','default','medium','The system must be configured to audit Account Management - Computer Account Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Computer Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling computer accounts.','F-45250r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Computer Account Management" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000012','C-46973r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Computer Account Management - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.2.4 (L1)
select add_rule_data ('default','V-26533','SV-53009r1_rule','default','medium','The system must be configured to audit Account Management - Other Account Management Events successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Other Account Management Events records events such as the access of a password hash or the Password Policy Checking API being called.','F-45936r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Other Account Management Events" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000015','C-47317r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Other Account Management Events - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26534','SV-53008r1_rule','default','medium','The system must be configured to audit Account Management - Other Account Management Events failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Other Account Management Events records events such as the access of a password hash or the Password Policy Checking API being called.','F-45935r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Other Account Management Events" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000016','C-47315r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Other Account Management Events - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.2.5 (L1)
select add_rule_data ('default','V-26535','SV-53007r2_rule','default','medium','The system must be configured to audit Account Management - Security Group Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security Group Management records events such as creating, deleting, or changing security groups, including changes in group members.','F-45934r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Security Group Management" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000017','C-47314r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Security Group Management - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26536','SV-53005r2_rule','default','medium','The system must be configured to audit Account Management - Security Group Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security Group Management records events such as creating, deleting, or changing security groups, including changes in group members.','F-45932r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit Security Group Management" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000018','C-47312r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> Security Group Management - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.2.6 (L1)
select add_rule_data ('default','V-26537','SV-53003r2_rule','default','medium','The system must be configured to audit Account Management - User Account Management successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.','F-45930r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit User Account Management" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000019','C-47310r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> User Account Management - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26538','SV-53001r2_rule','default','medium','The system must be configured to audit Account Management - User Account Management failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.','F-45928r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> "Audit User Account Management" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000020','C-47308r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Account Management -> User Account Management - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.3.1 (L1)
select add_rule_data ('default','V-26539','SV-52999r1_rule','default','medium','The system must be configured to audit Detailed Tracking - Process Creation successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Process Creation records events related to the creation of a process and the source.','F-45926r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Detailed Tracking -> "Audit Process Creation" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000023','C-47306r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Detailed Tracking -> Process Creation - Success','Customized rule by Cloud Raxak') from dual;


--17.5 Logon/Logoff
--CIS 17.5.2 (L1)
select add_rule_data ('default','V-26540','SV-52996r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logoff successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logoff records user logoffs.  If this is an interactive logoff, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45923r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logoff" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000045','C-47303r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logoff - Success','Customized rule by Cloud Raxak') from dual;

--CIS 17.5.3 (L1)
select add_rule_data ('default','V-26541','SV-52994r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logon successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logon records user logons.  If this is an interactive logon, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45921r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logon" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000047','C-47301r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logon - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26542','SV-52993r2_rule','default','medium','The system must be configured to audit Logon/Logoff - Logon failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logon records user logons.  If this is an interactive logon, it is recorded on the local system.  If it is to a network share, it is recorded on the system accessed.','F-45920r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Logon" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000048','C-47300r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Logon - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.5.5 (L1)
select add_rule_data ('default','V-26543','SV-52987r1_rule','default','medium','The system must be configured to audit Logon/Logoff - Special Logon successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Special Logon records special logons which have administrative privileges and can be used to elevate processes.','F-45913r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> "Audit Special Logon" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000053','C-47293r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Logon/Logoff -> Special Logon - Success','Customized rule by Cloud Raxak') from dual;

--CIS 17.7.1 (L1)
select add_rule_data ('default','V-26546','SV-52983r1_rule','default','medium','The system must be configured to audit Policy Change - Audit Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.','F-45909r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Audit Policy Change" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000085','C-47289r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Audit Policy Change - Success','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-26547','SV-52982r1_rule','default','medium','The system must be configured to audit Policy Change - Audit Policy Change failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.','F-45908r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Audit Policy Change" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000086','C-47288r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Audit Policy Change - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.7.2 (L1)
select add_rule_data ('default','V-26548','SV-52981r1_rule','default','medium','The system must be configured to audit Policy Change - Authentication Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Authentication Policy Change records events related to changes in authentication policy, including Kerberos policy and Trust changes.','F-45907r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Authentication Policy Change" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000087','C-47287r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Authentication Policy Change - Success','Customized rule by Cloud Raxak') from dual;

--CIS 17.7.3 (L1)
select add_rule_data ('default','V-57633','SV-72043r1_rule','default','medium','The system must be configured to audit Policy Change - Authorization Policy Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Authorization Policy Change records events related to changes in user rights, such as Create a token object.','F-62835r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Policy Change -> "Audit Authorization Policy Change" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000089','C-58455r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Policy Change -> Authorization Policy Change - Success','Customized rule by Cloud Raxak') from dual;


--17.8 Privilege Use
--CIS 17.8.1 (L1)
select add_rule_data ('default','V-26549','SV-52980r1_rule','default','medium','The system must be configured to audit Privilege Use - Sensitive Privilege Use successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Sensitive Privilege Use records events related to use of sensitive privileges, such as "Act as part of the operating system" or "Debug programs".','F-45906r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Privilege Use -> "Audit Sensitive Privilege Use" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000101','C-47286r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Privilege Use -> Sensitive Privilege Use - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26550','SV-52979r1_rule','default','medium','The system must be configured to audit Privilege Use - Sensitive Privilege Use failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Sensitive Privilege Use records events related to use of sensitive privileges, such as "Act as part of the operating system" or "Debug programs".','F-45905r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Privilege Use -> "Audit Sensitive Privilege Use" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000102','C-47285r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

Privilege Use -> Sensitive Privilege Use - Failure','Customized rule by Cloud Raxak') from dual;


--17.9 System
--CIS 17.9.1 (L1)
select add_rule_data ('default','V-26551','SV-52978r1_rule','default','medium','The system must be configured to audit System - IPsec Driver successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

IPsec Driver records events related to the IPSec Driver such as dropped packets.','F-45904r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit IPsec Driver" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000103','C-47284r2_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> IPsec Driver - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26552','SV-52977r1_rule','default','medium','The system must be configured to audit System - IPsec Driver failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

IPsec Driver records events related to the IPsec Driver such as dropped packets.','F-45903r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit IPsec Driver" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000104','C-47283r2_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> IPsec Driver - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.9.3 (L1)
select add_rule_data ('default','V-26553','SV-52976r1_rule','default','medium','The system must be configured to audit System - Security State Change successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security State Change records events related to changes in the security state, such as startup and shutdown of the system.','F-45902r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security State Change" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000107','C-47282r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security State Change - Success','Customized rule by Cloud Raxak') from dual;

--CIS 17.9.4 (L1)
select add_rule_data ('default','V-26555','SV-52974r1_rule','default','medium','The system must be configured to audit System - Security System Extension successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security System Extension records events related to extension code being loaded by the security subsystem.','F-45900r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security System Extension" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000109','C-47280r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security System Extension - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26556','SV-52973r1_rule','default','medium','The system must be configured to audit System - Security System Extension failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security System Extension records events related to extension code being loaded by the security subsystem.','F-45899r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit Security System Extension" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000110','C-47279r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> Security System Extension - Failure','Customized rule by Cloud Raxak') from dual;

--CIS 17.9.5 (L1)
select add_rule_data ('default','V-26557','SV-52972r1_rule','default','medium','The system must be configured to audit System - System Integrity successes.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

System Integrity records events related to violations of integrity to the security subsystem.','F-45898r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit System Integrity" with "Success" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000111','C-47278r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> System Integrity - Success','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-26558','SV-52971r1_rule','default','medium','The system must be configured to audit System - System Integrity failures.','Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks.  Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

System Integrity records events related to violations of integrity to the security subsystem.','F-45897r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> "Audit System Integrity" with "Failure" selected.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-AU-000112','C-47277r1_chk','Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (V-14230) for the detailed auditing subcategories to be effective.

Use the AuditPol tool to review the current Audit Policy configuration:
-Open a Command Prompt with elevated privileges ("Run as Administrator").
-Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.  If the system does not audit the following, this is a finding.

System -> System Integrity - Failure','Customized rule by Cloud Raxak') from dual;


--18.1.1 Personalization
--CIS 18.1.1.2 (L1)
select add_rule_data ('default','V-73493','SV-88145r1_rule','default','medium','The display of slide shows on the lock screen must be disabled.',
'Slide shows that are displayed on the lock screen could display sensitive information to unauthorized personnel. Turning off this feature will limit access to the information to a logged-on user.',
'F-79935r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Control Panel >> Personalization >> "Prevent enabling lock screen slide show" to "Enabled".',
'CIS Microsoft Windows Server 2012 R2',
'Profile Customized by CloudRaxak',
'WN16-CC-000010',  
'C-73567r1_chk',
'Verify the registry value below. 

If it does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Personalization\

Value Name: NoLockScreenSlideshow

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

--18.3 MS Security Guide
--CIS 18.3.1 (L1)
select add_rule_data ('default','V-73495','SV-88147r1_rule','default','medium','Local administrator accounts must have their privileged token filtered to prevent elevated privileges from being used over the network on domain systems.',
'A compromised local administrator account can provide means for an attacker to move laterally between domain systems.
With User Account Control enabled, filtering the privileged token for local administrator accounts will prevent the elevated privileges of these accounts from being used over the network.',
'F-79937r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> MS Security Guide >> "Apply UAC restrictions to local accounts on network logons" to "Enabled".
This policy setting requires the installation of the SecGuide custom templates included with the STIG package. "SecGuide.admx" and " SecGuide.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.',
'CIS Microsoft Windows Server 2012 R2',
'Profile Customized by CloudRaxak',
'WN16-MS-000020',  
'C-73569r1_chk',
'This applies to member servers. For domain controllers and standalone systems, this is NA.
If the following registry value does not exist or is not configured as specified, this is a finding.
Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
Value Name:  LocalAccountTokenFilterPolicy
Type:  REG_DWORD
Value: 0x00000000 (0)
This setting may cause issues with some network scanning tools if local administrative accounts are used remotely. Scans should use domain accounts where possible. If a local administrative account must be used, temporarily enabling the privileged token by configuring the registry value to "1" may be required.',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.3.5 (L1)
select add_rule_data ('default','V-73497','SV-88149r1_rule','default','medium','WDigest Authentication must be disabled.',
'When the WDigest Authentication protocol is enabled, plain-text passwords are stored in the Local Security Authority Subsystem Service (LSASS), exposing them to theft. WDigest is disabled by default in Windows 10. This setting ensures this is enforced.',
'F-79939r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> MS Security Guide >> "WDigest Authentication (disabling may require KB2871997)" to "Disabled".
This policy setting requires the installation of the SecGuide custom templates included with the STIG package. "SecGuide.admx" and " SecGuide.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.',
'CIS Microsoft Windows Server 2012 R2',
'Profile Customized by CloudRaxak',
'WN16-CC-000030',  
'C-73571r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.
Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SYSTEM\CurrentControlSet\Control\SecurityProviders\Wdigest\
Value Name:  UseLogonCredential
Type:  REG_DWORD
Value:  0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

--18.4 MSS (Legacy)
--CIS 18.4.1 (L1)
select add_rule_data ('default','V-1145','SV-52107r2_rule','default','medium','Automatic logons must be disabled.','Allowing a system to automatically log on when the machine is booted could give access to any unauthorized individual who restarts the computer.  Automatic logon with administrator privileges would give full access to an unauthorized individual.','F-45132r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (AutoAdminLogon) Enable Automatic Logon (not recommended)" to "Disabled".

Ensure no passwords are stored in the "DefaultPassword" registry value noted below:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: DefaultPassword

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000036','C-46924r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: AutoAdminLogon

Type: REG_SZ
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.2 (L1)
select add_rule_data ('default','V-21955','SV-53180r2_rule','default','low','IPv6 source routing must be configured to the highest protection level.','Configuring the system to disable IPv6 source routing protects against spoofing.','F-46106r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)" to "Highest protection, source routing is completely disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000037','C-47486r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\

Value Name: DisableIPSourceRouting

Type: REG_DWORD
Value: 2','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.3 (L1)
select add_rule_data ('default','V-4110','SV-52924r1_rule','default','low','The system must be configured to prevent IP source routing.','Configuring the system to disable IP source routing protects against spoofing.','F-45850r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)" to "Highest protection, source routing is completely disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000038','C-47229r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: DisableIPSourceRouting

Value Type: REG_DWORD
Value: 2','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.4 (L1)
select add_rule_data ('default','V-4111','SV-52925r1_rule','default','low','The system must be configured to prevent Internet Control Message Protocol (ICMP) redirects from overriding Open Shortest Path First (OSPF) generated routes.','Allowing ICMP redirect of routes can lead to traffic not being routed properly.  When disabled, this forces ICMP to be routed via shortest path first.','F-45851r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes" to "Disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000039','C-47230r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: EnableICMPRedirect

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.6 (L1)
select add_rule_data ('default','V-4116','SV-52928r1_rule','default','low','The system must be configured to ignore NetBIOS name release requests except from WINS servers.','Configuring the system to ignore name release requests, except from WINS servers, prevents a denial of service (DoS) attack.  The DoS consists of sending a NetBIOS name release request to the server for each entry in the server"s cache, causing a response delay in the normal operation of the servers WINS resolution capability.','F-45854r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (NoNameReleaseOnDemand) Allow computer to ignore NetBIOS name release requests except from WINS servers" to "Enabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000043','C-47233r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Netbt\Parameters\

Value Name: NoNameReleaseOnDemand

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.7 (L2)
select add_rule_data ('default','V-4112','SV-52926r1_rule','default','low','The system must be configured to disable the Internet Router Discovery Protocol (IRDP).','The Internet Router Discovery Protocol (IRDP) is used to detect and configure default gateway addresses on the computer.  If a router is impersonated on a network, traffic could be routed through the compromised system.','F-45852r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (PerformRouterDiscovery) Allow IRDP to detect and configure Default Gateway addresses (could lead to DoS)" to "Disabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000044','C-47231r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: PerformRouterDiscovery

Value Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.8 (L1)
select add_rule_data ('default','V-3479','SV-52920r1_rule','default','medium','The system must be configured to use Safe DLL Search Mode.','The default search behavior, when an application calls a function in a Dynamic Link Library (DLL), is to search the current directory, followed by the directories contained in the system"s path environment variable.  An unauthorized DLL, inserted into an application"s working directory, could allow malicious code to be run on the system.  Setting this policy value forces the system to search the %Systemroot% for the DLL before searching the current directory or the rest of the path.','F-45846r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (SafeDllSearchMode) Enable Safe DLL search mode (recommended)" to "Enabled".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000045','C-47225r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Control\Session Manager\

Value Name: SafeDllSearchMode

Value Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.9 (L1)
select add_rule_data ('default','V-4442','SV-52930r1_rule','default','low','The system must be configured to have password protection take effect within a limited time frame when the screen saver becomes active.','Allowing more than several seconds makes the computer vulnerable to a potential attack from someone walking up to the console to attempt to log on to the system before the lock takes effect.','F-45856r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (ScreenSaverGracePeriod) The time in seconds before the screen saver grace period expires (0 recommended)" to "5" or less.

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000046','C-47235r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: ScreenSaverGracePeriod

Value Type: REG_SZ
Value: 5 (or less)','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.12 (L1)
select add_rule_data ('default','V-4108','SV-52923r2_rule','default','low','The system must generate an audit event when the audit log reaches a percentage of full threshold.','When the audit log reaches a given percent full, an audit event is written to the security log.  It is recorded as a successful audit event under the category of System.  This option may be especially useful if the audit logs are set to be cleared manually.','F-45849r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (WarningLevel) Percentage threshold for the security event log at which the system will generate a warning" to "90" or less.

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000049','C-47228r2_chk','If the system is configured to write to an audit server, or is configured to automatically archive full logs, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Eventlog\Security\

Value Name: WarningLevel

Value Type: REG_DWORD
Value: 90 (or less)','Customized rule by Cloud Raxak') from dual;


--18.5.9 Link-Layer Topology Discovery
--CIS 18.5.9.1 (L2)
select add_rule_data ('default','V-15696','SV-53072r1_rule','default','medium','The Mapper I/O network protocol (LLTDIO) driver must be disabled.','The Mapper I/O network protocol (LLTDIO) driver allows the discovery of the connected network and allows various options to be enabled.  Disabling this helps protect the system from potentially discovering and connecting to unauthorized devices.','F-45998r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Link-Layer Topology Discovery -> "Turn on Mapper I/O (LLTDIO) driver" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000001','C-47378r2_chk','If the following registry values do not exist or are not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\LLTD\

Value Name: AllowLLTDIOOndomain
Value Name: AllowLLTDIOOnPublicNet
Value Name: EnableLLTDIO
Value Name: ProhibitLLTDIOOnPrivateNet

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.5.9.2 (L2)
select add_rule_data ('default','V-15697','SV-53081r1_rule','default','medium','The Responder network protocol driver must be disabled.','The Responder network protocol driver allows a computer to be discovered and located on a network.  Disabling this helps protect the system from potentially being discovered and connected to by unauthorized devices.','F-46007r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Link-Layer Topology Discovery -> "Turn on Responder (RSPNDR) driver" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000002','C-47387r2_chk','If the following registry values do not exist or are not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\LLTD\

Value Name: AllowRspndrOndomain
Value Name: AllowRspndrOnPublicNet
Value Name: EnableRspndr
Value Name: ProhibitRspndrOnPrivateNet

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--18.5.10.1 Peer Name Resolution Protocol
--CIS 18.5.10.2 (L2)
select add_rule_data ('default','V-15666','SV-53012r1_rule','default','medium','Windows Peer-to-Peer networking services must be turned off.','Peer-to-Peer applications can allow unauthorized access to a system and exposure of sensitive data.  This setting will turn off the Microsoft Peer-to-Peer Networking Service.','F-45939r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Microsoft Peer-to-Peer Networking Services -> "Turn off Microsoft Peer-to-Peer Networking Services" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000003','C-47319r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Peernet\

Value Name: Disabled

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.5.11.1 Windows Defender Firewall (formerly Windows Firewall)
--CIS 18.5.11.2 (L1)
select add_rule_data ('default','V-15667','SV-53014r2_rule','default','medium','Network Bridges must be prohibited in Windows.','A Network Bridge can connect two or more network segments, allowing unauthorized access or exposure of sensitive data.  This setting prevents a Network Bridge from being installed and configured.','F-45941r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Network Connections -> "Prohibit installation and configuration of Network Bridge on your DNS domain network" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000004','C-47321r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Network Connections\

Value Name: NC_AllowNetBridge_NLA

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.5.11.3 (L1)
select add_rule_data ('default','V-21960','SV-53182r1_rule','default','low','Domain users must be required to elevate when setting a networks location.','Selecting an incorrect network location may allow greater exposure of a system.  Elevation is required by default on nondomain systems to change network location.  This setting configures elevation to also be required on domain-joined systems.','F-46108r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Network Connections -> "Require domain users to elevate when setting a network"s location" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000005','C-47488r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Network Connections\

Value Name: NC_StdDomainUserSetLocation

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.5.19.2 Parameters
--CIS 18.5.19.2.1 (L2) 
select add_rule_data ('default','V-14262','SV-32488r2_rule','default','medium','IPv6 must be disabled until a deliberate transition strategy has been implemented.','Any nodes interface with IPv6 enabled by default presents a potential risk of traffic being transmitted or received without proper risk mitigation strategy and is, therefore, a serious security concern.','F-62375r2_fix','To disable IPv6 on all interfaces, configure the following registry value:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\

Value Name:  DisabledComponents

Type:  REG_DWORD
Value:  0xff or 0xffffffff

Microsoft updated article 929852 with regard to disabling all IPv6 components, changing the value to 0xff. A value of 0xffffffff results in a 5-second delay in system startup.  However, either value can be used to disable all IPv6 components.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','5.050','C-58013r2_chk','Prior to transition, IPv6 will be disabled on all interfaces. If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\

Value Name: DisabledComponents

Type: REG_DWORD
Value: 0xff or 0xffffffff','Customized rule by Cloud Raxak') from dual;


--18.5.20 Windows Connect Now
--CIS 18.5.20.1 (L2)
select add_rule_data ('default','V-15698','SV-53085r1_rule','default','medium','The configuration of wireless devices using Windows Connect Now must be disabled.','Windows Connect Now allows the discovery and configuration of devices over wireless.  Wireless devices must be managed.  If a rogue device is connected to a system, there is potential for sensitive information to be compromised.','F-46011r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Windows Connect Now -> "Configuration of wireless settings using Windows Connect Now" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000012','C-47391r2_chk','If the following registry values do not exist or are not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WCN\Registrars\

Value Name: DisableFlashConfigRegistrar
Value Name: DisableInBand802DOT11Registrar
Value Name: DisableUPnPRegistrar
Value Name: DisableWPDRegistrar
Value Name: EnableRegistrars

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.5.20.2 (L2)
select add_rule_data ('default','V-15699','SV-53089r1_rule','default','medium','The Windows Connect Now wizards must be disabled.','Windows Connect Now provides wizards for tasks such as "Set up a wireless router or access point" and must not be available to users.  Functions such as these may allow unauthorized connections to a system and the potential for sensitive information to be compromised.','F-46015r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Network -> Windows Connect Now -> "Prohibit access of the Windows Connect Now wizards" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000013','C-47395r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WCN\UI\

Value Name: DisableWcnUi

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.8.21 Group Policy
--CIS 18.8.21.3 (L1)
select add_rule_data ('default','V-4448','SV-52933r1_rule','default','medium','Group Policy objects must be reprocessed even if they have not changed.','Enabling this setting and then selecting the "Process even if the Group Policy objects have not changed" option ensures that the policies will be reprocessed even if none have been changed.  This way, any unauthorized changes are forced to match the domain-based group policy settings again.','F-45859r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Group Policy -> "Configure registry policy processing" to "Enabled" and select the option "Process even if the Group Policy objects have not changed".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000028','C-47238r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\

Value Name: NoGPOListChanges

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.21.4 (L1)
select add_rule_data ('default','V-3469','SV-52906r1_rule','default','medium','Group Policies must be refreshed in the background if the user is logged on.','If this setting is enabled, then Group Policy settings are not refreshed while a user is currently logged on.  This could lead to instances when a user does not have the latest changes to a policy applied and is therefore operating in an insecure context.','F-45832r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Group Policy -> "Turn off background refresh of Group Policy" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000029','C-47221r2_chk','Review the registry.
If the following registry value does not exist, this is not a finding (this is the expected result from configuring the policy as outlined in the Fix section.):
If the following registry value exists but is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\system\

Value Name: DisableBkGndGroupPolicy

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--18.8.22.1 Internet Communication settings
--CIS 18.8.22.1.1 (L1)
select add_rule_data ('default','V-14260','SV-52998r1_rule','default','medium','Downloading print driver packages over HTTP must be prevented.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents the computer from downloading print driver packages over HTTP.','F-45925r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> "Turn off downloading of print drivers over HTTP" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000032','C-47305r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Printers\

Value Name: DisableWebPnPDownload

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.3 (L2)
select add_rule_data ('default','V-15704','SV-53116r1_rule','default','low','Errors in handwriting recognition on tablet PCs must not be reported to Microsoft.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents errors in handwriting recognition on tablet PCs from being reported to Microsoft.','F-46042r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> "Turn off handwriting recognition error reporting" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000035','C-47422r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\HandwritingErrorReports\

Value Name: PreventHandwritingErrorReports

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.5 (L1)
select add_rule_data ('default','V-14256','SV-32398r1_rule','default','medium','Web publishing and online ordering wizards will be prevented from downloading a list of providers.','This check verifies that the system is configured to prevent Windows from downloading a list of providers for the Web publishing and online ordering wizards.','F-13581r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication setting Turn off Internet download for Web publishing and online ordering wizards to Enabled.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','5.126','http://oval.mitre.org/XMLSchema/oval-definitions-5','If the following registry value doesnt exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Subkey: \Software\Microsoft\Windows\CurrentVersion\Policies\Explorer

Value Name: NoWebServices

Type: REG_DWORD
Value: 1 ','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.6 (L1)
select add_rule_data ('default','V-14259','SV-52997r1_rule','default','medium','Printing over HTTP must be prevented.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents the client computer from printing over HTTP, which allows the computer to print to printers on the intranet as well as the Internet.','F-45924r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> "Turn off printing over HTTP" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000039','C-47304r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Printers\

Value Name: DisableHTTPPrinting

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.8 (L2)
select add_rule_data ('default','V-56542','SV-50462r1_rule','default','high','The Search Companion content file updates must be turned off.'
,'This rule defines whether Search Companion should automatically download content updates during local and Internet searches. For all profiles, the recommended state for this setting is Enabled.','F-56000','
Configure the following registry value:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: SOFTWARE\Policies\Microsoft\SearchCompanion

Value Name: DisableContentFileUpdates

Type: REG_DWORD
Value: 1' 
, 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','If the following registry value does not exist or is not configured as specified, this is a finding: 
Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: SOFTWARE\Policies\Microsoft\SearchCompanion

Value Name: DisableContentFileUpdates

Type: REG_DWORD
Value: 1 ','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.9 (L2)
select add_rule_data ('default','V-15676','SV-32414r1_rule','default','low','The Order Prints Online wizard will be turned off.','This check verifies that the Order Prints Online task is not available in Windows Explorer.','F-15543r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -gt; Internet Communication Management -> Internet Communication settings Turn off the Order Prints picture task to Enabled.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','5.219','http://oval.mitre.org/XMLSchema/oval-definitions-5','If the following registry value doesnt exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Subkey: \Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\

Value Name: NoOnlinePrintsWizard

Type: REG_DWORD
Value: 1 ','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.10 (L2)
select add_rule_data ('default','V-56543','SV-50462r1_rule','default','high','The system configuration for "Publish to Web" task for files and folders must be turned off.
','This rule defines whether to make the tasks for publishing files, folders and selected items to web available from File and Folder Tasks in Window folders. For all profiles, the recommended state for this setting is Enabled.
','F-56000','
Configure the following registry value:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer

Value Name: NoPublishingWizard

Type: REG_DWORD
Value: 1' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','Windows 2012','','
If the following registry value does not exist or is not configured as specified, this is a finding: 
Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer

Value Name: NoPublishingWizard

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.12 (L2)
select add_rule_data ('default','V-16020','SV-53143r1_rule','default','medium','The Windows Customer Experience Improvement Program must be disabled.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting ensures the Windows Customer Experience Improvement Program is disabled so information is not passed to the vendor.','F-46069r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication Settings -> "Turn off Windows Customer Experience Improvement Program" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000045','C-47449r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\SQMClient\Windows\

Value Name: CEIPEnable

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--18.8.26 Locale Services
--CIS 18.8.26.1 (L2)
select add_rule_data ('default','V-36681','SV-51610r1_rule','default','medium','Copying of user input methods to the system account for sign-in must be prevented.','Allowing different input methods for sign-in could open different avenues of attack.  User input methods must be restricted to those enabled for the system account at sign-in.','F-44731r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Locale Services -> "Disallow copying of user input methods to the system account for sign-in" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000048','C-46861r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Control Panel\International\

Value Name: BlockUserInputMethodsForSignIn

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.8.27 Logon
--CIS 18.8.27.1 (L1)
select add_rule_data ('default','V-73531','SV-88185r1_rule','default','medium','The network selection user interface (UI) must not be displayed on the logon screen.',
'Enabling interaction with the network selection UI allows users to change connections to available networks without signing in to Windows.',
'F-79973r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Logon >> "Do not display network selection UI" to "Enabled".',
'CIS Microsoft Windows Server 2012 R2',
'Profile Customized by CloudRaxak',
'WN16-CC-000180',  
'C-73605r1_chk',
'Verify the registry value below. If it does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\System\

Value Name: DontDisplayNetworkSelectionUI

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.8.27.3 (L1)
select add_rule_data ('default','V-36684','SV-51611r1_rule','default','medium','Local users on domain-joined computers must not be enumerated.','The username is one part of logon credentials that could be used to gain access to a system.  Preventing the enumeration of users limits this information to authorized personnel.','F-44732r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Logon -> "Enumerate local users on domain-joined computers" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000051','C-46862r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\System\

Value Name: EnumerateLocalUsers

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.27.4 (L1)
select add_rule_data ('default','V-36687','SV-51612r1_rule','default','medium','App notifications on the lock screen must be turned off.','App notifications that are displayed on the lock screen could display sensitive information to unauthorized personnel.  Turning off this feature will limit access to the information to a logged on user.','F-44733r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Logon -> "Turn off app notifications on the lock screen" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000052','C-46863r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\System\

Value Name: DisableLockScreenAppNotifications

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.8.33.6 Sleep Settings
--CIS 18.8.33.6.1 (L1)
select add_rule_data ('default','V-15705','SV-53131r1_rule','default','medium','Users must be prompted to authenticate on resume from sleep (on battery).','Authentication must always be required when accessing a system.  This setting ensures the user is prompted for a password on resume from sleep (on battery).','F-46057r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Power Management -> Sleep Settings -> "Require a password when a computer wakes (on battery)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000054','C-47437r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\

Value Name: DCSettingIndex

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.33.6.2 (L1)
select add_rule_data ('default','V-15706','SV-53132r1_rule','default','medium','The user must be prompted to authenticate on resume from sleep (plugged in).','Authentication must always be required when accessing a system.  This setting ensures the user is prompted for a password on resume from sleep (plugged in).','F-46058r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Power Management -> Sleep Settings -> "Require a password when a computer wakes (plugged in)" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000055','C-47438r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\

Value Name: ACSettingIndex

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.8.35 Remote Assistance
--CIS 18.8.35.1 (L1)
select add_rule_data ('default','V-3470','SV-52917r1_rule','default','medium','The system must be configured to prevent unsolicited remote assistance offers.','Remote assistance allows another user to view or take control of the local session of a user.  Unsolicited remote assistance is help that is offered by the remote user.  This may allow unauthorized parties access to the resources on the computer.','F-45843r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Assistance -> "Configure Offer Remote Assistance" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000058','C-47222r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fAllowUnsolicited

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.35.2 (L1)
select add_rule_data ('default','V-3343','SV-52885r1_rule','default','high','Solicited Remote Assistance must not be allowed.','Remote assistance allows another user to view or take control of the local session of a user.  Solicited assistance is help that is specifically requested by the local user.  This may allow unauthorized parties access to the resources on the computer.','F-45811r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Assistance -> "Configure Solicited Remote Assistance" to "Disabled".
Windows 2008 R2: Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Assistance "Solicited Remote Assistance" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000059','C-47202r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fAllowToGetHelp

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--18.8.36 Remote Procedure Call
--CIS 18.8.36.1 (L1)
select add_rule_data ('default','V-14254','SV-52989r1_rule','default','medium','Client computers must be required to authenticate for RPC communication.','Configuring RPC to require authentication to the RPC Endpoint Mapper will force clients to provide authentication before RPC communication is established.','F-45915r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Procedure Call -> "Enable RPC Endpoint Mapper Client Authentication" to "Enabled.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000063','C-47295r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Rpc\

Value Name: EnableAuthEpResolution

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.36.2 (L2)
select add_rule_data ('default','V-14253','SV-52988r2_rule','default','medium','Unauthenticated RPC clients must be restricted from connecting to the RPC server.','Configuring RPC to restrict unauthenticated RPC clients from connecting to the RPC server will prevent anonymous connections.','F-45914r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Remote Procedure Call -> "Restrict Unauthenticated RPC clients" to "Enabled" and "Authenticated".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000064-MS','C-47294r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows NT\Rpc\

Value Name:  RestrictRemoteClients

Type:  REG_DWORD
Value:  1','Customized rule by Cloud Raxak') from dual;


--18.8.44.5 Microsoft Support Diagnostic Tool
--CIS 18.8.44.5.1 (L2)
select add_rule_data ('default','V-21967','SV-53187r1_rule','default','low','Microsoft Support Diagnostic Tool (MSDT) interactive communication with Microsoft must be prevented.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents the MSDT from communicating with and sending collected data to Microsoft, the default support provider.','F-46113r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Troubleshooting and Diagnostics -> Microsoft Support Diagnostic Tool -> "Microsoft Support Diagnostic Tool: Turn on MSDT interactive communication with support provider" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000066','C-47493r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\ScriptedDiagnosticsProvider\Policy\

Value Name: DisableQueryRemoteServer

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--18.8.44.11 Windows Performance PerfTrack
--CIS 18.8.44.11.1 (L2)
select add_rule_data ('default','V-21970','SV-53128r1_rule','default','low','Responsiveness events must be prevented from being aggregated and sent to Microsoft.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.
This setting prevents responsiveness events from being aggregated and sent to Microsoft.','F-46054r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Troubleshooting and Diagnostics -> Windows Performance PerfTrack -> "Enable/Disable PerfTrack" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000068','C-47434r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WDI\{9c5a40da-b965-4fc3-8781-88dd50a6299d}\

Value Name: ScenarioExecutionEnabled

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--18.9.8 AutoPlay Policies
--CIS 18.9.8.1 (L1)
select add_rule_data ('default','V-21973','SV-53126r2_rule','default','high','Autoplay must be turned off for non-volume devices.','Allowing Autoplay to execute may introduce malicious code to a system.  Autoplay begins reading from a drive as soon as media is inserted into the drive.  As a result, the setup file of programs or music on audio media may start.  This setting will disable Autoplay for non-volume devices (such as Media Transfer Protocol (MTP) devices).','F-46052r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Disallow Autoplay for non-volume devices" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000072','C-47432r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Explorer\

Value Name: NoAutoplayfornonVolume

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.8.2 (L1)
select add_rule_data ('default','V-22692','SV-53124r2_rule','default','high','The default Autorun behavior must be configured to prevent Autorun commands.','Allowing Autorun commands to execute may introduce malicious code to a system.  Configuring this setting prevents Autorun commands from executing.','F-46050r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Set the default behavior for AutoRun" to "Enabled:Do not execute any autorun commands".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000073','C-47430r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\

Value Name: NoAutorun

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.8.3 (L1)
select add_rule_data ('default','V-2374','SV-52879r2_rule','default','high','Autoplay must be disabled for all drives.','Allowing Autoplay to execute may introduce malicious code to a system.  Autoplay begins reading from a drive as soon media is inserted into the drive.  As a result, the setup file of programs or music on audio media may start.  By default, Autoplay is disabled on removable drives, such as the floppy disk drive (but not the CD-ROM drive) and on network drives.  Enabling this policy disables Autoplay on all drives.','F-45805r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> AutoPlay Policies -> "Turn off AutoPlay" to "Enabled:All Drives".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000074','C-47196r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\

Value Name: NoDriveTypeAutoRun

Type: REG_DWORD
Value: 0x000000ff (255)','Customized rule by Cloud Raxak') from dual;


--18.9.15 Credential User Interface
--CIS 18.9.15.1 (L1)
select add_rule_data ('default','V-36700','SV-51740r1_rule','default','medium','The password reveal button must not be displayed.','Visible passwords may be seen by nearby persons, compromising them.  The password reveal button can be used to display an entered password and must not be allowed.','F-44815r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Credential User Interface -> "Do not display the password reveal button" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000076','C-46869r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\CredUI\

Value Name: DisablePasswordReveal

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.15.2 (L1)
select add_rule_data ('default','V-14243','SV-52955r1_rule','default','medium','The system must require username and password to elevate a running application.','Enumeration of administrator accounts when elevating can provide part of the logon information to an unauthorized user.  This setting configures the system to always require users to type in a username and password to elevate a running application.','F-45881r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Credential User Interface -> "Enumerate administrator accounts on elevation" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000077','C-47261r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\CredUI\

Value Name: EnumerateAdministrators

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--18.9.26 Event Log Service
--CIS 18.9.26.1.2 (L1)
select add_rule_data ('default','V-26579','SV-52966r1_rule','default','medium','The Application event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45892r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000084','C-47272r3_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Application\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.26.2.2 (L1)
select add_rule_data ('default','V-26580','SV-52965r1_rule','default','medium','The Security event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45891r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security -> "Specify the maximum log size (KB)" to at minimum "Enabled:196608".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000085','C-47271r3_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Security\

Value Name:  MaxSize

Type: REG_DWORD
Value: 196608 or greater','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.26.3.2 (L1)
select add_rule_data ('default','V-26581','SV-52964r1_rule','default','medium','The Setup event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45890r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Setup -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000086','C-47270r2_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\Setup\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.26.4.2 (L1)
select add_rule_data ('default','V-26582','SV-52963r1_rule','default','medium','The System event log must be configured to a minimum size requirement.','Inadequate log size will cause the log to fill up quickly and require frequent clearing by administrative personnel.','F-45889r1_fix','If the system is not configured to write directly to an audit server, configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> "Specify the maximum log size (KB)" to at minimum "Enabled:32768".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000087','C-47269r2_chk','If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured to at least the value specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\EventLog\System\

Value Name:  MaxSize

Type: REG_DWORD
Value: 32768 or greater','Customized rule by Cloud Raxak') from dual;


--18.9.30 File Explorer (formerly Windows Explorer)
--CIS 18.9.30.2 (L1)
select add_rule_data ('default','V-21980','SV-53125r1_rule','default','medium','Explorer Data Execution Prevention must be enabled.','Data Execution Prevention (DEP) provides additional protection by performing  checks on memory to help prevent malicious code from running.  This setting will prevent Data Execution Prevention from being turned off for File Explorer.','F-46051r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> File Explorer -> "Turn off Data Execution Prevention for Explorer" to "Disabled".

Windows 2008 R2:
Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Explorer -> "Turn off Data Execution Prevention for Explorer" to "Disabled".
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000089','C-47431r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Explorer\

Value Name: NoDataExecutionPrevention

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.30.3 (L1)
select add_rule_data ('default','V-15718','SV-53137r1_rule','default','low','Turning off File Explorer heap termination on corruption must be disabled.','Legacy plug-in applications may continue to function when a File Explorer session has become corrupt.  Disabling this feature will prevent this.','F-46063r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> File Explorer -> "Turn off heap termination on corruption" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000090','C-47443r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Explorer\

Value Name: NoHeapTerminationOnCorruption

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.30.4 (L1)
select add_rule_data ('default','V-15683','SV-53045r1_rule','default','medium','File Explorer shell protocol must run in protected mode.','The shell protocol will  limit the set of folders applications can open when run in protected mode.  Restricting files an application can open to a limited set of folders increases the security of Windows.','F-45971r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> File Explorer -> "Turn off shell protocol protected mode" to "Disabled".' 
, 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000091','C-47350r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows\CurrentVersion\Policies\Explorer\

Value Name: PreXPSP2ShellProtocolBehavior

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--18.9.39.1 Windows Location Provider
--CIS 18.9.39.2 (L2)
select add_rule_data ('default','V-36708','SV-51748r2_rule','default','medium','The location feature must be turned off.','The location service on systems may allow sensitive data to be used by applications on the system.  This should be turned off unless explicitly allowed for approved systems/applications.','F-44823r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Location and Sensors -> "Turn off location" to "Enabled".

If location services are approved by the organization for a device, this must be documented.' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000095','C-46877r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\LocationAndSensors\

Value Name: DisableLocation

Type: REG_DWORD
Value: 1 (Enabled)

If location services are approved for the system by the organization, this may be set to "Disabled" (0).  This must be documented with the ISSO.','Customized rule by Cloud Raxak') from dual;

--18.9.58.2.1 RemoteFX USB Device Redirection
--CIS 18.9.58.2.2 (L1)
select add_rule_data ('default','V-14247','SV-52958r1_rule','default','medium','Passwords must not be saved in the Remote Desktop Client.','Saving passwords in the Remote Desktop Client could allow an unauthorized user to establish a remote desktop session to another system.  The system must be configured to prevent users from saving passwords in the Remote Desktop Client.','F-45884r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Connection Client -> "Do not allow passwords to be saved" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000096','C-47264r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: DisablePasswordSaving

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.9.58.3.2 Connections
--CIS 18.9.58.3.2.1 (L2)
select add_rule_data ('default','V-3449','SV-52216r2_rule','default','medium','Remote Desktop Services must limit users to one remote session.','Allowing multiple Remote Desktop Services sessions could consume resources.  There is also potential to make a secondary connection to a system with compromised credentials.','F-45235r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Connections -> "Restrict Remote Desktop Services users to a single Remote Desktop Services Session" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000131','C-46962r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fSingleSessionPerUser

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.9.58.3.3 Device and Resource Redirection
--CIS 18.9.58.3.3.1 (L2)
select add_rule_data ('default','V-15997','SV-52224r2_rule','default','medium','Users must be prevented from mapping local COM ports and redirecting data from the Remote Desktop Session Host to local COM ports.  (Remote Desktop Services Role).','Preventing the redirection of Remote Desktop session data to a client computer"s COM ports helps reduce possible exposure of sensitive data.','F-45242r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow COM port redirection" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000132','C-46967r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisableCcm

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.58.3.3.2 (L1)
select add_rule_data ('default','V-14249','SV-52959r1_rule','default','medium','Local drives must be prevented from sharing with Remote Desktop Session Hosts.  (Remote Desktop Services Role).','Preventing users from sharing the local drives on their client computers to Remote Session Hosts that they access helps reduce possible exposure of sensitive data.','F-45885r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow drive redirection" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000098','C-47265r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisableCdm

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.58.3.3.3 (L2)
select add_rule_data ('default','V-15998','SV-52226r2_rule','default','medium','Users must be prevented from mapping local LPT ports and redirecting data from the Remote Desktop Session Host to local LPT ports.  (Remote Desktop Services Role).','Preventing the redirection of Remote Desktop session data to a client computer"s LPT ports helps reduce possible exposure of sensitive data.','F-45244r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow LPT port redirection" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000133','C-46968r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisableLPT

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.58.3.3.4 (L2)
select add_rule_data ('default','V-15999','SV-52229r2_rule','default','medium','Users must be prevented from redirecting Plug and Play devices to the Remote Desktop Session Host.  (Remote Desktop Services Role).','Preventing the redirection of Plug and Play devices in Remote Desktop sessions helps reduce possible exposure of sensitive data.','F-45246r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Device and Resource Redirection -> "Do not allow supported Plug and Play device redirection" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000135','C-46969r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisablePNPRedir

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.9.58.3.9 Security
--CIS 18.9.58.3.9.1 (L1)
select add_rule_data ('default','V-3453','SV-52898r1_rule','default','medium','Remote Desktop Services must always prompt a client for passwords upon connection.','This setting controls the ability of users to supply passwords automatically as part of their remote desktop connection.  Disabling this setting would allow anyone to use the stored credentials in a connection item to connect to the terminal server.','F-45824r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Security -> "Always prompt for password upon connection" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000099','C-47215r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fPromptForPassword

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.58.3.9.2 (L1)
select add_rule_data ('default','V-4447','SV-52932r2_rule','default','medium','The Remote Desktop Session Host must require secure RPC communications.','Allowing unsecure RPC communication exposes the system to man-in-the-middle attacks and data disclosure attacks.  A man-in-the-middle attack occurs when an intruder captures packets between a client and server and modifies them before allowing the packets to be exchanged.  Usually the attacker will modify the information in the packets in an attempt to cause either the client or server to reveal sensitive information.','F-45858r2_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Security -> "Require secure RPC communication" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000130','C-47237r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fEncryptRPCTraffic

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.58.3.9.3 (L1)
select add_rule_data ('default','V-3454','SV-52899r2_rule','default','medium','Remote Desktop Services must be configured with the client connection encryption set to the required level.','Remote connections must be encrypted to prevent interception of data or sensitive information. Selecting "High Level" will ensure encryption of Remote Desktop Services sessions in both directions.','F-45825r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Security -> "Set client connection encryption level" to "Enabled" and "High Level".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000100','C-47216r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: MinEncryptionLevel

Type: REG_DWORD
Value: 3','Customized rule by Cloud Raxak') from dual;


--18.9.58.3.10 Session Time Limits
--CIS 18.9.58.3.10.1 (L2)
select add_rule_data ('default','V-3458','SV-52903r2_rule','default','medium','Remote Desktop Services must be configured to disconnect an idle session after the specified time period.','This setting controls how long a session may be idle before it is automatically disconnected from the server.  Users must disconnect if they plan on being away from their terminals for extended periods of time.  Idle sessions must be disconnected after 15 minutes.','F-45829r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Session Time Limits -> "Set time limit for active but idle Remote Desktop Services sessions" to "Enabled", and the "Idle session limit" to 15 minutes or less, excluding "0", which equates to "Never".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000101','C-47220r2_chk','If the following registry value does not exist or its value is set to "0" or greater than "15" minutes, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: MaxIdleTime

Type: REG_DWORD
Value: 0x000dbba0 (900000) or less but not 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.58.3.10.2 (L2)
select add_rule_data ('default','V-3457','SV-52902r2_rule','default','medium','Remote Desktop Services must be configured to set a time limit for disconnected sessions.','This setting controls how long a session will remain open if it is unexpectedly terminated.  Such sessions use system resources and must be terminated as soon as possible.','F-45828r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Session Time Limits -> "Set time limit for disconnected sessions" to "Enabled", and "End a disconnected session" to "1 minute".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000102','C-47219r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: MaxDisconnectionTime

Type: REG_DWORD
Value: 0x0000ea60 (60000)','Customized rule by Cloud Raxak') from dual;


--18.9.58.3.11 Temporary folders
--CIS 18.9.58.3.11.1 (L1)
select add_rule_data ('default','V-3456','SV-52901r1_rule','default','medium','Remote Desktop Services must delete temporary folders when a session is terminated.','Remote desktop session temporary folders must always be deleted after a session is over to prevent hard disk clutter and potential leakage of information.  This setting controls the deletion of the temporary folders when the session is terminated.','F-45827r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Temporary Folders -> "Do not delete temp folder upon exit" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000103','C-47218r3_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: DeleteTempDirsOnExit

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.58.3.11.2 (L1)
select add_rule_data ('default','V-3455','SV-52900r1_rule','default','medium','Remote Desktop Services must be configured to use session-specific temporary folders.','If a communal temporary folder is used for remote desktop sessions, it might be possible for users to access other users" temporary folders.  If this setting is enabled, only one temporary folder is used for all remote desktop sessions.  Per session temporary folders must be established.','F-45826r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Remote Desktop Services -> Remote Desktop Session Host -> Temporary Folders -> "Do not use temporary folders per session" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000104','C-47217r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: PerSessionTempDir

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;


--18.9.59 RSS Feeds
--CIS 18.9.59.1 (L1)
select add_rule_data ('default','V-15682','SV-53040r1_rule','default','medium','Attachments must be prevented from being downloaded from RSS feeds.','Attachments from RSS feeds may not be secure.  This setting will prevent attachments from being downloaded from RSS feeds.','F-45966r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> RSS Feeds -> "Prevent downloading of enclosures" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000105','C-47346r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Internet Explorer\Feeds\

Value Name: DisableEnclosureDownload

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.60.2 (L1)
select add_rule_data ('default','V-73581','SV-88245r1_rule','default','medium','Indexing of encrypted files must be turned off.',
'Indexing of encrypted files may expose sensitive data. This setting prevents encrypted files from being indexed.',
'F-80031r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Search >> "Allow indexing of encrypted files" to "Disabled".',
'CIS Microsoft Windows Server 2012 R2',
'Profile Customized by CloudRaxak',
'WN16-CC-000440',  
'C-73663r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Windows Search\

Value Name: AllowIndexingEncryptedStoresOrItems

Value Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;


--18.9.76.3 MAPS
--CIS 18.9.76.3.2 (L2)
select add_rule_data ('default','V-15713','SV-53134r2_rule','default','medium','Microsoft Active Protection Service membership must be disabled.','Some features may communicate with the vendor, sending system information or downloading data or components for the feature.  Turning off this feature will prevent potentially sensitive information from being sent outside the enterprise and uncontrolled updates to the system.  This setting disables Microsoft Active Protection Service membership and reporting.','F-62313r2_fix','Windows 2012 R2:
Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Defender -> MAPS -> "Join Microsoft MAPS" to "Disabled".

Windows 2012:
Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Defender -> "Configure Microsoft Active Protection Service Reporting" to "Disabled".

Windows 2008 R2:
Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Defender -> "Configure Microsoft Spynet Reporting" to "Disabled".
' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000111','C-47440r4_chk','If the following registry value exists and is set to "1" (Basic) or "2" (Advanced), this is a finding:

If the registry value does not exist, this is not a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows Defender\SpyNet\

Value Name:  SpyNetReporting

Type:  REG_DWORD
Value:  1 or 2 = a Finding','Customized rule by Cloud Raxak') from dual;


--18.9.85 Windows Installer
--CIS 18.9.85.1 (L1)
select add_rule_data ('default','V-15685','SV-53061r1_rule','default','medium','Users must be prevented from changing installation options.','Installation options for applications are typically controlled by administrators.  This setting prevents users from changing installation options that may bypass security features.','F-45986r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Installer -> "Allow user control over installs" to "Disabled".' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000115','C-47366r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Installer\

Value Name: EnableUserControl

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.85.2 (L1)
select add_rule_data ('default','V-34974','SV-52954r1_rule','default','high','The Windows Installer Always install with elevated privileges option must be disabled.','Standard user accounts must not be granted elevated privileges.  Enabling Windows Installer to elevate privileges when installing applications can allow malicious persons and applications to gain full control of a system.','F-45880r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Installer -> "Always install with elevated privileges" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000116','C-47260r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Installer\

Value Name: AlwaysInstallElevated

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.85.3 (L2)
select add_rule_data ('default','V-15684','SV-53056r2_rule','default','medium','Users must be notified if a web-based program attempts to install software.','Users must be aware of attempted program installations.  This setting ensures users are notified if a web-based program attempts to install software.','F-45982r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Installer -> "Prevent Internet Explorer security prompt for Windows Installer scripts" to "Disabled".', 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000117','C-47359r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Installer\

Value Name: SafeForScripting

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.86.1 (L1)
select add_rule_data ('default','V-73589','SV-88253r1_rule','default','medium','Automatically signing in the last interactive user after a system-initiated restart must be disabled.',
'Windows can be configured to automatically sign the user back in after a Windows Update restart. Some protections are in place to help ensure this is done in a secure fashion; however, disabling this will prevent the caching of credentials for this purpose and also ensure the user is aware of the restart.',
'F-80039r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Logon Options >> "Sign-in last interactive user automatically after a system-initiated restart" to "Disabled".',
'CIS Microsoft Windows Server 2012 R2',
'Profile Customized by CloudRaxak',
'WN16-CC-000480',  
'C-73671r1_chk',
'Verify the registry value below. If it does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: DisableAutomaticRestartSignOn

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;


--18.9.97.1 WinRM Client
--CIS 18.9.97.1.1 (L1)
select add_rule_data ('default','V-36712','SV-51752r1_rule','default','high','The Windows Remote Management (WinRM) client must not use Basic authentication.','Basic authentication uses plain text passwords that could be used to compromise a system.','F-44827r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Client -> "Allow Basic authentication" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000123','C-46881r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowBasic

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.97.1.2 (L1)
select add_rule_data ('default','V-36713','SV-51753r2_rule','default','medium','The Windows Remote Management (WinRM) client must not allow unencrypted traffic.','Unencrypted remote access to a system can allow sensitive information to be compromised.  Windows remote management connections must be encrypted to prevent this.','F-44828r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Client -> "Allow unencrypted traffic" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000124','C-46882r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowUnencryptedTraffic

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.97.1.3 (L1)
select add_rule_data ('default','V-36714','SV-51754r1_rule','default','medium','The Windows Remote Management (WinRM) client must not use Digest authentication.','Digest authentication is not as strong as other options and may be subject to man-in-the-middle attacks.','F-44829r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Client -> "Disallow Digest authentication" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000125','C-46883r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowDigest

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;


--18.9.97.2 WinRM Service
--CIS 18.9.97.2.1 (L1)
select add_rule_data ('default','V-36718','SV-51755r2_rule','default','high','The Windows Remote Management (WinRM) service must not use Basic authentication.','Basic authentication uses plain text passwords that could be used to compromise a system.','F-44830r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Service -> "Allow Basic authentication" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000126','C-46884r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Service\

Value Name: AllowBasic

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.97.2.3 (L1)
select add_rule_data ('default','V-36719','SV-51756r2_rule','default','medium','The Windows Remote Management (WinRM) service must not allow unencrypted traffic.','Unencrypted remote access to a system can allow sensitive information to be compromised.  Windows remote management connections must be encrypted to prevent this.','F-44831r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Service -> "Allow unencrypted traffic" to "Disabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000127','C-46885r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Service\

Value Name: AllowUnencryptedTraffic

Type: REG_DWORD
Value: 0','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.97.2.4 (L1)
select add_rule_data ('default','V-36720','SV-51757r1_rule','default','medium','The Windows Remote Management (WinRM) service must not store RunAs credentials.','Storage of administrative credentials could allow unauthorized access.  Disallowing the storage of RunAs credentials for Windows Remote Management will prevent them from being used with plug-ins.','F-44832r1_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Remote Management (WinRM) -> WinRM Service -> "Disallow WinRM from storing RunAs credentials" to "Enabled".' , 'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CC-000128','C-46886r1_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\WinRM\Service\

Value Name: DisableRunAs

Type: REG_DWORD
Value: 1','Customized rule by Cloud Raxak') from dual;

--CIS 1.2.1 (L1) Mapped Rule V-1099
select add_rule_data ('default','V-6001','sv-52850r1_cis_rule','default','medium','The lockout duration must be configured to require an administrator to unlock an account.',
'The account lockout feature, when enabled, prevents brute-force password attacks on the system.  This parameter specifies the period of time that an account will remain locked after the specified number of failed logon attempts.  A value of 0 will require an administrator to unlock the account.',
'F-45776r1_cis_fix',
'Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout duration" to "15 or more" minutes, "Account is locked out until administrator unlocks it".',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000001',
'C-47167r2_cis_chk',
'Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".
Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.
If the "Account lockout duration" is not set to "15 or more", requiring an administrator to unlock the account, this is a finding.',
'Customized rule by Cloud Raxak') from dual;


--CIS 1.2.2 (L1) Mapped Rule V-1097
select add_rule_data ('default','V-6002','sv-52848r1_cis_rule','default','medium',
'The number of allowed bad logon attempts must meet minimum requirements.',
'The account lockout feature, when enabled, prevents brute-force password attacks on the system.  The higher this value is, the less effective the account lockout feature will be in protecting the local system.  The number of bad logon attempts must be reasonably small to minimize the possibility of a successful password attack, while allowing for honest errors made during a normal user logon.',
'F-45774r1_cis_fix',
'Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Account lockout threshold" to "10" or less invalid logon attempts (excluding "0" which is unacceptable).' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000002',
'C-47165r2_cis_chk',
'Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Account lockout threshold" is "0" or more than "10" attempts, this is a finding.',
'Customized rule by Cloud Raxak') from dual;


--CIS 1.2.3 (L1) Mapped Rule V-1098
select add_rule_data ('default','V-6003','SV-52849r1_cis_rule','default','medium',
'The period of time before the bad logon counter is reset must meet minimum requirements.','The account lockout feature, when enabled, prevents brute-force password attacks on the system.  This parameter specifies the period of time that must pass after failed logon attempts before the counter is reset to 0.  The smaller this value is, the less effective the account lockout feature will be in protecting the local system.',
'F-45775r1_cis_fix',
'Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy -> "Reset account lockout counter after" to at least "15 or more" minutes.' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000003',
'C-47166r2_cis_chk',
'Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Account Policies -> Account Lockout Policy.

If the "Reset account lockout counter after" value is less than "15" minutes, this is a finding.',
'Customized rule by Cloud Raxak') from dual;

--CIS 2.2.7 (L1) Mapped Rule V-26473
select add_rule_data ('default','V-6004','SV-53119r1_cis_rule','default','medium','Unauthorized accounts must not have the Allow log on through Remote Desktop Services user right.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Allow log on through Remote Desktop Services" user right can access a system through Remote Desktop',
'F-46045r1_cis_fix',
'Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Allow log on through Remote Desktop Services" to only include the following accounts or groups:

Administrators, Remote Desktop Users' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000006',
'C-47425r1_cis_chk',
'Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If any accounts or groups other than the following are granted the "Allow log on through Remote Desktop Services" user right, this is a finding:

Administrators, Remote Desktop Users

If the system serves the Remote Desktop Services role, the Remote Desktop Users group may be included.',
'Customized rule by Cloud Raxak') from dual;


--CIS 2.2.17 (L1) Mapped Rule V-1155
select add_rule_data ('default','V-6005','SV-51501r3_cis_rule','default','medium','The Deny access to this computer from the network user right on member servers must be configured to prevent access from highly privileged domain accounts and local administrator accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny access to this computer from the network" user right defines the accounts that are prevented from logging on from the network.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

Local administrator accounts on domain-joined systems must also be assigned this right to decrease the risk of lateral movement resulting from credential theft attacks.

The Guests group must be assigned this right to prevent unauthenticated access.',
'F-62387r2_cis_fix',
'Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny access to this computer from the network" to include the following:

"Guests group", "Local account and member of Administrators group"' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000017-MS',
'C-58025r2_cis_chk',
'Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny access to this computer from the network" user right, this is a finding:

Guests group, Local account and member of Administrators group',
'Customized rule by Cloud Raxak') from dual;

--CIS 2.2.21 (L1) Mapped Rule V-26486
select add_rule_data ('default','V-6006','SV-51509r3_cis_rule','default','medium','The Deny log on through Remote Desktop Services user right on member servers must be configured to prevent access from highly privileged domain accounts and local administrator accounts on domain systems, and from unauthenticated access on all systems.','Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on through Remote Desktop Services" user right defines the accounts that are prevented from logging on using Remote Desktop Services.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks which could lead to the compromise of an entire domain.

Local administrator accounts on domain-joined systems must also be assigned this right to decrease the risk of lateral movement resulting from credential theft attacks.

The Guests group must be assigned this right to prevent unauthenticated access.','F-62389r1_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> "Deny log on through Remote Desktop Services" to include the following:

Guests group, Local account' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000021-MS','C-58027r1_cis_chk','Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy -> Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on through Remote Desktop Services" user right, this is a finding:
Guests group, Local Account',
'Customized rule by Cloud Raxak') from dual;

--CIS 2.3.7.7 (L1) Mapped Rule V-1172
select add_rule_data ('default','V-6007','SV-52876r1_cis_rule','default','low','Users must be warned in advance of their passwords expiring.',
'Creating strong passwords that can be remembered by users requires some thought.  By giving the user advance warning, the user has time to construct a sufficiently strong password.  This setting configures the system to display a warning to users telling them how many days are left before their password expires.',
'F-45802r1_cis_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive Logon: Prompt user to change password before expiration" to "between 5 and 14" days.' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000025','C-47193r2_cis_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: PasswordExpiryWarning

Value Type: REG_DWORD
Value: Between 5 and 14','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.7.9 (L1) Mapped Rule V-1157
select add_rule_data ('default','V-6008','SV-52867r2_cis_rule','default','medium','The Smart Card removal option must be configured to Force Logoff or Lock Workstation.',
'Unattended systems are susceptible to unauthorized use and must be locked.  Configuring a system to lock when a smart card is removed will ensure the system is inaccessible when unattended.',
'F-45793r1_cis_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Interactive logon: Smart card removal behavior" to  "Lock Workstation" or "Force Logoff" or "Disconnect if a Remote Desktop Services session".' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000027',
'C-47184r3_cis_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name: SCRemoveOption

Value Type: REG_SZ
Value: 1 (Lock Workstation) or 2 (Force Logoff) or 3 (Disconnect if a Remote Desktop Services session)

If configuring this on servers causes issues such as terminating users" remote sessions and the site has a policy in place that any other sessions on the servers such as administrative console logons, are manually locked or logged off when unattended or not in use, this would be acceptable. This must be documented with the ISSO.','Customized rule by Cloud Raxak') from dual;

--CIS 2.3.9.5 (L1) Mapped Rule V-21950
select add_rule_data ('default','V-6009','SV-53175r1_cis_rule','default','medium','The service principal name (SPN) target name validation level must be set to "Accept if provided by client" or higher.',
'If a service principle name (SPN) is provided by the client, it is validated against the server"s list of SPNs.  Implementation may disrupt file and print sharing capabilities.',
'F-46101r1_cis_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Microsoft network server: Server SPN target name validation level" to "Accept if provided by client" or higher.' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000035',
'C-47481r1_cis_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LanmanServer\Parameters\

Value Name: SmbServerNameHardeningLevel

Type: REG_DWORD
Value: 1 (Accept if provided by client) or 2 (Higher) ',
'Customized rule by Cloud Raxak') from dual;

--CIS 2.3.11.8 (L1) Mapped Rule V-3381 
select add_rule_data ('default','V-6010','SV-52894r1_cis_rule','default','medium','The system must be configured to the required LDAP client signing level.',
'This setting controls the signing requirements for LDAP clients.  This setting must be set to Negotiate signing or Require signing, depending on the environment and type of LDAP server in use.',
'F-45820r1_cis_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "Network security: LDAP client signing requirements" to "Negotiate signing" at a minimum.' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000068',
'C-47211r2_cis_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\LDAP\

Value Name: LDAPClientIntegrity

Value Type: REG_DWORD
Value: 1',
'Customized rule by Cloud Raxak') from dual;

--CIS 17.2.1 (L1) Mapped Rule V-56303
select add_rule_data ('default','V-6011','SV-50462r1_cis_rule','default','high','The System must be configured audit Application Group Management.',
'This rule verifies that the system will be configured to audit "Application Group Management" for Success and Failure.',
'F-56000_cis','
Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Auditing "Audit Application Group Management" policy auditpol /set /Subcategory:"Application Group Management" /Success:Enable /Failure:Enable 
For Reference ths policy: Follow below path and Select On Checkbox Select "Success" and "Failure". 
Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Account Management -> Set "Audit Application Group Management" with "Success and Failure" selected.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000069','C-CIS-6011_chk',
'Open a Command Prompt with elevated privileges ("Run as Administrator").
Enter below Command to get the status:
Auditpol /get /Subcategory:"Application Group Management"
System audit policy
Category/Subcategory                      Setting
Account Management
Application Group Management           Success and Failure
If auditPol result is not matched with required value then this is a finding.',
'Customized rule by Cloud Raxak') from dual;

--CIS 17.5.1 (L1) Mapped Rule V-56308
select add_rule_data ('default','V-6012','SV-50462r1_cis_rule','default','high','The System must be configured to Audit Account Lockout','
This rule verifies that the system will be configured to audit "Account Lockout" for Success and Failure.',
'F-56000_cis','
Open a Command Prompt with elevated privileges ("Run as Administrator") to set for auditing "Account Lockout" policy auditpol /set /Subcategory:"Account Lockout" /Success:Enable /Failure:Enable.
For Reference ths policy: Follow below path and Select On Checkbox Select "Success" and "Failure".
Configure the policy value for Computer Configuration ->Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> Set "Audit Account lockout" with "Success and Failure" selected.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000070','C-CIS-6012_chk',
'Open a Command Prompt with elevated privileges ("Run as Administrator").
Enter below Command to get the status:
auditpol /get /Subcategory:"Account Lockout"
System audit policy
Category/Subcategory                      Setting
Logon/Logoff
Account Lockout                         Success and Failure
If auditPol result is not matched with required value then this is a finding.',
'Customized rule by Cloud Raxak') from dual;

--CIS 17.5.4 (L1) Mapped Rule V-56313
select add_rule_data ('default','V-6013','SV-50462r1_cis_rule','default','high','The System must be configured to audit "Other Logon/Logoff Events"',
'This rule verifies that the system will be configured to audit "Other Logon/Logoff Events" for Success and Failure.',
'F-56000_cis',
'Open a Command Prompt with elevated privileges ("Run as Administrator") to set for auditing "Other Logon/Logoff Events" auditpol /set /Subcategory:"Other Logon/Logoff Events" /Success:Enable /Failure:Enable.
For Reference ths policy: Follow below path and Select On Checkbox with "Success" and "Failure".
Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Logon/Logoff -> Set "Audit Other Logon/Logoff Events" with "Success and Failure" selected.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000071','C-CIS-6013_chk',
'Open a Command Prompt with elevated privileges ("Run as Administrator").
Enter below Command to get the status:
auditpol /get /Subcategory:"Other Logon/Logoff Events"
System audit policy
Category/Subcategory                      Setting
Logon/Logoff
Other Logon/Logoff Events               Success and Failure
If auditPol result is not matched with required value then this is a finding.',
'Customized rule by Cloud Raxak') from dual;

--CIS 17.6.1 (L1) Mapped Rule V-56323
select add_rule_data ('default','V-6014','SV-50462r1_cis_rule','default','high','The System must be configured to audit "Other Object Access Events"','This rule verifies that the system will be configured to audit "Other Object Access Events" for Success and Failure.',
'F-56000_cis',
'Open a Command Prompt with elevated privileges ("Run as Administrator") to set for Not to Audit "Other Object Access Events" policy auditpol /set /Subcategory:"Other Object Access Events" /Success:Enable /Failure:Enable. 
For Reference ths policy: Follow below path and Select On Checkbox with "Success" and "Failure".
Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policy -> Object Access -> Set "Audit other Object Access Events" with "Success and Failure" selected.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000072','C-CIS-6014_chk',
'Open a Command Prompt with elevated privileges ("Run as Administrator").
Enter below Command to get the status:
Auditpol /get /Subcategory:"Other Object Access Events"
System audit policy
Category/Subcategory                      Setting
Object Access
Other Object Access Events                Success and Failure
If auditPol result is not matched with required value then this is a finding.',
'Customized rule by Cloud Raxak') from dual;

--CIS 17.6.2 (L1) Mapped Rule V-36667
select add_rule_data ('default','V-6015','SV-51604r1_cis_rule','default','medium','The system must be configured to audit Object Access - Removable Storage.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised.  Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
Removable Storage auditing under Object Access records events related to access attempts on file system objects on removable storage devices.',
'F-44725r1_cis_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> Object Access -> "Audit Removable Storage" with "Success and Failure" selected.' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000073','C-46854r1_cis_chk',
'-Open a Command Prompt with elevated privileges ("Run as Administrator").
Enter below Command to get the status:
Auditpol /get /Subcategory:"Removable storage"
System audit policy
Category/Subcategory                      Setting
Object Access
Other Object Access Events                Success and Failure
If auditPol result is not matched with required value then this is a finding.',
'Customized rule by Cloud Raxak') from dual;

--CIS 17.9.2 (L1) Mapped Rule V-56331
select add_rule_data ('default','V-6016','SV-50462r1_cis_rule','default','high','The System must be configure to audit "Other System Events".','This rule verifies that the system will be configured to audit "Other System Events" for Success and Failure.',
'F-56000_cis','
Open a Command Prompt with elevated privileges ("Run as Administrator") to set for auditing "Other System Events" auditpol /set /Subcategory:"Other System Events" /Success:Enable /Failure:Enable.
For Reference ths policy: Follow below path and Select On Checkbox with "Success" and "Failure".
Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Advanced Audit Policy Configuration -> System Audit Policies -> System -> Set "Other System Events" with "Success and Failure" selected.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000074','C-CIS-6016_chk','
Open a Command Prompt with elevated privileges ("Run as Administrator").
Enter below Command to get the status:
auditpol /get /Subcategory:"Other System Events"
System audit policy
Category/Subcategory              Setting
Privilege Use
Other System Events               Success and Failure
If auditPol result is not matched with required value then this is a finding.',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.4.5 (L2) Mapped Rule V-4113
select add_rule_data ('default','V-6017','SV-52927r1_rule','default','low','The system must be configured to limit how often keep-alive packets are sent.','This setting controls how often TCP sends a keep-alive packet in attempting to verify that an idle connection is still intact.  A higher value could allow an attacker to cause a denial of service with numerous connections.',
'F-45853r2_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (KeepAliveTime) How often keep-alive packets are sent in milliseconds" to "300000 or 5 minutes (recommended)".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-SO-000041',
'C-47232r2_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: KeepAliveTime

Value Type: REG_DWORD
Value: 300000','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.10 (L2) Mapped Rule V-21956
select add_rule_data ('default','V-6018','SV-53181r1_cis_rule','default','low','IPv6 TCP data retransmissions must be configured to prevent resources from becoming exhausted.',
'Configuring Windows to limit the number of times that IPv6 TCP retransmits unacknowledged data segments before aborting the attempt helps prevent resources from becoming exhausted.',
'F-46107r1_cis_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (TcpMaxDataRetransmissions IPv6) How many times unacknowledged data is retransmitted (3 recommended, 5 is the default)" to "3".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000047',
'C-47487r1_cis_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip6\Parameters\

Value Name: TcpMaxDataRetransmissions

Type: REG_DWORD
Value: 3','Customized rule by Cloud Raxak') from dual;

--CIS 18.4.11 (L2) Mapped Rule V-4438
select add_rule_data ('default','V-6019','SV-52929r1_cis_rule','default','low','The system must limit how many times unacknowledged TCP data is retransmitted.','In a SYN flood attack, the attacker sends a continuous stream of SYN packets to a server, and the server leaves the half-open connections open until it is overwhelmed and is no longer able to respond to legitimate requests.',
'F-45855r2_cis_fix','Configure the policy value for Computer Configuration -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> "MSS: (TcpMaxDataRetransmissions) How many times unacknowledged data is retransmitted (3 recommended, 5 is the default)" to "3".

(See "Updating the Windows Security Options File" in the STIG Overview document if MSS settings are not visible in the system"s policy tools.)',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000048',
'C-47234r2_cis_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: TcpMaxDataRetransmissions

Value Type: REG_DWORD
Value: 3','Customized rule by Cloud Raxak') from dual;

--CIS 18.8.3.1 (L1) Mapped Rule V-73511
select add_rule_data ('default','V-6020','SV-88163r1_cis_rule','default','medium','Command line data must not be included in process creation events.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.
Enabling "Include command line data for process creation events" will record the command line information with the process creation events in the log. Command-line arguments may contain sensitive or private information such as passwords or user data.',
'F-79953r1_cis_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Audit Process Creation >> "Include command line in process creation events" to "Disabled".',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN16-CIS-000100',
'C-73585r1_cis_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit\
Value Name: ProcessCreationIncludeCmdLine_Enabled
Value Type: REG_DWORD
Value: 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.8.14.1 (L1) Mapped Rule V-36679
select add_rule_data ('default','V-6021','SV-51608r1_cis_rule','default','medium','Early Launch Antimalware, Boot-Start Driver Initialization Policy must be enabled and configured to only "Good, unknown and bad but critical".',
'Compromised boot drivers can introduce malware prior to some protection mechanisms that load after initialization. The Early Launch Antimalware driver can limit allowed drivers based on classifications determined by the malware protection application.  At a minimum, drivers determined to be bad must not be allowed.',
'F-44729r1_cis_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> System -> Early Launch Antimalware -> "Boot-Start Driver Initialization Policy" to "Enabled: Good, unknown and bad but critical" selected.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000027',
'C-46859r1_cis_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \System\CurrentControlSet\Policies\EarlyLaunch\

Value Name: DriverLoadPolicy

Type: REG_DWORD
Value: 3','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.26.1.1 (L1) Mapped Rule V-56364
select add_rule_data ('default','V-6022','SV-50462r1_cis_rule','default','high','Application Event Log must be configured to retained old events when the log file reaches its maximum size.',
'This rule setting controls Event Log behavior when the log file reaches its maximum size. Old events may or may not be retained according to the Backup log automatically when log is full.',
'F-56000_cis','
Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Application  
Value Name: AutoBackupLogFiles 
Value: 1
Value Name: Retention 
Value: 0
Type: REG_SZ 
Altenative method : 
"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> Control Event Log behavior when the log file reaches its maximum size" to Disabled.
"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Application -> Back up log automatically when full" to Enabled.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000028','C-46865r1_cis_chk','
If the following registry value does not exist or is not configured as specified, this is a finding: 
Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Application
Value Name: AutoBackupLogFiles 
Value: 1
Value Name: Retention 
Value: 0
Type: REG_SZ','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.26.2.1 (L1) Mapped Rule V-56370
select add_rule_data ('default','V-6023','SV-50462r1_cis_rule','default','high','Security Event Log must be configured to retained old events when the log file reaches its maximum size.',
'This rule setting controls Event Log behaviour when the log file reaches its maximum size. Old events may or may not be retained according to the Backup log automatically when full.',
'F-56000_cis',
'Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Security 
Value Name: AutoBackupLogFiles 
Value Name: Retention 
Type: REG_SZ 
Value: 1 
Altenative method : 
"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security-> Control Event Log behavior when the log file reaches its maximum size" to Disabled
"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Security-> Back up log automatically when full" to Enabled',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000029','C-46866r1_cis_chk','
If the following registry value does not exist or is not configured as specified, this is a finding: 
Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\Security
Value Name: AutoBackupLogFiles 
Value: 1
Value Name: Retention 
Value: 0
Type: REG_SZ','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.26.4.1 (L1) Mapped Rule V-56373
select add_rule_data ('default','V-6024','SV-50462r1_cis_rule','default','high','System Event Log must be configured to retained old events when the log file reaches its maximum size.','This rule setting controls Event Log behavior when the log file reaches its maximum size. Old events may or may not be retained according to the Backup log automatically when full.',
'F-56000_cis','
Configure the following registry value: 
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\System 
Value Name: AutoBackupLogFiles 
Value: 1
Value Name: Retention 
Value: 0Type: REG_SZ 
Value: 1 
Altenative method :
"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> Control Event Log behavior when the log file reaches its maximum size" to Disabled.
"Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> System -> Back up log automatically when full" to Enabled',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000029','C-46867r1_cis_chk','
If the following registry value does not exist or is not configured as specified, this is a finding: 
Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \Software\Policies\Microsoft\Windows\Eventlog\System
Value Name: AutoBackupLogFiles 
Value: 1
Value Name: Retention 
Value: 0Type: REG_SZ','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.81.2.1 (L1) Mapped Rule V-57477
select add_rule_data ('default','V-6025','SV-71961r1_cis_rule','default','medium','The system must be configured to automatically consent to send all data requested by a local or DOD-wide error collection site.',
'Configuring error reporting to send all requested data ensures all relevant data associated with the error report is captured for later analysis.  This setting determines the default consent behavior of Windows Error Reporting.',
'F-62767r1_cis_fix','Configure the policy value for Computer Configuration -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Consent -> "Configure Default consent" to "Enabled" with "Always ask before sending data" selected for "Consent level".' , 
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000017',
'C-58399r1_cis_chk','If the following registry value does not exist or is not configured as specified, this is a finding:

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting\Consent\

Value Name:  DefaultConsent

Type:  REG_DWORD
Value:  0x00000001 (1)','Customized rule by Cloud Raxak') from dual;

--CIS 18.9.95.1 (L1) Mapped Rule V-73591
select add_rule_data ('default','V-6026','SV-88255r1_cis_rule','default','medium','PowerShell script block logging must be disabled.',
'This policy setting enables logging of all PowerShell script input to the Microsoft-WindowsPowerShell/Operational event log.: In Microsoft own hardening guidance, they recommend the opposite value,
Enabled, because having this data logged improves investigations of PowerShell attack incidents. However, the default ACL on the PowerShell Operational log allows Interactive User (i.e. any logged on user) to read it, and therefore possibly expose passwords or other sensitive information to unauthorized users. If Microsoft locks down the default ACL on that log in the future (e.g. to restrict it only to Administrators), then we will revisit this recommendation in a future release.',
'F-80041r1_cis_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows PowerShell >> "Turn on PowerShell Script Block Logging" to "Disabled".',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN16-CIS-000490',  
'C-73673r1_cis_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.
Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\ Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging\
Value Name: EnableScriptBlockLogging
Value Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

--CIS 2.2.19 (L1)
select add_rule_data ('default','V-6027','sv-52949r1_cis_rule','default','medium',
'Deny log on as a service',
'This security setting determines which service accounts are prevented from registering a process as a service. 
This user right supersedes the Log on as a service user right if an account is subject to both policies.
The recommended state for this setting is to include: "Guests"',
'F-55776r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to include: "Guests":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> User Rights Assignment -> Deny log on as a service',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000001',
'C-47166r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed.',
'Customized rule by Cloud Raxak') from dual;

--CIS 2.3.1.2 (L1)
select add_rule_data ('default','V-6029','sv-52951r1_cis_rule','default','medium',
'Accounts: Block Microsoft accounts',
'This policy setting prevents users from adding new Microsoft accounts on this computer.
The recommended state for this setting is: Users can"t add or log on with Microsoft accounts. Organizations that want to effectively implement identity management policies and maintain firm control of what accounts are used to log onto their computers will probably
want to block Microsoft accounts. Organizations may also need to block Microsoft accounts in order to meet the requirements of compliance standards that apply to their information systems.',
'F-55778r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Users cant add or log on with Microsoft accounts":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Local Policies -> Security Options -> Accounts: Block Microsoft accounts',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000003',
'C-47168r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System 
Registry: NoConnectedUser 
Value: 3',
'Customized rule by Cloud Raxak') from dual;

--CIS 9.1.5 (L1)
select add_rule_data ('default','V-6030','sv-52952r1_cis_rule','default','medium',
'Windows Firewall: Domain: Logging: Name',
'Use this option to specify the path and name of the file in which Windows Firewall will write its log information.
The recommended state for this setting is: %SYSTEMROOT%\System32\logfiles\firewall\domainfw.log.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55779r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "%SYSTEMROOT%\System32\logfiles\firewall\domainfw.log":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Domain Profile -> Logging Customize -> Name',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000004',
'C-47169r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging 
Registry: LogFilePath 
Value: "%SYSTEMROOT%\System32\logfiles\firewall\domainfw.log:"',
'Customized rule by Cloud Raxak') from dual;


--CIS 9.1.6 (L1)
select add_rule_data ('default','V-6031','sv-52953r1_cis_rule','default','medium',
'Windows Firewall: Domain: Logging: Size limit (KB)',
'Use this option to specify the size limit of the file in which Windows Firewall will write its log information.
The recommended state for this setting is: 16,384 KB or greater.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users',
'F-55780r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "16,384 KB or greater":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Domain Profile -> Logging Customize -> Size limit (KB)',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000005',
'C-47170r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging
Registry: LogFileSize
Value: 4000(16384)',
'Customized rule by Cloud Raxak') from dual;

--CIS 9.1.7 (L1)
select add_rule_data ('default','V-6032','sv-52954r1_cis_rule','default','medium',
'Windows Firewall: Domain: Logging: Log dropped packets',
'Use this option to log when Windows Firewall with Advanced Security discards an inbound packet for any reason. 
The log records why and when the packet was dropped. Look for entries with the word DROP in the action column of the log. 
The recommended state for this setting is: Yes.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55781r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Yes":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Domain Profile -> Logging Customize -> Log dropped packets',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000006',
'C-47171r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging 
Rgistry: LogDroppedPackets 
Value: 1',
'Customized rule by Cloud Raxak') from dual;

--CIS 9.1.8 (L1)
select add_rule_data ('default','V-6033','sv-52955r1_cis_rule','default','medium',
'Windows Firewall: Domain: Logging: Log successful connections',
'Use this option to log when Windows Firewall with Advanced Security allows an inbound connection. 
The log records why and when the connection was formed. Look for entries with the word ALLOW in the action column of the log.
The recommended state for this setting is: Yes.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55782r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Yes":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Domain Profile -> Logging Customize -> Log successful connections',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000007',
'C-47172r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\DomainProfile\Logging 
Registry: LogSuccessfulConnections 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 9.2.5 (L1)
select add_rule_data ('default','V-6034','sv-52956r1_cis_rule','default','medium',
'Windows Firewall: Private: Logging: Name',
'Use this option to specify the path and name of the file in which Windows Firewall will write its log information.
The recommended state for this setting is: %SYSTEMROOT%\System32\logfiles\firewall\privatefw.log.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55779r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "%SYSTEMROOT%\System32\logfiles\firewall\privatefw.log":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Private Profile -> Logging Customize -> Name',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000008',
'C-47173r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging 
Registry: LogFilePath 
Value: "%SYSTEMROOT%\System32\logfiles\firewall\Privatefw.log:"',
'Customized rule by Cloud Raxak') from dual;


--CIS 9.2.6 (L1)
select add_rule_data ('default','V-6035','sv-52957r1_cis_rule','default','medium',
'Windows Firewall: Private: Logging: Size limit (KB)',
'Use this option to specify the size limit of the file in which Windows Firewall will write its log information.
The recommended state for this setting is: 16,384 KB or greater.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users',
'F-55780r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "16,384 KB or greater":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Private Profile -> Logging Customize -> Size limit (KB)',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000009',
'C-47174r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging 
Registry: LogFileSize 
Value: 4000 (16384)',
'Customized rule by Cloud Raxak') from dual;

--CIS 9.2.7 (L1)
select add_rule_data ('default','V-6036','sv-52958r1_cis_rule','default','medium',
'Windows Firewall: Private: Logging: Log dropped packets',
'Use this option to log when Windows Firewall with Advanced Security discards an inbound packet for any reason. 
The log records why and when the packet was dropped. Look for entries with the word DROP in the action column of the log. 
The recommended state for this setting is: Yes.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55781r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Yes":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Private Profile -> Logging Customize -> Log dropped packets',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000010',
'C-47175r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging 
Registry: LogDroppedPackets 
Value: 1',
'Customized rule by Cloud Raxak') from dual;

--CIS 9.2.8 (L1)
select add_rule_data ('default','V-6037','sv-52959r1_cis_rule','default','medium',
'Windows Firewall: Private: Logging: Log successful connections',
'Use this option to log when Windows Firewall with Advanced Security allows an inbound connection. 
The log records why and when the connection was formed. Look for entries with the word ALLOW in the action column of the log.
The recommended state for this setting is: Yes.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55782r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Yes":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Private Profile -> Logging Customize -> Log successful connections',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000011',
'C-47176r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PrivateProfile\Logging 
Registry: LogSuccessfulConnections 
Value: 1',
'Customized rule by Cloud Raxak') from dual;



--CIS 9.3.7 (L1)
select add_rule_data ('default','V-6038','sv-52960r1_cis_rule','default','medium',
'Windows Firewall: Public: Logging: Name',
'Use this option to specify the path and name of the file in which Windows Firewall will write its log information.
The recommended state for this setting is: %SYSTEMROOT%\System32\logfiles\firewall\publicfw.log.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55783r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "%SYSTEMROOT%\System32\logfiles\firewall\publicfw.log":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile -> Logging Customize -> Name',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-0000012',
'C-47177r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging 
Registry: LogFilePath 
Value: "%SYSTEMROOT%\System32\logfiles\firewall\publicfw.log:"',
'Customized rule by Cloud Raxak') from dual;


--CIS 9.3.8 (L1)
select add_rule_data ('default','V-6039','sv-52961r1_cis_rule','default','medium',
'Windows Firewall: Public: Logging: Size limit (KB)',
'Use this option to specify the size limit of the file in which Windows Firewall will write its log information.
The recommended state for this setting is: 16,384 KB or greater.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users',
'F-55784r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "16,384 KB or greater":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile -> Logging Customize -> Size limit (KB)',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-0000013',
'C-47178r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging 
Registry: LogFileSize 
Value: 4000 (16384)',
'Customized rule by Cloud Raxak') from dual;

--CIS 9.3.9 (L1)
select add_rule_data ('default','V-6040','sv-52962r1_cis_rule','default','medium',
'Windows Firewall: Public: Logging: Log dropped packets',
'Use this option to log when Windows Firewall with Advanced Security discards an inbound packet for any reason. The log records why and when the packet was dropped. Look for entries with the word DROP in the action column of the log. 
The recommended state for this setting is: Yes.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55785r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Yes":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile -> Logging Customize -> Log dropped packets',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000014',
'C-47179r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging 
Registry: LogDroppedPackets 
Value: 1',
'Customized rule by Cloud Raxak') from dual;

--CIS 9.3.10 (L1)
select add_rule_data ('default','V-6041','sv-52963r1_cis_rule','default','medium',
'Windows Firewall: Public: Logging: Log successful connections',
'Use this option to log when Windows Firewall with Advanced Security allows an inbound connection. 
The log records why and when the connection was formed. Look for entries with the word ALLOW in the action column of the log.
The recommended state for this setting is: Yes.
If events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55786r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Yes":
Computer Configuration -> Policies -> Windows Settings -> Security Settings -> Windows Firewall with Advanced Security -> Windows Firewall with Advanced Security -> Windows Firewall Properties -> Public Profile -> Logging Customize -> Log successful connections',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000015',
'C-47180r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsFirewall\PublicProfile\Logging 
Registry: LogSuccessfulConnections 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.1.1.1 (L1)
select add_rule_data ('default','V-6042','sv-52964r1_cis_rule','default','medium',
'Prevent enabling lock screen camera',
'Disables the lock screen camera toggle switch in PC Settings and prevents a camera from being invoked on the lock screen.
The recommended state for this setting is: Enabled.
Disabling the lock screen camera extends the protection afforded by the lock screen to camera features.',
'F-55787r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Administrative Templates -> Control Panel -> Personalization -> Prevent enabling lock screen camera',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000016',
'C-47181r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Personalization 
Registry: NoLockScreenCamera 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.5.21.1 (L1)
select add_rule_data ('default','V-6055','sv-52977r1_cis_rule','default','medium',
'Minimize the number of simultaneous connections to the Internet or a Windows Domain',
'This policy setting prevents computers from connecting to both a domain based network and a non-domain based network at the same time.
 The recommended state for this setting is: Enabled.
 Blocking simultaneous connections can help prevent a user unknowingly allowing network traffic to flow between the Internet and the enterprise managed network.',
'F-55800r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> Network -> Windows Connection Manager -> Minimize the number of simultaneous connections to the Internet or a Windows Domain',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000029',
'C-47194r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy 
Registry: fMinimizeConnections 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.5.21.2 (L2)
select add_rule_data ('default','V-6056','sv-52978r1_cis_rule','default','medium',
'Prohibit connection to non-domain networks when connected to domain authenticated network',
'This policy setting prevents computers from connecting to both a domain based network and a non-domain based network at the same time.
The recommended state for this setting is: Enabled.
The potential concern is that a user would unknowingly allow network traffic to flow between the insecure public network and the enterprise managed network.',
'F-55801r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled:
Computer Configuration -> Policies -> Administrative Templates -> Network -> Windows Connection Manager -> Prohibit connection to non-domain networks when connected to domain authenticated network',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000030',
'C-47195r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WcmSvc\GroupPolicy 
Registry: fBlockNonDomain 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.21.2 (L1)
select add_rule_data ('default','V-6058','sv-52980r1_cis_rule','default','medium',
'Configure registry policy processing: Do not apply during periodic background processing',
'The "Do not apply during periodic background processing" option prevents the system from updating affected policies in the background while the computer is in use. When background updates are disabled, policy changes will not take effect until the next user logon or system restart.
The recommended state for this setting is: Enabled: FALSE (unchecked).',
'F-55803r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled", then set the "Do not apply during periodic background processing option" to FALSE (unchecked):
Computer Configuration -> Policies -> Administrative Templates -> System -> Group Policy -> Configure registry policy processing',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000032',
'C-47197r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\GroupPolicy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2} 
Registry: NoBackgroundPolicy 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.22.1.4 (L2)
select add_rule_data ('default','V-6060','sv-52982r1_cis_rule','default','medium',
'Turn off Internet Connection Wizard if URL connection is referring to Microsoft.com',
'This policy setting specifies whether the Internet Connection Wizard can connect to Microsoft to download a list of Internet Service Providers (ISPs).
The recommended state for this setting is: Enabled.
In an enterprise managed environment we want to lower the risk of a user unknowingly exposing sensitive data.',
'F-55805r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> Turn off Internet Connection Wizard if URL connection is referring to Microsoft.com',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000034',
'C-47199r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Internet Connection Wizard 
Registry: ExitOnMSICW 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.22.1.7 (L2) 
select add_rule_data ('default','V-6061','sv-52983r1_cis_rule','default','medium',
'Turn off Registration if URL connection is referring to Microsoft.com',
'This policy setting specifies whether the Windows Registration Wizard connects to Microsoft.com for online registration.
The recommended state for this setting is: Enabled
Users in an enterprise managed environment should not be registering their own copies of Windows, providing their own PII in the process.',
'F-55806r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled:
Computer Configuration -> Policies -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> Turn off Registration if URL connection is referring to Microsoft.com',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000035',
'C-47200r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Registration Wizard Control 
Registry: NoRegistration 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.22.1.11 (L2)
select add_rule_data ('default','V-6062','sv-52984r1_cis_rule','default','medium',
'Turn off the Windows Messenger Customer Experience Improvement Program',
'This policy setting specifies whether Windows Messenger can collect anonymous information about how the Windows Messenger software and service is used. 
Microsoft uses information collected through the Customer Experience Improvement Program to detect software flaws so that they can be corrected more quickly, enabling this setting will reduce the amount of data Microsoft is able to gather for this purpose.
The recommended state for this setting is: Enabled.
Large enterprise managed environments may not want to have information collected by Microsoft from managed client computers.',
'F-55807r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> Turn off the Windows Messenger Customer Experience Improvement Program',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000036',
'C-47201r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Messenger\Client 
Registry: CEIP 
Value: 2',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.13 (L2)
select add_rule_data ('default','V-6063','sv-52985r1_cis_rule','default','medium',
'Turn off Windows Error Reporting',
'This policy setting controls whether or not errors are reported to Microsoft. Error Reporting is used to report information about a system or application that has failed or has stopped responding and is used to improve the quality of the product.
The recommended state for this setting is: Enabled.
If a Windows Error occurs in a secure, enterprise managed environment, the error should be reported directly to IT staff for troubleshooting and remediation. 
There is no benefit to the corporation to report these errors directly to Microsoft, and there is some risk of unknowingly exposing sensitive data as part of the error',
'F-55808r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> System -> Internet Communication Management -> Internet Communication settings -> Turn off Windows Error Reporting',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000037',
'C-47202r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting 
Registry: Disabled 
Value: 1
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting 
Registry: DoReport 
Value: 0',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.27.2 (L1)
select add_rule_data ('default','V-6064','sv-52986r1_cis_rule','default','medium',
'Do not enumerate connected users on domainjoined computers',
'This policy setting prevents connected users from being enumerated on domain-joined computers.
The recommended state for this setting is: Enabled.
A malicious user could use this feature to gather account names of other users, that information could then be used in conjunction with other types of attacks such as guessing passwords or social engineering. 
The value of this countermeasure is small because a user with domain credentials could gather the same account information using other methods.',
'F-55809r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> System -> Logon -> Do not enumerate connected users on domain-joined computers',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000038',
'C-47203r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System
Registry: DontEnumerateConnectedUsers 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.27.5 (L1)
select add_rule_data ('default','V-6065','sv-52987r1_cis_rule','default','medium',
'Turn off picture password sign-in',
'This policy setting allows you to control whether a domain user can sign in using a picture password.
The recommended state for this setting is: Enabled.
Note: If the picture password feature is permitted, the users domain password is cached in the system vault when using it Picture passwords bypass the requirement for a typed complex password. 
In a shared work environment, a simple shoulder surf where someone observed the on-screen gestures would allow that person to gain access to the system without the need to know the complex password. 
Vertical monitor screens with an image are much more visible at a distance than horizontal key strokes, increasing the likelihood of a successful observation of the mouse gestures.',
'F-55810r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> System -> Logon -> Turn off picture password sign-in',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000039',
'C-47204r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System 
Registry: BlockDomainPicturePassword 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.27.6 (L1)
select add_rule_data ('default','V-6066','sv-52988r1_cis_rule','default','medium',
'Turn on convenience PIN sign-in',
'This policy setting allows you to control whether a domain user can sign in using a convenience PIN. 
In Windows 10, convenience PIN was replaced with Passport, which has stronger security properties. 
To configure Passport for domain users, use the policies under Computer Configuration -> Administrative Templates -> Windows Components -> Microsoft Passport for Work.
The recommended state for this setting is: Disabled.',
'F-55811r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Disabled":
Computer Configuration -> Policies -> Administrative Templates -> System -> Logon -> Turn on convenience PIN sign-in',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000040',
'C-47205r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System
Registry: AllowDomainPINLogon 
Value: 0',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.46.1 (L2)
select add_rule_data ('default','V-6067','sv-52989r1_cis_rule','default','medium',
'Turn off the advertising ID',
'This policy setting turns off the advertising ID, preventing apps from using the ID for experiences across apps.
The recommended state for this setting is: Enabled.
Tracking user activity for advertising purposes, even anonymously, may be a privacy concern. 
In an enterprise managed environment, applications should not need or require tracking for targeted advertising.',
'F-55812r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> System -> User Profiles -> Turn off the advertising ID',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000041',
'C-47206r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\policies\Microsoft\Windows\AdvertisingInfo 
Registry: DisabledByGroupPolicy 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.49.1.1 (L2)
select add_rule_data ('default','V-6068','sv-52990r1_cis_rule','default','medium',
'Enable Windows NTP Client',
'This policy setting specifies whether the Windows NTP Client is enabled. 
Enabling the Windows NTP Client allows your computer to synchronize its computer clock with other NTP servers. 
You might want to disable this service if you decide to use a third-party time provider.
The recommended state for this setting is: Enabled.',
'F-55813r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled:
Computer Configuration -> Policies -> Administrative Templates -> System -> Windows Time Service -> Time Providers -> Enable Windows NTP Client',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000042',
'C-47207r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpClient 
Registry: Enabled 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.8.49.1.2 (L2) 
select add_rule_data ('default','V-6069','sv-52991r1_cis_rule','default','medium',
'Enable Windows NTP Server',
'This policy setting allows you to specify whether the Windows NTP Server is enabled.
The recommended state for this setting is: Disabled.
Note: In most enterprise managed environments, you should not disable the Windows NTPServer on Domain Controllers, as it is very important for the operation of NT5DS (domain hierarchy-based) time synchronization.
The configuration of proper time synchronization is critically important in an enterprise managed environment both due to the sensitivity of Kerberos authentication timestamps and also to ensure accurate security logging',
'F-55814r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Disabled":
Computer Configuration -> Policies -> Administrative Templates -> System -> Windows TimeService -> Time Providers -> Enable Windows NTP Server',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000043',
'C-47208r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\W32Time\TimeProviders\NtpServer 
Registry: Enabled 
Valu: 0',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.6.1 (L1)
select add_rule_data ('default','V-6070','sv-52992r1_cis_rule','default','medium',
'Allow Microsoft accounts to be optional',
'This policy setting lets you control whether Microsoft accounts are optional for Windows Store apps that require an account to sign in. This policy only affects Windows Store apps that support it.
The recommended state for this setting is: Enabled.
Enabling this setting allows an organization to use their enterprise user accounts instead of using their Microsoft accounts when accessing Windows store apps. This provides the organization with greater control over relevant credentials. 
Microsoft accounts cannot be centrally managed and as such enterprise credential security policies cannot be applied to them, which could put any information accessed by using Microsoft accounts at risk.',
'F-55815r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> App runtime -> Allow Microsoft accounts to be optional',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000044',
'C-47209r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System 
Registry: MSAOptional 
Value: 1',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.9.26.3.1 (L1)
select add_rule_data ('default','V-6079','sv-53001r1_cis_rule','default','medium',
'Setup: Control Event Log behavior when the log file reaches its maximum size',
'This policy setting controls Event Log behavior when the log file reaches its maximum size. 
The recommended state for this setting is: Disabled.
If new events are not recorded it may be difficult or impossible to determine the root cause of system problems or the unauthorized activities of malicious users.',
'F-55824r1_cis_fix',
'Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Setup -> Control Event Log behavior when the log file reaches its maximum size to "Disabled".
Computer Configuration -> Administrative Templates -> Windows Components -> Event Log Service -> Setup -> Back up log automatically when full to "Enabled"',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000053',
'C-47218r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup 
Registry: Retention 
Value: 0
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\EventLog\Setup 
Registry: AutoBackupLogFiles 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.39.1.1 (L2)
select add_rule_data ('default','V-6080','sv-53002r1_cis_rule','default','medium',
'Turn off Windows Location Provider',
'This policy setting turns off the Windows Location Provider feature for the computer.
The recommended state for this setting is: Enabled.
This setting affects the Windows Location Provider feature (e.g. GPS or other location tracking). 
From a security perspective, its not a good idea to reveal your location to software in most cases, but there are legitimate uses, such as mapping software. 
However, they should not be used in high security environments.',
'F-55825r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Location and Sensors -> Windows Location Provider -> Turn off Windows Location Provider',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000054',
'C-47219r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors 
Registry: DisableWindowsLocationProvider 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.52.1 (L1)
select add_rule_data ('default','V-6081','sv-53003r1_cis_rule','default','medium',
'Prevent the usage of OneDrive for file storage',
'This policy setting lets you prevent apps and features from working with files on OneDrive using the Next Generation Sync Client.
The recommended state for this setting is: Enabled.
Enabling this setting prevents users from accidentally uploading confidential or sensitive corporate information to the OneDrive cloud service using the Next Generation Sync Client.',
'F-55826r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> OneDrive -> Prevent the usage of OneDrive for file storage
Note: This Group Policy path may not exist by default. It is provided by the Group Policy template SkyDrive.admx/adml that is included with the Microsoft Windows 8.1 and Server 2012 R2 Administrative Templates (or newer). 
However, we strongly recommend you only use the version included with the Microsoft Windows 10 Release 1607 and Server 2016 Administrative Templates (or newer). Older versions of the templates had conflicting settings in different template files for both OneDrive and SkyDrive, until it was cleaned up properly in the above version.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000055',
'C-47220r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OneDrive 
Registry: DisableFileSyncNGSC 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.76.3.1 (L1)
select add_rule_data ('default','V-6085','sv-53007r1_cis_rule','default','medium',
'Configure local setting override for reporting to Microsoft MAPS',
'This policy setting configures a local override for the configuration to join Microsoft Active Protection Service (MAPS), which Microsoft has now renamed to "Windows Defender Antivirus Cloud Protection Service". This setting can only be set by Group Policy.
The recommended state for this setting is: Disabled.',
'F-55830r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Disabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows Defender Antivirus -> MAPS -> Configure local setting override for reporting to Microsoft MAPS',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000059',
'C-47224r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsDefender\Spynet 
Registry: LocalSettingOverrideSpynetReporting 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.76.7.1 (L1)
select add_rule_data ('default','V-6086','sv-53008r1_cis_rule','default','medium',
'Turn on behavior monitoring',
'This policy setting allows you to configure behavior monitoring for Windows Defender Antivirus.
The recommended state for this setting is: Enabled.
When running an antivirus solution such as Windows Defender Antivirus, it is important to ensure that it is configured to heuristically monitor in real-time for suspicious and known malicious activity.',
'F-55831r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows Defender Antivirus -> Real-Time Protection -> Turn on behavior monitoring',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000060',
'C-47225r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Real-Time Protection 
Registry: DisableBehaviorMonitoring 
Value: 0',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.76.9.1 (L2)
select add_rule_data ('default','V-6087','sv-53009r1_cis_rule','default','medium',
'Configure Watson events',
'This policy setting allows you to configure whether or not Watson events are sent.
The recommended state for this setting is: Disabled.
Watson events are the reports that get sent to Microsoft when a program or service crashes or fails, including the possibility of automatic submission. 
Preventing this information from being sent can help reduce privacy concerns.',
'F-55832r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Disabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows Defender Antivirus -> Reporting -> Configure Watson events',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000061',
'C-47226r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting 
Registry: DisableGenericRePorts 
Value: 0',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.76.10.1 (L1)
select add_rule_data ('default','V-6088','sv-53010r1_cis_rule','default','medium',
'Scan removable drives',
'This policy setting allows you to manage whether or not to scan for malicious software and unwanted software in the contents of removable drives, such as USB flash drives, when running a full scan.
The recommended state for this setting is: Enabled.
It is important to ensure that any present removable drives are always included in any type of scan, as removable drives are more likely to contain malicious software brought in to the enterprise managed environment from an external, unmanaged computer.',
'F-55833r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows Defender Antivirus -> Scan -> Scan removable drives',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000062',
'C-47227r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsDefender\Scan 
Registry: DisableRemovableDriveScanning 
Value: 1',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.76.10.2 (L1)
select add_rule_data ('default','V-6089','sv-53011r1_cis_rule','default','medium',
'Turn on e-mail scanning',
'This policy setting allows you to configure e-mail scanning. When e-mail scanning is enabled, the engine will parse the mailbox and mail files, according to their specific format, in order to analyze the mail bodies and attachments. 
Several e-mail formats are currently supported, for example: pst (Outlook), dbx, mbx, mime (Outlook Express), binhex (Mac).
The recommended state for this setting is: Enabled.
Incoming e-mails should be scanned by an antivirus solution such as Windows Defender Antivirus, as email attachments are a commonly used attack vector to infiltrate computers with malicious software.',
'F-55834r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Enabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows Defender Antivirus -> Scan -> Turn on e-mail scanning',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000063',
'C-47228r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\WindowsDefender\Scan 
Registry: DisableEmailScanning 
Value: 0',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.76.14 (L1)
select add_rule_data ('default','V-6090','sv-53012r1_cis_rule','default','medium',
'Turn off Windows Defender AntiVirus',
'This policy setting turns off Windows Defender Antivirus. If the setting is configured to Disabled, Windows Defender Antivirus runs and computers are scanned for malware and other potentially unwanted software.
The recommended state for this setting is: Disabled.
It is important to ensure a current, updated antivirus product is scanning each computer for malicious file activity. 
Microsoft provides a competent solution out of the box in Windows Defender Antivirus. Organizations that choose to purchase a reputable 3rd-party antivirus solution may choose to exempt themselves from this recommendation in lieu of the commercial alternative.',
'F-55835r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Disabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows Defender Antivirus -> Turn off Windows Defender AntiVirus',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000064',
'C-47229r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender 
Registry: DisableAntiSpyware 
Value: 0',
'Customized rule by Cloud Raxak') from dual;


--CIS 18.9.81.3 (L1)
select add_rule_data ('default','V-6092','sv-53014r1_cis_rule','default','medium',
'Automatically send memory dumps for OSgenerated error reports',
'This policy setting controls whether memory dumps in support of OS-generated error reports can be sent to Microsoft automatically. 
This policy does not apply to error reports generated by 3rd-party products, or additional data other than memory dumps.
The recommended state for this setting is: Disabled.
Memory dumps may contain sensitive information and should not be automatically sent to anyone.',
'F-55837r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Disabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows Error Reporting -> Automatically send memory dumps for OSgenerated error reports',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000066',
'C-47231r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting 
Registry: AutoApproveOSDumps 
Value: 0',
'Customized rule by Cloud Raxak') from dual;



--CIS 18.9.95.2 (L1)
select add_rule_data ('default','V-6093','sv-53015r1_cis_rule','default','medium',
'Turn on PowerShell Transcription',
'This Policy setting lets you capture the input and output of Windows PowerShell commands into text-based transcripts.
The recommended state for this setting is: Disabled.
If this setting is enabled there is a risk that passwords could get stored in plain text in the PowerShell_transcript output file.',
'F-55838r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to "Disabled":
Computer Configuration -> Policies -> Administrative Templates -> Windows Components -> Windows PowerShell -> Turn on PowerShell Transcription',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000067',
'C-47232r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
Path: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\PowerShell\Transcription 
Registry: EnableTranscripting 
Value: 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 2.3.1.1 (L1)
select add_rule_data ('default','V-6028','sv-52950r1_cis_rule','default','medium',
'Accounts: Administrator account status',
'This policy setting enables or disables the Administrator account during normal operation. When a computer is booted into safe mode, the Administrator account is always enabled, regardless of how this setting is configured.
In some organizations, it can be a daunting management challenge to maintain a regular schedule for periodic password changes for local accounts. 
Therefore, you may want to disable the built-in Administrator account instead of relying on regular password changes to protect it from attack. 
Another reason to disable this built-in account is that it cannot be locked out no matter how many failed logons it accrues, which makes it a prime target for brute force attacks that attempt to guess passwords. Also, this account has a well-known security identifier (SID) and there are third-party tools that allow authentication by using the SID rather than the account name. This capability means that even if you rename the Administrator account, an attacker could launch a brute force attack by using the SID to log on.',
'F-55777r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Disabled:
Computer Configuration\Policies\Windows Settings\Security Settings\Local Policies\Security Options\Accounts: Administrator account status',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000002',
'C-47167r2_cis_chk',
'Navigate to the UI Path articulated in the Fix description section and confirm it is set as prescribed.',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.3.2 (L1)
select add_rule_data ('default','V-6049','sv-52971r1_cis_rule','default','medium',
'Configure SMB v1 client driver',
'This setting configures the start type for the Server Message Block version 1 (SMBv1) client driver service (MRxSmb10), which is recommended to be disabled.
The recommended state for this setting is: Enabled: Disable driver.
Note: Do not, under any circumstances, configure this overall setting as Disabled, as doing so will delete the underlying registry entry altogether, which will cause serious problems.
Since September 2016, Microsoft has strongly encouraged that SMBv1 be disabled and no longer used on modern networks, as it is a 30 year old design that is much more vulnerable to attacks then much newer designs such as SMBv2 and SMBv3.',
'F-55794r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled and then select Disable Driver:
Computer Configuration\Policies\Administrative Templates\MS Security Guide\Configure SMB v1 client driver
Note: This Group Policy path does not exist by default. An additional Group Policy template (SecGuide.admx/adml) is required - it is available from Microsoft at https://blogs.technet.microsoft.com/secguide/2017/08/30/security-baseline-for-windows-10-creators-update-v1703-final/',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000023',
'C-47188r2_cis_chk',
'Navigate to the UI Path articulated in the Fix Description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mrxsmb10 : Start : 4',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.3.3 (L1)
select add_rule_data ('default','V-6050','sv-52972r1_cis_rule','default','medium',
'Configure SMB v1 server',
'This setting configures the server-side processing of the Server Message Block version 1 (SMBv1) protocol.
The recommended state for this setting is: Disabled.
Since September 2016, Microsoft has strongly encouraged that SMBv1 be disabled and no longer used on modern networks, as it is a 30 year old design that is much more vulnerable to attacks then much newer designs such as SMBv2 and SMBv3.',
'F-55795r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Disabled:
Computer Configuration\Policies\Administrative Templates\MS Security Guide\Configure SMB v1 server
Note: This Group Policy path does not exist by default. An additional Group Policy template (SecGuide.admx/adml) is required - it is available from Microsoft at https://blogs.technet.microsoft.com/secguide/2017/08/30/security-baseline-for-windows-10-creators-update-v1703-final/',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000024',
'C-47189r2_cis_chk',
'Navigate to the UI Path articulated in the Fix Description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters: SMB1 : 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.3.4 (L1)
select add_rule_data ('default','V-6051','sv-52973r1_cis_rule','default','medium',
'Enable Structured Exception Handling Overwrite Protection (SEHOP)',
'Windows includes support for Structured Exception Handling Overwrite Protection (SEHOP). We recommend enabling this feature to improve the security profile of the computer.
The recommended state for this setting is: Enabled.
This feature is designed to block exploits that use the Structured Exception Handler (SEH) overwrite technique. This protection mechanism is provided at run-time. 
Therefore, it helps protect applications regardless of whether they have been compiled with the latest improvements, such as the /SAFESEH option.',
'F-55796r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Disabled:
Computer Configuration\Policies\Administrative Templates\MS Security Guide\Enable Structured Exception Handling Overwrite Protection (SEHOP)
Note: This Group Policy path does not exist by default. An additional Group Policy template (SecGuide.admx/adml) is required - it is available from Microsoft at https://blogs.technet.microsoft.com/secguide/2017/08/30/security-baseline-for-windows-10-creators-update-v1703-final/',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000025',
'C-47190r2_cis_chk',
'This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\kernel: DisableExceptionChainValidation : 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.5.4.1 (L1)
select add_rule_data ('default','V-6052','sv-52974r1_cis_rule','default','medium',
'Set NetBIOS node type to P-node',
'This parameter determines which method NetBIOS over TCP/IP (NetBT) will use to
register and resolve names.
1.A B-node (broadcast) system only uses broadcasts.
2.A P-node (point-to-point) system uses only name queries to a name server (WINS).
3.An M-node (mixed) system broadcasts first, then queries the name server (WINS).
4.An H-node (hybrid) system queries the name server (WINS) first, then broadcasts.
The recommended state for this setting is: NodeType - 0x2 (2).
In order to help mitigate the risk of NetBIOS Name Service (NBT-NS) poisoning attacks, setting the node type to P-node will prevent the system from sending out NetBIOS broadcasts. 
NetBIOS name resolution queries will require a defined and available WINS server for external NetBIOS name resolution. 
If a WINS server is not defined or not reachable, and the desired hostname is not defined in the local cache, local LMHOSTS or HOSTS files, NetBIOS name resolution will fail.',
'F-55797r1_cis_fix',
'To establish the recommended configuration, set the following Registry value to 0x2 (2) (DWORD):
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters: NodeType : 2
Note: This change does not take effect until the computer has been restarted.
Note #2: Although Microsoft does not provide an ADMX template to configure this registry value, a custom .ADM template (Set-NetBIOS-node-type-KB160177.adm) is provided in the CIS Benchmark Remediation Kit to facilitate its configuration. 
Be aware though that simply turning off the group policy setting in the .ADM template will not undo the change once applied. Instead, the opposite setting must be applied to change the registry value to the opposite state.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000026',
'C-47191r2_cis_chk',
'Navigate to the Registry Path articulated in the Fix Description section and confirm it is set as prescribed.',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.5.4.2 (L1)
select add_rule_data ('default','V-6053','sv-52975r1_cis_rule','default','medium',
'Turn off multicast name resolution',
'LLMNR is a secondary name resolution protocol. With LLMNR, queries are sent using multicast over a local network link on a single subnet from a client computer to another client computer on the same subnet that also has LLMNR enabled. 
LLMNR does not require a DNS server or DNS client configuration, and provides name resolution in scenarios in which conventional DNS name resolution is not possible. The recommended state for this setting is: Enabled.
An attacker can listen on a network for these LLMNR (UDP/5355) or NBT-NS (UDP/137) broadcasts and respond to them, tricking the host into thinking that it knows the location of the requested system.
Note: To completely mitigate local name resolution poisoning, in addition to this setting, the properties of each installed NIC should also be set to Disable NetBIOS over TCP/IP (on the WINS tab in the NIC properties). 
Unfortunately, there is no global setting to achieve this that automatically applies to all NICs - it is a per-NIC setting that varies with different NIC hardware installations.',
'F-55798r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled:
Computer Configuration\Policies\Administrative Templates\Network\DNS Client\Turn off multicast name resolution',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000027',
'C-47192r2_cis_chk',
'Navigate to the UI Path articulated in the Fix Description section and confirm it is set as prescribed.
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient: EnableMulticast : 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.5.14.1 (L1)
select add_rule_data ('default','V-6054','sv-52976r1_cis_rule','default','medium',
'Hardened UNC Paths is set to Enabled, with "Require Mutual Authentication" and "Require Integrity" set for all NETLOGON and SYSVOL shares',
'This policy setting configures secure access to UNC paths. The recommended state for this setting is: Enabled, with "Require Mutual Authentication" and "Require Integrity" set for all NETLOGON and SYSVOL shares.
In February 2015, Microsoft released a new control mechanism to mitigate a security risk in Group Policy as part of the MS15-011 / MSKB 3000483 security update. 
This mechanism requires both the installation of the new security update and also the deployment of specific group policy settings to all computers on the domain from Windows Vista / Server 2008 (non-R2) or newer (the associated security patch to enable this feature was not released for Server 2003). 
A new group policy template (NetworkProvider.admx/adml) was also provided with the security update.',
'F-55799r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled with the following paths configured, at a minimum:
\\*\NETLOGON RequireMutualAuthentication=1, RequireIntegrity=1
\\*\SYSVOL RequireMutualAuthentication=1, RequireIntegrity=1
Computer Configuration\Policies\Administrative Templates\Network\Network Provider\Hardened UNC Paths. 
Note: This Group Policy path does not exist by default. An additional Group Policy template (NetworkProvider.admx/adml) is required - it is included with the MS15-011 / MSKB 3000483 security update or with the Microsoft Windows 10 RTM (Release 1507) Administrative Templates (or newer).
Note: A reboot may be required after the setting is applied to a client machine to access the above paths.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000028',
'C-47193r2_cis_chk',
'Navigate to the UI Path articulated in the Remediation section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry locations:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths: \\*\NETLOGON : RequireMutualAuthentication=1, RequireIntegrity=1
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\NetworkProvider\HardenedPaths: \\*\SYSVOL : RequireMutualAuthentication=1, RequireIntegrity=1',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.8.4.1 (L1)
select add_rule_data ('default','V-6057','sv-52979r1_cis_rule','default','medium',
'Remote host allows delegation of non-exportable credentials',
'When using credential delegation, devices provide an exportable version of credentials to the remote host. This exposes users to the risk of credential theft from attackers on the remote host.
Restricted Admin Mode was designed to help protect administrator accounts by ensuring that reusable credentials are not stored in memory on remote devices that could potentially be compromised. 
Restricted Admin mode addresses the ability for a hacker to access plain-text or any other re-usable form of credentials to the remote PC or Server. The solution will also not allow access to any other network resources from that pc or server through restricted admin mode connection with out re-authenticating.',
'F-55802r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled:
Computer Configuration\Policies\Administrative Templates\System\Credential Delegation\Restrict Delegation of credential to remote servers',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000031',
'C-47196r2_cis_chk',
'Navigate to the UI Path articulated in the Fix description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\Lsa: RestrictedRemoteAdministration : 1',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.8.22.1.2 (L2)
select add_rule_data ('default','V-6059','sv-52981r1_cis_rule','default','medium',
'Turn off handwriting personalization data sharing',
'This setting turns off data sharing from the handwriting recognition personalization tool.
The handwriting recognition personalization tool enables Tablet PC users to adapt handwriting recognition to their own writing style by providing writing samples. The tool
can optionally share user writing samples with Microsoft to improve handwriting recognition in future versions of Windows. The tool generates reports and transmits them to Microsoft over a secure connection.
The recommended state for this setting is: Enabled.',
'F-55804r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled:
Computer Configuration\Policies\Administrative Templates\System\Group Policy\Configure registry policy processing',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000033',
'C-47198r2_cis_chk',
'Navigate to the UI Path articulated in the Fix description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\TabletPC:PreventHandwritingDataSharing : 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.9.60.3 (L2)
select add_rule_data ('default','V-6083','sv-53005r1_cis_rule','default','medium',
'Set what information is shared in Search',
'Various levels of information can be shared with Bing in Search, to include user information and location. Configuring this setting prevents users from selecting the level of information shared and enables the most restrictive selection.
Limiting the search information shared with Microsoft Bing enhances privacy and security.',
'F-55828r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled, then set the Type of Information to Anonymous info:
Computer Configuration\Policies\Administrative Templates\Windows Components\Search\Set what information is shared in Search',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000057',
'C-47222r2_cis_chk',
'Navigate to the UI Path articulated in the Fix description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\Windows Search: ConnectedSearchPrivacy : 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.9.80.1.1 (L1)
select add_rule_data ('default','V-6091','sv-53013r1_cis_rule','default','medium',
'Configure Windows Defender SmartScreen',
'This policy setting allows you to manage the behavior of Windows SmartScreen. Windows SmartScreen helps keep PCs safer by warning users before running unrecognized programs downloaded from the Internet. 
Some information is sent to Microsoft about files and programs run on PCs with this feature enabled.
The recommended state for this setting is: Enabled: Warn and prevent bypass.',
'F-55836r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled:Warn and prevent bypass:
Computer Configuration\Policies\Administrative Templates\Windows Components\Windows Defender SmartScreen\Explorer\Configure Windows Defender SmartScreen
Or 
To establish the recommended configuration via GP, set the following UI path to Enabled and then select Give user a warning before running downloaded unknown software:
Computer Configuration\Policies\Administrative Templates\Windows Components\File Explorer\Configure Windows SmartScreen',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000065',
'C-47230r2_cis_chk',
'Navigate to the UI Path articulated in the FIX Description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry locations:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System:EnableSmartScreen
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System:ShellSmartScreenLevel
Or
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System: EnableSmartScreen : 1',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.9.97.2.2 (L2)
select add_rule_data ('default','V-6094','sv-53016r1_cis_rule','default','medium',
'Allow remote server management through WinRM is set to Disabled',
'This policy setting allows you to manage whether the Windows Remote Management (WinRM) service automatically listens on the network for requests on the HTTP transport over the default HTTP port.
The recommended state for this setting is: Disabled.
If this policy is set to Disable, then CloudRaxak will not be able communicate via WinRM with Windows Server.',
'F-55839r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Disabled:
Computer Configuration\Administrative Templates\Windows Components\Windows Remote Management (WinRM)\WinRM Service\Allow remote server management through WinRM
Note: This Group Policy path is provided by the Group Policy template WindowsRemoteManagement.admx/adml that is included with all versions of the Microsoft Windows Administrative Templates.
Note #2: In older Microsoft Windows Administrative Templates, this setting was initially named Allow automatic configuration of listeners, but it was renamed starting with the Windows 8.0 and Server 2012 (non-R2) Administrative Templates.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000068',
'C-47233r2_cis_chk',
'Navigate to the UI Path articulated in the FIX Description section and confirm it is set as prescribed. 
This group policy object is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service: AllowAutoConfig : 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.9.98.1 (L2)
select add_rule_data ('default','V-6095','sv-53017r1_cis_rule','default','medium',
'Allow Remote Shell Access is set to Disabled',
'This policy setting allows you to manage configuration of remote access to all supported shells to execute scripts and commands.
The recommended state for this setting is: Disabled.
Note: The GPME help text for this setting is incorrectly worded, implying that configuring it to Enabled will reject new Remote Shell connections, and setting it to Disabled will allow Remote Shell connections. 
The opposite is true (and is consistent with the title of the setting). This is a wording mistake by Microsoft in the Administrative Template.
If this policy is set to Disable, then CloudRaxak will not be able communicate via WinRM with Windows Server.',
'F-55840r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Disabled:
Computer Configuration\Administrative Templates\Windows Components\Windows Remote Shell\Allow Remote Shell Access
Note: This Group Policy path is provided by the Group Policy template WindowsRemoteShell.admx/adml that is included with all versions of the Microsoft Windows Administrative Templates.
Note: On Server 2012 (non-R2) and newer, due to design changes in the OS after Server 2008 R2, configuring this setting as prescribed will prevent the ability to add or remove Roles and Features (even locally) via the GUI. 
We therefore recommend that the necessary Roles and Features be installed prior to configuring this setting on a Level 2 server.
Alternatively, Roles and Features can still be added or removed using the PowerShell commands Add-WindowsFeature or Remove-WindowsFeature in the Server Manager module, even with this setting configured.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000069',
'C-47234r2_cis_chk',
'Navigate to the UI Path articulated in the FIX Description section and confirm it is set as prescribed. 
This group policy object is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\WinRS: AllowRemoteShellAccess : 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.9.101.2 (L1)
select add_rule_data ('default','V-6096','sv-53018r1_cis_rule','default','medium',
'Configure Automatic Updates',
'This policy setting specifies whether computers in your environment will receive security updates from Windows Update or WSUS. 
If you configure this policy setting to Enabled, the operating system will recognize when a network connection is available and then use the network connection to search Windows Update or your designated intranet site for updates that apply to them.
After you configure this policy setting to Enabled, select one of the following three options in the Configure Automatic Updates Properties dialog box to specify how the service will work:
2 - Notify for download and auto install (Notify before downloading any updates)
3 - Auto download and notify for install (Download the updates automatically and notify when they are ready to be installed.) (Default setting)
4 - Auto download and schedule the install (Automatically download updates and install them on the schedule specified below.))
5 - Allow local admin to choose setting (Leave decision on above choices up to the local Administrators (Not Recommended))
The recommended state for this setting is: Enabled.
Note: The sub-setting "Configure automatic updating:" has 4 possible values – all of them are valid depending on specific organizational needs, however if feasible we suggest using a value of 4 - Auto download and schedule the install. This suggestion is not a scored requirement.
Note #2: Organizations that utilize a 3rd-party solution for patching may choose to exempt themselves from this setting, and instead configure it to Disabled so that the native Windows Update mechanism does not interfere with the 3rd-party patching process.',
'F-55841r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Enabled:
Computer Configuration\Policies\Administrative Templates\Windows Components\Windows Update\Configure Automatic Updates
Note: This Group Policy path is provided by the Group Policy template WindowsUpdate.admx/adml that is included with all versions of the Microsoft Windows Administrative Templates',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000070',
'C-47235r2_cis_chk',
'Navigate to the UI Path articulated in the FIX Description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU: AUOptions : 2 or 3 or 4',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.9.101.3 (L1)
select add_rule_data ('default','V-6097','sv-53019r1_cis_rule','default','medium',
'Configure Automatic Updates: Scheduled install day is set to 0 - Every day',
'This policy setting specifies when computers in your environment will receive security
updates from Windows Update or WSUS.
The recommended state for this setting is: 0 - Every day.
Note: This setting is only applicable if 4 - Auto download and schedule the install is selected in Rule 18.9.101.2. It will have no impact if any other option is selected.
Although each version of Windows is thoroughly tested before release, it is possible that problems will be discovered after the products are shipped. 
The Configure Automatic Updates setting can help you ensure that the computers in your environment will always have the most recent critical operating system updates and service packs installed.',
'F-55842r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to 0 - Every day:
Computer Configuration\Policies\Administrative Templates\Windows Components\Windows Update\Configure Automatic Updates: Scheduled install day
Note: This Group Policy path is provided by the Group Policy template WindowsUpdate.admx/adml that is included with all versions of the Microsoft Windows Administrative Templates.
If 4 - Auto download and schedule the install is selected in Rule 18.9.101.2, critical operating system updates and service packs will automatically download every day (at 3:00 A.M., by default).',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000071',
'C-47236r2_cis_chk',
'Navigate to the UI Path articulated in the FIX Description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU: ScheduledInstallDay : 0',
'Customized rule by Cloud Raxak') from dual;

--CIS 18.9.101.4 (L1)
select add_rule_data ('default','V-6098','sv-53020r1_cis_rule','default','medium',
'No auto-restart with logged on users for scheduled automatic updates installations',
'This policy setting specifies that Automatic Updates will wait for computers to be restarted by the users who are logged on to them to complete a scheduled installation.
The recommended state for this setting is: Disabled.
Note: This setting applies only when you configure Automatic Updates to perform scheduled update installations. If you configure the Configure Automatic Updates setting to Disabled, this setting has no effect.',
'F-55843r1_cis_fix',
'To establish the recommended configuration via GP, set the following UI path to Disabled:
Computer Configuration\Policies\Administrative Templates\Windows Components\Windows Update\No auto-restart with logged on users for scheduled automatic updates installations
Note: This Group Policy path is provided by the Group Policy template WindowsUpdate.admx/adml that is included with all versions of the Microsoft Windows Administrative Templates.
Note #2: In older Microsoft Windows Administrative Templates, this setting was initially named No auto-restart for scheduled Automatic Updates installations, but it was renamed starting with the Windows 7 and Server 2008 R2 Administrative Templates.',
'CIS Microsoft Windows Server 2012 R2','Profile Customized by CloudRaxak','WN12-CIS-000072',
'C-47237r2_cis_chk',
'Navigate to the UI Path articulated in the FIX Description section and confirm it is set as prescribed. 
This group policy setting is backed by the following registry location:
HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU: NoAutoRebootWithLoggedOnUsers : 0',
'Customized rule by Cloud Raxak') from dual;