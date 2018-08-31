-- Create table
create table PMS_CODE
(
  ID          NUMBER not null,
  CODE_ZH     VARCHAR2(500),
  CODE_EN     VARCHAR2(500),
  CODE_VALUE  VARCHAR2(50),
  CODE_TYPE   VARCHAR2(50),
  CODE_FLAG   CHAR(1) default 0,
  CODE_REMARK VARCHAR2(2000),
  CREATE_BY   NUMBER,
  CREATE_DATE DATE,
  UPDATE_BY   NUMBER,
  UPDATE_DATE DATE
);
-- Add comments to the table 
comment on table PMS_CODE
  is '码表';
-- Add comments to the columns 
comment on column PMS_CODE.ID
  is '主键';
comment on column PMS_CODE.CODE_ZH
  is '字典中文';
comment on column PMS_CODE.CODE_EN
  is '字典英文';
comment on column PMS_CODE.CODE_VALUE
  is '字典值';
comment on column PMS_CODE.CODE_TYPE
  is '字典类型';
comment on column PMS_CODE.CODE_FLAG
  is '字典状态 0有效 1无效';
comment on column PMS_CODE.CODE_REMARK
  is '字典备注';
comment on column PMS_CODE.CREATE_BY
  is '创建人';
comment on column PMS_CODE.CREATE_DATE
  is '创建时间';
comment on column PMS_CODE.UPDATE_BY
  is '更新人';
comment on column PMS_CODE.UPDATE_DATE
  is '更新时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_CODE
  add constraint PMS_PK_CODE primary key (ID);
-- Create table
create table PMS_CONTACT
(
  ID                NUMBER not null,
  CUSTOMER_ID       NUMBER,
  CONTACT_NAME      VARCHAR2(50),
  MOBILE_PHONE      VARCHAR2(50),
  POSITION_DESCRIBE VARCHAR2(200),
  FIXED_PHONE       VARCHAR2(50),
  EMAIL             VARCHAR2(50),
  QQ_CARD           VARCHAR2(50),
  REMARK            VARCHAR2(2000),
  CREATE_BY         NUMBER,
  CREATE_DATE       DATE,
  STATUS            CHAR(1) default 0,
  UPDATE_BY         NUMBER,
  UPDATE_DATE       DATE
);
-- Add comments to the table 
comment on table PMS_CONTACT
  is '联系人信息表';
-- Add comments to the columns 
comment on column PMS_CONTACT.ID
  is '联系人ID';
comment on column PMS_CONTACT.CUSTOMER_ID
  is '客户ID';
comment on column PMS_CONTACT.CONTACT_NAME
  is '联系人姓名';
comment on column PMS_CONTACT.MOBILE_PHONE
  is '移动电话';
comment on column PMS_CONTACT.POSITION_DESCRIBE
  is '职务描述';
comment on column PMS_CONTACT.FIXED_PHONE
  is '固定电话';
comment on column PMS_CONTACT.EMAIL
  is '邮箱';
comment on column PMS_CONTACT.QQ_CARD
  is 'qq号';
comment on column PMS_CONTACT.REMARK
  is '备注';
comment on column PMS_CONTACT.CREATE_BY
  is '录入人';
comment on column PMS_CONTACT.CREATE_DATE
  is '录入日期';
comment on column PMS_CONTACT.STATUS
  is '状态 0有效 1无效';
comment on column PMS_CONTACT.UPDATE_BY
  is '更新人';
comment on column PMS_CONTACT.UPDATE_DATE
  is '更新时间';
-- Create table
create table PMS_CONTRACT
(
  ID                 NUMBER not null,
  CONTRACT_NO        VARCHAR2(50),
  SIGNED_DATE        DATE,
  BELONG_CUSTOMERID  NUMBER,
  BELONG_PRODUCT     CHAR(1),
  CONTRACT_TITLE     VARCHAR2(200),
  CONTRACT_AMOUNT    VARCHAR2(20),
  CURRENCY           CHAR(1),
  EFFECTIVE_DATE     DATE,
  FREE_LIMIT         VARCHAR2(10),
  GIVE_DAY           VARCHAR2(10),
  PAYMENT_REMARK     VARCHAR2(2000),
  REMARK             VARCHAR2(2000),
  CREATE_BY          NUMBER,
  CREATE_DATE        DATE,
  CONTRACT_STATUS    CHAR(1),
  STATUS             CHAR(1),
  EXAMINE_BY         NUMBER,
  EXAMINE_DATE       DATE,
  CREATE_DEPT        NUMBER,
  LABOR_PRICE        VARCHAR2(10),
  FREESERVICE_PERIOD VARCHAR2(5),
  COSTSERVICE_TIME   NUMBER,
  UPDATE_BY          NUMBER,
  UPDATE_DATE        DATE
);
-- Add comments to the table 
comment on table PMS_CONTRACT
  is '合同信息表';
-- Add comments to the columns 
comment on column PMS_CONTRACT.ID
  is '合同ID';
comment on column PMS_CONTRACT.CONTRACT_NO
  is '合同编号';
comment on column PMS_CONTRACT.SIGNED_DATE
  is '签署日期';
comment on column PMS_CONTRACT.BELONG_CUSTOMERID
  is '所属客户ID';
comment on column PMS_CONTRACT.BELONG_PRODUCT
  is '所属产品   数据来源于字典维护';
comment on column PMS_CONTRACT.CONTRACT_TITLE
  is '合同标题';
comment on column PMS_CONTRACT.CONTRACT_AMOUNT
  is '合同金额';
comment on column PMS_CONTRACT.CURRENCY
  is '币种    数据来源于字典维护';
comment on column PMS_CONTRACT.EFFECTIVE_DATE
  is '有效期';
comment on column PMS_CONTRACT.FREE_LIMIT
  is '免费服务期（月）';
comment on column PMS_CONTRACT.GIVE_DAY
  is '赠送天数';
comment on column PMS_CONTRACT.PAYMENT_REMARK
  is '付款说明';
comment on column PMS_CONTRACT.REMARK
  is '备注';
comment on column PMS_CONTRACT.CREATE_BY
  is '录入人';
comment on column PMS_CONTRACT.CREATE_DATE
  is '录入日期';
comment on column PMS_CONTRACT.CONTRACT_STATUS
  is '合同状态：0编辑中、1待审批、2已审批、3已退回、4已删除、5已立项';
comment on column PMS_CONTRACT.STATUS
  is '状态：0有效 1无效';
comment on column PMS_CONTRACT.EXAMINE_BY
  is '审核人';
comment on column PMS_CONTRACT.EXAMINE_DATE
  is '审核日期';
comment on column PMS_CONTRACT.CREATE_DEPT
  is '创建部门id';
comment on column PMS_CONTRACT.LABOR_PRICE
  is '人天单价';
comment on column PMS_CONTRACT.FREESERVICE_PERIOD
  is '免费服务期阶段';
comment on column PMS_CONTRACT.COSTSERVICE_TIME
  is '收费服务期时长(月)';
comment on column PMS_CONTRACT.UPDATE_BY
  is '更新人';
comment on column PMS_CONTRACT.UPDATE_DATE
  is '更新时间';

-- Create table
create table PMS_CONTRACT_TRACK
(
  ID               NUMBER not null,
  CONTRACT_ID      NUMBER,
  PROJECT_STAGE    CHAR(1),
  PERSONDAY_COUNTS NUMBER,
  REMARK           VARCHAR2(2000),
  CREATE_BY        NUMBER,
  CREATE_DATE      DATE,
  UPDATE_BY        NUMBER,
  UPDATE_DATE      DATE,
  STATUS           CHAR(1)
);
-- Add comments to the table 
comment on table PMS_CONTRACT_TRACK
  is '合同跟踪信息表';
