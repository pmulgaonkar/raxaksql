set verify off
PROMPT Updating Domain based IP
delete from DJANGO_SITE;
insert into DJANGO_SITE (id,domain,name) values (1, '&1' , 'Cloud-Raxak Server');
commit;
/
Begin
    if '&1' != '&2' then
        insert into DJANGO_SITE (id,domain,name) values (2, '&2', 'Domain based IP');
        commit;
    end if;
End;
/
set serveroutput on
DECLARE
    iplist VARCHAR2(1000) := '&3';
BEGIN
    if iplist is not null then
        FOR ip IN
            (SELECT trim(regexp_substr(iplist, '[^,]+', 1, LEVEL)) address FROM dual
            CONNECT BY LEVEL <= regexp_count(iplist, ',')+1)
            LOOP
                dbms_output.put_line(ip.address);
                insert into DJANGO_SITE (domain,name) values (ip.address, 'Domain based IP');
            END LOOP;
    end if;
END;
/

PROMPT Now enable social acount login via Django
delete from SOCIALACCOUNT_SOCIALTOKEN;
delete from SOCIALACCOUNT_SOCIALAPP_SITES;
delete from SOCIALACCOUNT_SOCIALAPP;
delete from SOCIALACCOUNT_SOCIALACCOUNT;

insert into SOCIALACCOUNT_SOCIALAPP (id,provider,name,client_id,secret)
       values(1,'google','google','955590164993-hlsjibb5cfdbdpa5bo06fanh3h7rgtbf.apps.googleusercontent.com','TltWcub5KFho91U6G-lcG1kM');
insert into SOCIALACCOUNT_SOCIALAPP (id,provider,name,client_id,secret)
       values(2,'amazon','amazon','amzn1.application-oa2-client.6f555779154d4493b8185aa87a3b75bf','bea6ced41a7443254c904f34b1a6922df50af6aed4f7ecdbbcb9c32e0ee88a9c');
insert into SOCIALACCOUNT_SOCIALAPP_SITES (id,site_id,socialapp_id)
       values (1,1,1);
insert into SOCIALACCOUNT_SOCIALAPP_SITES (id,site_id,socialapp_id)
       values (2,1,2);
commit;
