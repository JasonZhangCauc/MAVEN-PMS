----------start wb066 数据权限问题修改 20180801--------
UPDATE pms_project_baseinfo SET TO_DIVISION = NULL;
commit;
alter table pms_project_baseinfo modify TO_DIVISION NUMBER；
commit;
UPDATE pms_user SET DEPT_ID = NULL;
commit;
alter table pms_user modify DEPT_ID VARCHAR2(1000);
commit;



insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '项目经理', '项目经理', '2', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '产品经理', '产品经理', '3', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '部门负责人', '部门负责人', '4', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '商务人员', '商务人员', '5', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '研发经理', '研发经理', '6', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '公司领导', '公司领导', '7', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

commit;

UPDATE pms_resource SET resource_code='VIEW_04' WHERE resource_code='VIEW_03';

COMMIT;

UPDATE pms_resource SET resource_code='VIEW_03' WHERE resource_code='VIEW_02';

COMMIT;

UPDATE pms_resource SET RESOURCE_ORDER='3' WHERE resource_code='VIEW_03';
UPDATE pms_resource SET RESOURCE_ORDER='4' WHERE resource_code='VIEW_04';
commit;



insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看项目', '查看项目', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0407'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看项目', '查看项目', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0503'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看项目', '查看项目', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0504'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看项目', '查看项目', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0101'), 2, '0', null);

commit;

----------end wb066 数据权限问题修改 20180801--------


---------


insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R005_05', 'taskIssuedManager/taskIssuedManagerMain', '1', '任务控制台', 'workconsole', (
SELECT id FROM PMS_RESOURCE WHERE resource_code='R005'
), 3, '0', 'fa fa-tags');
commit;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'DATA0505', null, '2', '数据权限', '数据', (select id from PMS_RESOURCE where RESOURCE_CODE='R005_05'), 2, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'OPERATION0505', null, '2', '操作权限', '操作', (select id from PMS_RESOURCE where RESOURCE_CODE='R005_05'), 1, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0505'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看项目', '查看项目', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0505'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_03', null, '2', '查看本部门', '查看本部门', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0505'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_04', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0505'), 4, '0', null);
