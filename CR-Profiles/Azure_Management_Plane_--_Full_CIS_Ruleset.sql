select add_profile_data ('Azure Management Plane -- Full CIS Ruleset' ,'Profile Customized by CloudRaxak' ,'Azure','' ,'2017-07-28' ,'Profile by Cloud Raxak') from dual;

------ 1 - Identity and Access Management
select add_rule_data ('default','MP-Azure-0001 - 1.1','Az11','default','medium','Multi-factor authentication is enabled for all privileged users.',
'Multi-factor authentication requires an individual to present a minimum of two separate forms of authentication before access is granted. Multi-factor authentication provides additional assurance that the individual attempting to gain access is who they claim to be. With multi-factor authentication, an attacker would need to compromise at least two different authentication mechanisms, increasing the difficulty of compromise and thus reducing the risk.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to All Users 
4.Click on Multi-Factor Authentication button on the top bar 
5.Enabled MULTI-FACTOR AUTH STATUS for all users who are Service Co-Administrators OR Owners OR Contributors.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to All Users 
4.Click on Multi-Factor Authentication button on the top bar 
5.Ensure that MULTI-FACTOR AUTH STATUS is Enabled for all users who are Service Co-Administrators OR Owners OR Contributors.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 1.2','Az12','default','medium','Multi-factor authentication is enabled for all non-privileged users.',
'Multi-factor authentication requires an individual to present a minimum of two separate forms of authentication before access is granted. Multi-factor authentication provides additional assurance that the individual attempting to gain access is who they claim to be. With multi-factor authentication, an attacker would need to compromise at least two different authentication mechanisms, increasing the difficulty of compromise and thus reducing the risk.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to All Users 
4.Click on Multi-Factor Authentication button on the top bar 
5.Ensure that MULTI-FACTOR AUTH STATUS is Enabled for all non-privileged users.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to All Users 
4.Click on Multi-Factor Authentication button on the top bar 
5.Ensure that for all users MULTI-FACTOR AUTH STATUS is Enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 1.3','Az13','default','medium','Ensure that there are no guest users.',
'Azure AD is extended to include Azure AD B2B collaboration allowing you to invite people from outside your organization to be guest users in your cloud account. Until you have a business need to provide guest access to any user, avoid creating such guest users. Guest users are typically added out of your employee on-boarding/off-boarding process and could potentially be lying there unnoticed indefinitely leading to a potential vulnerability.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to All Users 
4.Click on Show drop down and select Guest users only 
5.Delete the Guest users',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory
2.Go to Users and group
3.Go to All Users
4.Click on Show drop down and select Guest users only
5.Ensure that there are no guest users listed USER TYPE eq Guest',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0004 - 1.4','Az14','default','medium','Allow users to remember multi-factor authentication on devices they trust is Disabled.',
'Remembering Multi-Factor Authentication for devices and browsers allows you to give users the option to by-pass MFA for a set number of days after performing a successful sign-in using MFA. This can enhance usability by minimizing the number of times a user may perform two-step verification on the same device. However if an account or device is compromised remembering MFA for trusted devices may affect security. Hence it is recommended that MFA is not bypassed.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to All Users 
4.Click on Multi-Factor Authentication button on the top bar 
5.Click on service settings 
6.Disable Allow users to remember multi-factor authentication on devices they trust',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to All Users 
4.Click on Multi-Factor Authentication button on the top bar 
5.Click on service settings 
6.Ensure that Allow users to remember multi-factor authentication on devices they trust is not enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0005 - 1.5','Az15','default','medium','Number of methods required to reset is set to 2.',
'Like multi-factor authentication setting up dual identification before allowing a password reset ensures that the user identity is confirmed via two separate forms of identification. With dual identification set, an attacker would require compromising both the identity forms before she could maliciously reset a users password.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Password reset 
4.Go to Authentication methods 
5.Set the Number of methods required to reset to 2',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Password reset 
4.Go to Authentication methods 
5.Ensure that Number of methods required to reset is set to 2',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0006 - 1.6','Az16','default','medium','Number of days before users are asked to re-confirm their authentication information is not set to 0.',
'If authentication re-confirmation is disabled registered users will never be prompted to re-confirm their existing authentication information. If the authentication information for a user such as a phone number or email changes, then the password reset information for that user goes to the previously registered authentication information.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Password reset 
4.Go to Registration 
5.Set the Number of days before users are asked to re-confirm their authentication information to your organization defined frequency',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Password reset 
4.Go to Registration 
5.Ensure that Number of days before users are asked to re-confirm their authentication information is not set to 0',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0007 - 1.7','Az17','default','medium','Notify users on password resets is set to Yes.',
'User notification on password reset is a passive way of confirming password reset activity. It helps the user to recognize unauthorized password reset activities.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Password reset 
4.Go to Notification 
5.Set Notify users on password resets to Yes',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Password reset 
4.Go to Notification 
5.Ensure that Notify users on password resets? is set to Yes',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0008 - 1.8','Az18','default','medium','Notify all admins when other admins reset their password is set to Yes.',
'Administrator accounts are sensitive. Any password reset activity notification, when sent to all administrators, ensures that all administrators can passively confirm if such a reset is a common pattern within their group. For example, if all administrators change their password every 30 days, any password reset activity before that may inspect such an activity and confirm.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Password reset 
4.Go to Notification 
5.Set Notify all admins when other admins reset their password? to Yes',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Password reset 
4.Go to Notification 
5.Ensure that Notify all admins when other admins reset their password is set to Yes',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0009 - 1.9','Az19','default','medium','Users can consent to apps accessing company data on their behalf is set to No.',
'Until you are running Azure Active Directory as an identity provider for third-party applications, do not allow users to use the identity outside of your cloud environment. Users profile information contains private information such as phone number and email address which could then be sold off to other third parties without requiring any further consent from the user.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Set Users can consent to apps accessing company data on their behalf to No',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Ensure that Users can consent to apps accessing company data on their behalf is set to No',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0010 - 1.10','Az110','default','medium','Users can add gallery apps to their Access Panel is set to No.',
'Until you are running Azure Active Directory as an identity provider for third-party applications, do not allow users to use the identity outside of your cloud environment. Users profile information contains private information such as phone number and email address which could then be sold off to other third parties without requiring any further consent from the user.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Set Users can add gallery apps to their Access Panel to No',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory
2.Go to Users and group
3.Go to User settings
4.Ensure that Users can add gallery apps to their Access Panel is set to No',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0011 - 1.11','Az111','default','medium','Users can register applications is set to No.',
'It is recommended to let administrator register custom-developed applications. This ensures that the application undergoes a security review before exposing active directory data to it.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Set Users can register applications to No',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Ensure that Users can register applications is set to No',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0012 - 1.12','Az112','default','medium','Guest users permissions are limited is set to Yes.',
'Limiting guest access ensures that the guest accounts do not have permission for certain directory tasks, such as enumerate users, groups or other directory resources, and cannot be assigned to administrative roles in your directory.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Set Guest users permissions are limited to Yes',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Ensure that Guest users permissions are limited is set to Yes',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0013 - 1.13','Az113','default','medium','Members can invite is set to No.',
'Restricting invitation through administrators ensures that only authorized accounts have access to cloud resources. This helps to maintain Need to Know and inadvertent access to data.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Set Members can invite to No',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Ensure that Members can invite is set to No',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0014 - 1.14','Az114','default','medium','Guests can invite is set to No.',
'Restricting invitation through administrators ensures that only authorized accounts have access to cloud resources. This helps to maintain Need to Know and inadvertent access to data.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Set Guests can invite to No',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Ensure that Guests can invite is set to No',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0015 - 1.15','Az115','default','medium','Restrict access to Azure AD administration portal is set to Yes.',
'Azure AD administrative portal has sensitive data. You should restrict all non-administrators from accessing any Azure AD data in the administration portal to avoid exposure.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Set Restrict access to Azure AD administration portal to Yes',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to User settings 
4.Ensure that Restrict access to Azure AD administration portal is set to Yes',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0016 - 1.16','Az116','default','medium','Self-service group management enabled is set to No.',
'Self-service group management enables users to create and manage security groups or Office 365 groups in Azure Active Directory (Azure AD). Until your business requires this day-to-day delegation to some users, it is good to disable self-service group management.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Set Self-service group management enabled to No',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory
2.Go to Users and group
3.Go to Group settings
4.Ensure that Self-service group management enabled is set to No',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0017 - 1.17','Az117','default','medium','Users can create security groups is set to No.',
'When Users can create security groups is enabled, all users in your directory are allowed to create new security groups and add members to these groups. Until your business require this day-to-day delegation, you should restrict security group creation to administrators only.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Set Users can create security groups to No',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Ensure that Users can create security groups is set to No',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0018 - 1.18','Az118','default','medium','Users who can manage security groups is set to None.',
'Restricting security group management to administrators only does not allow users to make changes to security groups. This ensures that security groups are appropriately managed and their management is not delegated to any other user.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Set Users who can manage security groups to None',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Ensure that Users who can manage security groups is set to None',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0019 - 1.19','Az119','default','medium','Users can create Office 365 groups is set to No.',
'Restricting Office 365 group creation to administrators only ensures that there is no proliferation of such groups. Appropriate groups should be created and managed by the administrator and such rights should not be delegated to any other user.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Set Users can create Office 365 groups to No',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Ensure that Users can create Office 365 groups is set to No',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0020 - 1.20','Az120','default','medium','Users who can manage Office 365 groups is set to None.',
'Restricting Office 365 group management to administrators only does not allow users to make changes to Office 365 groups. This ensures that Office 365 groups are appropriately managed and their management is not delegated to any other user.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Set Users who can manage Office 365 groups to None',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Ensure that Users who can manage Office 365 groups is set to None',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0021 - 1.21','Az121','default','medium','Enable "All Users" group is set to Yes.',
'The All Users group can be used to assign the same permissions to all the users in your directory. For example, you can grant all users in your directory access to a SaaS application by assigning access for the All Users dedicated group to this application. This ensures that you can have a common policy created for all users and need not restrict permissions individually.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Set Enable "All Users" group to Yes',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Group settings 
4.Ensure that Enable "All Users" group is set to Yes',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0022 - 1.22','Az122','default','medium','Require Multi-Factor Auth to join devices is set to Yes.',
'Multi-factor authentication is recommended when adding devices to Azure AD. When set to ?Yes? users that are adding devices from the internet must first use the second method of authentication before their device is successfully added to the directory. This ensures that rogue devices are not added to the directory for a compromised user account.',
'F-79758r1_fix',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Device settings 
4.Set Require Multi-Factor Auth to join devices to Yes',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Active Directory 
2.Go to Users and group 
3.Go to Device settings 
4.Ensure that Require Multi-Factor Auth to join devices is set to Yes',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0023 - 1.23','Az123','default','medium','Ensure that no custom subscription owner roles are created.',
'Classic subscription admin roles offer basic access management and include Account Administrator, Service Administrator, and Co-Administrators. It is recommended, to begin with, the least necessary permission, and add permissions as needed by the account holder. This ensures the account holder cannot perform actions which were not intended.',
'F-79758r1_fix',
'Verify the usage and impact of removing the role identified: az role definition delete --name "rolename"',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'Verify the usage and impact of removing the role identified: az role definition list',
'Customized rule by Cloud Raxak') from dual;


