---------------start 018234 更新角色数据 20180814-------------------
update pms_resource set resource_pid = 239  where id = 243;
commit;
update pms_resource set RESOURCE_ISSHOW = 1  where id = 24;
commit;
delete from PMS_CODE where id in(55,56,58,60,62,64,66,68,70);
commit;
delete from PMS_CODE where id in(40);
commit;
---------------end 018234 更新角色数据 20180814-------------------