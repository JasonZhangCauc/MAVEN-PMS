-----------START 绩效合约信息表 zlshi 20180809--------------------
  CREATE TABLE "PMS"."PMS_PERFORMANCECONTRACT" 
   (	"ID" NUMBER NOT NULL ENABLE, 
	"PC_TARGETTYPE" VARCHAR2(12 BYTE), 
	"PC_TARGETCONTENT" VARCHAR2(20 BYTE), 
	"PC_CHECKCONTENT" VARCHAR2(20 BYTE), 
	"PC_WEIGHT" NUMBER, 
	"PC_FREQUENCY" VARCHAR2(4 BYTE), 
	"PC_T1" VARCHAR2(4000 BYTE), 
	"PC_T2" VARCHAR2(4000 BYTE), 
	"PC_T3" VARCHAR2(4000 BYTE), 
	"PC_STATUS" VARCHAR2(6 BYTE), 
	"CREATE_DATE" DATE, 
	"PC_BY" VARCHAR2(20 BYTE), 
	"PC_LEVEL" VARCHAR2(10 BYTE), 
	"PC_GREADE" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 
 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1
  BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "DEV_TBS" ;

   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."ID" IS '序号';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_TARGETTYPE" IS '指标类别';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_TARGETCONTENT" IS '指标内容';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_CHECKCONTENT" IS '考核内容';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_WEIGHT" IS '权重';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_FREQUENCY" IS '考核频度';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_T1" IS 'T1指标(B)';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_T2" IS 'T2指标(A)';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_T3" IS 'T3指标(S)';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_STATUS" IS '合约状态';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."CREATE_DATE" IS '创建时间';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_BY" IS '提交人';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_LEVEL" IS '考核等级';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_GREADE" IS '考评得分';


   CREATE SEQUENCE  "PMS"."PMS_PERFORMANCECONTRACT_TB_SEQ"  MINVALUE 1 MAXVALUE 99999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;

-----------END 绩效合约信息表 zlshi 20180809--------------------------








-----------START 绩效合约操作状态 zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '绩效合约操作状态', '绩效合约操作状态', '0', 'performanceContractStatus', '0', '绩效合约操作状态', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '编辑中', '编辑中', '0', 'performanceContractStatus', '0', '编辑中', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已提交', '已提交', '1', 'performanceContractStatus', '0', '已提交', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '未达成', '未达成', '2', 'performanceContractStatus', '0', '未达成', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已达成', '已达成', '3', 'performanceContractStatus', '0', '已达成', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
-----------END 绩效合约操作状态 zlshi 20180813--------------------

-----------START 绩效合约审核状态 zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '绩效合约审核状态', '绩效合约审核状态', '0', 'performanceContractAuditStatus', '0', '绩效合约审核状态', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '未达成', '未达成', '2', 'performanceContractAuditStatus', '0', '未达成', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已达成', '已达成', '3', 'performanceContractAuditStatus', '0', '已达成', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');

commit;
-----------END 绩效合约审核状态 zlshi 20180813--------------------

-----------START 绩效合约指标类型 zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '绩效合约指标类别', '绩效合约指标类别', '0', 'performanceContractType', '0', '绩效合约指标类别', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '技能指标', '技能指标', '0', 'performanceContractType', '0', '技能指标', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '质量指标', '质量指标', '1', 'performanceContractType', '0', '质量指标', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
-----------END 绩效合约指标类型 zlshi 20180813--------------------

-----------START 绩效合约考核频度 zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '绩效合约考核频度', '绩效合约考核频度', '0', 'performanceContractFrequency', '0', '绩效合约考核频度', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '每周', '每周', '0', 'performanceContractFrequency', '0', '每周', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '每月', '每月', '1', 'performanceContractFrequency', '0', '每月', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '半年', '半年', '2', 'performanceContractFrequency', '0', '半年', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '一年', '一年', '3', 'performanceContractFrequency', '0', '一年', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
-----------END 绩效合约考核频度 zlshi 20180813--------------------

-----------START 绩效合约权限 zlshi 20180813--------------------
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_DATA', null, '2', '数据权限', '数据', (select id from PMS_RESOURCE where RESOURCE_CODE='R009_03'), 2, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION', null, '2', '操作权限', '操作', (select id from PMS_RESOURCE where RESOURCE_CODE='R009_03'), 1, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_DATA_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_DATA'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_DATA_02', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_DATA'), 2, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_VIEW', null, '2', '查看', '查看', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 0, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_ADD', null, '2', '新增', '新增', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_EDIT', null, '2', '编辑', '编辑', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_DEL', null, '2', '删除', '删除', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_COMMIT', null, '2', '提交', '提交', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 4, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_AUDIT', null, '2', '考核', '考核', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 5, '0', null);

COMMIT;
-----------END 绩效合约权限 zlshi 20180813--------------------

-----------START 绩效合约考核等级 zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '绩效合约考核等级', '绩效合约考核等级', '0', 'performanceContractLevel', '0', '绩效合约考核等级', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'S', 'S', '0', 'performanceContractLevel', '0', 'S', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'A', 'A', '1', 'performanceContractLevel', '0', 'A', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'B', 'B', '2', 'performanceContractLevel', '0', 'B', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
-----------END 绩效合约考核等级 zlshi 20180813--------------------