-- Add comments to the columns 
comment on column PMS_CONTRACT_TRACK.ID
  is '编号id';
comment on column PMS_CONTRACT_TRACK.CONTRACT_ID
  is '合同ID';
comment on column PMS_CONTRACT_TRACK.PROJECT_STAGE
  is '项目阶段，字典维护，项目立项、启动会、概念培训、需求调研、数据收集、项目开发、试运行、项目上线、项目验

收';
comment on column PMS_CONTRACT_TRACK.PERSONDAY_COUNTS
  is '使用人天数量';
comment on column PMS_CONTRACT_TRACK.REMARK
  is '备注';
comment on column PMS_CONTRACT_TRACK.CREATE_BY
  is '操作人';
comment on column PMS_CONTRACT_TRACK.CREATE_DATE
  is '操作时间';
comment on column PMS_CONTRACT_TRACK.UPDATE_BY
  is '更新人';
comment on column PMS_CONTRACT_TRACK.UPDATE_DATE
  is '更新时间';
comment on column PMS_CONTRACT_TRACK.STATUS
  is '数据状态0有效，1无效';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_CONTRACT_TRACK
  add constraint CONTRACT_TRACKID primary key (ID);


-- Create table
create table PMS_CUSTOMER
(
  ID                NUMBER not null,
  CUSTOM_SHORT_NAME VARCHAR2(50),
  CUSTOM_NAME       VARCHAR2(200),
  CUSTOM_ADDRESS    VARCHAR2(500),
  CUSTOM_CODE       VARCHAR2(50),
  CONTACT_PHONE     VARCHAR2(50),
  EMAIL             VARCHAR2(50),
  REMARK            VARCHAR2(2000),
  CREATE_BY         NUMBER,
  CREATE_DATE       DATE,
  STATUS            CHAR(1) default 0,
  TAXPAYER_NAME     VARCHAR2(100),
  TAXPAYER_NUMBER   VARCHAR2(100),
  TAXPAYER_ADDRESS  VARCHAR2(500),
  TAXPAYER_PHONE    VARCHAR2(50),
  TAXPAYER_BANK     VARCHAR2(100),
  TAXPAYER_ACCOUNT  VARCHAR2(100),
  UPDATE_BY         NUMBER,
  UPDATE_DATE       DATE
);
-- Add comments to the table 
comment on table PMS_CUSTOMER
  is '客户信息表';
-- Add comments to the columns 
comment on column PMS_CUSTOMER.ID
  is 'id编号';
comment on column PMS_CUSTOMER.CUSTOM_SHORT_NAME
  is '客户简称';
comment on column PMS_CUSTOMER.CUSTOM_NAME
  is '客户全称';
comment on column PMS_CUSTOMER.CUSTOM_ADDRESS
  is '所在地址';
comment on column PMS_CUSTOMER.CUSTOM_CODE
  is '客户简码';
comment on column PMS_CUSTOMER.CONTACT_PHONE
  is '联系电话';
comment on column PMS_CUSTOMER.EMAIL
  is '邮箱';
comment on column PMS_CUSTOMER.REMARK
  is '备注';
comment on column PMS_CUSTOMER.CREATE_BY
  is '录入人';
comment on column PMS_CUSTOMER.CREATE_DATE
  is '录入日期';
comment on column PMS_CUSTOMER.STATUS
  is '0 有效 1无效';
comment on column PMS_CUSTOMER.TAXPAYER_NAME
  is '开票名称';
comment on column PMS_CUSTOMER.TAXPAYER_NUMBER
  is '纳税人识别号';
comment on column PMS_CUSTOMER.TAXPAYER_ADDRESS
  is '开票地址';
comment on column PMS_CUSTOMER.TAXPAYER_PHONE
  is '开票电话';
comment on column PMS_CUSTOMER.TAXPAYER_BANK
  is '开户银行';
comment on column PMS_CUSTOMER.TAXPAYER_ACCOUNT
  is '开户账号';
comment on column PMS_CUSTOMER.UPDATE_BY
  is '修改人';
comment on column PMS_CUSTOMER.UPDATE_DATE
  is '修改时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_CUSTOMER
  add constraint PMS_CUSTOM_ID primary key (ID);
-- Create table
create table PMS_DAILY_REPORT
(
  ID               NUMBER not null,
  PRO_ID           VARCHAR2(50),
  PRO_REPORTER     VARCHAR2(50),
  REPORT_DATE      DATE,
  REPORT_TYPE      CHAR(1),
  TASK_TODAY       VARCHAR2(2000),
  QUESTION_TODAY   VARCHAR2(2000),
  CONCLUSION_TODAY VARCHAR2(2000),
  PLAN_TOMORROW    VARCHAR2(2000),
  CREATE_BY        NUMBER,
  CREATE_DATE      DATE,
  UPDATE_BY        NUMBER,
  UPDATE_DATE      DATE,
  REPORT_STATUS    CHAR(1)
);
-- Add comments to the table 
comment on table PMS_DAILY_REPORT
  is '日报管理表';
-- Add comments to the columns 
comment on column PMS_DAILY_REPORT.ID
  is '主键';
comment on column PMS_DAILY_REPORT.PRO_ID
  is '项目ID';
comment on column PMS_DAILY_REPORT.PRO_REPORTER
  is '填报人';
comment on column PMS_DAILY_REPORT.REPORT_DATE
  is '填报日期';
comment on column PMS_DAILY_REPORT.REPORT_TYPE
  is '日报类型,字典维护';
comment on column PMS_DAILY_REPORT.TASK_TODAY
  is '当天任务';
comment on column PMS_DAILY_REPORT.QUESTION_TODAY
  is '当天问题';
comment on column PMS_DAILY_REPORT.CONCLUSION_TODAY
  is '当日小结';
comment on column PMS_DAILY_REPORT.PLAN_TOMORROW
  is '明日计划';
comment on column PMS_DAILY_REPORT.CREATE_BY
  is '创建人';
comment on column PMS_DAILY_REPORT.CREATE_DATE
  is '创建时间';
comment on column PMS_DAILY_REPORT.UPDATE_BY
  is '更新人';
comment on column PMS_DAILY_REPORT.UPDATE_DATE
  is '更新日期';
comment on column PMS_DAILY_REPORT.REPORT_STATUS
  is '状态 0有效 1无效';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_DAILY_REPORT
  add constraint DAILY_REPORT_ID primary key (ID);
-- Create table
create table PMS_DELIVERIES
(
  ID                     NUMBER not null,
  PROJECT_ID             NUMBER,
  DELIVERIES_NAME        VARCHAR2(500),
  PLAN_DELIVERIES_DATE   DATE,
  WHETHER_CONTRACT       CHAR(1),
  PERSON_LIABLE          NUMBER,
  WHETHER_DELIVER        CHAR(1),
  ACTUAL_DELIVERIES_DATE DATE,
  REMARK                 VARCHAR2(2000),
  CREATE_BY              NUMBER,
  CREATE_DATE            DATE,
  UPDATE_BY              NUMBER,
  UPDATE_DATE            DATE
);
-- Add comments to the table 
comment on table PMS_DELIVERIES
  is '交付物信息表';
-- Add comments to the columns 
comment on column PMS_DELIVERIES.ID
  is '交付物ID';