------ 2 -  Security Center
select add_rule_data ('default','MP-Azure-0001 - 2.1','Az21','default','medium','Ensure that Standard pricing tier is selected.',
'Standard pricing tier enables threat detection for networks and virtual machines, providing threat intelligence, anomaly detection, and behavior analytics in Azure Security Center.Enabling the Standard pricing tier allows for further defense in depth, with threat detection provided by the Microsoft Security Response Center (MSRC).',
'F-79758r1_fix',
'1. Go to Azure Security Center  
2. Select Security policy blade  
3. Click on Edit Settings on the subscription to alter  
4. Select the Pricing tier blade  
5. Select "Standard"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1. Go to Azure Security Center  
2. Select Security policy blade  
3. Click on Edit Settings on the subscription to alter  
4. Select the Pricing tier blade  
5. Review the chosen pricing tier',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 2.2','Az22','default','medium','Automatic provisioning of monitoring agent is set to "On".',
'When Automatic provisioning of monitoring agent is turned on, Azure Security Center provisions the Microsoft Monitoring Agent on all existing supported Azure virtual machines and any new ones that are created. The Microsoft Monitoring agent scans for various security-related configurations and events such as system updates, OS vulnerabilities, and endpoint protection and provides alerts.',
'F-79758r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Data Collection  
5. Set Automatic provisioning to On  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Data Collection  
5. Ensure that Automatic provisioning is set to On',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 2.3','Az23','default','medium','System updates is set to "On".',
'When this setting is enabled, it retrieves a daily list of available security and critical updates from Windows Update or Windows Server Update Services. The retrieved list depends on the service thats configured for that virtual machine and recommends that the missing updates be applied. For Linux systems, the policy uses the distro-provided package management system to determine packages that have available updates. It also checks for security and critical updates from Azure Cloud Services virtual machines.',
'F-79759r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set System updates to On  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000041',
'C-73421r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that System updates is set to On',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0004 - 2.4','Az24','default','medium','Security Configurations is set to "On".',
'When this setting is enabled, it analyzes operating system configurations daily to determine issues that could make the virtual machine vulnerable to attack. The policy also recommends configuration changes to address these vulnerabilities.',
'F-79760r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security Policy  
5. Set Security Configurations to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000042',
'C-73422r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security Policy  
5. Ensure that Security Configurations is set to "On"',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0005 - 2.5','Az25','default','medium','Endpoint protection is set to "On".',
'When this setting is enabled, it recommends endpoint protection be provisioned for all Windows virtual machines to help identify and remove viruses, spyware, and other malicious software.',
'F-79761r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set Endpoint protection to "On" 
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000043',
'C-73423r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that Endpoint protection is set to "On"',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0006 - 2.6','Az26','default','medium','Disk encryption is set to "On".',
'When this setting is enabled, it recommends enabling disk encryption in all virtual machines to enhance data protection at rest.',
'F-79724r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set Disk encryption to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000044',
'C-73419r1_chk',
'1. Go to Security Center 
2. Click on Security Policy 
3. Click on the Subscription  
4. Click on Security policy 
5. Ensure that Disk encryption is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0007 - 2.7','Az27','default','medium','Network security groups is set to "On".',
'When this setting is enabled, it recommends that network security groups be configured to control inbound and outbound traffic to VMs that have public endpoints. Network security groups that are configured for a subnet is inherited by all virtual machine network interfaces unless otherwise specified. In addition to checking that a network security group has been configured, this policy assesses inbound security rules to identify rules that allow incoming traffic.',
'F-79763r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set Network security groups to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000045',
'C-73425r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that Network security groups is set to "On"',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0008 - 2.8','Az28','default','medium','Web application firewall is set to "On".',
'When this setting is enabled, it recommends that a web application firewall is provisioned on virtual machines.',
'F-79764r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set Web application firewall to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000046',
'C-73426r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that Web application firewall is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0009 - 2.9','Az29','default','medium','Next generation firewall is set to "On".',
'When this setting is enabled, it extends network protections beyond network security groups, which are built into Azure. Security Center will discover deployments for which a next generation firewall is recommended and enable you to provision a virtual appliance.',
'F-79727r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set Next generation firewall to "On" 
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000047',
'C-73419r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that Next generation firewall is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0010 - 2.10','Az210','default','medium','Vulnerability assessment is set to "On".',
'When this setting is enabled, it recommends that you install a vulnerability assessment solution on your VM.',
'F-79766r1_fix',
'1. Go to Security Center 
2. Click on Security Policy 
3. Click on the Subscription  
4. Click on Security policy 
5. Set Vulnerability assessment to "On"
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000048',
'C-73428r1_chk',
'1. Go to Security Center 
2. Click on Security Policy 
3. Click on the Subscription  
4. Click on Security policy 
5. Ensure that Vulnerability assessment is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0011 - 2.11','Az211','default','medium','Storage Encryption is set to "On".',
'When this setting is enabled, any new data in Azure Blobs and Files will be encrypted.',
'F-79767r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set Storage Encryption to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000049',
'C-73429r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that Storage Encryption is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0012 - 2.12','Az212','default','medium','JIT Network Access is set to "On".',
'When this setting is enabled, it Security Center locks down inbound traffic to your Azure VMs by creating an NSG rule. You select the ports on the VM to which inbound traffic should be locked down. Just in time virtual machine (VM) access can be used to lock down inbound traffic to your Azure VMs, reducing exposure to attacks while providing easy access to connect to VMs when needed.',
'F-79768r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set JIT Network Access to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000050',
'C-73430r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that JIT Network Access is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0013 - 2.13','Az213','default','medium','Adaptive Application Controls is set to "On".',
'Adaptive application controls help control which applications can run on your VMs located in Azure, which among other benefits helps harden your VMs against malware. Security Center uses machine learning to analyze the processes running in the VM and helps you apply whitelisting rules using this intelligence.',
'F-79769r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set Adaptive Application Controls to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000051',
'C-73431r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that Adaptive Application Controls is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0014 - 2.14','Az214','default','medium','SQL auditing and Threat detection is set to "On".',
'When this setting is enabled, it recommends that auditing of access to Azure Database be enabled for compliance and also advanced threat detection, for investigation purposes.',
'F-79770r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set SQL auditing and Threat detection to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000051',
'C-73432r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that SQL auditing and Threat detection is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0015 - 2.15','Az215','default','medium','SQL Encryption is set to "On".',
'When this setting is enabled, it recommends that encryption at rest be enabled for your Azure SQL Database, associated backups, and transaction log files. Even if your data is breached, it will not be readable.',
'F-79778r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Set SQL Encryption to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000052',
'C-73433r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on the Subscription  
4. Click on Security policy  
5. Ensure that SQL Encryption is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0016 - 2.16','Az216','default','medium','Security contact emails is set or configured.',
'Microsoft reaches out to the provided security contact in case its security team finds that your resources are compromised. This ensures that you are aware of any potential compromise and you can timely mitigate the risk.',
'F-79779r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Email Notifications  
5. Set a valid Security Email Id  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000053',
'C-73434r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Email Notifications  
5. Ensure that valid security Email ID is set or configured.',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0017 - 2.17','Az217','default','medium','Security contact Phone number is set or configured.',
'Microsoft reaches out to the provided security contact in case its security team finds that your resources are compromised. This ensures that you are aware of any potential compromise and you can timely mitigate the risk.',
'F-79780r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Email Notifications  
5. Set a valid security contact Phone number  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000054',
'C-73435r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Email Notifications  
5. Ensure that a valid security contact Phone number is set or configured.',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0018 - 2.18','Az218','default','medium','Send me emails about alerts is set to "On".',
'Enabling security alerts emailing ensures that you receive the security alert emails from Microsoft. This ensures that you are aware of any potential security issues and you can timely mitigate the risk.',
'F-79781r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Email Notifications  
5. Set Send me emails about alerts to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000055',
'C-73436r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Email Notifications  
5. Ensure that Send me emails about alerts is set to "On"',
'Customized rule by Cloud Raxak') from dual;


