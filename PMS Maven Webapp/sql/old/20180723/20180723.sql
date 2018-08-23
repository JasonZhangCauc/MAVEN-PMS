-------start 20180723 新增更新日志表 wb066 --------
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R001_10', 'updateLog/updateLogMain', '1',
'更新日志', 'updateLog', 1, 9, '0', 'fa fa-file-archive-o');
commit;

create sequence PMS_update_log_TB_SEQ
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20
cycle
order;

create table PMS_UPDATE_LOG
(
  id             NUMBER not null,
  update_date    DATE,
  update_content VARCHAR2(4000),
  create_by      NUMBER,
  create_date    DATE
);

comment on table PMS_UPDATE_LOG
  is '更新日志';
-- Add comments to the columns 
comment on column PMS_UPDATE_LOG.id
  is 'ID';
comment on column PMS_UPDATE_LOG.update_date
  is '更新日期';
comment on column PMS_UPDATE_LOG.update_content
  is '更新内容';
comment on column PMS_UPDATE_LOG.create_by
  is '录入人';
comment on column PMS_UPDATE_LOG.create_date
  is '录入日期';
  
  
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R001_1001', null, '2', '新增/编辑', '新增/编辑', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R001_10' AND t1.resource_type='1' AND resource_isshow='0'), 0, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R001_1002', null, '2', '删除', '删除', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R001_10' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);

-------end 20180723 新增更新日志表 wb066 --------