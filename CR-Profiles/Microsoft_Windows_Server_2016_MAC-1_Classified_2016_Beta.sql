select add_profile_data ('Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)' ,'Profile Customized by CloudRaxak' ,'Windows-based OS','' ,'2017-07-28' ,'Profile by Cloud Raxak') from dual;

select add_rule_data ('default','V-73315','SV-87967r1_rule','default','medium','The password history must be configured to 24 passwords remembered.',
'A system is more vulnerable to unauthorized access when system users recycle the same password several times without being required to change to a unique password on a regularly scheduled basis. This enables users to effectively negate the purpose of mandating periodic password changes. The default value is "24" for Windows domain systems. DoD has decided this is the appropriate value for all Windows systems.',
'F-79757r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy >> "Enforce password history" to "24" passwords remembered.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000040',  
'C-73419r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy.

If the value for "Enforce password history" is less than "24" passwords remembered, this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73317','SV-87969r1_rule','default','medium','The maximum password age must be configured to 60 days or less.',
'The longer a password is in use, the greater the opportunity for someone to gain unauthorized knowledge of the passwords. Scheduled changing of passwords hinders the ability of unauthorized system users to crack passwords and gain access to a system.',
'F-79759r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy >> "Maximum password age" to "60" days or less (excluding "0", which is unacceptable).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000050',  
'C-73421r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy.

If the value for the "Maximum password age" is greater than "60" days, this is a finding.

If the value is set to "0" (never expires), this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73319','SV-87971r1_rule','default','medium','The minimum password age must be configured to at least one day.',
'Permitting passwords to be changed in immediate succession within the same day allows users to cycle passwords through their history database. This enables users to effectively negate the purpose of mandating periodic password changes.',
'F-79761r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy >> "Minimum password age" to at least "1" day.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000060',  
'C-73423r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy.

If the value for the "Minimum password age" is set to "0" days ("Password can be changed immediately"), this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73321','SV-87973r1_rule','default','medium','The minimum password length must be configured to 14 characters.',
'Information systems not protected with strong password schemes (including passwords of minimum length) provide the opportunity for anyone to crack the password, thus gaining access to the system and compromising the device, information, or the local network.',
'F-79763r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy >> "Minimum password length" to "14" characters.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000070',  
'C-73425r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy.

If the value for the "Minimum password length," is less than "14" characters, this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73323','SV-87975r1_rule','default','medium','The built-in Windows password complexity policy must be enabled.',
'The use of complex passwords increases their strength against attack. The built-in Windows password complexity policy requires passwords to contain at least three of the four types of characters (numbers, upper- and lower-case letters, and special characters) and prevents the inclusion of user names or parts of user names.

Satisfies: SRG-OS-000069-GPOS-00037, SRG-OS-000070-GPOS-00038, SRG-OS-000071-GPOS-00039, SRG-OS-000266-GPOS-00101',
'F-79765r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy >> "Password must meet complexity requirements" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000080',  
'C-73427r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy.

If the value for "Password must meet complexity requirements" is not set to "Enabled", this is a finding.

Note: If an external password filter is in use that enforces all four character types and requires this setting to be set to "Disabled", this would not be considered a finding. If this setting does not affect the use of an external password filter, it must be enabled for fallback purposes.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73325','SV-87977r1_rule','default','high','Reversible password encryption must be disabled.',
'Storing passwords using reversible encryption is essentially the same as storing clear-text versions of the passwords, which are easily compromised. For this reason, this policy must never be enabled.',
'F-79767r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy >> "Store passwords using reversible encryption" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000090',  
'C-73429r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Password Policy.

If the value for "Store passwords using reversible encryption" is not set to "Disabled", this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73413','SV-88065r1_rule','default','medium','Windows Server 2016 must be configured to audit Account Logon - Credential Validation successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential Validation records events related to validation tests on credentials for a user account logon.',
'F-79855r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Account Logon >> "Audit Credential Validation" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000070',  
'C-73487r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Account Logon >> Credential Validation - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73415','SV-88067r1_rule','default','medium','Windows Server 2016 must be configured to audit Account Logon - Credential Validation failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Credential Validation records events related to validation tests on credentials for a user account logon.',
'F-79857r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Account Logon >> "Audit Credential Validation" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000080',  
'C-73489r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Account Logon >> Credential Validation - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73419','SV-88071r1_rule','default','medium','Windows Server 2016 must be configured to audit Account Management - Other Account Management Events successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Other Account Management Events records events such as the access of a password hash or the Password Policy Checking API being called.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000064-GPOS-00033, SRG-OS-000462-GPOS-00206, SRG-OS-000466-GPOS-00210',
'F-79861r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Account Management >> "Audit Other Account Management Events" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000100',  
'C-73493r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Account Management >> Other Account Management Events - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73421','SV-88073r1_rule','default','medium','Windows Server 2016 must be configured to audit Account Management - Other Account Management Events failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Other Account Management Events records events such as the access of a password hash or the Password Policy Checking API being called.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000064-GPOS-00033, SRG-OS-000462-GPOS-00206, SRG-OS-000466-GPOS-00210',
'F-79863r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Account Management >> "Audit Other Account Management Events" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000110',  
'C-73495r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Account Management >> Other Account Management Events - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73423','SV-88075r1_rule','default','medium','Windows Server 2016 must be configured to audit Account Management - Security Group Management successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security Group Management records events such as creating, deleting, or changing security groups, including changes in group members.

Satisfies: SRG-OS-000004-GPOS-00004, SRG-OS-000239-GPOS-00089, SRG-OS-000240-GPOS-00090, SRG-OS-000241-GPOS-00091, SRG-OS-000303-GPOS-00120, SRG-OS-000476-GPOS-00221',
'F-79865r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Account Management >> "Audit Security Group Management" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000120',  
'C-73497r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Account Management >> Security Group Management - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73425','SV-88077r1_rule','default','medium','Windows Server 2016 must be configured to audit Account Management - Security Group Management failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security Group Management records events such as creating, deleting, or changing security groups, including changes in group members.

Satisfies: SRG-OS-000004-GPOS-00004, SRG-OS-000239-GPOS-00089, SRG-OS-000240-GPOS-00090, SRG-OS-000241-GPOS-00091, SRG-OS-000303-GPOS-00120, SRG-OS-000476-GPOS-00221',
'F-79867r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Account Management >> "Audit Security Group Management" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000130',  
'C-73499r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Account Management >> Security Group Management - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73427','SV-88079r1_rule','default','medium','Windows Server 2016 must be configured to audit Account Management - User Account Management successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.

Satisfies: SRG-OS-000004-GPOS-00004, SRG-OS-000239-GPOS-00089, SRG-OS-000240-GPOS-00090, SRG-OS-000241-GPOS-00091, SRG-OS-000303-GPOS-00120, SRG-OS-000476-GPOS-00221',
'F-79869r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Account Management >> "Audit User Account Management" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000140',  
'C-73501r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Account Management >> User Account Management - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73429','SV-88081r1_rule','default','medium','Windows Server 2016 must be configured to audit Account Management - User Account Management failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

User Account Management records events such as creating, changing, deleting, renaming, disabling, or enabling user accounts.

Satisfies: SRG-OS-000004-GPOS-00004, SRG-OS-000239-GPOS-00089, SRG-OS-000240-GPOS-00090, SRG-OS-000241-GPOS-00091, SRG-OS-000303-GPOS-00120, SRG-OS-000476-GPOS-00221',
'F-79871r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Account Management >> "Audit User Account Management" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000150',  
'C-73503r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Account Management >> User Account Management - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73449','SV-88101r1_rule','default','medium','Windows Server 2016 must be configured to audit Logon/Logoff - Logoff successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logoff records user logoffs. If this is an interactive logoff, it is recorded on the local system. If it is to a network share, it is recorded on the system accessed.

Satisfies: SRG-OS-000032-GPOS-00013, SRG-OS-000470-GPOS-00214, SRG-OS-000472-GPOS-00217, SRG-OS-000473-GPOS-00218, SRG-OS-000475-GPOS-00220',
'F-79891r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Logon/Logoff >> "Audit Logoff" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000250',  
'C-73523r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Logon/Logoff >> Logoff - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73451','SV-88103r1_rule','default','medium','Windows Server 2016 must be configured to audit Logon/Logoff - Logon successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logon records user logons. If this is an interactive logon, it is recorded on the local system. If it is to a network share, it is recorded on the system accessed.

Satisfies: SRG-OS-000032-GPOS-00013, SRG-OS-000470-GPOS-00214, SRG-OS-000472-GPOS-00217, SRG-OS-000473-GPOS-00218, SRG-OS-000475-GPOS-00220',
'F-79893r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Logon/Logoff >> "Audit Logon" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000260',  
'C-73525r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Logon/Logoff >> Logon - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73453','SV-88105r1_rule','default','medium','Windows Server 2016 must be configured to audit Logon/Logoff - Logon failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Logon records user logons. If this is an interactive logon, it is recorded on the local system. If it is to a network share, it is recorded on the system accessed.

Satisfies: SRG-OS-000032-GPOS-00013, SRG-OS-000470-GPOS-00214, SRG-OS-000472-GPOS-00217, SRG-OS-000473-GPOS-00218, SRG-OS-000475-GPOS-00220',
'F-79895r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Logon/Logoff >> "Audit Logon" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000270',  
'C-73527r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Logon/Logoff >> Logon - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73455','SV-88107r1_rule','default','medium','Windows Server 2016 must be configured to audit Logon/Logoff - Special Logon successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Special Logon records special logons that have administrative privileges and can be used to elevate processes.

Satisfies: SRG-OS-000470-GPOS-00214, SRG-OS-000472-GPOS-00217, SRG-OS-000473-GPOS-00218, SRG-OS-000475-GPOS-00220',
'F-79897r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Logon/Logoff >> "Audit Special Logon" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000280',  
'C-73529r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Logon/Logoff >> Special Logon - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73461','SV-88113r1_rule','default','medium','Windows Server 2016 must be configured to audit Policy Change - Audit Policy Change successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79903r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Policy Change >> "Audit Audit Policy Change" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000310',  
'C-73535r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Policy Change >> Audit Policy Change - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73463','SV-88115r1_rule','default','medium','Windows Server 2016 must be configured to audit Policy Change - Audit Policy Change failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Policy Change records events related to changes in audit policy.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79905r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Policy Change >> "Audit Audit Policy Change" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000320',  
'C-73537r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Policy Change >> Audit Policy Change - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73465','SV-88117r1_rule','default','medium','Windows Server 2016 must be configured to audit Policy Change - Authentication Policy Change successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Authentication Policy Change records events related to changes in authentication policy, including Kerberos policy and Trust changes.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000064-GPOS-00033, SRG-OS-000462-GPOS-00206, SRG-OS-000466-GPOS-00210',
'F-79907r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Policy Change >> "Audit Authentication Policy Change" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000330',  
'C-73539r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Policy Change >> Authentication Policy Change - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73469','SV-88121r1_rule','default','medium','Windows Server 2016 must be configured to audit Privilege Use - Sensitive Privilege Use successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Sensitive Privilege Use records events related to use of sensitive privileges, such as "Act as part of the operating system" or "Debug programs".

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000064-GPOS-00033, SRG-OS-000462-GPOS-00206, SRG-OS-000466-GPOS-00210',
'F-79911r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Privilege Use >> "Audit Sensitive Privilege Use" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000350',  
'C-73543r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Privilege Use >> Sensitive Privilege Use - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73471','SV-88123r1_rule','default','medium','Windows Server 2016 must be configured to audit Privilege Use - Sensitive Privilege Use failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Sensitive Privilege Use records events related to use of sensitive privileges, such as "Act as part of the operating system" or "Debug programs".

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000064-GPOS-00033, SRG-OS-000462-GPOS-00206, SRG-OS-000466-GPOS-00210',
'F-79913r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Privilege Use >> "Audit Sensitive Privilege Use" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000360',  
'C-73545r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Privilege Use >> Sensitive Privilege Use - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73473','SV-88125r1_rule','default','medium','Windows Server 2016 must be configured to audit System - IPsec Driver successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

IPsec Driver records events related to the IPsec Driver, such as dropped packets.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79915r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit IPsec Driver" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000370',  
'C-73547r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

System >> IPsec Driver - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73475','SV-88127r1_rule','default','medium','Windows Server 2016 must be configured to audit System - IPsec Driver failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

IPsec Driver records events related to the IPsec Driver, such as dropped packets.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79917r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit IPsec Driver" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000380',  
'C-73549r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

System >> IPsec Driver - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73481','SV-88133r1_rule','default','medium','Windows Server 2016 must be configured to audit System - Security State Change successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security State Change records events related to changes in the security state, such as startup and shutdown of the system.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79923r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit Security State Change" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000410',  
'C-73555r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

System >> Security State Change - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73483','SV-88135r1_rule','default','medium','Windows Server 2016 must be configured to audit System - Security System Extension successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security System Extension records events related to extension code being loaded by the security subsystem.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79925r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit Security System Extension" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000420',  
'C-73557r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

System >> Security System Extension - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73485','SV-88137r1_rule','default','medium','Windows Server 2016 must be configured to audit System - Security System Extension failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Security System Extension records events related to extension code being loaded by the security subsystem.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79927r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit Security System Extension" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000430',  
'C-73559r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

System >> Security System Extension - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73489','SV-88141r1_rule','default','medium','Windows Server 2016 must be configured to audit System - System Integrity successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

System Integrity records events related to violations of integrity to the security subsystem.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000471-GPOS-00215, SRG-OS-000471-GPOS-00216, SRG-OS-000477-GPOS-00222',
'F-79931r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit System Integrity" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000440',  
'C-73563r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

System >> System Integrity - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73491','SV-88143r1_rule','default','medium','Windows Server 2016 must be configured to audit System - System Integrity failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

System Integrity records events related to violations of integrity to the security subsystem.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000471-GPOS-00215, SRG-OS-000471-GPOS-00216, SRG-OS-000477-GPOS-00222',
'F-79933r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit System Integrity" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000450',  
'C-73565r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

System >> System Integrity - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73499','SV-88151r1_rule','default','low','Internet Protocol version 6 (IPv6) source routing must be configured to the highest protection level to prevent IP source routing.',
'Configuring the system to disable IPv6 source routing protects against spoofing.',
'F-79941r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> MSS (Legacy) >> "MSS: (DisableIPSourceRouting IPv6) IP source routing protection level (protects against packet spoofing)" to "Enabled" with "Highest protection, source routing is completely disabled" selected.

This policy setting requires the installation of the MSS-Legacy custom templates included with the STIG package. "MSS-Legacy.admx" and "MSS-Legacy.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000040',  
'C-73573r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Services\Tcpip6\Parameters\

Value Name: DisableIPSourceRouting

Type: REG_DWORD
Value: 0x00000002 (2)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73501','SV-88153r1_rule','default','low','Source routing must be configured to the highest protection level to prevent Internet Protocol (IP) source routing.',
'Configuring the system to disable IP source routing protects against spoofing.',
'F-79943r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> MSS (Legacy) >> "MSS: (DisableIPSourceRouting) IP source routing protection level (protects against packet spoofing)" to "Enabled" with "Highest protection, source routing is completely disabled" selected.

This policy setting requires the installation of the MSS-Legacy custom templates included with the STIG package. "MSS-Legacy.admx" and "MSS-Legacy.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000050',  
'C-73575r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: DisableIPSourceRouting

Value Type: REG_DWORD
Value: 0x00000002 (2)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73503','SV-88155r1_rule','default','low','Windows Server 2016 must be configured to prevent Internet Control Message Protocol (ICMP) redirects from overriding Open Shortest Path First (OSPF)-generated routes.',
'Allowing ICMP redirect of routes can lead to traffic not being routed properly. When disabled, this forces ICMP to be routed via the shortest path first.',
'F-79945r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> MSS (Legacy) >> "MSS: (EnableICMPRedirect) Allow ICMP redirects to override OSPF generated routes" to "Disabled".

This policy setting requires the installation of the MSS-Legacy custom templates included with the STIG package. "MSS-Legacy.admx" and "MSS-Legacy.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000060',  
'C-73577r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\Tcpip\Parameters\

Value Name: EnableICMPRedirect

Value Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73505','SV-88157r1_rule','default','low','Windows Server 2016 must be configured to ignore NetBIOS name release requests except from WINS servers.',
'Configuring the system to ignore name release requests, except from WINS servers, prevents a denial of service (DoS) attack. The DoS consists of sending a NetBIOS name release request to the server for each entry in the servers cache, causing a response delay in the normal operation of the servers WINS resolution capability.',
'F-79947r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> MSS (Legacy) >> "MSS: (NoNameReleaseOnDemand) Allow the computer to ignore NetBIOS name release requests except from WINS servers" to "Enabled".

This policy setting requires the installation of the MSS-Legacy custom templates included with the STIG package. "MSS-Legacy.admx" and "MSS-Legacy.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000070',  
'C-73579r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SYSTEM\CurrentControlSet\Services\Netbt\Parameters\

Value Name:  NoNameReleaseOnDemand

Value Type:  REG_DWORD
Value:  0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73525','SV-88177r1_rule','default','medium','Group Policy objects must be reprocessed even if they have not changed.',
'Registry entries for group policy settings can potentially be changed from the required configuration. This could occur as part of troubleshooting or by a malicious process on a compromised system. Enabling this setting and then selecting the "Process even if the Group Policy objects have not changed" option ensures the policies will be reprocessed even if none have been changed. This way, any unauthorized changes are forced to match the domain-based group policy settings again.',
'F-79965r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Group Policy >> "Configure registry policy processing" to "Enabled" with the option "Process even if the Group Policy objects have not changed" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000150',  
'C-73597r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\

Value Name: NoGPOListChanges

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73527','SV-88179r1_rule','default','medium','Downloading print driver packages over HTTP must be prevented.',
'Some features may communicate with the vendor, sending system information or downloading data or components for the feature. Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and will prevent uncontrolled updates to the system. 

This setting prevents the computer from downloading print driver packages over HTTP.',
'F-79969r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Internet Communication Management >> Internet Communication settings >> "Turn off downloading of print drivers over HTTP" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000160',  
'C-73601r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\Printers\

Value Name: DisableWebPnPDownload

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73529','SV-88181r1_rule','default','medium','Printing over HTTP must be prevented.',
'Some features may communicate with the vendor, sending system information or downloading data or components for the feature. Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and will prevent uncontrolled updates to the system.

This setting prevents the client computer from printing over HTTP, which allows the computer to print to printers on the intranet as well as the Internet.',
'F-79971r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Internet Communication Management >> Internet Communication settings >> "Turn off printing over HTTP" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000170',  
'C-73603r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\Printers\

Value Name: DisableHTTPPrinting

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73537','SV-88197r1_rule','default','medium','Users must be prompted to authenticate when the system wakes from sleep (on battery).',
'A system that does not require authentication when resuming from sleep may provide access to unauthorized users. Authentication must always be required when accessing a system. This setting ensures users are prompted for a password when the system wakes from sleep (on battery).',
'F-79979r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Power Management >> Sleep Settings >> "Require a password when a computer wakes (on battery)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000210',  
'C-73611r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\

Value Name: DCSettingIndex

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73539','SV-88201r1_rule','default','medium','Users must be prompted to authenticate when the system wakes from sleep (plugged in).',
'A system that does not require authentication when resuming from sleep may provide access to unauthorized users. Authentication must always be required when accessing a system. This setting ensures users are prompted for a password when the system wakes from sleep (plugged in).',
'F-79981r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Power Management >> Sleep Settings >> "Require a password when a computer wakes (plugged in)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000220',  
'C-73613r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Power\PowerSettings\0e796bdb-100d-47d6-a2d5-f7d2daa51f51\

Value Name: ACSettingIndex

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','V-73543','SV-88207r1_rule','default','low','The Application Compatibility Program Inventory must be prevented from collecting data and sending the information to Microsoft.',
'Some features may communicate with the vendor, sending system information or downloading data or components for the feature. Turning off this capability will prevent potentially sensitive information from being sent outside the enterprise and will prevent uncontrolled updates to the system.

This setting will prevent the Program Inventory from collecting data about a system and sending the information to Microsoft.',
'F-79985r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Application Compatibility >> "Turn off Inventory Collector" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000240',  
'C-73617r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\AppCompat\

Value Name: DisableInventory

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73545','SV-88209r1_rule','default','high','AutoPlay must be turned off for non-volume devices.',
'Allowing AutoPlay to execute may introduce malicious code to a system. AutoPlay begins reading from a drive as soon as media is inserted into the drive. As a result, the setup file of programs or music on audio media may start. This setting will disable AutoPlay for non-volume devices, such as Media Transfer Protocol (MTP) devices.',
'F-79991r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> AutoPlay Policies >> "Disallow Autoplay for non-volume devices" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000250',  
'C-73623r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Explorer\

Value Name: NoAutoplayfornonVolume

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73547','SV-88211r1_rule','default','high','The default AutoRun behavior must be configured to prevent AutoRun commands.',
'Allowing AutoRun commands to execute may introduce malicious code to a system. Configuring this setting prevents AutoRun commands from executing.',
'F-79997r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> AutoPlay Policies >> "Set the default behavior for AutoRun" to "Enabled" with "Do not execute any autorun commands" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000260',  
'C-73629r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\

Value Name: NoAutorun

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73549','SV-88213r1_rule','default','high','AutoPlay must be disabled for all drives.',
'Allowing AutoPlay to execute may introduce malicious code to a system. AutoPlay begins reading from a drive as soon media is inserted into the drive. As a result, the setup file of programs or music on audio media may start. By default, AutoPlay is disabled on removable drives, such as the floppy disk drive (but not the CD-ROM drive) and on network drives. Enabling this policy disables AutoPlay on all drives.',
'F-79999r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> AutoPlay Policies >> "Turn off AutoPlay" to "Enabled" with "All Drives" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000270',  
'C-73631r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer\

Value Name: NoDriveTypeAutoRun

Type: REG_DWORD
Value: 0x000000ff (255)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73487','SV-88139r1_rule','default','medium','Administrator accounts must not be enumerated during elevation.',
'Enumeration of administrator accounts when elevating can provide part of the logon information to an unauthorized user. This setting configures the system to always require users to type in a username and password to elevate a running application.',
'F-79929r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Credential User Interface >> "Enumerate administrator accounts on elevation" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000280',  
'C-73561r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\CredUI\

Value Name: EnumerateAdministrators

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73553','SV-88217r1_rule','default','medium','The Application event log size must be configured to 32768 KB or greater.',
'Inadequate log size will cause the log to fill up quickly. This may prevent audit events from being recorded properly and require frequent attention by administrative personnel.',
'F-80003r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Event Log Service >> Application >> "Specify the maximum log file size (KB)" to "Enabled" with a "Maximum Log Size (KB)" of "32768" or greater.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000300',  
'C-73635r1_chk',
'If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\EventLog\Application\

Value Name: MaxSize

Type: REG_DWORD
Value: 0x00008000 (32768) (or greater)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73555','SV-88219r1_rule','default','medium','The Security event log size must be configured to 196608 KB or greater.',
'Inadequate log size will cause the log to fill up quickly. This may prevent audit events from being recorded properly and require frequent attention by administrative personnel.',
'F-80005r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Event Log Service >> Security >> "Specify the maximum log file size (KB)" to "Enabled" with a "Maximum Log Size (KB)" of "196608" or greater.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000310',  
'C-73637r1_chk',
'If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\EventLog\Security\

Value Name: MaxSize

Type: REG_DWORD
Value: 0x00030000 (196608) (or greater)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73557','SV-88221r1_rule','default','medium','The System event log size must be configured to 32768 KB or greater.',
'Inadequate log size will cause the log to fill up quickly. This may prevent audit events from being recorded properly and require frequent attention by administrative personnel.',
'F-80007r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Event Log Service >> System >> "Specify the maximum log file size (KB)" to "Enabled" with a "Maximum Log Size (KB)" of "32768" or greater.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000320',  
'C-73639r1_chk',
'If the system is configured to write events directly to an audit server, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\EventLog\System\

Value Name: MaxSize

Type: REG_DWORD
Value: 0x00008000 (32768) (or greater)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73561','SV-88225r1_rule','default','medium','Explorer Data Execution Prevention must be enabled.',
'Data Execution Prevention provides additional protection by performing checks on memory to help prevent malicious code from running. This setting will prevent Data Execution Prevention from being turned off for File Explorer.',
'F-80011r1_fix',
'The default behavior is for data execution prevention to be turned on for File Explorer.

If this needs to be corrected, configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> File Explorer >> "Turn off Data Execution Prevention for Explorer" to "Not Configured" or "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000340',  
'C-73643r1_chk',
'The default behavior is for Data Execution Prevention to be turned on for File Explorer.

If the registry value name below does not exist, this is not a finding.

If it exists and is configured with a value of "0", this is not a finding.

If it exists and is configured with a value of "1", this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Explorer\

Value Name: NoDataExecutionPrevention

Value Type: REG_DWORD
Value: 0x00000000 (0) (or if the Value Name does not exist)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73563','SV-88227r1_rule','default','low','Turning off File Explorer heap termination on corruption must be disabled.',
'Legacy plug-in applications may continue to function when a File Explorer session has become corrupt. Disabling this feature will prevent this.',
'F-80013r1_fix',
'The default behavior is for File Explorer heap termination on corruption to be disabled.

If this needs to be corrected, configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> File Explorer >> "Turn off heap termination on corruption" to "Not Configured" or "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000350',  
'C-73645r1_chk',
'The default behavior is for File Explorer heap termination on corruption to be enabled.

If the registry Value Name below does not exist, this is not a finding.

If it exists and is configured with a value of "0", this is not a finding.

If it exists and is configured with a value of "1", this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Explorer\

Value Name: NoHeapTerminationOnCorruption

Value Type: REG_DWORD
Value: 0x00000000 (0) (or if the Value Name does not exist)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73565','SV-88229r1_rule','default','medium','File Explorer shell protocol must run in protected mode.',
'The shell protocol will limit the set of folders that applications can open when run in protected mode. Restricting files an application can open to a limited set of folders increases the security of Windows.',
'F-80015r1_fix',
'The default behavior is for shell protected mode to be turned on for File Explorer.

If this needs to be corrected, configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> File Explorer >> "Turn off shell protocol protected mode" to "Not Configured" or "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000360',  
'C-73647r1_chk',
'The default behavior is for shell protected mode to be turned on for File Explorer.

If the registry value name below does not exist, this is not a finding.

If it exists and is configured with a value of "0", this is not a finding.

If it exists and is configured with a value of "1", this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer\

Value Name: PreXPSP2ShellProtocolBehavior

Value Type: REG_DWORD
Value: 0x00000000 (0) (or if the Value Name does not exist)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73567','SV-88231r1_rule','default','medium','Passwords must not be saved in the Remote Desktop Client.',
'Saving passwords in the Remote Desktop Client could allow an unauthorized user to establish a remote desktop session to another system. The system must be configured to prevent users from saving passwords in the Remote Desktop Client.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156',
'F-80017r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Remote Desktop Services >> Remote Desktop Connection Client >> "Do not allow passwords to be saved" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000370',  
'C-73649r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: DisablePasswordSaving

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73569','SV-88233r1_rule','default','medium','Local drives must be prevented from sharing with Remote Desktop Session Hosts.',
'Preventing users from sharing the local drives on their client computers with Remote Session Hosts that they access helps reduce possible exposure of sensitive data.',
'F-80019r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Remote Desktop Services >> Remote Desktop Session Host >> Device and Resource Redirection >> "Do not allow drive redirection" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000380',  
'C-73651r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fDisableCdm

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','V-73571','SV-88235r1_rule','default','medium','Remote Desktop Services must always prompt a client for passwords upon connection.',
'This setting controls the ability of users to supply passwords automatically as part of their remote desktop connection. Disabling this setting would allow anyone to use the stored credentials in a connection item to connect to the terminal server.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156',
'F-80021r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Remote Desktop Services >> Remote Desktop Session Host >> Security >> "Always prompt for password upon connection" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000390',  
'C-73653r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fPromptForPassword

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73573','SV-88237r1_rule','default','medium','The Remote Desktop Session Host must require secure Remote Procedure Call (RPC) communications.',
'Allowing unsecure RPC communication exposes the system to man-in-the-middle attacks and data disclosure attacks. A man-in-the-middle attack occurs when an intruder captures packets between a client and server and modifies them before allowing the packets to be exchanged. Usually the attacker will modify the information in the packets in an attempt to cause either the client or server to reveal sensitive information.',
'F-80023r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Remote Desktop Services >> Remote Desktop Session Host >> Security >> "Require secure RPC communication" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000400',  
'C-73655r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: fEncryptRPCTraffic

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73575','SV-88239r1_rule','default','medium','Remote Desktop Services must be configured with the client connection encryption set to High Level.',
'Remote connections must be encrypted to prevent interception of data or sensitive information. Selecting "High Level" will ensure encryption of Remote Desktop Services sessions in both directions.',
'F-80025r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Remote Desktop Services >> Remote Desktop Session Host >> Security >> "Set client connection encryption level" to "Enabled" with "High Level" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000410',  
'C-73657r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\Terminal Services\

Value Name: MinEncryptionLevel

Type: REG_DWORD
Value: 0x00000003 (3)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73577','SV-88241r1_rule','default','medium','Attachments must be prevented from being downloaded from RSS feeds.',
'Attachments from RSS feeds may not be secure. This setting will prevent attachments from being downloaded from RSS feeds.',
'F-80027r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> RSS Feeds >> "Prevent downloading of enclosures" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000420',  
'C-73659r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds\

Value Name: DisableEnclosureDownload

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73579','SV-88243r1_rule','default','medium','Basic authentication for RSS feeds over HTTP must not be used.',
'Basic authentication uses plain-text passwords that could be used to compromise a system. Disabling Basic authentication will reduce this potential.',
'F-80029r1_fix',
'The default behavior is for the Windows RSS platform to not use Basic authentication over HTTP connections.

If this needs to be corrected, configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> RSS Feeds >> "Turn on Basic feed authentication over HTTP" to "Not Configured" or "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000430',  
'C-73661r1_chk',
'The default behavior is for the Windows RSS platform to not use Basic authentication over HTTP connections.

If the registry value name below does not exist, this is not a finding.

If it exists and is configured with a value of "0", this is not a finding.

If it exists and is configured with a value of "1", this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Internet Explorer\Feeds\

Value Name: AllowBasicAuthInClear

Value Type: REG_DWORD
Value: 0x00000000 (0) (or if the Value Name does not exist)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73583','SV-88247r1_rule','default','medium','Users must be prevented from changing installation options.',
'Installation options for applications are typically controlled by administrators. This setting prevents users from changing installation options that may bypass security features.',
'F-80033r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Installer >> "Allow user control over installs" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000450',  
'C-73665r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Installer\

Value Name: EnableUserControl

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73585','SV-88249r1_rule','default','high','The Windows Installer Always install with elevated privileges option must be disabled.',
'Standard user accounts must not be granted elevated privileges. Enabling Windows Installer to elevate privileges when installing applications can allow malicious persons and applications to gain full control of a system.',
'F-80035r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Installer >> "Always install with elevated privileges" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000460',  
'C-73667r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Installer\

Value Name: AlwaysInstallElevated

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73587','SV-88251r1_rule','default','medium','Users must be notified if a web-based program attempts to install software.',
'Web-based programs may attempt to install malicious software on a system. Ensuring users are notified if a web-based program attempts to install software allows them to refuse the installation.',
'F-80037r1_fix',
'The default behavior is for Internet Explorer to warn users and select whether to allow or refuse installation when a web-based program attempts to install software on the system.

If this needs to be corrected, configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Installer >> "Prevent Internet Explorer security prompt for Windows Installer scripts" to "Not Configured" or "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000470',  
'C-73669r1_chk',
'The default behavior is for Internet Explorer to warn users and select whether to allow or refuse installation when a web-based program attempts to install software on the system.

If the registry value name below does not exist, this is not a finding.

If it exists and is configured with a value of "0", this is not a finding.

If it exists and is configured with a value of "1", this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\Installer\

Value Name: SafeForScripting

Value Type: REG_DWORD
Value: 0x00000000 (0) (or if the Value Name does not exist)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73593','SV-88257r1_rule','default','high','The Windows Remote Management (WinRM) client must not use Basic authentication.',
'Basic authentication uses plain-text passwords that could be used to compromise a system. Disabling Basic authentication will reduce this potential.',
'F-80043r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Remote Management (WinRM) >> WinRM Client >> "Allow Basic authentication" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000500',  
'C-73675r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowBasic

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73595','SV-88259r1_rule','default','medium','The Windows Remote Management (WinRM) client must not allow unencrypted traffic.',
'Unencrypted remote access to a system can allow sensitive information to be compromised. Windows remote management connections must be encrypted to prevent this.

Satisfies: SRG-OS-000393-GPOS-00173, SRG-OS-000394-GPOS-00174',
'F-80045r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Remote Management (WinRM) >> WinRM Client >> "Allow unencrypted traffic" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000510',  
'C-73677r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowUnencryptedTraffic

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73597','SV-88261r1_rule','default','medium','The Windows Remote Management (WinRM) client must not use Digest authentication.',
'Digest authentication is not as strong as other options and may be subject to man-in-the-middle attacks. Disallowing Digest authentication will reduce this potential.',
'F-80047r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Remote Management (WinRM) >> WinRM Client >> "Disallow Digest authentication" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000520',  
'C-73679r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Client\

Value Name: AllowDigest

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73599','SV-88263r1_rule','default','high','The Windows Remote Management (WinRM) service must not use Basic authentication.',
'Basic authentication uses plain-text passwords that could be used to compromise a system. Disabling Basic authentication will reduce this potential.',
'F-80049r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Remote Management (WinRM) >> WinRM Service >> "Allow Basic authentication" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000530',  
'C-73681r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\

Value Name: AllowBasic

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73601','SV-88265r1_rule','default','medium','The Windows Remote Management (WinRM) service must not allow unencrypted traffic.',
'Unencrypted remote access to a system can allow sensitive information to be compromised. Windows remote management connections must be encrypted to prevent this.

Satisfies: SRG-OS-000393-GPOS-00173, SRG-OS-000394-GPOS-00174',
'F-80051r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Remote Management (WinRM) >> WinRM Service >> "Allow unencrypted traffic" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000540',  
'C-73683r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\

Value Name: AllowUnencryptedTraffic

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73603','SV-88267r1_rule','default','medium','The Windows Remote Management (WinRM) service must not store RunAs credentials.',
'Storage of administrative credentials could allow unauthorized access. Disallowing the storage of RunAs credentials for Windows Remote Management will prevent them from being used with plug-ins.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156',
'F-80053r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Remote Management (WinRM) >> WinRM Service >> "Disallow WinRM from storing RunAs credentials" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000550',  
'C-73685r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\WinRM\Service\

Value Name: DisableRunAs

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73495','SV-88147r1_rule','default','medium','Local administrator accounts must have their privileged token filtered to prevent elevated privileges from being used over the network on domain systems.',
'A compromised local administrator account can provide means for an attacker to move laterally between domain systems.

With User Account Control enabled, filtering the privileged token for local administrator accounts will prevent the elevated privileges of these accounts from being used over the network.',
'F-79937r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> MS Security Guide >> "Apply UAC restrictions to local accounts on network logons" to "Enabled".

This policy setting requires the installation of the SecGuide custom templates included with the STIG package. "SecGuide.admx" and " SecGuide.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
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

select add_rule_data ('default','V-73533','SV-88187r1_rule','default','medium','Local users on domain-joined computers must not be enumerated.',
'The username is one part of logon credentials that could be used to gain access to a system. Preventing the enumeration of users limits this information to authorized personnel.',
'F-79975r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Logon >> "Enumerate local users on domain-joined computers" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000030',  
'C-73607r1_chk',
'This applies to member servers. For domain controllers and standalone systems, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\System\

Value Name: EnumerateLocalUsers

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73541','SV-88203r1_rule','default','medium','Unauthenticated Remote Procedure Call (RPC) clients must be restricted from connecting to the RPC server.',
'Unauthenticated RPC clients may allow anonymous access to sensitive information. Configuring RPC to restrict unauthenticated RPC clients from connecting to the RPC server will prevent anonymous connections.',
'F-79983r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Remote Procedure Call >> "Restrict Unauthenticated RPC clients" to "Enabled" with "Authenticated" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000040',  
'C-73615r1_chk',
'This applies to member servers and standalone systems, It is NA for domain controllers.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Windows NT\Rpc\

Value Name:  RestrictRemoteClients

Type:  REG_DWORD
Value:  0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73651','SV-88315r1_rule','default','medium','Caching of logon credentials must be limited.',
'The default Windows configuration caches the last logon credentials for users who log on interactively to a system. This feature is provided for system availability reasons, such as the users machine being disconnected from the network or domain controllers being unavailable. Even though the credential cache is well protected, if a system is attacked, an unauthorized individual may isolate the password to a domain user account using a password-cracking program and gain access to the domain.',
'F-80271r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive Logon: Number of previous logons to cache (in case Domain Controller is not available)" to "4" logons or less.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000050',  
'C-73733r1_chk',
'This applies to member servers. For domain controllers and standalone systems, this is NA.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\

Value Name:  CachedLogonsCount

Value Type:  REG_SZ
Value:  4 (or less)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73733','SV-88397r1_rule','default','medium','The Access this computer from the network user right must only be assigned to the Administrators and Authenticated Users groups on member servers.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access this computer from the network" user right may access resources on the system, and this right must be limited to those requiring it.',
'F-80183r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Access this computer from the network" to include only the following accounts or groups:

- Administrators
- Authenticated Users

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000340',  
'C-73815r1_chk',
'This applies to member servers and standalone systems. A separate version applies to domain controllers.

Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Access this computer from the network" user right, this is a finding.

- Administrators
- Authenticated Users

Systems dedicated to managing Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG), must only allow Administrators, removing the Authenticated Users group.

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73759','SV-88423r1_rule','default','medium','The Deny access to this computer from the network user right on member servers must be configured to prevent access from highly privileged domain accounts and local accounts on domain systems, and from unauthenticated access on all systems.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny access to this computer from the network" user right defines the accounts that are prevented from logging on from the network.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks, which could lead to the compromise of an entire domain.

Local accounts on domain-joined systems must also be assigned this right to decrease the risk of lateral movement resulting from credential theft attacks.

The Guests group must be assigned this right to prevent unauthenticated access.',
'F-80209r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Deny access to this computer from the network" to include the following:

Domain Systems Only:
- Enterprise Admins group
- Domain Admins group
- "Local account and member of Administrators group" or "Local account" (see Note below)

All Systems:
- Guests group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from denying the Enterprise Admins and Domain Admins groups.

Note: These are built-in security groups. "Local account" is more restrictive but may cause issues on servers such as systems that provide failover clustering.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000370',  
'C-73841r1_chk',
'This applies to member servers and standalone systems. A separate version applies to domain controllers.

Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny access to this computer from the network" user right, this is a finding.

Domain Systems Only:
- Enterprise Admins group
- Domain Admins group
- "Local account and member of Administrators group" or "Local account" (see Note below)

All Systems:
- Guests group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from denying the Enterprise Admins and Domain Admins groups.

Note: These are built-in security groups. "Local account" is more restrictive but may cause issues on servers such as systems that provide failover clustering.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73763','SV-88427r1_rule','default','medium','The Deny log on as a batch job user right on member servers must be configured to prevent access from highly privileged domain accounts on domain systems and from unauthenticated access on all systems.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on as a batch job" user right defines accounts that are prevented from logging on to the system as a batch job, such as Task Scheduler.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks, which could lead to the compromise of an entire domain.

The Guests group must be assigned to prevent unauthenticated access.',
'F-80213r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Deny log on as a batch job" to include the following:

Domain Systems Only:
- Enterprise Admins Group
- Domain Admins Group

All Systems:
- Guests Group',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000380',  
'C-73845r1_chk',
'This applies to member servers and standalone systems. A separate version applies to domain controllers.

Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on as a batch job" user right, this is a finding.

Domain Systems Only:
- Enterprise Admins Group
- Domain Admins Group

All Systems:
- Guests Group',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73771','SV-88435r1_rule','default','medium','The Deny log on locally user right on member servers must be configured to prevent access from highly privileged domain accounts on domain systems and from unauthenticated access on all systems.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on locally" user right defines accounts that are prevented from logging on interactively.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks, which could lead to the compromise of an entire domain.

The Guests group must be assigned this right to prevent unauthenticated access.',
'F-80221r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Deny log on locally" to include the following:

Domain Systems Only:
- Enterprise Admins Group
- Domain Admins Group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from this.

All Systems:
- Guests Group',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000400',  
'C-73853r1_chk',
'This applies to member servers and standalone systems. A separate version applies to domain controllers.

Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on locally" user right, this is a finding.

Domain Systems Only:
- Enterprise Admins Group
- Domain Admins Group

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from this.

All Systems:
- Guests Group',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73775','SV-88439r1_rule','default','medium','The Deny log on through Remote Desktop Services user right on member servers must be configured to prevent access from highly privileged domain accounts and all local accounts on domain systems and from unauthenticated access on all systems.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Deny log on through Remote Desktop Services" user right defines the accounts that are prevented from logging on using Remote Desktop Services.

In an Active Directory Domain, denying logons to the Enterprise Admins and Domain Admins groups on lower-trust systems helps mitigate the risk of privilege escalation from credential theft attacks, which could lead to the compromise of an entire domain.

Local accounts on domain-joined systems must also be assigned this right to decrease the risk of lateral movement resulting from credential theft attacks.

The Guests group must be assigned this right to prevent unauthenticated access.',
'F-80225r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Deny log on through Remote Desktop Services" to include the following:

Domain Systems Only:
- Enterprise Admins group
- Domain Admins group
- Local account (see Note below)

All Systems:
- Guests group

Note: "Local account" is referring to the Windows built-in security group.

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from denying the Enterprise Admins and Domain Admins groups.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000410',  
'C-73857r1_chk',
'This applies to member servers and standalone systems. A separate version applies to domain controllers.

Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If the following accounts or groups are not defined for the "Deny log on through Remote Desktop Services" user right, this is a finding.

Domain Systems Only:
- Enterprise Admins group
- Domain Admins group
- Local account (see Note below)

All Systems:
- Guests group

Note: "Local account" is referring to the Windows built-in security group.

Systems dedicated to the management of Active Directory (AD admin platforms, see V-36436 in the Active Directory Domain STIG) are exempt from denying the Enterprise Admins and Domain Admins groups.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73779','SV-88443r1_rule','default','medium','The Enable computer and user accounts to be trusted for delegation user right must not be assigned to any groups or accounts on member servers.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Enable computer and user accounts to be trusted for delegation" user right allows the "Trusted for Delegation" setting to be changed. This could allow unauthorized users to impersonate other users.',
'F-80229r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Enable computer and user accounts to be trusted for delegation" to be defined but containing no entries (blank).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-MS-000420',  
'C-73861r1_chk',
'This applies to member servers and standalone systems. A separate version applies to domain controllers.

Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups are granted the "Enable computer and user accounts to be trusted for delegation" user right, this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73809','SV-88475r1_rule','default','medium','The built-in guest account must be disabled.',
'A system faces an increased vulnerability threat if the built-in guest account is not disabled. This is a known account that exists on all Windows systems and cannot be deleted. This account is initialized during the installation of the operating system with no password assigned.',
'F-80267r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Accounts: Guest account status" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000010',  
'C-73897r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options.

If the value for "Accounts: Guest account status" is not set to "Disabled", this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73621','SV-88285r1_rule','default','high','Local accounts with blank passwords must be restricted to prevent access from the network.',
'An account without a password can allow unauthorized access to a system as only the username would be required. Password policies should prevent accounts with blank passwords from existing on a system. However, if a local account with a blank password does exist, enabling this setting will prevent network access, limiting the account to local console logon only.',
'F-80071r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Accounts: Limit local account use of blank passwords to console logon only" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000020',  
'C-73703r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: LimitBlankPasswordUse

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73623','SV-88287r1_rule','default','medium','The built-in administrator account must be renamed.',
'The built-in administrator account is a well-known account subject to attack. Renaming this account to an unidentified name improves the protection of this account and the system.',
'F-80073r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Accounts: Rename administrator account" to a name other than "Administrator".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000030',  
'C-73705r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options.

If the value for "Accounts: Rename administrator account" is not set to a value other than "Administrator", this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73625','SV-88289r1_rule','default','medium','The built-in guest account must be renamed.',
'The built-in guest account is a well-known user account on all Windows systems and, as initially installed, does not require a password. This can allow access to system resources by unauthorized users. Renaming this account to an unidentified name improves the protection of this account and the system.',
'F-80075r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Accounts: Rename guest account" to a name other than "Guest".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000040',  
'C-73707r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options.

If the value for "Accounts: Rename guest account" is not set to a value other than "Guest", this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73627','SV-88291r1_rule','default','medium','Audit policy using subcategories must be enabled.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior. 
This setting allows administrators to enable more precise auditing capabilities.',
'F-80077r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000050',  
'C-73709r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: SCENoApplyLegacyAuditPolicy

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73633','SV-88297r1_rule','default','medium','The setting Domain member: Digitally encrypt or sign secure channel data (always) must be configured to Enabled.',
'Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted. If this policy is enabled, outgoing secure channel traffic will be encrypted and signed.

Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000424-GPOS-00188',
'F-80083r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Domain member: Digitally encrypt or sign secure channel data (always)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000080',  
'C-73715r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireSignOrSeal

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73635','SV-88299r1_rule','default','medium','The setting Domain member: Digitally encrypt secure channel data (when possible) must be configured to enabled.',
'Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but not all information is encrypted. If this policy is enabled, outgoing secure channel traffic will be encrypted.

Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000424-GPOS-00188',
'F-80085r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Domain member: Digitally encrypt secure channel data (when possible)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000090',  
'C-73717r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SealSecureChannel

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73637','SV-88301r1_rule','default','medium','The setting Domain member: Digitally sign secure channel data (when possible) must be configured to Enabled.',
'Requests sent on the secure channel are authenticated, and sensitive information (such as passwords) is encrypted, but the channel is not integrity checked. If this policy is enabled, outgoing secure channel traffic will be signed.

Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000424-GPOS-00188',
'F-80087r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Domain member: Digitally sign secure channel data (when possible)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000100',  
'C-73719r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: SignSecureChannel

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73639','SV-88303r1_rule','default','medium','The computer account password must not be prevented from being reset.',
'Computer account passwords are changed automatically on a regular basis. Disabling automatic password changes can make the system more vulnerable to malicious access. Frequent password changes can be a significant safeguard for the system. A new password for the computer account will be generated every 30 days.',
'F-80089r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Domain member: Disable machine account password changes" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000110',  
'C-73721r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: DisablePasswordChange

Value Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73641','SV-88305r1_rule','default','medium','The maximum age for machine account passwords must be configured to 30 days or less.',
'Computer account passwords are changed automatically on a regular basis. This setting controls the maximum password age that a machine account may have. This must be set to no more than 30 days, ensuring the machine changes its password monthly.',
'F-80091r1_fix',
'This is the default configuration for this setting (30 days).

Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Domain member: Maximum machine account password age" to "30" or less (excluding "0", which is unacceptable).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000120',  
'C-73723r1_chk',
'This is the default configuration for this setting (30 days).

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: MaximumPasswordAge

Value Type: REG_DWORD
Value: 0x0000001e (30) (or less, but not 0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73643','SV-88307r1_rule','default','medium','Windows Server 2016 must be configured to require a strong session key.',
'A computer connecting to a domain controller will establish a secure channel. The secure channel connection may be subject to compromise, such as hijacking or eavesdropping, if strong session keys are not used to establish the connection. Requiring strong session keys enforces 128-bit encryption between systems.

Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000424-GPOS-00188',
'F-80093r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Domain member: Require strong (Windows 2000 or Later) session key" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000130',  
'C-73725r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\Netlogon\Parameters\

Value Name: RequireStrongKey

Value Type: REG_DWORD
Value: 0x00000001 (1)
 
This setting may prevent a system from being joined to a domain if not configured consistently between systems.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73645','SV-88309r1_rule','default','medium','The machine inactivity limit must be set to 15 minutes, locking the system with the screen saver.',
'Unattended systems are susceptible to unauthorized use and should be locked when unattended. The screen saver should be set at a maximum of 15 minutes and be password protected. This protects critical and sensitive data from exposure to unauthorized personnel with physical access to the computer.',
'F-80095r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive logon: Machine inactivity limit" to "900" seconds or less.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000140',  
'C-73727r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: InactivityTimeoutSecs

Value Type: REG_DWORD
Value: 0x00000384 (900) (or less)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73647','SV-88311r1_rule','default','medium','The required legal notice must be configured to display before console logon.',
'Failure to display the logon banner prior to a logon attempt will negate legal proceedings resulting from unauthorized access to system resources.

Satisfies: SRG-OS-000023-GPOS-00006, SRG-OS-000024-GPOS-00007, SRG-OS-000228-GPOS-00088',
'F-80097r2_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive Logon: Message text for users attempting to log on" to the following:

You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.

By using this IS (which includes any device attached to this IS), you consent to the following conditions:

-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations.

-At any time, the USG may inspect and seize data stored on this IS.

-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.

-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.

-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000150',  
'C-73729r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: LegalNoticeText

Value Type: REG_SZ
Value: See message text below

You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only.

By using this IS (which includes any device attached to this IS), you consent to the following conditions:

-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations.

-At any time, the USG may inspect and seize data stored on this IS.

-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose.

-This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not for your personal benefit or privacy.

-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details.

Any OS versions that do not support the full text version must state the following:
"I have read and consent to terms in IS user agreement."

Deviations are not permitted except as authorized by the Deputy Assistant Secretary of Defense for Information and Identity Assurance.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73649','SV-88313r1_rule','default','low','The Windows dialog box title for the legal banner must be configured with the appropriate text.',
'Failure to display the logon banner prior to a logon attempt will negate legal proceedings resulting from unauthorized access to system resources.

Satisfies: SRG-OS-000023-GPOS-00006, SRG-OS-000228-GPOS-00088',
'F-80099r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive Logon: Message title for users attempting to log on" to "DoD Notice and Consent Banner", "US Department of Defense Warning Statement", or an organization-defined equivalent. 

If an organization-defined title is used, it can in no case contravene or modify the language of the message text required in WN16-SO-000150.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000160',  
'C-73731r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: LegalNoticeCaption

Value Type: REG_SZ
Value: See message title options below

"DoD Notice and Consent Banner", "US Department of Defense Warning Statement", or an organization-defined equivalent. 

If an organization-defined title is used, it can in no case contravene or modify the language of the banner text required in WN16-SO-000150.

Automated tools may only search for the titles defined above. If an organization-defined title is used, a manual review will be required.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73807','SV-88473r1_rule','default','medium','The Smart Card removal option must be configured to Force Logoff or Lock Workstation.',
'Unattended systems are susceptible to unauthorized use and must be locked. Configuring a system to lock when a smart card is removed will ensure the system is inaccessible when unattended.',
'F-80265r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Interactive logon: Smart card removal behavior" to "Lock Workstation" or "Force Logoff".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000180',  
'C-73895r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\
 
Value Name: scremoveoption

Value Type: REG_SZ
Value: 1 (Lock Workstation) or 2 (Force Logoff)

If configuring this on servers causes issues, such as terminating users remote sessions, and the organization has a policy in place that any other sessions on the servers, such as administrative console logons, are manually locked or logged off when unattended or not in use, this would be acceptable. This must be documented with the ISSO.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73653','SV-88317r1_rule','default','medium','The setting Microsoft network client: Digitally sign communications (always) must be configured to Enabled.',
'The server message block (SMB) protocol provides the basis for many network operations. Digitally signed SMB packets aid in preventing man-in-the-middle attacks. If this policy is enabled, the SMB client will only communicate with an SMB server that performs SMB packet signing.

Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000424-GPOS-00188',
'F-80103r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Microsoft network client: Digitally sign communications (always)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000190',  
'C-73735r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: RequireSecuritySignature

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73655','SV-88319r1_rule','default','medium','The setting Microsoft network client: Digitally sign communications (if server agrees) must be configured to Enabled.',
'The server message block (SMB) protocol provides the basis for many network operations. If this policy is enabled, the SMB client will request packet signing when communicating with an SMB server that is enabled or required to perform SMB packet signing.

Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000424-GPOS-00188',
'F-80105r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Microsoft network client: Digitally sign communications (if server agrees)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000200',  
'C-73737r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name: EnableSecuritySignature

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73657','SV-88321r1_rule','default','medium','Unencrypted passwords must not be sent to third-party Server Message Block (SMB) servers.',
'Some non-Microsoft SMB servers only support unencrypted (plain-text) password authentication. Sending plain-text passwords across the network when authenticating to an SMB server reduces the overall security of the environment. Check with the vendor of the SMB server to determine if there is a way to support encrypted password authentication.',
'F-80107r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Microsoft Network Client: Send unencrypted password to third-party SMB servers" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000210',  
'C-73739r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SYSTEM\CurrentControlSet\Services\LanmanWorkstation\Parameters\

Value Name:  EnablePlainTextPassword

Value Type:  REG_DWORD
Value:  0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73659','SV-88323r1_rule','default','medium','The amount of idle time required before suspending a session must be configured to 15 minutes or less.',
'Open sessions can increase the avenues of attack on a system. This setting is used to control when a computer disconnects an inactive SMB session. If client activity resumes, the session is automatically reestablished. This protects critical and sensitive network data from exposure to unauthorized personnel with physical access to the computer.

Satisfies: SRG-OS-000163-GPOS-00072, SRG-OS-000279-GPOS-00109',
'F-80109r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Microsoft Network Server: Amount of idle time required before suspending session" to "15" minutes or less.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000220',  
'C-73741r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\

Value Name:  autodisconnect

Value Type:  REG_DWORD
Value:  0x0000000f (15) (or less)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73661','SV-88325r1_rule','default','medium','The setting Microsoft network server: Digitally sign communications (always) must be configured to Enabled.',
'The server message block (SMB) protocol provides the basis for many network operations. Digitally signed SMB packets aid in preventing man-in-the-middle attacks. If this policy is enabled, the SMB server will only communicate with an SMB client that performs SMB packet signing.

Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000424-GPOS-00188',
'F-80111r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Microsoft network server: Digitally sign communications (always)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000230',  
'C-73743r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: RequireSecuritySignature

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73663','SV-88327r1_rule','default','medium','The setting Microsoft network server: Digitally sign communications (if client agrees) must be configured to Enabled.',
'The server message block (SMB) protocol provides the basis for many network operations. Digitally signed SMB packets aid in preventing man-in-the-middle attacks. If this policy is enabled, the SMB server will negotiate SMB packet signing as requested by the client.

Satisfies: SRG-OS-000423-GPOS-00187, SRG-OS-000424-GPOS-00188',
'F-80113r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Microsoft network server: Digitally sign communications (if client agrees)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000240',  
'C-73745r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: EnableSecuritySignature

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73665','SV-88329r1_rule','default','high','Anonymous SID/Name translation must not be allowed.',
'Allowing anonymous SID/Name translation can provide sensitive information for accessing a system. Only authorized users must be able to perform such translations.',
'F-80115r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network access: Allow anonymous SID/Name translation" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000250',  
'C-73747r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options.

If the value for "Network access: Allow anonymous SID/Name translation" is not set to "Disabled", this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73667','SV-88331r1_rule','default','high','Anonymous enumeration of Security Account Manager (SAM) accounts must not be allowed.',
'Anonymous enumeration of SAM accounts allows anonymous logon users (null session connections) to list all accounts names, thus providing a list of potential points to attack the system.',
'F-80117r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network access: Do not allow anonymous enumeration of SAM accounts" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000260',  
'C-73749r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymousSAM

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73669','SV-88333r1_rule','default','high','Anonymous enumeration of shares must not be allowed.',
'Allowing anonymous logon users (null session connections) to list all account names and enumerate all shared resources can provide a map of potential points to attack the system.',
'F-80119r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network access: Do not allow anonymous enumeration of SAM accounts and shares" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000270',  
'C-73751r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: RestrictAnonymous

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73671','SV-88335r1_rule','default','medium','Windows Server 2016 must be configured to prevent the storage of passwords and credentials.',
'This setting controls the storage of passwords and credentials for network authentication on the local system. Such credentials must not be stored on the local machine, as that may lead to account compromise.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156',
'F-80121r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network access: Do not allow storage of passwords and credentials for network authentication" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000280',  
'C-73753r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: DisableDomainCreds

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73673','SV-88337r1_rule','default','medium','Windows Server 2016 must be configured to prevent anonymous users from having the same permissions as the Everyone group.',
'Access by anonymous users must be restricted. If this setting is enabled, anonymous users have the same rights and permissions as the built-in Everyone group. Anonymous users must not have these permissions or rights.',
'F-80123r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network access: Let everyone permissions apply to anonymous users" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000290',  
'C-73755r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: EveryoneIncludesAnonymous

Value Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73675','SV-88339r1_rule','default','high','Anonymous access to Named Pipes and Shares must be restricted.',
'Allowing anonymous access to named pipes or shares provides the potential for unauthorized system access. This setting restricts access to those defined in "Network access: Named Pipes that can be accessed anonymously" and "Network access: Shares that can be accessed anonymously", both of which must be blank under other requirements.',
'F-80125r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network access: Restrict anonymous access to Named Pipes and Shares" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000300',  
'C-73757r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\LanManServer\Parameters\

Value Name: RestrictNullSessAccess

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73679','SV-88343r1_rule','default','medium','Services using Local System that use Negotiate when reverting to NTLM authentication must use the computer identity instead of authenticating anonymously.',
'Services using Local System that use Negotiate when reverting to NTLM authentication may gain unauthorized access if allowed to authenticate anonymously versus using the computer identity.',
'F-80129r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Allow Local System to use computer identity for NTLM" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000320',  
'C-73761r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Control\LSA\

Value Name: UseMachineId

Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73681','SV-88345r1_rule','default','medium','NTLM must be prevented from falling back to a Null session.',
'NTLM sessions that are allowed to fall back to Null (unauthenticated) sessions may gain unauthorized access.',
'F-80131r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Allow LocalSystem NULL session fallback" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000330',  
'C-73763r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Control\LSA\MSV1_0\

Value Name: allownullsessionfallback

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73683','SV-88347r1_rule','default','medium','PKU2U authentication using online identities must be prevented.',
'PKU2U is a peer-to-peer authentication protocol. This setting prevents online identities from authenticating to domain-joined systems. Authentication will be centrally managed with Windows user accounts.',
'F-80133r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Allow PKU2U authentication requests to this computer to use online identities" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000340',  
'C-73765r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Control\LSA\pku2u\

Value Name: AllowOnlineID

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73687','SV-88351r1_rule','default','high','Windows Server 2016 must be configured to prevent the storage of the LAN Manager hash of passwords.',
'The LAN Manager hash uses a weak encryption algorithm and there are several tools available that use this hash to retrieve account passwords. This setting controls whether a LAN Manager hash of the password is stored in the SAM the next time the password is changed.',
'F-80137r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Do not store LAN Manager hash value on next password change" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000360',  
'C-73769r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: NoLMHash

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73689','SV-88353r1_rule','default','medium','Windows Server 2016 must be configured to force users to log off when their allowed logon hours expire.',
'Limiting logon hours can help protect data by allowing access only during specified times. This setting controls whether users are forced to log off when their allowed logon hours expire. If logon hours are set for users, this must be enforced.',
'F-80139r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Force logoff when logon hours expire" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000370',  
'C-73771r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options.

If the value for "Network security: Force logoff when logon hours expire" is not set to "Enabled", this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73691','SV-88355r1_rule','default','high','The LAN Manager authentication level must be set to send NTLMv2 response only and to refuse LM and NTLM.',
'The Kerberos v5 authentication protocol is the default for authentication of users who are logging on to domain accounts. NTLM, which is less secure, is retained in later Windows versions for compatibility with clients and servers that are running earlier versions of Windows or applications that still use it. It is also used to authenticate logons to standalone computers that are running later versions.',
'F-80141r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: LAN Manager authentication level" to "Send NTLMv2 response only. Refuse LM and NTLM".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000380',  
'C-73773r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: LmCompatibilityLevel

Value Type: REG_DWORD
Value: 0x00000005 (5)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73693','SV-88357r1_rule','default','medium','Windows Server 2016 must be configured to at least negotiate signing for LDAP client signing.',
'This setting controls the signing requirements for LDAP clients. This must be set to "Negotiate signing" or "Require signing", depending on the environment and type of LDAP server in use.',
'F-80143r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: LDAP client signing requirements" to "Negotiate signing" at a minimum.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000390',  
'C-73775r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Services\LDAP\

Value Name: LDAPClientIntegrity

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73695','SV-88359r1_rule','default','medium','Session security for NTLM SSP-based clients must be configured to require NTLMv2 session security and 128-bit encryption.',
'Microsoft has implemented a variety of security support providers for use with Remote Procedure Call (RPC) sessions. All of the options must be enabled to ensure the maximum security level.',
'F-80145r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Minimum session security for NTLM SSP based (including secure RPC) clients" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000400',  
'C-73777r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinClientSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73697','SV-88361r1_rule','default','medium','Session security for NTLM SSP-based servers must be configured to require NTLMv2 session security and 128-bit encryption.',
'Microsoft has implemented a variety of security support providers for use with Remote Procedure Call (RPC) sessions. All of the options must be enabled to ensure the maximum security level.',
'F-80147r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Minimum session security for NTLM SSP based (including secure RPC) servers" to "Require NTLMv2 session security" and "Require 128-bit encryption" (all options selected).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000410',  
'C-73779r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\MSV1_0\

Value Name: NTLMMinServerSec

Value Type: REG_DWORD
Value: 0x20080000 (537395200)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73699','SV-88363r1_rule','default','medium','Users must be required to enter a password to access private keys stored on the computer.',
'If the private key is discovered, an attacker can use the key to authenticate as an authorized user and gain access to the network infrastructure.

The cornerstone of the PKI is the private key used to encrypt or digitally sign information.

If the private key is stolen, this will lead to the compromise of the authentication and non-repudiation gained through PKI because the attacker can use the private key to digitally sign documents and pretend to be the authorized user.

Both the holders of a digital certificate and the issuing authority must protect the computers, storage devices, or whatever they use to keep the private keys.',
'F-80149r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "System cryptography: Force strong key protection for user keys stored on the computer" to "User must enter a password each time they use a key".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000420',  
'C-73781r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive:  HKEY_LOCAL_MACHINE
Registry Path:  \SOFTWARE\Policies\Microsoft\Cryptography\

Value Name:  ForceKeyProtection

Type:  REG_DWORD
Value:  0x00000002 (2)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73703','SV-88367r1_rule','default','medium','Windows Server 2016 must be configured to require case insensitivity for non-Windows subsystems.',
'This setting controls the behavior of non-Windows subsystems when dealing with the case of arguments or commands. Case sensitivity could lead to the access of files or commands that must be restricted. To prevent this from happening, case insensitivity restrictions must be required.',
'F-80153r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "System objects: Require case insensitivity for non-Windows subsystems" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000440',  
'C-73785r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Session Manager\Kernel\

Value Name: ObCaseInsensitive

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73705','SV-88369r1_rule','default','low','The default permissions of global system objects must be strengthened.',
'Windows systems maintain a global list of shared system resources such as DOS device names, mutexes, and semaphores. Each type of object is created with a default Discretionary Access Control List (DACL) that specifies who can access the objects with what permissions. When this policy is enabled, the default DACL is stronger, allowing non-administrative users to read shared objects but not to modify shared objects they did not create.',
'F-80155r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "System objects: Strengthen default permissions of internal system objects (e.g., Symbolic Links)" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000450',  
'C-73787r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SYSTEM\CurrentControlSet\Control\Session Manager\

Value Name: ProtectionMode

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73707','SV-88371r1_rule','default','medium','User Account Control approval mode for the built-in Administrator must be enabled.',
'User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting configures the built-in Administrator account so that it runs in Admin Approval Mode.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156',
'F-80157r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Admin Approval Mode for the Built-in Administrator account" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000460',  
'C-73789r1_chk',
'UAC requirements are NA for Server Core installations (this is the default installation option for Windows Server 2016 versus Server with Desktop Experience) as well as Nano Server.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: FilterAdministratorToken

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73709','SV-88373r1_rule','default','medium','UIAccess applications must not be allowed to prompt for elevation without using the secure desktop.',
'User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting prevents User Interface Accessibility programs from disabling the secure desktop for elevation prompts.',
'F-80159r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Allow UIAccess applications to prompt for elevation without using the secure desktop" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000470',  
'C-73791r1_chk',
'UAC requirements are NA for Server Core installations (this is the default installation option for Windows Server 2016 versus Server with Desktop Experience) as well as Nano Server.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableUIADesktopToggle

Value Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73711','SV-88375r1_rule','default','medium','User Account Control must, at a minimum, prompt administrators for consent on the secure desktop.',
'User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting configures the elevation requirements for logged-on administrators to complete a task that requires raised privileges.',
'F-80161r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Behavior of the elevation prompt for administrators in Admin Approval Mode" to "Prompt for consent on the secure desktop".

The more secure option for this setting, "Prompt for credentials on the secure desktop", would also be acceptable.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000480',  
'C-73793r1_chk',
'UAC requirements are NA for Server Core installations (this is default installation option for Windows Server 2016 versus Server with Desktop Experience) as well as Nano Server.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorAdmin

Value Type: REG_DWORD
Value: 0x00000002 (2) (Prompt for consent on the secure desktop)
0x00000001 (1) (Prompt for credentials on the secure desktop)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73713','SV-88377r1_rule','default','medium','User Account Control must automatically deny standard user requests for elevation.',
'User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting controls the behavior of elevation when requested by a standard user account.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156',
'F-80163r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Behavior of the elevation prompt for standard users" to "Automatically deny elevation requests".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000490',  
'C-73795r1_chk',
'UAC requirements are NA for Server Core installations (this is the default installation option for Windows Server 2016 versus Server with Desktop Experience) as well as Nano Server.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: ConsentPromptBehaviorUser

Value Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73715','SV-88379r1_rule','default','medium','User Account Control must be configured to detect application installations and prompt for elevation.',
'User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting requires Windows to respond to application installation requests by prompting for credentials.',
'F-80165r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Detect application installations and prompt for elevation" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000500',  
'C-73797r1_chk',
'UAC requirements are NA for Server Core installations (this is the default installation option for Windows Server 2016 versus Server with Desktop Experience) as well as Nano Server.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableInstallerDetection

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73717','SV-88381r1_rule','default','medium','User Account Control must only elevate UIAccess applications that are installed in secure locations.',
'User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting configures Windows to only allow applications installed in a secure location on the file system, such as the Program Files or the Windows\System32 folders, to run with elevated privileges.',
'F-80167r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Only elevate UIAccess applications that are installed in secure locations" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000510',  
'C-73799r1_chk',
'UAC requirements are NA for Server Core installations (this is the default installation option for Windows Server 2016 versus Server with Desktop Experience) as well as Nano Server.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableSecureUIAPaths

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73719','SV-88383r1_rule','default','medium','User Account Control must run all administrators in Admin Approval Mode, enabling UAC.',
'User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting enables UAC.

Satisfies: SRG-OS-000373-GPOS-00157, SRG-OS-000373-GPOS-00156',
'F-80169r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Run all administrators in Admin Approval Mode" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000520',  
'C-73801r1_chk',
'UAC requirements are NA for Server Core installations (this is the default installation option for Windows Server 2016 versus Server with Desktop Experience) as well as Nano Server.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableLUA

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73721','SV-88385r1_rule','default','medium','User Account Control must virtualize file and registry write failures to per-user locations.',
'User Account Control (UAC) is a security mechanism for limiting the elevation of privileges, including administrative accounts, unless authorized. This setting configures non-UAC-compliant applications to run in virtualized file and registry entries in per-user locations, allowing them to run.',
'F-80171r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "User Account Control: Virtualize file and registry write failures to per-user locations" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000530',  
'C-73803r1_chk',
'UAC requirements are NA for Server Core installations (this is the default installation option for Windows Server 2016 versus Server with Desktop Experience) as well as Nano Server.

If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\

Value Name: EnableVirtualization

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73729','SV-88393r1_rule','default','medium','The Access Credential Manager as a trusted caller user right must not be assigned to any groups or accounts.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Access Credential Manager as a trusted caller" user right may be able to retrieve the credentials of other accounts from Credential Manager.',
'F-80179r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Access Credential Manager as a trusted caller" to be defined but containing no entries (blank).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000010',  
'C-73811r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups are granted the "Access Credential Manager as a trusted caller" user right, this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73735','SV-88399r1_rule','default','high','The Act as part of the operating system user right must not be assigned to any groups or accounts.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Act as part of the operating system" user right can assume the identity of any user and gain access to resources that the user is authorized to access. Any accounts with this right can take complete control of a system.',
'F-80185r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Act as part of the operating system" to be defined but containing no entries (blank).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000030',  
'C-73817r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups (to include administrators), are granted the "Act as part of the operating system" user right, this is a finding.

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).

Passwords for accounts with this user right must be protected as highly privileged accounts.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73739','SV-88403r1_rule','default','medium','The Allow log on locally user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Allow log on locally" user right can log on interactively to a system.',
'F-80189r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Allow log on locally" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000050',  
'C-73821r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Allow log on locally" user right, this is a finding.

- Administrators

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73743','SV-88407r1_rule','default','medium','The Back up files and directories user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Back up files and directories" user right can circumvent file and directory permissions and could allow access to sensitive data.',
'F-80193r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Back up files and directories" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000070',  
'C-73825r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Back up files and directories" user right, this is a finding.

- Administrators

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73745','SV-88409r1_rule','default','medium','The Create a pagefile user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create a pagefile" user right can change the size of a pagefile, which could affect system performance.',
'F-80195r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Create a pagefile" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000080',  
'C-73827r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create a pagefile" user right, this is a finding.

- Administrators',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73747','SV-88411r1_rule','default','high','The Create a token object user right must not be assigned to any groups or accounts.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Create a token object" user right allows a process to create an access token. This could be used to provide elevated rights and compromise a system.',
'F-80197r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Create a token object" to be defined but containing no entries (blank).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000090',  
'C-73829r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups are granted the "Create a token object" user right, this is a finding.

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).

