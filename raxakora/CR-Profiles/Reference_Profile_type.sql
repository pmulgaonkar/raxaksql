update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'Linux-based OS')) where id = (select id from cpe_resource_type where level3 = 'Linux-based OS');
commit;
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'Windows Server 2008')) where id = (select id from cpe_resource_type where level3 = 'Windows Server 2008');
commit;
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'Windows Server 2012')) where id = (select id from cpe_resource_type where level3 = 'Windows Server 2012');
commit;
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'SoftLayer')) where id = (select id from cpe_resource_type where level3 = 'SoftLayer');
commit;