select add_rule_data ('default','MP-Azure-0019 - 2.19','Az219','default','medium','Send email also to subscription owners is set to "On".',
'Enabling security alerts emailing to subscription owners ensures that they receive the security alert emails from Microsoft. This ensures that they are aware of any potential security issues and can timely mitigate the risk.',
'F-79782r1_fix',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Email Notifications  
5. Set Send email also to subscription owners to "On"  
6. Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000056',
'C-73437r1_chk',
'1. Go to Security Center  
2. Click on Security Policy  
3. Click on Edit Settings on the subscription to alter  
4. Click on Email Notifications  
5. Ensure that Send email also to subscription owners is set to "On"',
'Customized rule by Cloud Raxak') from dual;


------ 3 - Storage Accounts
select add_rule_data ('default','MP-Azure-0001 - 3.1','Az31','default','medium','Secure transfer required is set to Enabled.',
'The secure transfer option enhances the security of your storage account by only allowing requests to the storage account by a secure connection. For example, when calling REST APIs to access your storage accounts, you must connect using HTTPs. Any requests using HTTP will be rejected when secure transfer required is enabled. When you are using the Azure files service, connection without encryption will fail, including scenarios using SMB 2.1, SMB 3.0 without encryption, and some flavors of the Linux SMB client. Because Azure storage doesnt support HTTPs for custom domain names, this option is not applied when using a custom domain name.',
'F-79783r1_fix',
'1.Go to Storage Accounts 
2.For each storage account, go to Configuration 
3.Set Secure transfer required to Enabled',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000057',
'C-73438r1_chk',
'1.Go to Storage Accounts 
2.For each storage account, go to Configuration 
3.Ensure that Secure transfer required is set to Enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 3.2','Az32','default','medium','Storage service encryption is set to Enabled for Blob Service.',
'Storage service encryption protects your data at rest. Azure Storage encrypts your data as its written in its datacenters, and automatically decrypts it for you as you access it.',
'F-79784r1_fix',
'1.Go to Storage Accounts 
2.For each storage account, go to Encryption under BLOB SERVICE 
3.Set Storage service encryption to Enabled',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000058',
'C-73439r1_chk',
'1.Go to Storage Accounts 
2.For each storage account, go to Encryption under BLOB SERVICE 
3.Ensure that Storage service encryption is set to Enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 3.3','Az33','default','medium','Storage account access keys are periodically regenerated.',
'When you create a storage account, Azure generates two 512-bit storage access keys, which are used for authentication when the storage account is accessed. Rotating these keys periodically ensures that any inadvertent access or exposure to these keys could be undermined.',
'F-79758r1_fix',
'Follow Microsoft Azure documentation for regenerating your storage account access keys.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Storage Accounts 
2.For each storage account, go to Activity log 
3.Under Timespan drop-down, select Custom and choose Start time and End time such that it ranges 90 days 
4.Enter RegenerateKey in the Search text box 
5.Click Apply',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0004 - 3.4','Az34','default','medium','Shared access signature tokens expire within an hour.',
'A shared access signature (SAS) is a URI that grants restricted access rights to Azure Storage resources. You can provide a shared access signature to clients who should not be trusted with your storage account key but whom you wish to delegate access to certain storage account resources. By distributing a shared access signature URI to these clients, you grant them access to a resource for a specified period of time. This time should be set to as low as possible and preferably should be within an hour.',
'F-79758r1_fix',
'When generating shared access signature tokens, use start and end time such that it falls within an hour.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'You cannot currently audit SAS token expiry times created historically. Until Microsoft makes token expiry time as a setting rather than a token creation parameter, this recommendation would require a manual verification.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0005 - 3.5','Az35','default','medium','Shared access signature tokens are allowed only over https.',
'A shared access signature (SAS) is a URI that grants restricted access rights to Azure Storage resources. You can provide a shared access signature to clients who should not be trusted with your storage account key but whom you wish to delegate access to certain storage account resources. By distributing a shared access signature URI to these clients, you grant them access to a resource for a specified period of time. It is recommended to allow such access requests over https protocol only.',
'F-79758r1_fix',
'1.Go to Storage Accounts 
2.For each storage account, go to Shared access signature 
3.Set Allowed protocols to HTTPS only',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'You cannot currently audit SAS token expiry times created historically. Until Microsoft makes token expiry time as a setting rather than a token creation parameter, this recommendation would require a manual verification.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0006 - 3.6','Az36','default','medium','Storage service encryption is set to Enabled for File Service.',
'Storage service encryption protects your data at rest. Azure Storage encrypts your data as its written in its datacenters, and automatically decrypts it for you as you access it.',
'F-79785r1_fix',
'1.Go to Storage Accounts 
2.For each storage account, go to Encryption under FILE SERVICE 
3.Set Storage service encryption to Enabled',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000059',
'C-73440r1_chk',
'1.Go to Storage Accounts 
2.For each storage account, go to Encryption under FILE SERVICE 
3.Ensure that Storage service encryption is set to Enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0007 - 3.7','Az37','default','medium','Public access level is set to Private for blob containers.',
'You can enable anonymous, public read access to a container and its blobs in Azure Blob storage. By doing so, you can grant read-only access to these resources without sharing your account key, and without requiring a shared access signature. It is recommended to not provide anonymous access to blob containers until and unless it is strongly desired. You should use shared access signature token for providing controlled and timed access to blob containers.',
'F-79758r1_fix',
'1.Go to Storage Accounts 
2.For each storage account, go to Containers under BLOB SERVICE 
3.For each container, click Access policy 
4.Set Public access level to Private (no anonymous access)',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Storage Accounts 
2.For each storage account, go to Containers under BLOB SERVICE 
3.For each container, click Access policy 
4.Ensure that Public access level is set to Private (no anonymous access)',
'Customized rule by Cloud Raxak') from dual;


