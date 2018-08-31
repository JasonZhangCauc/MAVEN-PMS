alter table pms_code add (WHETHER_PARENT CHAR(1));

comment on column PMS_CODE.WHETHER_PARENT
  is '是否父级 0父级 1子级';

delete pms_code;
commit;

insert into pms_code (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '工时登记审核状态', 'workHoursStatus', '1', 'workHoursStatus', '0', '工时登记审核状态', 1, 
to_date('04-07-2018 15:45:33', 'dd-mm-yyyy hh24:mi:ss'), 113, to_date('04-07-2018 15:50:02', 'dd-mm-yyyy hh24:mi:ss'),'0');

 insert into pms_code (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已提交', 'send', '1', 'workHoursStatus', '0', '工时登记审核状态', 1, 
to_date('04-07-2018 15:45:33', 'dd-mm-yyyy hh24:mi:ss'), 113, to_date('04-07-2018 15:50:02', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into pms_code (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '编辑中', 'edit', '0', 'workHoursStatus', '0', '工时登记审核状态', 1, 
to_date('04-07-2018 15:45:36', 'dd-mm-yyyy hh24:mi:ss'), 113, to_date('04-07-2018 15:49:51', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into pms_code (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已审核', 'checked', '2', 'workHoursStatus', '0', '工时登记审核状态', 1, 
to_date('04-07-2018 15:47:28', 'dd-mm-yyyy hh24:mi:ss'), 113, to_date('04-07-2018 15:47:28', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into pms_code (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已拒绝', 'back', '3', 'workHoursStatus', '0', '工时登记审核状态', 1, 
to_date('04-07-2018 15:47:31', 'dd-mm-yyyy hh24:mi:ss'), 113, to_date('04-07-2018 15:49:10', 'dd-mm-yyyy hh24:mi:ss'),'1');


insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '项目阶段', '项目阶段', '0', 'projectPhase', '0', '项目阶段', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'0');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '进行中', '进行中', '0', 'projectPhase', '0', '项目阶段', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已关闭', '已关闭', '1', 'projectPhase', '0', '项目阶段', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '项目状态', '项目状态', '0', 'projectState', '0', '项目状态', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'0');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '正常', '正常', '0', 'projectState', '0', '项目状态', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '延误', '延误', '1', 'projectState', '0', '项目状态', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');


insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '工时类型', '工时类型', '0', 'workHoursType', '0', '工时类型', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '研发', '研发', '0', 'workHoursType', '0', '工时类型', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '实施', '实施', '1', 'workHoursType', '0', '工时类型', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '销售', '销售', '2', 'workHoursType', '0', '工时类型', 1, 
to_date('27-03-2018 15:08:12', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:08:12', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '性别', '性别', '0', 'sex', '0', '性别', 1, to_date('02-03-2018 13:15:43', 'dd-mm-yyyy hh24:mi:ss'), 
1, to_date('02-03-2018 13:15:43', 'dd-mm-yyyy hh24:mi:ss'),'0');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '男', 'man', '0', 'sex', '0', '性别', 1, to_date('02-03-2018 13:15:43', 'dd-mm-yyyy hh24:mi:ss'), 
1, to_date('02-03-2018 13:15:43', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '女', 'woman', '1', 'sex', '0', '性别', 1, to_date('02-03-2018 13:15:43', 'dd-mm-yyyy hh24:mi:ss'), 
1, to_date('02-03-2018 13:15:43', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '籍贯', '籍贯', '0', 'place', '0', '籍贯', 1, to_date('02-03-2018 13:38:56', 'dd-mm-yyyy hh24:mi:ss'), 
1, to_date('02-03-2018 13:38:56', 'dd-mm-yyyy hh24:mi:ss'),'0');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '湖南', 'hunan', '0', 'place', '0', '籍贯', 1, to_date('02-03-2018 13:38:56', 'dd-mm-yyyy hh24:mi:ss'), 
1, to_date('02-03-2018 13:38:56', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '安徽', 'anhui', '1', 'place', '0', '籍贯', 1, to_date('02-03-2018 13:38:56', 'dd-mm-yyyy hh24:mi:ss'), 
1, to_date('02-03-2018 13:38:56', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '党员', 'party member', '0', 'face', '0', '政治面貌', 1, to_date('02-03-2018 13:40:11', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('02-03-2018 13:40:11', 'dd-mm-yyyy hh24:mi:ss'),'0');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '党员', 'party member', '0', 'face', '0', '政治面貌', 1, to_date('02-03-2018 13:40:11', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('02-03-2018 13:40:11', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '团员', 'woman', '1', 'face', '0', '政治面貌', 1, to_date('02-03-2018 13:40:11', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('02-03-2018 13:40:11', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '学历', '学历', '0', 'record', '0', '学历', 1, to_date('02-03-2018 13:44:41', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('02-03-2018 13:44:41', 'dd-mm-yyyy hh24:mi:ss'),'0');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '大专', 'college', '0', 'record', '0', '学历', 1, to_date('02-03-2018 13:44:41', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('02-03-2018 13:44:41', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '本科', 'Undergraduate course', '1', 'record', '0', '学历', 1, to_date('02-03-2018 13:44:41', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('02-03-2018 13:44:41', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '岗位', '岗位', '0', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'0');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '开发工程师', '开发工程师', '0', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '实施工程师', '实施工程师', '1', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '用户性质', '用户性质', '1', 'userNature', '0', '用户性质', 1, to_date('12-03-2018 13:22:27', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('12-03-2018 13:22:27', 'dd-mm-yyyy hh24:mi:ss'),'0');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '外包', '外包', '1', 'userNature', '0', '外包', 1, to_date('12-03-2018 13:22:27', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('12-03-2018 13:22:27', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '合同员工', '合同员工', '0', 'userNature', '0', '合同员工', 1, to_date('12-03-2018 13:21:56', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('12-03-2018 13:21:56', 'dd-mm-yyyy hh24:mi:ss'),'1');

commit;



-----start wb066 新增数据权限 20180718----

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'DATA0101', null, '2', '数据权限', '数据', (select id from PMS_RESOURCE where RESOURCE_CODE='R001_01'), 2, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0101'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0101'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_03', null, '2', '查看本部门', '查看本部门', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0101'), 2, '0', null);


insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'OPERATION0407', null, '2', '操作权限', '操作', (select id from PMS_RESOURCE where RESOURCE_CODE='R004_07'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'DATA0407', null, '2', '数据权限', '数据', (select id from PMS_RESOURCE where RESOURCE_CODE='R004_07'), 2, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0407'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0407'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_03', null, '2', '查看本部门', '查看本部门', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0407'), 2, '0', null);
COMMIT;

UPDATE PMS_RESOURCE SET resource_pid=(SELECT id FROM PMS_RESOURCE WHERE resource_code='OPERATION0407') WHERE RESOURCE_code LIKE 'R004_070%';
-----end wb066 新增数据权限 20180718----

-----start wb066 数据权限修改 20180718----
UPDATE pms_resource SET resource_code='VIEW_03' where resource_descch='查看全部';
UPDATE pms_resource SET resource_code='VIEW_02' where resource_descch='查看本部门';

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '所属部门', '所属部门', '0', 'toDivision', '0', '所属部门', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '事业一部', '事业一部', '0', 'toDivision', '0', '所属部门', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '事业二部', '事业二部', '1', 'toDivision', '0', '所属部门', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
-----end wb066 数据权限修改 20180718----