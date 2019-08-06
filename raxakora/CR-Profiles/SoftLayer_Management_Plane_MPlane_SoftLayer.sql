select add_profile_data ('SoftLayer Management Plane Demo Profile',' [ test ] ','SoftLayer','' ,'2017-04-01' ,'Profile by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0001','MP-SLYR-0001
','default','low','Establish User Roles','
SoftLayer has a rich set of permissions that cover all aspects of SoftLayer account management. As a means of simplifying this complexity, this includes three “starter” groups (roles): View Only, Basic and Super User. The permissions for each of these pre-defined roles can be used as the basis for new, customer specific roles by adding and removing individual permissions from the pre-configured set. Note that if a federated IAM scenario is in place, then the set of defined roles may be pulled from the authoritative IAM source (eg customer’s Active Directory).                         ','
MP-0001_fix','
Refer to listing of SoftLayer defined roles and permissions-per-role                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0001','
MP-0001-chk
','Build a set of groups/roles based on permissions by starting with a csv file of known roles and then customizing by adding new rows per role and specializing the permissions per role. This csv file can be created from scratch or created programmatically for an existing account by pulling a list of all users and their permissions and then sorting into the required roles.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0002','MP-SLYR-0002
','default','low','Initialize User Set, Add Users to Roles','
Because of the rich set of permissions available through SoftLayer’s management portal, it is easy to get lost/assign the wrong permissions/experience unintended privilege escalation on an individual user basis. In order to minimize this, customers should define a set of roles (and the associated permissions) to govern their users (see 1.1 Establish User Roles) and then define the roles to which a user is assigned.  Note that if a federated IAM scenario is in place, then the set of users-in-roles may be pulled from the authoritative IAM source (eg customer’s Active Directory).                         ','
MP-0002_fix','
TBD: Add new users to this table manually or append by automation as part of user account listing actions                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0002','
MP-0002-chk
','Build a table of users and then identify the role(s) for that user. Note that in cases of multiple roles assigned to a user (not recommend practice) the sum total of most-permissive permissions will be assigned to that user. This table must be stored somewhere that can be accessed by configuration tooling to allow for automated reset of permissions.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0003','MP-SLYR-0003
','default','low','Initialize Provisioned Server Set                         ','
While a list of servers can always be built based on what is currently provisioned and the provisioned server’s initial in-service date, this task allows the creation of an ongoing list of servers including those that have been provisioned, used and deprovisioned.                         ','
MP-0003_fix','
This table must be stored somewhere that can be accessed by configuration tooling to allow for automated reset of permissions.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0003','
MP-0003-chk
','Build a table of provisioned servers with detailed information (see List of all Hardware By Data Center below).                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0004','MP-SLYR-0004
','default','low','REPORT : MAU – User Profile                        ','
The Master Account User is the account super user and as such does not operate under a “Least Privilege” model.  Accordingly, use of the MAU should be limited and monitored to ensure that it is being used only when the “Least Privilege” required is in fact elevated privilege.  This report provides a listing of the MAU’s User Profile to ensure that it is properly configured. Drift in this information may indicate attempts to subvert this user account and thus the cloud environment.                         ','
MP-0004_fix','
None                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0004','
MP-0004-chk
',' Check for initial validity and changes over time: - Notification email is set o As this value is always required, this is looking for changes in this value over time. Changes may indicate attempts to subvert the MAU account and thus the cloud environment. - Email domain name matches that of companyo Unmatched domain name/changes in this value may indicate attempts to subvert the MAU account aand thus the cloud environment- Email is a valid email within company’s environment o Invalid email /changes in this value may indicate attempts to subvert the MAU account and thus the cloud environment- Phone number is a valid company phone number (not an external number)o As this value is used for IBM to contact customer, this must be a valid customer number; changes in this value may indicate attempts to subvert the MAU account (or may indicate changes in MAU ownership based on job role changes)- Alternate phone number may be set to a valid/known company mobile phone numbero As this value is used for IBM to contact customer, this must be a valid customer number; changes in this value may indicate attempts to subvert the MAU account (or may indicate changes in MAU ownership based on job role changes)- Company address information is set (Street Address, City, …) and matches that of company’s corporate head office or other approved office location- Restrict Access to IP is set?o This is a best practice recommendation even though not all customers will want to use IP address restrictions; this is an advisory item for “drift” purposes; note that removal of an IP address restriction may indicate attempts to subvert an account- Require Security questions to log on is seto Not all customers will want to use security questions so this is an advisory item for “drift” purposes; note that removal of a requirement for security questions may indicate attempts to subvert an account- VPN enabled (VPN password set)?o Not all customers will want the MAU user to have VPN permissions (to access the customer’s private network for their Cloud hosted environment) and so this is an advisory item for “drift” purposes- API authentication key: set?o Not all customers will set up an API key for their MAU so this is an advisory item for “drift” purposes - If API authentication key set, are allowed IPs restricted? o If API Authentication key is set, then IP addresses from which it may be used must also be set- Invoices emailed after creation: set? o Not all customers will want the invoices sent to the MAU after creation so this is an advisory item for drift purposes- Ticket contents included in email messages: set? o Note that this may well be required to be NOT set to mitigate any risk of sensitive information (such as an IP address) that is part of a service ticket request being sent over email                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0005','MP-SLYR-0005
','default','low','REPORT: MAU - Ensure MAU has Valid Company Email Address                         ','
All users are required to have a valid email address, meaning a routable email address, or an IBMid. If using email address (as opposed to IBMid), the Master Account User MUST have an email address that matches the company’s domain.                         ','
MP-0005_fix','
Provide instructions on how to change the email address through Cloud portal or API (note must be done by a MAU account). Note that disabling this account is not an option – disabling the MAU is not allowed or supported.                          
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0005','
MP-0005-chk
',' IBMid: If enabled for IBMid, check that the IBMid (email) domain matches that of the company. Further, check that the notification email also matches the domain of the company. Optionally test the email address itself against the company’s defined corporate directory to ensure that it is a valid, working company email.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0006','MP-SLYR-0006
','default','low','REPORT: MAU - Notification Recipients                         ','
The email address associated with the MAU is the primary notification address for any alerts or urgent communications with account holders (such as if there is an abuse notification registered against the account).                          ','
MP-0006_fix','
TBD: Impact of IBMid on notification recipients                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0006','
MP-0006-chk
',' TBD: Impact of IBMid on notification recipients                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0007','MP-SLYR-0007
','default','low','REPORT: MAU - Limit VPN Usage                        ','
User accounts with VPN access permitted can be use the SoftLayer provided VPN endpoint to VPN in directly to the customer’s cloud-hosted workload’s private network. This is useful for “emergency” access to the private network for administration purposes. This functionality should not be provided to all users and should be limited from the MAU as part of separation of duties best practices                        ','
MP-0007_fix','
Remove the MAU’s VPN permissions and passwords. Note that disabling this account is not an option – disabling the MAU is not allowed or supported.                          
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0007','
MP-0007-chk
',' Highlight MAU’s VPN usage status (enabled or disabled) including current setting and setting on last report.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0008','MP-SLYR-0008
','default','low','REPORT: MAU -  Prevent Use of Non-Expiring Passwords                         ','
The Master Account User is the account super user and as such does not operate under a “Least Privilege” model.  Accordingly, use of the MAU should be limited and set up to have an expiring password.  This report will check if the MAU has a non-expiring password and allow for automated remediation from non-expiring to 90 days []. Note that with migration to IBMid for many accounts, this control/test will need to be updated to reflect IBMid policies. RationaleA non-expiring password is more likely to be compromised and or widely known (for example, a user knows the NEP value, leaves the company, and because of lax policies that do not force this password to change, can continue to use this to access the Cloud portal).                          ','
MP-0008_fix','
Via the SoftLayer Customer Portal:1. Log in to portal, go to users, MAU and set password expiration to 90 daysVia the SoftLayer APISoftLayer_User_Customer_Access_AuthenticationUsername::SoftLayer_Account::id (MAU id)SoftLayer_User_Customer::passwordExpireDate                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0008','
MP-0008-chk
',' Via the SoftLayer Customer Portal:1. Log in to portal, go to users, MAU and examine password expiration valueVia the SoftLayer APISoftLayer_User_Customer_Access_AuthenticationUsername::SoftLayer_Account::id (MAU id)SoftLayer_User_Customer::passwordExpireDate                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0009','MP-SLYR-0009
','default','low','REPORT: MAU -  Ensure IP Address Restriction in place                         ','
Ideally, you should setup and use a dedicated functional user with a limited permission set to make calls to the SoftLayer API.  However, this isn’t always viable since the Master Account User (with a full permission set) may be needed in some scenarios, such as ordering external authentication, ordering object storage, and viewing/updating user profiles.  Accordingly, you should use the IP restrictions capability to limit calls to one or more trusted hosts if you need to use the Master Account User to make calls to the SoftLayer API.RationaleThe Master Account User has full access (often referred to as privileged access) to the account, which means the Master Account User can perform such actions as provision servers, de-provision servers, upgrade servers, view server detail, manage firewalls, add users, delete users, open support tickets, and edit support tickets.  Consequently, it’s important for the IP restrictions capability to be used to minimize the risk of a malicious user making calls to the SoftLayer API with the Master Account User, potentially causing harm to the environment.                        ','
MP-0009_fix','
Via the SoftLayer Customer Portal:1. Login to the SoftLayer Customer Portal with the Master Account User.2. Navigate to Account | Users and open the User Profile record for the Master Account User (it’s typically highlighted in yellow).3. Scroll to the bottom of the User Profile record and look for a section labeled “API Access Information” and a field labeled “Allowed IPs”.  In the Allowed IPs field, specify at least one IP address.4. Click the Save Changes button to apply the change.Via the SoftLayer APIThis is a manual remediation item for now (as it requires input of an explicit value, the IPAddress). References• http://sldn.softlayer.com/article/getting-started• https://knowledgelayer.softlayer.com/procedure/edit-user-profile                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0009','
MP-0009-chk
',' Via the SoftLayer Customer Portal:1. Login to the SoftLayer Customer Portal with the Master Account User.2. Navigate to Account | Users and open the User Profile record for the Master Account User (it’s typically highlighted in yellow).3. Scroll to the bottom of the User Profile record and look for a section labeled “API Access Information” and a field labeled “Authentication Key”.  If the Authentication Key field has a value, then an API Key is defined and you should continue to the next step.  Otherwise, you can stop here.4. While in the same section, look for a field labeled “Allowed IPs”.  If you see at least one IP address in the field, then an API IP restriction is in place.  Otherwise, an API IP restriction is not in place and remediation is recommended.Via the SoftLayer Python CLI:1. Run the following command to output the username for the Master Account User.slcli call-api Account getMasterUser --mask=username2. The output of the command should produce a table similar to the following::..........:...........::     name : value     ::..........:...........:: username : SL1234567 ::..........:...........:3. Note the value for username, which will be in the format of the SoftLayer account ID proceeded by the letters SL.4. Run the following command (replace SL1234567 with username noted in step 3) to determine the status of 2FA for the Master Account User.slcli call-api Account getUsers --mask=username,apiAuthenticationKeys.ipAddressRestriction \--filter "users.username= SL1234567"5. The output of the command should produce a table similar to the following::..........................:............::  apiAuthenticationKeys   : username   ::..........................:............:: :......................: : SL1234567  :: : ipAddressRestriction : :            :: :......................: :            :: :     47.198.0.68      : :            :: :......................: :            ::..........................:............:6. For the apiAuthenticationKeys column in the table, you will see one of three things:a. An ipAddressRestriction property and one or more IP address value - This means an API key is defined and an API IP restriction is in place.  Consequently, no further action is recommended. b. Nothing - This means an API key is not defined.  Consequently, no further action is recommended.c. A value property and an empty value - This means an API key is defined, but an API IP restriction is not in place.  Consequently, remediation is recommended.                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0010','MP-SLYR-0010
','default','low','REPORT: MAU -  Report on MFA Status                         ','
Because of the nature of the Master Account User, it is not always the case that a single user will be the only person with access to the MAU account (think of how to survive “the bus test”). IP Address lockdown providers a better control than Multi-Factor Authentication for this highly privileged user, as IP Address lockdown requires access from a known, secure location and does not require that all of these users have a single, shared MFA-enabled mobile device. If the configuration and risk analysis of the given SoftLayer account supports the requirement for MFA for the MAU, this report can provide ongoing evidence that the MAU has not somehow disabled or removed MFA requirements.                         ','
MP-0010_fix','
If MAU has previously been configured for MFA and this has been disabled, offer the option to automatically remediate by re-setting MFA requirements. NOTE: This depends on the tool that is running these checks in turn having MAU privileges as the setting of MFA is a MAU privilege (so somewhat circular functionality required)If MFA has not previously been configured for the MAU, this is not possible and must be done manually.                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0010','
MP-0010-chk
',' Pull code snippets from https://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/create_users_from_list.pyhttps://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/COnfigurationReport2CSV.pyCreate a simple report that identifies the status of MFA for the Master Account User, including type of MFA configured, and last used.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0011','MP-SLYR-0011
','default','low','REPORT: MAU -  Ensure Limited Use (Report on Usage)                         ','
The Master Account User is the account super user and as such does not operate under a “Least Privilege” model.  Accordingly, use of the MAU should be limited and monitored to ensure that it is being used only when the “Least Privilege” required is in fact elevated privilege.  This report provides a listing of the MAU logins (over a specified time period) to allow for monitoring of MAU use and frequency of use.                         ','
MP-0011_fix','
If excessive use of the MAU is found, internal investigation should be undertaken to establish why, and more importantly, if this usage can be delegated to (new?) child users.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0011','
MP-0011-chk
',' Via the SoftLayer Customer Portal:2. Log in to portal, go to logs, check authentication by MAUVia the SoftLayer APISoftLayer_User_Customer_Access_AuthenticationUsername::SoftLayer_Account::id (MAU id)                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0012','MP-SLYR-0012
','default','low','REPORT: Enumerate All Customer User Accounts                        ','
As a basic best practice, customers should have access to simple reports that list all SoftLayer management portal users. While this can be seen in the Portal, generating a list (and persistent table) of users allows for ongoing automated remediation of changes in user accounts and activities. Note that while this functionality may be provided by federation with customer IAM tools, these tools typically do not provide the types of reports required for compliance assertions and so running through a configuration management tool supports a single pane of glass/source of reports for compliance reports and evidence.                         ','
MP-0012_fix','
None                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0012','
MP-0012-chk
',' Pull code snippets from https://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/create_users_from_list.pyhttps://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/COnfigurationReport2CSV.pyCreate csv table with user information including account creation date and account-added-to-file dates; store somewhere safe (do not include passwords!)This file will be used to provide basis of additional information on users and also add roles to users (manually to start with?) for enforcement of customer defined roles                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0013','MP-SLYR-0013
','default','low','REPORT: Ensure all Users have Valid Email Address                         ','
All users are required to have a valid email address, meaning a routable email address, or an IBMid. Customers may further require that all accounts have a company-valid email ID.                         ','
MP-0013_fix','
Provide instructions / guidelines on how to change the email address. Note that one option for immediate handling of accounts that do not meet this requirement is to automate the setting of these accounts to a “disabled” status so that any opportunity for misuse is prevented until the rationale for a deviation from best practice can be determined and approved/rejected.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0013','
MP-0013-chk
',' Pull from table created as part of the “Enumerate all User Accounts” action or pull a new report of the email address of each user account. Optionally test the domain (to make sure it matches company domain) and/or test the email address itself against the company’s defined corporate directory.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0014','MP-SLYR-0014
','default','low','REPORT: Prevent Use of Non-Expiring Passwords                         ','
In general, non-expiring passwords should not be used unless the account in question is a service management account (API only account, no interactive login possible).  Note that with migration to IBMid for many accounts, this control/test will need to be updated to reflect IBMid policies. RationaleA non-expiring password is more likely to be compromised and or widely known and is for most customers, against customer policy                        ','
MP-0014_fix','
For those users who have non-expiring passwords but are API key only accounts (limited or no interactive login has been reported), non-expiring passwords may be acceptable – validate these accounts against known API-access only accounts. For those users with non-expiring passwords and interactive login usage, reset the password expiration to be 90 days. Note that one option for immediate handling of accounts that do not meet this requirement is to automate the setting of these accounts to a “disabled” status so that any opportunity for misuse is prevented until the rationale for a deviation from best practice can be determined and approved/rejected.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0014','
MP-0014-chk
',' Generate a report of all users and the password expiration setting for those users. For those users who have non-expiring passwords, optionally provide information on time/date of last three logins as well as status of API key usage.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0015','MP-SLYR-0015
','default','low','REPORT: Ensure User Cannot Edit their Settings                        ','
Users may be given the permission to edit their settings. In general most users should not have this permission (unless required for the setting of 2FA phone factor settings) as it allows users to change their password expiration values, IP address restrictions, VPN passwords and portal passwords and their 2FA status.                         ','
MP-0015_fix','
Provide instructions / guidelines on how to change the email address. Note that one option for immediate handling of accounts that do not meet this requirement is to automatically remediate (remote the User Editable status). This is a remediation item that, from a best practice point of view, need not be carried out by a federated IAM environment. Note that one option for immediate handling of accounts that do not meet this requirement is to automate the setting of these accounts to a “disabled” status so that any opportunity for misuse is prevented until the rationale for a deviation from best practice can be determined and approved/rejected.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0015','
MP-0015-chk
',' Pull from table created as part of the “Enumerate all User Accounts” action or pull a new report of the “User Editable?” status of each user account.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0016','MP-SLYR-0016
','default','low','REPORT: Limit VPN Usage                        ','
User accounts with VPN access permitted can be use the SoftLayer provided VPN endpoint to VPN in directly to the customer’s cloud-hosted workload’s private network. This is useful for “emergency” access to the private network for administration purposes. This functionality should not be provided to all users.                         ','
MP-0016_fix','
Evaluate if each of the VPN-enabled users require this permission and reset those that do not. This can be done manually through the SoftLayer portal or may be tied to permissions as part of Federated IAM management. Set IP address restrictions for those VPN-enabled users who do not have IP address restrictions in place. This can be done manually through the SoftLayer portal.Note that one option for immediate handling of accounts that do not meet this requirement is to automate the setting of these accounts to a “disabled” status so that any opportunity for misuse is prevented until the rationale for a deviation from best practice can be determined and approved/rejected.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0016','
MP-0016-chk
',' Pull a new report for all user accounts and highlight those users with VPN Passwords set (do not display the password values).As an option, indicate those users who DO have VPN password setting and DO NOT have IP address restrictions.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0017','MP-SLYR-0017
','default','low','REPORT: Require Security Questions                        ','
User accounts with security questions enabled provide an extra level of “knowledge” required to successfully authenticate to the portal. As not all security experts agree with the need for security questions, this is a very customer-dependent control.                         ','
MP-0017_fix','
Manually reset in portal or through federated IAM tools. Optionally allow for automated remediation to reset this setting; note that a user will be required to set the security questions. Note that one option for immediate handling of accounts that do not meet this requirement is to automate the setting of these accounts to a “disabled” status so that any opportunity for misuse is prevented until the rationale for a deviation from best practice can be determined and approved/rejected.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0017','
MP-0017-chk
',' Pull a new report for all user accounts and highlight those users that have and do not have the “require security questions” setting.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0018','MP-SLYR-0018
','default','low','REPORT: Ensure the IP Address Restriction for all API Key Users                        ','
User accounts with an API key should be limited to Service Accounts (such as accounts used by applications that interact with SoftLayer through the API). This report will list all accounts that are API key enabled and identify those that are NOT set up with IP address restrictions.                         ','
MP-0018_fix','
Provide instructions / guidelines on how to add IP Address lockdown for accountIf account is has an exception to IP Address lockdown, provide option to indicate that exception allowed so this account does not alert on future reportsNote that one option for immediate handling of accounts that do not meet this requirement is to automate the setting of these accounts to a “disabled” status so that any opportunity for misuse is prevented until the rationale for a deviation from best practice can be determined and approved/rejected.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0018','
MP-0018-chk
',' Pull from table created as part of the “Enumerate all User Accounts” action or Pull a new report for all API key enabled user accounts, listing user and IP address lockdown restriction                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0019','MP-SLYR-0019
','default','low','REPORT: Limit Interactive Login of API Key User Accounts                        ','
User accounts with an API key should be limited to Service Accounts (such as accounts used by applications that interact with SoftLayer through the API) and as such should not be used by individuals for interactive login.  This report will list all accounts that are API key enabled and identify the “last login” date for these accounts.                         ','
MP-0019_fix','
Provide instructions / guidelines on how best practice to separate interactive login accounts from API key accounts. Note that one option for immediate handling of accounts that do not meet this requirement is to automate the setting of these accounts to a “disabled” status so that any opportunity for misuse is prevented until the rationale for a deviation from best practice can be determined and approved/rejected.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0019','
MP-0019-chk
',' Pull a new report for all API key enabled user accounts and listing the last three interactive logins for the account. Based on usage/frequency of these logins, evaluate if this is really required (why does a single user account need both non-interactive service/API access and interactive portal access?)                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0020','MP-SLYR-0020
','default','low','REPORT: Ensure Unused Accounts are Disabled After 90 Days                        ','
User accounts that have not been used for 90 days present a risk to the environment and must be controlled/disabled.                         ','
MP-0020_fix','
If the account is not an API-only key account (so not subject to individual interactive logins), allow automated remediation to set the account status to “disabled”.                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0020','
MP-0020-chk
',' Pull a new report for all (non-API key only) user accounts, listing the last three interactive logins for the account.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0021','MP-SLYR-0021
','default','low','REPORT: Enforce Defined Role Permissions                        ','
Bluemix Infrastructure supports fine granularity role based access. Multiple user entitlements are supported and configurable by customer divided into: support, devices, network, services, and account. Permissions are set by the account administrator when the user is added and may be edited at any time by an authorized user. IBM provides three options for pre-defined permission sets for View Only, Basic and Super Users.  Rationale A variation on specific user’s privilege might be caused by a malicious activity with a permission escalation purpose. The malicious activity could grant a super-user access to those who do not have the ability to view or interact with the selected features.                          ','
MP-0021_fix','
Via the SoftLayer Customer Portal:  1. Login to the SoftLayer Customer Portal. 2. Navigate to Account | open the User section. 3. Click the desired username to access the User Profile.  4. Click the Permissions icon to access the Permissions screen. 5. Select the desired Permission Set from the Quick Permissions drop down list and click the Set Permissions button to set the permissions for each tab. 6. In alternative select or deselect each check box on the desired tabs to update the user"s permissions.7. Click the Edit Portal Permissions to submit changes and update the user"s permissions. Via the SoftLayer API Pull code from: https://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/create_users_from_list.py References • https://knowledgelayer.softlayer.com/procedure/edit-users-customer-portal-permissions                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0021','
MP-0021-chk
',' Via the SoftLayer Customer Portal:  1. Login to the SoftLayer Customer Portal. 2. Navigate to Account | open the User section. 3. Click the desired username to access the User Profile.  4. Click the Permissions icon to access the Permissions screens.5. Look at the permission set for the specific user in each section (support, devices, network, services, and account) 6. Add/remove permissions as necessary to align with defined permissions for given user’s role, including setting user to a pre-defined set of permissions for View Only, Basic and Super User. Via the SoftLayer API Future: Generate list of all permissions per user and compare with ALL_USERS table (USER_ROLES) and ALL_ROLES table If there are variations (eg user is suppose to be View Only and has permissions that vary form View Only), allow for automated remediation of user permissions                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0022','MP-SLYR-0022
','default','low','REPORT: Ensure User Emails belong to Company Domain                         ','
Every user account has an associated email address., accounts may have multiple email addresses; these are notified when updates are made to support tickets. For client-governed accounts, these email addresses should correspond to company domain emails. Further Rationale A non-company domain email address may indicate unauthorized use of the customer’s SoftLayer account                          ','
MP-0022_fix','
None                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0022','
MP-0022-chk
',' SoftLayer_User_Customer : ObjectMask: emailObjectMask: additionalEmailCountObjectMark: addtionalEmails (type SoftLayer_User_Customer_AdditionalEmail)                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0023','MP-SLYR-0023
','default','low','REPORT: Ensure Event Subscriptions                         ','
SoftLayer provides four (as of date of writing) types of events to which users may subscribe for notification: Auto-Scaling, Planned Maintenance, Raid Alert Monitoring, Unplanned Incidents. Customers should have at least one user configured to receive notifications for planned maintenance and unplanned incidents, with notifications also set up if customer is leveraging auto-scaling and or RAID based solutions.                         ','
MP-0023_fix','
Ensure that (at least) the MAU is subscribed to each event (this should be default and cannot be overridden by users).                         
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0023','
MP-0023-chk
',' For each subscription type, generate a report listing the users that are subscribed to notifications for that type. Ensure that each type has at least one user receiving notifications (for planned maintenance and unplanned incidents)Ensure that email addresses for these users match company email addressesProvide listing of users added/dropped from subscription list over last reporting period.                                 ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0024','MP-SLYR-0024
','default','low','REPORT: List of All Hardware / By Data Center                        ','
Report with the listing of all servers for a given account / by data center. This report can then be detailed to list information about each server that can then be sorted on, such as in service date, last power on/power off, etc                        ','
MP-0024_fix','
None                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0024','
MP-0024-chk
',' By SoftLayer APIhttps://github.com/jonghall/Jon-SL-scripts/blob/master/HypervisorMaintenance/BuildServerListbyDC.py                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0025','MP-SLYR-0025
','default','low','REPORT: List all Hardware and Configuration                         ','
Report with the listing of all servers for a given account / by data center with detailed configuration information. This will be the basis for reports that highlight component and subcomponent changes based on changes in in-service date.                        ','
MP-0025_fix','
None                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0025','
MP-0025-chk
',' By SoftLayer APIhttps://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/ConfigurationReport.py                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0026','MP-SLYR-0026
','default','low','REPORT: Check Bandwidth By Server                        ','
Report with the listing of all servers for a given account / by data center with their bandwidth usage. This report can be extended to focus on the Internet facing b/w for servers and used to highlight those servers (if any) that have unauthorized Internet facing access                        ','
MP-0026_fix','
None                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0026','
MP-0026-chk
',' By SoftLayer APIhttps://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/BandwidthUsagebyServer.py                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0027','MP-SLYR-0027
','default','low','REPORT: Check Server Power On                        ','
Report with listing of all servers for a given account / by data center with their power on date. This report can be extended to focus on the Internet facing b/w for servers and used to highlight those servers (if any) that have unauthorized Internet facing access                        ','
MP-0027_fix','
None                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0027','
MP-0027-chk
',' By SoftLayer APIhttps://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/EventLogPowerOn.py                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0028','MP-SLYR-0028
','default','low','REPORT: List All Servers Created in Last Time Period                        ','
Report with listing of all servers for a given account / by data center created in last (default) 24 hours. In transient environments, servers will be constantly provisioned/deprovisioned. However, many Enterprise class clients have stable bare metal environments (such as those used to host VMWare environments). In these scenarios, newly provisioned servers may be an indication of misuse of the environment.                         ','
MP-0028_fix','
By SoftLayer Portal1. Login to portal, go to device list and power off/suspend servers that are not required2. NOTE: As these servers may have been maliciously created, clients should not by default shut these down unless and until cleared by internal CSIRT teams and processesBy SoftLayer APIhttps://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/LookupYesterdaysProvisioningEvents.py                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0028','
MP-0028-chk
',' By SoftLayer APIhttps://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/LookupYesterdaysProvisioningEvents.py                                ','Customized rule by Cloud Raxak') from dual;
select add_rule_data ('default','MP-SLYR-0029','MP-SLYR-0029
','default','low','REPORT: List Component In-Service Dates that Changed During Last Time Period                        ','
Report with listing of all servers that have had component level in-service dates changed in last (default) 24 hours. Even in transient environments, servers should not be subject to component level changes (such as hard drive swap outs). Changes to in-service date indicate changes that should be traceable to a valid, approved customer request.                          ','
MP-0029_fix','
Manual• Investigate all component in-service date changes, including matching to service ticket in SL portal                        
','SoftLayer Management Plane Demo Profile',' [ test ] ','SLYER-0029','
MP-0029-chk
',' By SoftLayer APIhttps://github.com/jonghall/Jon-SL-scripts/blob/master/Misc/LookupYesterdaysProvisioningEvents.py                                ','Customized rule by Cloud Raxak') from dual;
