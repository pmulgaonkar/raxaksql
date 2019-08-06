select add_profile_data ('[rpm-based Linux] PCI for OpenStack Controller' ,'Profile Customized by CloudRaxak' ,'Linux-based OS','' ,'2015-05-26' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','V-55010','SV-50462r1_rule','default','high','Ensure that the security groups are tied to Neutron groups','
    Ensure that security groups are tied to Neutron groups
   ','F-55010','
    Cross check all security groups and compare them with Neutron security groups.
    This must be done manually.
   ' , '[rpm-based Linux] PCI for OpenStack Controller','Profile Customized by CloudRaxak','RHEL-06-000276','','Compare and test all security groups.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-55011','SV-50462r1_rule','default','high','Encrypt all non-console admin access using strong cryptography','Ensure that SSH, VPN, or SSL/TLS access is enabled. ','F-55000','
    OpenStack supports TLS for access from the network edge to external API endpoints.
    Verification:
    Openssl s_client -connect []:[port]

   ' , '[rpm-based Linux] PCI for OpenStack Controller','Profile Customized by CloudRaxak','RHEL-06-000276','','Check that Openssl is enabled.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-55012','SV-50462r1_rule','default','high','Use strong cryptography','HASH(0x7f8e982fe8d8)','F-55012','
    Enable certain ciphers and check if openssl shows this as correctly setup.
   ' , '[rpm-based Linux] PCI for OpenStack Controller','Profile Customized by CloudRaxak','RHEL-06-000276','','
     Check ciphers allowed in ...config/haproxy to ensure that weak ciphers
     such as ECDHA-RSA-AES128-GCM-SHA256 are disallowed
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-55013','SV-50462r1_rule','default','high','
    Check for invalid logical access attempts.
   ','
    Ensure Keystone Auditing is enabled
   ','F-55013','
    Set keystone_enable_auditing=True in ../config/keystone/keystone_deploy_config.yml
   ' , '[rpm-based Linux] PCI for OpenStack Controller','Profile Customized by CloudRaxak','RHEL-06-000276','','Determine if the system is capable of trusted boot.
    ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','V-55014','SV-50462r1_rule','default','high','
    Change user passwords every 90 days
   ','
    User passwords must be changed every 90 days.
   ','F-55014','
    If keystone is configured to use external LDAP server, the password policy is
    inherited from LDAP.
    If not, set the policy in Keystone itself.
   ' , '[rpm-based Linux] PCI for OpenStack Controller','Profile Customized by CloudRaxak','RHEL-06-000276','','Check and report password policies. Is keystone getting
     policies from LDAP? Are they set locally?
    ','Customized rule by Cloud Raxak') from dual;