------ 4.1 - SQL Servers
select add_rule_data ('default','MP-Azure-0001 - 4.1.1','Az411','default','medium','Auditing is set to On.',
'The Azure platform allows you to create a SQL server as a service. Enabling auditing at the server level ensures that all existing and newly created databases on the SQL server instance are audited.',
'F-79758r1_fix',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Set Auditing to On',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Ensure that Auditing is set to On',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 4.1.2','Az412','default','medium','Threat Detection is set to On.',
'SQL Threat Detection provides a new layer of security, which enables customers to detect and respond to potential threats as they occur by providing security alerts on anomalous activities. Users will receive an alert upon suspicious database activities, potential vulnerabilities, and SQL injection attacks, as well as anomalous database access patterns. SQL Threat Detection alerts provide details of suspicious activity and recommend action on how to investigate and mitigate the threat.',
'F-79758r1_fix',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Set Threat Detection to On',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Ensure that Threat Detection is set to On',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 4.1.3','Az413','default','medium','Threat Detection types is set to All.',
'Enabling all threat detection types, you are protected against SQL injection, database vulnerabilities and any other anomalous activities.',
'F-79758r1_fix',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Set Threat Detection types to All',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Ensure that Threat Detection types is set to All',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0004 - 4.1.4','Az414','default','medium','Send alerts to is set.',
'Providing the email address to receive alerts ensures that any detection of anomalous activities is reported as soon as possible, making it more likely to mitigate any potential risk sooner.',
'F-79758r1_fix',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Set Send alerts to as appropriate',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Ensure that Send alerts to is set as appropriate',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0005 - 4.1.5','Az415','default','medium','Email service and co-administrators is Enabled.',
'Providing the email address to receive alerts ensures that any detection of anomalous activities is reported as soon as possible, making it more likely to mitigate any potential risk sooner.',
'F-79758r1_fix',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Enable Email service and co-administrators',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Ensure that Email service and co-administrators is set Enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0006 - 4.1.6','Az416','default','medium','Auditing Retention is greater than 90 days.',
'Audit Logs can be used to check for anomalies and give insight into suspected breaches or misuse of information and access.',
'F-79758r1_fix',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection 
4.Select Storage Details 
5.Set Retention (days) setting greater than 90 days 
6.Select OK 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.Select Storage Details 
5.Ensure Retention (days) setting greater than 90 days',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0007 - 4.1.7','Az417','default','medium','Threat Detection Retention is greater than 90 days.',
'Threat Detection Logs can be used to check for suspected attack attempts and breaches on a SQL server with known attack signatures.',
'F-79758r1_fix',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection 
4.In Threat Detection Section, Set Retention (days) setting greater than 90 days 
5.Click OK 
6.Click Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to SQL servers 
2.For each server instance 
3.Click on Auditing and Threat Detection
4.In Threat Detection Section, Ensure Retention (days) setting greater than 90 days',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0008 - 4.1.8','Az418','default','medium','Azure Active Directory Admin is configured.',
'Azure Active Directory authentication is a mechanism of connecting to Microsoft Azure SQL Database and SQL Data Warehouse by using identities in Azure Active Directory (Azure AD). With Azure AD authentication, you can centrally manage the identities of database users and other Microsoft services in one central location. Central ID management provides a single place to manage database users and simplifies permission management.',
'F-79758r1_fix',
'1.Go to SQL servers 
2.For each SQL server, click on Active Directory admin 
3.Click on Set admin 
4.Select an admin 
5.Click Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to SQL servers 
2.For each SQL server, click on Active Directory admin 
3.Ensure that an AD account has been populated for field Active Directory admin',
'Customized rule by Cloud Raxak') from dual;


