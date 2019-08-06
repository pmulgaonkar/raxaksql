select add_profile_data ('Ubuntu','CR-Trusted_Boot --- Boot-TXT for OpenStack Controller','Linux-based OS','' ,'2015-05-26' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-55000','SV-50462r1_rule','default','high','The server must be booted in trusted mode and enrolled in a CIT server','The server must report that it was booted in trusted mode using   tboot. The server must be enrolled with a local CIT server which can  be   queried to ensure that all measured parameters match the expected.   Any tags (such as geo tags) can also be checked.','F-55000','    Ensure that the system boots with tboot (if available) as its default and    that the system is enrolled in a CIT server.   ','Ubuntu','CR-Trusted_Boot --- Boot-TXT for OpenStack Controller','RHEL-06-000276','','Determine if the system is capable of trusted boot.    ','Customized rule by Cloud Raxak') from dual;
