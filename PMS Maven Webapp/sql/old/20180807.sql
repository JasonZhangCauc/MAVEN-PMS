-------start wb066 我的任务下拉框值初始化 20180807--------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '完成度', '完成度', '0', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '10%', '10%', '1', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '20%', '20%', '2', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '30%', '30%', '3', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '40%', '40%', '4', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '50%', '50%', '5', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '60%', '60%', '6', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '70%', '70%', '7', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '80%', '80%', '8', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '90%', '90%', '9', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '100%', '100%', '10', 'completeDegree', '0', '完成度', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

alter table pms_task_issued modify (COMPLETE_DEGREE varchar2(2));

-------end wb066 我的任务下拉框值初始化 20180807--------------

------------start lanjunjie 增加差旅报销表 20180807-------- 

-- Create table
create table PMS_REIMBURSE
(
  id             NUMBER not null,
  apply_no       VARCHAR2(10),
  reimburse_no   VARCHAR2(10),
  reimburse_type VARCHAR2(25),
  user_name      VARCHAR2(25),
  user_no        VARCHAR2(10),
  project        VARCHAR2(50),
  depart_place   VARCHAR2(10),
  arrive_place   VARCHAR2(10),
  apply_time     DATE,
  amount         NUMBER(11,2),
  remark         VARCHAR2(4000),
  status         VARCHAR2(10),
  create_by      VARCHAR2(20),
  create_date    DATE
);
-- Add comments to the columns 
comment on column PMS_REIMBURSE.id
  is '主键、自增';
comment on column PMS_REIMBURSE.apply_no
  is '申请单单号';
comment on column PMS_REIMBURSE.reimburse_no
  is '报销单单号';
comment on column PMS_REIMBURSE.reimburse_type
  is '报销类型';
comment on column PMS_REIMBURSE.user_name
  is '申请人姓名';
comment on column PMS_REIMBURSE.user_no
  is '申请人工号';
comment on column PMS_REIMBURSE.project
  is '报销所属项目名称';
comment on column PMS_REIMBURSE.depart_place
  is '出发地点';
comment on column PMS_REIMBURSE.arrive_place
  is '到达地点';
comment on column PMS_REIMBURSE.apply_time
  is '申请时间';
comment on column PMS_REIMBURSE.amount
  is '预计报销金额';
comment on column PMS_REIMBURSE.remark
  is '备注（报销申请说明）';
comment on column PMS_REIMBURSE.status
  is '申请单状态';
comment on column PMS_REIMBURSE.create_by
  is '创建人id';
comment on column PMS_REIMBURSE.create_date
  is '创建日期';

CREATE SEQUENCE  "PMS"."PMS_REIMBURSE_ID_SEQ"  MINVALUE 1 MAXVALUE 99999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
   
commit;
------------end lanjunjie 增加差旅报销表 20180807-------- 


------------start lanjunjie 增加 "报销类型"字典值 20180807-------- 
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '报销类型', '报销类型', '0', 'applyType', '0', '报销类型', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '国内公务差旅费', '国内公务差旅费', '1', 'applyType', '0', '国内公务差旅费', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '国内会务费', '国内会务费', '2', 'applyType', '0', '国内会务费', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '国内差旅其他费用', '国内差旅其他费用', '3', 'applyType', '0', '国内差旅其他费用', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '国内培训费', '国内培训费', '4', 'applyType', '0', '国内培训费', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
------------end lanjunjie 增加 "报销类型"字典值 20180807-------- 

------------start lanjunjie 增加差率报销数据/操作权限控制 20180807-------- 
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_DATA', null, '2', '数据权限', '数据', (select id from PMS_RESOURCE where RESOURCE_CODE='R011_01'), 2, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_OPERATION', null, '2', '操作权限', '操作', (select id from PMS_RESOURCE where RESOURCE_CODE='R011_01'), 1, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_DATA_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_DATA'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_DATA_02', null, '2', '查看项目', '查看项目', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_DATA'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_DATA_03', null, '2', '查看本部门', '查看本部门', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_DATA'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_DATA_04', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_DATA'), 4, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_OPERATION_ADD', null, '2', '新增', '新增', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_OPERATION_EDIT', null, '2', '编辑', '编辑', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_OPERATION'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_OPERATION_DEL', null, '2', '删除', '删除', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_OPERATION'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_OPERATION_COMMIT', null, '2', '提交', '提交', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_OPERATION'), 4, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R011_01_OPERATION_AUDIT', null, '2', '审核', '审核', (select id from PMS_RESOURCE  where RESOURCE_CODE='R011_01_OPERATION'), 5, '0', null);
COMMIT;
------------end lanjunjie 增加差率报销数据/操作权限控制 20180807-------- 

