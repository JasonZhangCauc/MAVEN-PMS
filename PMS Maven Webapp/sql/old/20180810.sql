-----start wb066 跟踪表脚本 20180808------
UPDATE pms_resource SET resource_url='projectManage/trackingManagerMain' WHERE resource_code='R004_04';
commit;


-----end wb066 跟踪表脚本 20180808------

-------------------------start lanjunjie 增加报销申请批准权限 20180808--------------
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_OPERATION_RATIFY', null, '2', '批准', '批准', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_OPERATION'), 6, '0', null);
COMMIT;
-------------------------end lanjunjie 增加报销申请批准权限 20180808--------------

----------start wb066 跟踪表脚本 20180810----------------

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '跟踪状态', '跟踪状态', '0', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已接收', '已接收', '1', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '方案完成', '方案完成', '2', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已审批', '已审批', '3', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;


insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已分配', '已分配', '4', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已反馈', '已反馈', '5', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已评估', '已评估', '6', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已计划', '已计划', '7', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '待验证', '待验证', '8', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已解决', '已解决', '9', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已取消', '已取消', '10', 'requirementStatus', '0', '跟踪状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;


insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_DATA', null, '2', '数据权限', '数据', (select id from PMS_RESOURCE where RESOURCE_CODE='R004_04'), 2, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_OPERATION', null, '2', '操作权限', '操作', (select id from PMS_RESOURCE where RESOURCE_CODE='R004_04'), 1, '0', null);
COMMIT;


insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_DATA_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='R004_04_DATA'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_DATA_02', null, '2', '查看项目', '查看项目', (select id from PMS_RESOURCE  where RESOURCE_CODE='R004_04_DATA'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_DATA_03', null, '2', '查看本部门', '查看本部门', (select id from PMS_RESOURCE  where RESOURCE_CODE='R004_04_DATA'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_DATA_04', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='R004_04_DATA'), 4, '0', null);
COMMIT;


insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_OPERATION_EDIT', null, '2', '新增/编辑', '新增/编辑', (select id from PMS_RESOURCE  where RESOURCE_CODE='R004_04_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_OPERATION_DEL', null, '2', '删除', '删除', (select id from PMS_RESOURCE  where RESOURCE_CODE='R004_04_OPERATION'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_04_OPERATION_DEAL', null, '2', '处理', '处理', (select id from PMS_RESOURCE  where RESOURCE_CODE='R004_04_OPERATION'), 3, '0', null);
COMMIT;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '反馈方式', '反馈方式', '0', 'feedbackWay', '0', '反馈方式', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '邮件', '邮件', '1', 'feedbackWay', '0', '反馈方式', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '微信', '微信', '2', 'feedbackWay', '0', '反馈方式', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '原因分类', '原因分类', '0', 'causeClassification', '0', '原因分类', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '代码质量', '代码质量/', '1', 'causeClassification', '0', '原因分类', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '业务变更', '业务变更', '2', 'causeClassification', '0', '原因分类', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

create sequence PMS_TRACKING_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20
cycle
order;

create table PMS_TRACKING
(
  id                   NUMBER not null,
  customer_id          NUMBER,
  project_id           NUMBER,
  put_dept             VARCHAR2(40),
  put_by               VARCHAR2(100),
  register_by          VARCHAR2(40),
  put_date             DATE,
  requirement_type     CHAR(1),
  describe             VARCHAR2(4000),
  priority             CHAR(1),
  whether_phase_ii     CHAR(1),
  expect_online_date   DATE,
  whether_scope        CHAR(1),
  whether_contract     CHAR(1),
  feedback_way         CHAR(1),
  requirement_status   CHAR(1),
  cause_classification CHAR(1),
  cause_analysis       VARCHAR2(4000),
  feedback_date        DATE,
  expected_time        NUMBER,
  cancel_date          DATE,
  planned_line_date    DATE,
  actually_line_date   DATE,
  complete_date        DATE,
  actual_working_hours NUMBER,
  batch_no             VARCHAR2(20),
  create_by            NUMBER,
  create_date          DATE,
  demand_num           VARCHAR2(40)
);
-- Add comments to the table 
comment on table PMS_TRACKING
  is '跟踪表';
-- Add comments to the columns 
comment on column PMS_TRACKING.id
  is 'ID';
comment on column PMS_TRACKING.customer_id
  is '客户ID';
comment on column PMS_TRACKING.project_id
  is '项目ID';
comment on column PMS_TRACKING.put_dept
  is '提出部门';
comment on column PMS_TRACKING.put_by
  is '提出人';
comment on column PMS_TRACKING.register_by
  is '登记人';
comment on column PMS_TRACKING.put_date
  is '提出日期';
comment on column PMS_TRACKING.requirement_type
  is '类型';
comment on column PMS_TRACKING.describe
  is '描述';
comment on column PMS_TRACKING.priority
  is '优先级';
comment on column PMS_TRACKING.whether_phase_ii
  is '是否二期';
comment on column PMS_TRACKING.expect_online_date
  is '预计上线时间';
comment on column PMS_TRACKING.whether_scope
  is '是否验收范围';
comment on column PMS_TRACKING.whether_contract
  is '是否合同';
comment on column PMS_TRACKING.feedback_way
  is '反馈方式';
comment on column PMS_TRACKING.requirement_status
  is '状态';
comment on column PMS_TRACKING.cause_classification
  is '原因分类';
comment on column PMS_TRACKING.cause_analysis
  is '原因分析';
comment on column PMS_TRACKING.feedback_date
  is '反馈时间';
comment on column PMS_TRACKING.expected_time
  is '预估工时';
comment on column PMS_TRACKING.cancel_date
  is '已取消时间';
comment on column PMS_TRACKING.planned_line_date
  is '计划上线时间';
comment on column PMS_TRACKING.actually_line_date
  is '实际上线时间';
comment on column PMS_TRACKING.complete_date
  is '更新完成时间';
comment on column PMS_TRACKING.actual_working_hours
  is '实际工时';
comment on column PMS_TRACKING.batch_no
  is '批次号';
comment on column PMS_TRACKING.create_by
  is '录入人';
comment on column PMS_TRACKING.create_date
  is '录入时间';
comment on column PMS_TRACKING.demand_num
  is '编号';
----------end wb066 跟踪表脚本 20180810----------------