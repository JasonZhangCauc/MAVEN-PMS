
alter table PMS_PROJECT_BASEINFO
add (product_manager varchar2(1000));
COMMIT;
comment on column PMS_PROJECT_BASEINFO.product_manager
  is '产品经理';
  
DELETE pms_code WHERE code_type='workHoursStatus' AND code_value='3';

alter table PMS_PROJECT_BASEINFO
add (audit_status CHAR(1));
COMMIT;
comment on column PMS_PROJECT_BASEINFO.audit_status
  is '审核状态 0待审核 1已审核';

UPDATE pms_project_baseinfo SET audit_status='1' WHERE 1=1;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '审核状态', '审核状态', '0', 'auditStatus', '0', '审核状态', '', 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '待审核', '待审核', '0', 'auditStatus', '0', '审核状态', 1, 
to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '已审核', '已审核', '1', 'auditStatus', '0', '审核状态', 1, 
to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-03-2018 15:07:51', 'dd-mm-yyyy hh24:mi:ss'),'1');

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_0703', null, '2', '审核', '审核', (select id from PMS_RESOURCE  where RESOURCE_CODE='OPERATION0407'), 3, '0', null);