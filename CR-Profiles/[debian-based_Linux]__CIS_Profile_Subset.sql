select add_profile_data ('[debian-based Linux] CIS Profile (Subset)' ,'Profile Customized by CloudRaxak' ,'Linux-based OS','' ,'2015-05-26' ,'Profile by Cloud Raxak') from dual;

select add_rule_data ('default','V-38437','SV-50237r1_rule','default','low','Automated file system mounting tools must not be enabled unless needed.','All filesystems that are required for the successful operation of the system should be explicitly listed in "/etc/fstab" by an administrator. New filesystems should not be arbitrarily introduced via the automounter.

The "autofs" daemon mounts and unmounts filesystems, such as user home directories shared via NFS, on demand. In addition, autofs can be used to handle removable media, and the default configuration provides the cdrom device as "/misc/cd". However, this method of providing access to removable media is not common, so autofs can almost always be disabled if NFS is not in use. Even if NFS is required, it is almost always possible to configure filesystem mounts statically by editing "/etc/fstab" rather than relying on the automounter.','F-43381r1_fix','If the "autofs" service is not needed to dynamically mount NFS filesystems or removable media, disable the service for all runlevels: 

  sysv-rc-conf --level 0123456S autofs off

Stop the service if it is already running: 

 service autofs stop' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000526','C-45991r1_chk','To verify the "autofs" service is not running:

 service autofs status

To verify the "autofs" service is disabled at system boot configuration, run the following command:

 sysv-rc-conf --list autofs

If properly configured, the output should be the following: 

autofs 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the autofs service is enabled or running, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38438','SV-50238r2_rule','default','low','Auditing must be enabled at boot by setting a kernel parameter.','Each process on the system carries an "auditable" flag which indicates whether its activities can be audited. Although "auditd" takes care of enabling this for all processes which launch after it does, adding the kernel argument ensures it is set for every process during boot.','F-43382r2_fix','To ensure all processes can be audited, even those which start prior to the audit daemon, add the argument "audit=1" to the kernel line in "/etc/default/grub", in the manner below:

GRUB_CMDLINE_LINUX="audit=1"

and run the following command to update the grub.

 update-grub


UEFI systems may prepend "/boot" to the "/vmlinuz-version" argument.

If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000525','C-45992r2_chk','Inspect the kernel boot arguments (which follow the word "GRUB_CMDLINE_LINUX") in "/etc/default/grub". If they include "audit=1", then auditing is enabled at boot time. 

If auditing is not enabled at boot time, this is a finding.

If auditd package is not installed then rule will install it before fixing changes.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38443','SV-50243r1_rule','default','medium','The /etc/gshadow file must be owned by root.','The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.','F-43388r1_fix','Run the below command to change the ownership of "/etc/gshadow" to root:

 chown root /etc/gshadow' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000036','C-45998r1_chk','To check the ownership of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/gshadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38444','SV-50244r2_rule','default','medium','The systems local IPv6 firewall must implement a deny-all, allow-by-exception policy for inbound packets.','In "ip6tables", default policy is applied only after all applicable rules in the table are examined for a match. Setting the default policy to "DROP" implements proper design for a firewall, i.e., any packets which are not explicitly permitted should not be accepted.','F-43389r3_fix','Note: Following steps may block you from accessing internet. Hence, make sure you run the commands cautiously.

To disable IPv6 module, add net.ipv6.conf.all.disable_ipv6 = 1 to following file

 /etc/sysctl.conf

and run the following command to reload settings from config files without rebooting the system.

 sysctl --system

To disable IPv6 module from GRUB, add following line in /etc/default/grub.

 GRUB_CMDLINE_LINUX="ipv6.disable=1"

and run the following command to update the grub.

 update-grub

Make sure you added rule to accept connections from CloudRaxak by using following command.

 ip6tables -A OUTPUT -m string --hex-string "|0A|cloudraxak|03|net" --algo bm -j ACCEPT

To set default policy to DROP for INPUT chain run following command.

 ip6tables -P INPUT DROP

Make sure all your iptables configuration is persistent.
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000523','C-45999r2_chk','Check if IPv6 module is enabled or not using the following command : 

 sysctl "net.ipv6.conf" | grep "disable_ipv6 = 0"

0 is enabled, 1 is disabled.

To verify if IPv6 is disabled in GRUB, run the following:

 grep -iw "ipv6.disable" /boot/grub/grub.cfg | grep -v "^\s*"

0 is enabled, 1 is disabled.

If IPv6 is disabled, this is not applicable.

Run the following command to determine the current status of the Firewall: 

 ip6tables -L 

Make sure default INPUT policy is set to DROP.

If the default input policy is not set to DROP, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38447','SV-50247r2_rule','default','low','The system package management tool must verify contents of all files associated with packages.','The hash on important files like system executables should match the information given by the RPM database. Executables with erroneous hashes could be a sign of nefarious activity on the system.','F-43392r1_fix','The Ubuntu package management system can check the hashes of installed software packages, including many that are important to system security. Run the following command to list which files on the system have hashes that differ from what is expected by the Ubuntu package management tool"s database:

 dpkg -V | awk "$1 ~ /..5/ ANDAND $2 != "c""

If the dpkg version is less than 1.17 then use the following command.

 debsums -c

If the file that has changed was not expected to then refresh from distribution media or online repositories.

 apt-get -y install --reinstall []' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000519','C-46002r3_chk','The following command will list which files on the system have file hashes different from what is expected by the Ubuntu package management tool"s database.

 dpkg -V | awk "$1 ~ /..5/ ANDAND $2 != "c""

If the dpkg version is less than 1.17 then use the following command.

 debsums -c

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38448','SV-50248r1_rule','default','medium','The /etc/gshadow file must be group-owned by root.','The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.','F-43393r1_fix','To change the group owner of "/etc/gshadow" to root, run the command: 

 chgrp root /etc/gshadow' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000037','C-46003r1_chk','To check the group ownership of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If properly configured, the output should be: File "/etc/gshadow" is group-owned by root.
 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38449','SV-50249r1_rule','default','medium','The /etc/gshadow file must have mode 0000.','The /etc/gshadow file contains group password hashes. Protection of this file is critical for system security.','F-43394r1_fix','To properly set the permissions of "/etc/gshadow", run the command: 

 chmod 0000 /etc/gshadow' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000038','C-46004r1_chk','To check the permissions of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38450','SV-50250r1_rule','default','medium','The /etc/passwd file must be owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43395r1_fix','Run the below command to change the ownership of "/etc/passwd" to root:  

 chown root /etc/passwd' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000039','C-46005r1_chk','To check the ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If its properly configured, the output should be displayed as shown below:

"File "/etc/passwd" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38451','SV-50251r1_rule','default','medium','The /etc/passwd file must be group-owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43396r1_fix','To change the group owner of "/etc/passwd" to root, run the command: 

 chgrp root /etc/passwd' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000040','C-46006r1_chk','To check the group ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should be: File "/etc/passwd" is group-owned by root.

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38456','SV-50256r1_rule','default','low','The system must use a separate file system for /var.','Ensuring that "/var" is mounted on its own partition enables the setting of more restrictive mount options. This helps protect system services such as daemons or other programs which use it. It is not uncommon for the "/var" directory to contain world-writable directories, installed by other software packages.','F-43401r2_fix','Ensuring that /var is mounted on its own partition enables the setting of more restrictive mount options. This helps protect system services such as daemons or other programs which use it. It is not uncommon for the /var directory to contain world-writable directories, installed by other software packages. Please create a separate file system for /var.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000002','C-46011r2_chk','Run the following command to determine if "/var" is on its own partition or logical volume: 

$ mount | grep "on /var "

If "/var" has its own partition or volume group, a line will be returned. 
If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38457','SV-50257r1_rule','default','medium','The /etc/passwd file must have mode 0644 or less permissive.','If the "/etc/passwd" file is writable by a group-owner or the world the risk of its compromise is increased. The file contains the list of accounts on the system and associated information, and protection of this file is critical for system security.','F-43397r1_fix','To properly set the permissions of "/etc/passwd", run the command: 

 chmod 0644 /etc/passwd' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000041','C-46007r1_chk','To check the permissions of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38458','SV-50258r1_rule','default','medium','The /etc/group file must be owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43403r1_fix','Run the below command to change the ownership of "/etc/group" to root:
 
 chown root /etc/group' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000042','C-46013r1_chk','To check the ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If its properly configured, the output should be displayed as shown below:

"File "/etc/group" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38459','SV-50259r1_rule','default','medium','The /etc/group file must be group-owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43404r1_fix','To change the group owner of "/etc/group" to root, run the command: 

 chgrp root /etc/group' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000043','C-46014r1_chk','To check the group ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should be: 

File "/etc/group" is group-owned by root.

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38461','SV-50261r1_rule','default','medium','The /etc/group file must have mode 0644 or less permissive.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43406r1_fix','To properly set the permissions of "/etc/group", run the command: 

 chmod 644 /etc/group' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000044','C-46015r1_chk','To check the permissions of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38463','SV-50263r1_rule','default','low','The system must use a separate file system for /var/log.','Placing "/var/log" in its own partition enables better separation between log files and other files in "/var/".','F-43408r1_fix','Placing /var/log in its own partition enables better separation between log files and other files in /var/log. Please create a separate file system for /var/log.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000003','C-46018r1_chk','Run the following command to determine if "/var/log" is on its own partition or logical volume: 

$ mount | grep "on /var/log "

If "/var/log" has its own partition or volume group, a line will be returned. 
If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38467','SV-50267r1_rule','default','low','The system must use a separate file system for the system audit data path.','Placing "/var/log/audit" in its own partition enables better separation between audit files and other files, and helps ensure that auditing cannot be halted due to the partition running out of space.','F-43412r1_fix','Placing "/var/log/audit" in its own partition enables better separation between audit files and other files, it helps to ensure that auditing cannot be halted due to the partition running out of space. Please create a separate file system for /var/log/audit.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000004','C-46022r1_chk','Run the following command to determine if "/var/log/audit" is on its own partition or logical volume: 

$ mount | grep "on /var/log/audit "

If "/var/log/audit" has its own partition or volume group, a line will be returned. 
If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38468','SV-50268r1_rule','default','medium','The audit system must take appropriate action when the audit storage volume is full.','Taking appropriate action in case of a filled audit storage volume will minimize the possibility of losing audit records.','F-43413r1_fix','The "auditd" service can be configured to take an action when disk space starts to run low. Edit the file "/etc/audit/auditd.conf". Modify the following line, substituting [] appropriately: 

disk_full_action = [ACTION]

Possible values for [ACTION] are described in the "auditd.conf" man page. These include: 

"ignore"
"syslog"
"exec"
"suspend"
"single"
"halt"


Set this to "syslog" or "exec".
If auditd package is not installed then rule will install it before fixing changes.
Reload the auditd.

$ service auditd reload' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000510','C-46023r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when the audit storage volume is full:

 grep -w disk_full_action /etc/audit/auditd.conf | grep -v "^"
disk_full_action = []


If the system is configured to except "syslog" or "exec" when the volume is full, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38473','SV-50273r1_rule','default','low','The system must use a separate file system for user home directories.','Ensuring that "/home" is mounted on its own partition enables the setting of more restrictive mount options, and also helps ensure that users cannot trivially fill partitions used for log or audit data storage.','F-43418r1_fix','Ensuring that "/home" mounted on its own partition enables the setting of more restrictive mount options and also helps to ensure that users cannot trivially fill partitions used for log or audit data storage. Please create a separate file system for "/home" directories.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000007','C-46028r1_chk','Run the following command to determine if "/home" is on its own partition or logical volume: 

$ mount | grep "on /home "

If "/home" has its own partition or volume group, a line will be returned. 
If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38475','SV-50275r1_rule','default','medium','The system must require passwords to contain a minimum of 14 characters.','Requiring a minimum password length makes password cracking attacks more difficult by ensuring a larger search space. However, any security benefit from an onerous requirement must be carefully weighed against usability problems, support costs, or counterproductive behavior that may result.

While it does not negate the password length requirement, it is preferable to migrate from a password-based authentication scheme to a stronger one based on PKI (public key infrastructure).','F-43419r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

To specify password length requirements for new accounts,
edit the file "/etc/pam.d/common-password" and update the minimum password length (minlen) parameter in the below line e.g:

password requisite pam_cracklib.so minlen=14 ucredit=0 lcredit=0 ocredit=0 dcredit=0

INFO: minlen should be >= 14 and the credits limit should be less or equal to 0 for the validation criteria in the rule.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000050','C-46029r1_chk','To check the minimum password length and to check the other settings required for the password authentication, run the command:

$ grep -v "^" /etc/pam.d/common-password | grep -w pam_cracklib.so | grep -w password

If minlen is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38476','SV-50276r3_rule','default','high','Vendor-provided cryptographic certificates must be installed to verify the integrity of system software.','The Red Hat GPG keys are necessary to cryptographically verify packages are from Red Hat.','F-43421r3_fix','To ensure the system can cryptographically verify base software packages installation. Use the command:
 apt-key update' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000008','C-46031r3_chk','To ensure that the keys are installed, run:

$ apt-key list 

The command should return the list of keys in ubuntu. If the keys are not installed, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38477','SV-50277r1_rule','default','medium','Users must not be able to change passwords more than once every 24 hours.','Setting the minimum password age protects against users cycling back to a favorite password after satisfying the password reuse requirement.','F-43422r1_fix','To specify password minimum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MIN_DAYS [DAYS]

A value of 1 day is considered sufficient for many environments. The DoD requirement is 1.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000051','C-46032r1_chk','To check the minimum password age, run the command: 

$ grep PASS_MIN_DAYS /etc/login.defs

The DoD requirement is 1. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38478','SV-50278r2_rule','default','low','The Red Hat Network Service (rhnsd) service must not be running, unless using RHN or an RHN Satellite.','Although systems management and patching is extremely important to system security, management by a system outside the enterprise enclave is not desirable for some environments. However, if the system is being managed by RHN or RHN Satellite Server the "rhnsd" daemon can remain on.','F-43423r2_fix','The Red Hat Network service automatically queries Red Hat Network servers to determine whether there are any actions that should be executed, such as package updates. This only occurs if the system was registered to an RHN server or satellite and managed as such. The "rhnsd" service can be disabled with the following commands: 

 sysv-rc-conf --level 0123456S rhnsd off
 service rhnsd stop' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000009','C-46033r2_chk','Run the following command to verify "rhnsd" is disabled through current runtime configuration: 

 service rhnsd status

To check that the "rhnsd" service is disabled in system boot configuration, run the following command: 

 sysv-rc-conf --list rhnsd

Output should indicate the "rhnsd" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf --list rhnsd

"rhnsd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the system uses RHN or an RHN Satellite, this is not applicable.

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38479','SV-50279r1_rule','default','medium','User passwords must be changed at least every 60 days.','Setting the password maximum age ensures users are required to periodically change their passwords. This could possibly decrease the utility of a stolen password. Requiring shorter password lifetimes increases the risk of users writing down the password in a convenient location subject to physical compromise.','F-43424r1_fix','To specify password maximum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MAX_DAYS [DAYS]

The DoD requirement is 60.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000053','C-46034r1_chk','To check the maximum password age, run the command: 

$ grep PASS_MAX_DAYS /etc/login.defs

The DoD requirement is 60. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38480','SV-50280r1_rule','default','low','Users must be warned 7 days in advance of password expiration.','Setting the password warning age enables users to make the change at a practical time.','F-43425r1_fix','To specify how many days prior to password expiration that a warning will be issued to users, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_WARN_AGE [DAYS]

The DoD requirement is 7.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000054','C-46035r1_chk','To check the password warning age, run the command: 

$ grep PASS_WARN_AGE /etc/login.defs

The DoD requirement is 7. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38481','SV-50281r1_rule','default','medium','System security patches and updates must be installed and up-to-date.','Installing software updates is a fundamental mitigation against the exploitation of publicly-known vulnerabilities.','F-43426r1_fix','If the system is joined to the Ubuntu Network, a Ubuntu Satellite Server, or a Ubuntu server, run the following command to install updates: 

The below command will list down all the packages which are need to upgraded in Ubuntu.
 /usr/lib/update-notifier/apt-check -p

We have to upgrade package wise:
 apt-get upgrade []

If the system is not configured to use one of these sources, updates can be manually downloaded from the Ubuntu Network and installed using "apt-get".' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000011','C-46036r1_chk','If the system is joined to the Ubuntu Network, a Ubuntu Satellite Server, or Ubuntu server which provides updates, invoking the following command will indicate if updates are available: 

The below command will list down all the packages which are need to upgraded in Ubuntu.
 /usr/lib/update-notifier/apt-check -p 

If updates are not installed, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38482','SV-50282r1_rule','default','low','The system must require passwords to contain at least one numeric character.','Requiring digits makes password guessing attacks more difficult by ensuring a larger search space.','F-43427r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

 apt-get -y install libpam-cracklib

The pam_cracklib module"s "dcredit" parameter controls requirements for usage of digits in a password. When set to a negative number, any password will be required to contain that many digits. When set to a positive number, pam_cracklib will grant +1 additional length credit for each digit. 
Add "dcredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a digit in password.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000056','C-46037r1_chk','To check how many digits are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "dcredit" parameter (as a negative number) will indicate how many digits are required. The requirement is at least one digit in a password. This would appear as "dcredit=-1". 
If dcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38483','SV-50283r1_rule','default','medium','The system package management tool must cryptographically verify the authenticity of system software packages during installation.','Ensuring the validity of packages" cryptographic signatures prior to installation ensures the provenance of the software and protects against malicious tampering.','F-43429r1_fix','Pass the --allow-unauthenticated option to apt-get as in: 

$ sudo apt-get --allow-unauthenticated upgrade

From the manual page of apt-get:

--allow-unauthenticated
Ignore if packages can"t be authenticated and don"t prompt about it. This is useful for tools like pbuilder. Configuration Item: APT::Get::AllowUnauthenticated.

You can make this setting permanent by using your own config file at /etc/apt/apt.conf.d/ directory. The filename can be 99myown and it may contain this line:

APT::Get::AllowUnauthenticated "true";' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000013','C-46039r1_chk','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering: 

$ grep -rwi AllowUnauthenticated /etc/apt/* | grep -v ":\s*"
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38489','SV-50290r1_rule','default','medium','A file integrity tool aide must be installed.','The AIDE package must be installed if it is to be available for integrity checking.','F-43436r1_fix','Install the aide, aide-common packages with the commands: 

 apt-get -y install aide

 apt-get -y install aide-common' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000016','C-46046r1_chk','Run the following command to determine if the "aide", "aide-common" packages are installed: 

 dpkg -s aide

 dpkg -s aide-common

If the packages are not installed, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38491','SV-50292r1_rule','default','high','There must be no .rhosts or hosts.equiv files on the system.','Trust files are convenient, but when used in conjunction with the R-services, they can allow unauthenticated access to a system.','F-43438r1_fix','The files "/etc/hosts.equiv" and "~/.rhosts" (in each user"s home directory) list remote hosts and users that are trusted by the local system when using the rshd daemon. To remove these files, run the following command to delete them from any location. 

 find /root /home -iname ".rhosts" -type f | xargs rm {} 2>/dev/null
 find /etc -iname "hosts.equiv" -type f | xargs rm {} 2>/dev/null
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000019','C-46048r1_chk','The existence of the file named "hosts.equiv" or ".rhosts" inside a user home directory indicates the presence of an Rsh trust relationship, use the command:
 find /root /home -iname ".rhosts" -type f
 find /etc -iname "hosts.equiv" -type f

If these files exist, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38497','SV-50298r2_rule','default','high','The system must not have accounts configured with blank or null passwords.','If an account has an empty password, anyone could log in and run commands with the privileges of that account. Accounts with empty passwords should never be used in operational environments.','F-43444r4_fix','If an account is configured for password authentication but does not have an assigned password, it may be possible to log onto the account without authentication. Remove any instances of the "nullok" option in "/etc/pam.d/common-auth" to prevent logons with empty passwords.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000030','C-46054r2_chk','To verify that null passwords cannot be used, run the following command: 

 grep -w nullok /etc/pam.d/common-auth | grep -v "^"

If this produces any output, it may be possible to log into accounts with empty passwords. 
If NULL passwords can be used, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38500','SV-50301r2_rule','default','medium','The root account must be the only account having a UID of 0.','An account has root authority if it has a UID of 0. Multiple accounts with a UID of 0 afford more opportunity for potential intruders to guess a password for a privileged account. Proper configuration of sudo is recommended to afford multiple system administrators access to root privileges in an accountable manner.','F-43447r1_fix','If any account other than root has a UID of 0, this misconfiguration should be investigated. then that uid needs to be changed due to this reason rule is moved to manual.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000032','C-46057r2_chk','To list all password file entries for accounts with UID 0, run the following command: 

 awk -F: "($3 == "0") {print}" /etc/passwd | grep -v "^"

This should print only one line, for the user root. 
If any account other than root has a UID of 0, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38502','SV-50303r1_rule','default','medium','The /etc/shadow file must be owned by root.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43449r1_fix','Run the below command to change the ownership of "/etc/shadow" to root:

 chown root /etc/shadow' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000033','C-46059r1_chk','To check the ownership of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/shadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38503','SV-50304r1_rule','default','medium','The /etc/shadow file must be group-owned by root.','The "/etc/shadow" file stores password hashes. Protection of this file is critical for system security.','F-43450r1_fix','To change the group owner of "/etc/shadow" to root, run the command: 

 chgrp root /etc/shadow' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000034','C-46060r1_chk','To check the group ownership of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If properly configured, the output should be: File "/etc/shadow" is group-owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38504','SV-50305r1_rule','default','medium','The /etc/shadow file must have mode 0000.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43451r1_fix','To properly set the permissions of "/etc/shadow", run the command: 

 chmod 0000 /etc/shadow' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000035','C-46061r2_chk','To check the permissions of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38511','SV-50312r2_rule','default','medium','IP forwarding for IPv4 must not be enabled, unless the system is a router.','IP forwarding permits the kernel to forward packets from one network interface to another. The ability to forward packets between two networks is only appropriate for systems acting as routers.','F-43458r2_fix','To set the runtime status of the "net.ipv4.conf.all.forwarding" kernel parameter, 
run the following command: 

 sysctl -w net.ipv4.conf.all.forwarding=0

To make this configuration persistent, add the following line in "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.forwarding = 0

and run following command. 

 sysctl -p 

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000082','C-46068r3_chk','Check if IP forwarding for IPv4 is enabled on the system, by querying the following command: 

 sysctl net.ipv4.conf.all.forwarding

If the output of the command is not "0", this is a finding. 

Verify the value of net.ipv4.conf.all.forwarding in "/etc/sysctl.conf". 

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38513','SV-50314r1_rule','default','medium','The systems local IPv4 firewall must implement a deny-all, allow-by-exception policy for inbound packets.','In "iptables", default policy is applied only after all applicable rules in the table are examined for a match. Setting the default policy to "DROP" implements proper design for a firewall, i.e., any packets which are not explicitly permitted should not be accepted.','F-43460r1_fix','Note: Following steps may block you from accessing internet. Hence, make sure you run the commands cautiously.

Make sure you added rule to accept connections from CloudRaxak by using following command.

 iptables -A INPUT -m string --hex-string "|0A|cloudraxak|03|net" --algo bm -j ACCEPT

To set default policy to DROP for INPUT chain run following command.

 iptables -P INPUT DROP

Make sure all your iptables configuration is persistent.

' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000120','C-46070r1_chk','Run the following command to determine the current status of the Firewall:
 iptables -L

Make sure default INPUT policy is set to DROP.

Also make sure your iptables configuration is persistent. 

If the default input policy is not set to DROP, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38514','SV-50315r3_rule','default','medium','The Datagram Congestion Control Protocol (DCCP) must be disabled unless required.','Disabling DCCP protects the system against exploitation of any flaws in its implementation.','F-43461r3_fix','The Datagram Congestion Control Protocol (DCCP) is a relatively new transport layer protocol, designed to support streaming media and telephony. To configure the system to prevent the "dccp" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": (Note: File should have .conf extension.)

$ install dccp /bin/true

To disable the dccp module run following command:

$ rmmod dccp
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000124','C-46071r3_chk','If the system is configured to prevent the loading of the "dccp" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr dccp /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38515','SV-50316r3_rule','default','medium','The Stream Control Transmission Protocol (SCTP) must be disabled unless required.','Disabling SCTP protects the system against exploitation of any flaws in its implementation.','F-43462r3_fix','The Stream Control Transmission Protocol (SCTP) is a transport layer protocol, designed to support the idea of message-oriented communication, with several streams of messages within one connection. To configure the system to prevent the "sctp" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": (Note: File should have .conf extension.)

$ install sctp /bin/true

To disable the sctp module run following command:

$ rmmod sctp
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000125','C-46072r3_chk','If the system is configured to prevent the loading of the "sctp" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr sctp /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38516','SV-50317r3_rule','default','low','The Reliable Datagram Sockets (RDS) protocol must be disabled unless required.','Disabling RDS protects the system against exploitation of any flaws in its implementation.','F-43463r4_fix','The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to provide reliable high-bandwidth, low-latency communications between nodes in a cluster. To configure the system to prevent the "rds" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d":(Note: File should have .conf extension.)

$ install rds /bin/true

To disable the rds module run following command:

$ rmmod rds
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000126','C-46073r3_chk','If the system is configured to prevent the loading of the "rds" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr rds /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38517','SV-50318r3_rule','default','medium','The Transparent Inter-Process Communication (TIPC) protocol must be disabled unless required.','Disabling TIPC protects the system against exploitation of any flaws in its implementation.','F-43464r3_fix','The Transparent Inter-Process Communication (TIPC) protocol is designed to provide communications between nodes in a cluster. To configure the system to prevent the "tipc" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d":(Note: File should have .conf extension.) 

$ install tipc /bin/true

To disable the tipc module run following command:

$ rmmod tipc
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000127','C-46074r3_chk','If the system is configured to prevent the loading of the "tipc" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr tipc /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38520','SV-50321r1_rule','default','medium','The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited.','A log server (loghost) receives syslog messages from one or more systems. This data can be used as an additional log source in the event a system is compromised and its local logs are suspect. Forwarding log messages to a remote loghost also provides system administrators with a centralized place to view the status of multiple hosts within the enterprise.','F-43468r1_fix','To configure rsyslog to send logs to a remote log server, open "/etc/rsyslog.conf" and read and understand the last section of the file, which describes the multiple directives necessary to activate remote logging. Along with these other directives, the system can be configured to forward its logs to a particular log server by adding or correcting one of the following lines, substituting "[]" appropriately. The choice of protocol depends on the environment of the system; although TCP and RELP provide more reliable message delivery, they may not be supported in all environments. 
To use UDP for log message delivery: 

*.* @[loghost.example.com]


To use TCP for log message delivery: 

*.* @@[loghost.example.com]


To use RELP for log message delivery: 

*.* :omrelp:[loghost.example.com]' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000136','C-46078r1_chk','To ensure logs are sent to a remote host, examine the file "/etc/rsyslog.conf". If using UDP, a line similar to the following should be present: 

*.* @[]

If using TCP, a line similar to the following should be present: 

*.* @@[loghost.example.com]

If using RELP, a line similar to the following should be present: 

*.* :omrelp:[loghost.example.com]


If none of these are present, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38522','SV-50323r3_rule','default','low','The audit system must be configured to audit all attempts to alter system time through settimeofday.','Arbitrary changes to the system time can be used to obfuscate nefarious activities in log files, as well as to confuse network services that are highly dependent upon an accurate system time (such as sshd). All changes to the system time should be audited.','F-43470r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

On a 32-bit system, add the following to "/etc/audit/audit.rules": 

 audit_time_rules
-a always,exit -F arch=b32 -S settimeofday -k audit_time_rules

On a 64-bit system, add the following to "/etc/audit/audit.rules": 

 audit_time_rules
-a always,exit -F arch=b64 -S settimeofday -k audit_time_rules

The -k option allows for the specification of a key in string form that can be used for better reporting capability through ausearch and aureport. Multiple system calls can be defined on the same line to save space if desired, but is not required. See an example of multiple combined syscalls: 

-a always,exit -F arch=b64 -S adjtimex -S settimeofday -S clock_settime -k audit_time_rules

Now, to get recently added audit rules into effect run the following command: 

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000167','C-46080r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "settimeofday" system call, run the following command:

$ sudo grep -w "settimeofday" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. 

If the system is not configured to audit time changes, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38523','SV-50324r2_rule','default','medium','The system must not accept IPv4 source-routed packets on any interface.','Accepting source-routed packets in the IPv4 protocol has few legitimate uses. It should be disabled unless it is absolutely required.','F-43471r1_fix','To reject IPv4 source-routed packets on all interface, run the following commands.

 sysctl -w net.ipv4.conf.all.accept_source_route=0

 sysctl -w net.ipv4.conf.default.accept_source_route=0

 sysctl -w net.ipv4.conf.eth0.accept_source_route=0

 sysctl -w net.ipv4.conf.lo.accept_source_route=0

To make this configuration persistent, set the following interfaces in "/etc/sysctl.conf" file.

net.ipv4.conf.all.accept_source_route = 0

net.ipv4.conf.default.accept_source_route = 0

net.ipv4.conf.eth0.accept_source_route = 0

net.ipv4.conf.lo.accept_source_route = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000083','C-46081r3_chk','Check if system is configured to reject IPv4 source-routed packets on any interface, by querying the following command:

 sysctl "net.ipv4.conf" 2>/dev/null | grep "\.accept_source_route = 1"

If any value is not set to "0", this is a finding

Verify the interface values

net.ipv4.conf.all.accept_source_route

net.ipv4.conf.default.accept_source_route

net.ipv4.conf.eth0.accept_source_route

net.ipv4.conf.lo.accept_source_route

in "/etc/sysctl.conf".

If any one is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38526','SV-50327r2_rule','default','medium','The system must not accept ICMPv4 secure redirect packets on any interface.','Accepting "secure" ICMP redirects (from those gateways listed as default gateways) has few legitimate uses. It should be disabled unless it is absolutely required.','F-43474r1_fix','To configure the system to reject ICMPv4 secure redirect packets on all interfaces, run the following commands.

 sysctl -w net.ipv4.conf.all.secure_redirects=0

 sysctl -w net.ipv4.conf.default.secure_redirects=0

 sysctl -w net.ipv4.conf.eth0.secure_redirects=0

 sysctl -w net.ipv4.conf.lo.secure_redirects=0

To make this configuration persistent, add the following lines in "/etc/sysctl.conf" file.

net.ipv4.conf.all.secure_redirects=0

net.ipv4.conf.default.secure_redirects=0

net.ipv4.conf.eth0.secure_redirects=0

net.ipv4.conf.lo.secure_redirects=0

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000086','C-46084r2_chk','To check if system accepts ICMPv4 secure redirect packets on any interface, run the following command:

 sysctl "net.ipv4.conf" 2>/dev/null | grep "\.secure_redirects = 1"

If the output of the command is not "0", this is a finding.

Verify the interface values 

net.ipv4.conf.all.secure_redirects

net.ipv4.conf.default.secure_redirects

net.ipv4.conf.eth0.secure_redirects

net.ipv4.conf.lo.secure_redirects

in "/etc/sysctl.conf".

If any one is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38527','SV-50328r3_rule','default','low','The audit system must be configured to audit all attempts to alter system time through clock_settime.','Arbitrary changes to the system time can be used to obfuscate nefarious activities in log files, as well as to confuse network services that are highly dependent upon an accurate system time (such as sshd). All changes to the system time should be audited.','F-43475r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.


On a 32-bit system, add the following to "/etc/audit/audit.rules": 

 audit_time_rules
-a always,exit -F arch=b32 -S clock_settime -k audit_time_rules

On a 64-bit system, add the following to "/etc/audit/audit.rules": 

 audit_time_rules
-a always,exit -F arch=b64 -S clock_settime -k audit_time_rules

The -k option allows for the specification of a key in string form that can be used for better reporting capability through ausearch and aureport. Multiple system calls can be defined on the same line to save space if desired, but is not required. See an example of multiple combined syscalls: 

-a always,exit -F arch=b64 -S adjtimex -S settimeofday -S clock_settime -k audit_time_rules

Now, to get recently added audit rules into effect run the following command: 

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000171','C-46085r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "clock_settime" system call, run the following command:

$ sudo grep -w "clock_settime" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. 

If the system is not configured to audit time changes, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38528','SV-50329r2_rule','default','low','The system must log Martian packets.','The presence of "martian" packets (which have impossible addresses) as well as spoofed packets, source-routed packets, and redirects could be a sign of nefarious network activity. Logging these packets enables this activity to be detected.','F-43476r1_fix','To configure the system to log Martian packets, run the following commands:

 sysctl -w net.ipv4.conf.all.log_martians=1

 sysctl -w net.ipv4.conf.default.log_martians=1

 sysctl -w net.ipv4.conf.eth0.log_martians=1

 sysctl -w net.ipv4.conf.lo.log_martians=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.log_martians = 1

net.ipv4.conf.default.log_martians=1

net.ipv4.conf.eth0.log_martians=1

net.ipv4.conf.lo.log_martians=1

and run following command.

 sysctl -p

or restart sysctl' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000088','C-46086r3_chk','Check if the system is configured to log Martian packets, by querying the following command:

 sysctl net.ipv4.conf 2>/dev/null | grep "log_martians = 0"

If the output of the command is not "1", this is a finding.

Verify the values of 

net.ipv4.conf.all.log_martians

net.ipv4.conf.all.log_martians

net.ipv4.conf.default.log_martians

net.ipv4.conf.eth0.log_martians

net.ipv4.conf.lo.log_martians

in "/etc/sysctl.conf".

If any one is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38529','SV-50330r2_rule','default','medium','The system must not accept IPv4 source-routed packets by default.','Accepting source-routed packets in the IPv4 protocol has few legitimate uses. It should be disabled unless it is absolutely required.','F-43478r1_fix','To set the runtime status of the "net.ipv4.conf.default.accept_source_route" kernel parameter, run the following command:

 sysctl -w net.ipv4.conf.default.accept_source_route=0

To make this configuration persistent, add the following line to "/etc/sysctl.conf":

net.ipv4.conf.default.accept_source_route = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000089','C-46088r2_chk','Check if system is configured to reject IPv4 source-routed packets by default, by running the following command:

 sysctl net.ipv4.conf.default.accept_source_route

If the output of the command is not "0", this is a finding.

Verify the value of net.ipv4.conf.default.accept_source_route in "/etc/sysctl.conf".

If net.ipv4.conf.default.accept_source_route is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38531','SV-50332r1_rule','default','low','The operating system must automatically audit account creation.','In addition to auditing new user and group accounts, these watches will alert the system administrator(s) to any modifications. Any unexpected users, groups, or modifications should be investigated for legitimacy.','F-43480r1_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules", in order to capture events that modify account changes: 

 audit_account_changes
-w /etc/group -p wa -k audit_account_changes
-w /etc/passwd -p wa -k audit_account_changes
-w /etc/gshadow -p wa -k audit_account_changes
-w /etc/shadow -p wa -k audit_account_changes
-w /etc/security/opasswd -p wa -k audit_account_changes

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000174','C-46090r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit account changes, run the following command: 

auditctl -l | egrep "(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)"

If the system is configured to watch for account changes, lines should be returned for each file specified (and with "perm=wa" for each). 
If the system is not configured to audit account changes, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38532','SV-50333r2_rule','default','medium','The system must not accept ICMPv4 secure redirect packets by default.','Accepting "secure" ICMP redirects (from those gateways listed as default gateways) has few legitimate uses. It should be disabled unless it is absolutely required.','F-43479r1_fix','To set the runtime status of the "net.ipv4.conf.default.secure_redirects" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.default.secure_redirects=0

To make this configuration persistent, add the following line to "/etc/sysctl.conf": 

net.ipv4.conf.default.secure_redirects = 0

and run following command. 

 sysctl -p 

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000090','C-46089r2_chk','Check if the system is configured to reject ICMPv4 secure redirect packets by default, by querying the following command: 

 sysctl net.ipv4.conf.default.secure_redirects

If the output of the command is not "0", this is a finding. 

Verify the value of net.ipv4.conf.default.secure_redirects in "/etc/sysctl.conf". 

If net.ipv4.conf.default.secure_redirects is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38535','SV-50336r2_rule','default','low','The system must not respond to ICMPv4 sent to a broadcast address.','Ignoring ICMP echo requests (pings) sent to broadcast or multicast addresses makes the system slightly more difficult to enumerate on the network.','F-43483r1_fix','To set the runtime status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter, run the following command: 

 sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf": 

net.ipv4.icmp_echo_ignore_broadcasts = 1

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000092','C-46093r2_chk','The status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter can be queried by running the following command:

 sysctl net.ipv4.icmp_echo_ignore_broadcasts

The output of the command should indicate a value of "1". If this value is not the value, this is a finding.

Verify the value of net.ipv4.icmp_echo_ignore_broadcasts in "/etc/sysctl.conf".

If is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38536','SV-50337r1_rule','default','low','The operating system must automatically audit account disabling actions.','In addition to auditing new user and group accounts, these watches will alert the system administrator(s) to any modifications. Any unexpected users, groups, or modifications should be investigated for legitimacy.','F-43484r1_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules", in order to capture events that modify account changes: 

 audit_account_changes
-w /etc/group -p wa -k audit_account_changes
-w /etc/passwd -p wa -k audit_account_changes
-w /etc/gshadow -p wa -k audit_account_changes
-w /etc/shadow -p wa -k audit_account_changes
-w /etc/security/opasswd -p wa -k audit_account_changes

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000176','C-46094r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit account changes, run the following command: 

auditctl -l | egrep "(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)"

If the system is configured to watch for account changes, lines should be returned for each file specified (and with "perm=wa" for each). 
If the system is not configured to audit account changes, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38537','SV-50338r2_rule','default','low','The system must ignore ICMPv4 bogus error responses.','Ignoring bogus ICMP error responses reduces log size, although some activity would not be logged.','F-43485r1_fix','To set the runtime status of the "net.ipv4.icmp_ignore_bogus_error_responses" kernel parameter, run the following command: 

 sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1

If this is not the system"s default value, add the following line to "/etc/sysctl.conf": 

net.ipv4.icmp_ignore_bogus_error_responses = 1

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000093','C-46095r2_chk','The status of the "net.ipv4.icmp_ignore_bogus_error_responses" kernel parameter can be queried by running the following command:

 sysctl net.ipv4.icmp_ignore_bogus_error_responses

The output of the command should indicate a value of "1". If this value is not the default value, investigate how it could have been adjusted at runtime, and verify it is not set improperly in "/etc/sysctl.conf".

 grep net.ipv4.icmp_ignore_bogus_error_responses /etc/sysctl.conf

If the correct value is not returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38538','SV-50339r1_rule','default','low','The operating system must automatically audit account termination.','In addition to auditing new user and group accounts, these watches will alert the system administrator(s) to any modifications. Any unexpected users, groups, or modifications should be investigated for legitimacy.','F-43486r1_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules", in order to capture events that modify account changes: 

 audit_account_changes
-w /etc/group -p wa -k audit_account_changes
-w /etc/passwd -p wa -k audit_account_changes
-w /etc/gshadow -p wa -k audit_account_changes
-w /etc/shadow -p wa -k audit_account_changes
-w /etc/security/opasswd -p wa -k audit_account_changes

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000177','C-46096r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit account changes, run the following command: 

auditctl -l | egrep "(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)"

If the system is configured to watch for account changes, lines should be returned for each file specified (and with "perm=wa" for each). 
If the system is not configured to audit account changes, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38539','SV-50340r2_rule','default','medium','The system must be configured to use TCP syncookies when experiencing a TCP SYN flood.','A TCP SYN flood attack can cause a denial of service by filling a system"s TCP connection table with connections in the SYN_RCVD state. Syncookies can be used to track a connection when a subsequent ACK is received, verifying the initiator is attempting a valid connection and is not a flood source. This feature is activated when a flood condition is detected, and enables the system to continue servicing valid connection requests.','F-43487r1_fix','To set the runtime status of the "net.ipv4.tcp_syncookies" kernel parameter, run the following command:

 sysctl -w net.ipv4.tcp_syncookies=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf":

net.ipv4.tcp_syncookies = 1

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000095','C-46097r2_chk','Check if the system is configured to use TCP syncookies when experiencing a TCP SYN flood, by querying the following command:

 sysctl net.ipv4.tcp_syncookies

If the output of the command is not "1", this is a finding.

verify the value of net.ipv4.tcp_syncookies in "/etc/sysctl.conf".

If net.ipv4.tcp_syncookies is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38540','SV-50341r2_rule','default','low','The audit system must be configured to audit modifications to the systems network configuration.','The network environment should not be modified by anything other than administrator action. Any change to network parameters should be audited.','F-43488r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 

 audit_network_modifications
-a always,exit -F arch=ARCH -S sethostname -S setdomainname -k audit_network_modifications
-w /etc/issue -p wa -k audit_network_modifications
-w /etc/issue.net -p wa -k audit_network_modifications
-w /etc/hosts -p wa -k audit_network_modifications
-w /etc/network/interfaces -p wa -k audit_network_modifications

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000182','C-46098r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit changes to its network configuration, run the following command: 

auditctl -l | egrep "(sethostname|setdomainname|/etc/issue|/etc/issue.net|/etc/hosts|/etc/network/interfaces)"

If the system is configured to watch for network configuration changes, a line should be returned for each file specified (and "perm=wa" should be indicated for each). 
If the system is not configured to audit changes of the network configuration, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38541','SV-50342r1_rule','default','low','The audit system must be configured to audit modifications to the systems Mandatory Access Control (MAC) configuration (apparmor).','The system"s mandatory access policy (SELinux) should not be arbitrarily changed by anything other than administrator action. All changes to MAC policy should be audited.','F-43489r1_fix','Add the following to "/etc/audit/audit.rules":

-w /etc/apparmor/ -p wa -k MAC-policy

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000183','C-46099r1_chk','To determine if the system is configured to audit changes to its MAC configuration files, run the following command:

 grep -w "/etc/apparmor" /etc/audit/audit.rules

If the system is configured to watch for changes to its MAC configuration, a line should be returned (including "perm=wa" indicating permissions that are watched).
If the system is not configured to audit attempts to change the MAC policy, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38542','SV-50343r2_rule','default','medium','The system must use a reverse-path filter for IPv4 network traffic when possible on all interfaces.','Enabling reverse path filtering drops packets with source addresses that should not have been able to be received on the interface they were received on. It should not be used on systems which are routers for complicated networks, but is helpful for end hosts and routers serving small networks.','F-43490r1_fix','To set the runtime status of the "net.ipv4.conf.all.rp_filter" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.all.rp_filter=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.rp_filter = 1 

To make this configuration persistent, run following command. 

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000096','C-46100r2_chk','Check if system is configured to use the reverse-path filter for IPv4 network traffic on all interfaces enabled

on the system, by querying the following command:

 sysctl net.ipv4.conf.all.rp_filter

If the output of the command is not "1", this is a finding.

Verify the value of net.ipv4.conf.all.rp_filter in "/etc/sysctl.conf".

If it"s not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38543','SV-50344r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using chmod.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43491r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S chmod -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S chmod -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S chmod -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S chmod -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000184','C-46101r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "chmod" system call, run the following command:

$ sudo grep -w "chmod" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If the system is not configured to audit permission changes, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38544','SV-50345r2_rule','default','medium','The system must use a reverse-path filter for IPv4 network traffic when possible by default.','Enabling reverse path filtering drops packets with source addresses that should not have been able to be received on the interface they were received on. It should not be used on systems which are routers for complicated networks, but is helpful for end hosts and routers serving small networks.','F-43492r1_fix','To set the runtime status of the "net.ipv4.conf.default.rp_filter" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.default.rp_filter=1

If this is not the system"s default value, add the following line to "/etc/sysctl.conf": 

net.ipv4.conf.default.rp_filter = 1

To make this configuration persistent, run following command. 

 sysctl -p 

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000097','C-46102r2_chk','Check if the system is configured to use TCP syncookies when experiencing a TCP SYN flood, by querying the following command: 

 sysctl -a 2>/dev/null | grep "net.ipv4.conf.default.rp_filter = 1"

If the output of the command is not "1", this is a finding. 

Verify the value of net.ipv4.conf.default.rp_filter in "/etc/sysctl.conf". 

If net.ipv4.conf.default.rp_filter is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38545','SV-50346r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using chown.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43493r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S chown -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S chown -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S chown -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S chown -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000185','C-46103r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "chown" system call, run the following command:

$ sudo grep -w "chown" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines.

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38546','SV-50347r2_rule','default','medium','The IPv6 protocol handler must not be bound to the network stack unless needed.','Any unnecessary network stacks - including IPv6 - should be disabled, to reduce the vulnerability to exploitation.','F-43494r2_fix','To disable IPv6 module, add net.ipv6.conf.all.disable_ipv6 = 1 to following file

 /etc/sysctl.conf

and run the following command to reload settings from config files without rebooting the system.

 sysctl --system

To disable IPv6 module from GRUB, add following line in /etc/default/grub.

 GRUB_CMDLINE_LINUX="ipv6.disable=1"

and run the following command to update the grub.

 update-grub
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000098','C-46104r2_chk','Check if IPv6 module is enabled or not using the following command :

 sysctl "net.ipv6.conf" | grep "disable_ipv6 = 0"

0 is enabled, 1 is disabled.

To verify if IPv6 is disabled in GRUB, run the following:

 grep -iw "ipv6.disable" /boot/grub/grub.cfg | grep -v "^\s*"

0 is enabled, 1 is disabled.

If IPv6 is disabled, this is not applicable.

Run the following command to determine if there is connection established on IPv6:

 ss -6taupn | grep ESTAB

tcpESTAB00fe80::5054:ff:fe3e:21e6%eth0:22fe80::dacb:8aff:fe28:298e:39604  users:(("sshd",pid=2525,fd=3),("sshd",pid=2523,fd=3))

If you get output like above, this rule is not applicable.

If ipv6 is enabled and not in use, this is the finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38547','SV-50348r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using fchmod.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43495r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S fchmod -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S fchmod -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S fchmod -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S fchmod -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000186','C-46105r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "fchmod" system call, run the following command:

$ sudo grep -w "fchmod" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38550','SV-50351r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using fchmodat.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43498r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.


At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S fchmodat -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S fchmodat -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S fchmodat -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S fchmodat -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000187','C-46108r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "fchmodat" system call, run the following command:

$ sudo grep -w "fchmodat" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38552','SV-50353r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using fchown.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43500r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S fchown -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S fchown -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S fchown -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S fchown -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000188','C-46110r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "fchown" system call, run the following command:

$ sudo grep -w "fchown" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38554','SV-50355r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using fchownat.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43502r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S fchownat -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S fchownat -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S fchownat -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S fchownat -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000189','C-46112r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "fchownat" system call, run the following command:

$ sudo grep -w "fchownat" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38556','SV-50357r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using fremovexattr.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43504r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S fremovexattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S fremovexattr -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S fremovexattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S fremovexattr -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000190','C-46114r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "fremovexattr" system call, run the following command:

$ sudo grep -w "fremovexattr" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38557','SV-50358r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using fsetxattr.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43505r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S fsetxattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S fsetxattr -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S fsetxattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S fsetxattr -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000191','C-46115r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "fsetxattr" system call, run the following command:

$ sudo grep -w "fsetxattr" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38558','SV-50359r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using lchown.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43506r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S lchown -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S lchown -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S lchown -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S lchown -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000192','C-46116r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "lchown" system call, run the following command:

$ sudo grep -w "lchown" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38559','SV-50360r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using lremovexattr.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43507r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S lremovexattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S lremovexattr -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S lremovexattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S lremovexattr -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000193','C-46117r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "lremovexattr" system call, run the following command:

$ sudo grep -w "lremovexattr" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38561','SV-50362r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using lsetxattr.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43509r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S lsetxattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S lsetxattr -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S lsetxattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S lsetxattr -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000194','C-46119r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "lsetxattr" system call, run the following command:

$ sudo grep -w "lsetxattr" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38563','SV-50364r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using removexattr.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43511r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S removexattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S removexattr -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S removexattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S removexattr -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000195','C-46121r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "removexattr" system call, run the following command:

$ sudo grep -w "removexattr" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38565','SV-50366r3_rule','default','low','The audit system must be configured to audit all discretionary access control permission modifications using setxattr.','The changing of file permissions could indicate that a user is attempting to gain access to information that would otherwise be disallowed. Auditing DAC modifications can facilitate the identification of patterns of abuse among both authorized and unauthorized users.','F-43513r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file permission changes for all users and root. Add the following to "/etc/audit/audit.rules": 

-a always,exit -F arch=b32 -S setxattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b32 -S setxattr -F auid=0 -k perm_mod

If the system is 64-bit, then also add the following: 

-a always,exit -F arch=b64 -S setxattr -F auid>=500 -F auid!=4294967295 \
-k perm_mod
-a always,exit -F arch=b64 -S setxattr -F auid=0 -k perm_mod

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000196','C-46123r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "setxattr" system call, run the following command:

$ sudo grep -w "setxattr" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38566','SV-50367r2_rule','default','low','The audit system must be configured to audit failed attempts to access files and programs.','Unsuccessful attempts to access files could be an indicator of malicious activity on a system. Auditing these events could serve as evidence of potential system compromise.','F-43514r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect unauthorized file accesses for all users and root. Add the following to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 

-a always,exit -F arch=ARCH -S creat -S open -S openat -S truncate \
-S ftruncate -F exit=-EACCES -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=ARCH -S creat -S open -S openat -S truncate \
-S ftruncate -F exit=-EPERM -F auid>=500 -F auid!=4294967295 -k access
-a always,exit -F arch=ARCH -S creat -S open -S openat -S truncate \
-S ftruncate -F exit=-EACCES -F auid=0 -k access
-a always,exit -F arch=ARCH -S creat -S open -S openat -S truncate \
-S ftruncate -F exit=-EPERM -F auid=0 -k access

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000197','C-46124r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To verify that the audit system collects unauthorized file accesses, run the following commands: 

 grep EACCES /etc/audit/audit.rules



 grep EPERM /etc/audit/audit.rules


If either command lacks output, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38567','SV-50368r4_rule','default','low','The audit system must be configured to audit all use of setuid and setgid programs.','Privileged programs are subject to escalation-of-privilege attacks, which attempt to subvert their normal role of providing some necessary but limited capability. As such, motivation exists to monitor these programs for unusual activity.','F-43515r6_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.


At a minimum, the audit system should collect the execution of privileged commands for all users and root. To find the relevant setuid / setgid programs, run the following command for each local partition []:

$ sudo find [PART] -xdev -type f -perm /6000 2>/dev/null

Then, for each setuid / setgid program on the system, add a line of the following form to "/etc/audit/audit.rules", where [SETUID_PROG_PATH] is the full path to each setuid / setgid program in the list:

-a always,exit -F path=[SETUID_PROG_PATH] -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000198','C-46125r7_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To verify that auditing of privileged command use is configured, run the following command once for each local partition [] to find relevant setuid / setgid programs:

$ sudo find [PART] -xdev -type f -perm /6000 2>/dev/null

Run the following command to verify entries in the audit rules for all programs found with the previous command:

$ sudo grep path /etc/audit/audit.rules

It should be the case that all relevant setuid / setgid programs have a line in the audit rules. If that is not the case, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38568','SV-50369r3_rule','default','low','The audit system must be configured to audit successful file system mounts.','The unauthorized exportation of data to external media could result in an information leak where classified information, Privacy Act information, and intellectual property could be lost. An audit trail should be created each time a filesystem is mounted to help identify and guard against information loss.','F-43516r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect media exportation events for all users and root. Add the following to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 

-a always,exit -F arch=ARCH -S mount -F auid>=500 -F auid!=4294967295 -k export
-a always,exit -F arch=ARCH -S mount -F auid=0 -k export

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000199','C-46126r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

If auditd service is not installed or auditd service not running, then rule get failed.

To verify that auditing is configured for all media exportation events, run the following command: 

$ sudo grep -w "mount" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38569','SV-50370r1_rule','default','low','The system must require passwords to contain at least one uppercase alphabetic character.','Requiring a minimum number of uppercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43517r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "ucredit=" parameter controls requirements for usage of uppercase letters in a password. When set to a negative number, any password will be required to contain that many uppercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each uppercase character. 
Add "ucredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of an uppercase character in a password.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000057','C-46127r1_chk','To check how many uppercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "ucredit" parameter (as a negative number) will indicate how many uppercase characters are required. The requirement is at least one uppercase character in a password. This would appear as "ucredit=-1". 
If ucredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38570','SV-50371r1_rule','default','low','The system must require passwords to contain at least one special character.','Requiring a minimum number of special characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43518r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "ocredit=" parameter controls requirements for usage of special (or "other") characters in a password. When set to a negative number, any password will be required to contain that many special characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each special character.  
Add "ocredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a special character in passwords.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000058','C-46128r1_chk','To check how many special characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "ocredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one special character in a password. This would appear as "ocredit=-1". 
If ocredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38571','SV-50372r1_rule','default','low','The system must require passwords to contain at least one lowercase alphabetic character.','Requiring a minimum number of lowercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43519r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:
$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "lcredit=" parameter controls requirements for usage of lowercase letters in a password. When set to a negative number, any password will be required to contain that many lowercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each lowercase character. 
Add "lcredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a lowercase character in password.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000059','C-46129r1_chk','To check how many lowercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "lcredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one lowercase character in a password. This would appear as "lcredit=-1". 
If lcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38573','SV-50374r4_rule','default','medium','The system must disable accounts after three consecutive unsuccessful logon attempts.','Locking out user accounts after a number of incorrect attempts prevents direct password guessing attacks.','F-43521r8_fix','To configure the system to lock out accounts after a number of incorrect logon attempts using "pam_faillock.so", modify the content of "/etc/pam.d/common-auth" as follows: 

Add the following line immediately before the "pam_unix.so" statement in the "AUTH" section: 

auth required pam_tally2.so deny=3 onerr=fail unlock_time=604800 fail_interval=900
account required pam_tally2.so

Note that any updates made to "/etc/pam.d/common-auth" may be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000061','C-46131r4_chk','To ensure the failed password attempt policy is configured correctly, run the following command: 

 grep -w pam_faillock /etc/pam.d/common-auth | grep -v "^"

The output should show "deny=3" for both files. 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38574','SV-50375r2_rule','default','medium','The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (common-password).','Using a stronger hashing algorithm makes password cracking attacks more difficult.','F-43522r2_fix','In "/etc/pam.d/common-password", among potentially other files, the "password" section of the files control which PAM modules execute during a password change. Set the "pam_unix.so" module in the "password" section to include the argument "sha512", as shown below: 

password[] pam_unix.so obscure use_authtok try_first_pass sha512

This will help ensure when local users change their passwords, hashes for the new passwords will be generated using the SHA-512 algorithm. This is the default.

Note that any updates made to "/etc/pam.d/common-password" will be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000062','C-46132r3_chk','Inspect the "password" section of "/etc/pam.d/common-password", and other files in "/etc/pam.d" and ensure that the "pam_unix.so" module includes the argument "sha512".

$ grep -w password /etc/pam.d/common-password | grep -w pam_unix.so | grep -v "^"

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38575','SV-50376r4_rule','default','low','The audit system must be configured to audit user deletions of files and programs.','Auditing file deletions will create an audit trail for files that are removed from the system. The audit trail could aid in system troubleshooting, as well as detecting malicious processes that attempt to delete log files to conceal their presence.','F-43523r4_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file deletion events for all users and root. Add the following (or equivalent) to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 

-a always,exit -F arch=ARCH -S rmdir -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete
-a always,exit -F arch=ARCH -S rmdir -S unlink -S unlinkat -S rename -S renameat -F auid=0 -k delete

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000200','C-46133r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "rmdir" system call, run the following command:

$ sudo grep -w "rmdir" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. To determine if the system is configured to audit calls to the "unlink" system call, run the following command:

$ sudo grep -w "unlink" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. To determine if the system is configured to audit calls to the "unlinkat" system call, run the following command:

$ sudo grep -w "unlinkat" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. To determine if the system is configured to audit calls to the "rename" system call, run the following command:

$ sudo grep -w "rename" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. To determine if the system is configured to audit calls to the "renameat" system call, run the following command:

$ sudo grep -w "renameat" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line.

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38578','SV-50379r1_rule','default','low','The audit system must be configured to audit changes to the /etc/sudoers file.','The actions taken by system administrators should be audited to keep a record of what was executed on the system, as well as, for accountability purposes.','F-43526r1_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect administrator actions for all users and root. Add the following to "/etc/audit/audit.rules": 

-w /etc/sudoers -p wa -k actions

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000201','C-46136r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To verify that auditing is configured for system administrator actions, run the following command: 

 auditctl -l | grep "watch=/etc/sudoers"


If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38579','SV-50380r1_rule','default','medium','The system boot loader configuration file(s) must be owned by root.','Only root should be able to modify important boot parameters.','F-43527r1_fix','The file "/etc/default/grub" should be owned by the "root" user to prevent destruction or modification of the file. To change the owner of "/etc/default/grub" to root, run the command: 

 chown root /etc/default/grub' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000065','C-46137r1_chk','To check the ownership of "etc/default/grub", run the command:

$ ls -lL /etc/default/grub

If properly configured, the output should be displayed as shown below:

The system boot loader configuration file is owned by root.
 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38580','SV-50381r2_rule','default','medium','The audit system must be configured to audit the loading and unloading of dynamic kernel modules.','The addition/removal of kernel modules can be used to alter the behavior of the kernel and potentially introduce malicious code into kernel space. It is important to have an audit trail of modules that have been introduced into the kernel.','F-43528r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules" in order to capture kernel module loading and unloading events, setting ARCH to either b32 or b64 as appropriate for your system: 

-w /sbin/insmod -p x -k modules
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit -F arch=[] -S init_module -S delete_module -k modules

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000202','C-46138r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit execution of module management programs, run the following commands:

$ sudo egrep -e "(-w |-F path=)/sbin/insmod" /etc/audit/audit.rules
$ sudo egrep -e "(-w |-F path=)/sbin/rmmod" /etc/audit/audit.rules
$ sudo egrep -e "(-w |-F path=)/sbin/modprobe" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line.

To determine if the system is configured to audit calls to the "init_module" system call, run the following command:

$ sudo grep -w "init_module" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. 

To determine if the system is configured to audit calls to the "delete_module" system call, run the following command:

$ sudo grep -w "delete_module" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. 

If no line is returned for any of these commands, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38581','SV-50382r1_rule','default','medium','The system boot loader configuration file(s) must be group-owned by root.','The "root" group is a highly-privileged group. Furthermore, the group-owner of this file should not have any access privileges anyway.','F-43529r1_fix','The file "/etc/default/grub" should be group-owned by the "root" group to prevent destruction or modification of the file. To change the group owner of "/etc/default/grub" to root, run the command: 

 chgrp root /etc/default/grub' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000066','C-46139r1_chk','To check the group ownership of "/etc/default/grub", run the command:
$ ls -lL /etc/default/grub

If properly configured, the output should be: The system boot loader configuration file is group owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38582','SV-50383r2_rule','default','medium','The xinetd service must be disabled if no network services utilizing it are enabled.','The xinetd service provides a dedicated listener service for some programs, which is no longer necessary for commonly-used network services. Disabling it ensures that these uncommon services are not running, and also prevents attacks against xinetd itself.','F-43530r2_fix','The "xinetd" service can be disabled with the following commands: 

 sysv-rc-conf xinetd off
 service xinetd stop' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000203','C-46140r2_chk','If network services are using the xinetd service, this is not applicable.

Run the following command to verify "xinetd" is disabled through current runtime configuration:

 service xinetd status

If the service is disabled the command will return the following output:

xinetd is stopped

To check that the "xinetd" service is disabled in system boot configuration, run the following command: 

 sysv-rc-conf "xinetd" --list

Output should indicate the "xinetd" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf "xinetd" --list
"xinetd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38583','SV-50384r2_rule','default','medium','The system boot loader configuration file(s) must have mode 0600 or less permissive.','Proper permissions ensure that only the root user can modify important boot parameters.','F-43531r2_fix','File permissions for "/boot/grub/grub.cfg" should be set to 600, which is the default. To properly set the permissions of "/boot/grub/grub.cfg", run the command:

 chmod 600 /boot/grub/grub.cfg

Boot partitions based on VFAT, NTFS, or other non-standard configurations may require alternative measures.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000067','C-46141r2_chk','To check the permissions of /boot/grub/grub.cfg, run the command:
$ ls -lL /boot/grub/grub.cfg

If properly configured, the output should indicate the following permissions: "-rw-------"
If it does not, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38585','SV-50386r2_rule','default','medium','The system boot loader must require authentication.','Password protection on the boot loader configuration ensures users with physical access cannot trivially alter important bootloader settings. These include which kernel to use, and whether to enter single-user mode.','F-43533r1_fix','Create an encrypted password with grub-md5-crypt:Create an encrypted password with grub-md5-crypt:

Add this script to header file or any custom file under "/etc/grub.d" directory.

cat <EOF
set superusers="< username >" 
password_pbkdf2 < username > < encrypted-password >
EOF

Update the grub file.

 update-grub

Add the ?Çôunrestricted option to CLASS in /etc/grub.d/10_linux file.  This will unrestrict the users from boot the system.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000068','C-46143r2_chk','To verify the boot loader password has been set and encrypted, run the following commands:

 grep "set\s*superusers="  /boot/grub/grub/cfg  | grep -v "^"

The output should show the following :

set superusers= < username >

 grep "password_pbkdf2\s*+ superuser_name +\s*grub.pbkdf2.sha512"  /boot/grub/grub.cfg | grep -v "^"

The output should show the following :

password_pbkdf2 < username > grub.pbkdf2.sha512 < hash password >

Checking the unrestricted authentication of boot loader.

 grep -w menuentry /etc/grub.d/10_linux | grep "$os" 

The output should show the following :

echo "menuentry "$(echo "$os" | grub_quote)" ${CLASS} --unrestricted \$menuentry_id_option.

If above configuration is missing, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38586','SV-50387r1_rule','default','medium','The system must require authentication upon booting into single-user and maintenance modes.','This prevents attackers with physical access from trivially bypassing security on the machine and gaining root access. Such accesses are further prevented by configuring the bootloader password.','F-43534r1_fix','Single-user mode is intended as a system recovery method, providing a single user root access to the system by providing a boot option at startup. By default, no authentication is performed if single-user mode is selected. 

To require entry of the root password even if the system is started in single-user mode, add or correct the following line in the file "/etc/init/rcS.conf": 

console owner

exec /sbin/sulogin

Remove the disable single-user mode authentication parameters "init=/bin/bash", "init=/bin/sh" from grub files if it exists.
And update the grub
 update-grub' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000069','C-46145r1_chk','To verify the single-user mode authentication is disabled, check "init=/bin/bash", "init=/bin/sh" parameters existancy inkernel parameter line in grub file.

If any one of parameter is existed in grub file this is finding.

Run the following to determine if a password is set for the root user. 

 grep "^root:\s*[]\s*:\|^root:\s*:" /etc/shadow

If it retruns any output this is finding and need to set the password for root account manually.

To check if authentication is required for single-user mode, run the following command: 

$ grep -w console /etc/init/rcS.conf | grep -v ""

$ grep -w /sbin/sulogin  /etc/init/rcS.conf | grep -v ""

The output should be the following: 

console owner

exec /sbin/sulogin

If the output is different, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38588','SV-50389r1_rule','default','medium','The system must not permit interactive boot.','Using interactive boot, the console user could disable auditing, firewalls, or other services, weakening system security.','F-43536r1_fix','This rule is not applicable.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000070','C-46146r1_chk','This rule is not applicable.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38589','SV-50390r2_rule','default','high','The telnet daemon must not be running.','The telnet protocol uses unencrypted network communication, which means that data from the login session, including passwords and all other information transmitted during the session, can be stolen by eavesdroppers on the network. The telnet protocol is also subject to man-in-the-middle attacks.

Mitigation:  If an enabled telnet daemon is configured to only allow encrypted sessions, such as with Kerberos or the use of encrypted network tunnels, the risk of exposing sensitive information is mitigated.','F-43537r1_fix','To disable "Telnet" service follow the following step:
Check the telnet configuration file:
$ grep -w /usr/sbin/in.telnetd /etc/xinetd.d/*

Added or update "disable" parameter 
disable = yes

To update the changes made restart the xinetd service.
$ service xinetd restart

If the service is running using inetd then comment the telnet configuration inside /etc/inetd.conf file.

To update the changes made restart the inetd service.
$ service openbsd-inetd restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000211','C-46147r3_chk','To check that the "telnet" service is disabled, follow the folllowing step:
Check the telnet configuration file:
$ grep -w /usr/sbin/in.telnetd /etc/xinetd.d/*

Check for "disable = yes" in configuration file.

If the "disable = no", this is a finding.

If the telnet is configured using inetd service the check for the telnet configuration line inside file /etc/inetd.conf

$ grep "in.telnetd" /etc/inetd.conf | grep -v ""

If there is output, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38591','SV-50392r1_rule','default','high','The rsh-server package must not be installed.','The "rsh-server" package provides several obsolete and insecure network services. Removing it decreases the risk of those services" accidental (or intentional) activation.','F-43539r1_fix','The "rsh-server" package can be uninstalled with the following command: 

 dpkg -r --force-all rsh-server' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000213','C-46149r1_chk','Run the following command to determine if the "rsh-server" package is installed: 

 dpkg -s rsh-server


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38593','SV-50394r1_rule','default','medium','The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, console login prompts.','An appropriate warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers.','F-43540r1_fix','To configure the system login banner: 

Edit "/etc/issue". Replace the default text with a message compliant with the local site policy or a legal disclaimer. The DoD required text is either: 

"You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only. By using this IS (which includes any device attached to this IS), you consent to the following conditions: 
-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations. 
-At any time, the USG may inspect and seize data stored on this IS. 
-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose. 
-This IS includes security measures (e.g., authentication and access controls) to protect USG interests -- not for your personal benefit or privacy. 
-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details." 

OR: 

"I"ve read AND consent to terms in IS user agreem"t."

Add the line "Banner /etc/issue" in /etc/ssh/sshd_config.

Restart ssh service to get changes in effect:

$ service ssh restart' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000073','C-46150r1_chk','To check if the system login banner is compliant, run the following command: 

$ cat /etc/issue

If it does not display the required banner, this is a finding

To check the parameter "Banner /etc/issue" in /etc/ssh/sshd_config.

$ grep -wi Banner /etc/ssh/sshd_config | grep -v "^"

If the parameter "Banner /etc/issue" not found in /etc/ssh/sshd_config this is finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38596','SV-50397r2_rule','default','medium','The system must implement virtual address space randomization.','Address space layout randomization (ASLR) makes it more difficult for an attacker to predict the location of attack code he or she has introduced into a process"s address space during an attempt at exploitation. Additionally, ASLR also makes it more difficult for an attacker to know the location of existing code in order to repurpose it using return oriented programming (ROP) techniques.','F-43543r1_fix','To set the runtime status of the "kernel.randomize_va_space" kernel parameter, run the following command: 

 sysctl -w kernel.randomize_va_space=2

To make this configuration persistent, add the following line to "/etc/sysctl.conf": 

kernel.randomize_va_space = 2

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000078','C-46153r2_chk','Check if the system is configured to implement virtual address space randomization, by querying the following command:

 sysctl kernel.randomize_va_space

If the output of the command is not "2", this is a finding.

verify the value of kernel.randomize_va_space  in "/etc/sysctl.conf".

If kernel.randomize_va_space is not set to "2" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38601','SV-50402r2_rule','default','medium','The system must not send ICMPv4 redirects from any interface.','Sending ICMP redirects permits the system to instruct other systems to update their routing information. The ability to send ICMP redirects is only appropriate for systems acting as routers.','F-43548r1_fix','To set the runtime status of the "net.ipv4.conf.all.send_redirects" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.all.send_redirects=0

To make the changes persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.send_redirects = 0

and run following command

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000081','C-46159r2_chk','Check if system sends ICMPv4 redirects from any interface, by querying the following command:

 sysctl net.ipv4.conf.all.send_redirects

If the output of the command is not "0" on any interface, this is a finding.

Verify the value of net.ipv4.conf.all.send_redirects in "/etc/sysctl.conf".

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38603','SV-50404r1_rule','default','medium','The ypserv package must not be installed.','Removing the "ypserv" package decreases the risk of the accidental (or intentional) activation of NIS or NIS+ services.','F-43551r1_fix','The "ypserv" package can be uninstalled with the following command: 

 dpkg -r --force-all nis
(Since ypserv is nis in ubuntu so there is no separate package for ypserv. Hence, we are removing nis package.)
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000220','C-46161r1_chk','Run the following command to determine if the "nis" package is installed: 

 service nis status


If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38604','SV-50405r2_rule','default','medium','The ypbind service must not be running.','Disabling the "ypbind" service ensures the system is not acting as a client in a NIS or NIS+ domain.','F-43552r2_fix','The "ypbind" service, which allows the system to act as a client in a NIS or NIS+ domain, should be disabled. The "ypbind" service can be disabled with the following commands: 

 service ypbind stop
 sysv-rc-conf --level 0123456S ypbind off' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000221','C-46162r2_chk','Run the following command to verify "ypbind" is disabled through current runtime configuration: 

 service ypbind status

If the service is disabled the command will return the following output: 

ypbind stop/waiting

To check that the "ypbind" service is disabled in system boot configuration, run the following command: 

 sysv-rc-conf --list ypbind

Output should indicate the "ypbind" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf --list ypbind

"ypbind" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38605','SV-50406r2_rule','default','medium','The cron service must be running.','Due to its usage for maintenance and security-supporting tasks, enabling the cron daemon is essential.','F-43553r2_fix','The "cron" service is used to execute commands at preconfigured times. It is required by almost all systems to perform necessary maintenance tasks, such as notifying root of system activity. The "cron" service can be enabled with the following commands: 

 sysv-rc-conf --level 0123456S cron on
 service cron start' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000224','C-46163r1_chk','Run the following command to determine the current status of the "crond" service: 

 service cron status

If the service is enabled, it should return the following: 

cron start/running


If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38607','SV-50408r1_rule','default','high','The SSH daemon must be configured to use only the SSHv2 protocol.','SSH protocol version 1 suffers from design flaws that result in security vulnerabilities and should not be used.','F-43555r1_fix','Only SSH protocol version 2 connections should be permitted. The default setting in "/etc/ssh/sshd_config" is correct, and can be verified by ensuring that the following line appears:?á

Protocol 2

Restart ssh service to get changes in effect:

$ service ssh restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000227','C-46165r1_chk','To check which SSH protocol version is allowed, run the following command:?á

 grep -iw Protocol /etc/ssh/sshd_config  | grep -v "^"

If configured properly, output should be:

Protocol 2

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38608','SV-50409r1_rule','default','low','The SSH daemon must set a timeout interval on idle sessions.','Causing idle users to be automatically logged out guards against compromises one system leading trivially to compromises on another.','F-43556r1_fix','SSH allows administrators to set an idle timeout interval. After this interval has passed, the idle user will be automatically logged out.?á

To set an idle timeout interval, edit the following line in "/etc/ssh/sshd_config" as follows:?á

ClientAliveInterval []

The timeout [interval] is given in seconds. To have a timeout of 15 minutes, set [interval] to 900.?á

If a shorter timeout has already been set for the login shell, that value will preempt any SSH setting made here. Keep in mind that some processes may stop SSH from correctly detecting that the user is idle.

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000230','C-46167r1_chk','Run the following command to see what the timeout interval is:?á

 grep -iw ClientAliveInterval /etc/ssh/sshd_config  | grep -v "^"

If properly configured, the output should be:?á

ClientAliveInterval 900

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38609','SV-50410r2_rule','default','medium','The TFTP service must not be running.','Disabling the "tftp" service ensures the system is not acting as a tftp server, which does not provide encryption or authentication.','F-43557r4_fix','To disable "TFTP" service follow the following step:
Check the tftp configuration file:
$ sudo grep -w /usr/sbin/in.tftpd /etc/xinetd.d/*

Added or update "disable" parameter
disable = yes

To update the changes made restart the xinetd service.
$ service xinetd restart

If the service is running using inetd then comment the tftp configuration inside /etc/inetd.conf file.

To update the changes made restart the inetd service.
$ service openbsd-inetd restart

The "tftpd-hpa" service can be disabled with the following commands:

 sysv-rc-conf tftpd-hpa off
 service tftpd-hpa stop
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000223','C-46166r2_chk','To check that the "TFTP" service is disabled, follow the folllowing step:
Check the tftp configuration file:
$ sudo grep -w /usr/sbin/in.tftpd /etc/xinetd.d/*

Check for "disable = yes" in configuration file.

If the "disable = no", this is a finding.

If the tftp is configured using inetd service the check for the tftp configuration line inside file /etc/inetd.conf

$ grep "in.tftpd" /etc/inetd.conf | grep -v ""

If there is output, this is a finding.

Tftp can also be installed using tftpd-hpa package

Run the following command to verify "tftpd-hpa" is disabled through current runtime configuration:

 service tftpd-hpa status

If the service is disabled the command will return the following output:

tftpd-hpa stop/waiting

To check that the "xinetd" service is disabled in system boot configuration, run the following command:

 sysv-rc-conf --list tftpd-hpa

Output should indicate the "xinetd" service has either not been installed, or has been disabled at all runlevels, as shown in the example below:

 sysv-rc-conf --list tftpd-hpa
tftp-hpa 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38611','SV-50412r1_rule','default','medium','The SSH daemon must ignore .rhosts files.','SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.','F-43559r1_fix','SSH can emulate the behavior of the obsolete rsh command in allowing users to enable insecure access to their accounts via ".rhosts" files.?á

To ensure this behavior is disabled, add or correct the following line in "/etc/ssh/sshd_config":?á

IgnoreRhosts yes

Then, Restart the ssh service:
 
$ service ssh restart' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000234','C-46169r1_chk','To determine how the SSH daemon"s "IgnoreRhosts" option is set, run the following command:?á
 grep -i IgnoreRhosts /etc/ssh/sshd_config
If no line, a commented line, or a line indicating the value "yes" is returned, then the required value is set.?á
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38612','SV-50413r1_rule','default','medium','The SSH daemon must not allow host-based authentication.','SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.','F-43560r1_fix','SSH"s cryptographic host-based authentication is more secure than ".rhosts" authentication, since hosts are cryptographically authenticated. However, it is not recommended that hosts unilaterally trust one another, even within an organization.?á

To disable host-based authentication, add or correct the following line in "/etc/ssh/sshd_config":?á

HostbasedAuthentication no

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000236','C-46170r1_chk','To determine how the SSH daemon"s "HostbasedAuthentication" option is set, run the following command:?á

 grep -iw HostbasedAuthentication /etc/ssh/sshd_config | grep -v "^"

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set.?á
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38613','SV-50414r1_rule','default','medium','The system must not permit root logins using remote access programs such as ssh.','Permitting direct root login reduces auditable information about who ran privileged commands on the system and also allows direct attack attempts on root"s password.','F-43561r1_fix','The root user should never be allowed to log into a system directly over a network. To disable root login via SSH, add or correct the following line in "/etc/ssh/sshd_config":?á

PermitRootLogin no
Then, Restart the ssh service:

$ service ssh restart

In Case if "PermitRootLogin no" already exist and no valid user exist. Then in recommended fix create a valid user with below condition:
1. User account must not be expired.
2. User account should be unlocked.
3. User account must have sudo privileges.
4. User account password  must be set or RSA key?¡pairs should be configured.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000237','C-46171r1_chk','To determine how the SSH daemon"s "PermitRootLogin" option is set, run the following command:?á
 grep -iw PermitRootLogin /etc/ssh/sshd_config  | grep -v "^"

If a line indicating "no" is returned, then the required value is set.?á
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38614','SV-50415r1_rule','default','high','The SSH daemon must not allow authentication using an empty password.','Configuring this setting for the SSH daemon provides additional assurance that remote login via SSH will require a password, even in the event of misconfiguration elsewhere.','F-43562r1_fix','To explicitly disallow remote login from accounts with empty passwords, add or correct the following line in "/etc/ssh/sshd_config":?á

PermitEmptyPasswords no

Any accounts with empty passwords should be disabled immediately, and PAM configuration should prevent users from being able to assign themselves empty passwords.

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000239','C-46172r1_chk','To determine how the SSH daemon"s "PermitEmptyPasswords" option is set, run the following command: 

 grep -iw PermitEmptyPasswords /etc/ssh/sshd_config  | grep -v "^"

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38615','SV-50416r1_rule','default','medium','The SSH daemon must be configured with the Department of Defense (DoD) login banner.','The warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers. Alternatively, systems whose ownership should not be obvious should ensure usage of a banner that does not provide easy attribution.','F-43563r1_fix','To enable the warning banner and ensure it is consistent across the system, add or correct the following line in "/etc/ssh/sshd_config": 

Banner /etc/issue

Restart ssh service to get changes in effect:

 service ssh restart

Another section contains information on how to create an appropriate system-wide warning banner.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000240','C-46173r1_chk','To determine how the SSH daemon"s "Banner" option is set, run the following command: 

 grep -iw Banner /etc/ssh/sshd_config | grep -v "^"

If a line indicating /etc/issue is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38616','SV-50417r1_rule','default','low','The SSH daemon must not permit user environment settings.','SSH environment options potentially allow users to bypass access restriction in some configurations.','F-43565r1_fix','To ensure users are not able to present environment options to the SSH daemon, add or correct the following line in "/etc/ssh/sshd_config":?á

PermitUserEnvironment no

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000241','C-46175r1_chk','To ensure users are not able to present environment daemons, run the following command: 

 grep -iw PermitUserEnvironment /etc/ssh/sshd_config | grep -v "^"
 
If properly configured, output should be: 

PermitUserEnvironment no


If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38618','SV-50419r2_rule','default','low','The avahi service must be disabled.','Because the Avahi daemon service keeps an open network port, it is subject to network attacks. Its functionality is convenient but is only appropriate if the local network can be trusted.','F-43567r2_fix','The "avahi-daemon" service can be disabled with the following commands: 

 sysv-rc-conf --level 0123456S avahi-daemon off
 service avahi-daemon stop' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000246','C-46177r1_chk','Run the following command to verify "avahi-daemon" is disabled through current runtime configuration:

 service avahi-daemon status

If the service is disabled the command will return the following output:

avahi-daemon stop/waiting

To check that the "avahi-daemon" service is disabled in system boot configuration, run the following command:

 sysv-rc-conf --list "avahi-daemon"

Output should indicate the "avahi-daemon" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf --list "avahi-daemon"

"avahi-daemon" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38619','SV-50420r2_rule','default','medium','There must be no .netrc files on the system.','Unencrypted passwords for remote FTP servers may be stored in ".netrc" files. DoD policy requires passwords be encrypted in storage and not used in access scripts.','F-43569r2_fix','The ".netrc" files contain logon information used to auto-logon into FTP servers and reside in the user"s home directory. These files may contain unencrypted passwords to remote FTP servers making them susceptible to access by unauthorized users and should not be used. Any ".netrc" files should be removed.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000347','C-46179r3_chk','To check the system for the existence of any ".netrc" files, run the following command: 

$ find /root /home -iname ".netrc" -type f

If any .netrc files exist, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38620','SV-50421r1_rule','default','medium','The system clock must be synchronized continuously, or at least daily.','Enabling the "ntpd" service ensures that the "ntpd" service will be running and that the system will synchronize its time to any servers specified. This is important whether the system is configured to be a client (and synchronize only its own clock) or it is also acting as an NTP server to other systems. Synchronizing time is essential for authentication services such as Kerberos, but it is also important for maintaining accurate logs and auditing possible security breaches.','F-43568r1_fix','Install the service if service is not installed with the following command: 

$ apt-get -y install ntp

The "ntp" service can be enabled with the following command:

$ service ntp start
$ sysv-rc-conf --level 0123456S ntp on' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000247','C-46178r1_chk','To verify the "ntpd" package is installed on the system, run the following command: 

$ dpkg -s ntpd

Run the following command to determine the current status of the "ntpd" service:

$ service ntp status

If the service is enabled, it should return the following: 

 * NTP server is running

If the service is not running, this is a finding.

Run the following command to determine the current status of the "ntpd" server configuration:

$ ntpq -p | wc -l

If NTP servers are properly configured for synchronizing the time, you can see get output is "0".

If output is "1", this is a finding','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38621','SV-50422r1_rule','default','medium','The system clock must be synchronized to an authoritative DoD time source.','Synchronizing with an NTP server makes it possible to collate system logs from multiple sources or correlate computer events with real time events. Using a trusted NTP server provided by your organization is recommended.','F-43570r1_fix','To specify a remote NTP server for time synchronization, edit the file "/etc/ntp.conf". Add or correct the following lines, substituting the IP or hostname of a remote NTP server for ntpserver. 

server []

This instructs the NTP software to contact that remote server to obtain time data.

Restart NTP service to get changes in effect by using the command:

$ service ntp restart' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000248','C-46180r1_chk','To verify the "ntpd" package is installed on the system, run the following command: 

$ dpkg -s ntpd

Run the following command to determine the current status of the "ntpd" service: 

$ service ntpd status

If the service is enabled, it should return the following:

ntpd is running...

If the service is not running, this is a finding.

Run the following command to determine the current status of the "ntpd" server configuration:

$ ntpq -p | wc -l

If NTP servers are properly configured for synchronizing the time, you can see get output is "0".

If output is "1", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38622','SV-50423r2_rule','default','medium','Mail relaying must be restricted.','This ensures "postfix" accepts mail messages (such as cron job reports) from the local system only, and not from the network, which protects it from network attack.','F-43572r1_fix','Edit the file "/etc/postfix/main.cf" to ensure that only the following "inet_interfaces" line appears: 

inet_interfaces = localhost' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000249','C-46182r2_chk','If the system is an authorized mail relay host, this is not applicable. 

Run the following command to ensure postfix accepts mail messages from only the local system: 

$ grep -w ^inet_interfaces /etc/postfix/main.cf | grep -v "^"

If properly configured, the output should show only "localhost". 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38623','SV-50424r2_rule','default','medium','All rsyslog-generated log files must have mode 0600 or less permissive.','Log files can contain valuable information regarding system configuration. If the system log files are not protected, unauthorized users could change the logged data, eliminating their forensic value.','F-43571r1_fix','All rsyslog-generated log files must have mode 0600 or less permissive. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s permissions:

$ ls -l [LOGFILE]

If the permissions are not 600 or more restrictive, run the following command to correct this:

 chmod 0600 [LOGFILE]' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000135','C-46181r2_chk','All rsyslog-generated log files must have mode 0600 or less permissive. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s permissions: 

$ ls -l [LOGFILE]

The permissions should be 600, or more restrictive. Some log files referenced in /etc/rsyslog.conf may be created by other programs and may require exclusion from consideration.

If the permissions are not correct, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38627','SV-50428r1_rule','default','low','The openldap-servers package must not be installed unless required.','Unnecessary packages should not be installed to decrease the attack surface of the system.','F-43577r1_fix','The "slapd" package should be removed if not in use. Is this machine the OpenLDAP server? If not, remove the package. 

 dpkg -r --force-all slapd

The slapd RPM is not installed by default on ubuntu machines. It is needed only by the OpenLDAP server, not by the clients which use LDAP for authentication. If the system is not intended for use as an LDAP Server it should be removed.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000256','C-46187r1_chk','To verify the "slapd" package is not installed, run the following command: 

$ dpkg -s slapd

The output should show the following. 

package "slapd" is not installed and no information is available

If it does not, this is a finding.
(For ldap configuration we require both slapd and ldap-utils pacakge if ldap-utils is missing that means ldap is not configured on your system.)
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38632','SV-50433r2_rule','default','medium','The operating system must produce audit records containing sufficient information to establish what type of events occurred.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43581r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start

sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000154','C-46191r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

* auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38633','SV-50434r1_rule','default','medium','The system must set a maximum audit log file size.','The total storage for audit log files must be large enough to retain log information over the period required. This is a function of the maximum log file size and the number of logs retained.','F-43582r1_fix','Determine the amount of audit data (in megabytes) which should be retained in each log file. Edit the file "/etc/audit/auditd.conf". Add or modify the following line, substituting the correct value for []: 

max_log_file = [STOREMB]

Set the value to "6" (MB) or higher for general-purpose systems. Larger values, of course, support retention of even more audit data.
If auditd service is not installed then rule will install before fixing changes.

Reload the auditd.

$ service auditd reload' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000160','C-46192r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine how much data the system will retain in each audit log file:

 grep -wi max_log_file /etc/audit/auditd.conf | grep -v "^"

max_log_file = 6


If the system audit data threshold hasn"t been properly set up, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38634','SV-50435r2_rule','default','medium','The system must rotate audit log files that reach the maximum file size.','Automatically rotating logs (by setting this to "rotate") minimizes the chances of the system unexpectedly running out of disk space by being overwhelmed with log data. However, for systems that must never discard log data, or which use external processes to transfer it and reclaim space, "keep_logs" can be employed.','F-43583r1_fix','The default action to take when the logs reach their maximum size is to rotate the log files, discarding the oldest one. To configure the action taken by "auditd", add or correct the line in "/etc/audit/auditd.conf": 

max_log_file_action = []

Possible values for [ACTION] are described in the "auditd.conf" man page. These include: 

"ignore"
"syslog"
"suspend"
"rotate"
"keep_logs"


Set the "[ACTION]" to "rotate" to ensure log rotation occurs. This is the default. The setting is case-insensitive.
If auditd service is not installed then rule will install before fixing changes.
Reload the auditd.

$ service auditd reload' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000161','C-46193r3_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to rotate logs when they reach their maximum size:

 grep -wi max_log_file_action /etc/audit/auditd.conf | grep -v "^"

max_log_file_action = rotate

If the "keep_logs" option is configured for the "max_log_file_action" line in "/etc/audit/auditd.conf" and an alternate process is in place to ensure audit data does not overwhelm local audit storage, this is not a finding.

If the system has not been properly set up to rotate audit logs, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38635','SV-50436r3_rule','default','low','The audit system must be configured to audit all attempts to alter system time through adjtimex.','Arbitrary changes to the system time can be used to obfuscate nefarious activities in log files, as well as to confuse network services that are highly dependent upon an accurate system time (such as sshd). All changes to the system time should be audited.','F-43584r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.


On a 32-bit system, add the following to "/etc/audit/audit.rules": 

 audit_time_rules
-a always,exit -F arch=b32 -S adjtimex -k audit_time_rules

On a 64-bit system, add the following to "/etc/audit/audit.rules": 

 audit_time_rules
-a always,exit -F arch=b64 -S adjtimex -k audit_time_rules

The -k option allows for the specification of a key in string form that can be used for better reporting capability through ausearch and aureport. Multiple system calls can be defined on the same line to save space if desired, but is not required. See an example of multiple combined syscalls: 

-a always,exit -F arch=b64 -S adjtimex -S settimeofday -S clock_settime -k audit_time_rules

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000165','C-46194r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "adjtimex" system call, run the following command:

$ sudo grep -w "adjtimex" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. 

If the system is not configured to audit time changes, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38643','SV-50444r3_rule','default','medium','There must be no world-writable files on the system.','Data in world-writable files can be modified by any user on the system. In almost all circumstances, files can be configured using a combination of user and group permissions to support whatever legitimate access is needed without the risk caused by world-writable files.','F-43591r1_fix','It is generally a good idea to remove global (other) write access to a file when it is discovered. However, check with documentation for specific applications before making changes. Also, monitor for recurring world-writable files, as these may be symptoms of a misconfigured application or user account.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000282','C-46202r3_chk','To find world-writable files, run the following command for each local partition [], excluding special filesystems such as /selinux, /proc, or /sys: 

$ find / -type f -perm -002 -print 2>>/dev/null | grep -v -e ^"/proc" -e ^"/selinux" -e ^"/sys"

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38647','SV-50448r1_rule','default','low','The system default umask in /etc/profile must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43596r1_fix','To ensure the default umask controlled by "/etc/profile" is set properly, add or correct the "umask" setting in "/etc/profile" to read as follows: 

umask 077' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000344','C-46207r1_chk','Verify the "umask" setting is configured correctly in the "/etc/profile" file by running the following command:

 grep "umask" /etc/profile

All output must show the value of "umask" set to 077, as shown in the below:

 grep "umask" /etc/profile
umask 077

If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38651','SV-50452r1_rule','default','low','The system default umask for the bash shell must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43600r1_fix','To ensure the default umask for users of the Bash shell is set properly, add or correct the "umask" setting in "/etc/bash.bashrc" to read as follows:

umask 077' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000342','C-46211r1_chk','Verify the "umask" setting is configured correctly in the "/etc/bash.bashrc" file by running the following command:

 grep "umask" /etc/bash.bashrc

All output must show the value of "umask" set to 077, as shown below: 

 grep "umask" /etc/bash.bashrc
umask 077
umask 077


If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38655','SV-50456r1_rule','default','low','The noexec option must be added to removable media partitions.','Allowing users to execute binaries from removable media such as USB keys exposes the system to potential compromise.','F-43605r1_fix','The "noexec" mount option prevents the direct execution of binaries on the mounted filesystem. Users should not be allowed to execute binaries that exist on partitions mounted from removable media (such as a USB key). The "noexec" option prevents code from being executed directly from the media itself, and may therefore provide a line of defense against certain types of worms or malicious code. Add the "noexec" option to the fourth column of "/etc/fstab" for the line which controls mounting of any removable media partitions.

[]" and then run mount [devicename] to effect the changes.]
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000271','C-46216r1_chk','To verify that binaries cannot be directly executed from removable media, run the following command: 

[]

Check whether device with ID_BUS as usb is mounted in /etc/mtab:

$ grep -w device_name /etc/mtab | grep -v "^"

The output should show "noexec" in use. 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38658','SV-50459r1_rule','default','medium','The system must prohibit the reuse of passwords within twenty-four iterations.','Preventing reuse of previous passwords helps ensure that a compromised password is not reused by a user.','F-43608r1_fix','Do not allow users to reuse recent passwords. This can be accomplished by using the "remember" option for the "pam_unix" PAM module. In the file "/etc/pam.d/common-password", append "remember=24" to the line which refers to the "pam_unix.so" module, as shown:?á

password sufficient pam_unix.so [] remember=24

The requirement is 24 passwords.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000274','C-46219r1_chk','To verify the password reuse setting is compliant, run the following command:?á

$ grep -w remember /etc/pam.d/common-password | grep -w password | grep -v "^"

The output should show the following at the end of the line:?á

remember=24


If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38675','SV-50476r2_rule','default','low','Process core dumps must be disabled unless needed.','A core dump includes a memory image taken at the time the operating system terminates an application. The memory image could contain sensitive data and is generally useful only for developers trying to debug problems.','F-43624r1_fix','To disable core dumps for all users, add the following line to "/etc/security/limits.conf": 

* hard core 0' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000308','C-46235r2_chk','To verify that core dumps are disabled for all users, run the following command:

 grep -w core /etc/security/limits.conf /etc/security/limits.d/*.conf --no-messages | grep -v ":\s*"

The output should be:

* hard core 0

If it is not, this is a finding. ','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38676','SV-50477r2_rule','default','low','The xorg-x11-server-common (X Windows) package must not be installed, unless required.','Unnecessary packages should not be installed to decrease the attack surface of the system.','F-43625r1_fix','Removing all packages which constitute the X Window System ensures users or malicious software cannot start X. To do so, run the following command: 

 apt-get -y purge xserver-common' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000291','C-46236r1_chk','To ensure the X Windows package group is removed, run the following command: 

$ dpkg -s xserver-common

The output should be:

package xserver-common is not installed

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38681','SV-50482r2_rule','default','low','All GIDs referenced in /etc/passwd must be defined in /etc/group','Inconsistency in GIDs between /etc/passwd and /etc/group could lead to a user having unintended rights.','F-43630r1_fix','Add a group to the system for each GID referenced without a corresponding group.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000294','C-46243r2_chk','To ensure all GIDs referenced in /etc/passwd are defined in /etc/group, run the following command: 

 pwck -r | grep "no group"

There should be no output. 
If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38686','SV-50487r1_rule','default','medium','The systems local firewall must implement a deny-all, allow-by-exception policy for forwarded packets.','In "iptables", default policy is applied only after all applicable rules in the table are examined for a match. Setting the default policy to "DROP" implements proper design for a firewall, i.e., any packets which are not explicitly permitted should not be accepted.','F-43635r1_fix','Note: Following steps may block you from accessing internet. Hence, make sure you run the commands cautiously.

To disable IPv6 module, add net.ipv6.conf.all.disable_ipv6 = 1 to following file

 /etc/sysctl.conf

and run the following command to reload settings from config files without rebooting the system.

 sysctl --system

To disable IPv6 module from GRUB, add following line in /etc/default/grub.

 GRUB_CMDLINE_LINUX="ipv6.disable=1"

and run the following command to update the grub.

 update-grub

To set the default FORWARD policy to DROP run following commands

For IPv4 Firewall,

 iptables -P FORWARD DROP 

For IPv6 Firewall,

 ip6tables -P FORWARD DROP 

Make sure you configure it to persist after reboot.
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000320','C-46248r1_chk','Check if IPv6 module is enabled or not using the following command :

 sysctl "net.ipv6.conf" | grep "disable_ipv6 = 0"

To verify if IPv6 is disabled in GRUB, run the following:

 grep -iw "ipv6.disable" /boot/grub/grub.cfg | grep -v "^\s*"

0 is enabled, 1 is disabled.

Run the following command to determine the current status of the ipv4 firewall: 

 iptables -L  FORWARD | head -1

Make sure default FORWARD policy is set to DROP.

Run the following command to determine the current status of the ipv6 firewall.

 ip6tables -L  FORWARD | head -1

Make sure default FORWARD policy is set to DROP.

If the default FORWARD policy is not set to DROP, this is a finding. 
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38689','SV-50490r3_rule','default','medium','The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.','An appropriate warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers.','F-43638r2_fix','
To set the text shown by the GNOME Display Manager in the login screen, run the following command: 

If the display manger is lightdm:

Add the banner text configuration setting in /etc/lightdm/lightdm.conf file like below:

[]

greeter-setup-script=/usr/bin/zenity --info --text [DoD required text]

If the display manager is gdm:

 sudo -u gdm -H dbus-launch gsettings set org.gnome.login-screen  banner-message-text [DoD required text]

Where the DoD required text is either: 

"You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only. By using this IS (which includes any device attached to this IS), you consent to the following conditions: 
-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations. 
-At any time, the USG may inspect and seize data stored on this IS. 
-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose. 
-This IS includes security measures (e.g., authentication and access controls) to protect USG interests -- not for your personal benefit or privacy. 
-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details." 

OR: 

"I"ve read AND consent to terms in IS user agreem"t."' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000326','C-46252r3_chk','If the system is NON-GUI based system, this is not applicable.

To ensure login warning banner text is properly set, run the following: 

If the display manager is "lightdm", check the banner text settings under "/etc/lightdm/lightdm.conf" file.

[]

greeter-setup-script=/usr/bin/zenity --info ?Çôtext < banner text >

If this configuration is not existed, this finding.

If the display manger is "gdm" run the following command:

 sudo -u gdm -H gsettings get org.gnome.login-screen banner-message-text

If properly configured, the proper banner text will appear.

If the banner text is not appear in the schema, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38695','SV-50496r2_rule','default','medium','A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43644r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000302','C-46257r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep "aide" /etc/crontab /etc/cron./ | grep "/var/lib/aide/aide.conf.autogenerated" | grep -w nice | grep -v ":\s*"

If there is no output or if aide is not run at least weekly, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38697','SV-50498r2_rule','default','low','The sticky bit must be set on all public directories.','Failing to set the sticky bit on public directories allows unauthorized users to delete files in the directory structure. 

The only authorized public directories are those temporary directories supplied with the system, or those designed to be temporary file repositories. The setting is normally reserved for directories used by the system, and by users for temporary file storage - such as /tmp - and for directories requiring global read/write access.','F-43646r1_fix','When the so-called "sticky bit" is set on a directory, only the owner of a given file may remove that file from the directory. Without the sticky bit, any user with write access to a directory may remove any file in the directory. Setting the sticky bit prevents users from removing each other"s files. In cases where there is no reason for a directory to be world-writable, a better solution is to remove that permission rather than to set the sticky bit. However, if a directory is used by a particular application, consult that application"s documentation instead of blindly changing modes. 
To set the sticky bit on a world-writable directory [], run the following command: 

 chmod +t [DIR]' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000336','C-46259r4_chk','To find world-writable directories that lack the sticky bit, run the following command for each local partition []: 

 find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \)

If any world-writable directories are missing the sticky bit, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-51363','SV-65573r1_rule','default','medium','The system must use a Linux Security Module configured to enforce limits on system services.','Setting the SELinux state to enforcing ensures SELinux is able to confine potentially compromised processes to the security policy, which is designed to prevent them from causing damage to the system or further elevating their privileges.','F-56165r1_fix','Change the profile modules to enforcing by run the following command:

 aa-enforce /etc/apparmor.d/*
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000020','C-53703r1_chk','Run the following command to check the security module is set with ?Ç£enforcing?Ç¥ 

 apparmor_status --complaining

If find any numer of profiles are not in enforcing, this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-57569','SV-71919r1_rule','default','medium','The noexec option must be added to the /tmp partition.','Allowing users to execute binaries from world-writable directories such as "/tmp" should never be necessary in normal operation and can expose the system to potential compromise.','F-62639r1_fix','
Add the "noexec" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /tmp.

If there is no /tmp entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "noexec" option in the mount option column of the entry.

[]
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000528','C-58279r1_chk','
To verify that binaries cannot be directly executed from /tmp partition, run the following command:

 grep -w "/tmp" /etc/mtab /etc/fstab | grep -v "^"

The output should show "noexec" in use.
If it does not, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38455','SV-50255r1_rule','default','low','The system must use a separate file system for /tmp.','The "/tmp" partition is used as temporary storage by many programs. Placing "/tmp" in its own partition enables the setting of more restrictive mount options, which can help protect programs which use it.','F-43387r1_fix','The tmp partition is used as temporary storage by many programs. Placing /tmp in its own partition enables the setting of more restrictive mount options, which can help to protect the programs that use it. Please create a separate file system for /tmp.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000001','C-45997r1_chk','Run the following command to determine if "/tmp" is on its own partition or logical volume: 

$ mount | grep "on /tmp "

If "/tmp" has its own partition or volume group, a line will be returned. 
If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-51337','SV-65547r1_rule','default','medium','The system must use a Linux Security Module at boot time.','Disabling a major host protection feature, such as SELinux, at boot time prevents it from confining system services at boot time. Further, it increases the chances that it will remain off during system operation.','F-56147r1_fix','The linux security module apparmor can be disabled at boot time by an argument in "/etc/default/grub". Remove any instances of "apparmor=0" or "security=selinux" from the kernel arguments in that file to prevent apparmor from being disabled at boot. And update the grub
 update-grub
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000017','C-54007r1_chk','Inspect "/etc/default/grub" for any instances of "apparmor=0" or "security=selinux" in the kernel boot arguments. Presence of "apparmor=0" or "security=selinux" indicates that apparmor is disabled at boot time. 
If apparmor is disabled at boot time, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56001','SV-50462r1_rule','default','high','
Legacy user account entries should not exist in /etc/passwd, /etc/shadow, and /etc/group files.
','
These legacy user entries may provide an avenue for attackers to gain privileged access on the system.
','F-56001','
If legacy user "+" entries exist in files /etc/passwd, /etc/shadow, /etc/group. Delete or replace them as normal users.
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check for any legacy user entry run:
 grep "^+:" /etc/passwd /etc/shadow /etc/group
If any line is returned this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56002','SV-50462r1_rule','default','high','
The /etc/crontab file must be user/group owned by root and must have mode 0600.
','
Crontab is the program used to install, deinstall or list the tables used to drive the cron daemon in Vixie Cron. An active line in a crontab will be either an environment setting or a cron command. Protection of this file is critical for system security.
','F-55014','
Change the permission of /etc/crontab to 600 and change the user and group ownership to root.

 chmod 600 /etc/crontab
 chown root /etc/crontab
 chgrp root /etc/crontab
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/crontab" file, run the following command:

 stat --format=%U,%G,%a /etc/crontab

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 600 or more restrictive. 

Otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56003','SV-50462r1_rule','default','high','
The /etc/cron.weekly directory must be user/group owned by root and must have mode 0700.
','
This /etc/cron.weekly directory contain script which are executed weekly. Protection of this file is important for system security.
','F-55014','
Change the permission of /etc/cron.weekly to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.weekly
 chown root /etc/cron.weekly
 chgrp root /etc/cron.weekly
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.weekly", run the follwoing command:

 stat --format=%U,%G,%a /etc/cron.weekly

If properly configured, the output should indicate the following permissions

User and Group ownership should be root and permission should be 700 or more restrictive. 

Otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56004','SV-50462r1_rule','default','high','
The /etc/cron.monthly directory must be user/group owned by root and must have mode 0700.
','
This /etc/cron.monthly directory contain script which are executed monthly. Protection of this file is important for system security.
','F-55014','
Change the permission of /etc/cron.monthly to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.monthly
 chown root /etc/cron.monthly
 chgrp root /etc/cron.monthly
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.monthly", run the following command:

 stat --format=%U,%G,%a /etc/cron.monthly

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 700 or more restrictive. 

Otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56005','SV-50462r1_rule','default','high','
The /etc/cron.hourly directory must be user/group owned by root and must have mode 0700.
','
This /etc/cron.hourly directory contains scripts which are executed hourly. Protection of this file is important for system security.
','F-55014','
Change the permission of /etc/cron.hourly to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.hourly
 chown root /etc/cron.hourly
 chgrp root /etc/cron.hourly
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.hourly", run the following command:

 stat --format=%U,%G,%a /etc/cron.hourly

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 700 or more restrictive. 

Otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56006','SV-50462r1_rule','default','high','
The  /etc/cron.daily directory must be user/group owned by root and must have mode 0700.
','
This /etc/cron.daily directory contain script which are executed daily. Protection of this file is important for system security.
','F-55014','
Change the permission of /etc/cron.daily to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.daily
 chown root /etc/cron.daily
 chgrp root /etc/cron.daily
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.daily", run the following command:

 stat --format=%U,%G,%a /etc/cron.daily

If properly configured, the output should indicate the following permissions

User and Group ownership should be root and permission should be 700 or more restrictive. 

Otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56007','SV-50462r1_rule','default','high','
The /etc/cron.d directory must be user/group owned by root and must have mode 0700.
','
/etc/cron.d directory contains system cronjobs stored for different users. Protection of this file is important for system security.
','F-55014','
Change the permission of /etc/cron.d to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.d
 chown root /etc/cron.d
 chgrp root /etc/cron.d
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.d", run the following command:

 stat --format=%U,%G,%a /etc/cron.d

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 700 or more restrictive. 

otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56009','SV-50462r1_rule','default','high','
For the /tmp partition, "nosuid" option must be set.
','
This rule verifies that for /tmp partition, "nosuid" option is set. "nosuid" verify that set-user-identifier or set-group-identifier bits do not take effect.
','F-55014','
Add the "nosuid" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /tmp.

If there is no /tmp entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "nosuid" option in the mount option column of the entry.

[]
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check whether /tmp partitions mounted on system do not allow set-user-identifier or set-group-identifier bits to take effect:
 grep -w tmp /etc/mtab /etc/fstab | grep "nosuid"

If "nosuid" option not set this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56011','SV-50462r1_rule','default','high','
For the /tmp partition, "nodev" option must be set.
','
This rule verifies that for /tmp partition, "nodev" option is set. "nodev" verify that the file system do not interpret character or block special devices.
','F-55014','
Add the "nodev" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /tmp.

If there is no /tmp entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "nodev" option in the mount option column of the entry.

[]
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check /tmp partitions mounted on system do not interpret character or block special devices on the file system:
 grep tmp /etc/mtab /etc/fstab | grep "nodev"

If "nodev" option not set this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56017','SV-50462r1_rule','default','high','
The SETroubleshoot package must not be installed on the system.
','
Setroubleshoot explains in plain English why a script or an application was blocked from executing. The tool also gives you suggestions on how to resolve the issue, which may involve running a simple command. This can be a problem if an attacker tries to execute something and it failed due to some security. This package might just help the attacker, how to bypass the security wall. This rule verifies that setroubleshoot is not installed.
','F-56017','If installed on the system, remove this package by
If selinux is installed :
 apt-get purge selinux

If selinux-basics is installed :
apt-get purge selinux-basics' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','The setroubleshoot functionality is actually provided by the packages mentioned below.
Check whether selinux or selinux-basics package is installed:
 dpkg -s selinux
 dpkg -s selinux-basics
If a line with package and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56019','SV-50462r1_rule','default','high','
All users must have valid home directories.
','
If the user"s home directory does not exist or is unassigned, the user will be placed in "/" and will not be able to write any files or have local environment variables set.
','F-56019','
If there are users with unassigned home directories, they should be assigned a home directory appropriately.
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Ubuntu 14.04','','
Check the users home directories assigned in the /etc/passwd file

 awk -F: "$3>=1000 ANDAND $3<=60000 {print $1, $6}" /etc/passwd

If any user"s home directories do not exist, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56021','SV-50462r1_rule','default','high','
For the /dev/shm partition, "nosuid" option must be set.
','
shm / shmfs is also known as tmpfs, which is a common name for a temporary file storage facility on many Unix-like operating systems. It is intended to appear as a mounted file system, but one which uses virtual memory instead of a persistent storage device. The nosuid mount option specifies that the filesystem cannot contain set userid files. Preventing setuid binaries on a world-writable filesystem makes sense because there"s a risk of root escalation or other awfulness there.
','F-55014','
Add the "nosuid" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /run/shm.

If there is no /run/shm entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "nosuid" option in the mount option column of the entry.

[]
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify that set-user-identifier or set-group-identifier bits do not take effect , run the following command:

grep -w "/run/shm" /etc/fstab | grep -v "^"

The output should show "nosuid" in use.
If it does not, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56022','SV-50462r1_rule','default','high','
For the /dev/shm partition, "noexec" option must be set.
','
shm / shmfs is also known as tmpfs, which is a common name for a temporary file storage facility on many Unix-like operating systems. It is intended to appear as a mounted file system, but one which uses virtual memory instead of a persistent storage device. Hackers can use temporary storage directories to store and execute unwanted programs and hack into a server, having "noexec" option set can avoid this from happening.
','F-55014','
Add the "noexec" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /run/shm.

If there is no /run/shm entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "noexec" option in the mount option column of the entry.

[]
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify that binaries cannot be directly executed from /run/shm partition, run the following command:

grep -w "/run/shm" /etc/fstab | grep -v "^"

The output should show "noexec" in use.
If it does not, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56023','SV-50462r1_rule','default','high','
For the /home partition, "nodev" option must be set.
','
The nodev mount option specifies that the filesystem cannot contain special devices: This is a security precaution. You don"t want a user world-accessible filesystem like this to have the potential for the creation of character devices or access to random device hardware.
','F-55014','
Add the "nodev" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /home.

If there is no /home entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "nodev" option in the mount option column of the entry.

[]
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify that the file system do not interpret character or block special devices , run the following command:

grep -w "/home" /etc/fstab | grep -v "^"

The output should show "nodev" in use.
If it does not, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56024','SV-50462r1_rule','default','high','
For the /dev/shm partition, "nodev" option must be set.
','
shm / shmfs is also known as tmpfs, which is a common name for a temporary file storage facility on many Unix-like operating systems. It is intended to appear as a mounted file system, but one which uses virtual memory instead of a persistent storage device. The nodev mount option specifies that the filesystem cannot contain special devices: This is a security precaution. You don"t want a user world-accessible filesystem like this to have the potential for the creation of character devices or access to random device hardware.
','F-55014','
Add the "nodev" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /run/shm.

If there is no /run/shm entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "nodev" option in the mount option column of the entry.

[]
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify that the file system do not interpret character or block special devices , run the following command:

grep -w "/run/shm" /etc/fstab | grep -v "^"

The output should show "nodev" in use.
If it does not, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56026','SV-50462r1_rule','default','high','
The /etc/ssh/sshd_config file must be user/group owned by root and must have mode 0600.
','
The /etc/ssh/sshd_config file is the system-wide configuration file for OpenSSH which allows you to set options that modify the operation of the daemon. This file contains keyword-value pairs, one per line, with keywords being case insensitive. Here are the most important keywords to configure your sshd for top security. Protection of this file is important for system security.
','F-55014','
Change the permission of /etc/ssh/sshd_config to 600 and change the user and group ownership to root.

 chmod 600 /etc/ssh/sshd_config
 chown root /etc/ssh/sshd_config
 chgrp root /etc/ssh/sshd_config
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of  "/etc/ssh/sshd_config", run the following  command:

 stat --format=%U,%G,%a /etc/ssh/sshd_config

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 600 or more restrictive. 

otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56027','SV-50462r1_rule','default','high','
The Loglevel for SSH daemon must be set to INFO.
','
This rule verifies that LogLevel parameter is set to INFO.
','F-56027','
Loglevel gives the verbosity level that is used when logging messages from sshd. Set this to INFO in sshd_config file.
LogLevel INFO

Restart the ssh service:
$ service ssh restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check for Loglevel value in sshd_config file by running:
 grep -iw LogLevel /etc/ssh/sshd_config  | grep -v "^"

Acceptable value is INFO. If its not this is the finding.

','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56029','SV-50462r1_rule','default','high','
The talk package must not be installed on system.
','
Talk is a very simple, basic chat program. All the client does is establish a link between the terminals of two computer users. The users can either reside on the same computer or on different, networked computers. Everything that one user types into his terminal will instantly be shown on the other user"s terminal and vice versa.This rule verifies that talk is not installed.
','F-56029','If installed on system, remove the talk package by running:
 apt-get purge talk' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether talk is installed on system:
 dpkg -s talk
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56030','SV-50462r1_rule','default','high','
The SNMP Server package must not be installed on system.
','
This rule verifies that net-snmp package does not exist.
','F-56030','If installed on system, remove the snmpd package by running:

 apt-get purge snmpd' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether snmpd is installed on system:
 dpkg -s snmpd
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56033','SV-50462r1_rule','default','high','
The MCS Translation Service (mcstrans) must not be installed on system.
','
MCS Translation Service translates output of Linux errors or configuration warnings or messages into a readable format. This rule verifies that mcstrans is not installed.
','F-56033','If installed on system, remove the policycoreutils package by running:
 apt-get purge policycoreutils' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Policycoreutils is a package that provides translation services.
Check whether policycoreutils is installed on system:
 dpkg -s policycoreutils
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56034','SV-50462r1_rule','default','high','
The HTTP Server package must not be installed on system.
','
The HTTP server daemon just replies to the request header it receives. It is not secure like HTTPS which has stronger security checks than HTTP. This rule verifies that httpd package does not exist.
','F-56034','If installed on system, remove the apache2 package by running:
 apt-get purge apache2' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether apache2 is installed on system:
 dpkg -s apache2
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56035','SV-50462r1_rule','default','high','
The HTTP proxy server package must not be installed on system.
','
Malicious clients try to exploit open proxy servers to access a website without revealing their true location. They could be doing this to manipulate pay-per-click ad systems, to add comment or link-spam to someone else"s site, or just to do something nasty without being detected. This rule verifies that squid package does not exist.
','F-56035','If installed on system, remove the squid3 package by running:
 apt-get purge squid3' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether squid3 is installed on system:
 dpkg -s squid3
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56036','SV-50462r1_rule','default','high','
The Dovecot (IMAP and POP3 services) package must not be installed on system.
','
The dovecot service has a lesser memory footprint hence it uses lesser resources. But it has a poor error handling mechanism. This rule verifies that dovecot package does not exist.
','F-56036','Remove all the dovecot packages installed.
First list them by running.

 dpkg --list | cut -d" " -f3 | grep -w dovecot

Remove the package by running.

 apt-get purge []' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check for all dovecot packages in the system.

 dpkg --list | cut -d" " -f3 | grep -w dovecot

If any package is found installed on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56037','SV-50462r1_rule','default','high','
The DNS Server package must not be installed on system.
','
Domain Name System (DNS) is a centralised mechanism for resolving / giving the IP addresses for a given domain name. Breakdown of DNS would crash the world wide web though there are many root servers and backup servers targetting DNS servers at particular key locations would do lot of harm. This rule verifies that DNS server is not installed.
','F-56037','If installed on system, remove the bind9 package by running:
 apt-get purge bind9' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether bind9 is installed on system:
 dpkg -s bind9
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56039','SV-50462r1_rule','default','high','
The CUPS (Print server) daemon must be disabled.
','
CUPS (an acronym for Common Unix Printing System) is a modular printing system for Unix-like computer operating systems which allows a computer to act as a print server. A computer running CUPS is a host that can accept print jobs from client computers, process them, and send them to the appropriate printer.Anyone on the local network can see the CUPS page for any other local machine which is not secure.
','F-56039','
The "cups" service can be disabled with the following commands:

 service cups stop 
 sysv-rc-conf --level 0123456S cups off
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Run the following command to verify "cups" is disabled through current runtime configuration:

 service cups status

If the service is disabled the command will return the following output:

cups is stopped

To check that the "cups" service is disabled in system boot configuration, run the following command:

 sysv-rc-conf --list "cups"

Output should indicate the "cups" service has either not been installed, or has been disabled at all runlevels, as shown in the example below:

 sysv-rc-conf --list "cups"
"cups" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

If the service is running, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56040','SV-50462r1_rule','default','high','
NFS and RCP daemon must be disabled.
','
NFS (Network File System) allows you to "share" a directory located on one networked computer with other computers/devices on that network. The rpcbind utility is a server that converts RPC program numbers into universal addresses.  It must be running on the host to be able to make
RPC calls on a server on that machine.If one of the NFS services does not start up correctly, rpcbind will be unable to map RPC requests from clients for that service to the correct port.
','F-56040','
The "nfs" and "rpcbind" service can be disabled with the following commands:

 chkconfig nfs off
 chkconfig rpcbind off
 service nfs stop
 service rpcbind stop
Restart the xinetd service
 service xinetd restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "rpcbind" and "nfs" service is disabled in system boot configuration, run the following command:

 chkconfig "rpcbind" --list
 chkconfig "nfs" --list

Output should indicate the "nfs" and "rpcbind" service have either not been installed, or have been disabled at all runlevels, as shown in the example below:

 chkconfig "rpcbind" --list
"rpcbind" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

 chkconfig "nfs" --list
"nfs" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

Run the following command to verify "nfs" and "rpcbind" are disabled through current runtime configuration:

 service rpcbind status
 service nfs status

If the service is disabled the command will return the following output:

rpcbind is stopped
nfs is stopped

If the service is running, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56041','SV-50462r1_rule','default','high','
The daytime-stream daemon must be disabled.  
','
daytime-stream is a network service that respondes with the server"s current date and time. This service is intended for debugging and testing puposes and should be disabled.
','F-56041','The "daytime-stream" service can be disabled through xinetd,
Update "disable = yes" in the xinetd.d service file.

Restart the xinetd service
 service xinetd restart

If the service is configured using inetd then comment out the daytime service configuration line for TCP port in /etc/inetd.conf file.

Restart the inetd service
 service openbsd-inetd restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd start/running

Finding the daytime service port value at tcp protocol.
 sudo grep -w ^daytime /etc/services | cut -f3 | grep -w tcp | grep -v "^\s*"

example output - 13/tcp

Checking if daytime-stream service port is enabled at tcp protocol using below command:
 netstat -aunp | grep xinetd | grep :13 | grep tcp

if service is running at tcp port, this is finding.

If daytime service is configured using inetd, run following command:

 grep daytime /etc/inetd.conf | grep tcp |grep -v "^\s*"

If there is output, this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56042','SV-50462r1_rule','default','high','
The daytime-dgram daemon must be disabled.
','
The Daytime Protocol is a service in the Internet Protocol Suite. It is intended for testing and measurement purposes in computer networks.
A host may connect to a server that supports the Daytime Protocol on either Transmission Control Protocol (TCP) or User Datagram Protocol (UDP) port 13. The server returns an ASCII character string of the current date and time in an unspecified format.
','F-56042','
The "daytime-dgram" service can be disabled through xinetd,
Update "disable = yes" in the xinetd.d service file.

Restart the xinetd service
 service xinetd restart

If the service is configured using inetd then comment out the daytime service configuration line for UDP port in /etc/inetd.conf file.

Restart the inetd service
 service openbsd-inetd restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd start/running

Finding the daytime service port value at udp protocol.
 sudo grep -w ^daytime /etc/services | cut -f3 | grep -w udp | grep -v "^\s*"

example output :- 13/udp

Checking if daytime-dgram service port is enabled at udp protocol using below command:-
 netstat -aunp | grep xinetd | grep :13 | grep udp

if service is running at udp port, this is finding. 

If daytime service is configured using inetd, run following command:

 grep daytime /etc/inetd.conf | grep udp |grep -v "^\s*"

If there is output, this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56043','SV-50462r1_rule','default','high','
The chargen-stream daemon must be disabled.
','
e Character Generator Protocol (CHARGEN) is a service of the Internet Protocol Suite defined in RFC 864 in 1983. It is intended for testing, debugging, and measurement purposes. The protocol is rarely used, as its design flaws allow ready misuse.Disabling CHARGEN will stop a server from being misused by an attacker in their efforts to disrupt another server.
','F-56043','
The "chargen" service can be disabled through xinetd,
Update "disable = yes" in the xinetd.d service file.

Restart the xinetd service
 service xinetd restart

If the service is configured using inetd then comment out the chargen service configuration line for TCP port in /etc/inetd.conf file.

Restart the inetd service
 service openbsd-inetd restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','

To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd start/running

Finding the chargen service port value at tcp protocol.
 sudo grep -w ^chargen /etc/services | cut -f3 | grep -w tcp | grep -v "^\s*"

example output ;- 19/tcp

Checking if chargen-stream service port is enabled at tcp protocol using below command:-
 netstat -aunp | grep xinetd | grep :19 | grep tcp

if service is running at tcp port, this is finding. 

If chargen service is configured using inetd, run following command:

 grep chargen /etc/inetd.conf | grep tcp |grep -v "^\s*"

If there is output, this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56044','SV-50462r1_rule','default','high','
The chargen-dgram daemon must be disabled.
','
chargen-dram is a network service that responds with 0 to 512 ASCII characters for each datagram it receives. This service is intended for debugging and testing puposes. It is recommended that this service be disabled.
','F-56044','
The "chargen-dgram" service can be disabled through xinetd,
Update "disable = yes" in the xinetd.d service file.

Restart the xinetd service
 service xinetd restart

If the service is configured using inetd then comment out the chargen service configuration line for UDP port in /etc/inetd.conf file.

Restart the inetd service
 service openbsd-inetd restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd start/running

Finding the chargen service port value at udp protocol.
 sudo grep -w ^chargen /etc/services | cut -f3 | grep -w udp | grep -v "^\s*"

example output ;- 19/udp

Checking if chargen-dgram service port is enabled at udp protocol using below command:-
 netstat -aunp | grep xinetd | grep :19 | grep udp

if service is running at udp port, this is finding.

If chargen service is configured using inetd, run following command:

 grep chargen /etc/inetd.conf | grep udp |grep -v "^\s*"

If there is output, this is finding. 
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56045','SV-50462r1_rule','default','high','
The echo-stream and echo-dgram daemon must be disabled.
','
The Echo Protocol is a service in the Internet Protocol Suite defined in RFC 862.
A host may connect to a server that supports the Echo Protocol using the Transmission Control Protocol (TCP) or the User Datagram Protocol (UDP) on the well-known port number 7. The server sends back an identical copy of the data it received.It is recommended that this service be disabled.
','F-56045','
The "echo-stream" service can be disabled through xinetd,
Update "disable = yes" in the xinetd.d service file.

Restart the xinetd service
 service xinetd restart

If the service is configured using inetd then comment out the echo service configuration line for TCP port in /etc/inetd.conf file.

Restart the inetd service
 service openbsd-inetd restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','

To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd start/running

Finding the echo service port value at tcp protocol.
 sudo grep -w ^echo /etc/services | cut -f3 | grep -w tcp | grep -v "^\s*"

example output :- 7/tcp

Checking if echo-stream service port is enabled at tcp protocol using below command:-
 netstat -aunp | grep xinetd | grep :7 | grep tcp

if service is running at tcp port, this is finding. 

If echo service is configured using inetd, run following command:

 grep echo /etc/inetd.conf | grep tcp |grep -v "^\s*"

If there is output, this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56047','SV-50462r1_rule','default','high','
The /var/log/messages, /var/log/secure, /var/log/maillog, /var/log/cron and /var/log/spoolerfiles must be user/group owned by root and must have mode 0600.
','
/var/log/messages contains global system messages, including the messages that are logged during system startup.
/var/log/secure contains information related to authentication and authorization privileges. For example, sshd logs all the messages here, including unsuccessful login. 
/var/log/maillog contains the log information from the mail server that is running on the system.
/var/log/cron whenever cron daemon (or anacron) starts a cron job, it logs the information about the cron job in this file.
/var/log/spooler this file is rarely used and is empty on my server. This log files used to contain messages from USENET.
Since all this files conatin useful information about protection of this file is important for system security.
','F-55014','
Change the permission of /var/log/syslog, /var/log/secure, /var/log/auth.log, /var/log/mail.log, /var/log/cron.log, /var/log/boot.log files to 600 and change the user and group ownership to root.

 chmod 600 /var/log/syslog
 chown root /var/log/syslog
 chgrp root /var/log/syslog

(Similarly fix for remaining files /var/log/auth.log, /var/log/mail.log, /var/log/cron.log, /var/log/boot.log)
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/var/log/syslog, /var/log/auth.log, /var/log/mail.log, /var/log/cron.log, /var/log/boot.log", run the following commands:

 stat --format=%U,%G,%a /var/log/syslog
 stat --format=%U,%G,%a /var/log/auth.log
 stat --format=%U,%G,%a /var/log/mail.log
 stat --format=%U,%G,%a /var/log/cron.log
 stat --format=%U,%G,%a /var/log/boot.log

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 600 or more restrictive. 

Otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56049','SV-50462r1_rule','default','high','
The /etc/hosts.deny file must have mode 0644 or less.
','
/etc/hosts.deny file denies particular hostname from accessing particular daemon. Access of this file other than root can provide access control over untrusted network.
','F-55014','
Change the permission of /etc/hosts.deny to 644.

 chmod 644 /etc/hosts.deny
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the permission of "/etc/hosts.deny", run the following command:

 stat --format=%a /etc/hosts.deny

If properly configured, the permission should be 644 or more restrictive. 

Otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56050','SV-50462r1_rule','default','high','
The /etc/hosts.allow file must have mode 0644 or less.
','
/etc/hosts.allow file allows particular hostname from accessing particular daemon. Access of this file other than root can provide access control over untrusted network.
','F-55014','
Change the permission of /etc/hosts.allow  to 644.

 chmod 644 /etc/hosts.allow
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the permission of "/etc/hosts.allow", run the following command:

 stat --format=%a /etc/hosts.allow

If properly configured, the permission should be 644 or more restrictive. 

Otherwise this is finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56051','SV-50462r1_rule','default','high','
Package tcp_wrappers must be installed.
','
Using TCP_WRAPPERS makes securing your servers against outside intrusion a lot simpler and painless than you would expect. Deny all hosts by putting ALL: ALL@ALL, PARANOID in the /etc/hosts.deny file and explicitly list trusted hosts who are allowed to your machine in the /etc/hosts.allow file. This is the safest and the best configuration. TCP_WRAPPERS is controlled from two files and the search stops at the first match.
','F-55014','
To install package tcp_wrappers run below commands:
 apt-get install tcpd

If "/etc/hosts.allow" or "/etc/hosts.deny" file(s) does not exist then run,
 touch /etc/hosts.allow
 touch /etc/hosts.deny
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify the package:
 dpkg -s tcpd

After that check whether /etc/hosts.deny and /etc/hosts.allow are available.
If package is not installed, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56053','SV-50462r1_rule','default','high','
Service at/cron must be restricted to authorized users.
','
The cron and at services are used to allow commands to be executed at a later time. How do I restrict them to selected users such as root, opt1, opt2 and so on? How do I make sure user php can run php script but cannot modify or install a new job?
The cron service is required by almost all UNIX / Linux / BSD oses to perform necessary maintenance tasks. Both cron and anacron make use of a number of configuration files and directories. Regular users can modify and install their own cron configuration or jobs.
','F-55014','
Add authorized users in both at.allow/cron.allow file to allow use of at/cron service.
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify authorized users who can use at/cron service run:
 cat /etc/at.allow
 cat /etc/cron.allow

If there is no output, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56054','SV-50462r1_rule','default','high','
Wireless Interfaces must be deactivated if not required.
','
If a server has a wireless interface activated and if it is not used frequently then, it"s good as per security to deactivate it since it can be a vulnerable injection point.
','F-55014','
Please check and deactivate any wireless interface manually.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check whether system is using any wireless interface, run:
 cat /proc/net/wireless | sed "1,2d" | cut -d: -f1 | tr -d " "

If any line is returned this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56058','SV-50462r1_rule','default','high','
System access via SSH service must be restricted to authorized users and groups.
','
Restricting access via SSH improves the security by avoiding system access to unwanted users or groups.
','F-55014','
Review the list of allowed users, allowed groups, denied users and denied groups and make sure that it is legitimate.
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check DenyUsers, AllowUsers, DenyGroups, AllowGroups in /etc/ssh/sshd_config run:
 grep -iw AllowUsers /etc/ssh/sshd_config | grep -v "^"
 grep -iw DenyUsers /etc/ssh/sshd_config | grep -v "^"
 grep -iw AllowGroups /etc/ssh/sshd_config | grep -v "^"
 grep -iw DenyGroups /etc/ssh/sshd_config | grep -v "^"

If any allowed users, allowed groups, denied users and denied groups exist make sure they are legitimate.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56062','SV-50462r1_rule','default','high','
The rsyslog daemon must be running.
','
RSYSLOG is the rocket-fast system for log processing.
It offers high-performance, great security features and a modular design. While it started as a regular syslogd, rsyslog has evolved into a kind of swiss army knife of logging, being able to accept inputs from a wide variety of sources, transform them, and output to the results to diverse destinations.
','F-56062','
The "rsyslog" service can be enabled with the following commands:
 chkconfig rsyslog on
 service rsyslog start

' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Run the following command to verify "rsyslog" is enabled through current runtime configuration:

 service rsyslog status

If the service is rsyslog the command will return the following output:

rsyslog is running.

To check that the "rsyslog" service is enabled in system boot configuration, run the following command:

 chkconfig rsyslog --list

Output should indicate the "rsyslog" service has been enabled at default and current runlevels or at all runelvel, as shown in the example below:

 chkconfig "rsyslog" --list
"rsyslog" 0:on 1:on 2:on 3:on 4:on 5:on 6:on S:on

If the service is not running, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56063','SV-50462r1_rule','default','high','
The rsyslog package must be installed on system.
','
Rsyslog is the system logger. It helps in logging all the crucial activity of linux system locally and can also be used to forward logs to  remote server. This rule verifies that rsyslog is installed.
','F-56063','Rsyslog is the system logger. It helps in logging all the crucial activity of linux systems. Install it by running:
 apt-get -y install rsyslog' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether rsyslog is installed on system:
 dpkg -s rsyslog
If a line with "rsyslog is not installed" is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56064','SV-50462r1_rule','default','high','
The SSH X11 Forwarding must be disabled.
','
SSH X11 forwarding gives the user an ability to graphically run programs on remote machine. If an attacker gets access of machine via SSH, he/she can misuse the graphical console there by making it easy for them to attack a system. This rule verifies that X11Forwarding parameter is set to no.
','F-56064','If SSH X11 Forwarding is enabled edit the file /etc/ssh/sshd_config
X11Forwarding no []

Restart the ssh service:
$ service ssh restart
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the whether X11 Forwarding is disabled run:
 grep -iw "X11Forwarding" /etc/ssh/sshd_config | grep -v "^"

The parameter should have the value set to "no", if this is not the case then this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56066','SV-50462r1_rule','default','high','
The DHCP Server package must not be installed on system.
','
DHCP automation can be a serious security risk if a rogue DHCP server is introduced to the network. A rogue server isn"t under control of the network staff, and can offer IP addresses to users connecting to the network. If a user connects to the rogue DHCP, information sent over that connection can be intercepted or looked at, violating user privacy and network security. This rule verifies that dhcp package does not exist.
','F-56066','Remove all the dhcp packages installed.
First list them by running.

 dpkg --list | grep -i dhcp | grep -i server | cut -d" " -f3

Remove the package by running.

 apt-get purge "package-name"' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check for all dhcp packages in the system.

 dpkg --list | grep -i dhcp | grep -i server | cut -d" " -f3

If any package is found installed on the system, this is a finding','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56067','SV-50462r1_rule','default','high','
The IPv6 Redirect Acceptance must be disabled.
','
ICMP redirect messages represent one of the lowest level routing protocols for simple redirects. Routers send them to hosts to inform them about more efficient ways to reach a host rather than route them over themselves.A host will allow this message and will store this "hint" in a temporary table. It will send the next package directly to the host given by the ICMP redirect.
','F-56067','Disable the IPv6 Redirects Acceptance with the following commands:

 sysctl -w net.ipv6.conf.all.accept_redirects=0
 sysctl -w net.ipv6.conf.default.accept_redirects = 0

To make the changes persistent, update these parameters in /etc/sysctl.conf file and make sure that it has only single instance.

Run the following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','To check that the IPv6 Redirects Acceptance is disabled, run the following command: 

 sysctl net.ipv6.conf.all.accept_redirects 
 sysctl net.ipv6.conf.default.accept_redirects 

If the output of the above commands is not "0", this is a finding.

Verify the value of net.ipv6.conf.all.accept_redirects and net.ipv6.conf.default.accept_redirects in "/etc/sysctl.conf".

If it"s not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56068','SV-50462r1_rule','default','high','
The IPv6 Router Advertisements must be disabled.
','

Router discovery was invented, which provides a means by which a host can locate a router and learn important parameters related to the operation of the local network.
Router discovery in IPv6 works in a very similar manner, by having routers send Router Advertisement messages both on a regular basis and in response to hosts prompting for them using Router Solicitation messages. 
','F-56068','Disable the IPv6 router advertisements with the following command:

 sysctl -w net.ipv6.conf.default.accept_ra=0
 sysctl -w net.ipv6.conf.all.accept_ra=0

To make the changes persistent, update these parameters in /etc/sysctl.conf file and make sure that it has only single instance.

Run the following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','To check that the "IPv6" Router Advertisements are disabled, run the following command:

 sysctl net.ipv6.conf.default.accept_ra
 sysctl net.ipv6.conf.all.accept_ra

If the output of the above commands is not "0", this is a finding.

Verify the value of net.ipv6.conf.all.accept_redirects and net.ipv6.conf.default.accept_redirects in "/etc/sysctl.conf".

If it"s not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56071','SV-50462r1_rule','default','high','
Root account must have it"s GID as 0.
','
This rule verifies that for root account GID is 0.
','F-56071','Set root account"s GID as 0 by running:
 usermod -g 0 root
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check the group id (GID) of the root user:
 id -g root

If it is anything other than 0, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56073','SV-50462r1_rule','default','high','
There must be no duplicate UIDs.
','
This rule verifies that there are no duplicate UIDs.
','F-56073','If there are users with duplicate UIDs, assign a different UID to them by running:
 usermod -u new_UID user_name
Where in new_UID will take the new UID to be assigned and user_name is the particular user account"s name.
' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check whether there aren"t any duplicate UIDs:
$ awk -F: "{print $3}" /etc/passwd | sort | uniq -d

If there is any duplicate UID, this is a finding.
','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56075','SV-50462r1_rule','default','high','
The FTP Server package must not be installed on system.
','
FTP (File transfer protocol) is resposible for insecure file transfers over the network. This rule asks to uninstall ftp server if installed.
','F-56075','If installed on system, remove the vsftpd package by running:
 apt-get purge vsftpd' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether vsftpd is installed on system:
 dpkg -s vsftpd
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56076','SV-50462r1_rule','default','high','
The samba package must not be installed on system.
','
Since Samba server is in it"s development phase, it is not secure because the bugs in the software leave the system vulnerable to mail archive loss. This rule asks to uninstall samba package from the system.
','F-56076','If installed on system, remove the samba package by running:
 apt-get purge samba' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether samba is installed on system:
 dpkg -s samba
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-56077','SV-50462r1_rule','default','high','
The telnet-client package must not be installed on system.
','
Telnet client or server are not as secure as ssh over a network. This rule asks to uninstall telnet client from the system.
','F-56077','If installed on system, remove the telnet package by running:
 apt-get purge telnet' , '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether telnet is installed on system:
 dpkg -s telnet
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-38594','SV-50395r2_rule','default','high','The rshd service must not be running.','"The rsh service uses unencrypted network communications; which means that data from the login session; including passwords and all other information transmitted during the session; can be stolen by eavesdroppers on the network."','F-43542r3_fix','"The ""rsh"" service; which is available with the ""rsh-server"" package and runs as a service through xinetd; should be disabled. The ""rsh"" service can be disabled with the following command:  chkconfig rsh off"','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000214','None','None','Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','V-51369','SV-65579r1_rule','default','low','The system must use a Linux Security Module configured to limit the privileges of system services.','"Setting the SELinux policy to ""targeted"" or a more specialized policy ensures the system will confine processes that are likely to be targeted for exploitation; such as network or system services. "','F-56171r1_fix','"The SELinux ""targeted"" policy is appropriate for general-purpose desktops and servers; as well as systems in many other roles. To configure the system to use this policy; add or correct the following line in ""/etc/selinux/config"":SELINUXTYPE=targetedOther policies; such as ""mls""; provide additional security labeling and greater confinement but are not compatible with many general-purpose use cases."','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','RHEL-06-000023','None','None','Customized rule by Cloud Raxak') from dual;


-- CIS RULES
select add_rule_data ('default','C-is1118','sv-1.1.1.8_cis_rule','default','medium', 'Ensure nodev option set on removable media partitions.', 'The nodev mount option specifies that the filesystem cannot contain special devices. Since the /var/tmp filesystem is not intended to support devices, set this option to ensure that users cannot attempt to create block or character special devices in /var/tmp.', 'F-cis-1.1.1.8_fix','Edit the /etc/fstab file and add nodev to the fourth field (mounting options) for the /var/tmp partition. See the fstab(5) manual page for more information. Run the following command to remount /var/tmp: # mount -o remount,nodev /var/tmp','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.1.1.8','CIS-1.1.1.8_chk','If a /var/tmp partition exists run the following command and verify that the nodev option is set on /var/tmp. # mount | grep /var/tmp tmpfs on /var/tmp type tmpfs (rw,nosuid,nodev,noexec,relatime)', 'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is117','sv-1.1.7_cis_rule','default','high','Ensure separate partition exists for /var/tmp','The /var/tmp directory is a world-writable directory used for temporary storage by all users and some applications.Since the /var/tmp directory is intended to be world-writable, there is a risk of resource exhaustion if it is not bound to a separate partition. In addition, making /var/tmp its own file system allows an administrator to set the noexec option on the mount, making /var/tmp useless for an attacker to install executable code. It would also prevent an attacker from establishing a hardlink to a system setuid program and wait for it to be updated. Once the program was updated, the hardlink would be broken and the attacker would have his own copy of the program. If the program happened to have a security vulnerability, the attacker could continue to exploit the known flaw.','F-cis-1.1.7_fix','For new installations, during installation create a custom partition setup and specify a separate partition for /var/tmp. For systems that were previously installed, create a new partition and configure /etc/fstab as appropriate.', '[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.1.7','CIS-1.1.7_chk','Run the following command and verify output shows /var/tmp is mounted:# mount | grep /var/tmp tmpfs on /var/tmp type tmpfs (rw,nosuid,nodev,noexec,relatime)','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is1119','sv-1.1.19_cis_rule','default','medium','Ensure nosuid option set on removable media partitions','The nosuid mount option specifies that the filesystem cannot contain setuid files.Setting this option on a file system prevents users from introducing privileged programs onto the system and allowing non-root users to execute them.','F-cis-1.1.19_fix','Edit the /etc/fstab file and add nosuid to the fourth field (mounting options) of all removable media partitions. Look for entries that have mount points that contain words such as floppy or cdrom. See the fstab(5) manual page for more information.','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.1.19','CIS-1.1.19_chk','Run the following command and verify that the nosuid option is set on all removable media partitions. # mount' ,'Customized rule by Cloud Raxak') from dual;
-- select add_rule_data ('default','C-is121','sv-1.2.1_cis_rule','default','medium','Ensure package manager repositories are configured','Systems need to have package manager repositories configured to ensure they receive the latest patches and updates.If a system''s package repositories are misconfigured important patches may not be identified or a rogue repository could introduce compromised software.','F-cis-1.2.1_fix','Configure your package manager repositories according to site policy.','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.2.1','CIS-1.2.1_chk', 'Run the following command and verify repositories are configured correctly: # yum repolist' ,'Customized rule by Cloud Raxak') from dual;
-- select add_rule_data ('default','C-is152','sv-1.5.2_cis_rule','default','medium','Ensure XD/NX support is enabled','Recent processors in the x86 family support the ability to prevent code execution on a per memory page basis. Generically and on AMD processors, this ability is called No Execute (NX), while on Intel processors it is called Execute Disable (XD). This ability can help prevent exploitation of buffer overflow vulnerabilities and should be activated whenever possible. Extra steps must be taken to ensure that this protection is enabled, particularly on 32-bit x86 systems. Other processors, such as Itanium and POWER, have included such support since inception and the standard kernel for those platforms supports the feature.Enabling any feature that can protect against buffer overflow attacks enhances the security of the system.','F-cis-1.5.2_fix','On 32 bit systems install a kernel with PAE support, no installation is required on 64 bit systems. If necessary configure your bootloader to load the new kernel and reboot the system. You may need to enable NX or XD support in your bios.','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.5.2','CIS-1.5.2_chk', 'Run the following command and verify your kernel has identified and activated NX/XD protection.# dmesg | grep NX NX (Execute Disable) protection: active' ,'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is162','sv-1.6.2_cis_rule','default','medium','Ensure SELinux is installed','SELinux provides Mandatory Access Controls.Without a Mandatory Access Control system installed only the default Discretionary Access Control system will be available.','F-cis-1.6.2_fix','Run the following command to install libselinux: # yum install libselinux','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.6.2','CIS-1.6.2_chk', 'Run the following command and verify libselinux is installed: # rpm -q libselinux libselinux-<version>' ,'Customized rule by Cloud Raxak') from dual;
-- select add_rule_data ('default','C-is1616','sv-1.6.1.6_cis_rule','default','high','Ensure no unconfined daemons exist ','Daemons that are not defined in SELinux policy will inherit the security context of their parent process.Since daemons are launched and descend from the init process, they will inherit the security context label initrc_t. This could cause the unintended consequence of giving the process more permission than it requires.','F-cis-1.6.1.6_fix','Investigate any unconfined daemons found during the audit action. They may need to have an existing security context assigned to them or a policy built for them.','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.6.1.6','CIS-1.6.1.6_chk', 'Run the following command and verify not output is produced: # ps -eZ | egrep "initrc" | egrep -vw "tr|ps|egrep|bash|awk" | tr ":" " " | awk "{ print $NF }"' ,'Customized rule by Cloud Raxak') from dual;
-- select add_rule_data ('default','C-is1711','sv-1.7.1.1_cis_rule','default','high','Ensure message of the day is configured properly','The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users. Unix-based systems have typically displayed information about the OS release and patch level upon logging in to the system. This information can be useful to developers who are developing software for a particular OS platform. If mingetty(8) supports the following options, they display operating system information:\m - machine architecture (uname -m) \r - operating system release (uname -r) \s - operating system name \v - operating system version (uname -v) ','F-cis-1.7.1.1_fix','Edit the /etc/motd file with the appropriate contents according to your site policy, remove any instances of \m, \r, \s, or \v.','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.7.1.1','CIS-1.7.1.1_chk', 'Run the following command and verify that the contents match site policy: # cat /etc/motd Run the following command and verify no results are returned: # egrep "(\\v|\\r|\\m|\\s)" /etc/motd' ,'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is1714','sv-1.7.1.4_cis_rule','default','medium','Ensure permissions on /etc/motd are configured','The contents of the /etc/motd file are displayed to users after login and function as a message of the day for authenticated users.If the /etc/motd file does not have the correct ownership it could be modified by unauthorized users with incorrect or misleading information.','F-cis-1.7.1.4_fix','Run the following commands to set permissions on /etc/motd: # chown root:root /etc/motd # chmod 644 /etc/motd','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.7.1.4','CIS-1.7.1.4_chk', 'Run the following command and verify Uid and Gid are both 0/root and Access is 644: # stat /etc/motd Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)' ,'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is1715','sv-1.7.1.5_cis_rule','default','high','Ensure permissions on /etc/issue are configured','The contents of the /etc/issue file are displayed to users prior to login for local terminals.If the /etc/issue file does not have the correct ownership it could be modified by unauthorized users with incorrect or misleading information.','F-cis-1.7.1.5_fix','Run the following commands to set permissions on /etc/issue: # chown root:root /etc/issue # chmod 644 /etc/issue','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.7.1.5','CIS-1.7.1.5_chk', 'Run the following command and verify Uid and Gid are both 0/root and Access is 644: # stat /etc/issue Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)' ,'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is1716','sv-1.7.1.6_cis_rule','default','medium','Ensure permissions on /etc/issue.net are configured','The contents of the /etc/issue.net file are displayed to users prior to login for remote connections from configured services.If the /etc/issue.net file does not have the correct ownership it could be modified by unauthorized users with incorrect or misleading information.','F-cis-1.7.1.6_fix', 'Run the following commands to set permissions on /etc/issue.net: # chown root:root /etc/issue.net # chmod 644 /etc/issue.net','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-1.7.1.6','CIS-1.7.1.6_chk','Run the following command and verify Uid and Gid are both 0/root and Access is 644: # stat /etc/issue.net Access: (0644/-rw-r--r--) Uid: ( 0/ root) Gid: ( 0/ root)' ,'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is213','sv-2.1.3_cis_rule','default','high','Ensure discard services are not enabled ','discard is a network service that simply discards all data it receives. This service is intended for debugging and testing purposes. It is recommended that this service be disabled.Disabling this service will reduce the remote attack surface of the system.','F-cis-2.1.3_fix','Run the following commands to disable discard-dgram and discard-stream: # chkconfig discard-dgram off # chkconfig discard-stream off','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-2.1.3','CIS-2.1.3_chk', 'Run the following command and verify discard-dgram and discard-stream are off or missing: # chkconfig --list xinetd based services: discard-dgram: off discard-stream: off' ,'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is215','sv-2.1.5_cis_rule','default','high','Ensure time services are not enabled','time is a network service that responds with the servers current date and time as a 32 bit integer. This service is intended for debugging and testing purposes. It is recommended that this service be disabled.Disabling this service will reduce the remote attack surface of the system.','F-cis-2.1.5_fix','Run the following commands to disable time-dgram and time-stream: # chkconfig time-dgram off # chkconfig time-stream off','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-2.1.5','CIS-2.1.5_chk', 'Run the following command and verify time-dgram and time-stream are off or missing: # chkconfig --list xinetd based services: time-dgram: off time-stream: off' ,'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is235','sv-2.3.5_cis_rule','default','high','Ensure LDAP client is not installed','The Lightweight Directory Access Protocol (LDAP) was introduced as a replacement for NIS/YP. It is a service that provides a method for looking up information from a central database.If the system will not need to act as an LDAP client, it is recommended that the software be removed to reduce the potential attack surface.','F-cis-2.3.5_fix','Run the following command to uninstall openldap-clients: # yum remove openldap-clients','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-2.3.5','CIS-2.3.5_chk', 'Run the following commands to verify openldap-clients is not installed: # rpm -q openldap-clients package openldap-clients is not installed' ,'Customized rule by Cloud Raxak') from dual;
-- select add_rule_data ('default','C-is2221','sv-2.2.21_cis_rule','default','high','Ensure rsync service is not enabled','The rsyncd service can be used to synchronize files between systems over network links.','F-cis-2.2.21_fix','Run the following command to disable rsyncd: # systemctl disable rsyncd','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-2.2.21','CIS-2.2.21_chk', 'Run the following command to verify rsyncd is not enabled: # systemctl is-enabled rsync d disabled' ,'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','C-is342','sv-3.4.2_cis_rule','default','high','Ensure /etc/hosts.allow is configured','The /etc/hosts.allow file specifies which IP addresses are permitted to connect to the host. It is intended to be used in conjunction with the /etc/hosts.deny file. The /etc/hosts.allow file supports access control by IP and helps ensure that only authorized systems can connect to the system.','F-cis-3.4.2_fix','Run the following command to create /etc/hosts.allow: # echo "ALL: <net>/<mask>, <net>/<mask>, ..." >/etc/hosts.allow where each <net>/<mask> combination (for example, â€œ192.168.1.0/255.255.255.0â€?) represents one network block in use by your organization that requires access to this system.','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-3.4.2','CIS-3.4.2_chk', 'Run the following command and verify the contents of the /etc/hosts.allow file: # cat /etc/hosts.allow # cat /etc/hosts.allow' ,'Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','C-is343','sv-3.4.3_cis_rule','default','high','Ensure /etc/hosts.deny is configured ','The /etc/hosts.deny file specifies which IP addresses are not permitted to connect to the host. It is intended to be used in conjunction with the /etc/hosts.allow file. The /etc/hosts.deny file serves as a failsafe so that any host not specified in /etc/hosts.allow is denied access to the system.','F-cis-3.4.3_fix','Run the following command to create /etc/hosts.deny: # echo "ALL: ALL" >> /etc/hosts.deny','[debian-based Linux] CIS Profile (Subset)','Profile Customized by CloudRaxak','Linux-CIS-3.4.3','CIS-3.4.3_chk', 'Run the following command and verify the contents of the /etc/hosts.deny file: # cat /etc/hosts.deny ALL: ALL' ,'Customized rule by Cloud Raxak') from dual;
-- CIS RULES