select add_profile_data ('[rpm-based Linux] Demonstration Profile' ,'Profile Customized by CloudRaxak' ,'Linux-based OS','' ,'2015-05-26' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-38443','SV-50243r1_rule','default','medium','The /etc/gshadow file must be owned by root.','The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.','F-43388r1_fix','Run the below command to change the ownership of "/etc/gshadow" to root:: 

 chown root /etc/gshadow' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000036','C-45998r1_chk','To check the ownership of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/gshadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38449','SV-50249r1_rule','default','medium','The /etc/gshadow file must have mode 0000.','The /etc/gshadow file contains group password hashes. Protection of this file is critical for system security.','F-43394r1_fix','To properly set the permissions of "/etc/gshadow", run the command: 

 chmod 0000 /etc/gshadow' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000038','C-46004r1_chk','To check the permissions of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38450','SV-50250r1_rule','default','medium','The /etc/passwd file must be owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43395r1_fix','Run the below command to change the ownership of "/etc/passwd" to root:: 

 chown root /etc/passwd' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000039','C-46005r1_chk','To check the ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If its properly configured, the output should be displayed as shown below:

"File "/etc/passwd" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38451','SV-50251r1_rule','default','medium','The /etc/passwd file must be group-owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43396r1_fix','To change the group ownership of "/etc/passwd" to root, run the command: 

 chgrp root /etc/passwd' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000040','C-46006r1_chk','To check the group ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should be: File "/etc/passwd" is group-owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38457','SV-50257r1_rule','default','medium','The /etc/passwd file must have mode 0644 or less permissive.','If the "/etc/passwd" file is writable by a group-owner or the world the risk of its compromise is increased. The file contains the list of accounts on the system and associated information, and protection of this file is critical for system security.','F-43397r1_fix','To properly set the permissions of "/etc/passwd", run the command: 

 chmod 0644 /etc/passwd' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000041','C-46007r1_chk','To check the permissions of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38469','SV-50269r3_rule','default','medium','All system command files must have mode 755 or less permissive.','System binaries are executed by privileged users, as well as system services, and restrictive permissions are necessary to ensure execution of these programs cannot be co-opted.','F-43414r1_fix','System executables are stored in the following directories by default: 

/bin
/usr/bin
/usr/local/bin
/sbin
/usr/sbin
/usr/local/sbin

If any file in these directories is found to be group-writable or world-writable, change its permission with the following command: 

 chmod go-w []' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000047','C-46024r3_chk','System executables are stored in the following directories by default: 

/bin
/usr/bin
/usr/local/bin
/sbin
/usr/sbin
/usr/local/sbin

All files in these directories should not be group-writable or world-writable. To find system executables that are group-writable or world-writable, run the following command for each directory [] which contains system executables: 

$ find -L [DIR] -perm /022 -type f

If any system executables are found to be group-writable or world-writable, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38480','SV-50280r1_rule','default','low','Users must be warned 7 days in advance of password expiration.','Setting the password warning age enables users to make the change at a practical time.','F-43425r1_fix','To specify how many days prior to password expiration that a warning will be issued to users, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_WARN_AGE [DAYS]

The DoD requirement is 7.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000054','C-46035r1_chk','To check the password warning age, run the command: 

$ grep PASS_WARN_AGE /etc/login.defs

The DoD requirement is 7. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38671','SV-50472r1_rule','default','medium','The sendmail package must be removed.','The sendmail software was not developed with security in mind and its design prevents it from being effectively contained by SELinux. Postfix should be used instead.','F-43620r1_fix','Sendmail is not the default mail transfer agent and is not installed by default. The "sendmail" package can be removed with the following command: 

 rpm -e sendmail --nodeps' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000288','C-46231r1_chk','Run the following command to determine if the "sendmail" package is installed: 

 rpm -q sendmail


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38642','SV-50443r1_rule','default','low','The system default umask for daemons must be 027 or 022.','The umask influences the permissions assigned to files created by a process at run time. An unnecessarily permissive umask could result in files being created with insecure permissions.','F-43592r1_fix','The file "/etc/init.d/functions" includes initialization parameters for most or all daemons started at boot time. The default umask of 022 prevents creation of group- or world-writable files. To set the default umask for daemons, edit the following line, inserting 022 or 027 for [] appropriately: 

umask [UMASK]

Setting the umask to too restrictive a setting can cause serious errors at runtime. Many daemons on the system already individually restrict themselves to a umask of 077 in their own init scripts.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000346','C-46203r1_chk','To check the value of the "umask", run the following command: 

$ grep umask /etc/init.d/functions

The output should show either "022" or "027". 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38643','SV-50444r3_rule','default','medium','There must be no world-writable files on the system.','Data in world-writable files can be modified by any user on the system. In almost all circumstances, files can be configured using a combination of user and group permissions to support whatever legitimate access is needed without the risk caused by world-writable files.','F-43591r1_fix','It is generally a good idea to remove global (other) write access to a file when it is discovered. However, check with documentation for specific applications before making changes. Also, monitor for recurring world-writable files, as these may be symptoms of a misconfigured application or user account.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000282','C-46202r3_chk','To find world-writable files, run the following command for each local partition [], excluding special filesystems such as /selinux, /proc, or /sys: 

 find / -type f -perm -002 -print 2>>/dev/null | grep -v -e ^"/proc" -e ^"/selinux" -e ^"/sys"

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38653','SV-50454r1_rule','default','high','The snmpd service must not use a default password.','Presence of the default SNMP password enables querying of different system aspects and could result in unauthorized knowledge of the system.','F-43602r1_fix','Edit "/etc/snmp/snmpd.conf", remove default community string "public". Upon doing that, restart the SNMP service: 

 service snmpd restart' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000341','C-46213r1_chk','To ensure the default password is not set, run the following command: 

 grep -v "^" /etc/snmp/snmpd.conf| grep public

There should be no output. 
If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38494','SV-50295r1_rule','default','low','The system must prevent the root account from logging in from serial consoles.','Preventing direct root login to serial port interfaces helps ensure accountability for actions taken on the systems using the root account.','F-43441r1_fix','To restrict root logins on serial ports, ensure lines of this form do not appear in "/etc/securetty": 

ttyS0
ttyS1

Note:  Serial port entries are not limited to those listed above.  Any lines starting with "ttyS" followed by numerals should be removed' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000028','C-46051r1_chk','To check for serial port entries which permit root login, run the following command: 

 grep "^ttyS[]" /etc/securetty

If any output is returned, then root login over serial ports is permitted. 
If root login over serial ports is permitted, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38624','SV-50425r1_rule','default','low','System logs must be rotated daily.','Log files that are not properly rotated run the risk of growing so large that they fill up the /var/log partition. Valuable logging information could be lost if the /var/log partition becomes full.','F-43573r1_fix','If the "logrotate" service is not installed, install it by running.

 yum install logrotate

Add the following text to the top of the configuration file /etc/logrotate.conf :

daily

To Schedule a cron job in /etc/crontab :

Make sure logrotate script is present in /etc/cron.daily directory.

 ls -l /etc/cron.daily/logrotate

Schedule the job as below:

25 6 * * * root run-parts --report /etc/cron.daily

OR you can schedule it in /etc/anacrontab

To schedule a cron job in /etc/anacrontab :

1        5        cron.daily        run-parts --report /etc/cron.daily' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000138','C-46183r1_chk','Run the following commands to determine the current status of the "logrotate" configuration.

Make sure logrotate configuration file is configured to rotate logs daily.

 grep daily /etc/logrotate.conf

The string "daily" must be at the top of the configuration file /etc/logrotate.conf.

Check whether a cron job is scheduled in /etc/crontab or /etc/anacrontab which rotates logs daily. Make sure it is scheduled for daily execution.

 grep /etc/cron.daily /etc/crontab
 grep /etc/cron.daily /etc/anacrontab

If the logrotate service is not run on a daily basis by cron in crontab or anacrontab, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38579','SV-50380r1_rule','default','medium','The system boot loader configuration file(s) must be owned by root.','Only root should be able to modify important boot parameters.','F-43527r1_fix','The file "/etc/grub.conf" should be owned by the "root" user to prevent destruction or modification of the file. To change the owner of "/etc/grub.conf" to root, run the command: 

 chown root /etc/grub.conf' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000065','C-46137r1_chk','To check the ownership of "/etc/grub.conf", run the command: 

$ ls -lL /etc/grub.conf

If properly configured, the output should be displayed as shown below:

The system boot loader configuration file is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38591','SV-50392r1_rule','default','high','The rsh-server package must not be installed.','The "rsh-server" package provides several obsolete and insecure network services. Removing it decreases the risk of those services" accidental (or intentional) activation.','F-43539r1_fix','The "rsh-server" package can be uninstalled with the following command: 

 rpm -e rsh-server --nodeps' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000213','C-46149r1_chk','Run the following command to determine if the "rsh-server" package is installed: 

 rpm -q rsh-server


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38587','SV-50388r1_rule','default','high','The telnet-server package must not be installed.','Removing the "telnet-server" package decreases the risk of the unencrypted telnet service"s accidental (or intentional) activation.

Mitigation:  If the telnet-server package is configured to only allow encrypted sessions, such as with Kerberos or the use of encrypted network tunnels, the risk of exposing sensitive information is mitigated.','F-43535r1_fix','The "telnet-server" package can be uninstalled with the following command: 

 rpm -e telnet-server --nodeps' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000206','C-46144r1_chk','Run the following command to determine if the "telnet-server" package is installed: 

 rpm -q telnet-server


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38614','SV-50415r1_rule','default','high','The SSH daemon must not allow authentication using an empty password.','Configuring this setting for the SSH daemon provides additional assurance that remote login via SSH will require a password, even in the event of misconfiguration elsewhere.','F-43562r1_fix','To explicitly disallow remote login from accounts with empty passwords, add or correct the following line in "/etc/ssh/sshd_config": 

PermitEmptyPasswords no

Any accounts with empty passwords should be disabled immediately, and PAM configuration should prevent users from being able to assign themselves empty passwords.

Restart ssh service to get changes in effect:

$ service ssh restart' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000239','C-46172r1_chk','To determine how the SSH daemon"s "PermitEmptyPasswords" option is set, run the following command: 

 grep -iw PermitEmptyPasswords /etc/ssh/sshd_config  | grep -v "^"

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38669','SV-50470r1_rule','default','low','The postfix service must be enabled for mail delivery.','Local mail delivery is essential to some system maintenance and notification tasks.','F-43618r1_fix','The Postfix mail transfer agent is used for local mail delivery within the system. The default configuration only listens for connections to the default SMTP port (port 25) on the loopback interface (127.0.0.1). It is recommended to leave this service enabled for local mail delivery. The "postfix" service can be enabled with the following command: 

 chkconfig postfix on
 service postfix start' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000287','C-46230r1_chk','Run the following command to determine the current status of the "postfix" service:

 service postfix status

If the service is enabled, it should return the following:
postfix is running...

To check that the "postfix" service is disabled in system boot configuration, run the following command:

$ chkconfig --list postfix

Output should indicate as shown in the example below:
$ chkconfig --list postfix
"postfix" 0:on 1:on 2:on 3:on 4:on 5:on 6:on


If the service is not enabled, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38676','SV-50477r2_rule','default','low','The xorg-x11-server-common (X Windows) package must not be installed, unless required.','Unnecessary packages should not be installed to decrease the attack surface of the system.','F-43625r1_fix','Removing all packages which constitute the X Window System ensures users or malicious software cannot start X. To do so, run the following command: 

 rpm -e xorg-x11-server-common --nodeps"' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000291','C-46236r1_chk','To ensure the X Windows package group is removed, run the following command: 

$ rpm -qi xorg-x11-server-common

The output should be: 

package xorg-x11-server-common is not installed


If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38631','SV-50432r2_rule','default','medium','The operating system must employ automated mechanisms to facilitate the monitoring and control of remote access methods.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43580r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start

 chkconfig --level 2345 auditd on' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000148','C-46190r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

auditd is running...

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38605','SV-50406r2_rule','default','medium','The cron service must be running.','Due to its usage for maintenance and security-supporting tasks, enabling the cron daemon is essential.','F-43553r2_fix','The "crond" service is used to execute commands at preconfigured times. It is required by almost all systems to perform necessary maintenance tasks, such as notifying root of system activity. The "crond" service can be enabled with the following commands: 

 chkconfig crond on
 service crond start' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000224','C-46163r1_chk','Run the following command to determine the current status of the "crond" service: 

 service crond status

If the service is enabled, it should return the following: 

crond is running...


If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38500','SV-50301r2_rule','default','medium','The root account must be the only account having a UID of 0.','An account has root authority if it has a UID of 0. Multiple accounts with a UID of 0 afford more opportunity for potential intruders to guess a password for a privileged account. Proper configuration of sudo is recommended to afford multiple system administrators access to root privileges in an accountable manner.','F-43447r1_fix','If any account other than root has a UID of 0, this misconfiguration should be investigated and the accounts other than root should be removed or have their UID changed.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000032','C-46057r2_chk','To list all password file entries for accounts with UID 0, run the following command: 

 awk -F: "($3 == "0") {print}" /etc/passwd | grep -v "^"

This should print only one line, for the user root. 
If any account other than root has a UID of 0, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38475','SV-50275r1_rule','default','medium','The system must require passwords to contain a minimum of 14 characters.','Requiring a minimum password length makes password cracking attacks more difficult by ensuring a larger search space. However, any security benefit from an onerous requirement must be carefully weighed against usability problems, support costs, or counterproductive behavior that may result.

While it does not negate the password length requirement, it is preferable to migrate from a password-based authentication scheme to a stronger one based on PKI (public key infrastructure).','F-43419r1_fix','To specify password length requirements for new accounts, edit in the file "/etc/pam.d/system-auth" and update the minimum password length (minlen) parameter in the below line e.g:
password requisite pam_cracklib.so minlen=14 ucredit=0 lcredit=0 ocredit=0 dcredit=0

INFO: minlen should be >= 14 and the credits limit should be less or equal to 0 for the validation criteria in the rule.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000050','C-46029r1_chk','To check the minimum password length and to check the other settings required for the password authentication, run the command:

$ grep -v "^" /etc/pam.d/system-auth | grep -w pam_cracklib.so | grep -w password
For Redhat/Centos Version >=7 the pam_pwquality.so module is used.

If minlen is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38477','SV-50277r1_rule','default','medium','Users must not be able to change passwords more than once every 24 hours.','Setting the minimum password age protects against users cycling back to a favorite password after satisfying the password reuse requirement.','F-43422r1_fix','To specify password minimum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MIN_DAYS [DAYS]

A value of 1 day is considered sufficient for many environments. The DoD requirement is 1.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000051','C-46032r1_chk','To check the minimum password age, run the command: 

$ grep PASS_MIN_DAYS /etc/login.defs

The DoD requirement is 1. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38484','SV-50285r2_rule','default','medium','The operating system, upon successful logon, must display to the user the date and time of the last logon or access via ssh.','Users need to be aware of activity that occurs regarding their account. Providing users with information regarding the date and time of their last successful login allows the user to determine if any unauthorized activity has occurred and gives them an opportunity to notify administrators.

At ssh login, a user must be presented with the last successful login date and time.','F-43431r2_fix','Update the "PrintLastLog" keyword to "yes" in /etc/ssh/sshd_config:

PrintLastLog yes

While it is acceptable to remove the keyword entirely since the default action for the SSH daemon is to print the last logon date and time, it is preferred to have the value explicitly documented.

Restart ssh service to get changes in effect:
 
$ service sshd restart' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000507','C-46041r2_chk','Verify the value associated with the "PrintLastLog" keyword in /etc/ssh/sshd_config:

 grep -iw PrintLastLog /etc/ssh/sshd_config | grep -v "^" 

If the "PrintLastLog" keyword is not present, this is not a finding.  If the value is not set to "yes", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38621','SV-50422r1_rule','default','medium','The system clock must be synchronized to an authoritative DoD time source.','Synchronizing with an NTP server makes it possible to collate system logs from multiple sources or correlate computer events with real time events. Using a trusted NTP server provided by your organization is recommended.','F-43570r1_fix','To specify a remote NTP server for time synchronization, edit the file "/etc/ntp.conf". Add or correct the following lines, substituting the IP or hostname of a remote NTP server for ntpserver. 

server []

This instructs the NTP software to contact that remote server to obtain time data.

Restart NTP service to get changes in effect by using the command:
$ service ntpd restart' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000248','C-46180r1_chk','Run the following command to determine the current status of the "ntpd" service: 

 service ntpd status

If the service is enabled, it should return the following:

ntpd is running...

If the service is not running, this is a finding.

Run the following command to determine the current status of the "ntpd" server configuration:

 ntpq -p | wc -l

If NTP servers are properly configured for synchronizing the time, you can see get output is "0".

If output is "1", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38634','SV-50435r2_rule','default','medium','The system must rotate audit log files that reach the maximum file size.','Automatically rotating logs (by setting this to "rotate") minimizes the chances of the system unexpectedly running out of disk space by being overwhelmed with log data. However, for systems that must never discard log data, or which use external processes to transfer it and reclaim space, "keep_logs" can be employed.','F-43583r1_fix','The default action to take when the logs reach their maximum size is to rotate the log files, discarding the oldest one. To configure the action taken by "auditd", add or correct the line in "/etc/audit/auditd.conf": 

max_log_file_action = []

Possible values for [ACTION] are described in the "auditd.conf" man page. These include: 

"ignore"
"syslog"
"suspend"
"rotate"
"keep_logs"


Set the "[ACTION]" to "rotate" to ensure log rotation occurs. This is the default. The setting is case-insensitive.
If auditd package is not installed then rule will install it before fixing changes.

Reload the auditd.

$ service auditd reload' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000161','C-46193r3_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to rotate logs when they reach their maximum size:

 grep -wi max_log_file_action /etc/audit/auditd.conf | grep -v "^"

max_log_file_action = rotate

If the "keep_logs" option is configured for the "max_log_file_action" line in "/etc/audit/auditd.conf" and an alternate process is in place to ensure audit data does not overwhelm local audit storage, this is not a finding.

If the system has not been properly set up to rotate audit logs, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38464','SV-50264r1_rule','default','medium','The audit system must take appropriate action when there are disk errors on the audit storage volume.','Taking appropriate action in case of disk errors will minimize the possibility of losing audit records.','F-43410r1_fix','Edit the file "/etc/audit/auditd.conf". Modify the following line, substituting [] appropriately: 

disk_error_action = [ACTION]

Possible values for [ACTION] are described in the "auditd.conf" man page. These include: 

"ignore"
"syslog"
"exec"
"suspend"
"single"
"halt"


Set this to "syslog" or "exec".

Reload the auditd.

$ service auditd reload' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000511','C-46020r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when disk errors occur:

 grep -wi disk_error_action /etc/audit/auditd.conf | grep -v "^"
disk_error_action = []


If the system is configured to except "syslog" or "exec" when disk errors occur, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38466','SV-50266r1_rule','default','medium','Library files must be owned by root.','Files from shared library directories are loaded into the address space of processes (including privileged ones) or of the kernel itself at runtime. Proper ownership is necessary to protect the integrity of the system.','F-43411r1_fix','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64

If any file in these directories is found to be owned by a user other than root, correct its ownership with the following command: 

 chown root []' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000046','C-46021r1_chk','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64


Kernel modules, which can be added to the kernel during runtime, are stored in "/lib/modules". All files in these directories should not be group-writable or world-writable.  To find shared libraries that are not owned by "root", run the following command for each directory [] which contains shared libraries: 

$ find -L [DIR] \! -user root


If any of these files are not owned by root, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38670','SV-50471r2_rule','default','medium','The operating system must detect unauthorized changes to software and information. ','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43619r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000306','C-46229r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38647','SV-50448r1_rule','default','low','The system default umask in /etc/profile must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43596r1_fix','To ensure the default umask controlled by "/etc/profile" is set properly, add or correct the "umask" setting in "/etc/profile" to read as follows: 

umask 077' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000344','C-46207r1_chk','Verify the "umask" setting is configured correctly in the "/etc/profile" file by running the following command: 

 grep "umask" /etc/profile

All output must show the value of "umask" set to 077, as shown in the below: 

 grep "umask" /etc/profile
umask 077


If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38692','SV-50493r1_rule','default','low','Accounts must be locked upon 35 days of inactivity.','Disabling inactive accounts ensures that accounts which may not have been responsibly removed are not available to attackers who may have compromised their credentials.','F-43641r2_fix','To specify the number of days after a password expires (which signifies inactivity) until an account is permanently disabled, add or correct the following lines in "/etc/default/useradd", substituting "[]" appropriately: 

INACTIVE=[NUM_DAYS]

A value of 35 is recommended. If a password is currently on the verge of expiration, then 35 days remain until the account is automatically disabled. However, if the password will not expire for another 60 days, then 95 days could elapse until the account would be automatically disabled. See the "useradd" man page for more information. Determining the inactivity timeout must be done with careful consideration of the length of a "normal" period of inactivity for users in the particular environment. Setting the timeout too low incurs support costs and also has the potential to impact availability of the system to legitimate users.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000334','C-46254r2_chk','To verify the "INACTIVE" setting, run the following command: 

$ grep -w "INACTIVE" /etc/default/useradd | grep -v "^\s*"

The output should indicate the "INACTIVE" configuration option is set to an appropriate integer as shown in the example below: 

INACTIVE=35

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
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

$ service sshd restart' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000073','C-46150r1_chk','To check if the system login banner is compliant, run the following command: 

$ cat /etc/issue

If it does not display the required banner, this is a finding.

To check the parameter "Banner /etc/issue" in /etc/ssh/sshd_config.

$ grep -wi Banner /etc/ssh/sshd_config | grep -v "^"

If the parameter "Banner /etc/issue" not found in /etc/ssh/sshd_config this is finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38521','SV-50322r1_rule','default','medium','The operating system must support the requirement to centrally manage the content of audit records generated by organization defined information system components.','A log server (loghost) receives syslog messages from one or more systems. This data can be used as an additional log source in the event a system is compromised and its local logs are suspect. Forwarding log messages to a remote loghost also provides system administrators with a centralized place to view the status of multiple hosts within the enterprise.','F-43656r1_fix','To configure rsyslog to send logs to a remote log server, open "/etc/rsyslog.conf" and read and understand the last section of the file, which describes the multiple directives necessary to activate remote logging. Along with these other directives, the system can be configured to forward its logs to a particular log server by adding or correcting one of the following lines, substituting "[]" appropriately. The choice of protocol depends on the environment of the system; although TCP and RELP provide more reliable message delivery, they may not be supported in all environments. 
To use UDP for log message delivery: 

*.* @[loghost.example.com]


To use TCP for log message delivery: 

*.* @@[loghost.example.com]


To use RELP for log message delivery: 

*.* :omrelp:[loghost.example.com]' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000137','C-46269r1_chk','To ensure logs are sent to a remote host, examine the file "/etc/rsyslog.conf". If using UDP, a line similar to the following should be present: 

*.* @[]

If using TCP, a line similar to the following should be present: 

*.* @@[loghost.example.com]

If using RELP, a line similar to the following should be present: 

*.* :omrelp:[loghost.example.com]


If none of these are present, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38584','SV-50385r1_rule','default','low','The xinetd service must be uninstalled if no network services utilizing it are enabled.','Removing the "xinetd" package decreases the risk of the xinetd service"s accidental (or intentional) activation.','F-43532r1_fix','The "xinetd" package can be uninstalled with the following command: 

 rpm -e xinetd --nodeps' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000204','C-46142r1_chk','If network services are using the xinetd service, this is not applicable.

Run the following command to determine if the "xinetd" package is installed: 

 rpm -q xinetd

If the package is installed, check if any network services is utilizing xinetd using command:

 netstat -atunlp | grep "xinetd"

If No Network service(s) is using the "xinetd" but package is installed on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38585','SV-50386r2_rule','default','medium','The system boot loader must require authentication.','Password protection on the boot loader configuration ensures users with physical access cannot trivially alter important bootloader settings. These include which kernel to use, and whether to enter single-user mode.','F-43533r1_fix','The grub boot loader should have password protection enabled to protect boot-time settings. To do so, select a password and then generate a hash from it by running the following command: 

 grub-crypt --sha-512

When prompted to enter a password, insert the following line into "/etc/grub.conf" immediately after the header comments. (Use the output from "grub-crypt" as the value of []): 

password --encrypted [password-hash]' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000068','C-46143r2_chk','To verify the boot loader password has been set and encrypted, run the following command: 

 grep password /etc/grub.conf

The output should show the following: 

password --encrypted $6$[]

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38668','SV-50469r2_rule','default','high','The x86 Ctrl-Alt-Delete key sequence must be disabled.','A locally logged-in user who presses Ctrl-Alt-Delete, when at the console, can reboot the system. If accidentally pressed, as could happen in the case of mixed OS environment, this can create the risk of short-term loss of availability of systems due to unintentional reboot. In the GNOME graphical environment, risk of unintentional reboot from the Ctrl-Alt-Delete sequence is reduced because the user will be prompted before any action is taken.','F-43617r2_fix','By default, the system includes the following line in "/etc/init/control-alt-delete.conf" to reboot the system when the Ctrl-Alt-Delete key sequence is pressed:

exec /sbin/shutdown -r now "Ctrl-Alt-Delete pressed"


To configure the system to log a message instead of rebooting the system, add the following line to "/etc/init/control-alt-delete.override" to read as follows:

exec /usr/bin/logger -p security.info "Ctrl-Alt-Delete pressed"' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000286','C-46228r2_chk','To ensure the system is configured to log a message instead of rebooting the system when Ctrl-Alt-Delete is pressed, ensure the following line is in "/etc/init/control-alt-delete.override":

exec /usr/bin/logger -p security.info "Control-Alt-Delete pressed"

If the system is not configured to block the shutdown command when Ctrl-Alt-Delete is pressed, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38486','SV-50287r1_rule','default','medium','The operating system must conduct backups of system-level information contained in the information system per organization defined frequency to conduct backups that are consistent with recovery time and recovery point objectives.','Operating system backup is a critical step in maintaining data assurance and availability. System-level information includes system-state information, operating system and application software, and licenses. Backups must be consistent with organizational recovery time and recovery point objectives.','F-43434r1_fix','Procedures to back up OS data from the system must be established and executed. The Red Hat operating system provides utilities for automating such a process.  Commercial and open-source products are also available.

Implement a process whereby OS data is backed up from the system in accordance with local policies.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000505','C-46044r1_chk','Ask an administrator if a process exists to back up OS data from the system, including configuration data. 

If such a process does not exist, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38488','SV-50289r1_rule','default','medium','The operating system must conduct backups of user-level information contained in the operating system per organization defined frequency to conduct backups consistent with recovery time and recovery point objectives.','Operating system backup is a critical step in maintaining data assurance and availability. User-level information is data generated by information system and/or application users. Backups shall be consistent with organizational recovery time and recovery point objectives.','F-43435r1_fix','Procedures to back up user data from the system must be established and executed. The Red Hat operating system provides utilities for automating such a process.  Commercial and open-source products are also available.

Implement a process whereby user data is backed up from the system in accordance with local policies.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000504','C-46045r1_chk','Ask an administrator if a process exists to back up user data from the system. 

If such a process does not exist, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38667','SV-50468r2_rule','default','medium','The system must have a host-based intrusion detection tool installed.','Adding host-based intrusion detection tools can provide the capability to automatically take actions in response to malicious behavior, which can provide additional agility in reacting to network threats. These tools also often include a reporting capability to provide network awareness of system, which may not otherwise exist in an organization"s systems management regime.','F-43616r2_fix','Installing Aide package using the command:

$ yum install aide

Creating aide database by using the command:

$ aide --init' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000285','C-46227r1_chk','Inspect the system to determine if intrusion detection software has been installed. Verify the intrusion detection software is active by using selinux or aide tools.

If no host-based intrusion detection tools are installed, this is a finding

Check selinux status on the system by using the command:
$ getenforce

If output is not "Enforcing", selinux is not active on the system.

Check aide package on the system using the command:

$ rpm -q aide

Output should be "aide is running...". If not, this is a finding.

Check aide database as per aide configuration file.
If aide database does not exist on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38699','SV-50500r2_rule','default','low','All public directories must be owned by a system account.','Allowing a user account to own a world-writable directory is undesirable because it allows the owner of that directory to remove or replace any files that may be placed in the directory by other users.','F-43648r1_fix','All directories in local partitions which are world-writable should be owned by root or another system account. If any world-writable directories are not owned by a system account, this should be investigated. Following this, the files should be deleted or assigned to an appropriate group.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000337','C-46260r3_chk','The following command will discover and print world-writable directories that are not owned by a system account, given the assumption that only system accounts have a uid lower than 500. Run it once for each local partition []: 

 find / -perm -0002 -type d -uid +499  -print 2>>/dev/null

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38659','SV-50460r1_rule','default','low','The operating system must employ cryptographic mechanisms to protect information in storage.','The risk of a system"s physical compromise, particularly mobile systems such as laptops, places its data at risk of compromise. Encrypting this data mitigates the risk of its loss if the system is lost.','F-43609r1_fix','The operating system must employ cryptographic mechanisms to protect information in storage. The easiest way to encrypt a partition is during installation time. The cryptographic mechanisms need user input. So if cryptographic mechanisms are required for your environment then please implement it manually with required settings.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000275','C-46220r1_chk','To check the available list of disk(s) which have a cryptographic mechanism to protect data on the system using command:

 blkid -t TYPE="crypto_LUKS"
If encryption must be used and is not employed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38439','SV-50239r1_rule','default','medium','The system must provide automated support for account management functions.','A comprehensive account management process that includes automation helps to ensure the accounts designated as requiring attention are consistently and promptly addressed. Enterprise environments make user account management challenging and complex. A user management process requiring administrators to manually address account management functions adds risk of potential oversight.','F-43384r1_fix','Implement an automated system for managing user accounts that minimizes the risk of errors, either intentional or deliberate.  If possible, this system should integrate with an existing enterprise user management system, such as, one based Active Directory or Kerberos.' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000524','C-45994r1_chk','Interview the SA to determine if there is an automated system for managing user accounts, preferably integrated with an existing enterprise user management system.

If there is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38595','SV-50396r2_rule','default','medium','The system must be configured to require the use of a CAC, PIV compliant hardware token, or Alternate Logon Token (ALT) for authentication.','Smart card login provides two-factor authentication stronger than that provided by a username/password combination. Smart cards leverage a PKI (public key infrastructure) in order to provide and verify credentials.','F-43544r2_fix','To enable smart card authentication, consult the documentation at:

https://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Managing_Smart_Cards/enabling-smart-card-login.html

For guidance on enabling SSH to authenticate against a Common Access Card (CAC), consult documentation at:

https://access.redhat.com/solutions/82273' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000349','C-46154r1_chk','Interview the SA to determine if all accounts not exempted by policy are using CAC authentication. For DoD systems, the following systems and accounts are exempt from using smart card (CAC) authentication: 

SIPRNET systems
Standalone systems
Application accounts
Temporary employee accounts, such as students or interns, who cannot easily receive a CAC or PIV
Operational tactical locations that are not collocated with RAPIDS workstations to issue CAC or ALT
Test systems, such as those with an Interim Approval to Test (IATT) and use a separate VPN, firewall, or security measure preventing access to network and system components from outside the protection boundary documented in the IATT.



If non-exempt accounts are not using CAC authentication, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38661','SV-50462r1_rule','default','low','The operating system must protect the confidentiality and integrity of data at rest. ','The risk of a system"s physical compromise, particularly mobile systems such as laptops, places its data at risk of compromise. Encrypting this data mitigates the risk of its loss if the system is lost.','F-43610r1_fix','Red Hat Enterprise Linux 6 natively supports partition encryption through the Linux Unified Key Setup-on-disk-format (LUKS) technology. The easiest way to encrypt a partition is during installation time. 

For manual installations, select the "Encrypt" checkbox during partition creation to encrypt the partition. When this option is selected the system will prompt for a passphrase to use in decrypting the partition. The passphrase will subsequently need to be entered manually every time the system boots. 

For automated/unattended installations, it is possible to use Kickstart by adding the "--encrypted" and "--passphrase=" options to the definition of each partition to be encrypted. For example, the following line would encrypt the root partition: 

part / --fstype=ext3 --size=100 --onpart=hda1 --encrypted --passphrase=[]

Any [PASSPHRASE] is stored in the Kickstart in plaintext, and the Kickstart must then be protected accordingly. Omitting the "--passphrase=" option from the partition definition will cause the installer to pause and interactively ask for the passphrase during installation. 

Detailed information on encrypting partitions using LUKS can be found on the Red Had Documentation web site:
https://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/sect-Security_Guide-LUKS_Disk_Encryption.html' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000276','C-46221r1_chk','Determine if encryption must be used to protect data on the system. 
If encryption must be used and is not employed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38662','SV-50463r1_rule','default','low','The operating system must employ cryptographic mechanisms to prevent unauthorized disclosure of data at rest unless otherwise protected by alternative physical measures.','The risk of a system"s physical compromise, particularly mobile systems such as laptops, places its data at risk of compromise. Encrypting this data mitigates the risk of its loss if the system is lost.','F-43611r1_fix','Red Hat Enterprise Linux 6 natively supports partition encryption through the Linux Unified Key Setup-on-disk-format (LUKS) technology. The easiest way to encrypt a partition is during installation time. 

For manual installations, select the "Encrypt" checkbox during partition creation to encrypt the partition. When this option is selected the system will prompt for a passphrase to use in decrypting the partition. The passphrase will subsequently need to be entered manually every time the system boots. 

For automated/unattended installations, it is possible to use Kickstart by adding the "--encrypted" and "--passphrase=" options to the definition of each partition to be encrypted. For example, the following line would encrypt the root partition: 

part / --fstype=ext3 --size=100 --onpart=hda1 --encrypted --passphrase=[]

Any [PASSPHRASE] is stored in the Kickstart in plaintext, and the Kickstart must then be protected accordingly. Omitting the "--passphrase=" option from the partition definition will cause the installer to pause and interactively ask for the passphrase during installation. 

Detailed information on encrypting partitions using LUKS can be found on the Red Had Documentation web site:
https://docs.redhat.com/docs/en-US/Red_Hat_Enterprise_Linux/6/html/Security_Guide/sect-Security_Guide-LUKS_Disk_Encryption.html' , '[rpm-based Linux] Demonstration Profile','Profile Customized by CloudRaxak','RHEL-06-000277','C-46222r1_chk','Determine if encryption must be used to protect data on the system. 
If encryption must be used and is not employed, this is a finding.','Customized rule by Cloud Raxak') from dual;