------ 4.2 - SQL Database
select add_rule_data ('default','MP-Azure-0001 - 4.2.1','Az421','default','medium','Auditing is set to "On" on SQL Databases.',
'Auditing tracks database events and writes them to an audit log in your Azure storage account. It also helps you to maintain regulatory compliance, understand database activity, and gain insight into discrepancies and anomalies that could indicate business concerns or suspected security violations.',
'F-79787r1_fix',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Set Auditing to On',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000061',
'C-73442r1_chk',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Ensure that Auditing is set to On',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 4.2.2','Az422','default','medium','Threat Detection is set to "On" on SQL Databases.',
'SQL Threat Detection provides a new layer of security, which enables customers to detect and respond to potential threats as they occur by providing security alerts on anomalous activities. Users will receive an alert upon suspicious database activities, potential vulnerabilities, and SQL injection attacks, as well as anomalous database access patterns. SQL Threat Detection alerts provide details of suspicious activity and recommend action on how to investigate and mitigate the threat.',
'F-79788r1_fix',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Set Threat Detection to On',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000062',
'C-73443r1_chk',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Ensure that Threat Detection is set to On',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 4.2.3','Az423','default','medium','Threat Detection types is set to "All" on SQL Databases.',
'Enabling all threat detection types, you are protected against SQL injection, database vulnerabilities and any other anomalous activities..',
'F-79789r1_fix',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Set Threat Detection types to All',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000063',
'C-73444r1_chk',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Ensure that Threat Detection types is set to All',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0004 - 4.2.4','Az424','default','medium','Send alerts to is set/configured on SQL Databases.',
'Providing the email address to receive alerts ensures that any detection of anomalous activities is reported as soon as possible, making it more likely to mitigate any potential risk sooner.',
'F-79790r1_fix',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Set Send alerts to as appropriate',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000064',
'C-73445r1_chk',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Ensure that Send alerts to is set as appropriate',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0005 - 4.2.5','Az425','default','medium','Email service and co-administrators is "enabled" on SQL Databases.',
'Providing the email address to receive alerts ensures that any detection of anomalous activities is reported as soon as possible, making it more likely to mitigate any potential risk sooner.',
'F-79791r1_fix',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Enable Email service and co-administrators',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000065',
'C-73446r1_chk',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Ensure that Email service and co-administrators is enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0006 - 4.2.6','Az426','default','medium','Data encryption is set to "ON"" on SQL Databases.',
'Azure SQL Database transparent data encryption helps protect against the threat of malicious activity by performing real-time encryption and decryption of the database, associated backups, and transaction log files at rest without requiring changes to the application.',
'F-79792r1_fix',
'1.Go to SQL databases 
2.For each database 
3.Click on Transparent data encryption
4.Set Data encryption to ON',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000066',
'C-734147r1_chk',
'1.Go to SQL databases 
2.For each database 
3.Click on Transparent data encryption
4.Ensure that Data encryption is set to ON',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0007 - 4.2.7','Az427','default','medium','Auditing Retention is greater than 90 days on SQL Databases.',
'Audit Logs can be used to check for anomalies and give insight into suspected breaches or misuse of information and access.',
'F-79793r1_fix',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Ensure that Auditing Retention is greater than 90 days',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000067',
'C-73448r1_chk',
'1.Go to SQL databases 
2.For each database 
3.Click on Auditing and Threat Detection 
4.Select Storage Details 
5.Set Retention (days) setting greater than 90 days
6.Select OK 
7.Select Save',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0008 - 4.2.8','Az428','default','medium','Threat Retention is greater than 90 days on SQL Databases.',
'Threat Logs can be used to check for anomalies and give insight into suspected breaches or misuse of information and access.',
'F-79794r1_fix',
'Use the below Azure Cli command to set SQL Databases Threat Detection retention days to more than 90 days:- 
"az sql db threat-policy update --resource-group <resourceGroupName> --server <serverName> --name <dbName> --retention-days <numberOfDays>"',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000068',
'C-73449r1_chk',
'Use the below Azure Cli command to set SQL Databases Threat Detection retention days to more than 90 days:- 
"az sql db threat-policy show --resource-group <resourceGroup> --server <serverName> --name <dbName> --query retentionDays"',
'Customized rule by Cloud Raxak') from dual;


