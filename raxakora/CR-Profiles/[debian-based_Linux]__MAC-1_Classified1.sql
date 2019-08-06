select add_profile_data ('[debian-based Linux] DISA - Mission Critical Classified (Subset)' ,'Profile Customized by CloudRaxak' ,'Linux-based OS','' ,'2015-05-26' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-38438','SV-50238r2_rule','default','low','Auditing must be enabled at boot by setting a kernel parameter.','Each process on the system carries an "auditable" flag which indicates whether its activities can be audited. Although "auditd" takes care of enabling this for all processes which launch after it does, adding the kernel argument ensures it is set for every process during boot.','F-43382r2_fix','To ensure all processes can be audited, even those which start prior to the audit daemon, add the argument "audit=1" to the kernel line in "/etc/default/grub", in the manner below:

GRUB_CMDLINE_LINUX="audit=1"

and run the following command to update the grub.

 update-grub


UEFI systems may prepend "/boot" to the "/vmlinuz-version" argument.

If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000525','C-45992r2_chk','Inspect the kernel boot arguments (which follow the word "GRUB_CMDLINE_LINUX") in "/etc/default/grub". If they include "audit=1", then auditing is enabled at boot time. 

If auditing is not enabled at boot time, this is a finding.

If auditd package is not installed then rule will install it before fixing changes.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38669','SV-50470r1_rule','default','low','The postfix service must be enabled for mail delivery.','Local mail delivery is essential to some system maintenance and notification tasks.','F-43618r1_fix','The Postfix mail transfer agent is used for local mail delivery within the system. The default configuration only listens for connections to the default SMTP port (port 25) on the loopback interface (127.0.0.1). It is recommended to leave this service enabled for local mail delivery. The "postfix" service can be enabled with the following command: 

 sysv-rc-conf --level 0123456S postfix on
 service postfix start' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000287','C-46230r1_chk','Run the following command to determine the current status of the "postfix" service:

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
 newaliases' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000521','C-46001r1_chk','Find the list of alias maps used by the Postfix mail server:

 postconf alias_maps

Query the Postfix alias maps for an alias for "root":

 postmap -q root <alias_map>

If there are no aliases configured for root that forward to a monitored email address, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38622','SV-50423r2_rule','default','medium','Mail relaying must be restricted.','This ensures "postfix" accepts mail messages (such as cron job reports) from the local system only, and not from the network, which protects it from network attack.','F-43572r1_fix','Edit the file "/etc/postfix/main.cf" to ensure that only the following "inet_interfaces" line appears: 

inet_interfaces = localhost' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000249','C-46182r2_chk','If the system is an authorized mail relay host, this is not applicable. 

Run the following command to ensure postfix accepts mail messages from only the local system: 

$ grep -w ^inet_interfaces /etc/postfix/main.cf | grep -v "^"

If properly configured, the output should show only "localhost". 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38460','SV-50260r1_rule','default','low','The NFS server must not have the all_squash option enabled.','The "all_squash" option maps all client requests to a single anonymous uid/gid on the NFS server, negating the ability to track file access by user ID.','F-43405r1_fix','Remove any instances of the "all_squash" option from the file "/etc/exports".  Restart the NFS daemon for the changes to take effect.

 service nfs-kernel-server restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000515','C-46016r1_chk','If the NFS server is read-only, in support of unrestricted access to organizational content, this is not applicable.

The related "root_squash" option provides protection against remote administrator-level access to NFS server content.  Its use is not a finding.

To verify the "all_squash" option has been disabled, run the following command:

 grep -w all_squash /etc/exports | grep -v "^"

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38462','SV-50262r1_rule','default','high','The RPM package management tool must cryptographically verify the authenticity of all software packages during installation.','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.','F-43407r1_fix','Pass the --allow-unauthenticated option to apt-get as in:

$ sudo apt-get --allow-unauthenticated upgrade

From the manual page of apt-get:

--allow-unauthenticated
Ignore if packages can"t be authenticated and don"t prompt about it. This is useful for tools like pbuilder. Configuration Item: APT::Get::AllowUnauthenticated.

You can make this setting permanent by using your own config file at /etc/apt/apt.conf.d/ directory. The filename can be 99myown and it may contain this line:

APT::Get::AllowUnauthenticated "true";' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000514','C-46017r1_chk','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering:

$ grep -rwi AllowUnauthenticated /etc/apt/* | grep -v ":\s*"
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38471','SV-50271r1_rule','default','low','The system must forward audit records to the syslog service.','The auditd package does not include the ability to send audit records to a centralized server for management directly.  It does, however, include an audit event multiplexor plugin (audispd) to pass audit records to the local syslog server.','F-43416r1_fix','Set the "active" line in "/etc/audisp/plugins.d/syslog.conf" to "yes". 
Reload the auditd.

$ service auditd reload

If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000509','C-46026r1_chk','Verify the audispd plugin is active:

 grep -wi active /etc/audisp/plugins.d/syslog.conf | grep -v "^"

If the "active" setting is missing or set to "no", this is a finding.

','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38475','SV-50275r1_rule','default','medium','The system must require passwords to contain a minimum of 14 characters.','Requiring a minimum password length makes password cracking attacks more difficult by ensuring a larger search space. However, any security benefit from an onerous requirement must be carefully weighed against usability problems, support costs, or counterproductive behavior that may result.

While it does not negate the password length requirement, it is preferable to migrate from a password-based authentication scheme to a stronger one based on PKI (public key infrastructure).','F-43419r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

To specify password length requirements for new accounts,
edit the file "/etc/pam.d/common-password" and update the minimum password length (minlen) parameter in the below line e.g:

password requisite pam_cracklib.so minlen=14 ucredit=0 lcredit=0 ocredit=0 dcredit=0

INFO: minlen should be >= 14 and the credits limit should be less or equal to 0 for the validation criteria in the rule.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000050','C-46029r1_chk','To check the minimum password length and to check the other settings required for the password authentication, run the command:

$ grep -v "^" /etc/pam.d/common-password | grep -w pam_cracklib.so | grep -w password

If minlen is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38476','SV-50276r3_rule','default','high','Vendor-provided cryptographic certificates must be installed to verify the integrity of system software.','The Red Hat GPG keys are necessary to cryptographically verify packages are from Red Hat. ','F-43421r3_fix','To ensure the system can cryptographically verify base software packages installation. Use the command:
 apt-key update' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000008','C-46031r3_chk','To ensure that the keys are installed, run:

$ apt-key list 

The command should return the list of keys in ubuntu. If the keys are not installed, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38478','SV-50278r2_rule','default','low','The Red Hat Network Service (rhnsd) service must not be running, unless using RHN or an RHN Satellite.','Although systems management and patching is extremely important to system security, management by a system outside the enterprise enclave is not desirable for some environments. However, if the system is being managed by RHN or RHN Satellite Server the "rhnsd" daemon can remain on.','F-43423r2_fix','The Red Hat Network service automatically queries Red Hat Network servers to determine whether there are any actions that should be executed, such as package updates. This only occurs if the system was registered to an RHN server or satellite and managed as such. The "rhnsd" service can be disabled with the following commands: 

 sysv-rc-conf --level 0123456S rhnsd off
 service rhnsd stop' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000009','C-46033r2_chk','Run the following command to verify "rhnsd" is disabled through current runtime configuration: 

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

$ pwunconv; pwconv' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000053','C-46034r1_chk','To check the maximum password age, run the command: 

$ grep PASS_MAX_DAYS /etc/login.defs

The DoD requirement is 60. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38477','SV-50277r1_rule','default','medium','Users must not be able to change passwords more than once every 24 hours.','Setting the minimum password age protects against users cycling back to a favorite password after satisfying the password reuse requirement.','F-43422r1_fix','To specify password minimum age for new accounts, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_MIN_DAYS [DAYS]

A value of 1 day is considered sufficient for many environments. The DoD requirement is 1.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000051','C-46032r1_chk','To check the minimum password age, run the command: 

$ grep PASS_MIN_DAYS /etc/login.defs

The DoD requirement is 1. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38480','SV-50280r1_rule','default','low','Users must be warned 7 days in advance of password expiration.','Setting the password warning age enables users to make the change at a practical time.','F-43425r1_fix','To specify how many days prior to password expiration that a warning will be issued to users, edit the file "/etc/login.defs" and add or correct the following line, replacing [] appropriately: 

PASS_WARN_AGE [DAYS]

The DoD requirement is 7.

Run the following command to bring recent changes made in /etc/login.defs into effect for all existing users also.

$ pwunconv; pwconv' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000054','C-46035r1_chk','To check the password warning age, run the command: 

$ grep PASS_WARN_AGE /etc/login.defs

The DoD requirement is 7. 
If it is not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38482','SV-50282r1_rule','default','low','The system must require passwords to contain at least one numeric character.','Requiring digits makes password guessing attacks more difficult by ensuring a larger search space.','F-43427r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

 apt-get -y install libpam-cracklib

The pam_cracklib module"s "dcredit" parameter controls requirements for usage of digits in a password. When set to a negative number, any password will be required to contain that many digits. When set to a positive number, pam_cracklib will grant +1 additional length credit for each digit. 
Add "dcredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a digit in password.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000056','C-46037r1_chk','To check how many digits are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "dcredit" parameter (as a negative number) will indicate how many digits are required. The requirement is at least one digit in a password. This would appear as "dcredit=-1". 
If dcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38483','SV-50283r1_rule','default','medium','The system package management tool must cryptographically verify the authenticity of system software packages during installation.','Ensuring the validity of packages" cryptographic signatures prior to installation ensures the provenance of the software and protects against malicious tampering.','F-43429r1_fix','Pass the --allow-unauthenticated option to apt-get as in: 

$ sudo apt-get --allow-unauthenticated upgrade

From the manual page of apt-get:

--allow-unauthenticated
Ignore if packages can"t be authenticated and don"t prompt about it. This is useful for tools like pbuilder. Configuration Item: APT::Get::AllowUnauthenticated.

You can make this setting permanent by using your own config file at /etc/apt/apt.conf.d/ directory. The filename can be 99myown and it may contain this line:

APT::Get::AllowUnauthenticated "true";' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000013','C-46039r1_chk','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering: 

$ grep -rwi AllowUnauthenticated /etc/apt/* | grep -v ":\s*"
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38484','SV-50285r2_rule','default','medium','The operating system, upon successful logon, must display to the user the date and time of the last logon or access via ssh.','Users need to be aware of activity that occurs regarding their account. Providing users with information regarding the date and time of their last successful login allows the user to determine if any unauthorized activity has occurred and gives them an opportunity to notify administrators.

At ssh login, a user must be presented with the last successful login date and time.','F-43431r2_fix','Update the "PrintLastLog" keyword to "yes" in /etc/ssh/sshd_config:

PrintLastLog yes

While it is acceptable to remove the keyword entirely since the default action for the SSH daemon is to print the last logon date and time, it is preferred to have the value explicitly documented

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000507','C-46041r2_chk','Verify the value associated with the "PrintLastLog" keyword in /etc/ssh/sshd_config:

 grep -iw PrintLastLog /etc/ssh/sshd_config | grep -v "^"

If the "PrintLastLog" keyword is not present, this is not a finding. If the value is not set to "yes", this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38485','SV-50286r1_rule','default','medium','The operating system, upon successful logon, must display to the user the date and time of the last logon or access via a local console or tty.','Users need to be aware of activity that occurs regarding their accounts. Providing users with information regarding the date and time of their last successful login allows the user to determine if any unauthorized activity has occurred and gives them an opportunity to notify administrators.

At console or tty logon, a user must be presented with the last successful login date and time.  The "hushlogin" file determines whether this occurs.','F-43432r1_fix','Remove any "hushlogin" files from the system:

 rm /etc/hushlogins
 rm ~<userid>/.hushlogin' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000506','C-46042r1_chk','Verify there are no "hushlogin" files active on the system:
 ls -l /etc/hushlogins

For each home directory stored in "/etc/passwd":

 ls ~<userid>/.hushlogin

If there are any "hushlogin" files on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38487','SV-50288r1_rule','default','low','The system package management tool must cryptographically verify the authenticity of all software packages during installation.','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.','F-43433r1_fix','Pass the --allow-unauthenticated option to apt-get as in:

$ sudo apt-get --allow-unauthenticated upgrade

From the manual page of apt-get:

--allow-unauthenticated
Ignore if packages can"t be authenticated and don"t prompt about it. This is useful for tools like pbuilder. Configuration Item: APT::Get::AllowUnauthenticated.

You can make this setting permanent by using your own config file at /etc/apt/apt.conf.d/ directory. The filename can be 99myown and it may contain this line:

APT::Get::AllowUnauthenticated "true"; ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000015','C-46043r1_chk','Ensuring all packages" cryptographic signatures are valid prior to installation ensures the provenance of the software and protects against malicious tampering.:
 
$ grep -rwi AllowUnauthenticated /etc/apt/* | grep -v ":\s*"
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38489','SV-50290r1_rule','default','medium','A file integrity tool aide must be installed.','The AIDE package must be installed if it is to be available for integrity checking.','F-43436r1_fix','Install the aide, aide-common packages with the commands: 

 apt-get -y install aide

 apt-get -y install aide-common' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000016','C-46046r1_chk','Run the following command to determine if the "aide", "aide-common" packages are installed: 

 dpkg -s aide

 dpkg -s aide-common

If the packages are not installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-51391','SV-65601r1_rule','default','medium','A file integrity baseline must be created.','For AIDE to be effective, an initial database of "known-good" information about files must be captured and it should be able to be verified against the installed files. ','F-56189r1_fix','Run the following command to generate a new database:

 /usr/sbin/aide --init

By default, the database will be written to the file "/var/lib/aide/aide.db.new.gz". Storing the database, the configuration file "/etc/aide.conf", and the binary "/usr/sbin/aide" (or hashes of these files), in a secure location (such as on read-only media) provides additional assurance about their integrity. The newly-generated database can be installed as follows:

 cp /var/lib/aide/aide.db.new.gz /var/lib/aide/aide.db.gz

To initiate a manual check, run the following command:

 /usr/sbin/aide --check

If this check produces any unexpected output, investigate. ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000018','C-53727r1_chk','To find the location of the AIDE database file, run the following command:

 grep DBDIR /etc/aide.conf

Using the defined values of the [] and [database] variables, verify the existence of the AIDE database file:

 ls -l [DBDIR]/[database_file_name]

If there is no database file, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38490','SV-50291r4_rule','default','medium','The operating system must enforce requirements for the connection of mobile devices to operating systems.','USB storage devices such as thumb drives can be used to introduce unauthorized software and other vulnerabilities. Support for these devices should be disabled and the devices themselves should be tightly controlled.','F-43437r3_fix','To prevent USB storage devices from being used, configure the kernel module loading system to prevent automatic loading of the USB storage driver. To configure the system to prevent the "usb-storage" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": (Note: File should have .conf extension.)

$ install usb-storage /bin/true

This will prevent the "modprobe" program from loading the "usb-storage" module, but will not prevent an administrator (or another program) from using the "insmod" program to load the module manually.

To disable the usb-storage module run following command:

$ rmmod usb-storage
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000503','C-46047r3_chk','If the system is configured to prevent the loading of the "usb-storage" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated"/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr usb-storage /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38491','SV-50292r1_rule','default','high','There must be no .rhosts or hosts.equiv files on the system.','Trust files are convenient, but when used in conjunction with the R-services, they can allow unauthenticated access to a system.','F-43438r1_fix','The files "/etc/hosts.equiv" and "~/.rhosts" (in each user"s home directory) list remote hosts and users that are trusted by the local system when using the rshd daemon. To remove these files, run the following command to delete them from any location. 

 find /root /home -iname ".rhosts" -type f | xargs rm {} 2>/dev/null
 find /etc -iname "hosts.equiv" -type f | xargs rm {} 2>/dev/null
' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000019','C-46048r1_chk','The existence of the file named "hosts.equiv" or ".rhosts" inside a user home directory indicates the presence of an Rsh trust relationship, use the command:
 find /root /home -iname ".rhosts" -type f
 find /etc -iname "hosts.equiv" -type f

If these files exist, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38492','SV-50293r1_rule','default','medium','The system must prevent the root account from logging in from virtual consoles.','Preventing direct root login to virtual console devices helps ensure accountability for actions taken on the system using the root account. ','F-43439r2_fix','To restrict root logins through the (deprecated) virtual console devices, ensure lines of this form do not appear in "/etc/securetty": 

vc/1
vc/2
vc/3
vc/4

Note:  Virtual console entries are not limited to those listed above.  Any lines starting with "vc/" followed by numerals should be removed.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000027','C-46049r1_chk','To check for virtual console entries which permit root login, run the following command: 

 grep "^vc/[]" /etc/securetty

If any output is returned, then root logins over virtual console devices is permitted. 
If root login over virtual console devices is permitted, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38494','SV-50295r1_rule','default','low','The system must prevent the root account from logging in from serial consoles.','Preventing direct root login to serial port interfaces helps ensure accountability for actions taken on the systems using the root account.','F-43441r1_fix','To restrict root logins on serial ports, ensure lines of this form do not appear in "/etc/securetty": 

ttyS0
ttyS1

Note:  Serial port entries are not limited to those listed above.  Any lines starting with "ttyS" followed by numerals should be removed' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000028','C-46051r1_chk','To check for serial port entries which permit root login, run the following command: 

 grep "^ttyS[]" /etc/securetty

If any output is returned, then root login over serial ports is permitted. 
If root login over serial ports is permitted, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38496','SV-50297r3_rule','default','medium','Default operating system accounts, other than root, must be locked.','Disabling authentication for default system accounts makes it more difficult for attackers to make use of them to compromise a system.','F-43442r2_fix','Some accounts are not associated with a human user of the system, and exist to perform some administrative function. An attacker should not be able to log into these accounts. 

Disable logon access to these accounts with the command: 

 passwd -l []' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000029','C-46052r2_chk','To obtain the system accounts which is unlocked run the following command:

$ passwd -S  < username > | grep -v L 

If get any output this is finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38497','SV-50298r2_rule','default','high','The system must not have accounts configured with blank or null passwords.','If an account has an empty password, anyone could log in and run commands with the privileges of that account. Accounts with empty passwords should never be used in operational environments.','F-43444r4_fix','If an account is configured for password authentication but does not have an assigned password, it may be possible to log onto the account without authentication. Remove any instances of the "nullok" option in "/etc/pam.d/common-auth" to prevent logons with empty passwords.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000030','C-46054r2_chk','To verify that null passwords cannot be used, run the following command: 

 grep -w nullok /etc/pam.d/common-auth | grep -v "^"

If this produces any output, it may be possible to log into accounts with empty passwords. 
If NULL passwords can be used, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38499','SV-50300r1_rule','default','medium','The /etc/passwd file must not contain password hashes.','The hashes for all user account passwords should be stored in the file "/etc/shadow" and never in "/etc/passwd", which is readable by all users.','F-43446r1_fix','If any password hashes are stored in "/etc/passwd" (in the second field, instead of an "x"), the cause of this misconfiguration should be investigated. The account should have its password reset and the hash should be properly stored, or the account should be deleted entirely.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000031','C-46056r1_chk','To check that no password hashes are stored in "/etc/passwd", run the following command: 

 awk -F: "($2 != "x") {print}" /etc/passwd

If it produces any output, then a password hash is stored in "/etc/passwd". 
If any stored hashes are found in /etc/passwd, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38500','SV-50301r2_rule','default','medium','The root account must be the only account having a UID of 0.','An account has root authority if it has a UID of 0. Multiple accounts with a UID of 0 afford more opportunity for potential intruders to guess a password for a privileged account. Proper configuration of sudo is recommended to afford multiple system administrators access to root privileges in an accountable manner.','F-43447r1_fix','If any account other than root has a UID of 0, this misconfiguration should be investigated. then that uid needs to be changed due to this reason rule is moved to manual.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000032','C-46057r2_chk','To list all password file entries for accounts with UID 0, run the following command: 

 awk -F: "($3 == "0") {print}" /etc/passwd | grep -v "^"

This should print only one line, for the user root. 
If any account other than root has a UID of 0, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38573','SV-50374r4_rule','default','medium','The system must disable accounts after three consecutive unsuccessful logon attempts.','Locking out user accounts after a number of incorrect attempts prevents direct password guessing attacks.','F-43521r8_fix','To configure the system to lock out accounts after a number of incorrect logon attempts using "pam_faillock.so", modify the content of "/etc/pam.d/common-auth" as follows: 

Add the following line immediately before the "pam_unix.so" statement in the "AUTH" section: 

auth required pam_tally2.so deny=3 onerr=fail unlock_time=604800 fail_interval=900
account required pam_tally2.so

Note that any updates made to "/etc/pam.d/common-auth" may be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000061','C-46131r4_chk','To ensure the failed password attempt policy is configured correctly, run the following command: 

 grep -w pam_faillock /etc/pam.d/common-auth | grep -v "^"

The output should show "deny=3" for both files. 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38592','SV-50393r4_rule','default','medium','The system must require administrator action to unlock an account locked by excessive failed login attempts.','Locking out user accounts after a number of incorrect attempts prevents direct password guessing attacks. Ensuring that an administrator is involved in unlocking locked accounts draws appropriate attention to such situations.','F-43541r6_fix','To configure the system to lock out accounts after a number of incorrect logon attempts and require an administrator to unlock the account using "pam_faillock.so", modify the content of "/etc/pam.d/common-auth" as follows: 

Add the following line immediately before the "pam_unix.so" statement in the "AUTH" section: 
auth required pam_tally2.so deny=3 onerr=fail unlock_time=604800 fail_interval=900
account required pam_tally2.so

Note that any updates made to "/etc/pam.d/common-auth" may be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000356','C-46151r5_chk','To ensure the failed password attempt policy is configured correctly, run the following command: 

 grep -w pam_faillock /etc/pam.d/common-auth | grep -v "^"

The output should show "unlock_time=<some-large-number>"; the largest acceptable value is 604800 seconds (one week). 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38511','SV-50312r2_rule','default','medium','IP forwarding for IPv4 must not be enabled, unless the system is a router.','IP forwarding permits the kernel to forward packets from one network interface to another. The ability to forward packets between two networks is only appropriate for systems acting as routers.','F-43458r2_fix','To set the runtime status of the "net.ipv4.conf.all.forwarding" kernel parameter, 
run the following command: 

 sysctl -w net.ipv4.conf.all.forwarding=0

To make this configuration persistent, add the following line in "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.forwarding = 0

and run following command. 

 sysctl -p 

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000082','C-46068r3_chk','Check if IP forwarding for IPv4 is enabled on the system, by querying the following command: 

 sysctl net.ipv4.conf.all.forwarding

If the output of the command is not "0", this is a finding. 

Verify the value of net.ipv4.conf.all.forwarding in "/etc/sysctl.conf". 

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38514','SV-50315r3_rule','default','medium','The Datagram Congestion Control Protocol (DCCP) must be disabled unless required.','Disabling DCCP protects the system against exploitation of any flaws in its implementation.','F-43461r3_fix','The Datagram Congestion Control Protocol (DCCP) is a relatively new transport layer protocol, designed to support streaming media and telephony. To configure the system to prevent the "dccp" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": (Note: File should have .conf extension.)

$ install dccp /bin/true

To disable the dccp module run following command:

$ rmmod dccp
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000124','C-46071r3_chk','If the system is configured to prevent the loading of the "dccp" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr dccp /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38515','SV-50316r3_rule','default','medium','The Stream Control Transmission Protocol (SCTP) must be disabled unless required.','Disabling SCTP protects the system against exploitation of any flaws in its implementation.','F-43462r3_fix','The Stream Control Transmission Protocol (SCTP) is a transport layer protocol, designed to support the idea of message-oriented communication, with several streams of messages within one connection. To configure the system to prevent the "sctp" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d": (Note: File should have .conf extension.)

$ install sctp /bin/true

To disable the sctp module run following command:

$ rmmod sctp
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000125','C-46072r3_chk','If the system is configured to prevent the loading of the "sctp" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr sctp /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38516','SV-50317r3_rule','default','low','The Reliable Datagram Sockets (RDS) protocol must be disabled unless required.','Disabling RDS protects the system against exploitation of any flaws in its implementation.','F-43463r4_fix','The Reliable Datagram Sockets (RDS) protocol is a transport layer protocol designed to provide reliable high-bandwidth, low-latency communications between nodes in a cluster. To configure the system to prevent the "rds" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d":(Note: File should have .conf extension.)

$ install rds /bin/true

To disable the rds module run following command:

$ rmmod rds
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000126','C-46073r3_chk','If the system is configured to prevent the loading of the "rds" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr rds /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38517','SV-50318r3_rule','default','medium','The Transparent Inter-Process Communication (TIPC) protocol must be disabled unless required.','Disabling TIPC protects the system against exploitation of any flaws in its implementation.','F-43464r3_fix','The Transparent Inter-Process Communication (TIPC) protocol is designed to provide communications between nodes in a cluster. To configure the system to prevent the "tipc" kernel module from being loaded, add the following line to a file in the directory "/etc/modprobe.d":(Note: File should have .conf extension.) 

$ install tipc /bin/true

To disable the tipc module run following command:

$ rmmod tipc
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000127','C-46074r3_chk','If the system is configured to prevent the loading of the "tipc" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program (such as "/bin/true") upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr tipc /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000167','C-46080r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000083','C-46081r3_chk','Check if system is configured to reject IPv4 source-routed packets on any interface, by querying the following command:

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000084','C-46082r2_chk','Check if the system is configured to reject ICMPv4 redirect packets, by querying the following command:

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000169','C-46083r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000086','C-46084r2_chk','To check if system accepts ICMPv4 secure redirect packets on any interface, run the following command:

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000171','C-46085r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000088','C-46086r3_chk','Check if the system is configured to log Martian packets, by querying the following command:

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000089','C-46088r2_chk','Check if system is configured to reject IPv4 source-routed packets by default, by running the following command:

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000173','C-46087r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000174','C-46090r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000090','C-46089r2_chk','Check if the system is configured to reject ICMPv4 secure redirect packets by default, by querying the following command: 

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000091','C-46091r2_chk','Check if the system is configured to ignore ICMPv4 redirect messages by default, by querying the following command: 

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000175','C-46092r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000092','C-46093r2_chk','The status of the "net.ipv4.icmp_echo_ignore_broadcasts" kernel parameter can be queried by running the following command:

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000176','C-46094r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000093','C-46095r2_chk','The status of the "net.ipv4.icmp_ignore_bogus_error_responses" kernel parameter can be queried by running the following command:

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000177','C-46096r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000095','C-46097r2_chk','Check if the system is configured to use TCP syncookies when experiencing a TCP SYN flood, by querying the following command:

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000182','C-46098r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit changes to its network configuration, run the following command: 

auditctl -l | egrep "(sethostname|setdomainname|/etc/issue|/etc/issue.net|/etc/hosts|/etc/network/interfaces)"

If the system is configured to watch for network configuration changes, a line should be returned for each file specified (and "perm=wa" should be indicated for each). 
If the system is not configured to audit changes of the network configuration, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38541','SV-50342r1_rule','default','low','The audit system must be configured to audit modifications to the systems Mandatory Access Control (MAC) configuration (apparmor).','The system"s mandatory access policy (SELinux) should not be arbitrarily changed by anything other than administrator action. All changes to MAC policy should be audited.','F-43489r1_fix','Add the following to "/etc/audit/audit.rules":

-w /etc/apparmor/ -p wa -k MAC-policy

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000183','C-46099r1_chk','To determine if the system is configured to audit changes to its MAC configuration files, run the following command:

 grep -w "/etc/apparmor" /etc/audit/audit.rules

If the system is configured to watch for changes to its MAC configuration, a line should be returned (including "perm=wa" indicating permissions that are watched).
If the system is not configured to audit attempts to change the MAC policy, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38542','SV-50343r2_rule','default','medium','The system must use a reverse-path filter for IPv4 network traffic when possible on all interfaces.','Enabling reverse path filtering drops packets with source addresses that should not have been able to be received on the interface they were received on. It should not be used on systems which are routers for complicated networks, but is helpful for end hosts and routers serving small networks.','F-43490r1_fix','To set the runtime status of the "net.ipv4.conf.all.rp_filter" kernel parameter, run the following command: 

 sysctl -w net.ipv4.conf.all.rp_filter=1

To make this configuration persistent, add the following line to "/etc/sysctl.conf" and make sure that it has only single instance.

net.ipv4.conf.all.rp_filter = 1 

To make this configuration persistent, run following command. 

 sysctl -p

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000096','C-46100r2_chk','Check if system is configured to use the reverse-path filter for IPv4 network traffic on all interfaces enabled

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000184','C-46101r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000097','C-46102r2_chk','Check if the system is configured to use TCP syncookies when experiencing a TCP SYN flood, by querying the following command: 

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000185','C-46103r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000186','C-46105r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000187','C-46108r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000188','C-46110r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000189','C-46112r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000190','C-46114r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000191','C-46115r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000192','C-46116r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000193','C-46117r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000194','C-46119r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000195','C-46121r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000196','C-46123r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000197','C-46124r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000199','C-46126r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

If auditd service is not installed or auditd service not running, then rule get failed.

To verify that auditing is configured for all media exportation events, run the following command: 

$ sudo grep -w "mount" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return several lines. 

If no line is returned, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38569','SV-50370r1_rule','default','low','The system must require passwords to contain at least one uppercase alphabetic character.','Requiring a minimum number of uppercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43517r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "ucredit=" parameter controls requirements for usage of uppercase letters in a password. When set to a negative number, any password will be required to contain that many uppercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each uppercase character. 
Add "ucredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of an uppercase character in a password.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000057','C-46127r1_chk','To check how many uppercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "ucredit" parameter (as a negative number) will indicate how many uppercase characters are required. The requirement is at least one uppercase character in a password. This would appear as "ucredit=-1". 
If ucredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38570','SV-50371r1_rule','default','low','The system must require passwords to contain at least one special character.','Requiring a minimum number of special characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43518r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:

$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "ocredit=" parameter controls requirements for usage of special (or "other") characters in a password. When set to a negative number, any password will be required to contain that many special characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each special character.  
Add "ocredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a special character in passwords.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000058','C-46128r1_chk','To check how many special characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "ocredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one special character in a password. This would appear as "ocredit=-1". 
If ocredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38571','SV-50372r1_rule','default','low','The system must require passwords to contain at least one lowercase alphabetic character.','Requiring a minimum number of lowercase characters makes password guessing attacks more difficult by ensuring a larger search space.','F-43519r1_fix','Check if the libpam-cracklib package exists. If it is not installed, install the package:
$ apt-get -y install libpam-cracklib

The pam_cracklib module"s "lcredit=" parameter controls requirements for usage of lowercase letters in a password. When set to a negative number, any password will be required to contain that many lowercase characters. When set to a positive number, pam_cracklib will grant +1 additional length credit for each lowercase character. 
Add "lcredit=-1" after pam_cracklib.so in /etc/pam.d/common-password file to require use of a lowercase character in password.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000059','C-46129r1_chk','To check how many lowercase characters are required in a password, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "lcredit" parameter (as a negative number) will indicate how many special characters are required. The requirement is at least one lowercase character in a password. This would appear as "lcredit=-1". 
If lcredit is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38572','SV-50373r1_rule','default','low','The system must require at least four characters be changed between the old and new passwords during a password change.','Requiring a minimum number of different characters during password changes ensures that newly changed passwords should not resemble previously compromised ones. Note that passwords which are changed on compromised systems will still be compromised, however.','F-43520r1_fix','
The pam_cracklib module"s "difok" parameter controls requirements for usage of different characters during a password change. Add "difok=[]" after pam_cracklib. So to require differing characters when changing passwords, substituting [NUM] appropriately. The requirement is greater or equal to 4.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000060','C-46130r1_chk','To check how many characters must differ during a password change, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

The "difok" parameter will indicate how many characters must differ. The requirement is greater or equal to four characters differ during a password change. This would appear as "difok=4". 
If difok is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38574','SV-50375r2_rule','default','medium','The system must use a FIPS 140-2 approved cryptographic hashing algorithm for generating account password hashes (common-password).','Using a stronger hashing algorithm makes password cracking attacks more difficult.','F-43522r2_fix','In "/etc/pam.d/common-password", among potentially other files, the "password" section of the files control which PAM modules execute during a password change. Set the "pam_unix.so" module in the "password" section to include the argument "sha512", as shown below: 

password    [] pam_unix.so obscure use_authtok try_first_pass sha512

This will help ensure when local users change their passwords, hashes for the new passwords will be generated using the SHA-512 algorithm. This is the default.

Note that any updates made to "/etc/pam.d/common-password" will be overwritten by the "authconfig" program.  The "authconfig" program should not be used.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000062','C-46132r3_chk','Inspect the "password" section of "/etc/pam.d/common-password", and other files in "/etc/pam.d" and ensure that the "pam_unix.so" module includes the argument "sha512".

$ grep -w password /etc/pam.d/common-password | grep -w pam_unix.so | grep -v "^"

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38575','SV-50376r4_rule','default','low','The audit system must be configured to audit user deletions of files and programs.','Auditing file deletions will create an audit trail for files that are removed from the system. The audit trail could aid in system troubleshooting, as well as detecting malicious processes that attempt to delete log files to conceal their presence.','F-43523r4_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect file deletion events for all users and root. Add the following (or equivalent) to "/etc/audit/audit.rules", setting ARCH to either b32 or b64 as appropriate for your system: 

-a always,exit -F arch=ARCH -S rmdir -S unlink -S unlinkat -S rename -S renameat -F auid>=500 -F auid!=4294967295 -k delete
-a always,exit -F arch=ARCH -S rmdir -S unlink -S unlinkat -S rename -S renameat -F auid=0 -k delete

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000200','C-46133r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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

ENCRYPT_METHOD SHA512' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000063','C-46134r1_chk','Inspect "/etc/login.defs" and ensure the following line appears: 

 grep "ENCRYPT_METHOD SHA512" /etc/login.defs | grep -v "^"

ENCRYPT_METHOD SHA512

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38578','SV-50379r1_rule','default','low','The audit system must be configured to audit changes to the /etc/sudoers file.','The actions taken by system administrators should be audited to keep a record of what was executed on the system, as well as, for accountability purposes.','F-43526r1_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.

At a minimum, the audit system should collect administrator actions for all users and root. Add the following to "/etc/audit/audit.rules": 

-w /etc/sudoers -p wa -k actions

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000201','C-46136r1_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000202','C-46138r3_chk','If auditd service is not installed or auditd service not running, then rule get failed.

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
 service xinetd stop' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000203','C-46140r2_chk','If network services are using the xinetd service, this is not applicable.

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
select add_rule_data ('default','V-38584','SV-50385r1_rule','default','low','The xinetd service must be uninstalled if no network services utilizing it are enabled.','Removing the "xinetd" package decreases the risk of the xinetd service"s accidental (or intentional) activation.','F-43532r1_fix','The "xinetd" package can be uninstalled with the following command: 

 dpkg -r --force-all xinetd' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000204','C-46142r1_chk','If network services are using the xinetd service, 
Run the following command to determine if the "xinetd" package is installed: 

 dpkg -s xinetd

If the package is installed, check if any network services is utilizing xinetd using command:

 netstat -atunlp | grep "xinetd"

If No Network service(s) is using the "xinetd" but package is installed on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38587','SV-50388r1_rule','default','high','The telnet-server package must not be installed.','Removing the "telnet-server" package decreases the risk of the unencrypted telnet service"s accidental (or intentional) activation.

Mitigation:  If the telnet-server package is configured to only allow encrypted sessions, such as with Kerberos or the use of encrypted network tunnels, the risk of exposing sensitive information is mitigated.','F-43535r1_fix','The "telnetd" package can be uninstalled with the following command: 

 dpkg -r --force-all telnetd' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000206','C-46144r1_chk','Run the following command to determine if the "telnetd" package is installed: 

 dpkg -s telnetd


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38588','SV-50389r1_rule','default','medium','The system must not permit interactive boot.','Using interactive boot, the console user could disable auditing, firewalls, or other services, weakening system security.','F-43536r1_fix','This rule is not applicable.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000070','C-46146r1_chk','This rule is not applicable.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000211','C-46147r3_chk','To check that the "telnet" service is disabled, follow the folllowing step:
Check the telnet configuration file:
$ grep -w /usr/sbin/in.telnetd /etc/xinetd.d/*

Check for "disable = yes" in configuration file.

If the "disable = no", this is a finding.

If the telnet is configured using inetd service the check for the telnet configuration line inside file /etc/inetd.conf

$ grep "in.telnetd" /etc/inetd.conf | grep -v ""

If there is output, this is a finding.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38590','SV-50391r1_rule','default','low','The system must allow locking of the console screen in text mode.','Installing "screen" ensures a console locking capability is available for users who may need to suspend console logins.','F-43538r1_fix','To enable console screen locking when in text mode, install the "screen" package: 

 apt-get install screen

Instruct users to begin new terminal sessions with the following command: 

$ screen

The console can now be locked with the following key combination: 

ctrl+a x' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000071','C-46148r1_chk','Run the following command to determine if the "screen" package is installed: 

 dpkg -s screen


If the package is not installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38591','SV-50392r1_rule','default','high','The rsh-server package must not be installed.','The "rsh-server" package provides several obsolete and insecure network services. Removing it decreases the risk of those services" accidental (or intentional) activation.','F-43539r1_fix','The "rsh-server" package can be uninstalled with the following command: 

 dpkg -r --force-all rsh-server' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000213','C-46149r1_chk','Run the following command to determine if the "rsh-server" package is installed: 

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

$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000073','C-46150r1_chk','To check if the system login banner is compliant, run the following command: 

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000078','C-46153r2_chk','Check if the system is configured to implement virtual address space randomization, by querying the following command:

 sysctl kernel.randomize_va_space

If the output of the command is not "2", this is a finding.

verify the value of kernel.randomize_va_space  in "/etc/sysctl.conf".

If kernel.randomize_va_space is not set to "2" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38597','SV-50398r2_rule','default','medium','The system must limit the ability of processes to have simultaneous write and execute access to memory.','ExecShield uses the segmentation feature on all x86 systems to prevent execution in memory higher than a certain address. It writes an address as a limit in the code segment descriptor, to control where code can be executed, on a per-process basis. When the kernel places a process"s memory regions such as the stack and heap higher than this address, the hardware prevents execution in that address range.','F-43545r1_fix','This rule is not applicable.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000079','C-46155r3_chk','This rule is not applicable.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38599','SV-50400r2_rule','default','medium','The FTPS/FTP service on the system must be configured with the Department of Defense (DoD) login banner.','This setting will cause the system greeting banner to be used for FTP connections as well.','F-43564r3_fix','Edit the vsftpd configuration file, which resides at "/etc/vsftpd.conf" by default. Add or correct the following configuration options. 

banner_file=/etc/issue

If it"s configured with "ftpd_banner" line set the line as fallows.

ftpd_banner="custom banner text"

Restart the vsftpd daemon.

 service vsftpd restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000348','C-46174r1_chk','If vstfpd service is not installed on the system, this rule is not applicable.
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
select add_rule_data ('default','V-38600','SV-50401r2_rule','default','medium','The system must not send ICMPv4 redirects by default.','Sending ICMP redirects permits the system to instruct other systems to update their routing information. The ability to send ICMP redirects is only appropriate for systems acting as routers.','F-43547r1_fix','To set the runtime status of the "net.ipv4.conf.default.send_redirects" kernel parameter, run the following command:

 sysctl -w net.ipv4.conf.default.send_redirects=0

To make this configuration persistent, add the following line to "/etc/sysctl.conf":

net.ipv4.conf.default.send_redirects = 0

and run following command.

 sysctl -p

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000080','C-46157r2_chk','Check if the system is configured to ignore ICMPv4 redirects by default, by querying the following command:

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

or restart sysctl.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000081','C-46159r2_chk','Check if system sends ICMPv4 redirects from any interface, by querying the following command:

 sysctl net.ipv4.conf.all.send_redirects

If the output of the command is not "0" on any interface, this is a finding.

Verify the value of net.ipv4.conf.all.send_redirects in "/etc/sysctl.conf".

If is not set to "0" in "/etc/sysctl.conf", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38603','SV-50404r1_rule','default','medium','The ypserv package must not be installed.','Removing the "ypserv" package decreases the risk of the accidental (or intentional) activation of NIS or NIS+ services.','F-43551r1_fix','The "ypserv" package can be uninstalled with the following command: 

 dpkg -r --force-all nis
(Since ypserv is nis in ubuntu so there is no separate package for ypserv. Hence, we are removing nis package.)
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000220','C-46161r1_chk','Run the following command to determine if the "nis" package is installed: 

 service nis status


If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38604','SV-50405r2_rule','default','medium','The ypbind service must not be running.','Disabling the "ypbind" service ensures the system is not acting as a client in a NIS or NIS+ domain.','F-43552r2_fix','The "ypbind" service, which allows the system to act as a client in a NIS or NIS+ domain, should be disabled. The "ypbind" service can be disabled with the following commands: 

 service ypbind stop
 sysv-rc-conf --level 0123456S ypbind off' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000221','C-46162r2_chk','Run the following command to verify "ypbind" is disabled through current runtime configuration: 

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
 service cron start' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000224','C-46163r1_chk','Run the following command to determine the current status of the "crond" service: 

 service cron status

If the service is enabled, it should return the following: 

cron start/running


If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38606','SV-50407r2_rule','default','medium','The tftp-server package must not be installed unless required.','Removing the "tftp-server" package decreases the risk of the accidental (or intentional) activation of tftp services.','F-43554r1_fix','The "tftpd" package can be removed with the following command: 

 dpkg -r --force-all tftpd

If tftpd is not installed the check for tftpd-hpa package, to remove run following command:

 dpkg -r --force-all tftpd-hpa
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000222','C-46164r1_chk','Run the following command to determine if the "tftpd" package is installed: 

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
' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000227','C-46165r1_chk','To check which SSH protocol version is allowed, run the following command: 

 grep -iw Protocol /etc/ssh/sshd_config  | grep -v "^"

If configured properly, output should be:

Protocol 2

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38610','SV-50411r1_rule','default','low','The SSH daemon must set a timeout count on idle sessions.','This ensures a user login will be terminated as soon as the "ClientAliveCountMax" is reached.','F-43558r1_fix','To ensure the SSH idle timeout occurs precisely when the "ClientAliveCountMax" is set, edit "/etc/ssh/sshd_config" as follows: 

ClientAliveCountMax 0

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000231','C-46168r1_chk','To ensure the SSH idle timeout will occur when the "ClientAliveCountMax" is set, run the following command: 

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
 
$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000230','C-46167r1_chk','Run the following command to see what the timeout interval is: 

 grep -iw ClientAliveInterval /etc/ssh/sshd_config  | grep -v "^"

If properly configured, the output should be: 

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000223','C-46166r2_chk','To check that the "TFTP" service is disabled, follow the folllowing step:
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
select add_rule_data ('default','V-38611','SV-50412r1_rule','default','medium','The SSH daemon must ignore .rhosts files.','SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.','F-43559r1_fix','SSH can emulate the behavior of the obsolete rsh command in allowing users to enable insecure access to their accounts via ".rhosts" files. 

To ensure this behavior is disabled, add or correct the following line in "/etc/ssh/sshd_config": 

IgnoreRhosts yes

Then, Restart the ssh service:
 
$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000234','C-46169r1_chk','To determine how the SSH daemon"s "IgnoreRhosts" option is set, run the following command: 
 grep -i IgnoreRhosts /etc/ssh/sshd_config
If no line, a commented line, or a line indicating the value "yes" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38612','SV-50413r1_rule','default','medium','The SSH daemon must not allow host-based authentication.','SSH trust relationships mean a compromise on one host can allow an attacker to move trivially to other hosts.','F-43560r1_fix','SSH"s cryptographic host-based authentication is more secure than ".rhosts" authentication, since hosts are cryptographically authenticated. However, it is not recommended that hosts unilaterally trust one another, even within an organization. 

To disable host-based authentication, add or correct the following line in "/etc/ssh/sshd_config": 

HostbasedAuthentication no

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000236','C-46170r1_chk','To determine how the SSH daemon"s "HostbasedAuthentication" option is set, run the following command: 

 grep -iw HostbasedAuthentication /etc/ssh/sshd_config | grep -v "^"

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38614','SV-50415r1_rule','default','high','The SSH daemon must not allow authentication using an empty password.','Configuring this setting for the SSH daemon provides additional assurance that remote login via SSH will require a password, even in the event of misconfiguration elsewhere.','F-43562r1_fix','To explicitly disallow remote login from accounts with empty passwords, add or correct the following line in "/etc/ssh/sshd_config": 

PermitEmptyPasswords no

Any accounts with empty passwords should be disabled immediately, and PAM configuration should prevent users from being able to assign themselves empty passwords.

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000239','C-46172r1_chk','To determine how the SSH daemon"s "PermitEmptyPasswords" option is set, run the following command: 

 grep -iw PermitEmptyPasswords /etc/ssh/sshd_config  | grep -v "^"

If no line, a commented line, or a line indicating the value "no" is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38615','SV-50416r1_rule','default','medium','The SSH daemon must be configured with the Department of Defense (DoD) login banner.','The warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers. Alternatively, systems whose ownership should not be obvious should ensure usage of a banner that does not provide easy attribution.','F-43563r1_fix','To enable the warning banner and ensure it is consistent across the system, add or correct the following line in "/etc/ssh/sshd_config": 

Banner /etc/issue

Restart ssh service to get changes in effect:

 service ssh restart

Another section contains information on how to create an appropriate system-wide warning banner.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000240','C-46173r1_chk','To determine how the SSH daemon"s "Banner" option is set, run the following command: 

 grep -iw Banner /etc/ssh/sshd_config | grep -v "^"

If a line indicating /etc/issue is returned, then the required value is set. 
If the required value is not set, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38616','SV-50417r1_rule','default','low','The SSH daemon must not permit user environment settings.','SSH environment options potentially allow users to bypass access restriction in some configurations.','F-43565r1_fix','To ensure users are not able to present environment options to the SSH daemon, add or correct the following line in "/etc/ssh/sshd_config": 

PermitUserEnvironment no

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000241','C-46175r1_chk','To ensure users are not able to present environment daemons, run the following command: 

 grep -iw PermitUserEnvironment /etc/ssh/sshd_config | grep -v "^"
 
If properly configured, output should be: 

PermitUserEnvironment no


If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38617','SV-50418r1_rule','default','medium','The SSH daemon must be configured to use only FIPS 140-2 approved ciphers.','Approved algorithms should impart some level of confidence in their implementation. These are also required for compliance.','F-43566r1_fix','Limit the ciphers to those algorithms which are FIPS-approved. Counter (CTR) mode is also preferred over cipher-block chaining (CBC) mode. The following line in "/etc/ssh/sshd_config" demonstrates use of FIPS-approved ciphers: 

Ciphers aes128-ctr,aes192-ctr,aes256-ctr,aes128-cbc,3des-cbc,aes192-cbc,aes256-cbc

The man page "sshd_config(5)" contains a list of supported ciphers.

Restart ssh service to get changes in effect:
 
$ service ssh restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000243','C-46176r1_chk','Only FIPS-approved ciphers should be used. To verify that only FIPS-approved ciphers are in use, run the following command: 

 grep -iw Ciphers /etc/ssh/sshd_config | grep -v "^"

The output should contain only those ciphers which are FIPS-approved, namely, the AES and 3DES ciphers. 
If that is not the case, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38618','SV-50419r2_rule','default','low','The avahi service must be disabled.','Because the Avahi daemon service keeps an open network port, it is subject to network attacks. Its functionality is convenient but is only appropriate if the local network can be trusted.','F-43567r2_fix','The "avahi-daemon" service can be disabled with the following commands: 

 sysv-rc-conf --level 0123456S avahi-daemon off
 service avahi-daemon stop' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000246','C-46177r1_chk','Run the following command to verify "avahi-daemon" is disabled through current runtime configuration:

 service avahi-daemon status

If the service is disabled the command will return the following output:

avahi-daemon stop/waiting

To check that the "avahi-daemon" service is disabled in system boot configuration, run the following command:

 sysv-rc-conf --list "avahi-daemon"

Output should indicate the "avahi-daemon" service has either not been installed, or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf --list "avahi-daemon"

"avahi-daemon" 0:off 1:off 2:off 3:off 4:off 5:off 6:off S:off

If the service is running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38619','SV-50420r2_rule','default','medium','There must be no .netrc files on the system.','Unencrypted passwords for remote FTP servers may be stored in ".netrc" files. DoD policy requires passwords be encrypted in storage and not used in access scripts.','F-43569r2_fix','The ".netrc" files contain logon information used to auto-logon into FTP servers and reside in the user"s home directory. These files may contain unencrypted passwords to remote FTP servers making them susceptible to access by unauthorized users and should not be used. Any ".netrc" files should be removed.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000347','C-46179r3_chk','To check the system for the existence of any ".netrc" files, run the following command: 

$ find /root /home -iname ".netrc" -type f

If any .netrc files exist, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38621','SV-50422r1_rule','default','medium','The system clock must be synchronized to an authoritative DoD time source.','Synchronizing with an NTP server makes it possible to collate system logs from multiple sources or correlate computer events with real time events. Using a trusted NTP server provided by your organization is recommended.','F-43570r1_fix','To specify a remote NTP server for time synchronization, edit the file "/etc/ntp.conf". Add or correct the following lines, substituting the IP or hostname of a remote NTP server for ntpserver. 

server []

This instructs the NTP software to contact that remote server to obtain time data.

Restart NTP service to get changes in effect by using the command:

$ service ntp restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000248','C-46180r1_chk','To verify the "ntpd" package is installed on the system, run the following command: 

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
$ sysv-rc-conf --level 0123456S ntp on' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000247','C-46178r1_chk','To verify the "ntpd" package is installed on the system, run the following command: 

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

1        5        cron.daily        run-parts --report /etc/cron.daily' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000138','C-46183r1_chk','Run the following commands to determine the current status of the "logrotate" configuration.

Make sure logrotate configuration file is configured to rotate logs daily.

 grep daily /etc/logrotate.conf

The string "daily" must be at the top of the configuration file /etc/logrotate.conf.

Check whether a cron job is scheduled in /etc/crontab or /etc/anacrontab which rotates logs daily. Make sure it is scheduled for daily execution.

 grep /etc/cron.daily /etc/crontab
 grep /etc/cron.daily /etc/anacrontab

If the logrotate service is not run on a daily basis by cron in crontab or anacrontab, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38626','SV-50427r1_rule','default','medium','The LDAP client must use a TLS connection using trust certificates signed by the site CA.','The tls_cacertdir or tls_cacertfile directives are required when tls_checkpeer is configured (which is the default for openldap versions 2.1 and up). These directives define the path to the trust certificates signed by the site CA.','F-43575r1_fix','Ensure a copy of the site"s CA certificate has been placed in the file "/etc/pki/tls/CA/cacert.pem". Configure LDAP to enforce TLS use and to trust certificates signed by the site"s CA. First, edit the file "/etc/ldap/ldap.conf", and add or correct either of the following lines:

tls_cacertdir /etc/pki/tls/CA

or

tls_cacertfile /etc/pki/tls/CA/cacert.pem

Then review the LDAP server and ensure TLS has been configured.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000253','C-46185r1_chk','If the system does not use LDAP for authentication or account information, this is not applicable.

To ensure TLS is configured with trust certificates, run the following command:

$ ldapsearch -x -ZZ

If it return error message, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38627','SV-50428r1_rule','default','low','The openldap-servers package must not be installed unless required.','Unnecessary packages should not be installed to decrease the attack surface of the system.','F-43577r1_fix','The "slapd" package should be removed if not in use. Is this machine the OpenLDAP server? If not, remove the package. 

 dpkg -r --force-all slapd

The slapd RPM is not installed by default on ubuntu machines. It is needed only by the OpenLDAP server, not by the clients which use LDAP for authentication. If the system is not intended for use as an LDAP Server it should be removed.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000256','C-46187r1_chk','To verify the "slapd" package is not installed, run the following command: 

$ dpkg -s slapd

The output should show the following. 

package "slapd" is not installed and no information is available

If it does not, this is a finding.
(For ldap configuration we require both slapd and ldap-utils pacakge if ldap-utils is missing that means ldap is not configured on your system.)
   ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38628','SV-50429r2_rule','default','medium','The operating system must produce audit records containing sufficient information to establish the identity of any user/subject associated with the event.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43576r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start
 sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000145','C-46186r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

 * auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38629','SV-50430r3_rule','default','medium','The graphical desktop environment must set the idle timeout to no more than 15 minutes.','Setting the idle delay controls when the screensaver will start, and can be combined with screen locking to prevent access from passersby.','F-43578r1_fix','Run the following command to set the idle time-out value for inactivity in the GNOME desktop to 15 minutes: 

Set the idle time-out value for root account or login user, with the follwoing command:

 dbus-launch gsettings set org.gnome.desktop.session idle-delay 600

 dbus-launch gsettings set org.gnome.desktop.screensaver lock-delay 300

Set the idle time-out value for global users with the follwoing command:

 sudo -u UserName -H dbus-launch gsettings set org.gnome.desktop.session idle-delay 600 

 sudo -u UserName -H dbus-launch gsettings set org.gnome.desktop.screensaver lock-delay 300' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000257','C-46188r3_chk','If the system is NON-GUI based system, this is not applicable.

To check the current idle time-out value for root or login user, run the following command: 

$ gsettings get org.gnome.desktop.session idle-delay | awk -F " " "{ print $2 }"

$ gsettings get org.gnome.desktop.screensaver lock-delay | awk -F " " "{ print $2 }"

To check the current idle time-out value for global users, run the following command: 

$ sudo -u username -H gsettings get org.gnome.desktop.session idle-delay | awk -F " " "{ print $2 }"

$ sudo -u username -H gsettings get org.gnome.desktop.screensaver lock-delay | awk -F " " "{ print $2 }"


If properly configured, the addition of two commands output should be lessthan "15".

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38630','SV-50431r3_rule','default','medium','The graphical desktop environment must automatically lock after 15 minutes of inactivity and the system must require user reauthentication to unlock the environment.','Enabling idle activation of the screen saver ensures the screensaver will be activated after the idle delay. Applications requiring continuous, real-time screen display (such as network management products) require the login session does not have administrator rights and the display station is located in a controlled-access area.','F-43579r1_fix','Run the following command to activate the screensaver in the GNOME desktop after a period of inactivity: 
set the screensaver active for root or loggin user:
 dbus-launch gsettings set org.gnome.desktop.screensaver idle-activation-enabled "true"

set the screensaver active for global users:
 sudo -u username -H dbus-launch gsettings set org.gnome.desktop.screensaver idle-activation-enabled "true"
' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000258','C-46189r3_chk','If the system is NON-GUI based system, this is not applicable.

To check the screensaver mandatory use status for root or login user, run the following command: 

$ gsettings get org.gnome.desktop.screensaver idle-activation-enabled

To check the screensaver mandatory use status for global users, run the following command: 

$ sudo -u username -H gsettings get org.gnome.desktop.screensaver idle-activation-enabled

If properly configured, the output should be "true".

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38631','SV-50432r2_rule','default','medium','The operating system must employ automated mechanisms to facilitate the monitoring and control of remote access methods.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43580r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start

 sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000148','C-46190r1_chk','Run the following command to determine the current status of the "auditd" service: 

 service auditd status

If the service is enabled, it should return the following: 

* auditd is running.

If the service is not running, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38632','SV-50433r2_rule','default','medium','The operating system must produce audit records containing sufficient information to establish what type of events occurred.','Ensuring the "auditd" service is active ensures audit records generated by the kernel can be written to disk, or that appropriate actions will be taken if other obstacles exist.','F-43581r2_fix','The "auditd" service is an essential userspace component of the Linux Auditing System, as it is responsible for writing audit records to disk. The "auditd" service can be enabled with the following commands: 

 service auditd start

sysv-rc-conf --level 2345 auditd on' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000154','C-46191r1_chk','Run the following command to determine the current status of the "auditd" service: 

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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000165','C-46194r2_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To determine if the system is configured to audit calls to the "adjtimex" system call, run the following command:

$ sudo grep -w "adjtimex" /etc/audit/audit.rules

If the system is configured to audit this activity, it will return a line. 

If the system is not configured to audit time changes, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38636','SV-50437r1_rule','default','medium','The system must retain enough rotated audit logs to cover the required log retention period.','The total storage for audit log files must be large enough to retain log information over the period required. This is a function of the maximum log file size and the number of logs retained.','F-43585r1_fix','Determine how many log files "auditd" should retain when it rotates logs. Edit the file "/etc/audit/auditd.conf". Add or modify the following line, substituting [] with the correct value: 

num_logs = [NUMLOGS]

Set the value to 5 for general-purpose systems. Note that values less than 2 result in no log rotation.
If auditd service is not installed then rule will install before fixing changes.
Reload the auditd.

$ service auditd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000159','C-46195r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine how many logs the system is configured to retain after rotation: 

 grep -wi num_logs /etc/audit/auditd.conf | grep -v "^"

num_logs = 5

If the overall system log file(s) retention hasn"t been properly set up, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38633','SV-50434r1_rule','default','medium','The system must set a maximum audit log file size.','The total storage for audit log files must be large enough to retain log information over the period required. This is a function of the maximum log file size and the number of logs retained.','F-43582r1_fix','Determine the amount of audit data (in megabytes) which should be retained in each log file. Edit the file "/etc/audit/auditd.conf". Add or modify the following line, substituting the correct value for []: 

max_log_file = [STOREMB]

Set the value to "6" (MB) or higher for general-purpose systems. Larger values, of course, support retention of even more audit data.
If auditd service is not installed then rule will install before fixing changes.

Reload the auditd.

$ service auditd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000160','C-46192r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine how much data the system will retain in each audit log file:

 grep -wi max_log_file /etc/audit/auditd.conf | grep -v "^"

max_log_file = 6


If the system audit data threshold hasn"t been properly set up, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38680','SV-50481r1_rule','default','medium','The audit system must identify staff members to receive notifications of audit log storage volume capacity issues.','Email sent to the root account is typically aliased to the administrators of the system, who can take appropriate action.','F-43629r1_fix','The "auditd" package can be configured to send email to a designated account in certain situations. Add or correct the following line in "/etc/audit/auditd.conf" to ensure that administrators are notified via email for those situations: 

action_mail_acct = root
If auditd package is not installed then rule will install it before fixing changes.
Reload the auditd.

$ service auditd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000313','C-46241r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to send email to an account when it needs to notify an administrator:

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

$ service auditd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000161','C-46193r3_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to rotate logs when they reach their maximum size:

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

$ service auditd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000311','C-46240r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine whether the system is configured to email the administrator when disk space is starting to run low: 

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

$ service auditd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000005','C-46025r3_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to email the administrator when disk space is starting to run low: 

 grep -wi space_left_action /etc/audit/auditd.conf | grep -v "^"
space_left_action = email


If the system is not configured to send an email to the system administrator when disk space is starting to run low, this is a finding.  The "syslog" option is acceptable when it can be demonstrated that the local log management infrastructure notifies an appropriate administrator in a timely manner.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-54381','SV-68627r1_rule','default','medium','The audit system must switch the system to single-user mode when available audit storage volume becomes dangerously low.','Administrators should be made aware of an inability to record audit records. If a separate partition or logical volume of adequate size is used, running low on space for audit records should never occur. ','F-59235r2_fix','The "auditd" service can be configured to take an action when disk space is running low but prior to running out of space completely. Edit the file "/etc/audit/auditd.conf". Add or modify the following line, substituting [] appropriately:

admin_space_left_action = [ACTION]

Set this value to "single" to cause the system to switch to single-user mode for corrective action. Acceptable values also include "suspend" and "halt". For certain systems, the need for availability outweighs the need to log all actions, and a different setting should be determined. Details regarding all possible values for [ACTION] are described in the "auditd.conf" man page. ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000163','C-54997r2_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to either suspend, switch to single-user mode, or halt when disk space has run low:

admin_space_left_action single

If the system is not configured to switch to single-user mode for corrective action, this is a finding. ','Customized rule by Cloud Raxak') from dual;
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

$ service auditd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000510','C-46023r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when the audit storage volume is full:

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

$ service auditd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000511','C-46020r1_chk','Inspect "/etc/audit/auditd.conf" and locate the following line to determine if the system is configured to take appropriate action when disk errors occur:

 grep -wi disk_error_action /etc/audit/auditd.conf | grep -v "^"
disk_error_action = []

If the system is configured to except "syslog" or "exec" when disk errors occur, this is a finding.
','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38637','SV-50438r2_rule','default','medium','The system package management tool must verify contents of all files associated with the audit package.','The hash on important files like audit system executables should match the information given by the RPM database. Audit executables  with erroneous hashes could be a sign of nefarious activity on the system.','F-43586r1_fix','The Ubuntu package management system can check the hashes of audit system package files. Run the following command to list which audit files on the system have hashes that differ from what is expected by the Ubuntu package management tool"s database:

 dpkg -V auditd | awk "$1 ~ /..5/ ANDAND $2 != "c""

If the dpkg version is less than 1.17 then use the following command.

 debsums -c auditd

If the file that has changed was not expected to then refresh from distribution media or online repositories.

 apt-get -y install --reinstall []' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000281','C-46196r3_chk','The following command will list which audit files on the system have file hashes different from what is expected by the Ubuntu package management tool"s database.

 dpkg -V auditd | awk "$1 ~ /..5/ ANDAND $2 != "c""

If the dpkg version is less than 1.17 then use the following command.

 debsums -c auditd

If there is any output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38638','SV-50439r3_rule','default','medium','The graphical desktop environment must have automatic lock enabled.','Enabling the activation of the screen lock after an idle period ensures password entry will be required in order to access the system, preventing access by passersby.','F-43587r1_fix','Run the following command to activate locking of the screensaver in the GNOME desktop when it is activated: 
Activate the locking screen for root or login user by following command.
 dbus-launch gsettings set org.gnome.desktop.screensaver lock-enabled "true"

Activate the locking screen for global users by following command.
 sudo -u username -H dbus-launch gsettings set org.gnome.desktop.screensaver lock-enabled "true"' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000259','C-46198r3_chk','If the system is NON-GUI based system, this is not applicable. 

To check the status of the idle screen lock activation for root or login user, run the following command: 

$ gsettings get org.gnome.desktop.screensaver lock-enabled

To check the status of the idle screen lock activation for global users, run the following command: 

$ sudo -u username -H gsettings get org.gnome.desktop.screensaver lock-enabled

If properly configured, the output should be "true". 
If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38639','SV-50440r3_rule','default','low','The system must display a publicly-viewable pattern during a graphical desktop environment session lock.','Setting the screensaver mode to blank-only conceals the contents of the display from passersby.','F-43588r2_fix','Run the following command to set the screensaver mode in the GNOME desktop to a blank screen: 

Run the follwoing command for root or login user:

 dbus-launch gsettings set org.gnome.desktop.session idle-delay 600

Run the following command for gloabl users:

 sudo -u username -H dbus-launch gsettings set org.gnome.desktop.session idle-delay 600



' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000260','C-46199r4_chk','If the system is NON-GUI based system, this is not applicable. 

To ensure the screensaver is configured to be blank for root or login user, run the following command: 

$ gsettings get org.gnome.desktop.session idle-delay | awk -F " " "{ print $2 }"

To ensure the screensaver is configured to be blank for global users, run the following command: 

$ sudo -u username -H gsettings get org.gnome.desktop.session idle-delay | awk -F " " "{ print $2 }"

If the output is "0", this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38640','SV-50441r2_rule','default','low','The automatically generate crash reports for debugging(apport) service must not be running.','Mishandling crash data could expose sensitive information about vulnerabilities in software executing on the local machine, as well as sensitive information from within a process"s address space or registers.','F-43589r2_fix','. The "apport" service can be disabled with the following commands: 
 service apport stop
 sysv-rc-conf --level 0123456S apport off' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000261','C-46200r1_chk','Run the following command to verify "apport" is disabled through current runtime configuration: 

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
 service atd stop' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000262','C-46201r2_chk','If the system uses the "atd" service, this is not applicable.

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
select add_rule_data ('default','V-38642','SV-50443r1_rule','default','low','The system default umask for daemons must be 027 or 022.','The umask influences the permissions assigned to files created by a process at run time. An unnecessarily permissive umask could result in files being created with insecure permissions.','F-43592r1_fix','The file "/lib/lsb/init-functions" includes initialization parameters for most or all daemons started at boot time.
The default umask of 022 prevents creation of group- or world-writable files.
To set the default umask for daemons, edit the following line, inserting 022 or 027 for [] appropriately:

umask [UMASK]

Setting the umask to too restrictive a setting can cause serious errors at runtime. Many daemons on the system already individually restrict themselves to a umask of 077 in their own init scripts.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000346','C-46203r1_chk','To check the value of the "umask", run the following command:
$ grep umask /lib/lsb/init-functions

The output should show either "022" or "027".
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38643','SV-50444r3_rule','default','medium','There must be no world-writable files on the system.','Data in world-writable files can be modified by any user on the system. In almost all circumstances, files can be configured using a combination of user and group permissions to support whatever legitimate access is needed without the risk caused by world-writable files.','F-43591r1_fix','It is generally a good idea to remove global (other) write access to a file when it is discovered. However, check with documentation for specific applications before making changes. Also, monitor for recurring world-writable files, as these may be symptoms of a misconfigured application or user account.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000282','C-46202r3_chk','To find world-writable files, run the following command for each local partition [], excluding special filesystems such as /selinux, /proc, or /sys: 

$ find / -type f -perm -002 -print 2>>/dev/null | grep -v -e ^"/proc" -e ^"/selinux" -e ^"/sys"

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38644','SV-50445r2_rule','default','low','The ntpdate service must not be running.','The "ntpdate" service may only be suitable for systems which are rebooted frequently enough that clock drift does not cause problems between reboots. In any event, the functionality of the ntpdate service is now available in the ntpd program and should be considered deprecated.','F-43593r2_fix','The functionality of the ntpdate is now available as ntp daemon so it is considered deprecated hence remove the ntpdate package.

 apt-get -y purge ntpdate' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000265','C-46204r1_chk','Run the following command to verify "ntpdate" is installed on the system.

 dpkg -s ntpdate

If the ntpdate package is installed, this is the finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38645','SV-50446r1_rule','default','low','The system default umask in /etc/login.defs must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43594r1_fix','To ensure the default umask controlled by "/etc/login.defs" is set properly, add or correct the "umask" setting in "/etc/login.defs" to read as follows: 

UMASK 077' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000345','C-46205r1_chk','Verify the "umask" setting is configured correctly in the "/etc/login.defs" file by running the following command:

 grep -v "^\s*" /etc/login.defs | grep -w UMASK

All output must show the value of "umask" set to 077, as shown in the below:

UMASK 077

If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38647','SV-50448r1_rule','default','low','The system default umask in /etc/profile must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43596r1_fix','To ensure the default umask controlled by "/etc/profile" is set properly, add or correct the "umask" setting in "/etc/profile" to read as follows: 

umask 077' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000344','C-46207r1_chk','Verify the "umask" setting is configured correctly in the "/etc/profile" file by running the following command:

 grep "umask" /etc/profile

All output must show the value of "umask" set to 077, as shown in the below:

 grep "umask" /etc/profile
umask 077

If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38649','SV-50450r1_rule','default','low','The system default umask for the csh shell must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43598r1_fix','To ensure the default umask for users of the C shell is set properly, add or correct the "umask" setting in "/etc/csh.cshrc" to read as follows: 

umask 077' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000343','C-46209r1_chk','Verify the "umask" setting is configured correctly in the "/etc/csh.cshrc" file by running the following command: 

 grep "umask" /etc/csh.cshrc

All output must show the value of "umask" set to 077, as shown in the below: 

 grep "umask" /etc/csh.cshrc
umask 077


If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38651','SV-50452r1_rule','default','low','The system default umask for the bash shell must be 077.','The umask value influences the permissions assigned to files when they are created. A misconfigured umask value could result in files with excessive permissions that can be read and/or written to by unauthorized users.','F-43600r1_fix','To ensure the default umask for users of the Bash shell is set properly, add or correct the "umask" setting in "/etc/bash.bashrc" to read as follows:

umask 077' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000342','C-46211r1_chk','Verify the "umask" setting is configured correctly in the "/etc/bash.bashrc" file by running the following command:

 grep "umask" /etc/bash.bashrc

All output must show the value of "umask" set to 077, as shown below: 

 grep "umask" /etc/bash.bashrc
umask 077
umask 077


If the above command returns no output, or if the umask is configured incorrectly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38652','SV-50453r2_rule','default','medium','Remote file systems must be mounted with the nodev option.','Legitimate device files should only exist in the /dev directory. NFS mounts should not present device files to users.','F-43601r1_fix','Add the "nodev" option to the mount option column of "/etc/fstab" for the line which controls mounting of any NFS mounts.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000269','C-46212r2_chk','To verify the "nodev" option is configured for all NFS mounts, run the following command: 

$ egrep -w "nfs[]?" /etc/fstab | grep -v "^"

All NFS mounts should have the "nodev" option in option column.
If any one of mount points does not have "nodev" option, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38653','SV-50454r1_rule','default','high','The snmpd service must not use a default password.','Presence of the default SNMP password enables querying of different system aspects and could result in unauthorized knowledge of the system.','F-43602r1_fix','Edit "/etc/snmp/snmpd.conf", remove default community string "public". Upon doing that, restart the SNMP service: 

 service snmpd restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000341','C-46213r1_chk','To ensure the default password is not set, run the following command: 

 grep -v "^" /etc/snmp/snmpd.conf| grep public

There should be no output. 
If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38654','SV-50455r2_rule','default','medium','Remote file systems must be mounted with the nosuid option.','NFS mounts should not present suid binaries to users. Only vendor-supplied suid executables should be installed to their default location on the local filesystem.','F-43603r1_fix','Add the "nosuid" option to the mount option column of "/etc/fstab" for the line which controls mounting of any NFS mounts.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000270','C-46214r3_chk','To verify the "nosuid" option is configured for all NFS mounts, run the following command: 

$ egrep -w "nfs[]?" /etc/fstab | grep -v "^"

All NFS mounts should have the "nosuid" option in option column.
If any one of mount points does not have "nosuid" option, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38655','SV-50456r1_rule','default','low','The noexec option must be added to removable media partitions.','Allowing users to execute binaries from removable media such as USB keys exposes the system to potential compromise.','F-43605r1_fix','The "noexec" mount option prevents the direct execution of binaries on the mounted filesystem. Users should not be allowed to execute binaries that exist on partitions mounted from removable media (such as a USB key). The "noexec" option prevents code from being executed directly from the media itself, and may therefore provide a line of defense against certain types of worms or malicious code. Add the "noexec" option to the fourth column of "/etc/fstab" for the line which controls mounting of any removable media partitions.

[]" and then run mount [devicename] to effect the changes.]
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000271','C-46216r1_chk','To verify that binaries cannot be directly executed from removable media, run the following command: 

[]

Check whether device with ID_BUS as usb is mounted in /etc/mtab:

$ grep -w device_name /etc/mtab | grep -v "^"

The output should show "noexec" in use. 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38656','SV-50457r1_rule','default','low','The system must use SMB client signing for connecting to samba servers using smbclient.','Packet signing can prevent man-in-the-middle attacks which modify SMB packets in transit.','F-43606r1_fix','To require samba clients running "smbclient" to use packet signing, add the following to the "[]" section of the Samba configuration file in "/etc/samba/smb.conf": 

client signing = mandatory

Requiring samba clients such as "smbclient" to use packet signing ensures they can only communicate with servers that support packet signing.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000272','C-46217r1_chk','To verify that Samba clients running smbclient must use packet signing, run the following command:

 grep -w signing /etc/samba/smb.conf | grep -v "^\s*"

The output should show:

client signing = mandatory

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38657','SV-50458r2_rule','default','low','The system must use SMB client signing for connecting to samba servers using mount.cifs.','Packet signing can prevent man-in-the-middle attacks which modify SMB packets in transit.','F-43607r1_fix','Require packet signing of clients who mount Samba shares using the "mount.cifs" program (e.g., those who specify shares in "/etc/fstab"). To do so, ensure signing options (either "sec=krb5i" or "sec=ntlmv2i") are used. 

See the "mount.cifs(8)" man page for more information. A Samba client should only communicate with servers who can support SMB packet signing.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000273','C-46218r4_chk','If Samba is not in use, this is not applicable.

To verify that Samba clients using mount.cifs must use packet signing, run the following command: 

 grep -w cifs /etc/fstab /etc/mtab | grep -v ""

The output should show either "krb5i" or "ntlmv2i" in use. 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38658','SV-50459r1_rule','default','medium','The system must prohibit the reuse of passwords within twenty-four iterations.','Preventing reuse of previous passwords helps ensure that a compromised password is not reused by a user.','F-43608r1_fix','Do not allow users to reuse recent passwords. This can be accomplished by using the "remember" option for the "pam_unix" PAM module. In the file "/etc/pam.d/common-password", append "remember=24" to the line which refers to the "pam_unix.so" module, as shown: 

password sufficient pam_unix.so [] remember=24

The requirement is 24 passwords.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000274','C-46219r1_chk','To verify the password reuse setting is compliant, run the following command: 

$ grep -w remember /etc/pam.d/common-password | grep -w password | grep -v "^"

The output should show the following at the end of the line: 

remember=24


If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38660','SV-50461r1_rule','default','medium','The snmpd service must use only SNMP protocol version 3 or newer.','Earlier versions of SNMP are considered insecure, as they potentially allow unauthorized access to detailed system management information.
','F-43604r1_fix','Edit "/etc/snmp/snmpd.conf", removing any references to "v1", "v2c", or "com2sec". Upon doing that, reload the SNMP service: 

$ /etc/init.d/snmpd reload' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000340','C-46215r1_chk','To ensure only SNMPv3 or newer is used, run the following command: 

$ grep "v1\|v2c\|com2sec" /etc/snmp/snmpd.conf | grep -v "^"

There should be no output. 
If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38667','SV-50468r2_rule','default','medium','The system must have a host-based intrusion detection tool installed.','Adding host-based intrusion detection tools can provide the capability to automatically take actions in response to malicious behavior, which can provide additional agility in reacting to network threats. These tools also often include a reporting capability to provide network awareness of system, which may not otherwise exist in an organization"s systems management regime.','F-43616r2_fix','Installing Aide package using the command:

$ apt-get install aide

Creating aide database by using the command:

$ aideinit ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000285','C-46227r1_chk','Inspect the system to determine if intrusion detection software has been installed. Verify the intrusion detection software is active by using apparmor or aide tools.

If no host-based intrusion detection tools are installed, this is a finding.

Check apparmor status on the system by using the command:

$ apparmor_status

If apparmor is not mounted, apparmor is not active on the system.

Check aide package on the system using the command:

$ dpkg -s aide

Output should be "aide is running...". If not, this is a finding.

Check aide database as per aide configuration file.
If aide database does not exist on the system, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38668','SV-50469r2_rule','default','high','The x86 Ctrl-Alt-Delete key sequence must be disabled.','A locally logged-in user who presses Ctrl-Alt-Delete, when at the console, can reboot the system. If accidentally pressed, as could happen in the case of mixed OS environment, this can create the risk of short-term loss of availability of systems due to unintentional reboot. In the GNOME graphical environment, risk of unintentional reboot from the Ctrl-Alt-Delete sequence is reduced because the user will be prompted before any action is taken.','F-43617r2_fix','By default, the system includes the following line in "/etc/init/control-alt-delete.conf" to reboot the system when the Ctrl-Alt-Delete key sequence is pressed:

exec /sbin/shutdown -r now "Ctrl-Alt-Delete pressed"


To configure the system to log a message instead of rebooting the system, add the following line to "/etc/init/control-alt-delete.override" to read as follows:

exec /usr/bin/logger -p security.info "Ctrl-Alt-Delete pressed"' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000286','C-46228r2_chk','To ensure the system is configured to log a message instead of rebooting the system when Ctrl-Alt-Delete is pressed, ensure the following line is in "/etc/init/control-alt-delete.override":

exec /usr/bin/logger -p security.info "Control-Alt-Delete pressed"

If the system is not configured to block the shutdown command when Ctrl-Alt-Delete is pressed, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38670','SV-50471r2_rule','default','medium','The operating system must detect unauthorized changes to software and information. ','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43619r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000306','C-46229r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38671','SV-50472r1_rule','default','medium','The sendmail package must be removed.','The sendmail software was not developed with security in mind and its design prevents it from being effectively contained by SELinux. Postfix should be used instead.','F-43620r1_fix','Sendmail is not the default mail transfer agent and is not installed by default. The "sendmail" package can be removed with the following command: 

 dpkg -r --force-all sendmail' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000288','C-46231r1_chk','Run the following command to determine if the "sendmail" package is installed: 

 dpkg -s sendmail


If the package is installed, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38672','SV-50473r2_rule','default','low','The netconsole module must be disabled unless required.','The "netconsole" module is not necessary unless there is a need to debug kernel panics, which is not common.','F-43622r2_fix','The "netconsole" kernel module, which logs kernel printk messages over UDP to a syslog server. This allows debugging of problems where disk logging fails and serial consoles are impractical. The "netconsole" module can be disabled with the following commands: 

 rmmod netconsole ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000289','C-46233r1_chk','To check that the "netconsole" module is disabled, run the following command: 

 lsmod | grep netconsole

If output exist check netconsole is enabled on the system, use command:
 dmesg | grep netcon

If Netconsole is already in use, its not recommended to disable netconsole module.

If Netconsole is not in use, but enabled , this is the finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38673','SV-50474r2_rule','default','medium','The operating system must ensure unauthorized, security-relevant configuration changes detected are tracked.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43621r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000307','C-46232r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38674','SV-50475r1_rule','default','medium','X Windows must not be enabled unless required.','Unnecessary services should be disabled to decrease the attack surface of the system.','F-43623r1_fix','To prevent automatic startup of the X server, change the following parameter in /etc/default/grub file:

GRUB_CMDLINE_LINUX="text"
GRUB_TERMINAL=console

and run the following command to update the grub.

 update-grub

To reflect the changes reboot the system.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000290','C-46234r1_chk','To verify x-windows is disable check following parameter in /etc/default/grub file:
GRUB_CMDLINE_LINUX="text"
GRUB_TERMINAL=console

 grep GRUB_CMDLINE_LINUX /etc/default/grub | grep -v "^\s*"

The output should contain "text".

 grep GRUB_TERMINAL /etc/default/grub | grep -v "^\s*"

The output should contain "console"

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38675','SV-50476r2_rule','default','low','Process core dumps must be disabled unless needed.','A core dump includes a memory image taken at the time the operating system terminates an application. The memory image could contain sensitive data and is generally useful only for developers trying to debug problems.','F-43624r1_fix','To disable core dumps for all users, add the following line to "/etc/security/limits.conf": 

* hard core 0' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000308','C-46235r2_chk','To verify that core dumps are disabled for all users, run the following command:

 grep -w core /etc/security/limits.conf /etc/security/limits.d/*.conf --no-messages | grep -v ":\s*"

The output should be:

* hard core 0

If it is not, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38676','SV-50477r2_rule','default','low','The xorg-x11-server-common (X Windows) package must not be installed, unless required.','Unnecessary packages should not be installed to decrease the attack surface of the system.','F-43625r1_fix','Removing all packages which constitute the X Window System ensures users or malicious software cannot start X. To do so, run the following command: 

 apt-get -y purge xserver-common' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000291','C-46236r1_chk','To ensure the X Windows package group is removed, run the following command: 

$ dpkg -s xserver-common

The output should be:

package xserver-common is not installed

If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38677','SV-50478r1_rule','default','high','The NFS server must not have the insecure file locking option enabled.','Allowing insecure file locking could allow for sensitive data to be viewed or edited by an unauthorized user.','F-43626r1_fix','By default the NFS server requires secure file-lock requests, which require credentials from the client in order to lock a file. Most NFS clients send credentials with file lock requests, however, there are a few clients that do not send credentials when requesting a file-lock, allowing the client to only be able to lock world-readable files. To get around this, the "insecure_locks" option can be used so these clients can access the desired export. This poses a security risk by potentially allowing the client access to data for which it does not have authorization. Remove any instances of the "insecure_locks" option from the file "/etc/exports".

Restart NFS service to get changes in effect by using the command:
$ service nfs-kernel-server restart' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000309','C-46239r1_chk','To verify insecure file locking has been disabled, run the following command: 

 grep -w insecure_locks /etc/exports | grep -v "^"

If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38681','SV-50482r2_rule','default','low','All GIDs referenced in /etc/passwd must be defined in /etc/group','Inconsistency in GIDs between /etc/passwd and /etc/group could lead to a user having unintended rights.','F-43630r1_fix','Add a group to the system for each GID referenced without a corresponding group.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000294','C-46243r2_chk','To ensure all GIDs referenced in /etc/passwd are defined in /etc/group, run the following command: 

 pwck -r | grep "no group"

There should be no output. 
If there is output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38682','SV-50483r3_rule','default','medium','The Bluetooth kernel module must be disabled.','If Bluetooth functionality must be disabled, preventing the kernel from loading the kernel module provides an additional safeguard against its activation.','F-43631r3_fix','The kernel"s module loading system can be configured to prevent loading of the Bluetooth module. Add the following to the appropriate "/etc/modprobe.d" configuration file to prevent the loading of the Bluetooth module:(Note: File should have .conf extension.) 

$ install bluetooth /bin/true
$ install net-pf-31 /bin/true

To disable the bluetooth and net-pf-31 module run following command:

$ modprobe -r bluetooth
$ modprobe -r net-pf-31
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000315','C-46244r3_chk','If the system is configured to prevent the loading of the "bluetooth" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr bluetooth /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If the system is configured to prevent the loading of the "net-pf-31" kernel module, it will contain lines inside any file in "/etc/modprobe.d" or the deprecated "/etc/modprobe.conf". These lines instruct the module loading system to run another program upon a module "install" event. Run the following command to search for such lines in all files in "/etc/modprobe.d" and the deprecated "/etc/modprobe.conf":

$ grep -wr net-pf-31 /etc/modprobe.conf /etc/modprobe.d/ | grep -w conf | grep -v ":\s*"

If no line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38683','SV-50484r1_rule','default','low','All accounts on the system must have unique user or account names','Unique usernames allow for accountability on the system.','F-43632r1_fix','Change usernames, or delete accounts, so each has a unique name.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000296','C-46245r1_chk','Run the following command to check for duplicate account names: 

 pwck -rq

If there are no duplicate names, no line will be returned. 
If a line is returned, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38684','SV-50485r2_rule','default','low','The system must limit users to 10 simultaneous system logins, or a site-defined number, in accordance with operational requirements.','Limiting simultaneous user logins can insulate the system from denial of service problems caused by excessive logins. Automated login processes operating improperly or maliciously may result in an exceptional number of simultaneous login sessions.','F-43633r1_fix','Limiting the number of allowed users and sessions per user can limit risks related to denial of service attacks. This addresses concurrent sessions for a single account and does not address concurrent sessions by a single user via multiple accounts. To set the number of concurrent sessions per user add the following line in "/etc/security/limits.conf": 

* hard maxlogins 10

A documented site-defined number may be substituted for 10 in the above.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000319','C-46246r2_chk','Run the following command to ensure the "maxlogins" value is configured for all users on the system:

$ grep -w maxlogins /etc/security/limits.conf /etc/security/limits.d/*.conf --no-messages | grep -v ":\s*"

You should receive output similar to the following:

* hard maxlogins 10

If it is not similar, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38685','SV-50486r1_rule','default','low','Temporary accounts must be provisioned with an expiration date.','When temporary accounts are created, there is a risk they may remain in place and active after the need for them no longer exists. Account expiration greatly reduces the risk of accounts being misused or hijacked.','F-43634r1_fix','In the event temporary accounts are required, configure the system to terminate them after a documented time period. For every temporary account, run the following command to set an expiration date on it, substituting "[]" and "[YYYY-MM-DD]" appropriately: 

 chage -E [YYYY-MM-DD] [USER]

"[YYYY-MM-DD]" indicates the documented expiration date for the account.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000297','C-46247r1_chk','For every temporary account, run the following command to obtain its account aging and expiration information: 

 chage -l []

Verify each of these accounts has an expiration date set as documented. 
If any temporary accounts have no expiration date set or do not expire within a documented time frame, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-43150','SV-55880r2_rule','default','medium','The login user list must be disabled.','Leaving the user list enabled is a security risk since it allows anyone with physical access to the system to quickly enumerate known user accounts without logging in.','F-48722r2_fix','In the default graphical environment, users logging directly into the system are greeted with a login screen that displays all known users. This functionality should be disabled.

Run the following command to disable the user list for gdm display manger:

$  sudo -u gdm -H dbus-launch gsettings set org.gnome.login-screen disable-user-list true

If the display manger is lightdm,  add the disable user list configuration setting in /etc/lightdm/lightdm.conf file like below:

[]
allow-guest=false
greeter-hide-users=true
greeter-show-manual-login=true' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000527','C-49197r4_chk','If the system is NON-GUI based system, this is not applicable

To ensure the user list is disabled, run the following command:

If the display manager is "lightdm", check the disable user list settings under  “/etc/lightdm/lightdm.conf.d�?  directory files or in  “/etc/lightdm/lightdm.conf�? file.

[]
allow-guest=false
greeter-hide-users=true
greeter-show-manual-login=true

If this configuration is not existed, this is a finding.

If the display manger is "gdm" run the following command:

 sudo -u gdm -H gsettings get org.gnome.login-screen banner-message-text

The output should be "true".  If it is not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38688','SV-50489r3_rule','default','medium','A login banner must be displayed immediately prior to, or as part of, graphical desktop environment login prompts.','An appropriate warning message reinforces policy awareness during the logon process and facilitates possible legal action against attackers.','F-43637r2_fix','To enable displaying a login warning banner in the GNOME Display Manager"s login screen, run the following command: 

 sudo -u gdm -H dbus-launch gsettings set org.gnome.login-screen banner-message-enable true

To display a banner, this setting must be enabled and then banner text must also be set.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000324','C-46250r3_chk','If the system is NON-GUI based system, this is not applicable.

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

"I"ve read AND consent to terms in IS user agreem"t."' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000326','C-46252r3_chk','If the system is NON-GUI based system, this is not applicable.

To ensure login warning banner text is properly set, run the following: 

If the display manager is "lightdm", check the banner text settings under "/etc/lightdm/lightdm.conf" file.

[]

greeter-setup-script=/usr/bin/zenity --info –text < banner text >

If this configuration is not existed, this finding.

If the display manger is "gdm" run the following command:

 sudo -u gdm -H gsettings get org.gnome.login-screen banner-message-text

If properly configured, the proper banner text will appear.

If the banner text is not appear in the schema, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38690','SV-50491r1_rule','default','low','Emergency accounts must be provisioned with an expiration date.
','When emergency accounts are created, there is a risk they may remain in place and active after the need for them no longer exists. Account expiration greatly reduces the risk of accounts being misused or hijacked.','F-43639r1_fix','In the event emergency accounts are required, configure the system to terminate them after a documented time period. For every emergency account, run the following command to set an expiration date on it, substituting "[]" and "[YYYY-MM-DD]" appropriately: 

 chage -E [YYYY-MM-DD] [USER]

"[YYYY-MM-DD]" indicates the documented expiration date for the account.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000298','C-46251r1_chk','For every emergency account, run the following command to obtain its account aging and expiration information: 

 chage -l []

Verify each of these accounts has an expiration date set as documented. 
If any emergency accounts have no expiration date set or do not expire within a documented time frame, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38691','SV-50492r2_rule','default','medium','The Bluetooth service must be disabled.','Disabling the "bluetooth" service prevents the system from attempting connections to Bluetooth devices, which entails some security risk. Nevertheless, variation in this risk decision may be expected due to the utility of Bluetooth connectivity and its limited range.','F-43640r1_fix','The "bluetooth" service can be disabled with the following command: 

 sysv-rc-conf bluetooth off


 service bluetooth stop' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000331','C-46253r3_chk','Run the following command to verify "bluetooth" is disabled through current runtime configuration:

 service bluetooth status

If the service is enabled, it should return the following:
bluetooth is running...

To check that the "bluetooth" service is disabled in system boot configuration, run the following command:

 sysv-rc-conf --list bluetooth

Output should indicate the "bluetooth" service has either not been installed or has been disabled at all runlevels, as shown in the example below: 

 sysv-rc-conf --list bluetooth
"bluetooth" 0:off 1:off 2:off 3:off 4:off 5:off 6:off


If the service is configured to run, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38692','SV-50493r1_rule','default','low','Accounts must be locked upon 35 days of inactivity.','Disabling inactive accounts ensures that accounts which may not have been responsibly removed are not available to attackers who may have compromised their credentials.','F-43641r2_fix','To specify the number of days after a password expires (which signifies inactivity) until an account is permanently disabled, add or correct the following lines in "/etc/default/useradd", substituting "[]" appropriately: 

INACTIVE=[NUM_DAYS]

A value of 35 is recommended. If a password is currently on the verge of expiration, then 35 days remain until the account is automatically disabled. However, if the password will not expire for another 60 days, then 95 days could elapse until the account would be automatically disabled. See the "useradd" man page for more information. Determining the inactivity timeout must be done with careful consideration of the length of a "normal" period of inactivity for users in the particular environment. Setting the timeout too low incurs support costs and also has the potential to impact availability of the system to legitimate users.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000334','C-46254r2_chk','To verify the "INACTIVE" setting, run the following command:

$ grep -w "INACTIVE" /etc/default/useradd | grep -v "^\s*"

The output should indicate the "INACTIVE" configuration option is set to an appropriate integer as shown in the example below: 

INACTIVE=35

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38693','SV-50494r2_rule','default','low','The system must require passwords to contain no more than three consecutive repeating characters.','Passwords with excessive repeating characters may be more vulnerable to password-guessing attacks.','F-43642r2_fix','The pam_cracklib module"s "maxrepeat" parameter controls requirements for consecutive repeating characters. When set to a positive number, it will reject passwords which contain more than that number of consecutive characters. Add "maxrepeat=3" after pam_cracklib.so to prevent a run of (3 + 1) or more identical characters. 

password required pam_cracklib.so maxrepeat=3 ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000299','C-46255r1_chk','To check the maximum value for consecutive repeating characters, run the following command: 

$ grep -w pam_cracklib /etc/pam.d/common-password | grep -w requisite | grep -v "^"

Look for the value of the "maxrepeat" parameter. The requirement is 3.
If maxrepeat is not found or not set to the required value, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38694','SV-50495r1_rule','default','low','The operating system must manage information system identifiers for users and devices by disabling the user identifier after an organization defined time period of inactivity.','Disabling inactive accounts ensures that accounts which may not have been responsibly removed are not available to attackers who may have compromised their credentials.','F-43643r2_fix','To specify the number of days after a password expires (which signifies inactivity) until an account is permanently disabled, add or correct the following lines in "/etc/default/useradd", substituting "[]" appropriately: 

INACTIVE=[NUM_DAYS]

A value of 35 is recommended. If a password is currently on the verge of expiration, then 35 days remain until the account is automatically disabled. However, if the password will not expire for another 60 days, then 95 days could elapse until the account would be automatically disabled. See the "useradd" man page for more information. Determining the inactivity timeout must be done with careful consideration of the length of a "normal" period of inactivity for users in the particular environment. Setting the timeout too low incurs support costs and also has the potential to impact availability of the system to legitimate users.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000335','C-46256r1_chk','To verify the "INACTIVE" setting, run the following command: 

grep "INACTIVE" /etc/default/useradd

The output should indicate the "INACTIVE" configuration option is set to an appropriate integer as shown in the example below: 

 grep "INACTIVE" /etc/default/useradd
INACTIVE=35

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38695','SV-50496r2_rule','default','medium','A file integrity tool must be used at least weekly to check for unauthorized file changes, particularly the addition of unauthorized system libraries or binaries, or for unauthorized modification to authorized system libraries or binaries.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43644r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000302','C-46257r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep "aide" /etc/crontab /etc/cron./ | grep "/var/lib/aide/aide.conf.autogenerated" | grep -w nice | grep -v ":\s*"

If there is no output or if aide is not run at least weekly, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38696','SV-50497r2_rule','default','medium','The operating system must employ automated mechanisms, per organization defined frequency, to detect the addition of unauthorized components/devices into the operating system.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43645r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000303','C-46258r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38697','SV-50498r2_rule','default','low','The sticky bit must be set on all public directories.','Failing to set the sticky bit on public directories allows unauthorized users to delete files in the directory structure. 

The only authorized public directories are those temporary directories supplied with the system, or those designed to be temporary file repositories. The setting is normally reserved for directories used by the system, and by users for temporary file storage - such as /tmp - and for directories requiring global read/write access.','F-43646r1_fix','When the so-called "sticky bit" is set on a directory, only the owner of a given file may remove that file from the directory. Without the sticky bit, any user with write access to a directory may remove any file in the directory. Setting the sticky bit prevents users from removing each other"s files. In cases where there is no reason for a directory to be world-writable, a better solution is to remove that permission rather than to set the sticky bit. However, if a directory is used by a particular application, consult that application"s documentation instead of blindly changing modes. 
To set the sticky bit on a world-writable directory [], run the following command: 

 chmod +t [DIR]' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000336','C-46259r4_chk','To find world-writable directories that lack the sticky bit, run the following command for each local partition []: 

 find / -xdev -type d \( -perm -0002 -a ! -perm -1000 \)

If any world-writable directories are missing the sticky bit, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38698','SV-50499r2_rule','default','medium','The operating system must employ automated mechanisms to detect the presence of unauthorized software on organizational information systems and notify designated organizational officials in accordance with the organization defined frequency.','By default, AIDE does not install itself for periodic execution. Periodically running AIDE may reveal unexpected changes in installed files.','F-43647r1_fix','AIDE should be executed on a periodic basis to check for changes. To implement a daily execution of AIDE at 4:05am using cron, add the following line to /etc/crontab: 

05 4 * * * root /usr/sbin/aide --check

AIDE can be executed periodically through other means; this is merely one example.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000304','C-46261r2_chk','To determine that periodic AIDE execution has been scheduled, run the following command: 

 grep aide /etc/crontab /etc/cron.*/*

If there is no output, this is a finding.','Customized rule by Cloud Raxak') from dual;
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
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000338','C-46263r1_chk','Verify "tftp" is configured by inetd super-server daemon with the "-s" option by running the following command:

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
log_ftp_protocol=YES' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000339','C-46264r1_chk','Find if logging is applied to the ftp daemon. 

Procedures: 

If vsftpd is started by xinetd the following command will indicate the xinetd.d startup file. 

 grep vsftpd /etc/xinetd.d/*



 grep server_args []

This will indicate the vsftpd config file used when starting through xinetd. If the [server_args]line is missing or does not include the vsftpd configuration file, then the default config file (/etc/vsftpd.conf) is used. 

 grep xferlog_enable [vsftpd config file]


If xferlog_enable is missing, or is not set to yes, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38474','SV-50274r2_rule','default','low','The system must allow locking of graphical desktop sessions.','The ability to lock graphical desktop sessions manually allows users to easily secure their accounts should they need to depart from their workstations temporarily.','F-43420r1_fix','Run the following command to set the Gnome desktop keybinding for locking the screen to root or login user:

 dbus-launch gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "<Control><Alt>l"

Run the following command to set the Gnome desktop keybinding for locking the screen to global users:

 sudo -u userame -H dbus-launch gsettings set org.gnome.settings-daemon.plugins.media-keys screensaver "<Control><Alt>l"

Another keyboard sequence may be substituted for "<Control><Alt>l", which is the default for the Gnome desktop.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000508','C-46030r2_chk','If the system is NON-GUI based system, this is not applicable.

Verify the keybindings for the Gnome screensaver of root or login user:

 gsettings get org.gnome.settings-daemon.plugins.media-keys screensaver

Verify the keybindings for the Gnome screensaver of global users:

 sudo -u username -H gsettings get org.gnome.settings-daemon.plugins.media-keys screensaver

If no output is visible, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38567','SV-50368r4_rule','default','low','The audit system must be configured to audit all use of setuid and setgid programs.','Privileged programs are subject to escalation-of-privilege attacks, which attempt to subvert their normal role of providing some necessary but limited capability. As such, motivation exists to monitor these programs for unusual activity.','F-43515r6_fix','If auditd service is not installed or auditd service not running, then rule will install and start the auditd service before fixing changes in /etc/audit/audit.rules file.


At a minimum, the audit system should collect the execution of privileged commands for all users and root. To find the relevant setuid / setgid programs, run the following command for each local partition []:

$ sudo find [PART] -xdev -type f -perm /6000 2>/dev/null

Then, for each setuid / setgid program on the system, add a line of the following form to "/etc/audit/audit.rules", where [SETUID_PROG_PATH] is the full path to each setuid / setgid program in the list:

-a always,exit -F path=[SETUID_PROG_PATH] -F perm=x -F auid>=500 -F auid!=4294967295 -k privileged

Now, to get recently added audit rules into effect run the following command:

 auditctl -R /etc/audit/audit.rules
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000198','C-46125r7_chk','If auditd service is not installed or auditd service not running, then rule get failed.

To verify that auditing of privileged command use is configured, run the following command once for each local partition [] to find relevant setuid / setgid programs:

$ sudo find [PART] -xdev -type f -perm /6000 2>/dev/null

Run the following command to verify entries in the audit rules for all programs found with the previous command:

$ sudo grep path /etc/audit/audit.rules

It should be the case that all relevant setuid / setgid programs have a line in the audit rules. If that is not the case, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38443','SV-50243r1_rule','default','medium','The /etc/gshadow file must be owned by root.','The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.','F-43388r1_fix','Run the below command to change the ownership of "/etc/gshadow" to root:

 chown root /etc/gshadow' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000036','C-45998r1_chk','To check the ownership of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/gshadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38445','SV-50245r2_rule','default','medium','Audit log files must be group-owned by root.','If non-privileged users can write to audit logs, audit trails can be modified or destroyed.','F-43390r1_fix','Change the group owner of the audit log files with the following command: 

 chgrp root []' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000522','C-46000r1_chk','Run the following command to check the group owner of the system audit log file(s): 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %G 2>/dev/null

Audit log file(s) must be group-owned by root. 
If they are not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38448','SV-50248r1_rule','default','medium','The /etc/gshadow file must be group-owned by root.','The "/etc/gshadow" file contains group password hashes. Protection of this file is critical for system security.','F-43393r1_fix','To change the group owner of "/etc/gshadow" to root, run the command: 

 chgrp root /etc/gshadow' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000037','C-46003r1_chk','To check the group ownership of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If properly configured, the output should be: File "/etc/gshadow" is group-owned by root.
 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38449','SV-50249r1_rule','default','medium','The /etc/gshadow file must have mode 0000.','The /etc/gshadow file contains group password hashes. Protection of this file is critical for system security.','F-43394r1_fix','To properly set the permissions of "/etc/gshadow", run the command: 

 chmod 0000 /etc/gshadow' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000038','C-46004r1_chk','To check the permissions of "/etc/gshadow", run the command: 

$ ls -l /etc/gshadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38450','SV-50250r1_rule','default','medium','The /etc/passwd file must be owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43395r1_fix','Run the below command to change the ownership of "/etc/passwd" to root:  

 chown root /etc/passwd' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000039','C-46005r1_chk','To check the ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If its properly configured, the output should be displayed as shown below:

"File "/etc/passwd" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38451','SV-50251r1_rule','default','medium','The /etc/passwd file must be group-owned by root.','The "/etc/passwd" file contains information about the users that are configured on the system. Protection of this file is critical for system security.','F-43396r1_fix','To change the group owner of "/etc/passwd" to root, run the command: 

 chgrp root /etc/passwd' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000040','C-46006r1_chk','To check the group ownership of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should be: File "/etc/passwd" is group-owned by root.

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38457','SV-50257r1_rule','default','medium','The /etc/passwd file must have mode 0644 or less permissive.','If the "/etc/passwd" file is writable by a group-owner or the world the risk of its compromise is increased. The file contains the list of accounts on the system and associated information, and protection of this file is critical for system security.','F-43397r1_fix','To properly set the permissions of "/etc/passwd", run the command: 

 chmod 0644 /etc/passwd' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000041','C-46007r1_chk','To check the permissions of "/etc/passwd", run the command: 

$ ls -l /etc/passwd

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38458','SV-50258r1_rule','default','medium','The /etc/group file must be owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43403r1_fix','Run the below command to change the ownership of "/etc/group" to root:
 
 chown root /etc/group' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000042','C-46013r1_chk','To check the ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If its properly configured, the output should be displayed as shown below:

"File "/etc/group" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38459','SV-50259r1_rule','default','medium','The /etc/group file must be group-owned by root.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43404r1_fix','To change the group owner of "/etc/group" to root, run the command: 

 chgrp root /etc/group' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000043','C-46014r1_chk','To check the group ownership of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should be: 

File "/etc/group" is group-owned by root.

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38461','SV-50261r1_rule','default','medium','The /etc/group file must have mode 0644 or less permissive.','The "/etc/group" file contains information regarding groups that are configured on the system. Protection of this file is important for system security.','F-43406r1_fix','To properly set the permissions of "/etc/group", run the command: 

 chmod 644 /etc/group' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000044','C-46015r1_chk','To check the permissions of "/etc/group", run the command: 

$ ls -l /etc/group

If properly configured, the output should indicate the following permissions: "-rw-r--r--" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38465','SV-50265r3_rule','default','medium','Library files must have mode 0755 or less permissive.','Files from shared library directories are loaded into the address space of processes (including privileged ones) or of the kernel itself at runtime. Restrictive permissions are necessary to protect the integrity of the system.','F-43409r2_fix','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

/lib
/lib64
/usr/lib
/usr/lib64

If any file in these directories is found to be group-writable or world-writable, correct its permission with the following command: 

 chmod go-w []' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000045','C-46019r4_chk','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

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

 chown root []' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000046','C-46021r1_chk','System-wide shared library files, which are linked to executables during process load time or run time, are stored in the following directories by default: 

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

 chmod go-w []' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000047','C-46024r3_chk','System executables are stored in the following directories by default: 

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

 chown root [FILE]' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000048','C-46027r1_chk','System executables are stored in the following directories by default: 

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
If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000385','C-46050r1_chk','Run the following command to check the mode of the system audit directories: 

 grep "^log_file" /etc/audit/auditd.conf|sed "s/^[]*//; s/[^/]*$//"|xargs stat -c %a

Audit directories must be mode 0755 or less permissive. 
If any are more permissive, this is a finding.
If auditd package is not installed then rule will fail.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38495','SV-50296r1_rule','default','medium','Audit log files must be owned by root.','If non-privileged users can write to audit logs, audit trails can be modified or destroyed.','F-43443r1_fix','Change the owner of the audit log files with the following command: 

 chown root []
If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000384','C-46053r1_chk','Run the following command to check the owner of the system audit logs: 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %U

Audit logs must be owned by root. 
If they are not, this is a finding.
If auditd package is not installed then rule will get fail.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38498','SV-50299r1_rule','default','medium','Audit log files must have mode 0640 or less permissive.','If users can write to audit logs, audit trails can be modified or destroyed.','F-43445r1_fix','Change the mode of the audit log files with the following command: 

 chmod 0640 []
If auditd package is not installed then rule will install it before fixing changes.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000383','C-46055r1_chk','Run the following command to check the mode of the system audit logs: 

 grep "^log_file" /etc/audit/auditd.conf|sed s/^[]*//|xargs stat -c %a

Audit logs must be mode 0640 or less permissive. 
If any are more permissive, this is a finding.
If auditd package is not installed then rule will fail.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38502','SV-50303r1_rule','default','medium','The /etc/shadow file must be owned by root.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43449r1_fix','Run the below command to change the ownership of "/etc/shadow" to root:

 chown root /etc/shadow' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000033','C-46059r1_chk','To check the ownership of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If its properly configured, the output should be displayed as shown below:

"File "/etc/shadow" is owned by root."

If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38503','SV-50304r1_rule','default','medium','The /etc/shadow file must be group-owned by root.','The "/etc/shadow" file stores password hashes. Protection of this file is critical for system security.','F-43450r1_fix','To change the group owner of "/etc/shadow" to root, run the command: 

 chgrp root /etc/shadow' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000034','C-46060r1_chk','To check the group ownership of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If properly configured, the output should be: File "/etc/shadow" is group-owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38504','SV-50305r1_rule','default','medium','The /etc/shadow file must have mode 0000.','The "/etc/shadow" file contains the list of local system accounts and stores password hashes. Protection of this file is critical for system security. Failure to give ownership of this file to root provides the designated owner with access to sensitive information which could weaken the system security posture.','F-43451r1_fix','To properly set the permissions of "/etc/shadow", run the command: 

 chmod 0000 /etc/shadow' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000035','C-46061r2_chk','To check the permissions of "/etc/shadow", run the command: 

$ ls -l /etc/shadow

If properly configured, the output should indicate the following permissions: "----------" 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38518','SV-50319r2_rule','default','medium','All rsyslog-generated log files must be owned by root.','The log files generated by rsyslog contain valuable information regarding system configuration, user authentication, and other such information. Log files should be protected from unauthorized access.','F-43465r1_fix','All rsyslog-generated log files must be owned by root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s owner:

$ ls -l [LOGFILE]

If the owner is not "root", run the following command to change this:

 chown root [LOGFILE]' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000133','C-46075r2_chk','All rsyslog-generated log files must be owned by root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". To see the owner of a given log file, run the following command:

$ ls -l []

Some log files referenced in /etc/rsyslog.conf may be created by other programs and may require exclusion from consideration. 

If the owner is not root, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38519','SV-50320r2_rule','default','medium','All rsyslog-generated log files must be group-owned by root.','The log files generated by rsyslog contain valuable information regarding system configuration, user authentication, and other such information. Log files should be protected from unauthorized access.','F-43466r1_fix','The group-owner of all log files written by "rsyslog" should be root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s group owner:

$ ls -l [LOGFILE]

If the owner is not "root", run the following command to correct this:

 chgrp root [LOGFILE]' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000134','C-46076r2_chk','The group-owner of all log files written by "rsyslog" should be root. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". To see the group-owner of a given log file, run the following command:

$ ls -l []

Some log files referenced in /etc/rsyslog.conf may be created by other programs and may require exclusion from consideration.

If the group-owner is not root, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38579','SV-50380r1_rule','default','medium','The system boot loader configuration file(s) must be owned by root.','Only root should be able to modify important boot parameters.','F-43527r1_fix','The file "/etc/default/grub" should be owned by the "root" user to prevent destruction or modification of the file. To change the owner of "/etc/default/grub" to root, run the command: 

 chown root /etc/default/grub' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000065','C-46137r1_chk','To check the ownership of "etc/default/grub", run the command:

$ ls -lL /etc/default/grub

If properly configured, the output should be displayed as shown below:

The system boot loader configuration file is owned by root.
 
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38581','SV-50382r1_rule','default','medium','The system boot loader configuration file(s) must be group-owned by root.','The "root" group is a highly-privileged group. Furthermore, the group-owner of this file should not have any access privileges anyway.','F-43529r1_fix','The file "/etc/default/grub" should be group-owned by the "root" group to prevent destruction or modification of the file. To change the group owner of "/etc/default/grub" to root, run the command: 

 chgrp root /etc/default/grub' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000066','C-46139r1_chk','To check the group ownership of "/etc/default/grub", run the command:
$ ls -lL /etc/default/grub

If properly configured, the output should be: The system boot loader configuration file is group owned by root.
If it does not, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38583','SV-50384r2_rule','default','medium','The system boot loader configuration file(s) must have mode 0600 or less permissive.','Proper permissions ensure that only the root user can modify important boot parameters.','F-43531r2_fix','File permissions for "/boot/grub/grub.cfg" should be set to 600, which is the default. To properly set the permissions of "/boot/grub/grub.cfg", run the command:

 chmod 600 /boot/grub/grub.cfg

Boot partitions based on VFAT, NTFS, or other non-standard configurations may require alternative measures.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000067','C-46141r2_chk','To check the permissions of /boot/grub/grub.cfg, run the command:
$ ls -lL /boot/grub/grub.cfg

If properly configured, the output should indicate the following permissions: "-rw-------"
If it does not, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38623','SV-50424r2_rule','default','medium','All rsyslog-generated log files must have mode 0600 or less permissive.','Log files can contain valuable information regarding system configuration. If the system log files are not protected, unauthorized users could change the logged data, eliminating their forensic value.','F-43571r1_fix','All rsyslog-generated log files must have mode 0600 or less permissive. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s permissions:

$ ls -l [LOGFILE]

If the permissions are not 600 or more restrictive, run the following command to correct this:

 chmod 0600 [LOGFILE]' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000135','C-46181r2_chk','All rsyslog-generated log files must have mode 0600 or less permissive. These log files are determined by the second part of each Rule line in "/etc/rsyslog.conf" and typically all appear in "/var/log". For each log file [] referenced in "/etc/rsyslog.conf", run the following command to inspect the file"s permissions: 

$ ls -l [LOGFILE]

The permissions should be 600, or more restrictive. Some log files referenced in /etc/rsyslog.conf may be created by other programs and may require exclusion from consideration.

If the permissions are not correct, this is a finding.','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-38699','SV-50500r2_rule','default','low','All public directories must be owned by a system account.','Allowing a user account to own a world-writable directory is undesirable because it allows the owner of that directory to remove or replace any files that may be placed in the directory by other users.','F-43648r1_fix','All directories in local partitions which are world-writable should be owned by root or another system account. If any world-writable directories are not owned by a system account, this should be investigated. Following this, the files should be deleted or assigned to an appropriate group.' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000337','C-46260r3_chk','The following command will discover and print world-writable directories that are not owned by a system account, given the assumption that only system accounts have a uid lower than 500. Run it once for each local partition []: 

 find / -perm -0002 -type d -uid +999  -print 2>>/dev/null

If there is output, this is a finding.

Note:If there is any output it should be owned by root or another system account. Please fix it manually because that file could be some package or service related or any important directory that user want to share. For fixing either it should be deleted or assigned to an appropriate group.
   ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-51875','SV-66089r1_rule','default','medium','The operating system, upon successful logon/access, must display to the user the number of unsuccessful logon/access attempts since the last successful logon/access.','Users need to be aware of activity that occurs regarding their account. Providing users with information regarding the number of unsuccessful attempts that were made to login to their account allows the user to determine if any unauthorized activity has occurred and gives them an opportunity to notify administrators. ','F-56701r1_fix','To configure the system to notify users of last logon/access using "pam_lastlog", add the following line immediately after "session required pam_limits.so":

session required pam_lastlog.so showfailed' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000372','C-54013r1_chk','To ensure that last logon/access notification is configured correctly, run the following command:

 grep "session\s*required\s*pam_lastlog.so" /etc/pam.d/login | grep -v "^\s*"

The output should show "showfailed". If that is not the case, this is a finding. ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-57569','SV-71919r1_rule','default','medium','The noexec option must be added to the /tmp partition.','Allowing users to execute binaries from world-writable directories such as "/tmp" should never be necessary in normal operation and can expose the system to potential compromise.','F-62639r1_fix','
Add the "noexec" option to the mount option column of "/etc/fstab" for the line which controls mounting of partitions on /tmp.

If there is no /tmp entry in /etc/fstab, then copy the entry from /etc/mtab paste in /etc/fstab and then add "noexec" option in the mount option column of the entry.

[]
   ' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000528','C-58279r1_chk','
To verify that binaries cannot be directly executed from /tmp partition, run the following command:

 grep -w "/tmp" /etc/mtab /etc/fstab | grep -v "^"

The output should show "noexec" in use.
If it does not, this is a finding.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-58901','SV-73331r1_rule','default','medium','The sudo command must require authentication.','The "sudo" command allows authorized users to run programs (including shells) as other users, system users, and root. The "/etc/sudoers" file is used to configure authorized "sudo" users as well as the programs they are allowed to run. Some configuration options in the "/etc/sudoers" file allow configured users to run programs without re-authenticating. Use of these configuration options makes it easier for one compromised account to be used to compromise other accounts.','F-64285r1_fix','Update the "/etc/sudoers" or other sudo configuration files from using the "NOPASSWD" and "!authenticate" options to "PASSWD" and "authenticate" respectively.

 visudo -f []' , '[debian-based Linux] DISA - Mission Critical Classified (Subset)','Profile Customized by CloudRaxak','RHEL-06-000529','C-59747r1_chk','Verify neither the "NOPASSWD" option nor the "!authenticate" option is configured for use in "/etc/sudoers" and associated files. Note that the "include" and "includedir" directives may be used to include configuration data from locations other than the defaults enumerated here.

 egrep "^[]*NOPASSWD" /etc/sudoers /etc/sudoers.d/*
 egrep "^[^]*!authenticate" /etc/sudoers /etc/sudoers.d/*

If the "NOPASSWD" or "!authenticate" options are configured for use in "/etc/sudoers" or associated files, this is a finding.','Customized rule by Cloud Raxak') from dual;