comment on column PMS_DELIVERIES.PROJECT_ID
  is '项目ID';
comment on column PMS_DELIVERIES.DELIVERIES_NAME
  is '交付物名称';
comment on column PMS_DELIVERIES.PLAN_DELIVERIES_DATE
  is '计划交付时间';
comment on column PMS_DELIVERIES.WHETHER_CONTRACT
  is '是否记入合同 0是 1否';
comment on column PMS_DELIVERIES.PERSON_LIABLE
  is '责任人';
comment on column PMS_DELIVERIES.WHETHER_DELIVER
  is '是否已交付 0是 1否';
comment on column PMS_DELIVERIES.ACTUAL_DELIVERIES_DATE
  is '实际交付时间';
comment on column PMS_DELIVERIES.REMARK
  is '备注';
comment on column PMS_DELIVERIES.CREATE_BY
  is '录入人';
comment on column PMS_DELIVERIES.CREATE_DATE
  is '录入日期';
comment on column PMS_DELIVERIES.UPDATE_BY
  is '更新人';
comment on column PMS_DELIVERIES.UPDATE_DATE
  is '更新日期';

-- Create table
create table PMS_DEPT
(
  ID          NUMBER not null,
  DEPT_PID    NUMBER,
  DEPT_NAME   VARCHAR2(500),
  CREATE_BY   NUMBER,
  CREATE_DATE DATE,
  UPDATE_BY   NUMBER,
  UPDATE_DATE DATE,
  DEPT_FLAG   CHAR(1)
);
-- Add comments to the table 
comment on table PMS_DEPT
  is '部门信息表';
-- Add comments to the columns 
comment on column PMS_DEPT.ID
  is '部门ID';
comment on column PMS_DEPT.DEPT_PID
  is '父级ID';
comment on column PMS_DEPT.DEPT_NAME
  is '部门名称';
comment on column PMS_DEPT.CREATE_BY
  is '录入人';
comment on column PMS_DEPT.CREATE_DATE
  is '录入部门';
comment on column PMS_DEPT.UPDATE_BY
  is '修改人';
comment on column PMS_DEPT.UPDATE_DATE
  is '修改时间';
comment on column PMS_DEPT.DEPT_FLAG
  is '部门状态 0有效 1无效';

-- Create table
create table PMS_MILEPOST
(
  ID                  NUMBER not null,
  PROJECT_ID          NUMBER,
  MILEPOST_NAME       VARCHAR2(500),
  PLAN_COMPLETEDATE   DATE,
  CORRESPONDING_PHASE CHAR(1),
  MILEPOST_STATUS     CHAR(1),
  MILEPOST_DESCRIBE   VARCHAR2(2000),
  REMARK              VARCHAR2(2000),
  CREATE_BY           NUMBER,
  CREATE_DATE         DATE,
  UPDATE_BY           NUMBER,
  UPDATE_DATE         DATE
);
-- Add comments to the table 
comment on table PMS_MILEPOST
  is '里程碑信息表';
-- Add comments to the columns 
comment on column PMS_MILEPOST.ID
  is '里程碑ID';
comment on column PMS_MILEPOST.PROJECT_ID
  is '项目ID';
comment on column PMS_MILEPOST.MILEPOST_NAME
  is '里程碑名称';
comment on column PMS_MILEPOST.PLAN_COMPLETEDATE
  is '计划完成时间';
comment on column PMS_MILEPOST.CORRESPONDING_PHASE
  is '对应阶段   数据来源于字典维护';
comment on column PMS_MILEPOST.MILEPOST_STATUS
  is '里程碑状态    数据来源于字典维护';
comment on column PMS_MILEPOST.MILEPOST_DESCRIBE
  is '里程碑描述';
comment on column PMS_MILEPOST.REMARK
  is '备注';
comment on column PMS_MILEPOST.CREATE_BY
  is '录入人';
comment on column PMS_MILEPOST.CREATE_DATE
  is '录入日期';
comment on column PMS_MILEPOST.UPDATE_BY
  is '更新人';
comment on column PMS_MILEPOST.UPDATE_DATE
  is '更新日期';

-- Create table
create table PMS_MILEPOST_ADJUST
(
  ID            NUMBER not null,
  MILEPOST_ID   NUMBER,
  ADJUST_DATE   DATE,
  ADJUST_REMARK VARCHAR2(2000),
  IS_COMPLETE   CHAR(1),
  APPROVAL_BY   NUMBER,
  APPROVAL_DATE DATE,
  REMARK        VARCHAR2(2000),
  CREATE_BY     NUMBER,
  CREATE_DATE   DATE,
  UPDATE_BY     NUMBER,
  UPDATE_DATE   DATE
);
-- Add comments to the table 
comment on table PMS_MILEPOST_ADJUST
  is '里程碑调整表';
-- Add comments to the columns 
comment on column PMS_MILEPOST_ADJUST.ID
  is 'id';
comment on column PMS_MILEPOST_ADJUST.MILEPOST_ID
  is '里程碑ID';
comment on column PMS_MILEPOST_ADJUST.ADJUST_DATE
  is '调整时间';
comment on column PMS_MILEPOST_ADJUST.ADJUST_REMARK
  is '调整原因';
comment on column PMS_MILEPOST_ADJUST.IS_COMPLETE
  is '是否顺延';
comment on column PMS_MILEPOST_ADJUST.APPROVAL_BY
  is '批准人';
comment on column PMS_MILEPOST_ADJUST.APPROVAL_DATE
  is '批准时间';
comment on column PMS_MILEPOST_ADJUST.REMARK
  is '备注';
comment on column PMS_MILEPOST_ADJUST.CREATE_BY
  is '录入人';
comment on column PMS_MILEPOST_ADJUST.CREATE_DATE
  is '录入时间';
comment on column PMS_MILEPOST_ADJUST.UPDATE_BY
  is '更新人';
comment on column PMS_MILEPOST_ADJUST.UPDATE_DATE
  is '更新时间';

-- Create table
create table PMS_MONTH_REPORT
(
  ID              NUMBER not null,
  PRO_ID          VARCHAR2(50),
  PRO_ATTENDEES   VARCHAR2(1000),
  PRO_REPORTER    VARCHAR2(50),
  REPORT_MONTH    DATE,
  CREATE_BY       VARCHAR2(50),
  CREATE_DATE     DATE,
  UPDATE_BY       VARCHAR2(50),
  UPDATE_DATE     DATE,
  REPORTER_STATUS CHAR(1)
);
-- Add comments to the table 
comment on table PMS_MONTH_REPORT
  is '月报管理表';
-- Add comments to the columns 
comment on column PMS_MONTH_REPORT.ID
  is '主键';
comment on column PMS_MONTH_REPORT.PRO_ID
  is '项目ID';
comment on column PMS_MONTH_REPORT.PRO_ATTENDEES
  is '项目参与人';
comment on column PMS_MONTH_REPORT.PRO_REPORTER
  is '填报人';
comment on column PMS_MONTH_REPORT.REPORT_MONTH
  is '填报月份';
comment on column PMS_MONTH_REPORT.CREATE_BY
  is '创建人';
comment on column PMS_MONTH_REPORT.CREATE_DATE
  is '创建时间';
comment on column PMS_MONTH_REPORT.UPDATE_BY
  is '更新人';
comment on column PMS_MONTH_REPORT.UPDATE_DATE
  is '更新日期';
