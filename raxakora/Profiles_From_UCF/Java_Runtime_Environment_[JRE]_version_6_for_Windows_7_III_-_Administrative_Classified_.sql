select add_profile_data ('Java Runtime Environment [JRE] version 6 for Windows 7' , ' III - Administrative Classified ','default','https://www.stigviewer.com/stig/java_runtime_environment_jre_version_6_windows_7/2015-12-10/MAC-3_Classified/' , '2015-12-10' ,'Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32901','SV-43297r2_rule','default','medium','A configuration file must be present to deploy properties for JRE.','"The deployment.config file is used for specifying the location and execution of system-level properties for the Java Runtime Environment.  By default no deployment.config file exists; thus; no system-wide deployment.properties file exists.  64-bit systems require two copies of the file; one for the 64-bit JRE and the other for the 32-bit JRE.  Without the deployment.config file; setting particular options for the Java control panel is impossible. "','F-36819r10_fix','"On 32-bit systems; create a JRE deployment configuration file as indicated:C:\Program Files\Java\jre6\lib\deployment.configOn 64-bit systems; create two JRE deployment configuration files as indicated:C:\Program Files\Java\jre6\lib\deployment.config  C:\Program Files (x86)\Java\jre6\lib\deployment.configThe deployment.config file is a text file containing 2 keys. The keys are:deployment.system.config = deployment.system.config.mandatory = "','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0070-J62K7','C-41214r12_chk','On 32-bit systems, verify that one JRE deployment configuration file exists as indicated:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.config\n\nOn 64-bit systems, verify that two JRE deployment configuration files exist as indicated, one for 32 bit and one for 64 bit:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.config  \nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.config\n\nIf the configuration files do not exist as indicated, this is a finding.','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32829','SV-43212r3_rule','default','medium','The dialog enabling users to grant permissions to execute signed content from an un-trusted authority must be locked.','"Java applets exist in both signed and unsigned forms.  Although signed applets allow for authentication of the author in order to establish trust; even signed applets can potentially contain malware.  Applet sources considered trusted will normally have their certificate information populated into the browser.  This enables Java to validate applets against trusted sources automatically.  Permitting users to grant execution permissions to Java applets signed by un-trusted authorities may result in malware executing on the system. This risks system confidentiality; integrity and availability.Ensuring users cannot change settings contributes to a more consistent security profile. "','F-36742r9_fix','"Lock the Allow user to grant permissions to content from an un-trusted authority feature. Navigate to the deployment.properties file for Java.For 32 bit systems: C:\Program Files\Java\jre6\lib\deployment.properties. For 64 bit systems you must check both the 64 bit and the 32 bit files:C:\Program Files\Java\jre6\lib\deployment.propertiesC:\Program Files (x86)\Java\jre6\lib\deployment.properties  Add the key deployment.security.askgrantdialog.notinca.locked to the deployment.properties file.   "','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0010-J62K7','C-41186r9_chk','If the system is on the SIPRNET this requirement is NA.\n\nNavigate to the "deployment.properties" file for Java.\n\nFor 32 bit systems: \nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties. \n\nFor 64 bit systems you must check both the 64 bit and the 32 bit files:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties\nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.properties  \n\nIf the key "deployment.security.askgrantdialog.notinca.locked" is not present within the deployment.properties file, this is a finding. \n','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32828','SV-43671r2_rule','default','medium','The dialog enabling users to grant permissions to execute signed content from an un-trusted authority must be disabled.','"Java applets exist both signed and unsigned.  Even for signed applets; there can be many sources; some of which may be purveyors of malware.  Applet sources considered trusted can have their information populated into the browser; enabling Java to validate applets against trusted sources.  Permitting execution of signed Java applets from un-trusted sources may result in acquiring malware; and risks system modification; invasion of privacy; or denial of service.  "','F-36740r10_fix','"Disable the Allow user to grant permissions to content from an un-trusted authority feature. Navigate to the deployment.properties file for Java.For 32 bit systems: C:\Program Files\Java\jre6\lib\deployment.properties. For 64 bit systems you must check both the 64 bit and the 32 bit files:C:\Program Files\Java\jre6\lib\deployment.propertiesC:\Program Files (x86)\Java\jre6\lib\deployment.properties Add or update the key deployment.security.askgrantdialog.notinca to be false.   "','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0001-J62K7','C-41184r10_chk','If the system is on the SIPRNET, this requirement is NA.\n\nNavigate to the "deployment.properties" file for Java. \n\nFor 32 bit systems: \nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties \n\nFor 64 bit systems you must check both the 64 bit and the 32 bit files:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties\nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.properties  \n\nIf the key, "deployment.security.askgrantdialog.notinca=false" is not present, this is a finding.\n \nIf the key "deployment.security.askgrantdialog.notinca" exists and is set to true, this is a finding. \n\n','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32902','SV-43300r3_rule','default','medium','A properties file must be present to hold all the keys that establish properties within the Java control panel.','"The deployment.properties file is used for specifying keys for the Java Runtime Environment.  Each option in the Java control panel is represented by property keys. These keys adjust the options in the Java control panel based on the value assigned to that key.  By default no deployment.properties file exists; thus; no system-wide deployment exists.  Without the deployment.properties file; setting particular options for the Java control panel is impossible.  "','F-36822r7_fix','"Create the Java deployment properties file.  The location of this file can vary. For 32 bit systems: C:\Program Files\Java\jre6\lib\deployment.properties. For 64 bit systems you must check both the 64 bit and the 32 bit files in order for both runtimes to be affected.C:\Program Files\Java\jre6\lib\deployment.propertiesC:\Program Files (x86)\Java\jre6\lib\deployment.properties   Create a properties file entitled deployment.properties.At a minimum; the following keys must be present in the deployment.properties file. deployment.security.askgrantdialog.notinca=falsedeployment.security.askgrantdialog.notinca.lockeddeployment.security.validation.crl=truedeployment.security.validation.crl.lockeddeployment.security.validation.ocsp=truedeployment.security.validation.ocsp.locked"','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0080-J62K7','C-41216r6_chk','If the system is on the SIPRNET this requirement is NA.\n\nLocate the deployment.properties files.\n\nFor 32 bit systems the path is:\n\n"C:\\Program Files\\Java\\jre6\\lib\\deployment.properties"\n\nFor 64 bit systems there are 2 potential paths as there can be 2 separate JRE"s one 32 bit and one 64 bit:\n\n"C:\\Program Files\\Java\\jre6\\lib\\deployment.properties"\n"C:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.properties"\n\nIf there are no files entitled "deployment.properties", this is a finding. ','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32833','SV-43224r2_rule','default','medium','"The option to enable online certificate validation must be locked. "','"Online certificate validation provides a real-time option to validate a certificate. When enabled; if a certificate is presented; the status of the certificate is requested. The status is sent back as current; expired; or unknown. Online certificate validation provides a greater degree of validation of certificates when running a signed Java applet. Permitting execution of an applet with an invalid certificate may result in malware; system modification; invasion of privacy; and denial of service. Ensuring users cannot change settings contributes to a more consistent security profile. "','F-36751r8_fix','"If the system is on the SIPRNET; this requirement is NA.Lock the Enable online certificate validation option.Navigate to the deployment.properties file for Java. For 32 bit systems: C:\Program Files\Java\jre6\lib\deployment.properties. For 64 bit systems you must check both the 64 bit and the 32 bit files:C:\Program Files\Java\jre6\lib\deployment.propertiesC:\Program Files (x86)\Java\jre6\lib\deployment.properties Add the key deployment.security.validation.ocsp.locked to the deployment.properties file."','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0050-J62K7','C-41195r9_chk','If the system is on the SIPRNET, this requirement is NA.\n\nNavigate to the "deployment.properties" file for Java.\n\nFor 32 bit systems: \nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties. \n\nFor 64 bit systems you must check both the 64 bit and the 32 bit files:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties\nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.properties \n\nIf the key "deployment.security.validation.ocsp.locked" is not present in the deployment.properties, this is a finding.\n','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32830','SV-43215r2_rule','default','medium','"The dialog to enable users to check publisher certificates for revocation must be enabled. "','"A certificate revocation list is a directory which contains a list of certificates that have been revoked for various reasons. Certificates may be revoked due to improper issuance; compromise of the certificate; and failure to adhere to policy. Therefore; any certificate found on a CRL should not be trusted. Permitting execution of an applet published with a revoked certificate may result in spoofing; malware; system modification; invasion of privacy; and denial of service. "','F-36745r8_fix','"If the system is on the SIPRNET; this requirement is NA.Enable the Check certificates for revocation using Certificate Revocation Lists (CRL) option. Navigate to the deployment.properties file for Java.  For 32 bit systems: C:\Program Files\Java\jre6\lib\deployment.properties. For 64 bit systems you must check both the 64 bit and the 32 bit files:C:\Program Files\Java\jre6\lib\deployment.propertiesC:\Program Files (x86)\Java\jre6\lib\deployment.properties Add or update the key; deployment.security.validation.crl in the deployment.properties file.  Set the value to true."','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0020-J62K7','C-41189r10_chk','If the system is on the SIPRNET, this requirement is NA.\n\nNavigate to the "deployment.properties" file for Java.\n\nFor 32 bit systems: \nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties. \n\nFor 64 bit systems you must check both the 64 bit and the 32 bit files:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties\nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.properties  \n\nIf the key "deployment.security.validation.crl" is not present in the deployment.properties file, this is a finding. \nIf the key "deployment.security.validation.crl" is set to "false", this is a finding.\n','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32831','SV-43218r3_rule','default','medium','The option to enable users to check publisher certificates for revocation must be locked.','"Certificates may be revoked due to improper issuance; compromise of the certificate; and failure to adhere to policy. Therefore; any certificate found revoked on a CRL or via Online Certificate Status Protocol (OCSP) should not be trusted. Permitting execution of an applet published with a revoked certificate may result in spoofing; malware; system modification; invasion of privacy; and denial of service. Ensuring users cannot change these settings assures a more consistent security profile."','F-36747r9_fix','"Navigate to the deployment.properties file for Java.  For 32 bit systems: C:\Program Files\Java\jre6\lib\deployment.properties. For 64 bit systems you must check both the 64 bit and the 32 bit files:C:\Program Files\Java\jre6\lib\deployment.propertiesC:\Program Files (x86)\Java\jre6\lib\deployment.properties Add the key deployment.security.validation.crl.locked to the deployment.properties file.Add the key deployment.security.validation.ocsp.locked to the deployment.properties file."','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0030-J62K7','C-41191r9_chk','If the system is on the SIPRNET, this requirement is NA.\n\nNavigate to the "deployment.properties" file for Java.\n\nFor 32 bit systems: \nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties. \n\nFor 64 bit systems you must check both the 64 bit and the 32 bit files:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties\nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.properties \n\nIf the key "deployment.security.validation.crl.locked" is not present in the deployment.properties file, this is a finding. \n\nIf the key "deployment.security.validation.ocsp.locked" is not present in the deployment.properties file, this is a finding.\n','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32832','SV-43221r2_rule','default','medium','"The option to enable online certificate validation must be enabled. "','"Online certificate validation provides a real-time option to validate a certificate.  When enabled; if a certificate is presented; the status of the certificate is requested.  The status is sent back as current; expired; or unknown.  Online certificate validation provides a greater degree of validation of certificates when running a signed Java applet.   Permitting execution of an applet with an invalid certificate may result in malware; system modification; invasion of privacy; and denial of service. "','F-36749r7_fix','"Enable the Enable online certificate validation option.Navigate to the deployment.properties file for Java.  For 32 bit systems: C:\Program Files\Java\jre6\lib\deployment.properties. For 64 bit systems you must check both the 64 bit and the 32 bit files:C:\Program Files\Java\jre6\lib\deployment.propertiesC:\Program Files (x86)\Java\jre6\lib\deployment.properties Add or update the key deployment.security.validation.ocsp in the deployment.properties file.  Set the value to true.   "','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0040-J62K7','C-41193r9_chk','If the system is on the SIPRNET, this requirement is NA.\n\nNavigate to the "deployment.properties" file for Java.\n\nFor 32 bit systems: \nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties. \n\nFor 64 bit systems you must check both the 64 bit and the 32 bit files:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties\nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.properties \n\nIf the key "deployment.security.validation.ocsp" is not present in the deployment.properties file, this is a finding. \nIf the key "deployment.security.validation.ocsp" is set to "false", this is a finding. \n','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-32842','SV-43645r2_rule','default','medium','The configuration file must contain proper keys and values to deploy settings correctly.','"This configuration file must hold values of the location of the deployment.properties file; as well as the enforcement of these properties. Without a proper path for the properties file; deployment would not be possible. If the path specified does not lead to a properties file the value of the deployment.system.config. mandatory key determines how to handle the situation. If the value of this key is true; JRE will not run if the path to the properties file is invalid. "','F-37156r9_fix','"Specify the path to the deployment.properties file in deployment.config and set the mandatory configuration values.If the deployment.config file does not exist; create the file. The deployment.config file is a text file containing 2 keys. They are:deployment.system.config = deployment.system.config.mandatory = On 32-bit systems the deployment config file should be located at:C:\Program Files\Java\jre6\lib\deployment.configOn 64-bit systems there can be 2 locations for the  deployment.config file.  One is for 32 bit JRE and the other for 64 bit JRE:64 bit - C:\Program Files\Java\jre6\lib\deployment.config32 bit - C:\Program Files (x86)\Java\jre6\lib\deployment.configInclude the following keys and values in the appropriate deployment.config file based upon your system architecture. If you are running both a 32 bit and a 64 bit JRE; you need to update both deployment.config files. The following are examples; drive letters may vary.32 bitdeployment.system.config=file:C\:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.propertiesdeployment.system.config.mandatory=false.64 bit deployment.system.config=file:C\:\\Program Files\\Java\\jre6\\lib\\deployment.propertiesdeployment.system.config.mandatory=false."','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0060-J62K7','C-41520r8_chk','\nNavigate to the deployment.config file:\nIf the deployment.config file does not exist, it must be created. The deployment.config file is a text file containing 2 keys. They are:\n\ndeployment.system.config = \ndeployment.system.config.mandatory = \n\nFor 32 bit systems: \nC:\\Program Files\\Java\\jre6\\lib\\deployment.config. \n\nFor 64 bit systems you must check both the 64 bit and the 32 bit config files:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.config\nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.config  \n \nVerify the "deployment.system.config" key in the deployment.config file is set to the correct path.  Note that the characters : and \\ must be delimited by a backslash.  \n\nThe path contained in the deployment.config file(s) will depend upon system architecture.  The following paths are examples. Drive letters may vary based upon your system.\n\nFor 32 bit systems the path is:\n"file:C\\:\\\\Program Files\\\\Java\\\\jre6\\\\lib\\\\deployment.properties"\n\nFor 64 bit systems the paths are:\n"file:C\\:\\\\Program Files\\\\Java\\\\jre6\\\\lib\\\\deployment.properties"\n\n"file:C\\:\\\\Program Files (x86)\\\\Java\\\\jre6\\\\lib\\\\deployment.properties"\n\nVerify the "deployment.system.config.mandatory" key in the deployment.config file(s) are set to "false".\n\nIf the "deployment.system.config" key is not set to the correct path and the "deployment.system.config.mandatory" key is not set to false, this is a finding.\n','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-39239','SV-51122r1_rule','default','medium','The version of the JRE running on the system must be the most current available.','The JRE is being continually updated by the vendor in order to address identified security vulnerabilities.  Running an older version of the JRE can introduce security vulnerabilities to the system.','F-44218r5_fix','"Test applications to ensure operational compatability with new version of Java.Install latest version of Java JRE."','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0090-J62K7','C-46509r5_chk','Open a terminal window and type the command;\n"java -version" sans quotes.\n\nThe return value should contain Java build information;\n\n"Java (TM) SE Runtime Environment (build x.x.x.x)"\n\nCross reference the build information on the system with the Oracle Java site to identify the most recent build available.\n\nhttp://www.oracle.com/technetwork/java/javase/downloads/index.html','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','V-61035','SV-75503r2_rule','default','high','Java Runtime Environment (JRE) versions that are no longer supported by the vendor for security updates must not be installed on a system.','Java Runtime Environment (JRE) versions that are no longer supported by Oracle for security updates are not evaluated or updated for vulnerabilities leaving them open to potential attack.  Organizations must transition to a supported Java Runtime Environment (JRE) version to ensure continued support.','F-66775r1_fix','Upgrade Java Runtime Environment (JRE) 6 for Windows 7 software to a supported version.','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE9999-J62K7','C-61977r2_chk','Oracle support for Java Runtime Environment (JRE) 6 for Windows 7 ended 2013 Feb. If JRE 6 for Windows 7 is installed on a system, this is a finding.\n\nIf an extended support agreement providing security patches for the unsupported product is procured from the vendor, this finding may be downgraded to a CAT III.','Imported data from UCF - DISA') from dual;
select add_rule_data ('default','','','default','','','','','','Java Runtime Environment [JRE] version 6 for Windows 7',' III - Administrative Classified ','JRE0001-J62K7','C-41184r10_chk','If the system is on the SIPRNET, this requirement is NA.\n\nNavigate to the "deployment.properties" file for Java. \n\nFor 32 bit systems: \nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties \n\nFor 64 bit systems you must check both the 64 bit and the 32 bit files:\nC:\\Program Files\\Java\\jre6\\lib\\deployment.properties\nC:\\Program Files (x86)\\Java\\jre6\\lib\\deployment.properties  \n\nIf the key, "deployment.security.askgrantdialog.notinca=false" is not present, this is a finding.\n \nIf the key "deployment.security.askgrantdialog.notinca" exists and is set to true, this is a finding. \n\n','Imported data from UCF - DISA') from dual;
