select add_profile_data ('[rpm-based Linux] PCI-DSS Compliance (Subset)' ,'Profile Customized by CloudRaxak' ,'Linux-based OS','' ,'2015-05-26' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-38438','SV-50238r2_rule','default','low','Auditing must be enabled at boot by setting a kernel parameter.','Each process on the system carries an "auditable" flag which indicates whether its activities can be audited. Although "auditd" takes care of enabling this for all processes which launch after it does, adding the kernel argument ensures it is set for every process during boot.','F-43382r2_fix','To ensure all processes can be audited, even those which start prior to the audit daemon, add the argument "audit=1" to the kernel line in "/etc/grub.conf", in the manner below:

kernel /vmlinuz-version ro vga=ext root=/dev/VolGroup00/LogVol00 rhgb quiet audit=1

UEFI systems may prepend "/boot" to the "/vmlinuz-version" argument. ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000525','C-45992r2_chk','Inspect the kernel boot arguments (which follow the word "kernel") in "/etc/grub.conf". If they include "audit=1", then auditing is enabled at boot time. 

If auditing is not enabled at boot time, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38443','SV-50243r1_rule','default','medium','The /etc/gshadow file must be owned by root.','The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.','F-43388r1_fix','Run the below command to change the ownership of "/etc/gshadow" to root:: 

 chown root /etc/gshadow' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000036','C-45998r1_chk','To check the ownership of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/gshadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38449','SV-50249r1_rule','default','medium','The /etc/gshadow file must have mode 0000.','The /etc/gshadow file contains group password hashes. Protection of this file is critical for system security.','F-43394r1_fix','To properly set the permissions of "/etc/gshadow", run the command: 

 chmod 0000 /etc/gshadow' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000038','C-46004r1_chk','To check the permissions of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38450','SV-50250r1_rule','default','medium','The /etc/passwd file must be owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43395r1_fix','Run the below command to change the ownership of "/etc/passwd" to root:: 

 chown root /etc/passwd' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000039','C-46005r1_chk','To check the ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If its properly configured, the output should be displayed as shown below:

"File "/etc/passwd" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38457','SV-50257r1_rule','default','medium','The /etc/passwd file must have mode 0644 or less permissive.','If the "/etc/passwd" file is writable by a group-owner or the world the risk of its compromise is increased. The file contains the list of accounts on the system and associated information, and protection of this file is critical for system security.','F-43397r1_fix','To properly set the permissions of "/etc/passwd", run the command: 

 chmod 0644 /etc/passwd' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000041','C-46007r1_chk','To check the permissions of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38459','SV-50259r1_rule','default','medium','The /etc/group file must be group-owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43404r1_fix','To change the group ownership of "/etc/group" to root, run the command: 

 chgrp root /etc/group' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000043','C-46014r1_chk','To check the group ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should be: File "/etc/group" is group-owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38461','SV-50261r1_rule','default','medium','The /etc/group file must have mode 0644 or less permissive.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43406r1_fix','To properly set the permissions of "/etc/group", run the command: 

 chmod 644 /etc/group' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000044','C-46015r1_chk','To check the permissions of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38475','SV-50275r1_rule','default','medium','The system must require passwords to contain a minimum of 14 characters.','Requiring a minimum password length makes password cracking attacks more difficult by ensuring a larger search space. However, any security benefit from an onerous requirement must be carefully weighed against usability problems, support costs, or counterproductive behavior that may result.

While it does not negate the password length requirement, it is preferable to migrate from a password-based authentication scheme to a stronger one based on PKI (public key infrastructure).','F-43419r1_fix','To specify password length requirements for new accounts, edit in the file "/etc/pam.d/system-auth" and update the minimum password length (minlen) parameter in the below line e.g:
password requisite pam_cracklib.so minlen=14 ucredit=0 lcredit=0 ocredit=0 dcredit=0

INFO: minlen should be >= 14 and the credits limit should be less or equal to 0 for the validation criteria in the rule.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000050','C-46029r1_chk','To check the minimum password length and to check the other settings required for the password authentication, run the command:

$ grep -v "^" /etc/pam.d/system-auth | grep -w pam_cracklib.so | grep -w password
For Redhat/Centos Version >=7 the pam_pwquality.so module is used.

If minlen is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38476','SV-50276r3_rule','default','high','Vendor-provided cryptographic certificates must be installed to verify the integrity of system software.','The Red Hat GPG keys are necessary to cryptographically verify packages are from Red Hat. ','F-43421r3_fix','To ensure the system can cryptographically verify base software packages come from Red Hat (and to connect to the Red Hat Network to receive them), the Red Hat GPG keys must be installed properly. To install the Red Hat GPG keys, run:

 rpm --import /etc/pki/rpm-gpg/*' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000008','C-46031r3_chk','To ensure that the GPG keys are installed, run:

$ rpm -q gpg-pubkey

The command should return the strings below:

gpg-pubkey-fd431d51-4ae0493b
gpg-pubkey-2fa658e0-45700c69

If the Red Hat GPG Keys are not installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38477','SV-50277r1_rule','default','medium','Users must not be able to change passwords more than once every 24 hours.','Setting the minimum password age protects against users cycling back to a favorite password after satisfying the password reuse requirement.','F-43422r1_fix','To specify password minimum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MIN_DAYS [DAYS]

A value of 1 day is considered sufficient for many environments. The DoD requirement is 1.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000051','C-46032r1_chk','To check the minimum password age, run the command: 

$ grep PASS_MIN_DAYS /etc/login.defs

The DoD requirement is 1. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38478','SV-50278r2_rule','default','low','The Red Hat Network Service (rhnsd) service must not be running, unless using RHN or an RHN Satellite.','Although systems management and patching is extremely important to system security, management by a system outside the enterprise enclave is not desirable for some environments. However, if the system is being managed by RHN or RHN Satellite Server the "rhnsd" daemon can remain on.','F-43423r2_fix','The Red Hat Network service automatically queries Red Hat Network servers to determine whether there are any actions that should be executed, such as package updates. This only occurs if the system was registered to an RHN server or satellite and managed as such. The "rhnsd" service can be disabled with the following commands: 

 chkconfig --level 0123456 rhnsd off
 service rhnsd stop' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000009','C-46033r2_chk','Run the following command to verify "rhnsd" is disabled through current runtime configuration: 
 service rhnsd status

If the service is disabled the command will return the following output: 

rhnsd is stopped

To check that the "rhnsd" service is disabled in system boot configuration, run the following command: 

 chkconfig  --list rhnsd

Output should indicate the "rhnsd" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 chkconfig --list rhnsd

"rhnsd" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

If the system uses RHN or an RHN Satellite, this is not applicable.
If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38479','SV-50279r1_rule','default','medium','User passwords must be changed at least every 60 days.','Setting the password maximum age ensures users are required to periodically change their passwords. This could possibly decrease the utility of a stolen password. Requiring shorter password lifetimes increases the risk of users writing down the password in a convenient location subject to physical compromise.','F-43424r1_fix','To specify password maximum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MAX_DAYS [DAYS]

The DoD requirement is 60.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000053','C-46034r1_chk','To check the maximum password age, run the command: 

$ grep PASS_MAX_DAYS /etc/login.defs

The DoD requirement is 60. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38480','SV-50280r1_rule','default','low','Users must be warned 7 days in advance of password expiration.','Setting the password warning age enables users to make the change at a practical time.','F-43425r1_fix','To specify how many days prior to password expiration that a warning will be issued to users, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_WARN_AGE [DAYS]

The DoD requirement is 7.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000054','C-46035r1_chk','To check the password warning age, run the command: 

$ grep PASS_WARN_AGE /etc/login.defs

The DoD requirement is 7. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38482','SV-50282r1_rule','default','low','The system must require passwords to contain at least one numeric character.','Requiring digits makes password guessing attacks more difficult by ensuring a larger search space.','F-43427r1_fix','The pam_cracklib module"s "dcredit" parameter controls requirements for usage of digits in a password. When set to a negative number, any password will be required to contain that many digits. When set to a positive number, pam_cracklib will grant +1 additional length credit for each digit. 
Add "dcredit=-1" after pam_cracklib.so in /etc/pam.d/system-auth file to require use of a digit in password.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000056','C-46037r1_chk','To check how many digits are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/system-auth | grep -w requisite | grep -v "^"

The "dcredit" parameter (as a negative number) will indicate how many digits are required. The requirement is at least one digit in a password. This would appear as "dcredit=-1". 
If dcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38489','SV-50290r1_rule','default','medium','A file integrity tool aide must be installed.','The AIDE package must be installed if it is to be available for integrity checking.','F-43436r1_fix','Install the AIDE package with the command: 

 yum install aide' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000016','C-46046r1_chk','Run the following command to determine if the "aide" package is installed: 

 rpm -q aide


If the package is not installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38492','SV-50293r1_rule','default','medium','The system must prevent the root account from logging in from virtual consoles.','Preventing direct root login to virtual console devices helps ensure accountability for actions taken on the system using the root account. ','F-43439r2_fix','To restrict root logins through the (deprecated) virtual console devices, ensure lines of this form do not appear in "/etc/securetty": 

vc/1
vc/2
vc/3
vc/4

Note:  Virtual console entries are not limited to those listed above.  Any lines starting with "vc/" followed by numerals should be removed.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000027','C-46049r1_chk','To check for virtual console entries which permit root login, run the following command: 

 grep "^vc/[]" /etc/securetty

If any output is returned, then root logins over virtual console devices is permitted. 
If root login over virtual console devices is permitted, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38496','SV-50297r3_rule','default','medium','Default operating system accounts, other than root, must be locked.','Disabling authentication for default system accounts makes it more difficult for attackers to make use of them to compromise a system.','F-43442r2_fix','Some accounts are not associated with a human user of the system, and exist to perform some administrative function. An attacker should not be able to log into these accounts. 

Disable logon access to these accounts with the command: 

 passwd -l []' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000029','C-46052r2_chk','To obtain the system accounts which is unlocked run the following command: 

$ passwd -S < username > | grep -v LK

Identify the operating system accounts from this listing. These will primarily be the accounts with UID numbers less than 500, other than root. 

If get any output this is finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38500','SV-50301r2_rule','default','medium','The root account must be the only account having a UID of 0.','An account has root authority if it has a UID of 0. Multiple accounts with a UID of 0 afford more opportunity for potential intruders to guess a password for a privileged account. Proper configuration of sudo is recommended to afford multiple system administrators access to root privileges in an accountable manner.','F-43447r1_fix','If any account other than root has a UID of 0, this misconfiguration should be investigated and the accounts other than root should be removed or have their UID changed.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000032','C-46057r2_chk','To list all password file entries for accounts with UID 0, run the following command: 

 awk -F: "($3 == "0") {print}" /etc/passwd | grep -v "^"

This should print only one line, for the user root. 
If any account other than root has a UID of 0, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38502','SV-50303r1_rule','default','medium','The /etc/shadow file must be owned by root.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43449r1_fix','Run the below command to change the ownership of "/etc/shawdow" to root:: 

 chown root /etc/shadow' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000033','C-46059r1_chk','To check the ownership of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/shadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38504','SV-50305r1_rule','default','medium','The /etc/shadow file must have mode 0000.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43451r1_fix','To properly set the permissions of "/etc/shadow", run the command: 

 chmod 0000 /etc/shadow' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000035','C-46061r2_chk','To check the permissions of "/etc/shadow", run the command: 

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

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000082','C-46068r3_chk','Check if IP forwarding for IPv4 is enabled on the system, by querying the following command:

 sysctl net.ipv4.conf.all.forwarding 

If the output of the command is not "0", this is a finding.          

Verify the value of net.ipv4.conf.all.forwarding in "/etc/sysctl.conf".

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
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

or restart sysctl' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000088','C-46086r3_chk','Check if the system is configured to log Martian packets, by querying the following command:

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

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000089','C-46088r2_chk','Check if system is configured to reject IPv4 source-routed packets by default, by running the following command:

 sysctl net.ipv4.conf.default.accept_source_route

If the output of the command is not "0", this is a finding.

Verify the value of net.ipv4.conf.default.accept_source_route in "/etc/sysctl.conf".

If net.ipv4.conf.default.accept_source_route is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38532','SV-50333r2_rule','default','medium','The system must not accept ICMPv4 secure redirect packets by default.','Accepting "secure" ICMP redirects (from those gateways listed as default gateways) has few legitimate uses. It should be disabled unless it is absolutely required.','F-43479r1_fix','To set the runtime status of the "net.ipv4.conf.default.secure_redirects" kernel parameter, run the following command:

 sysctl -w net.ipv4.conf.default.secure_redirects=0

To make this configuration persistent, add the following line to "/etc/sysctl.conf":

net.ipv4.conf.default.secure_redirects = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000090','C-46089r2_chk','Check if the system is configured to reject ICMPv4 secure redirect packets by default, by querying the following command:

 sysctl net.ipv4.conf.default.secure_redirects

If the output of the command is not "0", this is a finding.

Verify the value of net.ipv4.conf.default.secure_redirects in "/etc/sysctl.conf".

If net.ipv4.conf.default.secure_redirects is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38533','SV-50334r3_rule','default','low','The system must ignore ICMPv4 redirect messages by default.','This feature of the IPv4 protocol has few legitimate uses. It should be disabled unless it is absolutely required.','F-43481r1_fix','To set the runtime status of the "net.ipv4.conf.default.accept_redirects" kernel parameter, run the following command:

 sysctl -w net.ipv4.conf.default.accept_redirects=0

To make this configuration persistent, add the following line in "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.default.accept_redirects = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000091','C-46091r2_chk','Check if the system is configured to ignore ICMPv4 redirect messages by default, by querying the following command:

 sysctl net.ipv4.conf.default.accept_redirects 

If the output of the command is not "0", this is a finding.

Verify the value of net.ipv4.conf.default.accept_redirects in "/etc/sysctl.conf".

If net.ipv4.conf.default.accept_redirects is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38535','SV-50336r2_rule','default','low','The system must not respond to ICMPv4 sent to a broadcast address.','Ignoring ICMP echo requests (pings) sent to broadcast or multicast addresses makes the system slightly more difficult to enumerate on the network.','F-43483r1_fix','To set the runtime status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter, run the following command:

 sysctl -w net.ipv4.icmp_echo_ignore_broadcasts=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf": 

net.ipv4.icmp_echo_ignore_broadcasts = 1

and run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000092','C-46093r2_chk','The status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter can be queried by running the following command:

 sysctl net.ipv4.icmp_echo_ignore_broadcasts

The output of the command should indicate a value of "1". If this value is not the value, this is a finding.

Verify the value of net.ipv4.icmp_echo_ignore_broadcasts in "/etc/sysctl.conf".

If is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38537','SV-50338r2_rule','default','low','The system must ignore ICMPv4 bogus error responses.','Ignoring bogus ICMP error responses reduces log size, although some activity would not be logged.','F-43485r1_fix','To set the runtime status of the "net.ipv4.icmp_ignore_bogus_error_responses" kernel parameter, run the following command:

 sysctl -w net.ipv4.icmp_ignore_bogus_error_responses=1

If this is not the system"s default value, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.icmp_ignore_bogus_error_responses = 1

To make this configuration persistent, run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000093','C-46095r2_chk','Check if the system is configured to ignore ICMPv4 bogus error responses, by querying the following command: 

 sysctl -a 2>/dev/null | grep "net.ipv4.icmp_ignore_bogus_error_responses = 1"

If the output of the command is not "1", this is a finding.

Verify the value of net.ipv4.icmp_ignore_bogus_error_responses in "/etc/sysctl.conf".

If net.ipv4.icmp_ignore_bogus_error_responses is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38539','SV-50340r2_rule','default','medium','The system must be configured to use TCP syncookies when experiencing a TCP SYN flood.','A TCP SYN flood attack can cause a denial of service by filling a system"s TCP connection table with connections in the SYN_RCVD state. Syncookies can be used to track a connection when a subsequent ACK is received, verifying the initiator is attempting a valid connection and is not a flood source. This feature is activated when a flood condition is detected, and enables the system to continue servicing valid connection requests.','F-43487r1_fix','To set the runtime status of the "net.ipv4.tcp_syncookies" kernel parameter, run the following command:

 sysctl -w net.ipv4.tcp_syncookies=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf":

net.ipv4.tcp_syncookies = 1

and run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000095','C-46097r2_chk','Check if the system is configured to use TCP syncookies when experiencing a TCP SYN flood, by querying the following command:

 sysctl net.ipv4.tcp_syncookies

If the output of the command is not "1", this is a finding.

verify the value of net.ipv4.tcp_syncookies in "/etc/sysctl.conf".

If net.ipv4.tcp_syncookies is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38542','SV-50343r2_rule','default','medium','The system must use a reverse-path filter for IPv4 network traffic when possible on all interfaces.','Enabling reverse path filtering drops packets with source addresses that should not have been able to be received on the interface they were received on. It should not be used on systems which are routers for complicated networks, but is helpful for end hosts and routers serving small networks.','F-43490r1_fix','To set the runtime status of the "net.ipv4.conf.all.rp_filter" kernel parameter, run the following command:

 sysctl -w net.ipv4.conf.all.rp_filter=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.rp_filter = 1

To make this configuration persistent, run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000096','C-46100r2_chk','Check if system is configured to use the reverse-path filter for IPv4 network traffic on all interfaces enabled

on the system, by querying the following command:

 sysctl net.ipv4.conf.all.rp_filter

If the output of the command is not "1", this is a finding.

Verify the value of net.ipv4.conf.all.rp_filter in "/etc/sysctl.conf".

If it"s not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38569','SV-50370r1_rule','default','low','The system must require passwords to contain at least one uppercase alphabetic character.','Requiring a minimum number of uppercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43517r1_fix','The pam_cracklib module"s "ucredit=" parameter controls requirements for usage of uppercase letters in a password. When set to a negative number, any password will be required to contain that many uppercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each uppercase character. 
Add "ucredit=-1" after pam_cracklib.so in /etc/pam.d/system-auth file to require use of an uppercase character in a password.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000057','C-46127r1_chk','To check how many uppercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/system-auth | grep -w requisite | grep -v "^"

The "ucredit" parameter (as a negative number) will indicate how many uppercase characters are required. The requirement is at least one uppercase character in a password. This would appear as "ucredit=-1". 
If ucredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38570','SV-50371r1_rule','default','low','The system must require passwords to contain at least one special character.','Requiring a minimum number of special characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43518r1_fix','The pam_cracklib module"s "ocredit=" parameter controls requirements for usage of special (or "other") characters in a password. When set to a negative number, any password will be required to contain that many special characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each special character. 
Add "ocredit=-1" after pam_cracklib.so in /etc/pam.d/system-auth file to require use of a special character in passwords.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000058','C-46128r1_chk','To check how many special characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/system-auth | grep -w requisite | grep -v "^"

The "ocredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one special character in a password. This would appear as "ocredit=-1"
If ocredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38571','SV-50372r1_rule','default','low','The system must require passwords to contain at least one lowercase alphabetic character.','Requiring a minimum number of lowercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43519r1_fix','The pam_cracklib module"s "lcredit=" parameter controls requirements for usage of lowercase letters in a password. When set to a negative number, any password will be required to contain that many lowercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each lowercase character. 
Add "lcredit=-1" after pam_cracklib.so in /etc/pam.d/system-auth file to require use of a lowercase character in a password.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000059','C-46129r1_chk','To check how many lowercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/system-auth | grep -w requisite | grep -v "^"

The "lcredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one lowercase character in a password. This would appear as "lcredit=-1". 
If lcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38579','SV-50380r1_rule','default','medium','The system boot loader configuration file(s) must be owned by root.','Only root should be able to modify important boot parameters.','F-43527r1_fix','The file "/etc/grub.conf" should be owned by the "root" user to prevent destruction or modification of the file. To change the owner of "/etc/grub.conf" to root, run the command: 

 chown root /etc/grub.conf' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000065','C-46137r1_chk','To check the ownership of "/etc/grub.conf", run the command: 

$ ls -lL /etc/grub.conf

If properly configured, the output should be displayed as shown below:

The system boot loader configuration file is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38583','SV-50384r2_rule','default','medium','The system boot loader configuration file(s) must have mode 0600 or less permissive.','Proper permissions ensure that only the root user can modify important boot parameters.','F-43531r2_fix','File permissions for "/boot/grub/grub.conf" should be set to 600, which is the default. To properly set the permissions of "/boot/grub/grub.conf", run the command:

 chmod 600 /boot/grub/grub.conf

Boot partitions based on VFAT, NTFS, or other non-standard configurations may require alternative measures.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000067','C-46141r2_chk','To check the permissions of /etc/grub.conf, run the command:

$ sudo ls -lL /etc/grub.conf

If properly configured, the output should indicate the following permissions: "-rw-------"
If it does not, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38584','SV-50385r1_rule','default','low','The xinetd service must be uninstalled if no network services utilizing it are enabled.','Removing the "xinetd" package decreases the risk of the xinetd service"s accidental (or intentional) activation.','F-43532r1_fix','The "xinetd" package can be uninstalled with the following command: 

 rpm -e xinetd --nodeps' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000204','C-46142r1_chk','If network services are using the xinetd service, this is not applicable.

Run the following command to determine if the "xinetd" package is installed: 

 rpm -q xinetd

If the package is installed, check if any network services is utilizing xinetd using command:

 netstat -atunlp | grep "xinetd"

If No Network service(s) is using the "xinetd" but package is installed on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38587','SV-50388r1_rule','default','high','The telnet-server package must not be installed.','Removing the "telnet-server" package decreases the risk of the unencrypted telnet service"s accidental (or intentional) activation.

Mitigation:  If the telnet-server package is configured to only allow encrypted sessions, such as with Kerberos or the use of encrypted network tunnels, the risk of exposing sensitive information is mitigated.','F-43535r1_fix','The "telnet-server" package can be uninstalled with the following command: 

 rpm -e telnet-server --nodeps' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000206','C-46144r1_chk','Run the following command to determine if the "telnet-server" package is installed: 

 rpm -q telnet-server


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38591','SV-50392r1_rule','default','high','The rsh-server package must not be installed.','The "rsh-server" package provides several obsolete and insecure network services. Removing it decreases the risk of those services" accidental (or intentional) activation.','F-43539r1_fix','The "rsh-server" package can be uninstalled with the following command: 

 rpm -e rsh-server --nodeps' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000213','C-46149r1_chk','Run the following command to determine if the "rsh-server" package is installed: 

 rpm -q rsh-server


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38592','SV-50393r4_rule','default','medium','The system must require administrator action to unlock an account locked by excessive failed login attempts.','Locking out user accounts after a number of incorrect attempts prevents direct password guessing attacks. Ensuring that an administrator is involved in unlocking locked accounts draws appropriate attention to such situations.','F-43541r6_fix','To configure the system to lock out accounts after a number of incorrect logon attempts and require an administrator to unlock the account using "pam_faillock.so", modify the content of both "/etc/pam.d/system-auth" and "/etc/pam.d/password-auth" as follows: 

Add the following line immediately before the "pam_unix.so" statement in the "AUTH" section: 

auth required pam_faillock.so preauth silent deny=3 unlock_time=604800 fail_interval=900

Add the following line immediately after the "pam_unix.so" statement in the "AUTH" section: 

auth [] pam_faillock.so authfail deny=3 unlock_time=604800 fail_interval=900

Add the following line immediately before the "pam_unix.so" statement in the "ACCOUNT" section: 

account required pam_faillock.so

Note that any updates made to "/etc/pam.d/system-auth" and "/etc/pam.d/password-auth" may be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000356','C-46151r5_chk','To ensure the failed password attempt policy is configured correctly, run the following command: 

 grep -w pam_faillock /etc/pam.d/system-auth /etc/pam.d/password-auth | grep -v "^"

The output should show "unlock_time=<some-large-number>"; the largest acceptable value is 604800 seconds (one week). 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
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

$ service sshd restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000073','C-46150r1_chk','To check if the system login banner is compliant, run the following command: 

$ cat /etc/issue

If it does not display the required banner, this is a finding.

To check the parameter "Banner /etc/issue" in /etc/ssh/sshd_config.

$ grep -wi Banner /etc/ssh/sshd_config | grep -v "^"

If the parameter "Banner /etc/issue" not found in /etc/ssh/sshd_config this is finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38596','SV-50397r2_rule','default','medium','The system must implement virtual address space randomization.','Address space layout randomization (ASLR) makes it more difficult for an attacker to predict the location of attack code he or she has introduced into a process"s address space during an attempt at exploitation. Additionally, ASLR also makes it more difficult for an attacker to know the location of existing code in order to repurpose it using return oriented programming (ROP) techniques.','F-43543r1_fix','To set the runtime status of the "kernel.randomize_va_space" kernel parameter, run the following command:

 sysctl -w kernel.randomize_va_space=2

To make this configuration persistent, add the following line to "/etc/sysctl.conf":    

kernel.randomize_va_space = 2

and run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000078','C-46153r2_chk','Check if the system is configured to implement virtual address space randomization, by querying the following command:

 sysctl kernel.randomize_va_space

If the output of the command is not "2", this is a finding.

verify the value of kernel.randomize_va_space  in "/etc/sysctl.conf".

If kernel.randomize_va_space is not set to "2" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38597','SV-50398r2_rule','default','medium','The system must limit the ability of processes to have simultaneous write and execute access to memory.','ExecShield uses the segmentation feature on all x86 systems to prevent execution in memory higher than a certain address. It writes an address as a limit in the code segment descriptor, to control where code can be executed, on a per-process basis. When the kernel places a process"s memory regions such as the stack and heap higher than this address, the hardware prevents execution in that address range.','F-43545r1_fix','To set the runtime status of the "kernel.exec-shield" kernel parameter, run the following command:

 sysctl -w kernel.exec-shield=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf":

kernel.exec-shield = 1

and run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000079','C-46155r3_chk','Check if the system is configured to limit the ability of processes to have simultaneous write and execute 

access to memory, by querying the following command: 

 sysctl kernel.exec-shield

If the output of the command is not "1", this is a finding. 

Verify the value of kernel.exec-shield in "/etc/sysctl.conf". 

If kernel.exec-shield is not set to "1" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38599','SV-50400r2_rule','default','medium','The FTPS/FTP service on the system must be configured with the Department of Defense (DoD) login banner.','This setting will cause the system greeting banner to be used for FTP connections as well.','F-43564r3_fix','Edit the vsftpd configuration file, which resides at "/etc/vsftpd/vsftpd.conf" by default. Add or correct the following configuration options. 

banner_file=/etc/issue

(or)

If it"s configured with  "ftpd_banner" line set the line as fallows.

ftpd_banner="custom banner text"

Restart the vsftpd daemon.

 service vsftpd restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000348','C-46174r1_chk','If vstfpd service is not installed on the system, this rule is not applicable.
To verify this configuration, run the following command: 

 grep -w banner_file /etc/vsftpd/vsftpd.conf | grep -v "^"

and

 grep -w ftpd_banner /etc/vsftpd/vsftpd.conf | grep -v "^"

The output should show the value of "banner_file" is set to either custom banner text file or it is configured with ftpd_banner an example of which is shown below. 

banner_file=/etc/issue

or 

ftpd_banner= "custom banner text"

If it does not, this is a finding.

If the vsftpd service is not installed or the file path /usr/sbin/vsftpd does not exist this rule is not applicable.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38601','SV-50402r2_rule','default','medium','The system must not send ICMPv4 redirects from any interface.','Sending ICMP redirects permits the system to instruct other systems to update their routing information. The ability to send ICMP redirects is only appropriate for systems acting as routers.','F-43548r1_fix','To set the runtime status of the "net.ipv4.conf.all.send_redirects" kernel parameter, run the following command:

 sysctl -w net.ipv4.conf.all.send_redirects=0

To make the changes persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.send_redirects = 0

and run following command

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000081','C-46159r2_chk','Check if system sends ICMPv4 redirects from any interface, by querying the following command:

 sysctl net.ipv4.conf.all.send_redirects

If the output of the command is not "0" on any interface, this is a finding.

Verify the value of net.ipv4.conf.all.send_redirects in "/etc/sysctl.conf".

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38603','SV-50404r1_rule','default','medium','The ypserv package must not be installed.','Removing the "ypserv" package decreases the risk of the accidental (or intentional) activation of NIS or NIS+ services.','F-43551r1_fix','The "ypserv" package can be uninstalled with the following command: 

 rpm -e ypserv --nodeps' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000220','C-46161r1_chk','Run the following command to determine if the "ypserv" package is installed: 

 rpm -q ypserv


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38604','SV-50405r2_rule','default','medium','The ypbind service must not be running.','Disabling the "ypbind" service ensures the system is not acting as a client in a NIS or NIS+ domain.','F-43552r2_fix','The "ypbind" service, which allows the system to act as a client in a NIS or NIS+ domain, should be disabled. The "ypbind" service can be disabled with the following commands: 

 chkconfig ypbind off
 service ypbind stop' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000221','C-46162r2_chk','Run the following command to verify "ypbind" is disabled through current runtime configuration: 

 service ypbind status

If the service is disabled the command will return the following output: 

ypbind is stopped

To check that the "ypbind" service is disabled in system boot configuration, run the following command: 

 chkconfig --list ypbind

Output should indicate the "ypbind" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 chkconfig --list ypbind

"ypbind" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38605','SV-50406r2_rule','default','medium','The cron service must be running.','Due to its usage for maintenance and security-supporting tasks, enabling the cron daemon is essential.','F-43553r2_fix','The "crond" service is used to execute commands at preconfigured times. It is required by almost all systems to perform necessary maintenance tasks, such as notifying root of system activity. The "crond" service can be enabled with the following commands: 

 chkconfig crond on
 service crond start' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000224','C-46163r1_chk','Run the following command to determine the current status of the "crond" service: 

 service crond status

If the service is enabled, it should return the following: 

crond is running...


If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38606','SV-50407r2_rule','default','medium','The tftp-server package must not be installed unless required.','Removing the "tftp-server" package decreases the risk of the accidental (or intentional) activation of tftp services.','F-43554r1_fix','The "tftp-server" package can be removed with the following command: 

 rpm -e tftp-server --nodeps' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000222','C-46164r1_chk','Run the following command to determine if the "tftp-server" package is installed: 

 rpm -q tftp-server


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38607','SV-50408r1_rule','default','high','The SSH daemon must be configured to use only the SSHv2 protocol.','SSH protocol version 1 suffers from design flaws that result in security vulnerabilities and should not be used.','F-43555r1_fix','Only SSH protocol version 2 connections should be permitted. The default setting in "/etc/ssh/sshd_config" is correct, and can be verified by ensuring that the following line appears: 

Protocol 2

Restart ssh service to get changes in effect:

$ service sshd restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000227','C-46165r1_chk','To check which SSH protocol version is allowed, run the following command: 

 grep -iw Protocol /etc/ssh/sshd_config  | grep -v "^"

If configured properly, output should be 

Protocol 2

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38610','SV-50411r1_rule','default','low','The SSH daemon must set a timeout count on idle sessions.','This ensures a user login will be terminated as soon as the "ClientAliveCountMax" is reached.','F-43558r1_fix','To ensure the SSH idle timeout occurs precisely when the "ClientAliveCountMax" is set, edit "/etc/ssh/sshd_config" as follows: 

ClientAliveCountMax 0
Restart ssh service to get changes in effect:

$ service sshd restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000231','C-46168r1_chk','To ensure the SSH idle timeout will occur when the "ClientAliveCountMax" is set, run the following command: 

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

$ service sshd restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000230','C-46167r1_chk','Run the following command to see what the timeout interval is: 

 grep -iw ClientAliveInterval /etc/ssh/sshd_config  | grep -v "^"

If properly configured, the output should be: 

ClientAliveInterval 900


If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38609','SV-50410r2_rule','default','medium','The TFTP service must not be running.','Disabling the "tftp" service ensures the system is not acting as a tftp server, which does not provide encryption or authentication.','F-43557r4_fix','The "tftp" service should be disabled. The "tftp" service can be disabled with the following command: 

 chkconfig tftp off' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000223','C-46166r2_chk','To check that the "tftp" service is disabled in system boot configuration, run the following command:

 chkconfig "tftp" --list

Output should indicate the "tftp" service has either not been installed, or has been disabled, as shown in the example below:

 chkconfig "tftp" --list
tftp off
OR
error reading information on service tftp: No such file or directory


If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38611','SV-50412r1_rule','default','medium','The SSH daemon must ignore .rhosts files.','SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.','F-43559r1_fix','SSH can emulate the behavior of the obsolete rsh command in allowing users to enable insecure access to their accounts via ".rhosts" files. 

To ensure this behavior is disabled, add or correct the following line in "/etc/ssh/sshd_config": 

IgnoreRhosts yes' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000234','C-46169r1_chk','To determine how the SSH daemon"s "IgnoreRhosts" option is set, run the following command: 

 grep -i IgnoreRhosts /etc/ssh/sshd_config

If no line, a commented line, or a line indicating the value "yes" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38612','SV-50413r1_rule','default','medium','The SSH daemon must not allow host-based authentication.','SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.','F-43560r1_fix','SSH"s cryptographic host-based authentication is more secure than ".rhosts" authentication, since hosts are cryptographically authenticated. However, it is not recommended that hosts unilaterally trust one another, even within an organization. 

To disable host-based authentication, add or correct the following line in "/etc/ssh/sshd_config": 

HostbasedAuthentication no

Restart ssh service to get changes in effect:

$ service sshd restart
' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000236','C-46170r1_chk','To determine how the SSH daemon"s "HostbasedAuthentication" option is set, run the following command: 

 grep -iw HostbasedAuthentication /etc/ssh/sshd_config | grep -v "^

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38614','SV-50415r1_rule','default','high','The SSH daemon must not allow authentication using an empty password.','Configuring this setting for the SSH daemon provides additional assurance that remote login via SSH will require a password, even in the event of misconfiguration elsewhere.','F-43562r1_fix','To explicitly disallow remote login from accounts with empty passwords, add or correct the following line in "/etc/ssh/sshd_config": 

PermitEmptyPasswords no

Any accounts with empty passwords should be disabled immediately, and PAM configuration should prevent users from being able to assign themselves empty passwords.

Restart ssh service to get changes in effect:

$ service ssh restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000239','C-46172r1_chk','To determine how the SSH daemon"s "PermitEmptyPasswords" option is set, run the following command: 

 grep -iw PermitEmptyPasswords /etc/ssh/sshd_config  | grep -v "^"

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38615','SV-50416r1_rule','default','medium','The SSH daemon must be configured with the Department of Defense (DoD) login banner.','The warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers. Alternatively, systems whose ownership should not be obvious should ensure usage of a banner that does not provide easy attribution.','F-43563r1_fix','To enable the warning banner and ensure it is consistent across the system, add or correct the following line in "/etc/ssh/sshd_config": 

Banner /etc/issue

Another section contains information on how to create an appropriate system-wide warning banner.
Restart ssh service to get changes in effect:

$ service sshd restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000240','C-46173r1_chk','To determine how the SSH daemon"s "Banner" option is set, run the following command: 

 grep -iw Banner /etc/ssh/sshd_config | grep -v "^"

If a line indicating /etc/issue is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38616','SV-50417r1_rule','default','low','The SSH daemon must not permit user environment settings.','SSH environment options potentially allow users to bypass access restriction in some configurations.','F-43565r1_fix','To ensure users are not able to present environment options to the SSH daemon, add or correct the following line in "/etc/ssh/sshd_config": 

PermitUserEnvironment no
Restart ssh service to get changes in effect:

$ service sshd restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000241','C-46175r1_chk','To ensure users are not able to present environment daemons, run the following command: 

 grep -iw PermitUserEnvironment /etc/ssh/sshd_config | grep -v "^"

If properly configured, output should be: 

PermitUserEnvironment no


If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38617','SV-50418r1_rule','default','medium','The SSH daemon must be configured to use only FIPS 140-2 approved ciphers.','Approved algorithms should impart some level of confidence in their implementation. These are also required for compliance.','F-43566r1_fix','Limit the ciphers to those algorithms which are FIPS-approved. Counter (CTR) mode is also preferred over cipher-block chaining (CBC) mode. The following line in "/etc/ssh/sshd_config" demonstrates use of FIPS-approved ciphers: 

Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc

The man page "sshd_config(5)" contains a list of supported ciphers.

Restart ssh service to get changes in effect:
 
$ service sshd restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000243','C-46176r1_chk','Only FIPS-approved ciphers should be used. To verify that only FIPS-approved ciphers are in use, run the following command: 

 grep -iw Ciphers /etc/ssh/sshd_config | grep -v "^"

The output should contain only those ciphers which are FIPS-approved, namely, the AES and 3DES ciphers. 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38618','SV-50419r2_rule','default','low','The avahi service must be disabled.','Because the Avahi daemon service keeps an open network port, it is subject to network attacks. Its functionality is convenient but is only appropriate if the local network can be trusted.','F-43567r2_fix','The "avahi-daemon" service can be disabled with the following commands: 

 chkconfig avahi-daemon off
 service avahi-daemon stop' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000246','C-46177r1_chk','Run the following command to verify "avahi-daemon" is disabled through current runtime configuration:

 service avahi-daemon status

If the service is disabled the command will return the following output:

avahi-daemon is stopped

To check that the "avahi-daemon" service is disabled in system boot configuration, run the following command: 

 chkconfig --list avahi-daemon

Output should indicate the "avahi-daemon" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 chkconfig --list avahi-daemon

"avahi-daemon" 0:off 1:off 2:off 3:off 4:off 5:off 6:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38621','SV-50422r1_rule','default','medium','The system clock must be synchronized to an authoritative DoD time source.','Synchronizing with an NTP server makes it possible to collate system logs from multiple sources or correlate computer events with real time events. Using a trusted NTP server provided by your organization is recommended.','F-43570r1_fix','To specify a remote NTP server for time synchronization, edit the file "/etc/ntp.conf". Add or correct the following lines, substituting the IP or hostname of a remote NTP server for ntpserver. 

server []

This instructs the NTP software to contact that remote server to obtain time data.

Restart NTP service to get changes in effect by using the command:
$ service ntpd restart' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000248','C-46180r1_chk','Run the following command to determine the current status of the "ntpd" service: 

 service ntpd status

If the service is enabled, it should return the following:

ntpd is running...

If the service is not running, this is a finding.

Run the following command to determine the current status of the "ntpd" server configuration:

 ntpq -p | wc -l

If NTP servers are properly configured for synchronizing the time, you can see get output is "0".

If output is "1", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38622','SV-50423r2_rule','default','medium','Mail relaying must be restricted.','This ensures "postfix" accepts mail messages (such as cron job reports) from the local system only, and not from the network, which protects it from network attack.','F-43572r1_fix','Edit the file "/etc/postfix/main.cf" to ensure that only the following "inet_interfaces" line appears: 

inet_interfaces = localhost' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000249','C-46182r2_chk','If the system is an authorized mail relay host, this is not applicable. 

Run the following command to ensure postfix accepts mail messages from only the local system: 

$ grep -w ^inet_interfaces /etc/postfix/main.cf | grep -v "^"

If properly configured, the output should show only "localhost". 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
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

1        5        cron.daily        run-parts --report /etc/cron.daily' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000138','C-46183r1_chk','Run the following commands to determine the current status of the "logrotate" configuration.

Make sure logrotate configuration file is configured to rotate logs daily.

 grep daily /etc/logrotate.conf

The string "daily" must be at the top of the configuration file /etc/logrotate.conf.

Check whether a cron job is scheduled in /etc/crontab or /etc/anacrontab which rotates logs daily. Make sure it is scheduled for daily execution.

 grep /etc/cron.daily /etc/crontab
 grep /etc/cron.daily /etc/anacrontab

If the logrotate service is not run on a daily basis by cron in crontab or anacrontab, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38627','SV-50428r1_rule','default','low','The openldap-servers package must not be installed unless required.','Unnecessary packages should not be installed to decrease the attack surface of the system.','F-43577r1_fix','The "openldap-servers" package should be removed if not in use. Is this machine the OpenLDAP server? If not, remove the package. 

 yum erase openldap-servers

The openldap-servers RPM is not installed by default on RHEL6 machines. It is needed only by the OpenLDAP server, not by the clients which use LDAP for authentication. If the system is not intended for use as an LDAP Server it should be removed.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000256','C-46187r1_chk','To verify the "openldap-servers" package is not installed, run the following command: 

$ rpm -q openldap-servers

The output should show the following. 

package openldap-servers is not installed

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38629','SV-50430r3_rule','default','medium','The graphical desktop environment must set the idle timeout to no more than 15 minutes.','Setting the idle delay controls when the screensaver will start, and can be combined with screen locking to prevent access from passersby.','F-43578r1_fix','Run the following command to set the idle time-out value for inactivity in the GNOME desktop to 15 minutes: 


 gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --type int --set /desktop/gnome/session/idle_delay 15
' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000257','C-46188r3_chk','If the GConf2 package is not installed, this is not applicable.

To check the current idle time-out value, run the following command: 

$ gconftool-2 --get /desktop/gnome/session/idle_delay

If properly configured, the output should be "15". 

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38647','SV-50448r1_rule','default','low','The system default umask in /etc/profile must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43596r1_fix','To ensure the default umask controlled by "/etc/profile" is set properly, add or correct the "umask" setting in "/etc/profile" to read as follows: 

umask 077' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000344','C-46207r1_chk','Verify the "umask" setting is configured correctly in the "/etc/profile" file by running the following command: 

 grep "umask" /etc/profile

All output must show the value of "umask" set to 077, as shown in the below: 

 grep "umask" /etc/profile
umask 077


If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38651','SV-50452r1_rule','default','low','The system default umask for the bash shell must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43600r1_fix','To ensure the default umask for users of the Bash shell is set properly, add or correct the "umask" setting in "/etc/bashrc" to read as follows: 

umask 077' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000342','C-46211r1_chk','Verify the "umask" setting is configured correctly in the "/etc/bashrc" file by running the following command: 

 grep "umask" /etc/bashrc

All output must show the value of "umask" set to 077, as shown below: 

 grep "umask" /etc/bashrc
umask 077
umask 077


If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38658','SV-50459r1_rule','default','medium','The system must prohibit the reuse of passwords within twenty-four iterations.','Preventing reuse of previous passwords helps ensure that a compromised password is not reused by a user.','F-43608r1_fix','Do not allow users to reuse recent passwords. This can be accomplished by using the "remember" option for the "pam_unix" PAM module. In the file "/etc/pam.d/system-auth", append "remember=24" to the line which refers to the "pam_unix.so" module, as shown: 

password sufficient pam_unix.so [] remember=24

The requirement is 24 passwords.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000274','C-46219r1_chk','To verify the password reuse setting is compliant, run the following command: 

$ grep -w remember /etc/pam.d/system-auth | grep -w password | grep -v "^"

The output should show the following at the end of the line: 

remember=24


If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38667','SV-50468r2_rule','default','medium','The system must have a host-based intrusion detection tool installed.','Adding host-based intrusion detection tools can provide the capability to automatically take actions in response to malicious behavior, which can provide additional agility in reacting to network threats. These tools also often include a reporting capability to provide network awareness of system, which may not otherwise exist in an organization"s systems management regime.','F-43616r2_fix','Installing Aide package using the command:

$ yum install aide

Creating aide database by using the command:

$ aide --init' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000285','C-46227r1_chk','Inspect the system to determine if intrusion detection software has been installed. Verify the intrusion detection software is active by using selinux or aide tools.

If no host-based intrusion detection tools are installed, this is a finding

Check selinux status on the system by using the command:
$ getenforce

If output is not "Enforcing", selinux is not active on the system.

Check aide package on the system using the command:

$ rpm -q aide

Output should be "aide is running...". If not, this is a finding.

Check aide database as per aide configuration file.
If aide database does not exist on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38670','SV-50471r2_rule','default','medium','The operating system must detect unauthorized changes to software and information. ','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43619r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000306','C-46229r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38673','SV-50474r2_rule','default','medium','The operating system must ensure unauthorized, security-relevant configuration changes detected are tracked.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43621r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000307','C-46232r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38674','SV-50475r1_rule','default','medium','X Windows must not be enabled unless required.','Unnecessary services should be disabled to decrease the attack surface of the system.','F-43623r1_fix','Setting the system"s runlevel to 3 will prevent automatic startup of the X server. To do so, ensure the following line in "/etc/inittab" features a "3" as shown: 

id:3:initdefault:' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000290','C-46234r1_chk','To verify the default runlevel is 3, run the following command: 

 grep initdefault /etc/inittab

The output should show the following: 

id:3:initdefault:

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38676','SV-50477r2_rule','default','low','The xorg-x11-server-common (X Windows) package must not be installed, unless required.','Unnecessary packages should not be installed to decrease the attack surface of the system.','F-43625r1_fix','Removing all packages which constitute the X Window System ensures users or malicious software cannot start X. To do so, run the following command: 

 rpm -e xorg-x11-server-common --nodeps"' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000291','C-46236r1_chk','To ensure the X Windows package group is removed, run the following command: 

$ rpm -qi xorg-x11-server-common

The output should be: 

package xorg-x11-server-common is not installed


If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38681','SV-50482r2_rule','default','low','All GIDs referenced in /etc/passwd must be defined in /etc/group','Inconsistency in GIDs between /etc/passwd and /etc/group could lead to a user having unintended rights.','F-43630r1_fix','Add a group to the system for each GID referenced without a corresponding group.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000294','C-46243r2_chk','To ensure all GIDs referenced in /etc/passwd are defined in /etc/group, run the following command: 

 pwck -r | grep "no group"

There should be no output. 
If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38688','SV-50489r3_rule','default','medium','A login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.','An appropriate warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers.','F-43637r2_fix','To enable displaying a login warning banner in the GNOME Display Manager"s login screen, run the following command: 

  gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --type bool --set /apps/gdm/simple-greeter/banner_message_enable true

To display a banner, this setting must be enabled and then banner text must also be set.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000324','C-46250r3_chk','If the GConf2 package is not installed, this is not applicable.

To ensure a login warning banner is enabled, run the following: 

$ gconftool-2 --get /apps/gdm/simple-greeter/banner_message_enable

Search for the "banner_message_enable" schema. If properly configured, the "default" value should be "true". 
If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38689','SV-50490r3_rule','default','medium','The Department of Defense (DoD) login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.','An appropriate warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers.','F-43638r2_fix','To set the text shown by the GNOME Display Manager in the login screen, run the following command: 

 gconftool-2 --direct --config-source xml:readwrite:/etc/gconf/gconf.xml.mandatory --type string --set /apps/gdm/simple-greeter/banner_message_text "[]"

Where the DoD required text is either: 

"You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only. By using this IS (which includes any device attached to this IS), you consent to the following conditions: 
-The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law enforcement (LE), and counterintelligence (CI) investigations. 
-At any time, the USG may inspect and seize data stored on this IS. 
-Communications using, or data stored on, this IS are not private, are subject to routine monitoring, interception, and search, and may be disclosed or used for any USG-authorized purpose. 
-This IS includes security measures (e.g., authentication and access controls) to protect USG interests -- not for your personal benefit or privacy. 
-Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching or monitoring of the content of privileged communications, or work product, related to personal representation or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work product are private and confidential. See User Agreement for details." 

OR: 

"I"ve read AND consent to terms in IS user agreem"t."

When entering a warning banner that spans several lines, remember to begin and end the string with """. This command writes directly to the file "/var/lib/gdm/.gconf/apps/gdm/simple-greeter/%gconf.xml", and this file can later be edited directly if necessary.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000326','C-46252r3_chk','If the GConf2 package is not installed, this is not applicable.

To ensure login warning banner text is properly set, run the following: 

$ gconftool-2 --get /apps/gdm/simple-greeter/banner_message_text

If properly configured, the proper banner text will appear within this schema. 

If the banner text is not appear in the schema, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38694','SV-50495r1_rule','default','low','The operating system must manage information system identifiers for users and devices by disabling the user identifier after an organization defined time period of inactivity.','Disabling inactive accounts ensures that accounts which may not have been responsibly removed are not available to attackers who may have compromised their credentials.','F-43643r2_fix','To specify the number of days after a password expires (which signifies inactivity) until an account is permanently disabled, add or correct the following lines in "/etc/default/useradd", substituting "[]" appropriately: 

INACTIVE=[NUM_DAYS]

A value of 35 is recommended. If a password is currently on the verge of expiration, then 35 days remain until the account is automatically disabled. However, if the password will not expire for another 60 days, then 95 days could elapse until the account would be automatically disabled. See the "useradd" man page for more information. Determining the inactivity timeout must be done with careful consideration of the length of a "normal" period of inactivity for users in the particular environment. Setting the timeout too low incurs support costs and also has the potential to impact availability of the system to legitimate users.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000335','C-46256r1_chk','To verify the "INACTIVE" setting, run the following command: 

grep "INACTIVE" /etc/default/useradd

The output should indicate the "INACTIVE" configuration option is set to an appropriate integer as shown in the example below: 

 grep "INACTIVE" /etc/default/useradd
INACTIVE=35

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38695','SV-50496r2_rule','default','medium','A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43644r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000302','C-46257r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep "aide" /etc/crontab /etc/cron./ | grep "/etc/aide.conf" | grep -w nice | grep -v ":\s*"

If there is no output or if aide is not run at least weekly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38696','SV-50497r2_rule','default','medium','The operating system must employ automated mechanisms, per organization defined frequency, to detect the addition of unauthorized components/devices into the operating system.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43645r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000303','C-46258r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38697','SV-50498r2_rule','default','low','The sticky bit must be set on all public directories.','Failing to set the sticky bit on public directories allows unauthorized users to delete files in the directory structure. 

The only authorized public directories are those temporary directories supplied with the system, or those designed to be temporary file repositories. The setting is normally reserved for directories used by the system, and by users for temporary file storage - such as /tmp - and for directories requiring global read/write access.','F-43646r1_fix','When the so-called "sticky bit" is set on a directory, only the owner of a given file may remove that file from the directory. Without the sticky bit, any user with write access to a directory may remove any file in the directory. Setting the sticky bit prevents users from removing each other"s files. In cases where there is no reason for a directory to be world-writable, a better solution is to remove that permission rather than to set the sticky bit. However, if a directory is used by a particular application, consult that application"s documentation instead of blindly changing modes. 
To set the sticky bit on a world-writable directory [], run the following command: 

 chmod +t [DIR]' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000336','C-46259r4_chk','To find world-writable directories that lack the sticky bit, run the following command for each local partition []: 

 find [PART] -xdev -type d -perm -002 \! -perm -1000


If any world-writable directories are missing the sticky bit, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38698','SV-50499r2_rule','default','medium','The operating system must employ automated mechanisms to detect the presence of unauthorized software on organizational information systems and notify designated organizational officials in accordance with the organization defined frequency.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43647r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000304','C-46261r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-51391','SV-65601r1_rule','default','medium','A file integrity baseline must be created.','For AIDE to be effective, an initial database of "known-good" information about files must be captured and it should be able to be verified against the installed files. ','F-56189r1_fix','Run the following command to generate a new database:

 /usr/sbin/aide --init

By default, the database will be written to the file "/var/lib/aide/aide.db.new.gz". Storing the database, the configuration file "/etc/aide.conf", and the binary "/usr/sbin/aide" (or hashes of these files), in a secure location (such as on read-only media) provides additional assurance about their integrity. The newly-generated database can be installed as follows:

 cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

To initiate a manual check, run the following command:

 /usr/sbin/aide --check

If this check produces any unexpected output, investigate. ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000018','C-53727r1_chk','To find the location of the AIDE database file, run the following command:

 grep DBDIR /etc/aide.conf

Using the defined values of the [] and [database] variables, verify the existence of the AIDE database file:

 ls -l [DBDIR]/[database_file_name]

If there is no database file, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56001','SV-50462r1_rule','default','high','
    Legacy user account entries should not exist in /etc/passwd, /etc/shadow, and /etc/group files.
                        ','
    These legacy user entries may provide an avenue for attackers to gain privileged access on the system.
   ','F-56001','
    If legacy user "+" entries exist in files /etc/passwd, /etc/shadow, /etc/group. Delete or replace them as normal users.
   ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/crontab" file, run the following command:

 stat --format=%U,%G,%a /etc/crontab

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 600 or more restrictive. 

Otherwise this is finding.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56003','SV-50462r1_rule','default','high','
The /etc/cron.weekly directory must be user/group owned by root and must have mode 0700.
                    ','
This /etc/cron.weekly directory contains script which are executed weekly. Protection of this file is important for system security.
                    ','F-55014','
Change the permission of /etc/cron.weekly to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.weekly
 chown root /etc/cron.weekly
 chgrp root /etc/cron.weekly
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.weekly", run the follwoing command:

 stat --format=%U,%G,%a /etc/cron.weekly

If properly configured, the output should indicate the following permissions

User and Group ownership should be root and permission should be 700 or more restrictive. 

Otherwise this is finding.                            
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56004','SV-50462r1_rule','default','high','
The /etc/cron.monthly directory must be user/group owned by root and must have mode 0700.
                    ','
This /etc/cron.monthly directory contains script which are executed monthly. Protection of this file is important for system security.
                    ','F-55014','
Change the permission of /etc/cron.monthly to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.monthly
 chown root /etc/cron.monthly
 chgrp root /etc/cron.monthly
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.monthly", run the following command:

 stat --format=%U,%G,%a /etc/cron.monthly

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 700 or more restrictive. 

Otherwise this is finding.                          
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56005','SV-50462r1_rule','default','high','
The /etc/cron.hourly directory must be user/group owned by root and must have mode 0700.
                    ','
This /etc/cron.hourly directory contains script which are executed hourly. Protection of this file is important for system security.
                    ','F-55014','
Change the permission of /etc/cron.hourly to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.hourly
 chown root /etc/cron.hourly
 chgrp root /etc/cron.hourly
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.hourly", run the following command:

 stat --format=%U,%G,%a /etc/cron.hourly

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 700 or more restrictive. 

Otherwise this is finding.                            
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56006','SV-50462r1_rule','default','high','
The  /etc/cron.daily directory must be user/group owned by root and must have mode 0700.
                    ','
This /etc/cron.daily directory contains scripts which are executed daily. Protection of this file is important for system security.
                    ','F-55014','
Change the permission of /etc/cron.daily to 700 and change the user and group ownership to root.

 chmod 700 /etc/cron.daily
 chown root /etc/cron.daily
 chgrp root /etc/cron.daily
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check /tmp partitions mounted on system do not interpret character or block special devices on the file system:
 grep tmp /etc/mtab /etc/fstab | grep "nodev"

If "nodev" option not set this is finding.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56012','SV-50462r1_rule','default','high','
                              Core dumps must be restricted for all users.
                        ','
   Core dumps can contain information that an attacker might be able to exploit and they take up a large amount of disk space.To prevent the system creating core dumps when the operating system terminates a program due to a segment violation or other unexpected error, restrict access to core dumps.
   ','F-56012','To restrict core dumps for all users, use the below command.

 sysctl -w fs.suid_dumpable=0

To make this configuration persistent, add the following line in "/etc/sysctl.conf" and make sure that it has only single instance.

fs.suid_dumpable = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether fs.suid_dumpable = 0 using the below command: 
 sysctl fs.suid_dumpable

If the output of the command is not "0", this is a finding.

Verify the value of fs.suid_dumpable in "/etc/sysctl.conf".

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56013','SV-50462r1_rule','default','high','
                            File /etc/cron.deny must not exist on the system.
                        ','
                            This rule verifies that /etc/cron.deny file does not exist on the system.
                        ','F-56013','
If the file /etc/cron.deny exists, for removing it run:
 rm /etc/cron.deny 
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check whether /etc/cron.deny file exists on the system. If the file exists, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56014','SV-50462r1_rule','default','high','
The /etc/cron.allow file must be user/group owned by root and must have mode 0600.
                    ','
The /etc/cron.allow file is used to restrict access to cron. The root user can always use cron, regardless of the usernames listed in the access control files. Protection of this file is important for system security.
                    ','F-55014','
Change the permission of /etc/cron.allow to 600 and change the user and group ownership to root.

 chmod 600 /etc/cron.allow
 chown root /etc/cron.allow
 chgrp root /etc/cron.allow
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.allow", run the following  command:

 stat --format=%U,%G,%a /etc/cron.allow 

If properly configured, the output should indicate the following permissions. 

User and Group ownership should be root and permission should be 600 or more restrictive.

Otherwise this is finding.

If cron.allow does not exist, users listed in cron.deny are not allowed to use cron.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56015','SV-50462r1_rule','default','high','
                            File /etc/at.deny must not exist on the system.
                        ','
                            This rule verifies that /etc/at.deny file does not exist.
                        ','F-55014','
If the file /etc/at.deny exists, for removing it run:
 rm /etc/at.deny
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check whether /etc/at.deny file exists on the system. If the file exists, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56016','SV-50462r1_rule','default','high','
The /etc/at.allow file must be user/group owned by root and must have mode 0600.
                    ','
/etc/at.allow file is used to restrict the access to the at and batch commands. The root user can always execute at and batch commands, regardless of the content of the access control files. Protection of this file is important for system security.
                    ','F-55014','
Change the permission of /etc/at.allow to 600 and change the user and group ownership to root.

 chmod 600 /etc/at.allow
 chown root /etc/at.allow
 chgrp root /etc/at.allow
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/at.allow", run the following command:

 stat --format=%U,%G,%a /etc/at.allow 

If properly configured, the output should indicate the following permissions. 

User and Group ownership should be root and permission should be 600 or more restrictive. 

Otherwise this is finding.

If at.allow does not exist, users listed in at.deny are not allowed to use "at" or "batch" commands.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56017','SV-50462r1_rule','default','high','
                        The SETroubleshoot package must not be installed on the system.
                        ','
                        Setroubleshoot explains in plain English why a script or an application was blocked from executing. The tool also gives you suggestions on how to resolve the issue, which may involve running a simple command. This can be a problem if an attacker tries to execute something and it failed due to some security. This package might just help the attacker, how to bypass the security wall. This rule verifies that setroubleshoot is not installed.
                        ','F-56017','If installed on the system, remove this package by running:
 yum remove setroubleshoot-server setroubleshoot' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether setroubleshoot package is installed:
 rpm -q setroubleshoot
 rpm -q setroubleshoot-server
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56018','SV-50462r1_rule','default','high','
         The password fields in /etc/shadow must not be empty.
                        ','
         If an account with empty password field exists means that anybody may login as that user without providing a password.
   ','F-56018','
If there are users which have empty password fields, they don"t have a password set. Set a password for these users to avoid passwordless login and to avoid security risks.
   ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Run the below command to check for empty password fields:
 grep "^[]*::" /etc/shadow | cut -d: -f1
If a line is returned, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56019','SV-50462r1_rule','default','high','
         All users must have valid home directories.
                        ','
If the user"s home directory does not exist or is unassigned, the user will be placed in "/" and will not be able to write any files or have local environment variables set.
   ','F-56019','
If there are users with unassigned home directories, they should be assigned a home directory appropriately.
   ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check the users home directories assigned in the /etc/passwd file.

 awk -F: "$3>=500 ANDAND $3<=60000 {print $1, $6}" /etc/passwd

If any user"s home directories do not exist, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56020','SV-50462r1_rule','default','high','
The /var/tmp directory must be bind-mounted to /tmp.
                    ','
The Filesystem Hierarchy Standard says that /tmp/ often does not preserve temporary files between system reboots. But /var/tmp/ directory preserves temporary files between system reboots.
For example: if a process is launched every 5 minutes and needs to store some data between every launch, it will rather store them in /var/tmp/.
                    ','F-55014','
Bind mount the /var/tmp to /tmp directory to preserve temporary files between reboot.

mount –bind /var/tmp /tmp

[]
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check if /var/tmp directory is bind-mounted to /tmp run:
 grep -w ^/var/tmp /etc/fstab /etc/mtab | grep -w bind | grep -v ":\s*"

The output should show "bind" in use.
If it does not, this is a finding.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56021','SV-50462r1_rule','default','high','
For the /dev/shm partition, "nosuid" option must be set.
                    ','
shm / shmfs is also known as tmpfs, which is a common name for a temporary file storage facility on many Unix-like operating systems. It is intended to appear as a mounted file system, but one which uses virtual memory instead of a persistent storage device. The nosuid mount option specifies that the filesystem cannot contain set userid files. Preventing setuid binaries on a world-writable filesystem makes sense because there"s a risk of root escalation or other awfulness there.
                    ','F-55014','
Add the "nosuid" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /dev/shm.

If there is no /dev/shm entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "nosuid" option in the mount option column of the entry.

[]
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify that set-user-identifier or set-group-identifier bits do not take effect , run the following command:

grep -w "/dev/shm" /etc/fstab | grep -v "^"

The output should show "nosuid" in use.
If it does not, this is a finding.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56022','SV-50462r1_rule','default','high','
For the /dev/shm partition, "noexec" option must be set.
                    ','
shm / shmfs is also known as tmpfs, which is a common name for a temporary file storage facility on many Unix-like operating systems. It is intended to appear as a mounted file system, but one which uses virtual memory instead of a persistent storage device. Hackers can use temporary storage directories to store and execute unwanted programs and hack into a server, having "noexec" option set can avoid this from happening.
                    ','F-55014','
Add the "noexec" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /dev/shm.

If there is no /dev/shm entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "noexec" option in the mount option column of the entry.

[]
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify that binaries cannot be directly executed from /dev/shm partition, run the following command:

grep -w "/dev/shm" /etc/fstab | grep -v "^"

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
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
Add the "nodev" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /dev/shm.

If there is no /dev/shm entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "nodev" option in the mount option column of the entry.

[]
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify that the file system do not interpret character or block special devices , run the following command:

grep -w "/dev/shm" /etc/fstab | grep -v "^"

The output should show "nodev" in use.
If it does not, this is a finding.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56025','SV-50462r1_rule','default','high','
                              The maximum number of authentication attempts permitted per connection must be set to 4 or less.
                        ','
                              This rule verifies that MaxAuthTries parameter is set to 4.
                        ','F-56025','
Set the MaxAuthTries parameter in sshd_config file to 4.
MaxAuthTries 4

Restart the ssh service:
$ service ssh restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check the value of maximum number of authentication attempts permitted per connection by running:
 grep -iw MaxAuthTries /etc/ssh/sshd_config  | grep -v "^"

The output should be 2,3,4, if its not then this is the finding.
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
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check for Loglevel value in sshd_config file by running:
 grep -w LogLevel /etc/ssh/sshd_config
Acceptable value is INFO. If its not this is the finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56028','SV-50462r1_rule','default','high','
                              The talk-server package must not be installed on system.
                        ','
                              Talk is a very simple, basic chat program. All the client does is establish a link between the terminals of two computer users. The users can either reside on the same computer or on different, networked computers. Everything that one user types into his terminal will instantly be shown on the other user"s terminal and vice versa. This rule verifies that talk-server is not installed.
                        ','F-56028','If installed on system, remove the talk-server package by running:
 yum remove talk-server' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether talk-server is installed on system:
 rpm -q talk-server
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56029','SV-50462r1_rule','default','high','
                              The talk package must not be installed on system.
                        ','
                              Talk is a very simple, basic chat program. All the client does is establish a link between the terminals of two computer users. The users can either reside on the same computer or on different, networked computers. Everything that one user types into his terminal will instantly be shown on the other user"s terminal and vice versa.This rule verifies that talk is not installed.
                        ','F-56029','If installed on system, remove the talk package by running:
 yum remove talk' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether talk is installed on system:
 rpm -q talk
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56030','SV-50462r1_rule','default','high','
                              The SNMP Server package must not be installed on system.
                        ','
                              This rule verifies that net-snmp package does not exist.
                        ','F-56030','If installed on system, remove the net-snmp package by running:
 yum remove net-snmp' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether net-snmp is installed on system:
 rpm -q net-snmp
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56033','SV-50462r1_rule','default','high','
                              The MCS Translation Service (mcstrans) must not be installed on system.
                        ','
                              MCS Translation Service translates output of Linux errors or configuration warnings or messages into a readable format. This rule verifies that mcstrans is not installed.
                        ','F-56033','If installed on system, remove the mcstrans package by running:
 yum remove mctrans' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether mcstrans is installed on system:
 rpm -q mcstrans
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56034','SV-50462r1_rule','default','high','
                              The HTTP Server package must not be installed on system.
                        ','
                              The HTTP server daemon just replies to the request header it receives. It is not secure like HTTPS which has stronger security checks than HTTP. This rule verifies that httpd package does not exist.
                        ','F-56034','If installed on system, remove the httpd package by running:
 yum remove httpd httpd-tools apr-util apr-util-ldap' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether httpd is installed on system:
 rpm -q httpd
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56035','SV-50462r1_rule','default','high','
                              The HTTP proxy server package must not be installed on system.
                        ','
                              Malicious clients try to exploit open proxy servers to access a website without revealing their true location. They could be doing this to manipulate pay-per-click ad systems, to add comment or link-spam to someone else"s site, or just to do something nasty without being detected. This rule verifies that squid package does not exist.
                        ','F-56035','If installed on system, remove the squid package by running:
 yum remove squid' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether squid is installed on system:
 rpm -q squid
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56036','SV-50462r1_rule','default','high','
                              The Dovecot (IMAP and POP3 services) package must not be installed on system.
                        ','
                              The dovecot service has a lesser memory footprint hence it uses lesser resources. But it has a poor error handling mechanism. This rule verifies that dovecot package does not exist.
                        ','F-56036','If installed on system, remove the dovecot package by running:
 yum remove dovecot' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether dovecot is installed on system:
 rpm -q dovecot
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56037','SV-50462r1_rule','default','high','
                              The DNS Server package must not be installed on system.
                        ','
                             Domain Name System (DNS) is a centralised mechanism for resolving / giving the IP addresses for a given domain name. Breakdown of DNS would crash the world wide web though there are many root servers and backup servers targetting DNS servers at particular key locations would do lot of harm. This rule verifies that DNS server is not installed.
                        ','F-56037','If installed on system, remove the bind package by running:
 yum remove bind' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether bind is installed on system:
 rpm -q bind
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56039','SV-50462r1_rule','default','high','
                               The CUPS (Print server) daemon must be disabled.
                        ','
CUPS (an acronym for Common Unix Printing System) is a modular printing system for Unix-like computer operating systems which allows a computer to act as a print server. A computer running CUPS is a host that can accept print jobs from client computers, process them, and send them to the appropriate printer.Anyone on the local network can see the CUPS page for any other local machine which is not secure.
   ','F-56039','
   The "cups" service can be disabled with the following commands: 

 chkconfig --level 0123456 cups off
 service cups stop
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Run the following command to verify "cups" is disabled through current runtime configuration: 

 service cups status

If the service is disabled the command will return the following output: 

cups is stopped

To check that the "cups" service is disabled in system boot configuration, run the following command: 

 chkconfig "cups" --list

Output should indicate the "cups" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 chkconfig "cups" --list
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
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
   ','F-56041','
   The "daytime-stream" service can be disabled with the following commands: 
 chkconfig daytime-stream off

Restart the xinetd service
 service xinetd restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd is running...

To check that the "daytime-stream" service is disabled in system boot configuration, run the following command: 

 chkconfig daytime-stream --list

Output should indicate the "daytime-stream" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 chkconfig "daytime-stream" --list
"daytime-dgram" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56042','SV-50462r1_rule','default','high','
         The daytime-dgram daemon must be disabled.
                        ','
The Daytime Protocol is a service in the Internet Protocol Suite. It is intended for testing and measurement purposes in computer networks.
A host may connect to a server that supports the Daytime Protocol on either Transmission Control Protocol (TCP) or User Datagram Protocol (UDP) port 13. The server returns an ASCII character string of the current date and time in an unspecified format.
   ','F-56042','
   The "daytime-dgram" service can be disabled with the following commands: 

 chkconfig daytime-dgram off

Restart the xinetd service
 service xinetd restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd is running...

To check that the "daytime-dgram" service is disabled in system boot configuration, run the following command: 

 chkconfig daytime-dgram --list

Output should indicate the "daytime-dgram" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 chkconfig "daytime-dgram" --list
"daytime-dgram" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56043','SV-50462r1_rule','default','high','
         The chargen-stream daemon must be disabled.
                        ','
e Character Generator Protocol (CHARGEN) is a service of the Internet Protocol Suite defined in RFC 864 in 1983. It is intended for testing, debugging, and measurement purposes. The protocol is rarely used, as its design flaws allow ready misuse.Disabling CHARGEN will stop a server from being misused by an attacker in their efforts to disrupt another server.
   ','F-56043','
   The "chargen-stream" service can be disabled with the following commands: 
 chkconfig chargen-stream off

Restart the xinetd service
 service xinetd restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd is running...

To check that the "chargen-stream" service is disabled in system boot configuration, run the following command: 

 chkconfig chargen-stream --list

Output should indicate the "chargen-stream" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 chkconfig "chargen-stream" --list
"chargen-stream" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56044','SV-50462r1_rule','default','high','
                The chargen-dgram daemon must be disabled.
                        ','
chargen-dram is a network service that responds with 0 to 512 ASCII characters for each datagram it receives. This service is intended for debugging and testing puposes. It is recommended that this service be disabled.
   ','F-56044','
   The "chargen-dgram" service can be disabled with the following commands: 
 chkconfig chargen-dgram off

Restart the xinetd service
 service xinetd restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd is running...

To check that the "chargen-dgram" service is disabled in system boot configuration, run the following command: 

 chkconfig chargen-dgram --list

Output should indicate the "chargen-dgram" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 chkconfig "chargen-dgram" --list
"chargen-dgram" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56045','SV-50462r1_rule','default','high','
         The echo-stream and echo-dgram daemon must be disabled.
                        ','
The Echo Protocol is a service in the Internet Protocol Suite defined in RFC 862.
A host may connect to a server that supports the Echo Protocol using the Transmission Control Protocol (TCP) or the User Datagram Protocol (UDP) on the well-known port number 7. The server sends back an identical copy of the data it received.It is recommended that this service be disabled.
   ','F-56045','
   The "echo-stream" and "echo-dgram" service can be disabled with the following commands: 
 chkconfig echo-stream off

Restart the xinetd service
 service xinetd restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd is running...

To check that the "echo-stream" service are disabled in system boot configuration, run the following command: 

 chkconfig echo-stream --list

Output should indicate the "echo-stream" service has either not been installed, or have been disabled at all runlevels, as shown in the example below: 

 chkconfig "echo-stream" --list
"echo-stream" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56046','SV-50462r1_rule','default','high','
                              The number of failed log-in attempts must be logged.
                        ','
                              Hackers try to hack the servers through the front door, using the brute-force attack now all of these failed log-in attempts are logged in 
/var/log/btmp.
                        ','F-56046','
If number of failed log-in attempts are not logged create a log file for it by running:
 touch /var/log/btmp
 chmod 600 /var/log/btmp
 chgrp utmp /var/log/btmp
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check if the number of failed log-in attempts are logged, check if file /var/log/btmp exists on the system.
If this file does not exist on system, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56047','SV-50462r1_rule','default','high','
The /var/log/messages, /var/log/secure, /var/log/maillog, /var/log/cron and /var/log/spooler files must be user/group owned by root and must have mode 0600.
                    ','
/var/log/messages contains global system messages, including the messages that are logged during system startup.
/var/log/secure contains information related to authentication and authorization privileges. For example, sshd logs all the messages here, including unsuccessful login. 
/var/log/maillog contains the log information from the mail server that is running on the system.
/var/log/cron whenever cron daemon (or anacron) starts a cron job, it logs the information about the cron job in this file.
/var/log/spooler this file is rarely used and is empty on my server. This log files used to contain messages from USENET.
Since all this files conatin useful information about protection of this file is important for system security.
                    ','F-55014','
Change the permission of /var/log/messages, /var/log/secure, /var/log/maillog, /var/log/cron, /var/log/spooler and /var/log/boot.log files to 600 and change the user and group ownership to root.

 chmod 600 /var/log/messages
 chown root /var/log/messages
 chgrp root /var/log/messages

(Similarly fix for remaining files /var/log/secure, /var/log/maillog, /var/log/cron, /var/log/spooler and /var/log/boot.log)
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/var/log/messages, /var/log/secure, /var/log/maillog, /var/log/cron, /var/log/spooler and /var/log/boot.log ", run the following commands:

 stat --format=%U,%G,%a /var/log/messages
 stat --format=%U,%G,%a /var/log/secure
 stat --format=%U,%G,%a /var/log/maillog
 stat --format=%U,%G,%a /var/log/cron
 stat --format=%U,%G,%a /var/log/spooler
 stat --format=%U,%G,%a /var/log/boot.log

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 600 or more restrictive. 

Otherwise this is finding.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56049','SV-50462r1_rule','default','high','
The file /etc/hosts.deny must have mode 0644 or less.
                    ','
/etc/hosts.deny file denies particular hostname from accessing particular daemon. Access of this file other than root can provide access control over untrusted network.
                    ','F-55014','
Change the permission of /etc/hosts.deny to 644.

 chmod 644 /etc/hosts.deny
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
Change the permission of /etc/hosts.allow to 644.

 chmod 644 /etc/hosts.allow
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
 yum install tcp_wrappers

If "/etc/hosts.allow" or "/etc/hosts.deny" file(s) does not exist then run,
  yum reinstall setup -y
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify if the package is installed:
 rpm -q tcp_wrappers

After that check whether /etc/hosts.deny and /etc/hosts.allow are available.
If package is not installed this is a finding.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56058','SV-50462r1_rule','default','high','
System access via SSH service must be restricted to authorized users and groups.
                    ','
Restricting access via SSH improves the security by avoiding system access to unwanted users or groups.
                    ','F-55014','
Review the list of allowed users, allowed groups, denied users and denied groups and make sure that it is legitimate.
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check DenyUsers, AllowUsers, DenyGroups, AllowGroups in /etc/ssh/sshd_config run:
 grep -iw AllowUsers /etc/ssh/sshd_config | grep -v "^"
 grep -iw DenyUsers /etc/ssh/sshd_config | grep -v "^"
 grep -iw AllowGroups /etc/ssh/sshd_config | grep -v "^"
 grep -iw DenyGroups /etc/ssh/sshd_config | grep -v "^"

If any allowed users, allowed groups, denied users and denied groups exist make sure they are legitimate.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56059','SV-50462r1_rule','default','high','
The audit events configured on the system must be legitimate.
                        ','
User should review the list of audit events that are configured and ensure that it is legitimate. This rule produces the list of audit events that are configured for review. Auditing unnecessary activity on the system may require more disk space in log files.
   ','F-56059','Go through all the audit events carefully.
Remove those audit events which are not required as doing this can save disk space and prevent it from logging activities which are not required.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','List out all the audit events configured on the system by running:
 auditctl -l
Review the entire list of audit events configured and make sure they are legitimate.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56063','SV-50462r1_rule','default','high','
                              The rsyslog package must be installed on system.
                        ','
                              Rsyslog is the system logger. It helps in logging all the crucial activity of linux system locally and can also be used to forward logs to  remote server. This rule verifies that rsyslog is installed.
                        ','F-56063','Rsyslog is the system logger. It helps in logging all the crucial activity of linux systems. Install it by running:
 yum -y install rsyslog' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether rsyslog is installed on system:
 rpm -q rsyslog
If a line with "package rsyslog not installed" is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56062','SV-50462r1_rule','default','high','
                              The rsyslog daemon must be running.
                        ','
RSYSLOG is the rocket-fast system for log processing.
It offers high-performance, great security features and a modular design. While it started as a regular syslogd, rsyslog has evolved into a kind of swiss army knife of logging, being able to accept inputs from a wide variety of sources, transform them, and output to the results to diverse destinations.
   ','F-56062','
   The "rsyslog" service can be enabled with the following commands: 
 chkconfig rsyslog on
 service rsyslog start

                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
select add_rule_data ('default','V-56064','SV-50462r1_rule','default','high','
                              The SSH X11 Forwarding must be disabled.
                        ','
                              SSH X11 forwarding gives the user an ability to graphically run programs on remote machine. If an attacker gets access of machine via SSH, he/she can misuse the graphical console there by making it easy for them to attack a system. This rule verifies that X11Forwarding parameter is set to no.
                        ','F-56064','If SSH X11 Forwarding is enabled edit the file /etc/ssh/sshd_config
X11Forwarding no []

Restart the ssh service:
$ service ssh restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the whether X11 Forwarding is disabled run:
 grep -iw "X11Forwarding" /etc/ssh/sshd_config | grep -v "^"

The parameter should have the value set to "no", if this is not the case then this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56065','SV-50462r1_rule','default','high','
The anacron package must be installed on system.
                        ','
Cron is a system daemon used to execute desired tasks (in the background) at designated times.It is recommended to enable the service.
   ','F-56065','
If crond service is not installed then install it with the below command:
 yum install cronie-anacron

The "crond" daemon service can be enabled with the following commands: 
 chkconfig crond on
 service crond start
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "crond" service is enabled in system boot configuration, run the following command: 

 chkconfig crond --list

Output should indicate the "crond" service has either been run at all runelvels, or has been enabled at default and current runlevel, as shown in the example below: 

"crond" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

Run the following command to verify "crond" is enabled through current runtime configuration: 

 service  crond status

If the service is enabled the command will return the following output: 

crond is running

Check whether anacron is installed on system:
 rpm -q cronie-anacron
If the service is not running or package anacron is not installed, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56008','SV-50462r1_rule','default','high','
The /etc/anacrontab file must be user/group owned by root and must have mode 0600.
                    ','
The /etc/anacrontab configuration file describes the jobs controlled by anacron. Anacron is used to execute commands periodically, with a frequency specified in days. Protection of this file is important for system security.
                    ','F-55014','
Change the permission of file /etc/anacrontab to 600 and change the user and group ownership to root.

 chmod 600 /etc/anacrontab
 chown root /etc/anacrontab
 chgrp root /etc/anacrontab
                    ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/anacrontab", run the following command:

 stat --format=%U,%G,%a /etc/anacrontab

If properly configured, the output should indicate the following permissions.

User and Group ownership should be root and permission should be 600 or more restrictive. 

otherwise this is finding.
                            ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56066','SV-50462r1_rule','default','high','
                              The DHCP Server package must not be installed on system.
                        ','
                              DHCP automation can be a serious security risk if a rogue DHCP server is introduced to the network. A rogue server isn"t under control of the network staff, and can offer IP addresses to users connecting to the network. If a user connects to the rogue DHCP, information sent over that connection can be intercepted or looked at, violating user privacy and network security. This rule verifies that dhcp package does not exist.
                        ','F-56066','If installed on system, remove the dhcp package by running:
 yum remove dhcp dnsmasq' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether dhcp server is installed on system:
 rpm -q dhcp
 rpm -q dnsmasq
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
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

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','To check that the IPv6 Redirects Acceptance is disabled, run the following command:

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

or restart sysctl.' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','To check that the "IPv6" Router Advertisements are disabled, run the following command:

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
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
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
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
Check whether there aren"t any duplicate UIDs:
$ awk -F: "{print $3}" /etc/passwd | sort |uniq -d

If there is any duplicate UID, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56075','SV-50462r1_rule','default','high','
                              The FTP Server package must not be installed on system.
                        ','
                              FTP (File transfer protocol) is resposible for insecure file transfers over the network. This rule asks to uninstall ftp server if installed.
                        ','F-56075','If installed on system, remove the vsftpd package by running:
 yum remove vsftpd' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether vsftpd is installed on system:
 rpm -q vsftpd
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56076','SV-50462r1_rule','default','high','
                              The samba package must not be installed on system.
                        ','
                              Since Samba server is in it"s development phase, it is not secure because the bugs in the software leave the system vulnerable to mail archive loss. This rule asks to uninstall samba package from the system.
                        ','F-56076','If installed on system, remove the samba package by running:
 yum remove samba' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether samba is installed on system:
 rpm -q samba
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56077','SV-50462r1_rule','default','high','
                              The telnet-client package must not be installed on system.
                        ','
                              Telenet client or server are not as secure as ssh over a network. This rule asks to uninstall telnet client from the system.
                        ','F-56077','If installed on system, remove the telnet package by running:
 yum remove telnet' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether telnet is installed on system:
 rpm -q telnet
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56078','SV-50462r1_rule','default','high','
                              The tftp package must not be installed on system.
                        ','
                              The tftp protocol is a lot insecure since it does not require an id or password. This rule asks to uninstall tftp from the system.
                        ','F-56078','If installed on system, remove the tftp package by running:
 yum remove tftp' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','Check whether tftp is installed on system:
 rpm -q tftp
If a line with package name and version is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56079','SV-50462r1_rule','default','high','
         The echo-stream and echo-dgram daemon must be disabled.
                        ','
The Echo Protocol is a service in the Internet Protocol Suite defined in RFC 862.
A host may connect to a server that supports the Echo Protocol using the Transmission Control Protocol (TCP) or the User Datagram Protocol (UDP) on the well-known port number 7. The server sends back an identical copy of the data it received.It is recommended that this service be disabled.
   ','F-56079','
   The "echo-dgram" service can be disabled with the following commands: 
 chkconfig echo-dgram off

Restart the xinetd service
 service xinetd restart
                        ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check that the "xinetd" service is enabled, run the following command: 
 service xinetd status

xinetd is running...

To check that the "echo-dgram" service are disabled in system boot configuration, run the following command: 

 chkconfig echo-dgram --list

Output should indicate the "echo-dgram" service has either not been installed, or have been disabled at all runlevels, as shown in the example below: 

 chkconfig "echo-dgram" --list
"echo-dgram" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.
                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57569','SV-71919r1_rule','default','medium','The noexec option must be added to the /tmp partition.','Allowing users to execute binaries from world-writable directories such as "/tmp" should never be necessary in normal operation and can expose the system to potential compromise.','F-62639r1_fix','
Add the "noexec" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /tmp.

If there is no /tmp entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "noexec" option in the mount option column of the entry.

[]
            ' , '[rpm-based Linux] PCI-DSS Compliance (Subset)','Profile Customized by CloudRaxak','RHEL-06-000528','C-58279r1_chk','
To verify that binaries cannot be directly executed from /tmp partition, run the following command:

grep -w "/tmp" /etc/mtab /etc/fstab | grep -v "^"

The output should show "noexec" in use.
If it does not, this is a finding.
    ','Customized rule by Cloud Raxak') from dual;