comment on column PMS_MONTH_REPORT.REPORTER_STATUS
  is '报告状态 0有效 1无效';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_MONTH_REPORT
  add constraint MONTH_REPORT_ID primary key (ID);

-- Create table
create table PMS_OPERATELOG
(
  ID                    NUMBER not null,
  OPERATE_BY            VARCHAR2(50),
  OPERATE_NAME          VARCHAR2(50),
  OPERATE_DEPT_NAME     VARCHAR2(200),
  OPERATE_TIME          DATE,
  OPERATE_TYPE          CHAR(1),
  OPERATE_CATEGORY      VARCHAR2(100),
  OPERATE_CONTENT       VARCHAR2(500),
  OPERATE_CATEGORY_TYPE VARCHAR2(10)
);
-- Add comments to the table 
comment on table PMS_OPERATELOG
  is '操作日志表';
-- Add comments to the columns 
comment on column PMS_OPERATELOG.ID
  is '主键';
comment on column PMS_OPERATELOG.OPERATE_BY
  is '操作者';
comment on column PMS_OPERATELOG.OPERATE_NAME
  is '操作者名称';
comment on column PMS_OPERATELOG.OPERATE_DEPT_NAME
  is '操作者部门名称';
comment on column PMS_OPERATELOG.OPERATE_TIME
  is '操作时间';
comment on column PMS_OPERATELOG.OPERATE_TYPE
  is '操作类型 0为进入页面 1为保存 2为删除';
comment on column PMS_OPERATELOG.OPERATE_CATEGORY
  is '操作功能';
comment on column PMS_OPERATELOG.OPERATE_CONTENT
  is '操作内容';
comment on column PMS_OPERATELOG.OPERATE_CATEGORY_TYPE
  is '操作功能类型';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_OPERATELOG
  add constraint PMS_PK_OPERATELOG primary key (ID);

-- Create table
create table PMS_OTHER_COST
(
  ID               NUMBER not null,
  PROJECT_ID       NUMBER,
  COST_SPORTS      CHAR(1),
  COST_EVENTS      CHAR(1),
  TOTAL_AMOUNT     NUMBER,
  CURRENCY         CHAR(1),
  BEGIN_DATE       DATE,
  END_DATE         DATE,
  PEOPLE_CONCERNED NUMBER,
  WHETHER_INVOICE  CHAR(1),
  COST_DESCRIBE    VARCHAR2(2000),
  REMARK           VARCHAR2(2000),
  CREATE_BY        NUMBER,
  CREATE_DATE      DATE,
  UPDATE_BY        NUMBER,
  UPDATE_DATE      DATE
);
-- Add comments to the table 
comment on table PMS_OTHER_COST
  is '其他成本信息表';
-- Add comments to the columns 
comment on column PMS_OTHER_COST.ID
  is '其他成本ID';
comment on column PMS_OTHER_COST.PROJECT_ID
  is '项目ID';
comment on column PMS_OTHER_COST.COST_SPORTS
  is '收费大项';
comment on column PMS_OTHER_COST.COST_EVENTS
  is '收费小项';
comment on column PMS_OTHER_COST.TOTAL_AMOUNT
  is '总金额';
comment on column PMS_OTHER_COST.CURRENCY
  is '币种';
comment on column PMS_OTHER_COST.BEGIN_DATE
  is '开始日期';
comment on column PMS_OTHER_COST.END_DATE
  is '结束日期';
comment on column PMS_OTHER_COST.PEOPLE_CONCERNED
  is '报销人';
comment on column PMS_OTHER_COST.WHETHER_INVOICE
  is '是否发票 0是 1否';
comment on column PMS_OTHER_COST.COST_DESCRIBE
  is '费用说明';
comment on column PMS_OTHER_COST.REMARK
  is '备注';
comment on column PMS_OTHER_COST.CREATE_BY
  is '录入人';
comment on column PMS_OTHER_COST.CREATE_DATE
  is '录入日期';
comment on column PMS_OTHER_COST.UPDATE_BY
  is '修改人';
comment on column PMS_OTHER_COST.UPDATE_DATE
  is '修改时间';

-- Create table
create table PMS_PERFORMANCE
(
  ID          NUMBER not null,
  GRADE       VARCHAR2(2),
  KPI_KIND    VARCHAR2(2),
  KPI_NUMBERS NUMBER,
  COMMENTS    VARCHAR2(2000),
  REMARKS     VARCHAR2(2000),
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE DATE,
  MONTH       VARCHAR2(20),
  UPDATE_BY   NUMBER,
  UPDATE_DATE DATE,
  USER_ID     NUMBER
);
-- Add comments to the table 
comment on table PMS_PERFORMANCE
  is '绩效管理表';
-- Add comments to the columns 
comment on column PMS_PERFORMANCE.ID
  is '主键';
comment on column PMS_PERFORMANCE.GRADE
  is '绩效等级，分为A、B、C、D';
comment on column PMS_PERFORMANCE.KPI_KIND
  is 'KPI属性0是正数，1表示负数';
comment on column PMS_PERFORMANCE.KPI_NUMBERS
  is 'KPI数量';
comment on column PMS_PERFORMANCE.COMMENTS
  is '评语';
comment on column PMS_PERFORMANCE.REMARKS
  is '备注';
comment on column PMS_PERFORMANCE.CREATE_BY
  is '创建人';
comment on column PMS_PERFORMANCE.CREATE_DATE
  is '创建时间';
comment on column PMS_PERFORMANCE.MONTH
  is '绩效月份';
comment on column PMS_PERFORMANCE.UPDATE_BY
  is '修改人';
comment on column PMS_PERFORMANCE.UPDATE_DATE
  is '修改时间';
comment on column PMS_PERFORMANCE.USER_ID
  is '用户ID';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_PERFORMANCE
  add constraint PMS_PERFORMANCE_ID primary key (ID);
-- Create table
create table PMS_PROJECT
(
  ID                NUMBER not null,
  PROJECT_NO        VARCHAR2(50),
  PROJECT_STAGE     CHAR(1),
  PROJECT_TITLE     VARCHAR2(2000),
  BELONG_CUSTOMERID NUMBER,
  BELONG_PRODUCT    CHAR(1),
  SCOPE_DESCRIPTION VARCHAR2(2000),
  RISK_ASSESSMENT   VARCHAR2(2000),
  REMARK            VARCHAR2(2000),
  PROJECT_DATE      DATE,
  CONTRACT_ID       NUMBER,
  CREATE_BY         NUMBER,
  CREATE_DATE       DATE,
  UPDATE_BY         NUMBER,
  UPDATE_DATE       DATE,
  PROJECT_NAME      VARCHAR2(500),
  IMPLEMENT_HEAD    NUMBER,
  EXPLOIT_HEAD      NUMBER,
  PLAN_WORK_HOURS   VARCHAR2(50),
  PROJECT_STATUS    CHAR(1),
  PROJECT_FLAG      CHAR(1),
  CREATE_DEPT       NUMBER
);
-- Add comments to the table 
comment on table PMS_PROJECT
  is '项目信息表';
-- Add comments to the columns 
comment on column PMS_PROJECT.ID
  is '项目ID';
comment on column PMS_PROJECT.PROJECT_NO
  is '项目编号';
comment on column PMS_PROJECT.PROJECT_STAGE
  is '项目阶段   数据来源于字典维护';
comment on column PMS_PROJECT.PROJECT_TITLE
  is '项目说明';
comment on column PMS_PROJECT.BELONG_CUSTOMERID
  is '所属客户ID';