Passwords for application accounts with this user right must be protected as highly privileged accounts.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73749','SV-88413r1_rule','default','medium','The Create global objects user right must only be assigned to Administrators, Service, Local Service, and Network Service.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create global objects" user right can create objects that are available to all sessions, which could affect processes in other users sessions.',
'F-80199r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Create global objects" to include only the following accounts or groups:

- Administrators
- Service
- Local Service
- Network Service',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000100',  
'C-73831r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create global objects" user right, this is a finding.

- Administrators
- Service
- Local Service
- Network Service

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73751','SV-88415r1_rule','default','medium','The Create permanent shared objects user right must not be assigned to any groups or accounts.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create permanent shared objects" user right could expose sensitive data by creating shared objects.',
'F-80201r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Create permanent shared objects" to be defined but containing no entries (blank).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000110',  
'C-73833r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups are granted the "Create permanent shared objects" user right, this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73753','SV-88417r1_rule','default','medium','The Create symbolic links user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Create symbolic links" user right can create pointers to other objects, which could expose the system to attack.',
'F-80203r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Create symbolic links" to include only the following accounts or groups:

- Administrators

Systems that have the Hyper-V role will also have "Virtual Machines" given this user right. If this needs to be added manually, enter it as "NT Virtual Machine\Virtual Machines".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000120',  
'C-73835r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Create symbolic links" user right, this is a finding.

