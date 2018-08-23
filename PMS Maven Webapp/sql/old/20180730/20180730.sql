-------------start wb066 新增项目维护菜单 20180703-------------------
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_07', 'projectBaseinfoManager/projectBaseInfoMain', '1',
'项目维护', 'projectbaseinfo', 4, 6, '0', 'icon-users');

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_0701', null, '2', '新增/编辑', '新增/编辑', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_07' AND t1.resource_type='1' AND resource_isshow='0'), 0, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_0702', null, '2', '删除', '删除', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_07' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);


insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE)
values (pms_code_tb_seq.nextval, '进行中', '进行中', '0', 'projectPhase', '0', '项目阶段', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE)
values (pms_code_tb_seq.nextval, '已关闭', '已关闭', '1', 'projectPhase', '0', '项目阶段', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'));

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE)
values (pms_code_tb_seq.nextval, '正常', '正常', '0', 'projectState', '0', '项目状态', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'));
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE)
values (pms_code_tb_seq.nextval, '延误', '延误', '1', 'projectState', '0', '项目状态', 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'));

create table PMS_PROJECT_BASEINFO
(
  id                 NUMBER not null,
  project_name       VARCHAR2(100),
  to_division        CHAR(1),
  project_head       VARCHAR2(1000),
  business_people    VARCHAR2(1000),
  project_manager    VARCHAR2(1000),
  project_resource   VARCHAR2(1000),
  begin_time         DATE,
  end_time           DATE,
  estimated_workload VARCHAR2(100),
  expired_hours      VARCHAR2(100),
  contract_amount    VARCHAR2(100),
  profit_targets     VARCHAR2(100),
  project_phase      VARCHAR2(100),
  naturally_cost     VARCHAR2(100),
  project_status     VARCHAR2(10),
  expiration_date    VARCHAR2(100),
  create_by          NUMBER,
  create_date        DATE
);

comment on table PMS_PROJECT_BASEINFO
  is '项目基本信息';
-- Add comments to the columns 
comment on column PMS_PROJECT_BASEINFO.id
  is '项目ID';
comment on column PMS_PROJECT_BASEINFO.project_name
  is '项目名称';
comment on column PMS_PROJECT_BASEINFO.to_division
  is '所属事业部';
comment on column PMS_PROJECT_BASEINFO.project_head
  is '项目负责人';
comment on column PMS_PROJECT_BASEINFO.business_people
  is '商务人员';
comment on column PMS_PROJECT_BASEINFO.project_manager
  is '项目经理';
comment on column PMS_PROJECT_BASEINFO.project_resource
  is '项目资源';
comment on column PMS_PROJECT_BASEINFO.begin_time
  is '工期-开始';
comment on column PMS_PROJECT_BASEINFO.end_time
  is '工期-结束';
comment on column PMS_PROJECT_BASEINFO.estimated_workload
  is '预估工作量';
comment on column PMS_PROJECT_BASEINFO.expired_hours
  is '已耗工时';
comment on column PMS_PROJECT_BASEINFO.contract_amount
  is '合同金额';
comment on column PMS_PROJECT_BASEINFO.profit_targets
  is '利润指标';
comment on column PMS_PROJECT_BASEINFO.project_phase
  is '项目阶段';
comment on column PMS_PROJECT_BASEINFO.naturally_cost
  is '人天成本';
comment on column PMS_PROJECT_BASEINFO.project_status
  is '项目状态';
comment on column PMS_PROJECT_BASEINFO.expiration_date
  is '超期时间';
comment on column PMS_PROJECT_BASEINFO.create_by
  is '录入人';
comment on column PMS_PROJECT_BASEINFO.create_date
  is '录入日期';
  
  
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R007_03', 'projectBaseinfoManager/costReportMain', '1',
'成本报表', 'projectbaseinfo', 7, 2, '0', 'fa fa-file-archive-o');

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R007_0301', null, '2', '查看', '查看', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R007_03' AND t1.resource_type='1' AND resource_isshow='0'), 0, '0', null);
-------------end wb066 新增项目维护菜单 20180703-------------------

--------strat wb066 新增用户ip字段 20180706-------
alter table PMS_USER
add (USER_IP VARCHAR2(100) DEFAULT '用户IP');
-------end wb066 新增用户ip字段 20180706-------

------ start wb066 修改菜单显示 20180712----
UPDATE pms_resource SET resource_isshow='1' WHERE resource_code IN ('R002','R003','R004_01','R004_02','R004_03','R004_04','R004_05',
'R004_06','R005_01','R005_02','R006','R007_01','R007_02');