comment on column PMS_PROJECT.BELONG_PRODUCT
  is '所属产品  数据来源于字典维护';
comment on column PMS_PROJECT.SCOPE_DESCRIPTION
  is '范围说明';
comment on column PMS_PROJECT.RISK_ASSESSMENT
  is '风险评估';
comment on column PMS_PROJECT.REMARK
  is '描述';
comment on column PMS_PROJECT.PROJECT_DATE
  is '立项日期';
comment on column PMS_PROJECT.CONTRACT_ID
  is '合同ID';
comment on column PMS_PROJECT.CREATE_BY
  is '录入人';
comment on column PMS_PROJECT.CREATE_DATE
  is '录入日期';
comment on column PMS_PROJECT.UPDATE_BY
  is '更新人';
comment on column PMS_PROJECT.UPDATE_DATE
  is '更新日期';
comment on column PMS_PROJECT.PROJECT_NAME
  is '项目标题';
comment on column PMS_PROJECT.IMPLEMENT_HEAD
  is '实施负责人';
comment on column PMS_PROJECT.EXPLOIT_HEAD
  is '研发负责人';
comment on column PMS_PROJECT.PLAN_WORK_HOURS
  is '计划工时';
comment on column PMS_PROJECT.PROJECT_STATUS
  is '项目状态 0编辑中 1待审核 2已立项';
comment on column PMS_PROJECT.PROJECT_FLAG
  is '项目有效性 0有效 1无效';
comment on column PMS_PROJECT.CREATE_DEPT
  is '录入部门';

-- Create table
create table PMS_PROJECT_PRICE
(
  ID          NUMBER not null,
  SUPPLIER_ID CHAR(1),
  PRICE_TYPE  CHAR(1),
  PRICE       NUMBER,
  CURRENCY    CHAR(1),
  BEGIN_DATE  DATE,
  END_DATE    DATE,
  REMARK      VARCHAR2(2000),
  CREATE_BY   NUMBER,
  CREATE_DATE DATE,
  UPDATE_BY   NUMBER,
  UPDATE_DATE DATE
);
-- Add comments to the table 
comment on table PMS_PROJECT_PRICE
  is '项目单价信息表';
-- Add comments to the columns 
comment on column PMS_PROJECT_PRICE.ID
  is '项目单价ID';
comment on column PMS_PROJECT_PRICE.SUPPLIER_ID
  is '供应商ID';
comment on column PMS_PROJECT_PRICE.PRICE_TYPE
  is '单价类型';
comment on column PMS_PROJECT_PRICE.PRICE
  is '单价';
comment on column PMS_PROJECT_PRICE.CURRENCY
  is '币种';
comment on column PMS_PROJECT_PRICE.BEGIN_DATE
  is '开始日期';
comment on column PMS_PROJECT_PRICE.END_DATE
  is '结束日期';
comment on column PMS_PROJECT_PRICE.REMARK
  is '备注';
comment on column PMS_PROJECT_PRICE.CREATE_BY
  is '录入人';
comment on column PMS_PROJECT_PRICE.CREATE_DATE
  is '录入日期';
comment on column PMS_PROJECT_PRICE.UPDATE_BY
  is '修改人';
comment on column PMS_PROJECT_PRICE.UPDATE_DATE
  is '修改时间';

-- Create table
create table PMS_RECEIVABLES
(
  ID                NUMBER not null,
  RECEIVABLES_NO    VARCHAR2(50),
  RECEIVABLES_NAME  VARCHAR2(200),
  PROJECT_STAGE     CHAR(1),
  RECEIVABLE_AMOUNT NUMBER,
  RECEIVABLE_DATE   DATE,
  RECEIVABLE_STATUS CHAR(1),
  RESPONSIBLE_BY    NUMBER,
  BILLING_DATE      DATE,
  BILLING_BY        VARCHAR2(50),
  PAYMENT_REMARK    VARCHAR2(500),
  CREATE_BY         NUMBER,
  CREATE_DATE       DATE,
  CONTRACT_ID       NUMBER,
  UPDATE_BY         NUMBER,
  UPDATE_DATE       DATE,
  STATUS            CHAR(1)
);
-- Add comments to the table 
comment on table PMS_RECEIVABLES
  is '收款节点信息表';
-- Add comments to the columns 
comment on column PMS_RECEIVABLES.ID
  is '收款节点ID';
comment on column PMS_RECEIVABLES.RECEIVABLES_NO
  is '收款节点编号';
comment on column PMS_RECEIVABLES.RECEIVABLES_NAME
  is '收款节点名称';
comment on column PMS_RECEIVABLES.PROJECT_STAGE
  is '项目阶段   数据来源于字典维护';
comment on column PMS_RECEIVABLES.RECEIVABLE_AMOUNT
  is '应收金额';
comment on column PMS_RECEIVABLES.RECEIVABLE_DATE
  is '收款时间';
comment on column PMS_RECEIVABLES.RECEIVABLE_STATUS
  is '收款状态  数据来源于字典维护';
comment on column PMS_RECEIVABLES.RESPONSIBLE_BY
  is '负责人';
comment on column PMS_RECEIVABLES.BILLING_DATE
  is '开票时间';
comment on column PMS_RECEIVABLES.BILLING_BY
  is '开票人';
comment on column PMS_RECEIVABLES.PAYMENT_REMARK
  is '付款说明';
comment on column PMS_RECEIVABLES.CREATE_BY
  is '录入人';
comment on column PMS_RECEIVABLES.CREATE_DATE
  is '录入日期';
comment on column PMS_RECEIVABLES.CONTRACT_ID
  is '合同ID';
comment on column PMS_RECEIVABLES.UPDATE_BY
  is '修改人';
comment on column PMS_RECEIVABLES.UPDATE_DATE
  is '修改时间';
comment on column PMS_RECEIVABLES.STATUS
  is '状态，0有效，1无效';

-- Create table
create table PMS_RESOURCE
(
  ID              NUMBER not null,
  RESOURCE_CODE   VARCHAR2(50),
  RESOURCE_URL    VARCHAR2(200),
  RESOURCE_TYPE   CHAR(1),
  RESOURCE_DESCCH VARCHAR2(1000),
  RESOURCE_DESCEN VARCHAR2(1000),
  RESOURCE_PID    NUMBER,
  RESOURCE_ORDER  NUMBER,
  RESOURCE_ISSHOW CHAR(1) default 0,
  RESOURCE_ICON   VARCHAR2(100)
);
-- Add comments to the table 
comment on table PMS_RESOURCE
  is '资源表';
-- Add comments to the columns 
comment on column PMS_RESOURCE.ID
  is '主键';
comment on column PMS_RESOURCE.RESOURCE_CODE
  is '资源标识码';
comment on column PMS_RESOURCE.RESOURCE_URL
  is '资源URL';
comment on column PMS_RESOURCE.RESOURCE_TYPE
  is '资源类型(0，模块；1，菜单；2，操作）';
comment on column PMS_RESOURCE.RESOURCE_DESCCH
  is '资源中文描述';
comment on column PMS_RESOURCE.RESOURCE_DESCEN
  is '资源英文描述';
comment on column PMS_RESOURCE.RESOURCE_PID
  is '资源父ID';
comment on column PMS_RESOURCE.RESOURCE_ORDER
  is '资源排序';
comment on column PMS_RESOURCE.RESOURCE_ISSHOW
  is '资源是否显示 0 是 1 否';
comment on column PMS_RESOURCE.RESOURCE_ICON
  is '资源图标';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_RESOURCE
  add constraint PMS_PK_RESOURCE primary key (ID);
