insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (1, 'R001', null, '0', '工作台', 'workbenchManage', 0, 0, '0', 'icon-screen-desktop');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (2, 'R002', null, '0', '售前管理', 'preSalesManage', 0, 1, '0', 'icon-handbag');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (3, 'R003', null, '0', '合同管理', 'pactManage', 0, 2, '0', 'icon-book-open');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (4, 'R004', null, '0', '项目管理', 'projectManage', 0, 3, '0', 'icon-grid');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (5, 'R005', null, '0', '质量管理', 'qualityManage', 0, 4, '0', 'icon-shield');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (6, 'R006', null, '0', '培训管理', 'trainManage', 0, 5, '0', 'icon-badge');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (7, 'R007', null, '0', '任务管理', 'taskManage', 0, 6, '0', 'icon-calendar');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (8, 'R008', null, '0', '会议管理', 'meetingManage', 0, 7, '0', 'icon-bubble');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (9, 'R009', null, '0', '绩效管理', 'performanceManage', 0, 8, '0', 'icon-trophy');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (10, 'R010', null, '0', '团建管理', 'leagueManage', 0, 9, '0', 'icon-star');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (11, 'R011', null, '0', '报销管理', 'applyManage', 0, 10, '0', 'icon-equalizer');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (12, 'R012', null, '0', '考勤管理', 'checkinginManage', 0, 11, '0', 'icon-speedometer');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (13, 'R013', null, '0', '统计分析', 'statisticsAnalyze', 0, 12, '0', 'icon-bar-chart');
INSERT into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (14, 'R014', null, '0', '系统管理', 'systemManage', 0, 13, '0', 'icon-settings');

--工作台
INSERT into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R001_01', 'workbenchManage/workOrderManagerMain', '1', '工作单', 'workOrderManager', 1, 0, '0', 'icon-users');
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R001_02', 'workbenchManage/complaintsAndAdviceMain', '1', '投诉与建议', 'complaintsAndAdvice', 1, 1, '0', 'icon-users');
 
--售前管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R002_01', 'preSalesManage/clientManageMain', '1', '客户维护', 'clientManage', 2, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R002_02', 'preSalesManage/saleTrackMain', '1', '销售跟踪', 'saleTrack', 2, 1, '0', NULL);

--客户维护操作权限
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R002_01_OPERATION', null, '2', '操作权限', '操作', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_01' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R002_01_OPERATION_EDIT', null, '2', '新增/编辑客户', '新增/编辑客户', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R002_01_OPERATION_DELC', null, '2', '删除客户', '删除客户', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R002_01_OPERATION_EDITP', null, '2', '新增/编辑联系人', '新增/编辑联系人', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 4, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R002_01_OPERATION_DELP', null, '2', '删除联系人', '删除联系人', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 5, '0', null);

--销售跟踪操作权限
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R002_02_OPERATION', null, '2', '操作权限', '操作', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_02' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R002_02_OPERATION_EDIT', null, '2', '新增/编辑项目', '新增/编辑项目', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_02_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R002_02_OPERATION_DELP', null, '2', '删除项目', '删除项目', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_02_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R002_02_OPERATION_EDITH', null, '2', '新增/编辑活动', '新增/编辑活动', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_02_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 4, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R002_02_OPERATION_DELH', null, '2', '删除活动', '删除活动', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R002_02_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 5, '0', null);

--合同管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R003_01', 'pactManage/contractManageMain', '1', '合同维护', 'contractManage', 3, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R003_02', 'pactManage/contractApprovalMain', '1', '合同审批', 'contractApproval', 3, 1, '0',NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R003_03', 'pactManage/receiveNodeManageMain', '1', '收款节点管理', 'receiveNodeManage', 3, 2, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R003_04', 'pactManage/contractExecuInfoMain', '1', '合同执行情况', 'contractExecuInfo', 3, 3, '0', NULL);