- Administrators

Systems that have the Hyper-V role will also have "Virtual Machines" given this user right (this may be displayed as "NT Virtual Machine\Virtual Machines"). This is not a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73755','SV-88419r1_rule','default','high','The Debug programs user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Debug programs" user right can attach a debugger to any process or to the kernel, providing complete access to sensitive and critical operating system components. This right is given to Administrators in the default configuration.',
'F-80205r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Debug programs" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000130',  
'C-73837r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Debug programs" user right, this is a finding.

- Administrators

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).

Passwords for application accounts with this user right must be protected as highly privileged accounts.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73781','SV-88445r1_rule','default','medium','The Force shutdown from a remote system user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Force shutdown from a remote system" user right can remotely shut down a system, which could result in a denial of service.',
'F-80231r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Force shutdown from a remote system" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000200',  
'C-73863r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Force shutdown from a remote system" user right, this is a finding.

- Administrators',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73783','SV-88447r1_rule','default','medium','The Generate security audits user right must only be assigned to Local Service and Network Service.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Generate security audits" user right specifies users and processes that can generate Security Log audit records, which must only be the system service accounts defined.',
'F-80233r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Generate security audits" to include only the following accounts or groups:

- Local Service
- Network Service',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000210',  
'C-73865r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Generate security audits" user right, this is a finding.