-- Create table
create table PMS_ROLE
(
  ID          NUMBER not null,
  ROLE_CODE   VARCHAR2(50),
  ROLE_CNAME  VARCHAR2(100),
  ROLE_ENAME  VARCHAR2(100),
  ROLE_FLAG   CHAR(1) default 0,
  ROLE_DESC   VARCHAR2(2000),
  CREATE_BY   VARCHAR2(50),
  CREATE_DATE DATE,
  UPDATE_BY   VARCHAR2(50),
  UPDATE_DATE DATE
);
-- Add comments to the table 
comment on table PMS_ROLE
  is '角色表';
-- Add comments to the columns 
comment on column PMS_ROLE.ID
  is '主键';
comment on column PMS_ROLE.ROLE_CODE
  is '角色标识码';
comment on column PMS_ROLE.ROLE_CNAME
  is '角色中文名';
comment on column PMS_ROLE.ROLE_ENAME
  is '角色英文名';
comment on column PMS_ROLE.ROLE_FLAG
  is '角色是否状态 0 是 1 否';
comment on column PMS_ROLE.ROLE_DESC
  is '角色描述';
comment on column PMS_ROLE.CREATE_BY
  is '创建人';
comment on column PMS_ROLE.CREATE_DATE
  is '创建时间';
comment on column PMS_ROLE.UPDATE_BY
  is '更新人';
comment on column PMS_ROLE.UPDATE_DATE
  is '更新时间';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_ROLE
  add constraint PMS_PK_ROLE primary key (ID);
-- Create/Recreate indexes 
create unique index PMS_UNIQUEROLE_CNAME on PMS_ROLE (ROLE_CNAME);
create unique index PMS_UNIQUEROLE_ENAME on PMS_ROLE (ROLE_ENAME);

-- Create table
create table PMS_ROLERESOURCE
(
  ROLE_ID     NUMBER,
  RESOURCE_ID NUMBER
);
-- Add comments to the table 
comment on table PMS_ROLERESOURCE
  is '资源与角色关联表';
-- Add comments to the columns 
comment on column PMS_ROLERESOURCE.ROLE_ID
  is '角色ID';
comment on column PMS_ROLERESOURCE.RESOURCE_ID
  is '资源ID';

-- Create table
create table PMS_SALESACTIVITY
(
  ID                 NUMBER not null,
  SALESPROJECT_ID    NUMBER,
  ACTIVITY_BEGINDATE DATE,
  ACTIVITY_ENDDATE   DATE,
  ACTIVITY_NAME      VARCHAR2(200),
  ACTIVITY_TYPE      CHAR(1),
  SALES_PERSONNEL_ID VARCHAR2(100),
  CUSTOMER_BEHALF    VARCHAR2(200),
  ACTIVITY_DESCRIBE  VARCHAR2(1000),
  ACTIVITY_RESULTS   VARCHAR2(1000),
  REMARK             VARCHAR2(500),
  CREATE_BY          NUMBER,
  CREATE_DATE        DATE,
  STATUS             CHAR(1),
  UPDATE_BY          NUMBER,
  UPDATE_DATE        DATE
);
-- Add comments to the table 
comment on table PMS_SALESACTIVITY
  is '销售活动信息表';
-- Add comments to the columns 
comment on column PMS_SALESACTIVITY.ID
  is '销售活动ID';
comment on column PMS_SALESACTIVITY.SALESPROJECT_ID
  is '销售项目ID';
comment on column PMS_SALESACTIVITY.ACTIVITY_BEGINDATE
  is '活动开始时间';
comment on column PMS_SALESACTIVITY.ACTIVITY_ENDDATE
  is '活动结束时间';
comment on column PMS_SALESACTIVITY.ACTIVITY_NAME
  is '活动名称 ';
comment on column PMS_SALESACTIVITY.ACTIVITY_TYPE
  is '活动类型 来源于字典维护';
comment on column PMS_SALESACTIVITY.SALES_PERSONNEL_ID
  is '销售人员ID';
comment on column PMS_SALESACTIVITY.CUSTOMER_BEHALF
  is '客户代表';
comment on column PMS_SALESACTIVITY.ACTIVITY_DESCRIBE
  is '活动描述';
comment on column PMS_SALESACTIVITY.ACTIVITY_RESULTS
  is '活动成果';
comment on column PMS_SALESACTIVITY.REMARK
  is '备注';
comment on column PMS_SALESACTIVITY.CREATE_BY
  is '录入人';
comment on column PMS_SALESACTIVITY.CREATE_DATE
  is '录入日期';
comment on column PMS_SALESACTIVITY.STATUS
  is '状态：0有效 1无效';
comment on column PMS_SALESACTIVITY.UPDATE_BY
  is '更新人';
comment on column PMS_SALESACTIVITY.UPDATE_DATE
  is '更新日期';

-- Create table
create table PMS_SALESPROJECT
(
  ID               NUMBER not null,
  CUSTOMER_ID      NUMBER,
  PROJECT_NAME     VARCHAR2(200),
  SALE_RESPONSIBLE NUMBER,
  PROJECT_BUDGET   NUMBER,
  CURRENCY         CHAR(1),
  SALE_STATUS      CHAR(1),
  REMARK           VARCHAR2(2000),
  CREATE_BY        NUMBER,
  CREATE_DATE      DATE,
  CREATE_DEPT      NUMBER,
  DECISION_MAKER   VARCHAR2(100),
  STAKEHOLDER      VARCHAR2(100),
  LINKER           VARCHAR2(100),
  UPDATE_BY        NUMBER,
  UPDATE_DATE      DATE,
  PROJECTNO        VARCHAR2(50),
  STATUS           CHAR(1),
  BELONG_PRODUCT   VARCHAR2(10)
);
-- Add comments to the table 
comment on table PMS_SALESPROJECT
  is '销售项目信息表';
-- Add comments to the columns 
comment on column PMS_SALESPROJECT.ID
  is '销售项目ID';
comment on column PMS_SALESPROJECT.CUSTOMER_ID
  is '客户信息ID';
comment on column PMS_SALESPROJECT.PROJECT_NAME
  is '项目名称';
comment on column PMS_SALESPROJECT.SALE_RESPONSIBLE
  is '项目负责人ID';
comment on column PMS_SALESPROJECT.PROJECT_BUDGET
  is '项目预算';
comment on column PMS_SALESPROJECT.CURRENCY
  is '币种';
comment on column PMS_SALESPROJECT.SALE_STATUS
  is '销售状态：0 进行中、1 招标中、2 已中标、3 签约中、4 已签约、5 已取消';
comment on column PMS_SALESPROJECT.REMARK
  is '备注';
comment on column PMS_SALESPROJECT.CREATE_BY
  is '录入人';
comment on column PMS_SALESPROJECT.CREATE_DATE
  is '录入日期';
comment on column PMS_SALESPROJECT.CREATE_DEPT
  is '录入人部门ID ';
comment on column PMS_SALESPROJECT.DECISION_MAKER
  is '项目决策者';
comment on column PMS_SALESPROJECT.STAKEHOLDER
  is '干系人';
comment on column PMS_SALESPROJECT.LINKER
  is '联系人';
comment on column PMS_SALESPROJECT.UPDATE_BY
  is '更新人';
comment on column PMS_SALESPROJECT.UPDATE_DATE
  is '更新日期';
comment on column PMS_SALESPROJECT.PROJECTNO
  is '项目编号';
