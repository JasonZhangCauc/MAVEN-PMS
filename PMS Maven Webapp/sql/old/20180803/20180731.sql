-------------start 018234 新增项目资源 20180801-------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '销售状态', '销售状态', '0', 'saleStatus', '0', '销售状态', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '进行中', '进行中', '1', 'saleStatus', '0', '进行中', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '招标中', '招标中', '2', 'saleStatus', '0', '招标中', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已中标', '已中标', '3', 'saleStatus', '0', '已中标', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '签约中', '签约中', '4', 'saleStatus', '0', '签约中', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已签约', '已签约', '5', 'saleStatus', '0', '已签约', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已取消', '已取消', '6', 'saleStatus', '0', '已取消', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;


--添加币种
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '币种', '币种', '0', 'btype', '0', '币种', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'RMB', 'RMB', '1', 'btype', '0', 'RMB', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'USD', 'USD', '2', 'btype', '0', 'USD', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'TWD', 'TWD', '3', 'btype', '0', 'TWD', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '活动类型', '活动类型', '0', 'activityType', '0', '活动类型', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '推广', '推广', '1', 'activityType', '0', '推广', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '招待', '招待', '2', 'activityType', '0', '招待', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '调研', '调研', '3', 'activityType', '0', '调研', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
-------------end 018234 新增项目资源 20180801-------------------
-------------start 018234 创建项目监控表 20180803-------------------
-- Create table
create table PMS_MONI_INFO
(
  id                  NUMBER not null,
  moni_status         VARCHAR2(10),
  moni_title          VARCHAR2(4000),
  moni_start_date     DATE,
  moni_end_date       DATE,
  moni_instruction    VARCHAR2(2000),
  create_by           NUMBER,
  create_date         DATE,
  update_by           NUMBER,
  update_date         DATE,
  project_baseinfo_id NUMBER
);

-- Add comments to the table 
comment on table PMS_MONI_INFO
  is '监控信息表';
-- Add comments to the columns 
comment on column PMS_MONI_INFO.id
  is 'ID';
comment on column PMS_MONI_INFO.moni_status
  is '状态';
comment on column PMS_MONI_INFO.moni_title
  is '标题';
comment on column PMS_MONI_INFO.moni_start_date
  is '开始时间';
comment on column PMS_MONI_INFO.moni_end_date
  is '结束时间';
comment on column PMS_MONI_INFO.moni_instruction
  is '说明';
comment on column PMS_MONI_INFO.create_by
  is '录入人';
comment on column PMS_MONI_INFO.create_date
  is '录入时间';
comment on column PMS_MONI_INFO.update_by
  is '修改人';
comment on column PMS_MONI_INFO.update_date
  is '修改时间';
comment on column PMS_MONI_INFO.project_baseinfo_id
  is '关联项目id';

create sequence PMS_MONI_INFO_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20
order;
commit;

-- Create table
create table PMS_MONI_DOCUMENT
(
  id            NUMBER not null,
  moni_duc_id   NUMBER,
  moni_filename VARCHAR2(500),
  moni_filetype VARCHAR2(50),
  uploadby      NUMBER,
  uploaddate    DATE,
  file_path     VARCHAR2(500)
);
-- Add comments to the table 
comment on table PMS_MONI_DOCUMENT
  is '监控文档表';
-- Add comments to the columns 
comment on column PMS_MONI_DOCUMENT.id
  is 'ID';
comment on column PMS_MONI_DOCUMENT.moni_duc_id
  is '监控id';
comment on column PMS_MONI_DOCUMENT.moni_filename
  is '文件名';
comment on column PMS_MONI_DOCUMENT.moni_filetype
  is '文件类型';
comment on column PMS_MONI_DOCUMENT.uploadby
  is '上传人';
comment on column PMS_MONI_DOCUMENT.uploaddate
  is '上传时间';
comment on column PMS_MONI_DOCUMENT.file_path
  is '上传路径';

create sequence PMS_MONI_DOCUMENT_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20
order;
commit;
-------------end 018234 创建项目监控表 20180803-------------------

-------------start 018234 立项表添加字段 20180807-------------------
alter table PMS_PROJECT_BASEINFO add BELONG_CUSTOM_ID NUMBER;
comment on column PMS_PROJECT_BASEINFO.BELONG_CUSTOM_ID is '所属客户';

alter table PMS_PROJECT_BASEINFO add SALE_RESPONSIBLE NUMBER;
comment on column PMS_PROJECT_BASEINFO.SALE_RESPONSIBLE is '销售人员';

alter table PMS_PROJECT_BASEINFO add BELONG_PRODUCT NUMBER;
comment on column PMS_PROJECT_BASEINFO.BELONG_PRODUCT is '所属产品';

-------------end 018234 立项表添加字段 20180807-------------------

-------------start 018234 客户表添加log 20180809-------------------
alter table PMS_CUSTOMER add USER_PIC varchar2(100);
comment on column PMS_CUSTOMER.USER_PIC is '公司Log';
-------------end 018234 客户表添加log 20180809-------------------
-------------start 018234 初始化客户默认角色 20180810-------------------
insert into PMS_ROLE (id, role_code, role_cname, role_ename, role_flag, role_desc, create_by, create_date, update_by, update_date)
values (PMS_ROLE_TB_SEQ.NEXTVAL, 'RE100', '客户默认角色', NULL, '0', null, 'admin', SYSDATE, null, null);
-------------end 018234 初始化客户默认角色 20180810-------------------

-------------start 018234 初始化岗位信息20180810-------------------
delete from PMS_CODE where code_zh = '实施工程师';

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '产品经理', '产品经理', '1', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '质量主管', '质量主管', '2', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '项目经理', '项目经理', '3', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '研发经理', '研发经理', '4', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '事业部总监', '事业部总监', '5', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '质量控制工程师', '质量控制工程师', '6', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '前端工程师', '前端工程师', '7', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '视觉设计工程师', '视觉设计工程师', '8', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '销售经理', '销售经理', '9', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '总经理', '总经理', '10', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '副总经理', '副总经理', '11', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '前台行政', '前台行政', '13', 'position', '0', '岗位', 1, to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'), 1, 
to_date('05-03-2018 17:01:45', 'dd-mm-yyyy hh24:mi:ss'),'1');
-------------end 018234 初始化岗位信息20180810-------------------