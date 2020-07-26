update cpe_profile set name=name;
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'Windows-based OS')) where id = (select id from cpe_resource_type where level3 = 'Windows Server 2008');
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'Windows-based OS')) where id = (select id from cpe_resource_type where level3 = 'Windows-based OS');
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'Windows-based OS')) where id = (select id from cpe_resource_type where level3 = 'Windows Server 2012');
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'SoftLayer')) where id = (select id from cpe_resource_type where level3 = 'SoftLayer');
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'Linux-based OS')) where id = (select id from cpe_resource_type where level3 = 'Linux-based OS');
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'Azure')) where id = (select id from cpe_resource_type where level3 = 'Azure');
update cpe_resource_type set ref_profile_id = ( select min(id)  from cpe_profile where resource_type_id = (select id from cpe_resource_type where level3 = 'AWS')) where id = (select id from cpe_resource_type where level3 = 'AWS');
commit;