-------------start 018234 新增项目资源 20180801-------------------
insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '投诉类型', '投诉类型', '0', 'adviceType', '0', '投诉类型', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'0');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '投诉', '投诉', '1', 'adviceType', '0', '投诉', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;

insert into PMS_CODE (ID, CODE_ZH, CODE_EN, CODE_VALUE, CODE_TYPE, CODE_FLAG, CODE_REMARK, CREATE_BY, CREATE_DATE, UPDATE_BY, UPDATE_DATE,whether_parent)
values (pms_code_tb_seq.nextval, '建议', '建议', '2', 'adviceType', '0', '建议', '1', 
to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'), 1, to_date('27-07-2018 15:07:32', 'dd-mm-yyyy hh24:mi:ss'),'1');
commit;


--投诉与建议操作权限
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R001_02_OPERATION', null, '2', '操作权限', '操作', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R001_02' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);
commit;
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R001_02_OPERATION_EDIT', null, '2', '新增/编辑建议', '新增/编辑建议', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R001_02_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 2, '0', null);
commit;
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R001_02_OPERATION_DELC', null, '2', '删除', '删除', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R001_02_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 3, '0', null);
commit;

--投诉与建议数据权限
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R001_02_DATA', null, '2', '数据权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R001_02'), 1, '0', null);
commit;
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R001_02_DATA_01', null, '2', '查看个人', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R001_02_DATA'), 2, '0', null);
commit;
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R001_02_DATA_02', null, '2', '查看公司', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R001_02_DATA'), 3, '0', null); 
commit;
alter table PMS_COMPLAINTS_ADVICES
drop column ADVICES_CONTENT;
alter table PMS_COMPLAINTS_ADVICES
add (ADVICES_CONTENT varchar2(2000));
COMMENT ON COLUMN "PMS"."PMS_COMPLAINTS_ADVICES"."ADVICES_CONTENT" IS '内容';