- Local Service
- Network Service

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73785','SV-88449r1_rule','default','medium','The Impersonate a client after authentication user right must only be assigned to Administrators, Service, Local Service, and Network Service.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Impersonate a client after authentication" user right allows a program to impersonate another user or account to run on their behalf. An attacker could use this to elevate privileges.',
'F-80235r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Impersonate a client after authentication" to include only the following accounts or groups:

- Administrators
- Service
- Local Service
- Network Service',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000220',  
'C-73867r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Impersonate a client after authentication" user right, this is a finding.

- Administrators
- Service
- Local Service
- Network Service

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73787','SV-88451r1_rule','default','medium','The Increase scheduling priority user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Increase scheduling priority" user right can change a scheduling priority, causing performance issues or a denial of service.',
'F-80237r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Increase scheduling priority" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000230',  
'C-73869r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Increase scheduling priority" user right, this is a finding.

- Administrators

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73789','SV-88453r1_rule','default','medium','The Load and unload device drivers user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Load and unload device drivers" user right allows a user to load device drivers dynamically on a system. This could be used by an attacker to install malicious code.',
'F-80239r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Load and unload device drivers" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000240',  
'C-73871r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Load and unload device drivers" user right, this is a finding.

- Administrators',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73791','SV-88455r1_rule','default','medium','The Lock pages in memory user right must not be assigned to any groups or accounts.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