--项目管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_01', 'projectManage/projectApprovalMain', '1', '项目立项', 'projectApproval', 4, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_02', 'projectManage/projectConsoleMain', '1', '项目监控', 'projectConsole', 4, 1, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_03', 'projectManage/embodimentConsoleMain', '1', '实施监控', 'embodimentConsole', 4, 2, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_04', 'projectManage/traceTableMain', '1', '跟踪表', 'traceTable', 4, 3, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_05', 'projectManage/reportManage', '1', '报告管理', 'reportManage', 4, 4, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_06', 'projectManage/resourceManage', '1', '资源管理', 'resourceManage', 4, 5, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_07', 'projectManage/projectBaseInfoMain', '1', '项目维护', 'projectbaseinfo', 4, 6, '0', 'icon-users');
--项目立项操作权限2222
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_01_OPERATION', null, '2', '操作权限', '操作', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_01' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_01_OPERATION_EDIT', null, '2', '新增/编辑', '新增/编辑', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_01_OPERATION_DEL', null, '2', '删除', '删除', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_01_OPERATION_AUTH', null, '2', '审核', '审核', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_01_OPERATION_EDITJK', null, '2', '编辑项目监控', '编辑项目监控', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 4, '0', null);
--项目立项数据权限
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_01_DATA', null, '2', '数据权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_01'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_01_DATA_01', null, '2', '查看个人', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_01_DATA'), 2, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_01_DATA_02', null, '2', '查看项目', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_01_DATA'), 3, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_01_DATA_03', null, '2', '查看部门', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_01_DATA'), 4, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_01_DATA_04', null, '2', '查看公司', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_01_DATA'), 5, '0', null); 

--项目维护数据权限
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_07_DATA', null, '2', '数据权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_07'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_07_DATA_01', null, '2', '查看个人', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_07_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_07_DATA_02', null, '2', '查看项目', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_07_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_07_DATA_03', null, '2', '查看部门', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_07_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_07_DATA_04', null, '2', '查看公司', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_07_DATA'), 1, '0', null); 

--质量管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R005_01', 'qualityManage/qualityControlMain', '1', '质量控制', 'qualityControl', 5, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R005_02', 'qualityManage/documentManageMain', '1', '文档管理', 'documentManage', 5, 1, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R005_03', 'qualityManage/manageManualMain', '1', '管理手册', 'manageManual', 5, 2, '0', NULL);
 
--培训管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R006_01', 'trainManage/teachingPlanMain', '1', '带教计划', 'teachingPlan', 6, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R006_02', 'trainManage/trainPlanMain', '1', '培训计划', 'trainPlan', 6, 1, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R006_03', 'trainManage/promotedManageMain', '1', '晋级管理', 'promotedManage', 6, 2, '0', NULL);

--任务管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_01', 'taskManage/superviseManageMain', '1', '督办管理', 'superviseManage', 7, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_02', 'taskManage/taskConsoleMain', '1', '任务控制台', 'taskConsole', 7, 1, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_03', 'taskManage/mytaskMain', '1', '我的任务', 'mytask', 7, 2, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_04', 'taskManage/workhoursRecordMain', '1', '工时登记', 'workhoursRecord', 7, 3, '0', NULL);
--督办管理操作权限
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_01_OPERATION', null, '2', '操作权限', '操作', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R007_01' AND t1.resource_type='1' AND resource_isshow='0'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R007_01_OPERATION_EDIT', null, '2', '新增/编辑', '新增/编辑', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R007_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R007_01_OPERATION_AUTH', null, '2', '审批', '审批', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R007_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R007_01_OPERATION_DEL', null, '2', '删除', '删除', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R007_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R007_01_OPERATION_LOOK', null, '2', '查看', '查看', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R007_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 4, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R007_01_OPERATION_TZ', null, '2', '调整', '调整', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R007_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 5, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R007_01_OPERATION_CL', null, '2', '处理', '处理', (SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R007_01_OPERATION' AND t1.resource_type='2' AND resource_isshow='0'), 6, '0', null);
--督办管理数据权限
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_01_DATA_01', null, '2', '查看个人', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_01_DATA'), 2, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_01_DATA_02', null, '2', '查看项目', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_01_DATA'), 3, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_01_DATA_03', null, '2', '查看部门', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_01_DATA'), 4, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_01_DATA_04', null, '2', '查看公司', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_01_DATA'), 5, '0', null); 
--工时登记数据权限
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_04_DATA', null, '2', '数据权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_04'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_04_DATA_01', null, '2', '查看个人', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_04_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_04_DATA_02', null, '2', '查看项目', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_04_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_04_DATA_03', null, '2', '查看部门', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_04_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_04_DATA_04', null, '2', '查看公司', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_04_DATA'), 1, '0', null); 