comment on column PMS_SALESPROJECT.STATUS
  is '数据状态，0有效1无效';
comment on column PMS_SALESPROJECT.BELONG_PRODUCT
  is '所属产品';

-- Create table
create table PMS_SYSTEMLOG
(
  ID                   NUMBER,
  OPERATE_BY           NUMBER,
  OPERATE_NAME         VARCHAR2(50),
  FUNCTION_MODULE      VARCHAR2(10),
  FUNCTION_MODULE_NAME VARCHAR2(50),
  OPERATE_CLASS        VARCHAR2(200),
  OPERATE_METHOD       VARCHAR2(200),
  ERROR_INFO           CLOB,
  OPERATE_TIME         DATE,
  OPERATE_DEPT_NAME    VARCHAR2(200)
);
-- Add comments to the table 
comment on table PMS_SYSTEMLOG
  is '系统操作日志';
-- Add comments to the columns 
comment on column PMS_SYSTEMLOG.ID
  is '记录ID';
comment on column PMS_SYSTEMLOG.OPERATE_BY
  is '操作人ID';
comment on column PMS_SYSTEMLOG.OPERATE_NAME
  is '操作人名称';
comment on column PMS_SYSTEMLOG.FUNCTION_MODULE
  is '功能模块id';
comment on column PMS_SYSTEMLOG.FUNCTION_MODULE_NAME
  is '功能模块名称';
comment on column PMS_SYSTEMLOG.OPERATE_CLASS
  is '类名';
comment on column PMS_SYSTEMLOG.OPERATE_METHOD
  is '方法名';
comment on column PMS_SYSTEMLOG.ERROR_INFO
  is '错误信息';
comment on column PMS_SYSTEMLOG.OPERATE_TIME
  is '操作时间';
comment on column PMS_SYSTEMLOG.OPERATE_DEPT_NAME
  is '操作部门';

-- Create table
create table PMS_TASK
(
  ID                NUMBER not null,
  ORIGINATOR        NUMBER,
  REQ_FINITION_DATE DATE,
  EMERGENCY         CHAR(1),
  TASK_DESC         VARCHAR2(2000),
  FEEDBACK          VARCHAR2(2000),
  IS_CLOSE          CHAR(1),
  CLOSE_DATE        DATE,
  REMARKS           VARCHAR2(2000),
  CREATE_BY         NUMBER,
  CREATE_DATE       DATE,
  UPDATE_BY         NUMBER,
  UPDATE_DATE       DATE,
  STATUS            CHAR(1),
  RECIPIENT         VARCHAR2(1000),
  SEND_STATUS       CHAR(1)
);
-- Add comments to the table 
comment on table PMS_TASK
  is '任务表';
-- Add comments to the columns 
comment on column PMS_TASK.ID
  is '主键';
comment on column PMS_TASK.ORIGINATOR
  is '任务发起人';
comment on column PMS_TASK.REQ_FINITION_DATE
  is '要求完成日期';
comment on column PMS_TASK.EMERGENCY
  is '紧急程度 0一般1紧急';
comment on column PMS_TASK.TASK_DESC
  is '任务描述';
comment on column PMS_TASK.FEEDBACK
  is '反馈情况';
comment on column PMS_TASK.IS_CLOSE
  is '是否关闭 0否 1是';
comment on column PMS_TASK.CLOSE_DATE
  is '关闭日期';
comment on column PMS_TASK.REMARKS
  is '备注';
comment on column PMS_TASK.CREATE_BY
  is '创建人';
comment on column PMS_TASK.CREATE_DATE
  is '创建时间';
comment on column PMS_TASK.UPDATE_BY
  is '修改人';
comment on column PMS_TASK.UPDATE_DATE
  is '修改时间';
comment on column PMS_TASK.STATUS
  is '状态 0有效1无效';
comment on column PMS_TASK.RECIPIENT
  is '任务接收人';
comment on column PMS_TASK.SEND_STATUS
  is '发送状态 0未发送 1已发送';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_TASK
  add constraint PMS_TASK_ID primary key (ID);
-- Create table
create table PMS_UPLOAD
(
  ID          NUMBER,
  FILE_NAME   VARCHAR2(1000),
  FILE_PATH   VARCHAR2(1000),
  CREATE_BY   NUMBER,
  CREATE_DATE DATE,
  CREATE_DEPT NUMBER,
  TAB_INDEX   VARCHAR2(2),
  FILE_STATUS VARCHAR2(2),
  DATA_ID     NUMBER,
  FILE_TYPE   VARCHAR2(10),
  PAGE_TYPE   VARCHAR2(10)
);
-- Add comments to the table 
comment on table PMS_UPLOAD
  is '附件表';
-- Add comments to the columns 
comment on column PMS_UPLOAD.ID
  is '附件ID';
comment on column PMS_UPLOAD.FILE_NAME
  is '附件名称';
comment on column PMS_UPLOAD.FILE_PATH
  is '附件路径';
comment on column PMS_UPLOAD.CREATE_BY
  is '录入人';
comment on column PMS_UPLOAD.CREATE_DATE
  is '录入日期';
comment on column PMS_UPLOAD.CREATE_DEPT
  is '录入部门';
comment on column PMS_UPLOAD.TAB_INDEX
  is '排序';
comment on column PMS_UPLOAD.FILE_STATUS
  is '是否删除 0是 1否';
comment on column PMS_UPLOAD.DATA_ID
  is '附件对应数据id';
comment on column PMS_UPLOAD.FILE_TYPE
  is '附件类型';
comment on column PMS_UPLOAD.PAGE_TYPE
  is '功能类型';

-- Create table
create table PMS_USER
(
  ID             NUMBER not null,
  USER_ACCOUNT   VARCHAR2(50),
  USER_NAME      VARCHAR2(50),
  USER_PASSWORD  VARCHAR2(50),
  USER_SEX       CHAR(1) default 1,
  USER_EMAIL     VARCHAR2(50),
  USER_LANGUAGE  CHAR(1) default 0,
  USER_PHONE     VARCHAR2(50),
  USER_ADDRESS   VARCHAR2(500),
  USER_PLACE     VARCHAR2(50),
  USER_FACE      CHAR(1) default 0,
  USER_IDCARD    VARCHAR2(50),
  USER_PIC       VARCHAR2(100),
  DEPT_ID        NUMBER,
  USER_POSITION  VARCHAR2(100),
  USER_AGE       VARCHAR2(3),
  USER_BIRTH     DATE,
  ENTRY_DATE     DATE,
  DIPLOMA_SCHOOL VARCHAR2(100),
  DIPLOMA_DATE   DATE,
  USER_RECORD    VARCHAR2(50),
  USER_MOBILE    VARCHAR2(30),
  USER_COUNT     NUMBER,
  USER_REMARK    VARCHAR2(2000),
  USER_FLAG      CHAR(1) default 0,
  CREATE_BY      VARCHAR2(50),
  CREATE_DATE    DATE,
  UPDATE_BY      VARCHAR2(50),
  UPDATE_DATE    DATE,
  USER_NATURE    CHAR(1)
);
-- Add comments to the table 
comment on table PMS_USER
  is '用户表';
-- Add comments to the columns 
comment on column PMS_USER.ID
  is '主键';
comment on column PMS_USER.USER_ACCOUNT
  is '工号';
comment on column PMS_USER.USER_NAME
  is '姓名';
comment on column PMS_USER.USER_PASSWORD
  is '密码';
comment on column PMS_USER.USER_SEX
  is '性别 0女 1男';