The "Lock pages in memory" user right allows physical memory to be assigned to processes, which could cause performance issues or a denial of service.',
'F-80241r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Lock pages in memory" to be defined but containing no entries (blank).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000250',  
'C-73873r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups are granted the "Lock pages in memory" user right, this is a finding.

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73793','SV-88457r1_rule','default','medium','The Manage auditing and security log user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Manage auditing and security log" user right can manage the security log and change auditing configurations. This could be used to clear evidence of tampering.

Satisfies: SRG-OS-000057-GPOS-00027, SRG-OS-000058-GPOS-00028, SRG-OS-000059-GPOS-00029, SRG-OS-000063-GPOS-00032, SRG-OS-000337-GPOS-00129',
'F-80243r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Manage auditing and security log" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000260',  
'C-73875r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Manage auditing and security log" user right, this is a finding.

- Administrators

If the organization has an Auditors group, the assignment of this group to the user right would not be a finding.

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73795','SV-88459r1_rule','default','medium','The Modify firmware environment values user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Modify firmware environment values" user right can change hardware configuration environment variables. This could result in hardware failures or a denial of service.',
'F-80245r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Modify firmware environment values" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000270',  
'C-73877r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Modify firmware environment values" user right, this is a finding.

- Administrators',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73797','SV-88461r1_rule','default','medium','The Perform volume maintenance tasks user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Perform volume maintenance tasks" user right can manage volume and disk configurations. This could be used to delete volumes, resulting in data loss or a denial of service.',
'F-80247r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Perform volume maintenance tasks" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000280',  
'C-73879r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Perform volume maintenance tasks" user right, this is a finding.

