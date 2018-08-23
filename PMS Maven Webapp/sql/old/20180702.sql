-----------raomingyi----工时记录表创建-------start--
-- Create table
create table PMS_WORKHOURS_RECORD
(
  id            NUMBER not null,
  worker_id     NUMBER,
  project_id    NUMBER,
  working_type  CHAR(1),
  working_hours VARCHAR2(10),
  work_desc     VARCHAR2(2000),
  work_date     DATE,
  status        CHAR(1),
  remark        VARCHAR2(2000),
  create_by     NUMBER,
  create_date   DATE,
  update_by     NUMBER,
  update_date   DATE
);
-- Add comments to the columns 
comment on column PMS_WORKHOURS_RECORD.id
  is '序号，主键';
comment on column PMS_WORKHOURS_RECORD.worker_id
  is '人员工号';
comment on column PMS_WORKHOURS_RECORD.project_id
  is '项目ID';
comment on column PMS_WORKHOURS_RECORD.working_type
  is '工作类型';
comment on column PMS_WORKHOURS_RECORD.working_hours
  is '耗时';
comment on column PMS_WORKHOURS_RECORD.work_desc
  is '工作内容';
comment on column PMS_WORKHOURS_RECORD.work_date
  is '日期';
comment on column PMS_WORKHOURS_RECORD.status
  is '状态:0编辑中，1已提交，2已审核，3已退回';
comment on column PMS_WORKHOURS_RECORD.remark
  is '备注';
comment on column PMS_WORKHOURS_RECORD.create_by
  is '创建人';
comment on column PMS_WORKHOURS_RECORD.create_date
  is '创建日期';
comment on column PMS_WORKHOURS_RECORD.update_by
  is '最后修改人';
comment on column PMS_WORKHOURS_RECORD.update_date
  is '最后修改日期';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_WORKHOURS_RECORD
  add constraint WORKHOUR_RECORD primary key (ID);

-- Create sequence 
create sequence PMS_WORKHOURS_RECORD_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
----------raomingyi----工时记录表创建-------end------------
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R005_03', 'workhoursRecord/workhoursRecordMain', '1', '工时登记', 'workhoursRecordMain', 5, 3, '0', 'fa fa-tags');
commit;
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'OPERATION0503', null, '2', '操作权限', '操作', (select id from PMS_RESOURCE where RESOURCE_CODE='R005_03'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'DATA0503', null, '2', '数据权限', '数据', (select id from PMS_RESOURCE where RESOURCE_CODE='R005_03'), 2, '0', null);
commit;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0503'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_02', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0503'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'VIEW_03', null, '2', '查看本部门', '查看本部门', (select id from PMS_RESOURCE  where RESOURCE_CODE='DATA0503'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R005_0301', null, '2', '编辑/提交', '编辑/提交', (select id from PMS_RESOURCE  where RESOURCE_CODE='OPERATION0503'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R005_0302', null, '2', '删除', '删除', (select id from PMS_RESOURCE  where RESOURCE_CODE='OPERATION0503'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R005_0303', null, '2', '审核', '审核', (select id from PMS_RESOURCE  where RESOURCE_CODE='OPERATION0503'), 3, '0', null);
commit;