comment on column PMS_USER.USER_EMAIL
  is '邮箱';
comment on column PMS_USER.USER_LANGUAGE
  is '语言 0 中文 1 英文';
comment on column PMS_USER.USER_PHONE
  is '固定电话';
comment on column PMS_USER.USER_ADDRESS
  is '通讯地址';
comment on column PMS_USER.USER_PLACE
  is '籍贯';
comment on column PMS_USER.USER_FACE
  is '政治面貌 0 群众 1 共青团员 2预备党员 3党员';
comment on column PMS_USER.USER_IDCARD
  is '身份证号';
comment on column PMS_USER.USER_PIC
  is '头像';
comment on column PMS_USER.DEPT_ID
  is '部门ID';
comment on column PMS_USER.USER_POSITION
  is '岗位';
comment on column PMS_USER.USER_AGE
  is '年龄';
comment on column PMS_USER.USER_BIRTH
  is '出生日期';
comment on column PMS_USER.ENTRY_DATE
  is '入职日期';
comment on column PMS_USER.DIPLOMA_SCHOOL
  is '毕业院校';
comment on column PMS_USER.DIPLOMA_DATE
  is '毕业日期';
comment on column PMS_USER.USER_RECORD
  is '学历';
comment on column PMS_USER.USER_MOBILE
  is '手机';
comment on column PMS_USER.USER_COUNT
  is '登录次数';
comment on column PMS_USER.USER_REMARK
  is '备注';
comment on column PMS_USER.USER_FLAG
  is '状态 0激活 1禁止';
comment on column PMS_USER.CREATE_BY
  is '创建人';
comment on column PMS_USER.CREATE_DATE
  is '创建时间';
comment on column PMS_USER.UPDATE_BY
  is '更新人';
comment on column PMS_USER.UPDATE_DATE
  is '更新时间';
comment on column PMS_USER.USER_NATURE
  is '用户性质 0合同员工 1外包';
-- Create/Recreate primary, unique and foreign key constraints 
alter table PMS_USER
  add constraint PMS_PK_USER primary key (ID);
-- Create/Recreate indexes 
create unique index PMS_UNIQUEUSER_ACCOUNT on PMS_USER (USER_ACCOUNT);
create unique index PMS_UNIQUEUSER_IDCARD on PMS_USER (USER_IDCARD);
-- Create table
create table PMS_USERROLE
(
  USER_ID NUMBER,
  ROLE_ID NUMBER
);
-- Add comments to the table 
comment on table PMS_USERROLE
  is '用户角色关联表';
-- Add comments to the columns 
comment on column PMS_USERROLE.USER_ID
  is '用户ID';
comment on column PMS_USERROLE.ROLE_ID
  is '角色ID';

-- Create table
create table PMS_WORKING_HOURS
(
  ID                 NUMBER not null,
  PROJECT_ID         NUMBER,
  WORKING_TYPE       CHAR(1),
  WORKING_HOURS      NUMBER,
  INVOLVING_RESOURCE VARCHAR2(2000),
  BEGIN_DATE         DATE,
  END_DATE           DATE,
  CREATE_BY          NUMBER,
  CREATE_DATE        DATE,
  UPDATE_BY          NUMBER,
  UPDATE_DATE        DATE
);
-- Add comments to the table 
comment on table PMS_WORKING_HOURS
  is '工时信息表';
-- Add comments to the columns 
comment on column PMS_WORKING_HOURS.ID
  is '工时ID';
comment on column PMS_WORKING_HOURS.PROJECT_ID
  is '项目ID';
comment on column PMS_WORKING_HOURS.WORKING_TYPE
  is '工时类型';
comment on column PMS_WORKING_HOURS.WORKING_HOURS
  is '工时总计';
comment on column PMS_WORKING_HOURS.INVOLVING_RESOURCE
  is '涉及资源';
comment on column PMS_WORKING_HOURS.BEGIN_DATE
  is '开始时间';
comment on column PMS_WORKING_HOURS.END_DATE
  is '结束时间';
comment on column PMS_WORKING_HOURS.CREATE_BY
  is '录入人';
comment on column PMS_WORKING_HOURS.CREATE_DATE
  is '录入日期';
comment on column PMS_WORKING_HOURS.UPDATE_BY
  is '更新人';
comment on column PMS_WORKING_HOURS.UPDATE_DATE
  is '更新日期';

-- Create table
create table PMS_CHANGE_RECORD
(
  id             NUMBER not null,
  change_type    VARCHAR2(50),
  change_by      NUMBER,
  change_date    DATE,
  change_content VARCHAR2(4000),
  change_id      NUMBER
);

comment on table PMS_CHANGE_RECORD
  is '变更记录';
-- Add comments to the columns 
comment on column PMS_CHANGE_RECORD.id
  is 'id';
comment on column PMS_CHANGE_RECORD.change_type
  is '变更类型';
comment on column PMS_CHANGE_RECORD.change_by
  is '变更人';
comment on column PMS_CHANGE_RECORD.change_date
  is '变更日期';
comment on column PMS_CHANGE_RECORD.change_content
  is '变更内容';
comment on column PMS_CHANGE_RECORD.change_id
  is '变更ID';


-- Create sequence 
create sequence PMS_CODE_TB_SEQ
minvalue 1
maxvalue 9999999999
start with 109
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_CONTACT_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_CONTRACT_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_CONTRACT_TRACK_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_CUSTOMER_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_DAILY_REPORT_SEQ
minvalue 1
maxvalue 999999999999999999
start with 42
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_DELIVERIES_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_DEPT_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_MILEPOST_ADJUST_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_MILEPOST_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_MONTH_REPORT_SEQ
minvalue 1
maxvalue 999999999999999999
start with 63
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_OPERATELOG_TB_SEQ
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_OTHER_COST_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_PERFORMANCE_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_PROJECT_PRICE_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_PROJECT_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 21
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_RECEIVABLES_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_RESOURCE_TB_SEQ
minvalue 1
maxvalue 9999999999
start with 181
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_ROLERESOURCE_TB_SEQ
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_ROLE_TB_SEQ
minvalue 1
maxvalue 9999999999
start with 8
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_SALESACTIVITY_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;

-- Create sequence 
create sequence PMS_SALESPROJECT_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_SYSTEMLOG_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_TASK_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_UPLOAD_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_USERROLE_TB_SEQ
minvalue 1
maxvalue 9999999999
start with 1
increment by 1
cache 20;
-- Create sequence 
create sequence PMS_USER_TB_SEQ
minvalue 1
maxvalue 9999999999
start with 2
increment by 1
cache 20;

-- Create sequence 
create sequence PMS_WORKING_HOURS_TB_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20;

-- Create sequence 
create sequence PMS_CHANGE_RECORD_SEQ
minvalue 1
maxvalue 999999999999999999
start with 1
increment by 1
cache 20
order;

commit;


-----------------raomingyi0411---------

-- Add/modify columns 
alter table PMS_SALESPROJECT modify project_budget VARCHAR2(50);
-- Add/modify columns 
alter table PMS_RECEIVABLES modify receivable_amount VARCHAR2(50);
-- Add/modify columns 
alter table PMS_CONTRACT modify contract_amount VARCHAR2(50);

-- Add/modify columns 
alter table PMS_PROJECT_PRICE modify PRICE VARCHAR2(20);

-- Add/modify columns 
alter table PMS_OTHER_COST modify TOTAL_AMOUNT VARCHAR2(50);

commit;