--会议管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R008_01', 'taskManage/superviseManageMain', '1', '会议室', 'superviseManage', 8, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R008_02', 'taskManage/taskConsoleMain', '1', '会议管理', 'taskConsole', 8, 1, '0', NULL);

--绩效管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R009_01', 'performanceManage/superviseManageMain', '1', '绩效档案', 'superviseManage', 9, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R009_02', 'performanceManage/performanceIntegralMain', '1', '绩效积分', 'performanceIntegral', 9, 1, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R009_03', 'performanceManage/performanceContractMain', '1', '绩效合约', 'performanceContract', 9, 2, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R009_04', 'performanceManage/yearPlanMain', '1', '年度计划', 'yearPlan', 9, 3, '0', NULL);

--团建管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R010_01', 'leagueManage/leagueSchemeMain', '1', '活动策划', 'leagueScheme', 10, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R010_02', 'leagueManage/leaguePlanMain', '1', '活动计划', 'leaguePlan', 10, 1, '0', NULL);

--报销管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R011_01', 'applyManage/evectionApplyMain', '1', '差旅报销', 'evectionApply', 11, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R011_02', 'applyManage/taxiApplyMain', '1', '打车报销', 'taxiApply', 11, 1, '0', NULL);

--考勤管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R012_01', 'checkinginManage/cardRecordMain', '1', '出勤记录', 'cardRecord', 12, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R012_02', 'checkinginManage/leaveManageMain', '1', '请假管理', 'leaveManage', 12, 1, '0', NULL);

--统计分析
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R013_01', 'statisticsAnalyze/costReportMain', '1', '成本报表', 'costReport', 13, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R013_02', NULL, '1', '满意度分析', NULL, 13, 1, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R013_03', NULL, '1', '项目资源报表', NULL, 13, 2, '0', NULL);

--系统管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01', 'systemManage/userManagerMain', '1', '用户管理', 'userManagement', 14, 0, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_02', 'systemManage/roleManagerMain', '1', '角色管理', 'roleManagement', 14, 1, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_03', 'systemManage/codeManagerMain', '1', '基础信息维护', 'basisInfoMaintenance', 14, 2, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_04', 'systemManage/resourceManagerMain', '1', '资源管理', '资源管理', 14, 3, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_05', 'systemManage/deptManagerMain', '1', '组织架构维护', 'deptManager', 14, 4, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_06', 'systemManage/logerOperateMain', '1', '日志管理', 'operateLog', 14, 5, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_07', 'systemManage/modifyPassInitMain', '1', '修改密码', 'modifyPassInit', 14, 6, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_08', 'systemManage/updateLogMain', '1', '更新维护', 'updateLog', 14, 7, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_09', 'systemManage/serviceTicketMain', '1', '服务单维护', 'updateLog', 14, 8, '0', NULL);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_10', 'systemManage/productCodeMain', '1', '代码生成', '代码生成', 14, 9, '0', NULL);
--用户操作权限
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01'), 0, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_OPERATION_EDIT', null, '2', '新增/编辑', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_OPERATION_ALLOT', null, '2', '角色分配', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01_OPERATION'), 2, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_OPERATION_RESET', null, '2', '重置密码', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01_OPERATION'), 3, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_OPERATION_DISABLED', null, '2', '启用/禁用', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01_OPERATION'), 4, '0', null);
--用户数据权限
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_DATA', null, '2', '数据权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_DATA_01', null, '2', '查看个人', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_DATA_02', null, '2', '查看项目', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_DATA_03', null, '2', '查看部门', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01_DATA'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_01_DATA_04', null, '2', '查看公司', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_01_DATA'), 1, '0', null); 
--角色操作权限
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_02_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_02'), 0, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_02_OPERATION_EDIT', null, '2', '新增/编辑', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_02_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_02_OPERATION_ALLOT', null, '2', '分配资源', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_02_OPERATION'), 2, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_02_OPERATION_DISABLED', null, '2', '启用/禁用', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_02_OPERATION'), 3, '0', null);
--基础信息维护
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_03_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_03'), 0, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_03_OPERATION_EDIT', null, '2', '新增/编辑', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_03_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_03_OPERATION_DELETE', null, '2', '删除', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_03_OPERATION'), 2, '0', null);
--资源管理
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_04_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_04'), 0, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_04_OPERATION_EDIT', null, '2', '新增/编辑', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_04_OPERATION'), 0, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_04_OPERATION_DISABLED', null, '2', '启用/禁用', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_04_OPERATION'), 1, '0', null);
--组织架构维护
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_05_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_05'), 0, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_05_OPERATION_EDIT', null, '2', '新增/编辑', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_05_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_05_OPERATION_DELETE', null, '2', '删除', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_05_OPERATION'), 2, '0', null);
--更新维护
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_08_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_08'), 0, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_08_OPERATION_EDIT', null, '2', '新增/编辑', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_08_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_08_OPERATION_DELETE', null, '2', '删除', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_08_OPERATION'), 2, '0', null);
--服务单维护
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_09_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_09'), 0, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_09_OPERATION_EDIT', null, '2', '新增/编辑', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_09_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R014_09_OPERATION_DELETE', null, '2', '删除', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R014_09_OPERATION'), 2, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_02_DATA', null, '2', '数据权限', '数据', (select id from PMS_RESOURCE where RESOURCE_CODE='R007_02'), 2, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_02_OPERATION', null, '2', '操作权限', '操作', (select id from PMS_RESOURCE where RESOURCE_CODE='R007_02'), 1, '0', null);
COMMIT;

