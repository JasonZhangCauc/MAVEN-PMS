-----------START ��Ч��Լ��Ϣ�� zlshi 20180809--------------------
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

   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."ID" IS '���';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_TARGETTYPE" IS 'ָ�����';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_TARGETCONTENT" IS 'ָ������';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_CHECKCONTENT" IS '��������';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_WEIGHT" IS 'Ȩ��';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_FREQUENCY" IS '����Ƶ��';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_T1" IS 'T1ָ��(B)';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_T2" IS 'T2ָ��(A)';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_T3" IS 'T3ָ��(S)';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_STATUS" IS '��Լ״̬';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."CREATE_DATE" IS '����ʱ��';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_BY" IS '�ύ��';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_LEVEL" IS '���˵ȼ�';
   COMMENT ON COLUMN "PMS"."PMS_PERFORMANCECONTRACT"."PC_GREADE" IS '�����÷�';


   CREATE SEQUENCE  "PMS"."PMS_PERFORMANCECONTRACT_TB_SEQ"  MINVALUE 1 MAXVALUE 99999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;

-----------END ��Ч��Լ��Ϣ�� zlshi 20180809--------------------------








-----------START ��Ч��Լ����״̬ zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '��Ч��Լ����״̬', '��Ч��Լ����״̬', '0', 'performanceContractStatus', '0', '��Ч��Լ����״̬', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '�༭��', '�༭��', '0', 'performanceContractStatus', '0', '�༭��', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '���ύ', '���ύ', '1', 'performanceContractStatus', '0', '���ύ', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'δ���', 'δ���', '2', 'performanceContractStatus', '0', 'δ���', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '�Ѵ��', '�Ѵ��', '3', 'performanceContractStatus', '0', '�Ѵ��', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
-----------END ��Ч��Լ����״̬ zlshi 20180813--------------------

-----------START ��Ч��Լ���״̬ zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '��Ч��Լ���״̬', '��Ч��Լ���״̬', '0', 'performanceContractAuditStatus', '0', '��Ч��Լ���״̬', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'δ���', 'δ���', '2', 'performanceContractAuditStatus', '0', 'δ���', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '�Ѵ��', '�Ѵ��', '3', 'performanceContractAuditStatus', '0', '�Ѵ��', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');

commit;
-----------END ��Ч��Լ���״̬ zlshi 20180813--------------------

-----------START ��Ч��Լָ������ zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '��Ч��Լָ�����', '��Ч��Լָ�����', '0', 'performanceContractType', '0', '��Ч��Լָ�����', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '����ָ��', '����ָ��', '0', 'performanceContractType', '0', '����ָ��', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '����ָ��', '����ָ��', '1', 'performanceContractType', '0', '����ָ��', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
-----------END ��Ч��Լָ������ zlshi 20180813--------------------

-----------START ��Ч��Լ����Ƶ�� zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '��Ч��Լ����Ƶ��', '��Ч��Լ����Ƶ��', '0', 'performanceContractFrequency', '0', '��Ч��Լ����Ƶ��', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'ÿ��', 'ÿ��', '0', 'performanceContractFrequency', '0', 'ÿ��', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'ÿ��', 'ÿ��', '1', 'performanceContractFrequency', '0', 'ÿ��', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '����', '����', '2', 'performanceContractFrequency', '0', '����', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, 'һ��', 'һ��', '3', 'performanceContractFrequency', '0', 'һ��', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;
-----------END ��Ч��Լ����Ƶ�� zlshi 20180813--------------------

-----------START ��Ч��ԼȨ�� zlshi 20180813--------------------
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_DATA', null, '2', '����Ȩ��', '����', (select id from PMS_RESOURCE where RESOURCE_CODE='R009_03'), 2, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION', null, '2', '����Ȩ��', '����', (select id from PMS_RESOURCE where RESOURCE_CODE='R009_03'), 1, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_DATA_01', null, '2', '�鿴����', '�鿴����', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_DATA'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_DATA_02', null, '2', '�鿴ȫ��', '�鿴ȫ��', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_DATA'), 2, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_VIEW', null, '2', '�鿴', '�鿴', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 0, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_ADD', null, '2', '����', '����', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_EDIT', null, '2', '�༭', '�༭', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_DEL', null, '2', 'ɾ��', 'ɾ��', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_COMMIT', null, '2', '�ύ', '�ύ', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 4, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R009_03_OPERATION_AUDIT', null, '2', '����', '����', (select id from PMS_RESOURCE  where RESOURCE_CODE='R009_03_OPERATION'), 5, '0', null);

COMMIT;
-----------END ��Ч��ԼȨ�� zlshi 20180813--------------------

-----------START ��Ч��Լ���˵ȼ� zlshi 20180813--------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '��Ч��Լ���˵ȼ�', '��Ч��Լ���˵ȼ�', '0', 'performanceContractLevel', '0', '��Ч��Լ���˵ȼ�', '', 
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
-----------END ��Ч��Լ���˵ȼ� zlshi 20180813--------------------
