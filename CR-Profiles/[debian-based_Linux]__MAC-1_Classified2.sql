select add_profile_data ('[debian-based Linux] ISO-27002-v1' ,'Profile Customized by CloudRaxak' ,'Linux-based OS','' ,'2015-05-26' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-38438','SV-50238r2_rule','default','low','Auditing must be enabled at boot by setting a kernel parameter.','Each process on the system carries an "auditable" flag which indicates whether its activities can be audited. Although "auditd" takes care of enabling this for all processes which launch after it does, adding the kernel argument ensures it is set for every process during boot.','F-43382r2_fix','To ensure all processes can be audited, even those which start prior to the audit daemon, add the argument "audit=1" to the kernel line in "/etc/default/grub", in the manner below:

GRUB_CMDLINE_LINUX="audit=1"

and run the following command to update the grub.

 update-grub


UEFI systems may prepend "/boot" to the "/vmlinuz-version" argument.

If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000525','C-45992r2_chk','Inspect the kernel boot arguments (which follow the word "GRUB_CMDLINE_LINUX") in "/etc/default/grub". If they include "audit=1", then auditing is enabled at boot time. 

If auditing is not enabled at boot time, this is a finding.

If auditd package is not installed then rule will install it before fixing changes.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38546','SV-50347r2_rule','default','medium','The IPv6 protocol handler must not be bound to the network stack unless needed.','Any unnecessary network stacks - including IPv6 - should be disabled, to reduce the vulnerability to exploitation.','F-43494r2_fix','To disable IPv6 module, add net.ipv6.conf.all.disable_ipv6 = 1 to following file

 /etc/sysctl.conf

and run the following command to reload settings from config files without rebooting the system.

 sysctl --system

To disable IPv6 module from GRUB, add following line in /etc/default/grub.

 GRUB_CMDLINE_LINUX="ipv6.disable=1"

and run the following command to update the grub.

 update-grub
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000098','C-46104r2_chk','Check if IPv6 module is enabled or not using the following command :

 sysctl "net.ipv6.conf" | grep "disable_ipv6 = 0"

0 is enabled, 1 is disabled.

To verify if IPv6 is disabled in GRUB, run the following:

 grep -iw "ipv6.disable" /boot/grub/grub.cfg | grep -v "^\s*"

0 is enabled, 1 is disabled.

If IPv6 is disabled, this is not applicable.

Run the following command to determine if there is connection established on IPv6:

 ss -6taupn | grep ESTAB

tcp    ESTAB      0      0      fe80::5054:ff:fe3e:21e6%eth0:22    fe80::dacb:8aff:fe28:298e:39604  users:(("sshd",pid=2525,fd=3),("sshd",pid=2523,fd=3))

If you get output like above, this rule is not applicable.

If ipv6 is enabled and not in use, this is the finding.
    ','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000523','C-45999r2_chk','Check if IPv6 module is enabled or not using the following command : 

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
select add_rule_data ('default','V-38669','SV-50470r1_rule','default','low','The postfix service must be enabled for mail delivery.','Local mail delivery is essential to some system maintenance and notification tasks.','F-43618r1_fix','The Postfix mail transfer agent is used for local mail delivery within the system. The default configuration only listens for connections to the default SMTP port (port 25) on the loopback interface (127.0.0.1). It is recommended to leave this service enabled for local mail delivery. The "postfix" service can be enabled with the following command: 

 sysv-rc-conf --level 0123456S postfix on
 service postfix start' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000287','C-46230r1_chk','Run the following command to determine the current status of the "postfix" service:

 service postfix status

If the service is enabled, it should return the following:
* postfix is running

To check that the "postfix" service is disabled in system boot configuration, run the following command:

$ sysv-rc-conf --list postfix

Output should indicate as shown in the example below:
$ sysv-rc-conf --list postfix
"postfix" 0:on 1:on 2:on 3:on 4:on 5:on 6:on S:on

If the service is not enabled, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38446','SV-50246r1_rule','default','medium','The mail system must forward all mail for root to one or more system administrators.','A number of system services utilize email messages sent to the root user to notify system administrators of active or impending issues.  These messages must be forwarded to at least one monitored email address.','F-43391r1_fix','Set up an alias for root that forwards to a monitored email address:

 echo "root: <system.administrator>@mail.mil" >> /etc/aliases
 newaliases' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000521','C-46001r1_chk','Find the list of alias maps used by the Postfix mail server:

 postconf alias_maps

Query the Postfix alias maps for an alias for "root":

 postmap -q root <alias_map>

If there are no aliases configured for root that forward to a monitored email address, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38622','SV-50423r2_rule','default','medium','Mail relaying must be restricted.','This ensures "postfix" accepts mail messages (such as cron job reports) from the local system only, and not from the network, which protects it from network attack.','F-43572r1_fix','Edit the file "/etc/postfix/main.cf" to ensure that only the following "inet_interfaces" line appears: 

inet_interfaces = localhost' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000249','C-46182r2_chk','If the system is an authorized mail relay host, this is not applicable. 

Run the following command to ensure postfix accepts mail messages from only the local system: 

$ grep -w ^inet_interfaces /etc/postfix/main.cf | grep -v "^"

If properly configured, the output should show only "localhost". 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38460','SV-50260r1_rule','default','low','The NFS server must not have the all_squash option enabled.','The "all_squash" option maps all client requests to a single anonymous uid/gid on the NFS server, negating the ability to track file access by user ID.','F-43405r1_fix','Remove any instances of the "all_squash" option from the file "/etc/exports".  Restart the NFS daemon for the changes to take effect.

 service nfs-kernel-server restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000515','C-46016r1_chk','If the NFS server is read-only, in support of unrestricted access to organizational content, this is not applicable.

The related "root_squash" option provides protection against remote administrator-level access to NFS server content.  Its use is not a finding.

To verify the "all_squash" option has been disabled, run the following command:

 grep -w all_squash /etc/exports | grep -v "^"

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38475','SV-50275r1_rule','default','medium','The system must require passwords to contain a minimum of 14 characters.','Requiring a minimum password length makes password cracking attacks more difficult by ensuring a larger search space. However, any security benefit from an onerous requirement must be carefully weighed against usability problems, support costs, or counterproductive behavior that may result.

While it does not negate the password length requirement, it is preferable to migrate from a password-based authentication scheme to a stronger one based on PKI (public key infrastructure).','F-43419r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

To specify password length requirements for new accounts,
edit the file "/etc/pam.d/common-password" and update the minimum password length (minlen) parameter in the below line e.g:

password requisite pam_cracklib.so minlen=14 ucredit=0 lcredit=0 ocredit=0 dcredit=0

INFO: minlen should be >= 14 and the credits limit should be less or equal to 0 for the validation criteria in the rule.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000050','C-46029r1_chk','To check the minimum password length and to check the other settings required for the password authentication, run the command:

$ grep -v "^" /etc/pam.d/common-password | grep -w pam_cracklib.so | grep -w password

If minlen is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38479','SV-50279r1_rule','default','medium','User passwords must be changed at least every 60 days.','Setting the password maximum age ensures users are required to periodically change their passwords. This could possibly decrease the utility of a stolen password. Requiring shorter password lifetimes increases the risk of users writing down the password in a convenient location subject to physical compromise.','F-43424r1_fix','To specify password maximum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MAX_DAYS [DAYS]

The DoD requirement is 60.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000053','C-46034r1_chk','To check the maximum password age, run the command: 

$ grep PASS_MAX_DAYS /etc/login.defs

The DoD requirement is 60. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38477','SV-50277r1_rule','default','medium','Users must not be able to change passwords more than once every 24 hours.','Setting the minimum password age protects against users cycling back to a favorite password after satisfying the password reuse requirement.','F-43422r1_fix','To specify password minimum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MIN_DAYS [DAYS]

A value of 1 day is considered sufficient for many environments. The DoD requirement is 1.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000051','C-46032r1_chk','To check the minimum password age, run the command: 

$ grep PASS_MIN_DAYS /etc/login.defs

The DoD requirement is 1. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38480','SV-50280r1_rule','default','low','Users must be warned 7 days in advance of password expiration.','Setting the password warning age enables users to make the change at a practical time.','F-43425r1_fix','To specify how many days prior to password expiration that a warning will be issued to users, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_WARN_AGE [DAYS]

The DoD requirement is 7.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000054','C-46035r1_chk','To check the password warning age, run the command: 

$ grep PASS_WARN_AGE /etc/login.defs

The DoD requirement is 7. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38482','SV-50282r1_rule','default','low','The system must require passwords to contain at least one numeric character.','Requiring digits makes password guessing attacks more difficult by ensuring a larger search space.','F-43427r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

 apt-get -y install libpam-cracklib

The pam_cracklib module"s "dcredit" parameter controls requirements for usage of digits in a password. When set to a negative number, any password will be required to contain that many digits. When set to a positive number, pam_cracklib will grant +1 additional length credit for each digit. 
Add "dcredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a digit in password.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000056','C-46037r1_chk','To check how many digits are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "dcredit" parameter (as a negative number) will indicate how many digits are required. The requirement is at least one digit in a password. This would appear as "dcredit=-1". 
If dcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38483','SV-50283r1_rule','default','medium','The system package management tool must cryptographically verify the authenticity of system software packages during installation.','Ensuring the validity of packages" cryptographic signatures prior to installation ensures the provenance of the software and protects against malicious tampering.','F-43429r1_fix','Pass the --allow-unauthenticated option to apt-get as in: 

$ sudo apt-get --allow-unauthenticated upgrade

From the manual page of apt-get:

--allow-unauthenticated
Ignore if packages can"t be authenticated and don"t prompt about it. This is useful for tools like pbuilder. Configuration Item: APT::Get::AllowUnauthenticated.

You can make this setting permanent by using your own config file at /etc/apt/apt.conf.d/ directory. The filename can be 99myown and it may contain this line:

APT::Get::AllowUnauthenticated "true";' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000013','C-46039r1_chk','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering: 

$ grep -rwi AllowUnauthenticated /etc/apt/* | grep -v ":\s*"
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38484','SV-50285r2_rule','default','medium','The operating system, upon successful logon, must display to the user the date and time of the last logon or access via ssh.','Users need to be aware of activity that occurs regarding their account. Providing users with information regarding the date and time of their last successful login allows the user to determine if any unauthorized activity has occurred and gives them an opportunity to notify administrators.

At ssh login, a user must be presented with the last successful login date and time.','F-43431r2_fix','Update the "PrintLastLog" keyword to "yes" in /etc/ssh/sshd_config:

PrintLastLog yes

While it is acceptable to remove the keyword entirely since the default action for the SSH daemon is to print the last logon date and time, it is preferred to have the value explicitly documented

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000507','C-46041r2_chk','Verify the value associated with the "PrintLastLog" keyword in /etc/ssh/sshd_config:

 grep -iw PrintLastLog /etc/ssh/sshd_config | grep -v "^"

If the "PrintLastLog" keyword is not present, this is not a finding. If the value is not set to "yes", this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38487','SV-50288r1_rule','default','low','The system package management tool must cryptographically verify the authenticity of all software packages during installation.','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.','F-43433r1_fix','Pass the --allow-unauthenticated option to apt-get as in:

$ sudo apt-get --allow-unauthenticated upgrade

From the manual page of apt-get:

--allow-unauthenticated
Ignore if packages can"t be authenticated and don"t prompt about it. This is useful for tools like pbuilder. Configuration Item: APT::Get::AllowUnauthenticated.

You can make this setting permanent by using your own config file at /etc/apt/apt.conf.d/ directory. The filename can be 99myown and it may contain this line:

APT::Get::AllowUnauthenticated "true"; ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000015','C-46043r1_chk','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.:
 
$ grep -rwi AllowUnauthenticated /etc/apt/* | grep -v ":\s*"
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38489','SV-50290r1_rule','default','medium','A file integrity tool aide must be installed.','The AIDE package must be installed if it is to be available for integrity checking.','F-43436r1_fix','Install the aide, aide-common packages with the commands: 

 apt-get -y install aide

 apt-get -y install aide-common' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000016','C-46046r1_chk','Run the following command to determine if the "aide", "aide-common" packages are installed: 

 dpkg -s aide

 dpkg -s aide-common

If the packages are not installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38573','SV-50374r4_rule','default','medium','The system must disable accounts after three consecutive unsuccessful logon attempts.','Locking out user accounts after a number of incorrect attempts prevents direct password guessing attacks.','F-43521r8_fix','To configure the system to lock out accounts after a number of incorrect logon attempts using "pam_faillock.so", modify the content of "/etc/pam.d/common-auth" as follows: 

Add the following line immediately before the "pam_unix.so" statement in the "AUTH" section: 

auth required pam_tally2.so deny=3 onerr=fail unlock_time=604800 fail_interval=900
account required pam_tally2.so

Note that any updates made to "/etc/pam.d/common-auth" may be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000061','C-46131r4_chk','To ensure the failed password attempt policy is configured correctly, run the following command: 

 grep -w pam_faillock /etc/pam.d/common-auth | grep -v "^"

The output should show "deny=3" for both files. 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38592','SV-50393r4_rule','default','medium','The system must require administrator action to unlock an account locked by excessive failed login attempts.','Locking out user accounts after a number of incorrect attempts prevents direct password guessing attacks. Ensuring that an administrator is involved in unlocking locked accounts draws appropriate attention to such situations.','F-43541r6_fix','To configure the system to lock out accounts after a number of incorrect logon attempts and require an administrator to unlock the account using "pam_faillock.so", modify the content of "/etc/pam.d/common-auth" as follows: 

Add the following line immediately before the "pam_unix.so" statement in the "AUTH" section: 
auth required pam_tally2.so deny=3 onerr=fail unlock_time=604800 fail_interval=900
account required pam_tally2.so

Note that any updates made to "/etc/pam.d/common-auth" may be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000356','C-46151r5_chk','To ensure the failed password attempt policy is configured correctly, run the following command: 

 grep -w pam_faillock /etc/pam.d/common-auth | grep -v "^"

The output should show "unlock_time=<some-large-number>"; the largest acceptable value is 604800 seconds (one week). 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38520','SV-50321r1_rule','default','medium','The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited.','A log server (loghost) receives syslog messages from one or more systems. This data can be used as an additional log source in the event a system is compromised and its local logs are suspect. Forwarding log messages to a remote loghost also provides system administrators with a centralized place to view the status of multiple hosts within the enterprise.','F-43468r1_fix','To configure rsyslog to send logs to a remote log server, open "/etc/rsyslog.conf" and read and understand the last section of the file, which describes the multiple directives necessary to activate remote logging. Along with these other directives, the system can be configured to forward its logs to a particular log server by adding or correcting one of the following lines, substituting "[]" appropriately. The choice of protocol depends on the environment of the system; although TCP and RELP provide more reliable message delivery, they may not be supported in all environments. 
To use UDP for log message delivery: 

*.* @[loghost.example.com]


To use TCP for log message delivery: 

*.* @@[loghost.example.com]


To use RELP for log message delivery: 

*.* :omrelp:[loghost.example.com]' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000136','C-46078r1_chk','To ensure logs are sent to a remote host, examine the file "/etc/rsyslog.conf". If using UDP, a line similar to the following should be present: 

*.* @[]

If using TCP, a line similar to the following should be present: 

*.* @@[loghost.example.com]

If using RELP, a line similar to the following should be present: 

*.* :omrelp:[loghost.example.com]


If none of these are present, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38511','SV-50312r2_rule','default','medium','IP forwarding for IPv4 must not be enabled, unless the system is a router.','IP forwarding permits the kernel to forward packets from one network interface to another. The ability to forward packets between two networks is only appropriate for systems acting as routers.','F-43458r2_fix','To set the runtime status of the "net.ipv4.conf.all.forwarding" kernel parameter, 
run the following command: 

 sysctl -w net.ipv4.conf.all.forwarding=0

To make this configuration persistent, add the following line in "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.forwarding = 0

and run following command. 

 sysctl -p 

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000082','C-46068r3_chk','Check if IP forwarding for IPv4 is enabled on the system, by querying the following command: 

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

   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000120','C-46070r1_chk','Run the following command to determine the current status of the Firewall:
 iptables -L

Make sure default INPUT policy is set to DROP.

Also make sure your iptables configuration is persistent. 

If the default input policy is not set to DROP, this is a finding.
      ','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000167','C-46080r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000083','C-46081r3_chk','Check if system is configured to reject IPv4 source-routed packets on any interface, by querying the following command:

 sysctl "net.ipv4.conf" 2>/dev/null | grep "\.accept_source_route = 1"

If any value is not set to "0", this is a finding

Verify the interface values

net.ipv4.conf.all.accept_source_route

net.ipv4.conf.default.accept_source_route

net.ipv4.conf.eth0.accept_source_route

net.ipv4.conf.lo.accept_source_route

in "/etc/sysctl.conf".

If any one is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38524','SV-50325r2_rule','default','medium','The system must not accept ICMPv4 redirect packets on any interface.','Accepting ICMP redirects has few legitimate uses. It should be disabled unless it is absolutely required.','F-43472r1_fix','To configure the system to reject ICMPv4 redirect packets on all interfaces, run the following commands.

 sysctl -w net.ipv4.conf.all.accept_redirects=0

 sysctl -w net.ipv4.conf.default.accept_redirects=0

 sysctl -w net.ipv4.conf.eth0.accept_redirects=0

 sysctl -w net.ipv4.conf.lo.accept_redirects=0

To make this configuration persistent, add the following lines in "/etc/sysctl.conf" file.

net.ipv4.conf.all.accept_redirects=0

net.ipv4.conf.default.accept_redirects=0

net.ipv4.conf.eth0.accept_redirects=0

net.ipv4.conf.lo.accept_redirects=0

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000084','C-46082r2_chk','Check if the system is configured to reject ICMPv4 redirect packets, by querying the following command:

 sysctl "net.ipv4.conf" 2>/dev/null | grep "\.accept_redirects = 1"

If the output of the command is not "0", this is a finding.

Verify the interface values 

net.ipv4.conf.all.accept_redirects

net.ipv4.conf.default.accept_redirects

net.ipv4.conf.eth0.accept_redirects

net.ipv4.conf.lo.accept_redirects

in "/etc/sysctl.conf".

If any one is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38525','SV-50326r4_rule','default','low','The audit system must be configured to audit all attempts to alter system time through stime.','Arbitrary changes to the system time can be used to obfuscate nefarious activities in log files, as well as to confuse network services that are highly dependent upon an accurate system time (such as sshd). All changes to the system time should be audited.','F-43473r4_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

On a 32-bit system, add the following to "/etc/audit/audit.rules": 

 audit_time_rules
-a always,exit -F arch=b32 -S stime -k audit_time_rules

On a 64-bit system, the "-S stime" is not necessary. The -k option allows for the specification of a key in string form that can be used for better reporting capability through ausearch and aureport. Multiple system calls can be defined on the same line to save space if desired, but is not required. See an example of multiple combined syscalls: 

-a always,exit -F arch=b64 -S adjtimex -S settimeofday -S clock_settime -k audit_time_rules

Now, to get recently added audit rules into effect run the following command: 

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000169','C-46083r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

If the system is 64-bit only, this is not applicable.

To determine if the system is configured to audit calls to the "stime" system call, run the following command:

$ sudo grep -w "stime" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. 

If the system is not configured to audit time changes, this is a finding. ','Customized rule by Cloud Raxak') from dual;
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

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000086','C-46084r2_chk','To check if system accepts ICMPv4 secure redirect packets on any interface, run the following command:

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000171','C-46085r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000088','C-46086r3_chk','Check if the system is configured to log Martian packets, by querying the following command:

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

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000089','C-46088r2_chk','Check if system is configured to reject IPv4 source-routed packets by default, by running the following command:

 sysctl net.ipv4.conf.default.accept_source_route

If the output of the command is not "0", this is a finding.

Verify the value of net.ipv4.conf.default.accept_source_route in "/etc/sysctl.conf".

If net.ipv4.conf.default.accept_source_route is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38530','SV-50331r1_rule','default','low','The audit system must be configured to audit all attempts to alter system time through /etc/localtime.','Arbitrary changes to the system time can be used to obfuscate nefarious activities in log files, as well as to confuse network services that are highly dependent upon an accurate system time (such as sshd). All changes to the system time should be audited.','F-43477r1_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules": 

-w /etc/localtime -p wa -k audit_time_rules

The -k option allows for the specification of a key in string form that can be used for better reporting capability through ausearch and aureport and should always be used.

Now, to get recently added audit rules into effect run the following command: 

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000173','C-46087r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit attempts to alter time via the /etc/localtime file, run the following command: 

 auditctl -l | grep "watch=/etc/localtime"

If the system is configured to audit this activity, it will return a line. 
If the system is not configured to audit time changes, this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000174','C-46090r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000090','C-46089r2_chk','Check if the system is configured to reject ICMPv4 secure redirect packets by default, by querying the following command: 

 sysctl net.ipv4.conf.default.secure_redirects

If the output of the command is not "0", this is a finding. 

Verify the value of net.ipv4.conf.default.secure_redirects in "/etc/sysctl.conf". 

If net.ipv4.conf.default.secure_redirects is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38533','SV-50334r3_rule','default','low','The system must ignore ICMPv4 redirect messages by default.','This feature of the IPv4 protocol has few legitimate uses. It should be disabled unless it is absolutely required.','F-43481r1_fix','To set the runtime status of the "net.ipv4.conf.default.accept_redirects" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.default.accept_redirects=0

To make this configuration persistent, add the following line in "/etc/sysctl.conf"

net.ipv4.conf.default.accept_redirects = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000091','C-46091r2_chk','Check if the system is configured to ignore ICMPv4 redirect messages by default, by querying the following command: 

 sysctl net.ipv4.conf.default.accept_redirects

If the output of the command is not "0", this is a finding. 

Verify the value of net.ipv4.conf.default.accept_redirects in "/etc/sysctl.conf". 

If net.ipv4.conf.default.accept_redirects is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38534','SV-50335r1_rule','default','low','The operating system must automatically audit account modification.','In addition to auditing new user and group accounts, these watches will alert the system administrator(s) to any modifications. Any unexpected users, groups, or modifications should be investigated for legitimacy.','F-43482r1_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules", in order to capture events that modify account changes: 

 audit_account_changes
-w /etc/group -p wa -k audit_account_changes
-w /etc/passwd -p wa -k audit_account_changes
-w /etc/gshadow -p wa -k audit_account_changes
-w /etc/shadow -p wa -k audit_account_changes
-w /etc/security/opasswd -p wa -k audit_account_changes

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000175','C-46092r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit account changes, run the following command: 

auditctl -l | egrep "(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)"

If the system is configured to watch for account changes, lines should be returned for each file specified (and with "perm=wa" for each). 
If the system is not configured to audit account changes, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38535','SV-50336r2_rule','default','low','The system must not respond to ICMPv4 sent to a broadcast address.','Ignoring ICMP echo requests (pings) sent to broadcast or multicast addresses makes the system slightly more difficult to enumerate on the network.','F-43483r1_fix','To set the runtime status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter, run the following command: 

 sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf": 

net.ipv4.icmp_echo_ignore_broadcasts = 1

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000092','C-46093r2_chk','The status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter can be queried by running the following command:

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000176','C-46094r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000093','C-46095r2_chk','The status of the "net.ipv4.icmp_ignore_bogus_error_responses" kernel parameter can be queried by running the following command:

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000177','C-46096r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000095','C-46097r2_chk','Check if the system is configured to use TCP syncookies when experiencing a TCP SYN flood, by querying the following command:

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000182','C-46098r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit changes to its network configuration, run the following command: 

auditctl -l | egrep "(sethostname|setdomainname|/etc/issue|/etc/issue.net|/etc/hosts|/etc/network/interfaces)"

If the system is configured to watch for network configuration changes, a line should be returned for each file specified (and "perm=wa" should be indicated for each). 
If the system is not configured to audit changes of the network configuration, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38541','SV-50342r1_rule','default','low','The audit system must be configured to audit modifications to the systems Mandatory Access Control (MAC) configuration (apparmor).','The system"s mandatory access policy (SELinux) should not be arbitrarily changed by anything other than administrator action. All changes to MAC policy should be audited.','F-43489r1_fix','Add the following to "/etc/audit/audit.rules":

-w /etc/apparmor/ -p wa -k MAC-policy

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000183','C-46099r1_chk','To determine if the system is configured to audit changes to its MAC configuration files, run the following command:

 grep -w "/etc/apparmor" /etc/audit/audit.rules

If the system is configured to watch for changes to its MAC configuration, a line should be returned (including "perm=wa" indicating permissions that are watched).
If the system is not configured to audit attempts to change the MAC policy, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38542','SV-50343r2_rule','default','medium','The system must use a reverse-path filter for IPv4 network traffic when possible on all interfaces.','Enabling reverse path filtering drops packets with source addresses that should not have been able to be received on the interface they were received on. It should not be used on systems which are routers for complicated networks, but is helpful for end hosts and routers serving small networks.','F-43490r1_fix','To set the runtime status of the "net.ipv4.conf.all.rp_filter" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.all.rp_filter=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.rp_filter = 1 

To make this configuration persistent, run following command. 

 sysctl -p

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000096','C-46100r2_chk','Check if system is configured to use the reverse-path filter for IPv4 network traffic on all interfaces enabled

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000184','C-46101r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000097','C-46102r2_chk','Check if the system is configured to use TCP syncookies when experiencing a TCP SYN flood, by querying the following command: 

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000185','C-46103r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "chown" system call, run the following command:

$ sudo grep -w "chown" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines.

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000186','C-46105r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "fchmod" system call, run the following command:

$ sudo grep -w "fchmod" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38548','SV-50349r3_rule','default','medium','The system must ignore ICMPv6 redirects by default.','An illicit ICMP redirect message could result in a man-in-the-middle attack.','F-43496r1_fix','To disable IPv6 module, add net.ipv6.conf.all.disable_ipv6 = 1 to following file

 /etc/sysctl.conf

and run the following command to reload settings from config files without rebooting the system.

 sysctl --system

To disable IPv6 module from GRUB, add following line in /etc/default/grub.

 GRUB_CMDLINE_LINUX="ipv6.disable=1"

and run the following command to update the grub.

 update-grub

To set the runtime status of the "net.ipv6.conf.default.accept_redirects" kernel parameter, run the following command:

 sysctl -w net.ipv6.conf.default.accept_redirects=0

To make this configuration persistent, add the following line to "/etc/sysctl.conf":

net.ipv6.conf.default.accept_redirects = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000099','C-46106r3_chk','Check if IPv6 module is enabled or not using the following command :

 sysctl "net.ipv6.conf" | grep "disable_ipv6 = 0"

To verify if IPv6 is disabled in GRUB, run the following:

 grep -iw "ipv6.disable" /boot/grub/grub.cfg | grep -v "^\s*"

0 is enabled, 1 is disabled.

If IPv6 is disabled, this is not applicable.

Check if the system is configured to ignore ICMPv6 redirects by default, by querying the following command:

 sysctl net.ipv6.conf.default.accept_redirects

If the output of the command is not "1", this is a finding.

Verify the value of net.ipv6.conf.default.accept_redirects in "/etc/sysctl.conf".

If net.ipv6.conf.default.accept_redirects is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38549','SV-50350r3_rule','default','medium','The system must employ a local IPv6 firewall.','The "ip6tables" service provides the system"s host-based firewalling capability for IPv6 and ICMPv6.','F-43497r3_fix','To disable IPv6 module, add net.ipv6.conf.all.disable_ipv6 = 1 to following file

 /etc/sysctl.conf

and run the following command to reload settings from config files without rebooting the system.

 sysctl --system

To disable IPv6 module from GRUB, add following line in /etc/default/grub.

 GRUB_CMDLINE_LINUX="ipv6.disable=1"

and run the following command to update the grub.

 update-grub

You can install one of following.

 firewalld
 ufw

and configure the same to deny-all packets except coming from CloudRaxak.
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000103','C-46107r3_chk','Check if IPv6 module is enabled or not using the following command :

 sysctl "net.ipv6.conf" | grep "disable_ipv6 = 0"

0 is enabled, 1 is disabled.

To verify if IPv6 is disabled in GRUB, run the following:

 grep -iw "ipv6.disable" /boot/grub/grub.cfg | grep -v "^\s*"

0 is enabled, 1 is disabled.

If IPv6 is disabled, this is not applicable.

Run the following command to determine the current status of the Firewall:

 ip6tables -L

If above command gives error, this is a finding. 
    ','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000187','C-46108r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000188','C-46110r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000189','C-46112r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "fchownat" system call, run the following command:

$ sudo grep -w "fchownat" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38555','SV-50356r2_rule','default','medium','The system must employ a local IPv4 firewall.','The "iptables" service provides the system"s host-based firewalling capability for IPv4 and ICMP.','F-43503r2_fix','You can install one of following.

 firewalld
 ufw

and configure the same to deny-all packets except coming from CloudRaxak.
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000113','C-46113r2_chk','Run the following command to determine the current status of the Firewall:

 iptables -L

If above command gives error, this is a finding. 
    ','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000190','C-46114r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000191','C-46115r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000192','C-46116r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000193','C-46117r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000194','C-46119r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000195','C-46121r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000196','C-46123r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000197','C-46124r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To verify that the audit system collects unauthorized file accesses, run the following commands: 

 grep EACCES /etc/audit/audit.rules



 grep EPERM /etc/audit/audit.rules


If either command lacks output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38568','SV-50369r3_rule','default','low','The audit system must be configured to audit successful file system mounts.','The unauthorized exportation of data to external media could result in an information leak where classified information, Privacy Act information, and intellectual property could be lost. An audit trail should be created each time a filesystem is mounted to help identify and guard against information loss.','F-43516r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect media exportation events for all users and root. Add the following to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 

-a always,exit -F arch=ARCH -S mount -F auid>=500 -F auid!=4294967295 -k export
-a always,exit -F arch=ARCH -S mount -F auid=0 -k export

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000199','C-46126r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

If auditd service is not installed or auditd service not running, then rule get failed.

To verify that auditing is configured for all media exportation events, run the following command: 

$ sudo grep -w "mount" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38569','SV-50370r1_rule','default','low','The system must require passwords to contain at least one uppercase alphabetic character.','Requiring a minimum number of uppercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43517r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "ucredit=" parameter controls requirements for usage of uppercase letters in a password. When set to a negative number, any password will be required to contain that many uppercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each uppercase character. 
Add "ucredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of an uppercase character in a password.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000057','C-46127r1_chk','To check how many uppercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "ucredit" parameter (as a negative number) will indicate how many uppercase characters are required. The requirement is at least one uppercase character in a password. This would appear as "ucredit=-1". 
If ucredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38570','SV-50371r1_rule','default','low','The system must require passwords to contain at least one special character.','Requiring a minimum number of special characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43518r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "ocredit=" parameter controls requirements for usage of special (or "other") characters in a password. When set to a negative number, any password will be required to contain that many special characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each special character.  
Add "ocredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a special character in passwords.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000058','C-46128r1_chk','To check how many special characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "ocredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one special character in a password. This would appear as "ocredit=-1". 
If ocredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38571','SV-50372r1_rule','default','low','The system must require passwords to contain at least one lowercase alphabetic character.','Requiring a minimum number of lowercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43519r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:
$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "lcredit=" parameter controls requirements for usage of lowercase letters in a password. When set to a negative number, any password will be required to contain that many lowercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each lowercase character. 
Add "lcredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a lowercase character in password.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000059','C-46129r1_chk','To check how many lowercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "lcredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one lowercase character in a password. This would appear as "lcredit=-1". 
If lcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38574','SV-50375r2_rule','default','medium','The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (common-password).','Using a stronger hashing algorithm makes password cracking attacks more difficult.','F-43522r2_fix','In "/etc/pam.d/common-password", among potentially other files, the "password" section of the files control which PAM modules execute during a password change. Set the "pam_unix.so" module in the "password" section to include the argument "sha512", as shown below: 

password    [] pam_unix.so obscure use_authtok try_first_pass sha512

This will help ensure when local users change their passwords, hashes for the new passwords will be generated using the SHA-512 algorithm. This is the default.

Note that any updates made to "/etc/pam.d/common-password" will be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000062','C-46132r3_chk','Inspect the "password" section of "/etc/pam.d/common-password", and other files in "/etc/pam.d" and ensure that the "pam_unix.so" module includes the argument "sha512".

$ grep -w password /etc/pam.d/common-password | grep -w pam_unix.so | grep -v "^"

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38575','SV-50376r4_rule','default','low','The audit system must be configured to audit user deletions of files and programs.','Auditing file deletions will create an audit trail for files that are removed from the system. The audit trail could aid in system troubleshooting, as well as detecting malicious processes that attempt to delete log files to conceal their presence.','F-43523r4_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file deletion events for all users and root. Add the following (or equivalent) to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 

-a always,exit -F arch=ARCH -S rmdir -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete
-a always,exit -F arch=ARCH -S rmdir -S unlink -S unlinkat -S rename -S renameat -F auid=0 -k delete

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000200','C-46133r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
select add_rule_data ('default','V-38576','SV-50377r1_rule','default','medium','The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (login.defs).','Using a stronger hashing algorithm makes password cracking attacks more difficult.','F-43524r1_fix','In "/etc/login.defs", add or correct the following line to ensure the system will use SHA-512 as the hashing algorithm: 

ENCRYPT_METHOD SHA512' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000063','C-46134r1_chk','Inspect "/etc/login.defs" and ensure the following line appears: 

 grep "ENCRYPT_METHOD SHA512" /etc/login.defs | grep -v "^"

ENCRYPT_METHOD SHA512

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38577','SV-50378r1_rule','default','medium','The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (libuser.conf).','Using a stronger hashing algorithm makes password cracking attacks more difficult.','F-43525r1_fix','In "/etc/libuser.conf", add or correct the following line in its "[]" section to ensure the system will use the SHA-512 algorithm for password hashing: 

crypt_style = sha512' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000064','C-46135r1_chk','Inspect "/etc/libuser.conf" and ensure the following line appears in the "[]" section: 

 grep -w crypt_style /etc/libuser.conf | grep -v "^"
crypt_style = sha512

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38578','SV-50379r1_rule','default','low','The audit system must be configured to audit changes to the /etc/sudoers file.','The actions taken by system administrators should be audited to keep a record of what was executed on the system, as well as, for accountability purposes.','F-43526r1_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect administrator actions for all users and root. Add the following to "/etc/audit/audit.rules": 

-w /etc/sudoers -p wa -k actions

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000201','C-46136r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To verify that auditing is configured for system administrator actions, run the following command: 

 auditctl -l | grep "watch=/etc/sudoers"


If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38580','SV-50381r2_rule','default','medium','The audit system must be configured to audit the loading and unloading of dynamic kernel modules.','The addition/removal of kernel modules can be used to alter the behavior of the kernel and potentially introduce malicious code into kernel space. It is important to have an audit trail of modules that have been introduced into the kernel.','F-43528r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules" in order to capture kernel module loading and unloading events, setting ARCH to either b32 or b64 as appropriate for your system: 

-w /sbin/insmod -p x -k modules
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit -F arch=[] -S init_module -S delete_module -k modules

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000202','C-46138r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
select add_rule_data ('default','V-38582','SV-50383r2_rule','default','medium','The xinetd service must be disabled if no network services utilizing it are enabled.','The xinetd service provides a dedicated listener service for some programs, which is no longer necessary for commonly-used network services. Disabling it ensures that these uncommon services are not running, and also prevents attacks against xinetd itself.','F-43530r2_fix','The "xinetd" service can be disabled with the following commands: 

 sysv-rc-conf xinetd off
 service xinetd stop' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000203','C-46140r2_chk','If network services are using the xinetd service, this is not applicable.

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
select add_rule_data ('default','V-38587','SV-50388r1_rule','default','high','The telnet-server package must not be installed.','Removing the "telnet-server" package decreases the risk of the unencrypted telnet service"s accidental (or intentional) activation.

Mitigation:  If the telnet-server package is configured to only allow encrypted sessions, such as with Kerberos or the use of encrypted network tunnels, the risk of exposing sensitive information is mitigated.','F-43535r1_fix','The "telnetd" package can be uninstalled with the following command: 

 dpkg -r --force-all telnetd' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000206','C-46144r1_chk','Run the following command to determine if the "telnetd" package is installed: 

 dpkg -s telnetd


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000211','C-46147r3_chk','To check that the "telnet" service is disabled, follow the folllowing step:
Check the telnet configuration file:
$ grep -w /usr/sbin/in.telnetd /etc/xinetd.d/*

Check for "disable = yes" in configuration file.

If the "disable = no", this is a finding.

If the telnet is configured using inetd service the check for the telnet configuration line inside file /etc/inetd.conf

$ grep "in.telnetd" /etc/inetd.conf | grep -v ""

If there is output, this is a finding.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38591','SV-50392r1_rule','default','high','The rsh-server package must not be installed.','The "rsh-server" package provides several obsolete and insecure network services. Removing it decreases the risk of those services" accidental (or intentional) activation.','F-43539r1_fix','The "rsh-server" package can be uninstalled with the following command: 

 dpkg -r --force-all rsh-server' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000213','C-46149r1_chk','Run the following command to determine if the "rsh-server" package is installed: 

 dpkg -s rsh-server


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38596','SV-50397r2_rule','default','medium','The system must implement virtual address space randomization.','Address space layout randomization (ASLR) makes it more difficult for an attacker to predict the location of attack code he or she has introduced into a process"s address space during an attempt at exploitation. Additionally, ASLR also makes it more difficult for an attacker to know the location of existing code in order to repurpose it using return oriented programming (ROP) techniques.','F-43543r1_fix','To set the runtime status of the "kernel.randomize_va_space" kernel parameter, run the following command: 

 sysctl -w kernel.randomize_va_space=2

To make this configuration persistent, add the following line to "/etc/sysctl.conf": 

kernel.randomize_va_space = 2

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000078','C-46153r2_chk','Check if the system is configured to implement virtual address space randomization, by querying the following command:

 sysctl kernel.randomize_va_space

If the output of the command is not "2", this is a finding.

verify the value of kernel.randomize_va_space  in "/etc/sysctl.conf".

If kernel.randomize_va_space is not set to "2" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38597','SV-50398r2_rule','default','medium','The system must limit the ability of processes to have simultaneous write and execute access to memory.','ExecShield uses the segmentation feature on all x86 systems to prevent execution in memory higher than a certain address. It writes an address as a limit in the code segment descriptor, to control where code can be executed, on a per-process basis. When the kernel places a process"s memory regions such as the stack and heap higher than this address, the hardware prevents execution in that address range.','F-43545r1_fix','This rule is not applicable.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000079','C-46155r3_chk','This rule is not applicable.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38600','SV-50401r2_rule','default','medium','The system must not send ICMPv4 redirects by default.','Sending ICMP redirects permits the system to instruct other systems to update their routing information. The ability to send ICMP redirects is only appropriate for systems acting as routers.','F-43547r1_fix','To set the runtime status of the "net.ipv4.conf.default.send_redirects" kernel parameter, run the following command:

 sysctl -w net.ipv4.conf.default.send_redirects=0

To make this configuration persistent, add the following line to "/etc/sysctl.conf":

net.ipv4.conf.default.send_redirects = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000080','C-46157r2_chk','Check if the system is configured to ignore ICMPv4 redirects by default, by querying the following command:

 sysctl net.ipv4.conf.default.send_redirects 

If the output of the command is not "0", this is a finding.

Verify the value of net.ipv4.conf.default.send_redirects in "/etc/sysctl.conf".

If net.ipv4.conf.default.send_redirects is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38601','SV-50402r2_rule','default','medium','The system must not send ICMPv4 redirects from any interface.','Sending ICMP redirects permits the system to instruct other systems to update their routing information. The ability to send ICMP redirects is only appropriate for systems acting as routers.','F-43548r1_fix','To set the runtime status of the "net.ipv4.conf.all.send_redirects" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.all.send_redirects=0

To make the changes persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.send_redirects = 0

and run following command

 sysctl -p

or restart sysctl.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000081','C-46159r2_chk','Check if system sends ICMPv4 redirects from any interface, by querying the following command:

 sysctl net.ipv4.conf.all.send_redirects

If the output of the command is not "0" on any interface, this is a finding.

Verify the value of net.ipv4.conf.all.send_redirects in "/etc/sysctl.conf".

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38603','SV-50404r1_rule','default','medium','The ypserv package must not be installed.','Removing the "ypserv" package decreases the risk of the accidental (or intentional) activation of NIS or NIS+ services.','F-43551r1_fix','The "ypserv" package can be uninstalled with the following command: 

 dpkg -r --force-all nis
(Since ypserv is nis in ubuntu so there is no separate package for ypserv. Hence, we are removing nis package.)
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000220','C-46161r1_chk','Run the following command to determine if the "nis" package is installed: 

 service nis status


If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38604','SV-50405r2_rule','default','medium','The ypbind service must not be running.','Disabling the "ypbind" service ensures the system is not acting as a client in a NIS or NIS+ domain.','F-43552r2_fix','The "ypbind" service, which allows the system to act as a client in a NIS or NIS+ domain, should be disabled. The "ypbind" service can be disabled with the following commands: 

 service ypbind stop
 sysv-rc-conf --level 0123456S ypbind off' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000221','C-46162r2_chk','Run the following command to verify "ypbind" is disabled through current runtime configuration: 

 service ypbind status

If the service is disabled the command will return the following output: 

ypbind stop/waiting

To check that the "ypbind" service is disabled in system boot configuration, run the following command: 

 sysv-rc-conf --list ypbind

Output should indicate the "ypbind" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf --list ypbind

"ypbind" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38606','SV-50407r2_rule','default','medium','The tftp-server package must not be installed unless required.','Removing the "tftp-server" package decreases the risk of the accidental (or intentional) activation of tftp services.','F-43554r1_fix','The "tftpd" package can be removed with the following command: 

 dpkg -r --force-all tftpd

If tftpd is not installed the check for tftpd-hpa package, to remove run following command:

 dpkg -r --force-all tftpd-hpa
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000222','C-46164r1_chk','Run the following command to determine if the "tftpd" package is installed: 

 dpkg -s tftpd


If the package is installed, this is a finding.

If tftp can also be installed using tftpd-hpa package, run the following command to check tftpd-hpa is intslled:

 dpkg -s tftpd-hpa

If the package is installed, this is a finding.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38607','SV-50408r1_rule','default','high','The SSH daemon must be configured to use only the SSHv2 protocol.','SSH protocol version 1 suffers from design flaws that result in security vulnerabilities and should not be used.','F-43555r1_fix','Only SSH protocol version 2 connections should be permitted. The default setting in "/etc/ssh/sshd_config" is correct, and can be verified by ensuring that the following line appears: 

Protocol 2

Restart ssh service to get changes in effect:

$ service ssh restart
' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000227','C-46165r1_chk','To check which SSH protocol version is allowed, run the following command: 

 grep -iw Protocol /etc/ssh/sshd_config  | grep -v "^"

If configured properly, output should be:

Protocol 2

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38610','SV-50411r1_rule','default','low','The SSH daemon must set a timeout count on idle sessions.','This ensures a user login will be terminated as soon as the "ClientAliveCountMax" is reached.','F-43558r1_fix','To ensure the SSH idle timeout occurs precisely when the "ClientAliveCountMax" is set, edit "/etc/ssh/sshd_config" as follows: 

ClientAliveCountMax 0

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000231','C-46168r1_chk','To ensure the SSH idle timeout will occur when the "ClientAliveCountMax" is set, run the following command: 

 grep -iw ClientAliveCountMax /etc/ssh/sshd_config  | grep -v "^"

If properly configured, output should be: 

ClientAliveCountMax 0

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38608','SV-50409r1_rule','default','low','The SSH daemon must set a timeout interval on idle sessions.','Causing idle users to be automatically logged out guards against compromises one system leading trivially to compromises on another.','F-43556r1_fix','SSH allows administrators to set an idle timeout interval. After this interval has passed, the idle user will be automatically logged out. 

To set an idle timeout interval, edit the following line in "/etc/ssh/sshd_config" as follows: 

ClientAliveInterval []

The timeout [interval] is given in seconds. To have a timeout of 15 minutes, set [interval] to 900. 

If a shorter timeout has already been set for the login shell, that value will preempt any SSH setting made here. Keep in mind that some processes may stop SSH from correctly detecting that the user is idle.

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000230','C-46167r1_chk','Run the following command to see what the timeout interval is: 

 grep -iw ClientAliveInterval /etc/ssh/sshd_config  | grep -v "^"

If properly configured, the output should be: 

ClientAliveInterval 900

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38611','SV-50412r1_rule','default','medium','The SSH daemon must ignore .rhosts files.','SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.','F-43559r1_fix','SSH can emulate the behavior of the obsolete rsh command in allowing users to enable insecure access to their accounts via ".rhosts" files. 

To ensure this behavior is disabled, add or correct the following line in "/etc/ssh/sshd_config": 

IgnoreRhosts yes

Then, Restart the ssh service:
 
$ service ssh restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000234','C-46169r1_chk','To determine how the SSH daemon"s "IgnoreRhosts" option is set, run the following command: 
 grep -i IgnoreRhosts /etc/ssh/sshd_config
If no line, a commented line, or a line indicating the value "yes" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38612','SV-50413r1_rule','default','medium','The SSH daemon must not allow host-based authentication.','SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.','F-43560r1_fix','SSH"s cryptographic host-based authentication is more secure than ".rhosts" authentication, since hosts are cryptographically authenticated. However, it is not recommended that hosts unilaterally trust one another, even within an organization. 

To disable host-based authentication, add or correct the following line in "/etc/ssh/sshd_config": 

HostbasedAuthentication no

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000236','C-46170r1_chk','To determine how the SSH daemon"s "HostbasedAuthentication" option is set, run the following command: 

 grep -iw HostbasedAuthentication /etc/ssh/sshd_config | grep -v "^"

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38613','SV-50414r1_rule','default','medium','The system must not permit root logins using remote access programs such as ssh.','Permitting direct root login reduces auditable information about who ran privileged commands on the system and also allows direct attack attempts on root"s password.','F-43561r1_fix','The root user should never be allowed to log into a system directly over a network. To disable root login via SSH, add or correct the following line in "/etc/ssh/sshd_config": 

PermitRootLogin no
Then, Restart the ssh service:

$ service ssh restart

In Case if "PermitRootLogin no" already exist and no valid user exist. Then in recommended fix create a valid user with below condition:
1. User account must not be expired.
2. User account should be unlocked.
3. User account must have sudo privileges.
4. User account password  must be set or RSA key­pairs should be configured.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000237','C-46171r1_chk','To determine how the SSH daemon"s "PermitRootLogin" option is set, run the following command: 
 grep -iw PermitRootLogin /etc/ssh/sshd_config  | grep -v "^"

If a line indicating "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38614','SV-50415r1_rule','default','high','The SSH daemon must not allow authentication using an empty password.','Configuring this setting for the SSH daemon provides additional assurance that remote login via SSH will require a password, even in the event of misconfiguration elsewhere.','F-43562r1_fix','To explicitly disallow remote login from accounts with empty passwords, add or correct the following line in "/etc/ssh/sshd_config": 

PermitEmptyPasswords no

Any accounts with empty passwords should be disabled immediately, and PAM configuration should prevent users from being able to assign themselves empty passwords.

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000239','C-46172r1_chk','To determine how the SSH daemon"s "PermitEmptyPasswords" option is set, run the following command: 

 grep -iw PermitEmptyPasswords /etc/ssh/sshd_config  | grep -v "^"

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38615','SV-50416r1_rule','default','medium','The SSH daemon must be configured with the Department of Defense (DoD) login banner.','The warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers. Alternatively, systems whose ownership should not be obvious should ensure usage of a banner that does not provide easy attribution.','F-43563r1_fix','To enable the warning banner and ensure it is consistent across the system, add or correct the following line in "/etc/ssh/sshd_config": 

Banner /etc/issue

Restart ssh service to get changes in effect:

 service ssh restart

Another section contains information on how to create an appropriate system-wide warning banner.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000240','C-46173r1_chk','To determine how the SSH daemon"s "Banner" option is set, run the following command: 

 grep -iw Banner /etc/ssh/sshd_config | grep -v "^"

If a line indicating /etc/issue is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38616','SV-50417r1_rule','default','low','The SSH daemon must not permit user environment settings.','SSH environment options potentially allow users to bypass access restriction in some configurations.','F-43565r1_fix','To ensure users are not able to present environment options to the SSH daemon, add or correct the following line in "/etc/ssh/sshd_config": 

PermitUserEnvironment no

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000241','C-46175r1_chk','To ensure users are not able to present environment daemons, run the following command: 

 grep -iw PermitUserEnvironment /etc/ssh/sshd_config | grep -v "^"
 
If properly configured, output should be: 

PermitUserEnvironment no


If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38617','SV-50418r1_rule','default','medium','The SSH daemon must be configured to use only FIPS 140-2 approved ciphers.','Approved algorithms should impart some level of confidence in their implementation. These are also required for compliance.','F-43566r1_fix','Limit the ciphers to those algorithms which are FIPS-approved. Counter (CTR) mode is also preferred over cipher-block chaining (CBC) mode. The following line in "/etc/ssh/sshd_config" demonstrates use of FIPS-approved ciphers: 

Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc

The man page "sshd_config(5)" contains a list of supported ciphers.

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000243','C-46176r1_chk','Only FIPS-approved ciphers should be used. To verify that only FIPS-approved ciphers are in use, run the following command: 

 grep -iw Ciphers /etc/ssh/sshd_config | grep -v "^"

The output should contain only those ciphers which are FIPS-approved, namely, the AES and 3DES ciphers. 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38621','SV-50422r1_rule','default','medium','The system clock must be synchronized to an authoritative DoD time source.','Synchronizing with an NTP server makes it possible to collate system logs from multiple sources or correlate computer events with real time events. Using a trusted NTP server provided by your organization is recommended.','F-43570r1_fix','To specify a remote NTP server for time synchronization, edit the file "/etc/ntp.conf". Add or correct the following lines, substituting the IP or hostname of a remote NTP server for ntpserver. 

server []

This instructs the NTP software to contact that remote server to obtain time data.

Restart NTP service to get changes in effect by using the command:

$ service ntp restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000248','C-46180r1_chk','To verify the "ntpd" package is installed on the system, run the following command: 

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
select add_rule_data ('default','V-38620','SV-50421r1_rule','default','medium','The system clock must be synchronized continuously, or at least daily.','Enabling the "ntpd" service ensures that the "ntpd" service will be running and that the system will synchronize its time to any servers specified. This is important whether the system is configured to be a client (and synchronize only its own clock) or it is also acting as an NTP server to other systems. Synchronizing time is essential for authentication services such as Kerberos, but it is also important for maintaining accurate logs and auditing possible security breaches.','F-43568r1_fix','Install the service if service is not installed with the following command: 

$ apt-get -y install ntp

The "ntp" service can be enabled with the following command:

$ service ntp start
$ sysv-rc-conf --level 0123456S ntp on' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000247','C-46178r1_chk','To verify the "ntpd" package is installed on the system, run the following command: 

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
select add_rule_data ('default','V-38628','SV-50429r2_rule','default','medium','The operating system must produce audit records containing sufficient information to establish the identity of any user/subject associated with the event.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43576r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start
 sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000145','C-46186r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

 * auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38631','SV-50432r2_rule','default','medium','The operating system must employ automated mechanisms to facilitate the monitoring and control of remote access methods.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43580r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start

 sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000148','C-46190r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

* auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38632','SV-50433r2_rule','default','medium','The operating system must produce audit records containing sufficient information to establish what type of events occurred.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43581r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start

sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000154','C-46191r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

* auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000165','C-46194r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "adjtimex" system call, run the following command:

$ sudo grep -w "adjtimex" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. 

If the system is not configured to audit time changes, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38636','SV-50437r1_rule','default','medium','The system must retain enough rotated audit logs to cover the required log retention period.','The total storage for audit log files must be large enough to retain log information over the period required. This is a function of the maximum log file size and the number of logs retained.','F-43585r1_fix','Determine how many log files "auditd" should retain when it rotates logs. Edit the file "/etc/audit/auditd.conf". Add or modify the following line, substituting [] with the correct value: 

num_logs = [NUMLOGS]

Set the value to 5 for general-purpose systems. Note that values less than 2 result in no log rotation.
If auditd service is not installed then rule will install before fixing changes.
Reload the auditd.

$ service auditd reload' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000159','C-46195r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine how many logs the system is configured to retain after rotation: 

 grep -wi num_logs /etc/audit/auditd.conf | grep -v "^"

num_logs = 5

If the overall system log file(s) retention hasn"t been properly set up, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38633','SV-50434r1_rule','default','medium','The system must set a maximum audit log file size.','The total storage for audit log files must be large enough to retain log information over the period required. This is a function of the maximum log file size and the number of logs retained.','F-43582r1_fix','Determine the amount of audit data (in megabytes) which should be retained in each log file. Edit the file "/etc/audit/auditd.conf". Add or modify the following line, substituting the correct value for []: 

max_log_file = [STOREMB]

Set the value to "6" (MB) or higher for general-purpose systems. Larger values, of course, support retention of even more audit data.
If auditd service is not installed then rule will install before fixing changes.

Reload the auditd.

$ service auditd reload' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000160','C-46192r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine how much data the system will retain in each audit log file:

 grep -wi max_log_file /etc/audit/auditd.conf | grep -v "^"

max_log_file = 6


If the system audit data threshold hasn"t been properly set up, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38680','SV-50481r1_rule','default','medium','The audit system must identify staff members to receive notifications of audit log storage volume capacity issues.','Email sent to the root account is typically aliased to the administrators of the system, who can take appropriate action.','F-43629r1_fix','The "auditd" package can be configured to send email to a designated account in certain situations. Add or correct the following line in "/etc/audit/auditd.conf" to ensure that administrators are notified via email for those situations: 

action_mail_acct = root
If auditd package is not installed then rule will install it before fixing changes.
Reload the auditd.

$ service auditd reload' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000313','C-46241r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to send email to an account when it needs to notify an administrator:

 grep -wi "action_mail_acct" /etc/audit/auditd.conf | grep -v "^"  

action_mail_acct = root

If auditd is not configured to send emails per identified actions, this is a finding.
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

$ service auditd reload' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000161','C-46193r3_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to rotate logs when they reach their maximum size:

 grep -wi max_log_file_action /etc/audit/auditd.conf | grep -v "^"

max_log_file_action = rotate

If the "keep_logs" option is configured for the "max_log_file_action" line in "/etc/audit/auditd.conf" and an alternate process is in place to ensure audit data does not overwhelm local audit storage, this is not a finding.

If the system has not been properly set up to rotate audit logs, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38678','SV-50479r2_rule','default','medium','The audit system must provide a warning when allocated audit record storage volume reaches a documented percentage of maximum audit record storage capacity.','Notifying administrators of an impending disk space problem may allow them to take corrective action prior to any disruption.','F-43627r2_fix','The "auditd" service can be configured to take an action when disk space starts to run low. Edit the file "/etc/audit/auditd.conf". Modify the following line, substituting [] appropriately: 

space_left = [num_megabytes]

The "num_megabytes" value should be set to a fraction of the total audit storage capacity available that will allow a system administrator to be notified with enough time to respond to the situation causing the capacity issues.  This value must also be documented locally.
If auditd package is not installed then rule will install it before fixing changes.

Reload the auditd.

$ service auditd reload' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000311','C-46240r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine whether the system is configured to email the administrator when disk space is starting to run low: 

 grep -wi space_left /etc/audit/auditd.conf | grep -v "^"

space_left = []


If the "num_megabytes" value does not correspond to a documented value for remaining audit partition capacity or if there is no locally documented value for remaining audit partition capacity, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38470','SV-50270r2_rule','default','medium','The audit system must alert designated staff members when the audit storage volume approaches capacity.','Notifying administrators of an impending disk space problem may allow them to take corrective action prior to any disruption.','F-43415r2_fix','The "auditd" service can be configured to take an action when disk space starts to run low. Edit the file "/etc/audit/auditd.conf". Modify the following line, substituting [] appropriately: 

space_left_action = [ACTION]

Possible values for [ACTION] are described in the "auditd.conf" man page. These include: 

"ignore"
"syslog"
"email"
"exec"
"suspend"
"single"
"halt"


Set this to "email" (instead of the default, which is "suspend") as it is more likely to get prompt attention.  The "syslog" option is acceptable, provided the local log management infrastructure notifies an appropriate administrator in a timely manner.

The email generated through the operation "space_left_action" will be sent to an administrator.

If auditd package is not installed then rule will install it before fixing changes.

Reload the auditd.

$ service auditd reload' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000005','C-46025r3_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to email the administrator when disk space is starting to run low: 

 grep -wi space_left_action /etc/audit/auditd.conf | grep -v "^"
space_left_action = email


If the system is not configured to send an email to the system administrator when disk space is starting to run low, this is a finding.  The "syslog" option is acceptable when it can be demonstrated that the local log management infrastructure notifies an appropriate administrator in a timely manner.
','Customized rule by Cloud Raxak') from dual;
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

$ service auditd reload' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000510','C-46023r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when the audit storage volume is full:

 grep -w disk_full_action /etc/audit/auditd.conf | grep -v "^"
disk_full_action = []


If the system is configured to except "syslog" or "exec" when the volume is full, this is a finding.
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
If auditd package is not installed then rule will install it before fixing changes.

Reload the auditd.

$ service auditd reload' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000511','C-46020r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when disk errors occur:

 grep -wi disk_error_action /etc/audit/auditd.conf | grep -v "^"
disk_error_action = []

If the system is configured to except "syslog" or "exec" when disk errors occur, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38640','SV-50441r2_rule','default','low','The automatically generate crash reports for debugging(apport) service must not be running.','Mishandling crash data could expose sensitive information about vulnerabilities in software executing on the local machine, as well as sensitive information from within a process"s address space or registers.','F-43589r2_fix','. The "apport" service can be disabled with the following commands: 
 service apport stop
 sysv-rc-conf --level 0123456S apport off' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000261','C-46200r1_chk','Run the following command to verify "apport" is disabled through current runtime configuration: 

 service apport status

If the service is disabled the command will return the following output: 

apport stop/waiting

To check that the "apport" service is disabled in system boot configuration, run the following command: 

 sysv-rc-conf --list apport

Output should indicate the "apport" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf --list apport
"apport" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38641','SV-50442r2_rule','default','low','The atd service must be disabled.','The "atd" service could be used by an unsophisticated insider to carry out activities outside of a normal login session, which could complicate accountability. Furthermore, the need to schedule tasks with "at" or "batch" is not common.','F-43590r2_fix','The "at" and "batch" commands can be used to schedule tasks that are meant to be executed only once. This allows delayed execution in a manner similar to cron, except that it is not recurring. The daemon "atd" keeps track of tasks scheduled via "at" and "batch", and executes them at the specified time. The "atd" service can be disabled with the following commands: 

 sysv-rc-conf --level 0123456S atd off
 service atd stop' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000262','C-46201r2_chk','If the system uses the "atd" service, this is not applicable.

Run the following command to verify "atd" is disabled through current runtime configuration:

 service atd status

If the service is disabled the command will return the following output:

atd is stopped

To check that the "atd" service is disabled in system boot configuration, run the following command: 

 sysv-rc-conf --list atd

Output should indicate the "atd" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf --list atd
"atd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38643','SV-50444r3_rule','default','medium','There must be no world-writable files on the system.','Data in world-writable files can be modified by any user on the system. In almost all circumstances, files can be configured using a combination of user and group permissions to support whatever legitimate access is needed without the risk caused by world-writable files.','F-43591r1_fix','It is generally a good idea to remove global (other) write access to a file when it is discovered. However, check with documentation for specific applications before making changes. Also, monitor for recurring world-writable files, as these may be symptoms of a misconfigured application or user account.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000282','C-46202r3_chk','To find world-writable files, run the following command for each local partition [], excluding special filesystems such as /selinux, /proc, or /sys: 

$ find / -type f -perm -002 -print 2>>/dev/null | grep -v -e ^"/proc" -e ^"/selinux" -e ^"/sys"

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38652','SV-50453r2_rule','default','medium','Remote file systems must be mounted with the nodev option.','Legitimate device files should only exist in the /dev directory. NFS mounts should not present device files to users.','F-43601r1_fix','Add the "nodev" option to the mount option column of "/etc/fstab" for the line which controls mounting of any NFS mounts.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000269','C-46212r2_chk','To verify the "nodev" option is configured for all NFS mounts, run the following command: 

$ egrep -w "nfs[]?" /etc/fstab | grep -v "^"

All NFS mounts should have the "nodev" option in option column.
If any one of mount points does not have "nodev" option, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38654','SV-50455r2_rule','default','medium','Remote file systems must be mounted with the nosuid option.','NFS mounts should not present suid binaries to users. Only vendor-supplied suid executables should be installed to their default location on the local filesystem.','F-43603r1_fix','Add the "nosuid" option to the mount option column of "/etc/fstab" for the line which controls mounting of any NFS mounts.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000270','C-46214r3_chk','To verify the "nosuid" option is configured for all NFS mounts, run the following command: 

$ egrep -w "nfs[]?" /etc/fstab | grep -v "^"

All NFS mounts should have the "nosuid" option in option column.
If any one of mount points does not have "nosuid" option, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38655','SV-50456r1_rule','default','low','The noexec option must be added to removable media partitions.','Allowing users to execute binaries from removable media such as USB keys exposes the system to potential compromise.','F-43605r1_fix','The "noexec" mount option prevents the direct execution of binaries on the mounted filesystem. Users should not be allowed to execute binaries that exist on partitions mounted from removable media (such as a USB key). The "noexec" option prevents code from being executed directly from the media itself, and may therefore provide a line of defense against certain types of worms or malicious code. Add the "noexec" option to the fourth column of "/etc/fstab" for the line which controls mounting of any removable media partitions.

[]" and then run mount [devicename] to effect the changes.]
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000271','C-46216r1_chk','To verify that binaries cannot be directly executed from removable media, run the following command: 

[]

Check whether device with ID_BUS as usb is mounted in /etc/mtab:

$ grep -w device_name /etc/mtab | grep -v "^"

The output should show "noexec" in use. 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38656','SV-50457r1_rule','default','low','The system must use SMB client signing for connecting to samba servers using smbclient.','Packet signing can prevent man-in-the-middle attacks which modify SMB packets in transit.','F-43606r1_fix','To require samba clients running "smbclient" to use packet signing, add the following to the "[]" section of the Samba configuration file in "/etc/samba/smb.conf": 

client signing = mandatory

Requiring samba clients such as "smbclient" to use packet signing ensures they can only communicate with servers that support packet signing.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000272','C-46217r1_chk','To verify that Samba clients running smbclient must use packet signing, run the following command:

 grep -w signing /etc/samba/smb.conf | grep -v "^\s*"

The output should show:

client signing = mandatory

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38657','SV-50458r2_rule','default','low','The system must use SMB client signing for connecting to samba servers using mount.cifs.','Packet signing can prevent man-in-the-middle attacks which modify SMB packets in transit.','F-43607r1_fix','Require packet signing of clients who mount Samba shares using the "mount.cifs" program (e.g., those who specify shares in "/etc/fstab"). To do so, ensure signing options (either "sec=krb5i" or "sec=ntlmv2i") are used. 

See the "mount.cifs(8)" man page for more information. A Samba client should only communicate with servers who can support SMB packet signing.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000273','C-46218r4_chk','If Samba is not in use, this is not applicable.

To verify that Samba clients using mount.cifs must use packet signing, run the following command: 

 grep -w cifs /etc/fstab /etc/mtab | grep -v ""

The output should show either "krb5i" or "ntlmv2i" in use. 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38658','SV-50459r1_rule','default','medium','The system must prohibit the reuse of passwords within twenty-four iterations.','Preventing reuse of previous passwords helps ensure that a compromised password is not reused by a user.','F-43608r1_fix','Do not allow users to reuse recent passwords. This can be accomplished by using the "remember" option for the "pam_unix" PAM module. In the file "/etc/pam.d/common-password", append "remember=24" to the line which refers to the "pam_unix.so" module, as shown: 

password sufficient pam_unix.so [] remember=24

The requirement is 24 passwords.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000274','C-46219r1_chk','To verify the password reuse setting is compliant, run the following command: 

$ grep -w remember /etc/pam.d/common-password | grep -w password | grep -v "^"

The output should show the following at the end of the line: 

remember=24


If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38666','SV-50467r2_rule','default','high','The system must use and update a DoD-approved virus scan program.','Virus scanning software can be used to detect if a system has been compromised by computer viruses, as well as to limit their spread to other systems.','F-43615r2_fix','Install virus scanning software, which uses signatures to search for the presence of viruses on the filesystem. 

The McAfee VirusScan Enterprise for Linux virus scanning tool is provided for systems. Ensure virus definition files are no older than 7 days, or their last release. 

Configure the virus scanning software to perform scans dynamically on all accessed files. If this is not possible, configure the system to scan all altered files on the system on a daily basis. If the system processes inbound SMTP mail, configure the virus scanner to scan all received mail. ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000284','C-46226r2_chk','Check if "McAfeeVSEForLinux" is installed on the system,
 dpkg -s McAfeeVSEForLinux
Output would be: McAfeeVSEForLinux-1.9.2.29197-29197.noarch

Inspect the system for a cron job or system service which executes a virus scanning tool regularly.
To verify the McAfee VSEL system service is operational, run the following command:

 service nails status

To check the McAfee installation directory.
 ps -p$(pidof nailsd) -f |sed -e "1d" -e s/^[]*// |awk -Flibexec/nailsd "{print $1}"

Go to the directory with the installation PATH
 (ps -p$(pidof nailsd) -f |sed -e "1d" -e s/^[^\/]*// |awk -Flibexec/nailsd "{print $1}")engine/dat

To check on the age of uvscan virus definition files, run the following command:
find . -mtime +7 -type f

If virus scanning software does not run continuously, or at least daily, or has signatures that are out of date, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38667','SV-50468r2_rule','default','medium','The system must have a host-based intrusion detection tool installed.','Adding host-based intrusion detection tools can provide the capability to automatically take actions in response to malicious behavior, which can provide additional agility in reacting to network threats. These tools also often include a reporting capability to provide network awareness of system, which may not otherwise exist in an organization"s systems management regime.','F-43616r2_fix','Installing Aide package using the command:

$ apt-get install aide

Creating aide database by using the command:

$ aideinit ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000285','C-46227r1_chk','Inspect the system to determine if intrusion detection software has been installed. Verify the intrusion detection software is active by using apparmor or aide tools.

If no host-based intrusion detection tools are installed, this is a finding.

Check apparmor status on the system by using the command:

$ apparmor_status

If apparmor is not mounted, apparmor is not active on the system.

Check aide package on the system using the command:

$ dpkg -s aide

Output should be "aide is running...". If not, this is a finding.

Check aide database as per aide configuration file.
If aide database does not exist on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38670','SV-50471r2_rule','default','medium','The operating system must detect unauthorized changes to software and information. ','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43619r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000306','C-46229r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38671','SV-50472r1_rule','default','medium','The sendmail package must be removed.','The sendmail software was not developed with security in mind and its design prevents it from being effectively contained by SELinux. Postfix should be used instead.','F-43620r1_fix','Sendmail is not the default mail transfer agent and is not installed by default. The "sendmail" package can be removed with the following command: 

 dpkg -r --force-all sendmail' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000288','C-46231r1_chk','Run the following command to determine if the "sendmail" package is installed: 

 dpkg -s sendmail


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38673','SV-50474r2_rule','default','medium','The operating system must ensure unauthorized, security-relevant configuration changes detected are tracked.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43621r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000307','C-46232r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38677','SV-50478r1_rule','default','high','The NFS server must not have the insecure file locking option enabled.','Allowing insecure file locking could allow for sensitive data to be viewed or edited by an unauthorized user.','F-43626r1_fix','By default the NFS server requires secure file-lock requests, which require credentials from the client in order to lock a file. Most NFS clients send credentials with file lock requests, however, there are a few clients that do not send credentials when requesting a file-lock, allowing the client to only be able to lock world-readable files. To get around this, the "insecure_locks" option can be used so these clients can access the desired export. This poses a security risk by potentially allowing the client access to data for which it does not have authorization. Remove any instances of the "insecure_locks" option from the file "/etc/exports".

Restart NFS service to get changes in effect by using the command:
$ service nfs-kernel-server restart' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000309','C-46239r1_chk','To verify insecure file locking has been disabled, run the following command: 

 grep -w insecure_locks /etc/exports | grep -v "^"

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38684','SV-50485r2_rule','default','low','The system must limit users to 10 simultaneous system logins, or a site-defined number, in accordance with operational requirements.','Limiting simultaneous user logins can insulate the system from denial of service problems caused by excessive logins. Automated login processes operating improperly or maliciously may result in an exceptional number of simultaneous login sessions.','F-43633r1_fix','Limiting the number of allowed users and sessions per user can limit risks related to denial of service attacks. This addresses concurrent sessions for a single account and does not address concurrent sessions by a single user via multiple accounts. To set the number of concurrent sessions per user add the following line in "/etc/security/limits.conf": 

* hard maxlogins 10

A documented site-defined number may be substituted for 10 in the above.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000319','C-46246r2_chk','Run the following command to ensure the "maxlogins" value is configured for all users on the system:

$ grep -w maxlogins /etc/security/limits.conf /etc/security/limits.d/*.conf --no-messages | grep -v ":\s*"

You should receive output similar to the following:

* hard maxlogins 10

If it is not similar, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38685','SV-50486r1_rule','default','low','Temporary accounts must be provisioned with an expiration date.','When temporary accounts are created, there is a risk they may remain in place and active after the need for them no longer exists. Account expiration greatly reduces the risk of accounts being misused or hijacked.','F-43634r1_fix','In the event temporary accounts are required, configure the system to terminate them after a documented time period. For every temporary account, run the following command to set an expiration date on it, substituting "[]" and "[YYYY-MM-DD]" appropriately: 

 chage -E [YYYY-MM-DD] [USER]

"[YYYY-MM-DD]" indicates the documented expiration date for the account.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000297','C-46247r1_chk','For every temporary account, run the following command to obtain its account aging and expiration information: 

 chage -l []

Verify each of these accounts has an expiration date set as documented. 
If any temporary accounts have no expiration date set or do not expire within a documented time frame, this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000320','C-46248r1_chk','Check if IPv6 module is enabled or not using the following command :

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
select add_rule_data ('default','V-38690','SV-50491r1_rule','default','low','Emergency accounts must be provisioned with an expiration date.
','When emergency accounts are created, there is a risk they may remain in place and active after the need for them no longer exists. Account expiration greatly reduces the risk of accounts being misused or hijacked.','F-43639r1_fix','In the event emergency accounts are required, configure the system to terminate them after a documented time period. For every emergency account, run the following command to set an expiration date on it, substituting "[]" and "[YYYY-MM-DD]" appropriately: 

 chage -E [YYYY-MM-DD] [USER]

"[YYYY-MM-DD]" indicates the documented expiration date for the account.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000298','C-46251r1_chk','For every emergency account, run the following command to obtain its account aging and expiration information: 

 chage -l []

Verify each of these accounts has an expiration date set as documented. 
If any emergency accounts have no expiration date set or do not expire within a documented time frame, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38692','SV-50493r1_rule','default','low','Accounts must be locked upon 35 days of inactivity.','Disabling inactive accounts ensures that accounts which may not have been responsibly removed are not available to attackers who may have compromised their credentials.','F-43641r2_fix','To specify the number of days after a password expires (which signifies inactivity) until an account is permanently disabled, add or correct the following lines in "/etc/default/useradd", substituting "[]" appropriately: 

INACTIVE=[NUM_DAYS]

A value of 35 is recommended. If a password is currently on the verge of expiration, then 35 days remain until the account is automatically disabled. However, if the password will not expire for another 60 days, then 95 days could elapse until the account would be automatically disabled. See the "useradd" man page for more information. Determining the inactivity timeout must be done with careful consideration of the length of a "normal" period of inactivity for users in the particular environment. Setting the timeout too low incurs support costs and also has the potential to impact availability of the system to legitimate users.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000334','C-46254r2_chk','To verify the "INACTIVE" setting, run the following command:

$ grep -w "INACTIVE" /etc/default/useradd | grep -v "^\s*"

The output should indicate the "INACTIVE" configuration option is set to an appropriate integer as shown in the example below: 

INACTIVE=35

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38694','SV-50495r1_rule','default','low','The operating system must manage information system identifiers for users and devices by disabling the user identifier after an organization defined time period of inactivity.','Disabling inactive accounts ensures that accounts which may not have been responsibly removed are not available to attackers who may have compromised their credentials.','F-43643r2_fix','To specify the number of days after a password expires (which signifies inactivity) until an account is permanently disabled, add or correct the following lines in "/etc/default/useradd", substituting "[]" appropriately: 

INACTIVE=[NUM_DAYS]

A value of 35 is recommended. If a password is currently on the verge of expiration, then 35 days remain until the account is automatically disabled. However, if the password will not expire for another 60 days, then 95 days could elapse until the account would be automatically disabled. See the "useradd" man page for more information. Determining the inactivity timeout must be done with careful consideration of the length of a "normal" period of inactivity for users in the particular environment. Setting the timeout too low incurs support costs and also has the potential to impact availability of the system to legitimate users.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000335','C-46256r1_chk','To verify the "INACTIVE" setting, run the following command: 

grep "INACTIVE" /etc/default/useradd

The output should indicate the "INACTIVE" configuration option is set to an appropriate integer as shown in the example below: 

 grep "INACTIVE" /etc/default/useradd
INACTIVE=35

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38695','SV-50496r2_rule','default','medium','A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43644r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000302','C-46257r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep "aide" /etc/crontab /etc/cron./ | grep "/var/lib/aide/aide.conf.autogenerated" | grep -w nice | grep -v ":\s*"

If there is no output or if aide is not run at least weekly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38696','SV-50497r2_rule','default','medium','The operating system must employ automated mechanisms, per organization defined frequency, to detect the addition of unauthorized components/devices into the operating system.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43645r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000303','C-46258r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38698','SV-50499r2_rule','default','medium','The operating system must employ automated mechanisms to detect the presence of unauthorized software on organizational information systems and notify designated organizational officials in accordance with the organization defined frequency.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43647r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000304','C-46261r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38567','SV-50368r4_rule','default','low','The audit system must be configured to audit all use of setuid and setgid programs.','Privileged programs are subject to escalation-of-privilege attacks, which attempt to subvert their normal role of providing some necessary but limited capability. As such, motivation exists to monitor these programs for unusual activity.','F-43515r6_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.


At a minimum, the audit system should collect the execution of privileged commands for all users and root. To find the relevant setuid / setgid programs, run the following command for each local partition []:

$ sudo find [PART] -xdev -type f -perm /6000 2>/dev/null

Then, for each setuid / setgid program on the system, add a line of the following form to "/etc/audit/audit.rules", where [SETUID_PROG_PATH] is the full path to each setuid / setgid program in the list:

-a always,exit -F path=[SETUID_PROG_PATH] -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000198','C-46125r7_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To verify that auditing of privileged command use is configured, run the following command once for each local partition [] to find relevant setuid / setgid programs:

$ sudo find [PART] -xdev -type f -perm /6000 2>/dev/null

Run the following command to verify entries in the audit rules for all programs found with the previous command:

$ sudo grep path /etc/audit/audit.rules

It should be the case that all relevant setuid / setgid programs have a line in the audit rules. If that is not the case, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38443','SV-50243r1_rule','default','medium','The /etc/gshadow file must be owned by root.','The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.','F-43388r1_fix','Run the below command to change the ownership of "/etc/gshadow" to root:

 chown root /etc/gshadow' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000036','C-45998r1_chk','To check the ownership of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/gshadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38445','SV-50245r2_rule','default','medium','Audit log files must be group-owned by root.','If non-privileged users can write to audit logs, audit trails can be modified or destroyed.','F-43390r1_fix','Change the group owner of the audit log files with the following command: 

 chgrp root []' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000522','C-46000r1_chk','Run the following command to check the group owner of the system audit log file(s): 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %G 2>/dev/null

Audit log file(s) must be group-owned by root. 
If they are not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38448','SV-50248r1_rule','default','medium','The /etc/gshadow file must be group-owned by root.','The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.','F-43393r1_fix','To change the group owner of "/etc/gshadow" to root, run the command: 

 chgrp root /etc/gshadow' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000037','C-46003r1_chk','To check the group ownership of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If properly configured, the output should be: File "/etc/gshadow" is group-owned by root.
 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38449','SV-50249r1_rule','default','medium','The /etc/gshadow file must have mode 0000.','The /etc/gshadow file contains group password hashes. Protection of this file is critical for system security.','F-43394r1_fix','To properly set the permissions of "/etc/gshadow", run the command: 

 chmod 0000 /etc/gshadow' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000038','C-46004r1_chk','To check the permissions of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38450','SV-50250r1_rule','default','medium','The /etc/passwd file must be owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43395r1_fix','Run the below command to change the ownership of "/etc/passwd" to root:  

 chown root /etc/passwd' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000039','C-46005r1_chk','To check the ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If its properly configured, the output should be displayed as shown below:

"File "/etc/passwd" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38451','SV-50251r1_rule','default','medium','The /etc/passwd file must be group-owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43396r1_fix','To change the group owner of "/etc/passwd" to root, run the command: 

 chgrp root /etc/passwd' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000040','C-46006r1_chk','To check the group ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should be: File "/etc/passwd" is group-owned by root.

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38457','SV-50257r1_rule','default','medium','The /etc/passwd file must have mode 0644 or less permissive.','If the "/etc/passwd" file is writable by a group-owner or the world the risk of its compromise is increased. The file contains the list of accounts on the system and associated information, and protection of this file is critical for system security.','F-43397r1_fix','To properly set the permissions of "/etc/passwd", run the command: 

 chmod 0644 /etc/passwd' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000041','C-46007r1_chk','To check the permissions of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38458','SV-50258r1_rule','default','medium','The /etc/group file must be owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43403r1_fix','Run the below command to change the ownership of "/etc/group" to root:
 
 chown root /etc/group' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000042','C-46013r1_chk','To check the ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If its properly configured, the output should be displayed as shown below:

"File "/etc/group" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38459','SV-50259r1_rule','default','medium','The /etc/group file must be group-owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43404r1_fix','To change the group owner of "/etc/group" to root, run the command: 

 chgrp root /etc/group' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000043','C-46014r1_chk','To check the group ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should be: 

File "/etc/group" is group-owned by root.

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38461','SV-50261r1_rule','default','medium','The /etc/group file must have mode 0644 or less permissive.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43406r1_fix','To properly set the permissions of "/etc/group", run the command: 

 chmod 644 /etc/group' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000044','C-46015r1_chk','To check the permissions of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38465','SV-50265r3_rule','default','medium','Library files must have mode 0755 or less permissive.','Files from shared library directories are loaded into the address space of processes (including privileged ones) or of the kernel itself at runtime. Restrictive permissions are necessary to protect the integrity of the system.','F-43409r2_fix','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64

If any file in these directories is found to be group-writable or world-writable, correct its permission with the following command: 

 chmod go-w []' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000045','C-46019r4_chk','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64


All files in these directories should not be group-writable or world-writable. To find shared libraries that are group-writable or world-writable, run the following command for each directory [] which contains shared libraries: 

$ find -L [DIR] -perm /022 -type f


If any of these files (excluding broken symlinks) are group-writable or world-writable, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38466','SV-50266r1_rule','default','medium','Library files must be owned by root.','Files from shared library directories are loaded into the address space of processes (including privileged ones) or of the kernel itself at runtime. Proper ownership is necessary to protect the integrity of the system.','F-43411r1_fix','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64

If any file in these directories is found to be owned by a user other than root, correct its ownership with the following command: 

 chown root []' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000046','C-46021r1_chk','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64


All files in these directories should not be group-writable or world-writable.  To find shared libraries that are not owned by "root", run the following command for each directory [] which contains shared libraries: 

$ find -L [DIR] \! -user root


If any of these files are not owned by root, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38469','SV-50269r3_rule','default','medium','All system command files must have mode 755 or less permissive.','System binaries are executed by privileged users, as well as system services, and restrictive permissions are necessary to ensure execution of these programs cannot be co-opted.','F-43414r1_fix','System executables are stored in the following directories by default: 

/bin
/usr/bin
/usr/local/bin
/sbin
/usr/sbin
/usr/local/sbin

If any file in these directories is found to be group-writable or world-writable, change its permission with the following command: 

 chmod go-w []' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000047','C-46024r3_chk','System executables are stored in the following directories by default: 

/bin
/usr/bin
/usr/local/bin
/sbin
/usr/sbin
/usr/local/sbin

All files in these directories should not be group-writable or world-writable. To find system executables that are group-writable or world-writable, run the following command for each directory [] which contains system executables: 

$ find -L [DIR] -perm /022 -type f

If any system executables are found to be group-writable or world-writable, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38472','SV-50272r1_rule','default','medium','All system command files must be owned by root.','System binaries are executed by privileged users as well as system services, and restrictive permissions are necessary to ensure that their execution of these programs cannot be co-opted.','F-43417r1_fix','System executables are stored in the following directories by default: 

/bin
/usr/bin
/usr/local/bin
/sbin
/usr/sbin
/usr/local/sbin

If any file [] in these directories is owned by non-root user, change its ownership with the following command:

 chown root [FILE]' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000048','C-46027r1_chk','System executables are stored in the following directories by default: 

/bin
/usr/bin
/usr/local/bin
/sbin
/usr/sbin
/usr/local/sbin

All files in these directories should not be group-writable or world-writable. To find system executables that are not owned by "root", run the following command for each directory [] which contains system executables: 

$ find -L [DIR] \! -user root

If any system executables are owned by non-root user, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38493','SV-50294r1_rule','default','medium','Audit log directories must have mode 0755 or less permissive.','If users can delete audit logs, audit trails can be modified or destroyed.','F-43440r1_fix','Change the mode of the audit log directories with the following command: 

 chmod go-w []
If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000385','C-46050r1_chk','Run the following command to check the mode of the system audit directories: 

 grep "^log_file" /etc/audit/auditd.conf|sed "s/^[]*//; s/[^/]*$//"|xargs stat -c %a

Audit directories must be mode 0755 or less permissive. 
If any are more permissive, this is a finding.
If auditd package is not installed then rule will fail.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38495','SV-50296r1_rule','default','medium','Audit log files must be owned by root.','If non-privileged users can write to audit logs, audit trails can be modified or destroyed.','F-43443r1_fix','Change the owner of the audit log files with the following command: 

 chown root []
If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000384','C-46053r1_chk','Run the following command to check the owner of the system audit logs: 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %U

Audit logs must be owned by root. 
If they are not, this is a finding.
If auditd package is not installed then rule will get fail.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38498','SV-50299r1_rule','default','medium','Audit log files must have mode 0640 or less permissive.','If users can write to audit logs, audit trails can be modified or destroyed.','F-43445r1_fix','Change the mode of the audit log files with the following command: 

 chmod 0640 []
If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000383','C-46055r1_chk','Run the following command to check the mode of the system audit logs: 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %a

Audit logs must be mode 0640 or less permissive. 
If any are more permissive, this is a finding.
If auditd package is not installed then rule will fail.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38502','SV-50303r1_rule','default','medium','The /etc/shadow file must be owned by root.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43449r1_fix','Run the below command to change the ownership of "/etc/shadow" to root:

 chown root /etc/shadow' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000033','C-46059r1_chk','To check the ownership of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/shadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38503','SV-50304r1_rule','default','medium','The /etc/shadow file must be group-owned by root.','The "/etc/shadow" file stores password hashes. Protection of this file is critical for system security.','F-43450r1_fix','To change the group owner of "/etc/shadow" to root, run the command: 

 chgrp root /etc/shadow' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000034','C-46060r1_chk','To check the group ownership of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If properly configured, the output should be: File "/etc/shadow" is group-owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38504','SV-50305r1_rule','default','medium','The /etc/shadow file must have mode 0000.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43451r1_fix','To properly set the permissions of "/etc/shadow", run the command: 

 chmod 0000 /etc/shadow' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000035','C-46061r2_chk','To check the permissions of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38518','SV-50319r2_rule','default','medium','All rsyslog-generated log files must be owned by root.','The log files generated by rsyslog contain valuable information regarding system configuration, user authentication, and other such information. Log files should be protected from unauthorized access.','F-43465r1_fix','All rsyslog-generated log files must be owned by root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s owner:

$ ls -l [LOGFILE]

If the owner is not "root", run the following command to change this:

 chown root [LOGFILE]' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000133','C-46075r2_chk','All rsyslog-generated log files must be owned by root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". To see the owner of a given log file, run the following command:

$ ls -l []

Some log files referenced in /etc/rsyslog.conf may be created by other programs and may require exclusion from consideration. 

If the owner is not root, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38519','SV-50320r2_rule','default','medium','All rsyslog-generated log files must be group-owned by root.','The log files generated by rsyslog contain valuable information regarding system configuration, user authentication, and other such information. Log files should be protected from unauthorized access.','F-43466r1_fix','The group-owner of all log files written by "rsyslog" should be root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s group owner:

$ ls -l [LOGFILE]

If the owner is not "root", run the following command to correct this:

 chgrp root [LOGFILE]' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000134','C-46076r2_chk','The group-owner of all log files written by "rsyslog" should be root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". To see the group-owner of a given log file, run the following command:

$ ls -l []

Some log files referenced in /etc/rsyslog.conf may be created by other programs and may require exclusion from consideration.

If the group-owner is not root, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38579','SV-50380r1_rule','default','medium','The system boot loader configuration file(s) must be owned by root.','Only root should be able to modify important boot parameters.','F-43527r1_fix','The file "/etc/default/grub" should be owned by the "root" user to prevent destruction or modification of the file. To change the owner of "/etc/default/grub" to root, run the command: 

 chown root /etc/default/grub' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000065','C-46137r1_chk','To check the ownership of "etc/default/grub", run the command:

$ ls -lL /etc/default/grub

If properly configured, the output should be displayed as shown below:

The system boot loader configuration file is owned by root.
 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38581','SV-50382r1_rule','default','medium','The system boot loader configuration file(s) must be group-owned by root.','The "root" group is a highly-privileged group. Furthermore, the group-owner of this file should not have any access privileges anyway.','F-43529r1_fix','The file "/etc/default/grub" should be group-owned by the "root" group to prevent destruction or modification of the file. To change the group owner of "/etc/default/grub" to root, run the command: 

 chgrp root /etc/default/grub' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000066','C-46139r1_chk','To check the group ownership of "/etc/default/grub", run the command:
$ ls -lL /etc/default/grub

If properly configured, the output should be: The system boot loader configuration file is group owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38583','SV-50384r2_rule','default','medium','The system boot loader configuration file(s) must have mode 0600 or less permissive.','Proper permissions ensure that only the root user can modify important boot parameters.','F-43531r2_fix','File permissions for "/boot/grub/grub.cfg" should be set to 600, which is the default. To properly set the permissions of "/boot/grub/grub.cfg", run the command:

 chmod 600 /boot/grub/grub.cfg

Boot partitions based on VFAT, NTFS, or other non-standard configurations may require alternative measures.' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000067','C-46141r2_chk','To check the permissions of /boot/grub/grub.cfg, run the command:
$ ls -lL /boot/grub/grub.cfg

If properly configured, the output should indicate the following permissions: "-rw-------"
If it does not, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38623','SV-50424r2_rule','default','medium','All rsyslog-generated log files must have mode 0600 or less permissive.','Log files can contain valuable information regarding system configuration. If the system log files are not protected, unauthorized users could change the logged data, eliminating their forensic value.','F-43571r1_fix','All rsyslog-generated log files must have mode 0600 or less permissive. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s permissions:

$ ls -l [LOGFILE]

If the permissions are not 600 or more restrictive, run the following command to correct this:

 chmod 0600 [LOGFILE]' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000135','C-46181r2_chk','All rsyslog-generated log files must have mode 0600 or less permissive. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s permissions: 

$ ls -l [LOGFILE]

The permissions should be 600, or more restrictive. Some log files referenced in /etc/rsyslog.conf may be created by other programs and may require exclusion from consideration.

If the permissions are not correct, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-51875','SV-66089r1_rule','default','medium','The operating system, upon successful logon/access, must display to the user the number of unsuccessful logon/access attempts since the last successful logon/access.','Users need to be aware of activity that occurs regarding their account. Providing users with information regarding the number of unsuccessful attempts that were made to login to their account allows the user to determine if any unauthorized activity has occurred and gives them an opportunity to notify administrators. ','F-56701r1_fix','To configure the system to notify users of last logon/access using "pam_lastlog", add the following line immediately after "session required pam_limits.so":

session required pam_lastlog.so showfailed' , '[debian-based Linux] ISO-27002-v1','Profile Customized by CloudRaxak','RHEL-06-000372','C-54013r1_chk','To ensure that last logon/access notification is configured correctly, run the following command:

 grep "session\s*required\s*pam_lastlog.so" /etc/pam.d/login | grep -v "^\s*"

The output should show "showfailed". If that is not the case, this is a finding. ','Customized rule by Cloud Raxak') from dual;