--任务控制台 wb066
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_02_DATA_01', null, '2', '查看个人', '查看个人', (select id from PMS_RESOURCE  where RESOURCE_CODE='R007_02_DATA'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_02_DATA_02', null, '2', '查看项目', '查看项目', (select id from PMS_RESOURCE  where RESOURCE_CODE='R007_02_DATA'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_02_DATA_03', null, '2', '查看本部门', '查看本部门', (select id from PMS_RESOURCE  where RESOURCE_CODE='R007_02_DATA'), 3, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_02_DATA_04', null, '2', '查看全部', '查看全部', (select id from PMS_RESOURCE  where RESOURCE_CODE='R007_02_DATA'), 4, '0', null);

insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R004_07_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R004_07'), 0, '0', null);
COMMIT;

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_07_OPERATION_EDIT', null, '2', '新增/编辑', '新增/编辑', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_07_OPERATION' ), 0, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (pms_resource_tb_seq.nextval, 'R004_07_OPERATION_DELETE', null, '2', '删除', '删除', 
(SELECT t1.id FROM pms_resource t1 WHERE t1.resource_code='R004_07_OPERATION'), 1, '0', null);

insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R004_07_OPERATION_AUDIT', null, '2', '审核', '审核', 
(select id from PMS_RESOURCE  where RESOURCE_CODE='R004_07_OPERATION'), 2, '0', null);
commit;


insert into PMS_RESOURCE (id, resource_code, resource_url, resource_type, resource_descch, resource_descen, resource_pid, resource_order, resource_isshow, resource_icon)
values (PMS_RESOURCE_TB_SEQ.NEXTVAL, 'R007_04_OPERATION', null, '2', '操作权限', NULL, (SELECT ID FROM PMS_RESOURCE WHERE RESOURCE_CODE='R007_04'), 0, '0', null);
COMMIT;
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_04_OPERATION_EDIT', null, '2', '编辑/提交', '编辑/提交', (select id from PMS_RESOURCE  where RESOURCE_CODE='R007_04_OPERATION'), 1, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_04_OPERATION_DELETE', null, '2', '删除', '删除', (select id from PMS_RESOURCE  where RESOURCE_CODE='R007_04_OPERATION'), 2, '0', null);
insert into PMS_RESOURCE (ID, RESOURCE_CODE, RESOURCE_URL, RESOURCE_TYPE, RESOURCE_DESCCH, RESOURCE_DESCEN, RESOURCE_PID, RESOURCE_ORDER, RESOURCE_ISSHOW, RESOURCE_ICON)
values (Pms_Resource_Tb_Seq.Nextval, 'R007_04_OPERATION_AUDIT', null, '2', '审核', '审核', (select id from PMS_RESOURCE  where RESOURCE_CODE='R007_04_OPERATION'), 3, '0', null);
commit;