------ 5 - Logging and Monitoring
select add_rule_data ('default','MP-Azure-0001 - 5.1','Az51','default','medium','Log Profile exists.',
'A Log Profile controls how your Activity Log is exported. By default, activity logs are retained only for 90 days. It is thus recommended to define a log profile using which you could export the logs and store them for a longer duration for analyzing security activities within your Azure subscription.',
'F-79795r1_fix',
'1.Go to Activity log 
2.Click on Export 
3.Configure the setting 
4.Click on Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000069',
'C-73450r1_chk',
'1.Go to Activity log 
2.Ensure that a Log Profile is set',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 5.2','Az52','default','medium','Activity Log Retention is set 365 days or greater',
'A Log Profile controls how your Activity Log is exported and retained. Since the average time to detect a breach is 210 days, it is recommended to retain your activity log for 365 days or more in order to have time to respond to any incidents.',
'F-79796r1_fix',
'1.Go to Activity log 
2.Select Export 
3.Set Retention (days) is set to 365 or greater 
4.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000070',
'C-73451r1_chk',
'1.Go to Activity log 
2.Select Export 
3.Ensure Retention (days) is set to 365 or greater',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 5.3','Az53','default','medium','Activity Log Alert exists for Create Policy Assignment.',
'Monitoring for Create Policy Assignment gives insight into privilege assignment and may reduce the time it takes to detect a breach or misuse of information.',
'F-79797r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Create Policy Assignment 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000071',
'C-73452r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Create Policy Assignment',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0004 - 5.4','Az54','default','medium','Activity Log Alert exists for Create or Update Network Security Group.',
'Monitoring for Create or Update Network Security Group events gives insight network access changes and may reduce the time it takes to detect suspicious activity..',
'F-79798r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Create or Update Network Security Group 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000072',
'C-73453r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Create or Update Network Security Group',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0005 - 5.5','Az55','default','medium','Activity Log Alert exists for Delete Network Security Group.',
'Monitoring for Delete Network Security Group events gives insight network access changes and may reduce the time it takes to detect suspicious activity.',
'F-79799r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Delete Network Security Group 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000073',
'C-73454r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Delete Network Security Group',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0006 - 5.6','Az56','default','medium','Activity Log Alert exists for Create or Update Network Security Group Rule.',
'DESCRIPTION.',
'F-79800r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Create or Update Network Security Group 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000074',
'C-73455r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Create or Update Network Security Group',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0007 - 5.7','Az57','default','medium','Activity Log Alert exists for Delete Security Rule.',
'DESCRIPTION.',
'F-79801r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Delete Security Rule 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000075',
'C-73456r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Delete Security Rule',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0008 - 5.8','Az58','default','medium','Activity Log Alert exists for Create or Update Security Solution.',
'DESCRIPTION.',
'F-79802r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Create or Update Security Solution 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000076',
'C-73457r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Create or Update Security Solution',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0009 - 5.9','Az59','default','medium','Activity Log Alert exists for Delete Security Solution.',
'DESCRIPTION.',
'F-79803r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Delete Security Solution 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000077',
'C-73458r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Delete Security Solution',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0010 - 5.10','Az510','default','medium','Activity Log Alert exists for Create or Update SQL Server Firewall Rule.',
'DESCRIPTION.',
'F-79804r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Create or Update SQL Server Firewall  
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000078',
'C-73459r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Create or Update SQL Server Firewall',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0011 - 5.11','Az511','default','medium','Activity Log Alert exists for Delete SQL Server Firewall Rule.',
'DESCRIPTION.',
'F-79805r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Delete SQL Server Firewall Rule 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000079',
'C-73460r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Delete SQL Server Firewall Rule',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0012 - 5.12','Az512','default','medium','Activity Log Alert exists for Update Security Policy.',
'DESCRIPTION.',
'F-79806r1_fix',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Set a name, subscription, and resource group in which to store activity log alerts 
4.Select Event category Administrative 
5.Select Operation name Update Security Policy 
6.Set a subscription and action group for alerts 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000080',
'C-73461r1_chk',
'1.Go to Alerts 
2.Select Add activity log alert 
3.Check for Activity Log Alert for Operation name Update Security Policy',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0013 - 5.13','Az513','default','medium','Logging for Azure KeyVault is Enabled.',
'Enable AuditEvent logging for Key Vault instances to ensure interactions with key vaults are logged and available',
'F-79758r1_fix',
'Follow Microsoft Azure documentation and setup Azure Key Vault Logging.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Key vaults 
2.For each Key vault 
3.Go to Diagnostic Logs 
4.Click on Edit Settings 
5.Ensure that Archive to a storage account is Enabled 
6.Ensure that AuditEvent is checked and the retention days is set to 180 days or as appropriate',
'Customized rule by Cloud Raxak') from dual;


