select add_profile_data ('[debian-based Linux] UNIX DISA - Mission Critical Classified' ,'Profile Customized by CloudRaxak' ,'Linux-based OS','' ,'2015-05-26' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-38437','SV-50237r1_rule','default','low','Automated file system mounting tools must not be enabled unless needed.','All filesystems that are required for the successful operation of the system should be explicitly listed in "/etc/fstab" by an administrator. New filesystems should not be arbitrarily introduced via the automounter.

The "autofs" daemon mounts and unmounts filesystems, such as user home directories shared via NFS, on demand. In addition, autofs can be used to handle removable media, and the default configuration provides the cdrom device as "/misc/cd". However, this method of providing access to removable media is not common, so autofs can almost always be disabled if NFS is not in use. Even if NFS is required, it is almost always possible to configure filesystem mounts statically by editing "/etc/fstab" rather than relying on the automounter. ','F-43381r1_fix','If the "autofs" service is not needed to dynamically mount NFS filesystems or removable media, disable the service for all runlevels: 

  sysv-rc-conf --level 0123456S autofs off

Stop the service if it is already running: 

 service autofs stop' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000526','C-45991r1_chk','To verify the "autofs" service is not running:

 service autofs status

To verify the "autofs" service is disabled at system boot configuration, run the following command:

 sysv-rc-conf --list autofs

If properly configured, the output should be the following: 

autofs 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the autofs service is enabled or running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38455','SV-50255r1_rule','default','low','The system must use a separate file system for /tmp.','The "/tmp" partition is used as temporary storage by many programs. Placing "/tmp" in its own partition enables the setting of more restrictive mount options, which can help protect programs which use it.','F-43387r1_fix','The tmp partition is used as temporary storage by many programs. Placing /tmp in its own partition enables the setting of more restrictive mount options, which can help to protect the programs that use it. Please create a separate file system for /tmp.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000001','C-45997r1_chk','Run the following command to determine if "/tmp" is on its own partition or logical volume: 

$ mount | grep "on /tmp "

If "/tmp" has its own partition or volume group, a line will be returned. 
If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38456','SV-50256r1_rule','default','low','The system must use a separate file system for /var.','Ensuring that "/var" is mounted on its own partition enables the setting of more restrictive mount options. This helps protect system services such as daemons or other programs which use it. It is not uncommon for the "/var" directory to contain world-writable directories, installed by other software packages.','F-43401r2_fix','Ensuring that /var is mounted on its own partition enables the setting of more restrictive mount options. This helps protect system services such as daemons or other programs which use it. It is not uncommon for the /var directory to contain world-writable directories, installed by other software packages. Please create a separate file system for /var.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000002','C-46011r2_chk','Run the following command to determine if "/var" is on its own partition or logical volume: 

$ mount | grep "on /var "

If "/var" has its own partition or volume group, a line will be returned. 
If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38473','SV-50273r1_rule','default','low','The system must use a separate file system for user home directories.','Ensuring that "/home" is mounted on its own partition enables the setting of more restrictive mount options, and also helps ensure that users cannot trivially fill partitions used for log or audit data storage.','F-43418r1_fix','Ensuring that "/home" mounted on its own partition enables the setting of more restrictive mount options and also helps to ensure that users cannot trivially fill partitions used for log or audit data storage. Please create a separate file system for "/home" directories.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000007','C-46028r1_chk','Run the following command to determine if "/home" is on its own partition or logical volume: 

$ mount | grep "on /home "

If "/home" has its own partition or volume group, a line will be returned. 
If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38475','SV-50275r1_rule','default','medium','The system must require passwords to contain a minimum of 14 characters.','Requiring a minimum password length makes password cracking attacks more difficult by ensuring a larger search space. However, any security benefit from an onerous requirement must be carefully weighed against usability problems, support costs, or counterproductive behavior that may result.

While it does not negate the password length requirement, it is preferable to migrate from a password-based authentication scheme to a stronger one based on PKI (public key infrastructure).','F-43419r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

To specify password length requirements for new accounts,
edit the file "/etc/pam.d/common-password" and update the minimum password length (minlen) parameter in the below line e.g:

password requisite pam_cracklib.so minlen=14 ucredit=0 lcredit=0 ocredit=0 dcredit=0

INFO: minlen should be >= 14 and the credits limit should be less or equal to 0 for the validation criteria in the rule.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000050','C-46029r1_chk','To check the minimum password length and to check the other settings required for the password authentication, run the command:

$ grep -v "^" /etc/pam.d/common-password | grep -w pam_cracklib.so | grep -w password

If minlen is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38479','SV-50279r1_rule','default','medium','User passwords must be changed at least every 60 days.','Setting the password maximum age ensures users are required to periodically change their passwords. This could possibly decrease the utility of a stolen password. Requiring shorter password lifetimes increases the risk of users writing down the password in a convenient location subject to physical compromise.','F-43424r1_fix','To specify password maximum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MAX_DAYS [DAYS]

The DoD requirement is 60.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000053','C-46034r1_chk','To check the maximum password age, run the command: 

$ grep PASS_MAX_DAYS /etc/login.defs

The DoD requirement is 60. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38477','SV-50277r1_rule','default','medium','Users must not be able to change passwords more than once every 24 hours.','Setting the minimum password age protects against users cycling back to a favorite password after satisfying the password reuse requirement.','F-43422r1_fix','To specify password minimum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MIN_DAYS [DAYS]

A value of 1 day is considered sufficient for many environments. The DoD requirement is 1.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000051','C-46032r1_chk','To check the minimum password age, run the command: 

$ grep PASS_MIN_DAYS /etc/login.defs

The DoD requirement is 1. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38481','SV-50281r1_rule','default','medium','System security patches and updates must be installed and up-to-date.','Installing software updates is a fundamental mitigation against the exploitation of publicly-known vulnerabilities.','F-43426r1_fix','If the system is joined to the Ubuntu Network, a Ubuntu Satellite Server, or a Ubuntu server, run the following command to install updates: 

The below command will list down all the packages which are need to upgraded in Ubuntu.
 /usr/lib/update-notifier/apt-check -p

We have to upgrade package wise:
 apt-get upgrade []

If the system is not configured to use one of these sources, updates can be manually downloaded from the Ubuntu Network and installed using "apt-get".' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000011','C-46036r1_chk','If the system is joined to the Ubuntu Network, a Ubuntu Satellite Server, or Ubuntu server which provides updates, invoking the following command will indicate if updates are available: 

The below command will list down all the packages which are need to upgraded in Ubuntu.
 /usr/lib/update-notifier/apt-check -p 

If updates are not installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38482','SV-50282r1_rule','default','low','The system must require passwords to contain at least one numeric character.','Requiring digits makes password guessing attacks more difficult by ensuring a larger search space.','F-43427r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

 apt-get -y install libpam-cracklib

The pam_cracklib module"s "dcredit" parameter controls requirements for usage of digits in a password. When set to a negative number, any password will be required to contain that many digits. When set to a positive number, pam_cracklib will grant +1 additional length credit for each digit. 
Add "dcredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a digit in password.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000056','C-46037r1_chk','To check how many digits are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "dcredit" parameter (as a negative number) will indicate how many digits are required. The requirement is at least one digit in a password. This would appear as "dcredit=-1". 
If dcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38487','SV-50288r1_rule','default','low','The system package management tool must cryptographically verify the authenticity of all software packages during installation.','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.','F-43433r1_fix','Pass the --allow-unauthenticated option to apt-get as in:

$ sudo apt-get --allow-unauthenticated upgrade

From the manual page of apt-get:

--allow-unauthenticated
Ignore if packages can"t be authenticated and don"t prompt about it. This is useful for tools like pbuilder. Configuration Item: APT::Get::AllowUnauthenticated.

You can make this setting permanent by using your own config file at /etc/apt/apt.conf.d/ directory. The filename can be 99myown and it may contain this line:

APT::Get::AllowUnauthenticated "true"; ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000015','C-46043r1_chk','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.:
 
$ grep -rwi AllowUnauthenticated /etc/apt/* | grep -v ":\s*"
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-51391','SV-65601r1_rule','default','medium','A file integrity baseline must be created.','For AIDE to be effective, an initial database of "known-good" information about files must be captured and it should be able to be verified against the installed files. ','F-56189r1_fix','Run the following command to generate a new database:

 /usr/sbin/aide --init

By default, the database will be written to the file "/var/lib/aide/aide.db.new.gz". Storing the database, the configuration file "/etc/aide.conf", and the binary "/usr/sbin/aide" (or hashes of these files), in a secure location (such as on read-only media) provides additional assurance about their integrity. The newly-generated database can be installed as follows:

 cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

To initiate a manual check, run the following command:

 /usr/sbin/aide --check

If this check produces any unexpected output, investigate. ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000018','C-53727r1_chk','To find the location of the AIDE database file, run the following command:

 grep DBDIR /etc/aide.conf

Using the defined values of the [] and [database] variables, verify the existence of the AIDE database file:

 ls -l [DBDIR]/[database_file_name]

If there is no database file, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38490','SV-50291r4_rule','default','medium','The operating system must enforce requirements for the connection of mobile devices to operating systems.','USB storage devices such as thumb drives can be used to introduce unauthorized software and other vulnerabilities. Support for these devices should be disabled and the devices themselves should be tightly controlled.','F-43437r3_fix','To prevent USB storage devices from being used, configure the kernel module loading system to prevent automatic loading of the USB storage driver. To configure the system to prevent the "usb-storage" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": (Note: File should have .conf extension.)

$ install usb-storage /bin/true

This will prevent the "modprobe" program from loading the "usb-storage" module, but will not prevent an administrator (or another program) from using the "insmod" program to load the module manually.

To disable the usb-storage module run following command:

$ rmmod usb-storage
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000503','C-46047r3_chk','If the system is configured to prevent the loading of the "usb-storage" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr usb-storage /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38496','SV-50297r3_rule','default','medium','Default operating system accounts, other than root, must be locked.','Disabling authentication for default system accounts makes it more difficult for attackers to make use of them to compromise a system.','F-43442r2_fix','Some accounts are not associated with a human user of the system, and exist to perform some administrative function. An attacker should not be able to log into these accounts. 

Disable logon access to these accounts with the command: 

 passwd -l []' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000029','C-46052r2_chk','To obtain the system accounts which is unlocked run the following command:

$ passwd -S  < username > | grep -v L 

If get any output this is finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38497','SV-50298r2_rule','default','high','The system must not have accounts configured with blank or null passwords.','If an account has an empty password, anyone could log in and run commands with the privileges of that account. Accounts with empty passwords should never be used in operational environments.','F-43444r4_fix','If an account is configured for password authentication but does not have an assigned password, it may be possible to log onto the account without authentication. Remove any instances of the "nullok" option in "/etc/pam.d/common-auth" to prevent logons with empty passwords.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000030','C-46054r2_chk','To verify that null passwords cannot be used, run the following command: 

 grep -w nullok /etc/pam.d/common-auth | grep -v "^"

If this produces any output, it may be possible to log into accounts with empty passwords. 
If NULL passwords can be used, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38499','SV-50300r1_rule','default','medium','The /etc/passwd file must not contain password hashes.','The hashes for all user account passwords should be stored in the file "/etc/shadow" and never in "/etc/passwd", which is readable by all users.','F-43446r1_fix','If any password hashes are stored in "/etc/passwd" (in the second field, instead of an "x"), the cause of this misconfiguration should be investigated. The account should have its password reset and the hash should be properly stored, or the account should be deleted entirely.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000031','C-46056r1_chk','To check that no password hashes are stored in "/etc/passwd", run the following command: 

 awk -F: "($2 != "x") {print}" /etc/passwd

If it produces any output, then a password hash is stored in "/etc/passwd". 
If any stored hashes are found in /etc/passwd, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38500','SV-50301r2_rule','default','medium','The root account must be the only account having a UID of 0.','An account has root authority if it has a UID of 0. Multiple accounts with a UID of 0 afford more opportunity for potential intruders to guess a password for a privileged account. Proper configuration of sudo is recommended to afford multiple system administrators access to root privileges in an accountable manner.','F-43447r1_fix','If any account other than root has a UID of 0, this misconfiguration should be investigated. then that uid needs to be changed due to this reason rule is moved to manual.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000032','C-46057r2_chk','To list all password file entries for accounts with UID 0, run the following command: 

 awk -F: "($3 == "0") {print}" /etc/passwd | grep -v "^"

This should print only one line, for the user root. 
If any account other than root has a UID of 0, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38573','SV-50374r4_rule','default','medium','The system must disable accounts after three consecutive unsuccessful logon attempts.','Locking out user accounts after a number of incorrect attempts prevents direct password guessing attacks.','F-43521r8_fix','To configure the system to lock out accounts after a number of incorrect logon attempts using "pam_faillock.so", modify the content of "/etc/pam.d/common-auth" as follows: 

Add the following line immediately before the "pam_unix.so" statement in the "AUTH" section: 

auth required pam_tally2.so deny=3 onerr=fail unlock_time=604800 fail_interval=900
account required pam_tally2.so

Note that any updates made to "/etc/pam.d/common-auth" may be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000061','C-46131r4_chk','To ensure the failed password attempt policy is configured correctly, run the following command: 

 grep -w pam_faillock /etc/pam.d/common-auth | grep -v "^"

The output should show "deny=3" for both files. 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38511','SV-50312r2_rule','default','medium','IP forwarding for IPv4 must not be enabled, unless the system is a router.','IP forwarding permits the kernel to forward packets from one network interface to another. The ability to forward packets between two networks is only appropriate for systems acting as routers.','F-43458r2_fix','To set the runtime status of the "net.ipv4.conf.all.forwarding" kernel parameter, 
run the following command: 

 sysctl -w net.ipv4.conf.all.forwarding=0

To make this configuration persistent, add the following line in "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.forwarding = 0

and run following command. 

 sysctl -p 

or restart sysctl.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000082','C-46068r3_chk','Check if IP forwarding for IPv4 is enabled on the system, by querying the following command: 

 sysctl net.ipv4.conf.all.forwarding

If the output of the command is not "0", this is a finding. 

Verify the value of net.ipv4.conf.all.forwarding in "/etc/sysctl.conf". 

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38514','SV-50315r3_rule','default','medium','The Datagram Congestion Control Protocol (DCCP) must be disabled unless required.','Disabling DCCP protects the system against exploitation of any flaws in its implementation.','F-43461r3_fix','The Datagram Congestion Control Protocol (DCCP) is a relatively new transport layer protocol, designed to support streaming media and telephony. To configure the system to prevent the "dccp" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": (Note: File should have .conf extension.)

$ install dccp /bin/true

To disable the dccp module run following command:

$ rmmod dccp
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000124','C-46071r3_chk','If the system is configured to prevent the loading of the "dccp" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr dccp /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38515','SV-50316r3_rule','default','medium','The Stream Control Transmission Protocol (SCTP) must be disabled unless required.','Disabling SCTP protects the system against exploitation of any flaws in its implementation.','F-43462r3_fix','The Stream Control Transmission Protocol (SCTP) is a transport layer protocol, designed to support the idea of message-oriented communication, with several streams of messages within one connection. To configure the system to prevent the "sctp" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": (Note: File should have .conf extension.)

$ install sctp /bin/true

To disable the sctp module run following command:

$ rmmod sctp
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000125','C-46072r3_chk','If the system is configured to prevent the loading of the "sctp" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr sctp /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38516','SV-50317r3_rule','default','low','The Reliable Datagram Sockets (RDS) protocol must be disabled unless required.','Disabling RDS protects the system against exploitation of any flaws in its implementation.','F-43463r4_fix','The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to provide reliable high-bandwidth, low-latency communications between nodes in a cluster. To configure the system to prevent the "rds" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d":(Note: File should have .conf extension.)

$ install rds /bin/true

To disable the rds module run following command:

$ rmmod rds
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000126','C-46073r3_chk','If the system is configured to prevent the loading of the "rds" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr rds /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38517','SV-50318r3_rule','default','medium','The Transparent Inter-Process Communication (TIPC) protocol must be disabled unless required.','Disabling TIPC protects the system against exploitation of any flaws in its implementation.','F-43464r3_fix','The Transparent Inter-Process Communication (TIPC) protocol is designed to provide communications between nodes in a cluster. To configure the system to prevent the "tipc" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d":(Note: File should have .conf extension.) 

$ install tipc /bin/true

To disable the tipc module run following command:

$ rmmod tipc
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000127','C-46074r3_chk','If the system is configured to prevent the loading of the "tipc" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr tipc /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38520','SV-50321r1_rule','default','medium','The operating system must back up audit records on an organization defined frequency onto a different system or media than the system being audited.','A log server (loghost) receives syslog messages from one or more systems. This data can be used as an additional log source in the event a system is compromised and its local logs are suspect. Forwarding log messages to a remote loghost also provides system administrators with a centralized place to view the status of multiple hosts within the enterprise.','F-43468r1_fix','To configure rsyslog to send logs to a remote log server, open "/etc/rsyslog.conf" and read and understand the last section of the file, which describes the multiple directives necessary to activate remote logging. Along with these other directives, the system can be configured to forward its logs to a particular log server by adding or correcting one of the following lines, substituting "[]" appropriately. The choice of protocol depends on the environment of the system; although TCP and RELP provide more reliable message delivery, they may not be supported in all environments. 
To use UDP for log message delivery: 

*.* @[loghost.example.com]


To use TCP for log message delivery: 

*.* @@[loghost.example.com]


To use RELP for log message delivery: 

*.* :omrelp:[loghost.example.com]' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000136','C-46078r1_chk','To ensure logs are sent to a remote host, examine the file "/etc/rsyslog.conf". If using UDP, a line similar to the following should be present: 

*.* @[]

If using TCP, a line similar to the following should be present: 

*.* @@[loghost.example.com]

If using RELP, a line similar to the following should be present: 

*.* :omrelp:[loghost.example.com]


If none of these are present, this is a finding.','Customized rule by Cloud Raxak') from dual;
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

or restart sysctl' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000088','C-46086r3_chk','Check if the system is configured to log Martian packets, by querying the following command:

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

or restart sysctl.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000089','C-46088r2_chk','Check if system is configured to reject IPv4 source-routed packets by default, by running the following command:

 sysctl net.ipv4.conf.default.accept_source_route

If the output of the command is not "0", this is a finding.

Verify the value of net.ipv4.conf.default.accept_source_route in "/etc/sysctl.conf".

If net.ipv4.conf.default.accept_source_route is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000175','C-46092r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit account changes, run the following command: 

auditctl -l | egrep "(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)"

If the system is configured to watch for account changes, lines should be returned for each file specified (and with "perm=wa" for each). 
If the system is not configured to audit account changes, this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000176','C-46094r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit account changes, run the following command: 

auditctl -l | egrep "(/etc/passwd|/etc/shadow|/etc/group|/etc/gshadow|/etc/security/opasswd)"

If the system is configured to watch for account changes, lines should be returned for each file specified (and with "perm=wa" for each). 
If the system is not configured to audit account changes, this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000177','C-46096r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000095','C-46097r2_chk','Check if the system is configured to use TCP syncookies when experiencing a TCP SYN flood, by querying the following command:

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

or restart sysctl.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000096','C-46100r2_chk','Check if system is configured to use the reverse-path filter for IPv4 network traffic on all interfaces enabled

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000184','C-46101r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "chmod" system call, run the following command:

$ sudo grep -w "chmod" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If the system is not configured to audit permission changes, this is a finding. ','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000185','C-46103r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000186','C-46105r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000099','C-46106r3_chk','Check if IPv6 module is enabled or not using the following command :

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000187','C-46108r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000188','C-46110r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000189','C-46112r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000190','C-46114r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000191','C-46115r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000192','C-46116r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000193','C-46117r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000194','C-46119r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000195','C-46121r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000196','C-46123r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000197','C-46124r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To verify that the audit system collects unauthorized file accesses, run the following commands: 

 grep EACCES /etc/audit/audit.rules



 grep EPERM /etc/audit/audit.rules


If either command lacks output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38569','SV-50370r1_rule','default','low','The system must require passwords to contain at least one uppercase alphabetic character.','Requiring a minimum number of uppercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43517r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "ucredit=" parameter controls requirements for usage of uppercase letters in a password. When set to a negative number, any password will be required to contain that many uppercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each uppercase character. 
Add "ucredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of an uppercase character in a password.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000057','C-46127r1_chk','To check how many uppercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "ucredit" parameter (as a negative number) will indicate how many uppercase characters are required. The requirement is at least one uppercase character in a password. This would appear as "ucredit=-1". 
If ucredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38570','SV-50371r1_rule','default','low','The system must require passwords to contain at least one special character.','Requiring a minimum number of special characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43518r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "ocredit=" parameter controls requirements for usage of special (or "other") characters in a password. When set to a negative number, any password will be required to contain that many special characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each special character.  
Add "ocredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a special character in passwords.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000058','C-46128r1_chk','To check how many special characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "ocredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one special character in a password. This would appear as "ocredit=-1". 
If ocredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38571','SV-50372r1_rule','default','low','The system must require passwords to contain at least one lowercase alphabetic character.','Requiring a minimum number of lowercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43519r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:
$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "lcredit=" parameter controls requirements for usage of lowercase letters in a password. When set to a negative number, any password will be required to contain that many lowercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each lowercase character. 
Add "lcredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a lowercase character in password.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000059','C-46129r1_chk','To check how many lowercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "lcredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one lowercase character in a password. This would appear as "lcredit=-1". 
If lcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38572','SV-50373r1_rule','default','low','The system must require at least four characters be changed between the old and new passwords during a password change.','Requiring a minimum number of different characters during password changes ensures that newly changed passwords should not resemble previously compromised ones. Note that passwords which are changed on compromised systems will still be compromised, however.','F-43520r1_fix','
The pam_cracklib module"s "difok" parameter controls requirements for usage of different characters during a password change. Add "difok=[]" after pam_cracklib. So to require differing characters when changing passwords, substituting [NUM] appropriately. The requirement is greater or equal to 4.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000060','C-46130r1_chk','To check how many characters must differ during a password change, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "difok" parameter will indicate how many characters must differ. The requirement is greater or equal to four characters differ during a password change. This would appear as "difok=4". 
If difok is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38574','SV-50375r2_rule','default','medium','The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (common-password).','Using a stronger hashing algorithm makes password cracking attacks more difficult.','F-43522r2_fix','In "/etc/pam.d/common-password", among potentially other files, the "password" section of the files control which PAM modules execute during a password change. Set the "pam_unix.so" module in the "password" section to include the argument "sha512", as shown below: 

password    [] pam_unix.so obscure use_authtok try_first_pass sha512

This will help ensure when local users change their passwords, hashes for the new passwords will be generated using the SHA-512 algorithm. This is the default.

Note that any updates made to "/etc/pam.d/common-password" will be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000062','C-46132r3_chk','Inspect the "password" section of "/etc/pam.d/common-password", and other files in "/etc/pam.d" and ensure that the "pam_unix.so" module includes the argument "sha512".

$ grep -w password /etc/pam.d/common-password | grep -w pam_unix.so | grep -v "^"

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38575','SV-50376r4_rule','default','low','The audit system must be configured to audit user deletions of files and programs.','Auditing file deletions will create an audit trail for files that are removed from the system. The audit trail could aid in system troubleshooting, as well as detecting malicious processes that attempt to delete log files to conceal their presence.','F-43523r4_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file deletion events for all users and root. Add the following (or equivalent) to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 

-a always,exit -F arch=ARCH -S rmdir -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete
-a always,exit -F arch=ARCH -S rmdir -S unlink -S unlinkat -S rename -S renameat -F auid=0 -k delete

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000200','C-46133r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

ENCRYPT_METHOD SHA512' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000063','C-46134r1_chk','Inspect "/etc/login.defs" and ensure the following line appears: 

 grep "ENCRYPT_METHOD SHA512" /etc/login.defs | grep -v "^"

ENCRYPT_METHOD SHA512

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38580','SV-50381r2_rule','default','medium','The audit system must be configured to audit the loading and unloading of dynamic kernel modules.','The addition/removal of kernel modules can be used to alter the behavior of the kernel and potentially introduce malicious code into kernel space. It is important to have an audit trail of modules that have been introduced into the kernel.','F-43528r2_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

Add the following to "/etc/audit/audit.rules" in order to capture kernel module loading and unloading events, setting ARCH to either b32 or b64 as appropriate for your system: 

-w /sbin/insmod -p x -k modules
-w /sbin/rmmod -p x -k modules
-w /sbin/modprobe -p x -k modules
-a always,exit -F arch=[] -S init_module -S delete_module -k modules

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000202','C-46138r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
 service xinetd stop' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000203','C-46140r2_chk','If network services are using the xinetd service, this is not applicable.

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
select add_rule_data ('default','V-38585','SV-50386r2_rule','default','medium','The system boot loader must require authentication.','Password protection on the boot loader configuration ensures users with physical access cannot trivially alter important bootloader settings. These include which kernel to use, and whether to enter single-user mode.','F-43533r1_fix','Create an encrypted password with grub-md5-crypt:Create an encrypted password with grub-md5-crypt:

Add this script to header file or any custom file under "/etc/grub.d" directory.

cat <EOF
set superusers="< username >" 
password_pbkdf2 < username > < encrypted-password >
EOF

Update the grub file.

 update-grub

Add the –unrestricted option to CLASS in /etc/grub.d/10_linux file.  This will unrestrict the users from boot the system.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000068','C-46143r2_chk','To verify the boot loader password has been set and encrypted, run the following commands:

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
 update-grub' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000069','C-46145r1_chk','To verify the single-user mode authentication is disabled, check "init=/bin/bash", "init=/bin/sh" parameters existancy inkernel parameter line in grub file.

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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000211','C-46147r3_chk','To check that the "telnet" service is disabled, follow the folllowing step:
Check the telnet configuration file:
$ grep -w /usr/sbin/in.telnetd /etc/xinetd.d/*

Check for "disable = yes" in configuration file.

If the "disable = no", this is a finding.

If the telnet is configured using inetd service the check for the telnet configuration line inside file /etc/inetd.conf

$ grep "in.telnetd" /etc/inetd.conf | grep -v ""

If there is output, this is a finding.
    ','Customized rule by Cloud Raxak') from dual;
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

$ service ssh restart' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000073','C-46150r1_chk','To check if the system login banner is compliant, run the following command: 

$ cat /etc/issue

If it does not display the required banner, this is a finding

To check the parameter "Banner /etc/issue" in /etc/ssh/sshd_config.

$ grep -wi Banner /etc/ssh/sshd_config | grep -v "^"

If the parameter "Banner /etc/issue" not found in /etc/ssh/sshd_config this is finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38595','SV-50396r2_rule','default','medium','The system must be configured to require the use of a CAC, PIV compliant hardware token, or Alternate Logon Token (ALT) for authentication.','Smart card login provides two-factor authentication stronger than that provided by a username/password combination. Smart cards leverage a PKI (public key infrastructure) in order to provide and verify credentials.','F-43544r2_fix','To enable smart card authentication, consult Ubuntu documentation.

For guidance on enabling SSH to authenticate against a Common Access Card (CAC), consult Ubuntu documentation.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000349','C-46154r1_chk','Interview the SA to determine if all accounts not exempted by policy are using CAC authentication. For DoD systems, the following systems and accounts are exempt from using smart card (CAC) authentication: 

SIPRNET systems
Standalone systems
Application accounts
Temporary employee accounts, such as students or interns, who cannot easily receive a CAC or PIV
Operational tactical locations that are not collocated with RAPIDS workstations to issue CAC or ALT
Test systems, such as those with an Interim Approval to Test (IATT) and use a separate VPN, firewall, or security measure preventing access to network and system components from outside the protection boundary documented in the IATT.



If non-exempt accounts are not using CAC authentication, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38596','SV-50397r2_rule','default','medium','The system must implement virtual address space randomization.','Address space layout randomization (ASLR) makes it more difficult for an attacker to predict the location of attack code he or she has introduced into a process"s address space during an attempt at exploitation. Additionally, ASLR also makes it more difficult for an attacker to know the location of existing code in order to repurpose it using return oriented programming (ROP) techniques.','F-43543r1_fix','To set the runtime status of the "kernel.randomize_va_space" kernel parameter, run the following command: 

 sysctl -w kernel.randomize_va_space=2

To make this configuration persistent, add the following line to "/etc/sysctl.conf": 

kernel.randomize_va_space = 2

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000078','C-46153r2_chk','Check if the system is configured to implement virtual address space randomization, by querying the following command:

 sysctl kernel.randomize_va_space

If the output of the command is not "2", this is a finding.

verify the value of kernel.randomize_va_space  in "/etc/sysctl.conf".

If kernel.randomize_va_space is not set to "2" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38597','SV-50398r2_rule','default','medium','The system must limit the ability of processes to have simultaneous write and execute access to memory.','ExecShield uses the segmentation feature on all x86 systems to prevent execution in memory higher than a certain address. It writes an address as a limit in the code segment descriptor, to control where code can be executed, on a per-process basis. When the kernel places a process"s memory regions such as the stack and heap higher than this address, the hardware prevents execution in that address range.','F-43545r1_fix','This rule is not applicable.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000079','C-46155r3_chk','This rule is not applicable.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38599','SV-50400r2_rule','default','medium','The FTPS/FTP service on the system must be configured with the Department of Defense (DoD) login banner.','This setting will cause the system greeting banner to be used for FTP connections as well.','F-43564r3_fix','Edit the vsftpd configuration file, which resides at "/etc/vsftpd.conf" by default. Add or correct the following configuration options. 

banner_file=/etc/issue

If it"s configured with "ftpd_banner" line set the line as fallows.

ftpd_banner="custom banner text"

Restart the vsftpd daemon.

 service vsftpd restart' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000348','C-46174r1_chk','If vstfpd service is not installed on the system, this rule is not applicable.
To verify this configuration, run the following command: 

 grep -w banner_file /etc/vsftpd.conf | grep -v "^"

and 

 grep -w ftpd_banner /etc/vsftpd.conf | grep -v "^"

The output should show the value of "banner_file" is set to either custom banner text file or it is configured with ftpd_banner  an example of which is shown below.  

banner_file=/etc/issue

or 

ftpd_banner="custom banner text"

If it does not, this is a finding.

    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38601','SV-50402r2_rule','default','medium','The system must not send ICMPv4 redirects from any interface.','Sending ICMP redirects permits the system to instruct other systems to update their routing information. The ability to send ICMP redirects is only appropriate for systems acting as routers.','F-43548r1_fix','To set the runtime status of the "net.ipv4.conf.all.send_redirects" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.all.send_redirects=0

To make the changes persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.send_redirects = 0

and run following command

 sysctl -p

or restart sysctl.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000081','C-46159r2_chk','Check if system sends ICMPv4 redirects from any interface, by querying the following command:

 sysctl net.ipv4.conf.all.send_redirects

If the output of the command is not "0" on any interface, this is a finding.

Verify the value of net.ipv4.conf.all.send_redirects in "/etc/sysctl.conf".

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38607','SV-50408r1_rule','default','high','The SSH daemon must be configured to use only the SSHv2 protocol.','SSH protocol version 1 suffers from design flaws that result in security vulnerabilities and should not be used.','F-43555r1_fix','Only SSH protocol version 2 connections should be permitted. The default setting in "/etc/ssh/sshd_config" is correct, and can be verified by ensuring that the following line appears: 

Protocol 2

Restart ssh service to get changes in effect:

$ service ssh restart
' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000227','C-46165r1_chk','To check which SSH protocol version is allowed, run the following command: 

 grep -iw Protocol /etc/ssh/sshd_config  | grep -v "^"

If configured properly, output should be:

Protocol 2

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38613','SV-50414r1_rule','default','medium','The system must not permit root logins using remote access programs such as ssh.','Permitting direct root login reduces auditable information about who ran privileged commands on the system and also allows direct attack attempts on root"s password.','F-43561r1_fix','The root user should never be allowed to log into a system directly over a network. To disable root login via SSH, add or correct the following line in "/etc/ssh/sshd_config": 

PermitRootLogin no
Then, Restart the ssh service:

$ service ssh restart

In Case if "PermitRootLogin no" already exist and no valid user exist. Then in recommended fix create a valid user with below condition:
1. User account must not be expired.
2. User account should be unlocked.
3. User account must have sudo privileges.
4. User account password  must be set or RSA key­pairs should be configured.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000237','C-46171r1_chk','To determine how the SSH daemon"s "PermitRootLogin" option is set, run the following command: 
 grep -iw PermitRootLogin /etc/ssh/sshd_config  | grep -v "^"

If a line indicating "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38615','SV-50416r1_rule','default','medium','The SSH daemon must be configured with the Department of Defense (DoD) login banner.','The warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers. Alternatively, systems whose ownership should not be obvious should ensure usage of a banner that does not provide easy attribution.','F-43563r1_fix','To enable the warning banner and ensure it is consistent across the system, add or correct the following line in "/etc/ssh/sshd_config": 

Banner /etc/issue

Restart ssh service to get changes in effect:

 service ssh restart

Another section contains information on how to create an appropriate system-wide warning banner.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000240','C-46173r1_chk','To determine how the SSH daemon"s "Banner" option is set, run the following command: 

 grep -iw Banner /etc/ssh/sshd_config | grep -v "^"

If a line indicating /etc/issue is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38616','SV-50417r1_rule','default','low','The SSH daemon must not permit user environment settings.','SSH environment options potentially allow users to bypass access restriction in some configurations.','F-43565r1_fix','To ensure users are not able to present environment options to the SSH daemon, add or correct the following line in "/etc/ssh/sshd_config": 

PermitUserEnvironment no

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000241','C-46175r1_chk','To ensure users are not able to present environment daemons, run the following command: 

 grep -iw PermitUserEnvironment /etc/ssh/sshd_config | grep -v "^"
 
If properly configured, output should be: 

PermitUserEnvironment no


If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38617','SV-50418r1_rule','default','medium','The SSH daemon must be configured to use only FIPS 140-2 approved ciphers.','Approved algorithms should impart some level of confidence in their implementation. These are also required for compliance.','F-43566r1_fix','Limit the ciphers to those algorithms which are FIPS-approved. Counter (CTR) mode is also preferred over cipher-block chaining (CBC) mode. The following line in "/etc/ssh/sshd_config" demonstrates use of FIPS-approved ciphers: 

Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc

The man page "sshd_config(5)" contains a list of supported ciphers.

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000243','C-46176r1_chk','Only FIPS-approved ciphers should be used. To verify that only FIPS-approved ciphers are in use, run the following command: 

 grep -iw Ciphers /etc/ssh/sshd_config | grep -v "^"

The output should contain only those ciphers which are FIPS-approved, namely, the AES and 3DES ciphers. 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38619','SV-50420r2_rule','default','medium','There must be no .netrc files on the system.','Unencrypted passwords for remote FTP servers may be stored in ".netrc" files. DoD policy requires passwords be encrypted in storage and not used in access scripts.','F-43569r2_fix','The ".netrc" files contain logon information used to auto-logon into FTP servers and reside in the user"s home directory. These files may contain unencrypted passwords to remote FTP servers making them susceptible to access by unauthorized users and should not be used. Any ".netrc" files should be removed.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000347','C-46179r3_chk','To check the system for the existence of any ".netrc" files, run the following command: 

$ find /root /home -iname ".netrc" -type f

If any .netrc files exist, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38621','SV-50422r1_rule','default','medium','The system clock must be synchronized to an authoritative DoD time source.','Synchronizing with an NTP server makes it possible to collate system logs from multiple sources or correlate computer events with real time events. Using a trusted NTP server provided by your organization is recommended.','F-43570r1_fix','To specify a remote NTP server for time synchronization, edit the file "/etc/ntp.conf". Add or correct the following lines, substituting the IP or hostname of a remote NTP server for ntpserver. 

server []

This instructs the NTP software to contact that remote server to obtain time data.

Restart NTP service to get changes in effect by using the command:

$ service ntp restart' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000248','C-46180r1_chk','To verify the "ntpd" package is installed on the system, run the following command: 

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
$ sysv-rc-conf --level 0123456S ntp on' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000247','C-46178r1_chk','To verify the "ntpd" package is installed on the system, run the following command: 

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
select add_rule_data ('default','V-38624','SV-50425r1_rule','default','low','System logs must be rotated daily.','Log files that are not properly rotated run the risk of growing so large that they fill up the /var/log partition. Valuable logging information could be lost if the /var/log partition becomes full.','F-43573r1_fix','
If the "logrotate" service is not installed, install it by running.

 apt-get install logrotate

Add the following text to the top of the configuration file /etc/logrotate.conf :

daily

To Schedule a cron job in /etc/crontab :

Make sure logrotate script is present in /etc/cron.daily directory.

 ls -l /etc/cron.daily/logrotate

Schedule the job as below:

25 6 * * * root run-parts --report /etc/cron.daily

OR you can schedule it in /etc/anacrontab

To schedule a cron job in /etc/anacrontab :

1        5        cron.daily        run-parts --report /etc/cron.daily' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000138','C-46183r1_chk','Run the following commands to determine the current status of the "logrotate" configuration.

Make sure logrotate configuration file is configured to rotate logs daily.

 grep daily /etc/logrotate.conf

The string "daily" must be at the top of the configuration file /etc/logrotate.conf.

Check whether a cron job is scheduled in /etc/crontab or /etc/anacrontab which rotates logs daily. Make sure it is scheduled for daily execution.

 grep /etc/cron.daily /etc/crontab
 grep /etc/cron.daily /etc/anacrontab

If the logrotate service is not run on a daily basis by cron in crontab or anacrontab, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38625','SV-50426r1_rule','default','medium','If the system is using LDAP for authentication or account information, the system must use a TLS connection using FIPS 140-2 approved cryptographic algorithms.','The ssl directive specifies whether to use ssl or not. If not specified it will default to "no". It should be set to "start_tls" rather than doing LDAP over SSL.','F-43574r1_fix','Transport Layer Security (TLS) is the standard name for the Secure Socket Layer (SSL).

StartTLS is the name of the standard LDAP operation for initiating TLS/SSL. TLS/SSL is initiated upon successful completion of this LDAP operation. No alternative port is necessary. It is sometimes referred to as the TLS upgrade operation, as it upgrades a normal LDAP connection to one protected by TLS/SSL.

Contact LDAP administrator and configure LDAP over TLS/SSL.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000252','C-46184r1_chk','If the system does not use LDAP for authentication or account information, this is not applicable.

To ensure LDAP is configured to use TLS for all transactions, run the following command:

$ ldapsearch -x -ZZ

If it return error message, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38626','SV-50427r1_rule','default','medium','The LDAP client must use a TLS connection using trust certificates signed by the site CA.','The tls_cacertdir or tls_cacertfile directives are required when tls_checkpeer is configured (which is the default for openldap versions 2.1 and up). These directives define the path to the trust certificates signed by the site CA.','F-43575r1_fix','Ensure a copy of the site"s CA certificate has been placed in the file "/etc/pki/tls/CA/cacert.pem". Configure LDAP to enforce TLS use and to trust certificates signed by the site"s CA. First, edit the file "/etc/ldap/ldap.conf", and add or correct either of the following lines:

tls_cacertdir /etc/pki/tls/CA

or

tls_cacertfile /etc/pki/tls/CA/cacert.pem

Then review the LDAP server and ensure TLS has been configured.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000253','C-46185r1_chk','If the system does not use LDAP for authentication or account information, this is not applicable.

To ensure TLS is configured with trust certificates, run the following command:

$ ldapsearch -x -ZZ

If it return error message, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38628','SV-50429r2_rule','default','medium','The operating system must produce audit records containing sufficient information to establish the identity of any user/subject associated with the event.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43576r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start
 sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000145','C-46186r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

 * auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38630','SV-50431r3_rule','default','medium','The graphical desktop environment must automatically lock after 15 minutes of inactivity and the system must require user reauthentication to unlock the environment.','Enabling idle activation of the screen saver ensures the screensaver will be activated after the idle delay. Applications requiring continuous, real-time screen display (such as network management products) require the login session does not have administrator rights and the display station is located in a controlled-access area.','F-43579r1_fix','Run the following command to activate the screensaver in the GNOME desktop after a period of inactivity: 
set the screensaver active for root or loggin user:
 dbus-launch gsettings set org.gnome.desktop.screensaver idle-activation-enabled "true"

set the screensaver active for global users:
 sudo -u username -H dbus-launch gsettings set org.gnome.desktop.screensaver idle-activation-enabled "true"
' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000258','C-46189r3_chk','If the system is NON-GUI based system, this is not applicable.

To check the screensaver mandatory use status for root or login user, run the following command: 

$ gsettings get org.gnome.desktop.screensaver idle-activation-enabled

To check the screensaver mandatory use status for global users, run the following command: 

$ sudo -u username -H gsettings get org.gnome.desktop.screensaver idle-activation-enabled

If properly configured, the output should be "true".

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38631','SV-50432r2_rule','default','medium','The operating system must employ automated mechanisms to facilitate the monitoring and control of remote access methods.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43580r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start

 sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000148','C-46190r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

* auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38632','SV-50433r2_rule','default','medium','The operating system must produce audit records containing sufficient information to establish what type of events occurred.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43581r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start

sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000154','C-46191r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

* auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
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

$ service auditd reload' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000005','C-46025r3_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to email the administrator when disk space is starting to run low: 

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

$ service auditd reload' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000510','C-46023r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when the audit storage volume is full:

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

$ service auditd reload' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000511','C-46020r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when disk errors occur:

 grep -wi disk_error_action /etc/audit/auditd.conf | grep -v "^"
disk_error_action = []

If the system is configured to except "syslog" or "exec" when disk errors occur, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38645','SV-50446r1_rule','default','low','The system default umask in /etc/login.defs must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43594r1_fix','To ensure the default umask controlled by "/etc/login.defs" is set properly, add or correct the "umask" setting in "/etc/login.defs" to read as follows: 

UMASK 077' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000345','C-46205r1_chk','Verify the "umask" setting is configured correctly in the "/etc/login.defs" file by running the following command:

 grep -v "^\s*" /etc/login.defs | grep -w UMASK

All output must show the value of "umask" set to 077, as shown in the below:

UMASK 077

If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38647','SV-50448r1_rule','default','low','The system default umask in /etc/profile must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43596r1_fix','To ensure the default umask controlled by "/etc/profile" is set properly, add or correct the "umask" setting in "/etc/profile" to read as follows: 

umask 077' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000344','C-46207r1_chk','Verify the "umask" setting is configured correctly in the "/etc/profile" file by running the following command:

 grep "umask" /etc/profile

All output must show the value of "umask" set to 077, as shown in the below:

 grep "umask" /etc/profile
umask 077

If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38653','SV-50454r1_rule','default','high','The snmpd service must not use a default password.','Presence of the default SNMP password enables querying of different system aspects and could result in unauthorized knowledge of the system.','F-43602r1_fix','Edit "/etc/snmp/snmpd.conf", remove default community string "public". Upon doing that, restart the SNMP service: 

 service snmpd restart' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000341','C-46213r1_chk','To ensure the default password is not set, run the following command: 

 grep -v "^" /etc/snmp/snmpd.conf| grep public

There should be no output. 
If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38654','SV-50455r2_rule','default','medium','Remote file systems must be mounted with the nosuid option.','NFS mounts should not present suid binaries to users. Only vendor-supplied suid executables should be installed to their default location on the local filesystem.','F-43603r1_fix','Add the "nosuid" option to the mount option column of "/etc/fstab" for the line which controls mounting of any NFS mounts.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000270','C-46214r3_chk','To verify the "nosuid" option is configured for all NFS mounts, run the following command: 

$ egrep -w "nfs[]?" /etc/fstab | grep -v "^"

All NFS mounts should have the "nosuid" option in option column.
If any one of mount points does not have "nosuid" option, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38658','SV-50459r1_rule','default','medium','The system must prohibit the reuse of passwords within twenty-four iterations.','Preventing reuse of previous passwords helps ensure that a compromised password is not reused by a user.','F-43608r1_fix','Do not allow users to reuse recent passwords. This can be accomplished by using the "remember" option for the "pam_unix" PAM module. In the file "/etc/pam.d/common-password", append "remember=24" to the line which refers to the "pam_unix.so" module, as shown: 

password sufficient pam_unix.so [] remember=24

The requirement is 24 passwords.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000274','C-46219r1_chk','To verify the password reuse setting is compliant, run the following command: 

$ grep -w remember /etc/pam.d/common-password | grep -w password | grep -v "^"

The output should show the following at the end of the line: 

remember=24


If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38662','SV-50463r1_rule','default','low','The operating system must employ cryptographic mechanisms to prevent unauthorized disclosure of data at rest unless otherwise protected by alternative physical measures.','The risk of a system"s physical compromise, particularly mobile systems such as laptops, places its data at risk of compromise. Encrypting this data mitigates the risk of its loss if the system is lost.','F-43611r1_fix','Ubuntu supports partition encryption through the Linux Unified Key Setup-on-disk-format(LUKS) technology. The easiest way to encrypt a partition is during installation time. 

For manual installations, select the "Encrypt" checkbox during partition creation to encrypt the partition. When this option is selected the system will prompt for a passphrase to use in decrypting the partition. The passphrase will subsequently need to be entered manually every time the system boots. 

For automated/unattended installations, it is possible to use Kickstart by adding the "--encrypted" and "--passphrase=" options to the definition of each partition to be encrypted. For example, the following line would encrypt the root partition: 

part / --fstype=ext3 --size=100 --onpart=hda1 --encrypted --passphrase=[]

Any [PASSPHRASE] is stored in the Kickstart in plaintext, and the Kickstart must then be protected accordingly. Omitting the "--passphrase=" option from the partition definition will cause the installer to pause and interactively ask for the passphrase during installation. 

Consult the Ubuntu documetation for detailed information on encrypting partitions using LUKS.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000277','C-46222r1_chk','Determine if encryption must be used to protect data on the system. 
If encryption must be used and is not employed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38666','SV-50467r2_rule','default','high','The system must use and update a DoD-approved virus scan program.','Virus scanning software can be used to detect if a system has been compromised by computer viruses, as well as to limit their spread to other systems.','F-43615r2_fix','Install virus scanning software, which uses signatures to search for the presence of viruses on the filesystem. 

The McAfee VirusScan Enterprise for Linux virus scanning tool is provided for systems. Ensure virus definition files are no older than 7 days, or their last release. 

Configure the virus scanning software to perform scans dynamically on all accessed files. If this is not possible, configure the system to scan all altered files on the system on a daily basis. If the system processes inbound SMTP mail, configure the virus scanner to scan all received mail. ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000284','C-46226r2_chk','Check if "McAfeeVSEForLinux" is installed on the system,
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

$ aideinit ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000285','C-46227r1_chk','Inspect the system to determine if intrusion detection software has been installed. Verify the intrusion detection software is active by using apparmor or aide tools.

If no host-based intrusion detection tools are installed, this is a finding.

Check apparmor status on the system by using the command:

$ apparmor_status

If apparmor is not mounted, apparmor is not active on the system.

Check aide package on the system using the command:

$ dpkg -s aide

Output should be "aide is running...". If not, this is a finding.

Check aide database as per aide configuration file.
If aide database does not exist on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38675','SV-50476r2_rule','default','low','Process core dumps must be disabled unless needed.','A core dump includes a memory image taken at the time the operating system terminates an application. The memory image could contain sensitive data and is generally useful only for developers trying to debug problems.','F-43624r1_fix','To disable core dumps for all users, add the following line to "/etc/security/limits.conf": 

* hard core 0' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000308','C-46235r2_chk','To verify that core dumps are disabled for all users, run the following command:

 grep -w core /etc/security/limits.conf /etc/security/limits.d/*.conf --no-messages | grep -v ":\s*"

The output should be:

* hard core 0

If it is not, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38679','SV-50480r2_rule','default','medium','The DHCP client must be disabled if not needed.','DHCP relies on trusting the local network. If the local network is not trusted, then it should not be used. However, the automatic configuration provided by DHCP is commonly used and the alternative, manual configuration, presents an unacceptable burden in many circumstances.','F-43628r2_fix','For each interface [] on the system (e.g. eth0), edit "/etc/network/interfaces" and make the following changes.
auto devicename

iface devicename inet static

Add or correct the following lines, substituting the appropriate values based on your site"s addressing scheme:

netmask=[local LAN netmask]

address=[assigned IP address]

gateway=[local LAN default gateway]' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000292','C-46242r2_chk','To verify that DHCP is not being used, examine the following file for each interface.
 /etc/network/interfaces
If there is any entry in interfaces file without a associated "iface"  with device, this is a finding.
Check the following:

auto devicename

iface devicename inet dhcp

Also verify the following, substituting the appropriate values based on your site"s addressing scheme:

netmask=[]

address=[assigned IP address]

gateway=[local LAN default gateway]

If it does not, this is a finding.

','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38681','SV-50482r2_rule','default','low','All GIDs referenced in /etc/passwd must be defined in /etc/group','Inconsistency in GIDs between /etc/passwd and /etc/group could lead to a user having unintended rights.','F-43630r1_fix','Add a group to the system for each GID referenced without a corresponding group.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000294','C-46243r2_chk','To ensure all GIDs referenced in /etc/passwd are defined in /etc/group, run the following command: 

 pwck -r | grep "no group"

There should be no output. 
If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38682','SV-50483r3_rule','default','medium','The Bluetooth kernel module must be disabled.','If Bluetooth functionality must be disabled, preventing the kernel from loading the kernel module provides an additional safeguard against its activation.','F-43631r3_fix','The kernel"s module loading system can be configured to prevent loading of the Bluetooth module. Add the following to the appropriate "/etc/modprobe.d" configuration file to prevent the loading of the Bluetooth module:(Note: File should have .conf extension.) 

$ install bluetooth /bin/true
$ install net-pf-31 /bin/true

To disable the bluetooth and net-pf-31 module run following command:

$ modprobe -r bluetooth
$ modprobe -r net-pf-31
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000315','C-46244r3_chk','If the system is configured to prevent the loading of the "bluetooth" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr bluetooth /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If the system is configured to prevent the loading of the "net-pf-31" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr net-pf-31 /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38683','SV-50484r1_rule','default','low','All accounts on the system must have unique user or account names','Unique usernames allow for accountability on the system.','F-43632r1_fix','Change usernames, or delete accounts, so each has a unique name.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000296','C-46245r1_chk','Run the following command to check for duplicate account names: 

 pwck -rq

If there are no duplicate names, no line will be returned. 
If a line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38684','SV-50485r2_rule','default','low','The system must limit users to 10 simultaneous system logins, or a site-defined number, in accordance with operational requirements.','Limiting simultaneous user logins can insulate the system from denial of service problems caused by excessive logins. Automated login processes operating improperly or maliciously may result in an exceptional number of simultaneous login sessions.','F-43633r1_fix','Limiting the number of allowed users and sessions per user can limit risks related to denial of service attacks. This addresses concurrent sessions for a single account and does not address concurrent sessions by a single user via multiple accounts. To set the number of concurrent sessions per user add the following line in "/etc/security/limits.conf": 

* hard maxlogins 10

A documented site-defined number may be substituted for 10 in the above.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000319','C-46246r2_chk','Run the following command to ensure the "maxlogins" value is configured for all users on the system:

$ grep -w maxlogins /etc/security/limits.conf /etc/security/limits.d/*.conf --no-messages | grep -v ":\s*"

You should receive output similar to the following:

* hard maxlogins 10

If it is not similar, this is a finding. ','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000320','C-46248r1_chk','Check if IPv6 module is enabled or not using the following command :

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
select add_rule_data ('default','V-38688','SV-50489r3_rule','default','medium','A login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.','An appropriate warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers.','F-43637r2_fix','To enable displaying a login warning banner in the GNOME Display Manager"s login screen, run the following command: 

 sudo -u gdm -H dbus-launch gsettings set org.gnome.login-screen banner-message-enable true

To display a banner, this setting must be enabled and then banner text must also be set.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000324','C-46250r3_chk','If the system is NON-GUI based system, this is not applicable.

To ensure a login warning banner is enabled, run the following:

 sudo -u gdm -H gsettings get org.gnome.login-screen banner-message-enable

Search for the "banner_message_enable" schema. If properly configured, the "default" value should be "true".

If it is not, this is a finding','Customized rule by Cloud Raxak') from dual;
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

"I"ve read AND consent to terms in IS user agreem"t."' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000326','C-46252r3_chk','If the system is NON-GUI based system, this is not applicable.

To ensure login warning banner text is properly set, run the following: 

If the display manager is "lightdm", check the banner text settings under "/etc/lightdm/lightdm.conf" file.

[]

greeter-setup-script=/usr/bin/zenity --info –text < banner text >

If this configuration is not existed, this finding.

If the display manger is "gdm" run the following command:

 sudo -u gdm -H gsettings get org.gnome.login-screen banner-message-text

If properly configured, the proper banner text will appear.

If the banner text is not appear in the schema, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38692','SV-50493r1_rule','default','low','Accounts must be locked upon 35 days of inactivity.','Disabling inactive accounts ensures that accounts which may not have been responsibly removed are not available to attackers who may have compromised their credentials.','F-43641r2_fix','To specify the number of days after a password expires (which signifies inactivity) until an account is permanently disabled, add or correct the following lines in "/etc/default/useradd", substituting "[]" appropriately: 

INACTIVE=[NUM_DAYS]

A value of 35 is recommended. If a password is currently on the verge of expiration, then 35 days remain until the account is automatically disabled. However, if the password will not expire for another 60 days, then 95 days could elapse until the account would be automatically disabled. See the "useradd" man page for more information. Determining the inactivity timeout must be done with careful consideration of the length of a "normal" period of inactivity for users in the particular environment. Setting the timeout too low incurs support costs and also has the potential to impact availability of the system to legitimate users.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000334','C-46254r2_chk','To verify the "INACTIVE" setting, run the following command:

$ grep -w "INACTIVE" /etc/default/useradd | grep -v "^\s*"

The output should indicate the "INACTIVE" configuration option is set to an appropriate integer as shown in the example below: 

INACTIVE=35

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38693','SV-50494r2_rule','default','low','The system must require passwords to contain no more than three consecutive repeating characters.','Passwords with excessive repeating characters may be more vulnerable to password-guessing attacks.','F-43642r2_fix','The pam_cracklib module"s "maxrepeat" parameter controls requirements for consecutive repeating characters. When set to a positive number, it will reject passwords which contain more than that number of consecutive characters. Add "maxrepeat=3" after pam_cracklib.so to prevent a run of (3 + 1) or more identical characters. 

password required pam_cracklib.so maxrepeat=3 ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000299','C-46255r1_chk','To check the maximum value for consecutive repeating characters, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

Look for the value of the "maxrepeat" parameter. The requirement is 3.
If maxrepeat is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38695','SV-50496r2_rule','default','medium','A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43644r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000302','C-46257r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep "aide" /etc/crontab /etc/cron./ | grep "/var/lib/aide/aide.conf.autogenerated" | grep -w nice | grep -v ":\s*"

If there is no output or if aide is not run at least weekly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38697','SV-50498r2_rule','default','low','The sticky bit must be set on all public directories.','Failing to set the sticky bit on public directories allows unauthorized users to delete files in the directory structure. 

The only authorized public directories are those temporary directories supplied with the system, or those designed to be temporary file repositories. The setting is normally reserved for directories used by the system, and by users for temporary file storage - such as /tmp - and for directories requiring global read/write access.','F-43646r1_fix','When the so-called "sticky bit" is set on a directory, only the owner of a given file may remove that file from the directory. Without the sticky bit, any user with write access to a directory may remove any file in the directory. Setting the sticky bit prevents users from removing each other"s files. In cases where there is no reason for a directory to be world-writable, a better solution is to remove that permission rather than to set the sticky bit. However, if a directory is used by a particular application, consult that application"s documentation instead of blindly changing modes. 
To set the sticky bit on a world-writable directory [], run the following command: 

 chmod +t [DIR]' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000336','C-46259r4_chk','To find world-writable directories that lack the sticky bit, run the following command for each local partition []: 

 find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \)

If any world-writable directories are missing the sticky bit, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38701','SV-50502r1_rule','default','high','The TFTP daemon must operate in secure mode which provides access only to a single directory on the host file system.','Using the "-s" option causes the TFTP service to only serve files from the given directory. Serving files from an intentionally specified directory reduces the risk of sharing files which should remain private.','F-43650r1_fix','If running the "tftp" service is necessary, it should be configured to change its root directory at startup. To do so, ensure "/etc/xinetd.d/tftp" includes "-s" as a command line argument, as shown in the following example (which is also the default): 

server_args = -s /tftpboot 

Either if tftp is configured with inetd add the "-s" as shown in following example.

tftp     dgram   udp     wait    nobody  /usr/sbin/tcpd  /usr/sbin/in.tftpd  -s  /srv/tftp

or if tftp is configured using tftpd-hpa package then change the TFTP_OPTION parameter inside /etc/default/tftpd-hpa.

TFTP_OPTIONS= -s

Restart the service:

If tftp is configured with xinetd:

$ service xinetd  reload

If tftp is configured with inetd:

$ service   < inetdpackagename >  reload

If tftp is configured with tftpd-hpa:

$ service tftpd-hpa reload
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000338','C-46263r1_chk','Verify "tftp" is configured by inetd super-server daemon with the "-s" option by running the following command:

$ grep -w "^\s*tftp" /etc/inetd.conf | grep -v "^"

If it is configured with inetd and there is no "-s" option in output this is finding.

Verify "tftp" is configured by xinetd super-server daemon with the "-s" option by running the following command: 

 grep -w server_args /etc/xinetd.d/* | grep -v "^"

The output should indicate the "server_args" variable is configured with the "-s" flag, matching the example below:

server_args = -s /tftpboot

If it does not, this is a finding.

Also if tftp is configured using tftpd-hpa then run the following command:

$ grep -w TFTP_OPTIONS /etc/default/tftpd-hpa | grep -v "^"

The output should indicate the "TFTP_OPTIONS" variable is configured with the "-s" flag, matching the example below:

TFTP_OPTIONS= -s

If it does not, this is a finding.

','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38702','SV-50503r1_rule','default','low','The FTP daemon must be configured for logging or verbose mode.','To trace malicious activity facilitated by the FTP service, it must be configured to ensure that all commands sent to the ftp server are logged using the verbose vsftpd log format. The default vsftpd log file is /var/log/vsftpd.log.','F-43651r1_fix','Add or correct the following configuration options within the "vsftpd" configuration file, located at "/etc/vsftpd/vsftpd.conf". 

xferlog_enable=YES
xferlog_std_format=NO
log_ftp_protocol=YES' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000339','C-46264r1_chk','Find if logging is applied to the ftp daemon. 

Procedures: 

If vsftpd is started by xinetd the following command will indicate the xinetd.d startup file. 

 grep vsftpd /etc/xinetd.d/*



 grep server_args []

This will indicate the vsftpd config file used when starting through xinetd. If the [server_args]line is missing or does not include the vsftpd configuration file, then the default config file (/etc/vsftpd.conf) is used. 

 grep xferlog_enable [vsftpd config file]


If xferlog_enable is missing, or is not set to yes, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38445','SV-50245r2_rule','default','medium','Audit log files must be group-owned by root.','If non-privileged users can write to audit logs, audit trails can be modified or destroyed.','F-43390r1_fix','Change the group owner of the audit log files with the following command: 

 chgrp root []' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000522','C-46000r1_chk','Run the following command to check the group owner of the system audit log file(s): 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %G 2>/dev/null

Audit log file(s) must be group-owned by root. 
If they are not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38450','SV-50250r1_rule','default','medium','The /etc/passwd file must be owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43395r1_fix','Run the below command to change the ownership of "/etc/passwd" to root:  

 chown root /etc/passwd' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000039','C-46005r1_chk','To check the ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If its properly configured, the output should be displayed as shown below:

"File "/etc/passwd" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38457','SV-50257r1_rule','default','medium','The /etc/passwd file must have mode 0644 or less permissive.','If the "/etc/passwd" file is writable by a group-owner or the world the risk of its compromise is increased. The file contains the list of accounts on the system and associated information, and protection of this file is critical for system security.','F-43397r1_fix','To properly set the permissions of "/etc/passwd", run the command: 

 chmod 0644 /etc/passwd' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000041','C-46007r1_chk','To check the permissions of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38458','SV-50258r1_rule','default','medium','The /etc/group file must be owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43403r1_fix','Run the below command to change the ownership of "/etc/group" to root:
 
 chown root /etc/group' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000042','C-46013r1_chk','To check the ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If its properly configured, the output should be displayed as shown below:

"File "/etc/group" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38459','SV-50259r1_rule','default','medium','The /etc/group file must be group-owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43404r1_fix','To change the group owner of "/etc/group" to root, run the command: 

 chgrp root /etc/group' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000043','C-46014r1_chk','To check the group ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should be: 

File "/etc/group" is group-owned by root.

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38461','SV-50261r1_rule','default','medium','The /etc/group file must have mode 0644 or less permissive.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43406r1_fix','To properly set the permissions of "/etc/group", run the command: 

 chmod 644 /etc/group' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000044','C-46015r1_chk','To check the permissions of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38465','SV-50265r3_rule','default','medium','Library files must have mode 0755 or less permissive.','Files from shared library directories are loaded into the address space of processes (including privileged ones) or of the kernel itself at runtime. Restrictive permissions are necessary to protect the integrity of the system.','F-43409r2_fix','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64

If any file in these directories is found to be group-writable or world-writable, correct its permission with the following command: 

 chmod go-w []' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000045','C-46019r4_chk','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64


All files in these directories should not be group-writable or world-writable. To find shared libraries that are group-writable or world-writable, run the following command for each directory [] which contains shared libraries: 

$ find -L [DIR] -perm /022 -type f


If any of these files (excluding broken symlinks) are group-writable or world-writable, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38469','SV-50269r3_rule','default','medium','All system command files must have mode 755 or less permissive.','System binaries are executed by privileged users, as well as system services, and restrictive permissions are necessary to ensure execution of these programs cannot be co-opted.','F-43414r1_fix','System executables are stored in the following directories by default: 

/bin
/usr/bin
/usr/local/bin
/sbin
/usr/sbin
/usr/local/sbin

If any file in these directories is found to be group-writable or world-writable, change its permission with the following command: 

 chmod go-w []' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000047','C-46024r3_chk','System executables are stored in the following directories by default: 

/bin
/usr/bin
/usr/local/bin
/sbin
/usr/sbin
/usr/local/sbin

All files in these directories should not be group-writable or world-writable. To find system executables that are group-writable or world-writable, run the following command for each directory [] which contains system executables: 

$ find -L [DIR] -perm /022 -type f

If any system executables are found to be group-writable or world-writable, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38495','SV-50296r1_rule','default','medium','Audit log files must be owned by root.','If non-privileged users can write to audit logs, audit trails can be modified or destroyed.','F-43443r1_fix','Change the owner of the audit log files with the following command: 

 chown root []
If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000384','C-46053r1_chk','Run the following command to check the owner of the system audit logs: 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %U

Audit logs must be owned by root. 
If they are not, this is a finding.
If auditd package is not installed then rule will get fail.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38498','SV-50299r1_rule','default','medium','Audit log files must have mode 0640 or less permissive.','If users can write to audit logs, audit trails can be modified or destroyed.','F-43445r1_fix','Change the mode of the audit log files with the following command: 

 chmod 0640 []
If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000383','C-46055r1_chk','Run the following command to check the mode of the system audit logs: 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %a

Audit logs must be mode 0640 or less permissive. 
If any are more permissive, this is a finding.
If auditd package is not installed then rule will fail.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38502','SV-50303r1_rule','default','medium','The /etc/shadow file must be owned by root.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43449r1_fix','Run the below command to change the ownership of "/etc/shadow" to root:

 chown root /etc/shadow' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000033','C-46059r1_chk','To check the ownership of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/shadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38504','SV-50305r1_rule','default','medium','The /etc/shadow file must have mode 0000.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43451r1_fix','To properly set the permissions of "/etc/shadow", run the command: 

 chmod 0000 /etc/shadow' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000035','C-46061r2_chk','To check the permissions of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38579','SV-50380r1_rule','default','medium','The system boot loader configuration file(s) must be owned by root.','Only root should be able to modify important boot parameters.','F-43527r1_fix','The file "/etc/default/grub" should be owned by the "root" user to prevent destruction or modification of the file. To change the owner of "/etc/default/grub" to root, run the command: 

 chown root /etc/default/grub' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000065','C-46137r1_chk','To check the ownership of "etc/default/grub", run the command:

$ ls -lL /etc/default/grub

If properly configured, the output should be displayed as shown below:

The system boot loader configuration file is owned by root.
 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38581','SV-50382r1_rule','default','medium','The system boot loader configuration file(s) must be group-owned by root.','The "root" group is a highly-privileged group. Furthermore, the group-owner of this file should not have any access privileges anyway.','F-43529r1_fix','The file "/etc/default/grub" should be group-owned by the "root" group to prevent destruction or modification of the file. To change the group owner of "/etc/default/grub" to root, run the command: 

 chgrp root /etc/default/grub' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000066','C-46139r1_chk','To check the group ownership of "/etc/default/grub", run the command:
$ ls -lL /etc/default/grub

If properly configured, the output should be: The system boot loader configuration file is group owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38583','SV-50384r2_rule','default','medium','The system boot loader configuration file(s) must have mode 0600 or less permissive.','Proper permissions ensure that only the root user can modify important boot parameters.','F-43531r2_fix','File permissions for "/boot/grub/grub.cfg" should be set to 600, which is the default. To properly set the permissions of "/boot/grub/grub.cfg", run the command:

 chmod 600 /boot/grub/grub.cfg

Boot partitions based on VFAT, NTFS, or other non-standard configurations may require alternative measures.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000067','C-46141r2_chk','To check the permissions of /boot/grub/grub.cfg, run the command:
$ ls -lL /boot/grub/grub.cfg

If properly configured, the output should indicate the following permissions: "-rw-------"
If it does not, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38699','SV-50500r2_rule','default','low','All public directories must be owned by a system account.','Allowing a user account to own a world-writable directory is undesirable because it allows the owner of that directory to remove or replace any files that may be placed in the directory by other users.','F-43648r1_fix','All directories in local partitions which are world-writable should be owned by root or another system account. If any world-writable directories are not owned by a system account, this should be investigated. Following this, the files should be deleted or assigned to an appropriate group.' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000337','C-46260r3_chk','The following command will discover and print world-writable directories that are not owned by a system account, given the assumption that only system accounts have a uid lower than 500. Run it once for each local partition []: 

 find / -perm -0002 -type d -uid +999  -print 2>>/dev/null

If there is output, this is a finding.

Note:If there is any output it should be owned by root or another system account. Please fix it manually because that file could be some package or service related or any important directory that user want to share. For fixing either it should be deleted or assigned to an appropriate group.
   ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56014','SV-50462r1_rule','default','high','
The /etc/cron.allow file must be user/group owned by root and must have mode 0600.
','
The /etc/cron.allow file are used to restrict access to cron. The root user can always use cron, regardless of the usernames listed in the access control files. Protection of this file is important for system security.
','F-55014','
Change the permission of /etc/cron.allow to 600 and change the user and group ownership to root.

 chmod 600 /etc/cron.allow
 chown root /etc/cron.allow
 chgrp root /etc/cron.allow
' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the ownership, group ownership and permission of "/etc/cron.allow", run the following  command:

 stat --format=%U,%G,%a /etc/cron.allow 

If properly configured, the output should indicate the following permissions. 

User and Group ownership should be root and permission should be 600 or more restrictive.

Otherwise this is finding.

If cron.allow does not exist, users listed in cron.deny are not allowed to use cron.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56064','SV-50462r1_rule','default','high','
The SSH X11 Forwarding must be disabled.
','
SSH X11 forwarding gives the user an ability to graphically run programs on remote machine. If an attacker gets access of machine via SSH, he/she can misuse the graphical console there by making it easy for them to attack a system. This rule verifies that X11Forwarding parameter is set to no.
','F-56064','If SSH X11 Forwarding is enabled edit the file /etc/ssh/sshd_config
X11Forwarding no []

Restart the ssh service:
$ service ssh restart
' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000276','','
To check the whether X11 Forwarding is disabled run:
 grep -iw "X11Forwarding" /etc/ssh/sshd_config | grep -v "^"

The parameter should have the value set to "no", if this is not the case then this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56053','SV-50462r1_rule','default','high','
Service at/cron must be restricted to authorized users.
','
The cron and at services are used to allow commands to be executed at a later time. How do I restrict them to selected users such as root, opt1, opt2 and so on? How do I make sure user php can run php script but cannot modify or install a new job?
The cron service is required by almost all UNIX / Linux / BSD oses to perform necessary maintenance tasks. Both cron and anacron make use of a number of configuration files and directories. Regular users can modify and install their own cron configuration or jobs.
','F-55014','
Add authorized users in both at.allow/cron.allow file to allow use of at/cron service.
' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','RHEL-06-000276','','
To verify authorized users who can use at/cron service run:
 cat /etc/at.allow
 cat /etc/cron.allow

If there is no output, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-56055','SV-50462r1_rule','default','high','
The reserved UIDs must be assigned to system accounts only.
','
If any account has reserved uid, not allowing that account to login.
   ','F-56055','
If any user has reserved uid take necessary action since this improper application of permissions can lead to security risks. Assign a different uid to those particular
accounts other than system accounts to fix this.
   ' , '[debian-based Linux] UNIX DISA - Mission Critical Classified','Profile Customized by CloudRaxak','Ubuntu 14.04','','
Check whether reserved UIDs are assigned to system accounts by comparing the uid"s from the /etc/passwd file with reserved uid"s in /usr/share/base-passwd/passwd.master. This file contains list of reserved UID and GID.
If any reserved uid is assigned to any account other than system account, this is a finding.
','Customized rule by Cloud Raxak') from dual;
