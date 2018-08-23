-------start wb066 工作单菜单新增 20180725----------
alter table pms_update_log add (version_num varchar2(50));

comment on column PMS_UPDATE_LOG.version_num
  is '版本号';

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, 
RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R009', null, '0', '工作台', 'workbench', '0', 7, '0', 'icon-settings');
COMMIT;
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, 
RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R009_01', 'workOrderManager/workOrderManagerMain', '1', '工作单', 'workOrder', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R009' AND t1.resource_type='0' AND resource_isshow='0'), 0, '0', 'icon-users');


create sequence PMS_WORK_ORDER_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20
cycle
order;


create sequence PMS_SERVICE_TICKET_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20
cycle
order;
-------end wb066 工作单菜单新增 20180725----------

