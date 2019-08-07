alter system set processes = 500 scope = spfile;
alter system set sga_target = 1019215872   scope = spfile;
shutdown immediate;
startup;