- Administrators',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73799','SV-88463r1_rule','default','medium','The Profile single process user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Profile single process" user right can monitor non-system processes performance. An attacker could use this to identify processes to attack.',
'F-80249r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Profile single process" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000290',  
'C-73881r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Profile single process" user right, this is a finding.

- Administrators',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73801','SV-88465r1_rule','default','medium','The Restore files and directories user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Restore files and directories" user right can circumvent file and directory permissions and could allow access to sensitive data. It could also be used to overwrite more current data.',
'F-80251r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Restore files and directories" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000300',  
'C-73883r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Restore files and directories" user right, this is a finding.

- Administrators

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73803','SV-88467r1_rule','default','medium','The Take ownership of files or other objects user right must only be assigned to the Administrators group.',
'Inappropriate granting of user rights can provide system, administrative, and other high-level capabilities.

Accounts with the "Take ownership of files or other objects" user right can take ownership of objects and make changes.',
'F-80253r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment >> "Take ownership of files or other objects" to include only the following accounts or groups:

- Administrators',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-UR-000310',  
'C-73885r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> User Rights Assignment.

If any accounts or groups other than the following are granted the "Take ownership of files or other objects" user right, this is a finding.

- Administrators

If an application requires this user right, this would not be a finding.

Vendor documentation must support the requirement for having the user right.