------ 6 - Networking
select add_rule_data ('default','MP-Azure-0001 - 6.1','Az61','default','medium','Disable RDP access on Network Security Groups from Internet.',
'The potential security problem with using RDP over the Internet is that attackers can use various brute force techniques to gain access to Azure Virtual Machines. Once the attackers gain access, they can use your virtual machine as a launch point for compromising other machines on your Azure Virtual Network or even attack networked devices outside of Azure.',
'F-79807r1_fix',
'1.Disable direct RDP access to your Azure Virtual Machines from the Internet
2.After direct RDP access from the Internet is disabled, you have other options you can use to access these virtual machines for remote management:
a.Point-to-site VPN
b.Site-to-site VPN
c.ExpressRoute',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000081',
'C-73462r1_chk',
'1.Open the Networking blade for the specific Virtual machine in Azure portal 
2.Verify that the INBOUND PORT RULES does not have a rule for RDP such as:
port = 3389, 
protocol = TCP, 
Source = Any OR Internet',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 6.2','Az62','default','medium','Disable SSH access on Network Security Groups from Internet.',
'The potential security problem with using SSH over the Internet is that attackers can use various brute force techniques to gain access to Azure Virtual Machines. Once the attackers gain access, they can use your virtual machine as a launch point for compromising other machines on your Azure Virtual Network or even attack networked devices outside of Azure.',
'F-79807r1_fix',
'1.Disable direct SSH access to your Azure Virtual Machines from the Internet
2.After direct SSH access from the Internet is disabled, you have other options you can use to access these virtual machines for remote management:
a.Point-to-site VPN 
b.Site-to-site VPN 
c.ExpressRoute',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000081',
'C-73462r1_chk',
'1.Open the Networking blade for the specific Virtual machine in Azure portal 
2.Verify that the INBOUND PORT RULES does not have a rule for SSH such as:
port = 22, 
protocol = TCP, 
Source = Any OR Internet',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 6.3','Az63','default','medium','SQL server access is restricted from the internet.',
'SQL Database includes a firewall to block access to unauthorized connections. After creating your SQL Database, you can specify which IP addresses can connect to your database. You can then define more granular IP addresses by referencing the range of addresses available from specific datacenters.
Allowing ingress for the IP range 0.0.0.0/0 (StartIp of 0.0.0.0 and EndIP of 0.0.0.0) allows open access to any/all traffic potentially making the SQL Database vulnerable to attacks.',
'F-79807r1_fix',
'1.Go to SQL databases 
2.For each database instance 
3.Click on Set server firewall 
4.Server Firewall / Virtual Networks blade opens 
5.Delete the firewall rules which has
a.Start IP of 0.0.0.0 
b.and End IP of 0.0.0.0 
c.or other combinations which allow for large public IP ranges',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000081',
'C-73462r1_chk',
'1.Go to SQL databases 
2.For each database instance 
3.Click on Set server firewall 
4.Server Firewall / Virtual Networks blade opens 
5.Review the firewall rules and Ensure that no rule has
a.Start IP of 0.0.0.0 
b.and End IP of 0.0.0.0 
c.or other combinations which allow for large public IP ranges',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0004 - 6.4','Az64','default','medium','Network Security Group Flow Log retention period is greater than 90 days.',
'Flow logs enable capturing information about IP traffic flowing in and out of your Network Security Groups. Logs can be used to check for anomalies and give insight into suspected breaches.',
'F-79758r1_fix',
'1.Go to Network Watcher 
2.Select NSG flow logs blade in the Logs section 
3.Select each Network Security Group from the list 
4.Ensure Status is set to On 
5.Ensure Retention (days) setting greater than 90 days 
6.Select your storage account in the Storage account field 
7.Select Save',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Network Watcher 
2.Select NSG flow logs blade in the Logs section 
3.Select each Network Security Group from the list 
4.Ensure Status is set to On 
5.Ensure Retention (days) setting greater than 90 days',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0005 - 6.5','Az65','default','medium','Network Watcher is Enabled.',
'Network diagnostic and visualization tools available with Network Watcher help you understand, diagnose, and gain insights to your network in Azure.',
'F-79758r1_fix',
'1.Go to Network Watcher 
2.Right click on the subscription name and click on Enable network watcher in all regions',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Network Watcher 
2.Ensure that the STATUS is set to Enabled',
'Customized rule by Cloud Raxak') from dual;