------------start lanjunjie 增加差率报销申请处理状态字典 20180807-------- 

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '报销申请状态', '报销申请状态', '0', 'applyStatus', '0', '报销申请状态', '1', 
to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '编辑中', '编辑中', '1', 'applyStatus', '0', '编辑中', '1', 
to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'), 2, to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已提交', '已提交', '2', 'applyStatus', '0', '已提交', '1', 
to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已上报', '已上报', '3', 'applyStatus', '0', '已上报', '1', 
to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已审批', '已审批', '4', 'applyStatus', '0', '已审批', '1', 
to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('07-08-2018 15:26:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
------------end lanjunjie 增加差率报销申请处理状态字典 20180807-------- 

------------start zhangjiaming 增加差率报销申请处理状态字典 20180807-------- 
create table PMS_CHICKIN
(
  id             NUMBER not null,
  chickin_state  CHAR(1),
  chickin_by     VARCHAR2(50),
  chickin_time   DATE,
  chickin_type   CHAR(1),
  chickin_reason VARCHAR2(4000)
);
-- Add comments to the columns 
comment on column PMS_CHICKIN.id
  is '序号';
comment on column PMS_CHICKIN.chickin_state
  is '状态 1：正常；2：待审核；3：已审核';
comment on column PMS_CHICKIN.chickin_by
  is '姓名';
comment on column PMS_CHICKIN.chickin_time
  is '时间';
comment on column PMS_CHICKIN.chickin_type
  is '类型 1：上班；2：下班';
comment on column PMS_CHICKIN.chickin_reason
  is '补签理由';


CREATE SEQUENCE  "PMS"."PMS_CHICKIN_TB_SEQ"  MINVALUE 1 MAXVALUE 9999999999 INCREMENT BY 1 START WITH 1 CACHE 20 ORDER  CYCLE ;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '考勤状态', '考勤状态', '0', 'chinkinStatus', '0', '考勤状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '待审核', '待审核', '2', 'chinkinStatus', '0', '待审核', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已审核', '已审核', '2', 'chinkinStatus', '0', '已审核', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '正常', '正常', '3', 'chinkinStatus', '0', '正常', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '考勤类型', '考勤类型', '0', 'chinkinType', '0', '考勤类型', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '上班', '上班', '1', 'chinkinType', '0', '上班', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '下班', '下班', '2', 'chinkinType', '0', '下班', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '签卡类型', '签卡类型', '0', 'checkType', '0', '签卡类型', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '上班', '上班', '1', 'checkType', '0', '上班', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '下班', '下班', '2', 'checkType', '0', '下班', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R012_01_OPERATION', null, '2', '操作权限', '操作', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R012_01' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);
commit;
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R012_01_OPERATION_EDIT', null, '2', '新增/编辑', '新增/编辑', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R012_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 1, '0', null);
commit;
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R012_01_OPERATION_DEL', null, '2', '删除', '删除', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R012_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 2, '0', null);
commit;
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R012_01_OPERATION_AUTH', null, '2', '审核', '审核', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R012_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 3, '0', null);
commit;

insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R012_01_DATA', null, '2', '数据权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R012_01'), 1, '0', null);
commit;
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R012_01_DATA_01', null, '2', '查看个人', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R012_01_DATA'), 1, '0', null);
commit;
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R012_01_DATA_02', null, '2', '查看项目', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R012_01_DATA'), 1, '0', null);
commit;
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R012_01_DATA_03', null, '2', '查看部门', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R012_01_DATA'), 1, '0', null);
commit;
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R012_01_DATA_04', null, '2', '查看公司', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R012_01_DATA'), 1, '0', null); 
commit;
------------end zhangjiaming 增加差率报销申请处理状态字典 20180807-------- 