UPDATE pms_resource SET resource_isshow='1' WHERE resource_pid IN (
SELECT ID FROM pms_resource WHERE resource_isshow='1'
);

UPDATE pms_resource SET resource_isshow='1' WHERE resource_pid IN (
SELECT ID FROM pms_resource WHERE resource_isshow='1'
);

UPDATE pms_resource SET resource_isshow='1' WHERE resource_pid IN (
SELECT ID FROM pms_resource WHERE resource_isshow='1'
);
------ end wb066 修改菜单显示 20180712----

------ start 018234 用户表添加类别 20180725----
alter table PMS_USER add USER_TYPE varchar2(4);
comment on column PMS_USER.USER_TYPE is '用户类别 0:用户、1:客户';
alter table PMS_USER modify USER_TYPE default 0;

alter table PMS_USER add USER_CONTACT_ID NUMBER;
comment on column PMS_USER.USER_CONTACT_ID is '客户id一对一';
------ end 018234 用户表添加类别 20180725----

------ start 018234 客户表添加二字码 20180725----
alter table PMS_CUSTOMER add SECOND varchar2(25);
comment on column PMS_CUSTOMER.SECOND is '客户二字码';
------ end 018234 客户表添加二字码 20180725----

------ start 018234 督办功能 20180725----
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R005_04', 'superviseWork/superviseWorkList', '1',
'督办管理', 'superviseWork', 5, 4, '0', 'fa fa-bar-chart');
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'OPERATION0504', null, '2', '操作权限', '操作', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R005_04' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);
commit;


insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R005_0401', null, '2', '新增/编辑', '新增/编辑', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='OPERATION0504' AND t1.resource_type='2' AND resource_isshow='0'), 1, '0', null);
commit;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R005_0402', null, '2', '审批', '审批', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='OPERATION0504' AND t1.resource_type='2' AND resource_isshow='0'), 2, '0', null);
commit;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R005_0403', null, '2', '删除', '删除', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='OPERATION0504' AND t1.resource_type='2' AND resource_isshow='0'), 2, '0', null);
commit;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R005_0405', null, '2', '查看', '查看', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='OPERATION0504' AND t1.resource_type='2' AND resource_isshow='0'), 5, '0', null);
commit;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R005_0405', null, '2', '调整', '调整', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='OPERATION0504' AND t1.resource_type='2' AND resource_isshow='0'), 6, '0', null);
commit;


insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'DATA0504', null, '2', '数据权限', '数据', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R005_04' AND t1.resource_type='1' AND resource_isshow='0'), 2, '0', null);
commit;


insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '质量部', '质量部', '2', 'toDivision', '0', '所属部门', 1, 
to_date('27-07-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '产品部', '产品部', '3', 'toDivision', '0', '所属部门', 1, 
to_date('27-07-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '商务部', '商务部', '4', 'toDivision', '0', '所属部门', 1, 
to_date('27-07-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '任务来源', '任务来源', '0', 'taskSource', '0', '任务来源', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '微信', '微信', '1', 'taskSource', '0', '微信', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'QQ', 'QQ', '2', 'taskSource', '0', 'QQ', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '邮件', '邮件', '3', 'taskSource', '0', '邮件', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '电话', '电话', '4', 'taskSource', '0', '电话', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '领导', '领导', '5', 'taskSource', '0', '领导', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '会议', '会议', '6', 'taskSource', '0', '会议', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;




insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '项目', '项目', '0', 'projectonly', '0', '项目', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'MIS', 'MIS', '1', 'projectonly', '0', 'MIS', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'SMS', 'SMS', '2', 'projectonly', '0', 'SMS', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'FOC', 'FOC', '3', 'projectonly', '0', 'FOC', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'FCS', 'FCS', '4', 'projectonly', '0', 'FCS', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'SMP', 'SMP', '5', 'projectonly', '0', 'SMP', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '局方', '局方', '6', 'projectonly', '0', '局方', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '内部项目', '内部项目', '7', 'projectonly', '0', '内部项目', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;



insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '优先级', '优先级', '0', 'priorityonly', '0', '优先级', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '紧急', '紧急', '1', 'priorityonly', '0', '紧急', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '高', '高', '2', 'priorityonly', '0', '高', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '中', '中', '3', 'priorityonly', '0', '中', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '低', '低', '4', 'priorityonly', '0', '低', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;


insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '结论', '结论', '0', 'conclusion', '0', '结论', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '待观察', '待观察', '1', 'conclusion', '0', '待观察', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已延误', '已延误', '2', 'conclusion', '0', '已延误', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '失控', '失控', '3', 'conclusion', '0', '失控', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已完成', '已完成', '4', 'conclusion', '0', '已完成', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0504'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看本部门', '查看本部门', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0504'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_03', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0504'), 3, '0', null);


create table PMS_OVERSEE
(
  id                        NUMBER not null,
  initiate_by               NUMBER,
  number_date               DATE,
  responsible_main          VARCHAR2(500),
  responsible_secondary     VARCHAR2(500),
  responsibility_department VARCHAR2(500),
  task_source               VARCHAR2(50),
  relevance_project         VARCHAR2(50),
  priority                  VARCHAR2(50),
  task_definition           VARCHAR2(4000),
  required_date             DATE,
  adjust_reason             VARCHAR2(4000),
  actual_date               DATE,
  whether_delay             CHAR(1),
  delay_day                 NUMBER,
  whether_advance           CHAR(1),
  advance_date              NUMBER,
  conclusion                VARCHAR2(4000),
  performance               VARCHAR2(4000),
  delay_time                DATE,
  create_by                 NUMBER,
  create_date               DATE,
  accepter                  VARCHAR2(50),
  status                    CHAR(1)
)
tablespace DEV_TBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table PMS_OVERSEE
  is '督办表';
-- Add comments to the columns 
comment on column PMS_OVERSEE.id
  is 'ID';
comment on column PMS_OVERSEE.initiate_by
  is '发起人';
comment on column PMS_OVERSEE.number_date
  is '发起时间';
comment on column PMS_OVERSEE.responsible_main
  is '主要责任人';
comment on column PMS_OVERSEE.responsible_secondary
  is '次要责任人';
comment on column PMS_OVERSEE.responsibility_department
  is '责任部门';
comment on column PMS_OVERSEE.task_source
  is '任务来源';
comment on column PMS_OVERSEE.relevance_project
  is '项目';
comment on column PMS_OVERSEE.priority
  is '优先级';
comment on column PMS_OVERSEE.task_definition
  is '任务内容';
comment on column PMS_OVERSEE.required_date
  is '要求完成时间';
comment on column PMS_OVERSEE.adjust_reason
  is '调整原因';
comment on column PMS_OVERSEE.actual_date
  is '实际完成时间';
comment on column PMS_OVERSEE.whether_delay
  is '是否延期';
comment on column PMS_OVERSEE.delay_day
  is '延期天数';
comment on column PMS_OVERSEE.whether_advance
  is '是否提前完成';
comment on column PMS_OVERSEE.advance_date
  is '提前完成时间';
comment on column PMS_OVERSEE.conclusion
  is '结论';
comment on column PMS_OVERSEE.performance
  is '奖惩绩效';
comment on column PMS_OVERSEE.delay_time
  is '申请延长前截止日期';
comment on column PMS_OVERSEE.create_by
  is '录入人';
comment on column PMS_OVERSEE.create_date
  is '录入日期';
comment on column PMS_OVERSEE.accepter
  is '验收人';
comment on column PMS_OVERSEE.status
  is '状态:0待审核，1已审核';

create sequence PMS_OVERSEE_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20
order;
commit;

------ end 018234 督办功能 20180725----

------ start 018234 增加关联表 20180728----

create table PMS_ADJUST_RECORD
(
  id                NUMBER not null,
  adjust_old_time   DATE,
  adjust_last_time  DATE,
  adjust_why        VARCHAR2(2000),
  adjust_person     VARCHAR2(25),
  adjust_time       DATE,
  oversee_adjust_id NUMBER
)
tablespace DEV_TBS
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 16K
    next 8K
    minextents 1
  );
comment on table PMS_ADJUST_RECORD
  is '督办调整记录表';
comment on column PMS_ADJUST_RECORD.id
  is 'ID';
comment on column PMS_ADJUST_RECORD.adjust_old_time
  is '调整前时间';
comment on column PMS_ADJUST_RECORD.adjust_last_time
  is '调整后时间';
comment on column PMS_ADJUST_RECORD.adjust_why
  is '调整原因';
comment on column PMS_ADJUST_RECORD.adjust_person
  is '调整人';
comment on column PMS_ADJUST_RECORD.adjust_time
  is '调整时间';
comment on column PMS_ADJUST_RECORD.oversee_adjust_id
  is '督办调整关联id';


create sequence PMS_ADJUST_RECORDNEW
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20
order;
commit;

------ end 018234 增加关联表 20180728----


insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '是否', '是否', '0', 'isNot', '0', '是否', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '是', '是', '1', 'isNot', '0', '是', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '否', '否', '2', 'isNot', '0', '否', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