The requirement must be documented with the ISSO.

The application account must meet requirements for application account passwords, such as length (WN16-00-000060) and required frequency of changes (WN16-00-000070).',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73239','SV-87891r1_rule','default','high','Systems must be maintained at a supported servicing level.',
'Systems at unsupported servicing levels will not receive security updates for new vulnerabilities, which leave them subject to exploitation. Systems must be maintained at a servicing level supported by the vendor with new security updates.',
'F-79683r1_fix',
'Update the system to a Version 1607 (Build 14393.xxx) or greater.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-00-000110',  
'C-73343r1_chk',
'Open "Command Prompt".

Enter "winver.exe".

If the "About Windows" dialog box does not display "Microsoft Windows Server Version 1607 (Build 14393.xxx)" or greater, this is a finding.

Preview versions must not be used in a production environment.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73309','SV-87961r2_rule','default','medium','Windows 2016 account lockout duration must be configured to 15 minutes or greater.',
'The account lockout feature, when enabled, prevents brute-force password attacks on the system. This parameter specifies the period of time that an account will remain locked after the specified number of failed logon attempts.',
'F-80983r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Account Lockout Policy >> "Account lockout duration" to "15" minutes or greater.

A value of "0" is also acceptable, requiring an administrator to unlock the account.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000010',  
'C-74313r1_chk',
'Verify the effective setting in Local Group Policy Editor.
Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Account Lockout Policy.

If the "Account lockout duration" is less than "15" minutes (excluding "0"), this is a finding.

Configuring this to "0", requiring an administrator to unlock the account, is more restrictive and is not a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73311','SV-87963r1_rule','default','medium','The number of allowed bad logon attempts must be configured to three or less.',
'The account lockout feature, when enabled, prevents brute-force password attacks on the system. The higher this value is, the less effective the account lockout feature will be in protecting the local system. The number of bad logon attempts must be reasonably small to minimize the possibility of a successful password attack while allowing for honest errors made during normal user logon.',
'F-79753r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Account Lockout Policy >> "Account lockout threshold" to "3" or fewer invalid logon attempts (excluding "0", which is unacceptable).',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000020',  
'C-73415r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Account Lockout Policy.

If the "Account lockout threshold" is "0" or more than "3" attempts, this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73313','SV-87965r1_rule','default','medium','The period of time before the bad logon counter is reset must be configured to 15 minutes or greater.',
'The account lockout feature, when enabled, prevents brute-force password attacks on the system. This parameter specifies the period of time that must pass after failed logon attempts before the counter is reset to "0". The smaller this value is, the less effective the account lockout feature will be in protecting the local system.

Satisfies: SRG-OS-000021-GPOS-00005, SRG-OS-000329-GPOS-00128',
'F-79755r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Account Lockout Policy >> "Reset account lockout counter after" to at least "15" minutes.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AC-000030',  
'C-73417r1_chk',
'Verify the effective setting in Local Group Policy Editor.

Run "gpedit.msc".

Navigate to Local Computer Policy >> Computer Configuration >> Windows Settings >> Security Settings >> Account Policies >> Account Lockout Policy.

If the "Reset account lockout counter after" value is less than "15" minutes, this is a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73443','SV-88095r1_rule','default','medium','Windows Server 2016 must be configured to audit Logon/Logoff - Account Lockout successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Account Lockout events can be used to identify potentially malicious logon attempts.

Satisfies: SRG-OS-000240-GPOS-00090, SRG-OS-000470-GPOS-00214',
'F-79885r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Logon/Logoff >> "Audit Account Lockout" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000220',  
'C-73517r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN10-SO-000030) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*"

Compare the AuditPol settings with the following. 

If the system does not audit the following, this is a finding.

Logon/Logoff >> Account Lockout - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73457','SV-88109r1_rule','default','medium','Windows Server 2016 must be configured to audit Object Access - Removable Storage successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Removable Storage auditing under Object Access records events related to access attempts on file system objects on removable storage devices.',
'F-79899r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Object Access >> "Audit Removable Storage" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000290',  
'C-73531r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Object Access >> Removable Storage - Success

Virtual machines or systems that use network attached storage may generate excessive audit events for secondary virtual drives or the network attached storage when this setting is enabled. This may be set to Not Configured in such cases and would not be a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73467','SV-88119r1_rule','default','medium','Windows Server 2016 must be configured to audit Policy Change - Authorization Policy Change successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Authorization Policy Change records events related to changes in user rights, such as "Create a token object".

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000064-GPOS-00033, SRG-OS-000462-GPOS-00206, SRG-OS-000466-GPOS-00210',
'F-79909r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Policy Change >> "Audit Authorization Policy Change" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000340',  
'C-73541r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Policy Change >> Authorization Policy Change - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73477','SV-88129r1_rule','default','medium','Windows Server 2016 must be configured to audit System - Other System Events successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Other System Events records information related to cryptographic key operations and the Windows Firewall service.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79919r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit Other System Events" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000390',  
'C-73551r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN10-SO-000030) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*"

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