------ 7 - Virtual Machines
select add_rule_data ('default','MP-Azure-0001 - 7.1','Az71','default','medium','VM agent is installed.',
'The VM agent must be installed on Azure virtual machines (VMs) in order to enable Azure Security center for data collection. Security Center collects data from your virtual machines (VMs) to assess their security state, provide security recommendations, and alert you to threats.',
'F-79758r1_fix',
'1.Go to Azure Security Center 
2.In the Recommendations blade, select Enable VM Agent 
3.This opens the blade VM Agent Is Missing Or Not Responding 
4.Follow instructions from Azure and install VM agent where missing',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Azure Security Center 
2.In the Recommendations blade, select Enable VM Agent 
3.This opens the blade VM Agent Is Missing Or Not Responding 
4.Review this list and ensure that there are no VMs that are missing the agent',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 7.2','Az72','default','medium','OS disk are encrypted.',
'Encrypting your IaaS VMs OS disk (boot volume) ensures that its entire content is fully unrecoverable without a key and thus protects the volume from unwarranted reads.',
'F-79758r1_fix',
'Use the below command to enable encryption for OS Disk for the specific VM: az vm encryption enable --name <VMName> --resource-group <resourceGroupName> --volume-type OS --aad-client-id <Client ID of AAD app> --aad-client-secret <Client Secret of AAD app> --disk-encryption-keyvault https://<vaultEndpoint>/secrets/<secretName>/<secretVersion>',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'Go to Virtual machines
For each virtual machine, go to Settings
Click on Disks
Ensure that the OS disk has encryption set to Enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 7.3','Az73','default','medium','Data disks are encrypted.',
'Encrypting your IaaS VMs Data disks (non-boot volume) ensures that its entire content is fully unrecoverable without a key and thus protects the volume from unwarranted reads.',
'F-79758r1_fix',
'Use the below command to enable encryption for Data Disk for the specific VM: az vm encryption enable --name <VMName> --resource-group <resourceGroupName> --volume-type DATA --aad-client-id <Client ID of AAD app> --aad-client-secret <Client Secret of AAD app> --disk-encryption-keyvault https://<vaultEndpoint>/secrets/<secretName>/<secretVersion>',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Virtual machines 
2.For each virtual machine, go to Settings 
3.Click on Disks 
4.Ensure that each disk under Data disks has encryption set to Enabled',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0004 - 7.4','Az74','default','medium','Only approved extensions are installed.',
'Azure virtual machine extensions are small applications that provide post-deployment configuration and automation tasks on Azure virtual machines. These extensions run with administrative privileges and could potentially access anything on your virtual machine. Azure portal and community provide several such extensions. Your organization should carefully evaluate such extensions and ensure that only those that are approved for use are actually used.',
'F-79758r1_fix',
'1.Go to Virtual machines 
2.For each virtual machine, go to Settings 
3.Click on Extensions 
4.If there are unapproved extensions, uninstall them.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Virtual machines 
2.For each virtual machine, go to Settings 
3.Click on Extensions 
Ensure that the listed extensions are approved for use.',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0005 - 7.5','Az75','default','medium','Latest OS Patches for all Virtual Machines are applied.',
'Azure Security Center retrieves a list of available security and critical updates from Windows Update or Windows Server Update Services (WSUS), depending on which service is configured on a Windows VM. Security Center also checks for the latest updates in Linux systems. If your VM is missing a system update, Security Center will recommend that you apply system updates.',
'F-79758r1_fix',
'Follow Microsoft Azure documentation to apply security patches from Security Center. Alternatively, you can employ your own patch assessment and management tool to periodically assess, report and install the required security patches for your OS.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Security Center - Recommendations 
2.Ensure that there are no recommendations for Apply system updates',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0006 - 7.6','Az76','default','medium','Endpoint protection for all Virtual Machines is installed.',
'Installing endpoint protection systems (like Antimalware for Azure) provides for real-time protection capability that helps identify and remove viruses, spyware, and other malicious software, with configurable alerts when known malicious or unwanted software attempts to install itself or run on your Azure systems.',
'F-79758r1_fix',
'Follow Microsoft Azure documentation to install endpoint protection from Security Center. Alternatively, you can employ your own endpoint protection tool for your OS.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Security Center - Recommendations 
2.Ensure that there are no recommendations for Endpoint Protection not installed on Azure VMs',
'Customized rule by Cloud Raxak') from dual;


------ 8 - Other Security Considerations
select add_rule_data ('default','MP-Azure-0001 - 8.1','Az81','default','medium','Ensure that the expiry date is set on all Keys.',
'Azure Key Vault enables users to store and use cryptographic keys within the Microsoft Azure environment. The exp (expiration time) attribute identifies the expiration time on or after which the key MUST NOT be used for a cryptographic operation. By default, Keys never expire. It is thus recommended that you rotate your keys in the key vault and set an explicit expiry time for all keys. This ensures that the keys cannot be used beyond their assigned lifetimes.',
'F-79758r1_fix',
'1.Go to Key vaults 
2.For each Key vault, click on Keys 
3.Set an appropriate EXPIRATION DATE on all keys.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Key vaults 
2.For each Key vault, click on Keys 
3.Ensure that each key in the vault has EXPIRATION DATE set as appropriate',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0002 - 8.2','Az82','default','medium','	Ensure that the expiry date is set on all Secrets.',
'Azure Key Vault enables users to store and secrets within the Microsoft Azure environment. Secrets in Azure Key Vault are octet sequences with a maximum size of 25k bytes each. The exp (expiration time) attribute identifies the expiration time on or after which the secret MUST NOT be used. By default, Secrets never expire. It is thus recommended that you rotate your secrets in the key vault and set an explicit expiry time for all secrets. This ensures that the secrets cannot be used beyond their assigned lifetimes.',
'F-79758r1_fix',
'1.Go to Key vaults 
2.For each Key vault, click on Secrets 
3.Set an appropriate EXPIRATION DATE on all secrets.',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Go to Key vaults 
2.For each Key vault, click on Secrets 
3.Ensure that each secret in the vault has EXPIRATION DATE set as appropriate',
'Customized rule by Cloud Raxak') from dual;

select add_rule_data ('default','MP-Azure-0003 - 8.3','Az83','default','medium','Ensure that Resource Locks are set for mission critical Azure resources.',
'Resource Manager Locks provide a way for administrators to lock down Azure resources to prevent deletion or changing of a resource. These locks sit outside of the Role Based Access Controls (RBAC) hierarchy and, when applied, will place restrictions on the resource for all users. These are very useful when you have an important resource in your subscription that users should not be able to delete or change and can help prevent accidental and malicious changes or deletion.',
'F-79758r1_fix',
'1.Navigate to the specific Azure Resource or Resource Group 
2.For each of the mission critical resource, click on Locks 
3.Click Add 
4.Give the lock a name and a description, then select the type, CanNotDelete or ReadOnly as appropriate',
'Azure Management Plane -- Full CIS Ruleset','Profile Customized by CloudRaxak','WN16-AC-000040',
'C-73420r1_chk',
'1.Navigate to the specific Azure Resource or Resource Group 
2.Click on Locks 
3.Ensure the the lock is defined with name and description, type as CanNotDelete or ReadOnly as appropriate.',
'Customized rule by Cloud Raxak') from dual;

commit;