System >> Other System Events - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73559','SV-88223r1_rule','default','medium','Windows SmartScreen must be enabled.',
'Windows SmartScreen helps protect systems from programs downloaded from the internet that may be malicious. Enabling SmartScreen will warn users of potentially malicious programs.',
'F-80009r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> File Explorer >> "Configure Windows SmartScreen" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000330',  
'C-73641r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\System\

Value Name: EnableSmartScreen

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73685','SV-88349r1_rule','default','medium','Kerberos encryption types must be configured to prevent the use of DES and RC4 encryption suites.',
'Certain encryption types are no longer considered secure. The DES and RC4 encryption suites must not be used for Kerberos encryption.',
'F-80135r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network security: Configure encryption types allowed for Kerberos" to "Enabled" with only the following selected:

AES128_HMAC_SHA1
AES256_HMAC_SHA1
Future encryption types',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000350',  
'C-73767r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Kerberos\Parameters\

Value Name: SupportedEncryptionTypes

Value Type: REG_DWORD
Value: 0x7ffffff8 (2147483640)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73431','SV-88083r1_rule','default','medium','Windows Server 2016 must be configured to audit Detailed Tracking - Plug and Play Events successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Plug and Play activity records events related to the successful connection of external devices.',
'F-79873r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Detailed Tracking >> "Audit PNP Activity" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000160',  
'C-73505r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN10-SO-000030) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*"

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Detailed Tracking >> Plug and Play Events - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73445','SV-88097r1_rule','default','medium','Windows Server 2016 must be configured to audit Logon/Logoff - Account Lockout failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Account Lockout events can be used to identify potentially malicious logon attempts.

Satisfies: SRG-OS-000240-GPOS-00090, SRG-OS-000470-GPOS-00214',
'F-79887r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Logon/Logoff >> "Audit Account Lockout" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000230',  
'C-73519r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN10-SO-000030) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*"

Compare the AuditPol settings with the following. If the system does not audit the following, this is a finding.

Logon/Logoff >> Account Lockout - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73447','SV-88099r1_rule','default','medium','Windows Server 2016 must be configured to audit Logon/Logoff - Group Membership successes.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Group Membership records information related to the group membership of a users logon token.',
'F-79889r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Logon/Logoff >> "Audit Group Membership" with "Success" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000240',  
'C-73521r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN10-SO-000030) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*"

Compare the AuditPol settings with the following. 

If the system does not audit the following, this is a finding.

Logon/Logoff >> Group Membership - Success',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73459','SV-88111r1_rule','default','medium','Windows Server 2016 must be configured to audit Object Access - Removable Storage failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Removable Storage auditing under Object Access records events related to access attempts on file system objects on removable storage devices.',
'F-79901r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Security Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> Object Access >> "Audit Removable Storage" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000300',  
'C-73533r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN16-SO-000050) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following.

If the system does not audit the following, this is a finding.

Object Access >> Removable Storage - Failure

Virtual machines or systems that use network attached storage may generate excessive audit events for secondary virtual drives or the network attached storage when this setting is enabled. This may be set to Not Configured in such cases and would not be a finding.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73479','SV-88131r1_rule','default','medium','Windows Server 2016 must be configured to audit System - Other System Events failures.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Audit Other System Events records information related to cryptographic key operations and the Windows Firewall service.

Satisfies: SRG-OS-000327-GPOS-00127, SRG-OS-000458-GPOS-00203, SRG-OS-000463-GPOS-00207, SRG-OS-000468-GPOS-00212',
'F-79921r1_fix',
'Configure the policy value for Computer Configuration >> Windows Settings >> Advanced Audit Policy Configuration >> System Audit Policies >> System >> "Audit Other System Events" with "Failure" selected.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-AU-000400',  
'C-73553r1_chk',
'Security Option "Audit: Force audit policy subcategory settings (Windows Vista or later) to override audit policy category settings" must be set to "Enabled" (WN10-SO-000030) for the detailed auditing subcategories to be effective. 

Use the AuditPol tool to review the current Audit Policy configuration:

Open an elevated "Command Prompt" (run as administrator).

Enter "AuditPol /get /category:*".

Compare the AuditPol settings with the following. 

If the system does not audit the following, this is a finding.

System >> Other System Events - Failure',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73493','SV-88145r1_rule','default','medium','The display of slide shows on the lock screen must be disabled.',
'Slide shows that are displayed on the lock screen could display sensitive information to unauthorized personnel. Turning off this feature will limit access to the information to a logged-on user.',
'F-79935r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Control Panel >> Personalization >> "Prevent enabling lock screen slide show" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
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

select add_rule_data ('default','V-73497','SV-88149r1_rule','default','medium','WDigest Authentication must be disabled.',
'When the WDigest Authentication protocol is enabled, plain-text passwords are stored in the Local Security Authority Subsystem Service (LSASS), exposing them to theft. WDigest is disabled by default in Windows 10. This setting ensures this is enforced.',
'F-79939r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> MS Security Guide >> "WDigest Authentication (disabling may require KB2871997)" to "Disabled".

This policy setting requires the installation of the SecGuide custom templates included with the STIG package. "SecGuide.admx" and " SecGuide.adml" must be copied to the \Windows\PolicyDefinitions and \Windows\PolicyDefinitions\en-US directories respectively.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
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

select add_rule_data ('default','V-73507','SV-88159r1_rule','default','medium','Insecure logons to an SMB server must be disabled.',
'Insecure guest logons allow unauthenticated access to shared folders. Shared resources on a system must require authentication to establish proper access.',
'F-79949r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Network >> Lanman Workstation >> "Enable insecure guest logons" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000080',  
'C-73581r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\LanmanWorkstation\

Value Name: AllowInsecureGuestAuth

Type: REG_DWORD
Value: 0x00000000 (0)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73511','SV-88163r1_rule','default','medium','Command line data must be included in process creation events.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Enabling "Include command line data for process creation events" will record the command line information with the process creation events in the log. This can provide additional detail when malware has run on a system.',
'F-79953r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Audit Process Creation >> "Include command line in process creation events" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000100',  
'C-73585r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System\Audit\

Value Name: ProcessCreationIncludeCmdLine_Enabled

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73531','SV-88185r1_rule','default','medium','The network selection user interface (UI) must not be displayed on the logon screen.',
'Enabling interaction with the network selection UI allows users to change connections to available networks without signing in to Windows.',
'F-79973r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Logon >> "Do not display network selection UI" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
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

select add_rule_data ('default','V-73535','SV-88189r1_rule','default','medium','Windows Server 2016 must be configured to block untrusted fonts from loading.',
'Attackers may use fonts that include malicious code to compromise a system. This setting will prevent untrusted fonts, processed by the Graphics Device Interface (GDI), from loading if installed outside of the %windir%/Fonts directory.',
'F-79977r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> System >> Mitigation Options >> "Untrusted Font Blocking" to "Enabled" with "Block untrusted fonts and log events" selected in "Mitigation Options".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000200',  
'C-73609r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows NT\MitigationOptions\

Value Name: MitigationOptions_FontBocking

Type: REG_SZ
Value: 1000000000000 (1 with 12 zeros)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73551','SV-88215r1_rule','default','medium','Windows Telemetry must be configured to Security or Basic.',
'Some features may communicate with the vendor, sending system information or downloading data or components for the feature. Limiting this capability will prevent potentially sensitive information from being sent outside the enterprise. The "Security" option for Telemetry configures the lowest amount of data, effectively none outside of the Malicious Software Removal Tool (MSRT), Defender, and telemetry client settings. "Basic" sends basic diagnostic and usage data and may be required to support some Microsoft services.',
'F-80001r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Data Collection and Preview Builds>> "Allow Telemetry" to "Enabled" with "0 - Security [Enterprise Only]" or "1 - Basic" selected in "Options".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000290',  
'C-73633r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SOFTWARE\Policies\Microsoft\Windows\DataCollection\

Value Name: AllowTelemetry

Type: REG_DWORD
Value: 0x00000000 (0) (Security), 0x00000001 (1) (Basic)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73581','SV-88245r1_rule','default','medium','Indexing of encrypted files must be turned off.',
'Indexing of encrypted files may expose sensitive data. This setting prevents encrypted files from being indexed.',
'F-80031r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Search >> "Allow indexing of encrypted files" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
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

select add_rule_data ('default','V-73589','SV-88253r1_rule','default','medium','Automatically signing in the last interactive user after a system-initiated restart must be disabled.',
'Windows can be configured to automatically sign the user back in after a Windows Update restart. Some protections are in place to help ensure this is done in a secure fashion; however, disabling this will prevent the caching of credentials for this purpose and also ensure the user is aware of the restart.',
'F-80039r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows Logon Options >> "Sign-in last interactive user automatically after a system-initiated restart" to "Disabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
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

select add_rule_data ('default','V-73591','SV-88255r1_rule','default','medium','PowerShell script block logging must be enabled.',
'Maintaining an audit trail of system activity logs can help identify configuration errors, troubleshoot service disruptions, and analyze compromises that have occurred, as well as detect attacks. Audit logs are necessary to provide a trail of evidence in case the system or network is compromised. Collecting this data is essential for analyzing the security of information assets and detecting signs of suspicious and unexpected behavior.

Enabling PowerShell script block logging will record detailed information from the processing of PowerShell commands and scripts. This can provide additional detail when malware has run on a system.',
'F-80041r1_fix',
'Configure the policy value for Computer Configuration >> Administrative Templates >> Windows Components >> Windows PowerShell >> "Turn on PowerShell Script Block Logging" to "Enabled".',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-CC-000490',  
'C-73673r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE 
Registry Path: \SOFTWARE\ Policies\Microsoft\Windows\PowerShell\ScriptBlockLogging\

Value Name: EnableScriptBlockLogging

Value Type: REG_DWORD
Value: 0x00000001 (1)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73677','SV-88341r1_rule','default','medium','Remote calls to the Security Account Manager (SAM) must be restricted to Administrators.',
'The Windows Security Account Manager (SAM) stores users passwords. Restricting Remote Procedure Call (RPC) connections to the SAM to Administrators helps protect those credentials.',
'F-80127r1_fix',
'Navigate to the policy Computer Configuration >> Windows Settings >> Security Settings >> Local Policies >> Security Options >> "Network access: Restrict clients allowed to make remote calls to SAM". 
Select "Edit Security" to configure the "Security descriptor:".

Add "Administrators" in "Group or user names:" if it is not already listed (this is the default).

Select "Administrators" in "Group or user names:".

Select "Allow" for "Remote Access" in "Permissions for "Administrators".

Click "OK".

The "Security descriptor:" must be populated with "O:BAG:BAD:(A;;RC;;;BA) for the policy to be enforced.',
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)',
'Profile Customized by CloudRaxak',
'WN16-SO-000310',  
'C-73759r1_chk',
'If the following registry value does not exist or is not configured as specified, this is a finding.

Registry Hive: HKEY_LOCAL_MACHINE
Registry Path: \SYSTEM\CurrentControlSet\Control\Lsa\

Value Name: RestrictRemoteSAM

Value Type: REG_SZ
Value: O:BAG:BAD:(A;;RC;;;BA)',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-73000','SV-88343r1_rule','default','high','Microsoft Security Bulletin MS17-010 Critical should be Installed. (WannaCry)','This security update resolves vulnerabilities in Microsoft Windows. The most severe of the vulnerabilities could allow remote code execution if an attacker sends specially crafted messages to a Microsoft Server Message Block 1.0 (SMBv1) server.','F-62859r3_fix','            
Install Security Update KB4013429 for Microsoft Windows SMB Server.
Download Patch from here: https://technet.microsoft.com/en-us/library/security/ms17-010.aspx' , 
'Microsoft Windows Server 2016 DISA-MissionCriticalClassified_2016 (Beta)','Profile Customized by CloudRaxak','WN12-SO-000010','C-58479r1_chk','Open Control Panel next go to Programs  and then go to Programs and Features. Click on View installed Updates and check security updates.       
Check KB4013429 Critical Patch is Installed. If not then this is a finding.','Customized rule by Cloud Raxak') from dual;