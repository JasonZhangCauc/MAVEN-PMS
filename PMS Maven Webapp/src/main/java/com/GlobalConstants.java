package com;

import java.util.HashMap;
import java.util.Map;

/**
 * @Description:    常量类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
public class GlobalConstants {
 
	public static final String SUCCESS_STATUS_CODE="200";//操作成功码
	
	public static final String ERROR_STATUS_CODE="302";//操作失败码
	
	public static final String ALT_MSG_SUCCESS="操作成功";//操作成功提示消息
	
	public static final String ALT_MSG_FAIL="操作失败";//操作失败提示消息
	
	public static final String ALT_MSG_CODE="221";
	
	public static final String ZERO="0";
	
	public static final String ONE="1";
	
	public static final String TWO="2";
	
	public static final String THREE="3";
	
	public static final String FOUR="4";
	
	public static final String FIVE="5";
	
	public static final String SIX="6";
	
	public static final String SEVEN="7";
	
	public static final String EIGHT="8";
	
	public static final String NINE="9";
	
	public static final String TEN="10";
	
	public static final String sysName="PMS"; 
	
	public static final String TARGET="navtab"; 
	
	public static final int PAGE_SIZE=20;//表格每页显示的数量
	
	public static final int PAGE_MAX = 1000;//不分页情况下，查询最多数据条数
	
	public static final boolean PAGE_TRUE = true;//分页接口参数：分页
 
	public static final boolean PAGE_FALSE = false;//分页接口参数：不分页
 
	public static final String SUCCESS="success";//返回消息:成功
	
	public static final String FAIL="fail";//返回消息:失败
	 
	public static final String ERROR="error";//返回消息:错误
	
	public static final String OK="ok";//返回消息:正确
	
	public static final String SAME="same";//返回消息:新密码原密码相同
	
	public static final String NOTMATCH="notmatch";//返回消息:密码不匹配
	 
	public static final String ABNORMAL="abnormal";//返回消息:异常
	
	public static final String IS_ACTIVE="1";//是否有效：有效
	
	public static final String IS_NOT_ACTIVE="0";//是否有效：无效
	 
	public static final String PASSWORD="test1234";//默认密码
	
	public static final String DATA_FORMAT_STR_YMDHMS="yyyyMMdd HH:mm:ss";//默认日期格式
	
	public static final String NEW="new";//表示新增
	
	public static final String EDIT="edit";//表示修改

	public static final String UPLOAD_SUCCESS = "附件上传成功！"; //模板数据导入
	
	public static final String IMPORT_IFSUCCESS = "没有选择模板或者模板数据为空！";//模板数据判定
	
	public static final String PROJECT="立项";//立项
	
	public static final String DEMAND_FOR_HARD="需求用例评审";//需求用例评审
	
	public static final String DESIGN="设计";//设计
	
	public static final String IMPLEMENTATION="实现";//实现
	
	public static final String TEST="测试";//测试
	
	public static final String UATVALIDATION="UAT验证";//UAT验证
	
	public static final String ONLINE="上线";//上线
	
	public static final String ACCEPTANCE="验收";//验收
	
	public static final String NOT_AT_THE="未开始";//未开始
	
	public static final String ONGOING="进行中";//进行中
	
	public static final String COMPLETE="已完成";
	
	public static final String PROJECTSTART="项目启动";//项目启动
	
	public static final String PROJECTPLANNING="项目规划";//项目规划
	
	public static final String CONCEPTOFTRAINING="概念培训";//概念培训
	
	public static final String DEMANDRESEARCH="需求调研";//需求调研

	public static final String SYSTEMIMPLEMENTATION="系统实施";//系统实施
	
	public static final String LAUNCHPHASE="上线阶段";//上线阶段
	
	public static final String THEACCEPTANCESTAGE="验收阶段";//验收阶段
	
	public static final String OPERATIONSSUPPORT="运维支持";//运维支持
	
	public static final String PROJECTMOI="项目监控";//项目监控

	public static final String PROJECTPLAN="项目计划";//项目计划
	
	public static final String RISKMANAGEMENT="风险管理";//风险管理
	
	public static final String SIGNATURESCAN="签字扫描件";//签字扫描件
	
	/*操作日志部分*/
	//是否为子表
	public static final int ISDETAIL_Y = 1;                  //1是
	public static final int ISDETAIL_N = 0;                  //0否
	
	//操作类型 0为进入页面 、 1为保存 、2为删除、3查询、4 邮件
	public static final String OPERATETYPE_ZERO = "0"; 		// 进入页面 
	public static final String OPERATETYPE_ONE = "1"; 		// 保存 
	public static final String OPERATETYPE_TWO = "2"; 		// 删除
	public static final String OPERATETYPE_THREE = "3"; 	// 查询
	public static final String OPERATETYPE_FOUR = "4"; 		// 邮件
	
	//数据校验状态
	public static final String HAS_DATA="HAS_DATA";//是否有数据
	public static final String STATUS_EDIT="STATUS_EDIT";//是否可编辑
	
	//功能类型
	public static final String ROLE_CODE="RE100";				//角色标识码
	/**工作台 **/
	public static final String CATEGORYTYPE_R00101 = "R001_01" , CATEGORY_R00101 = "工作单";	
	public static final String CATEGORYTYPE_R00102 = "R001_02" , CATEGORY_R00102 = "投诉与建议";
	public static final String CATEGORYTYPE_R00103 = "R001_03" , CATEGORY_R00103 = "满意度调查";
	/**售前管理 **/
	public static final String CATEGORYTYPE_R00201 = "R002_01" , CATEGORY_R00201 = "客户维护";	 
	public static final String CATEGORYTYPE_R00202 = "R002_02" , CATEGORY_R00202 = "销售跟踪";	 
	/**合同管理 **/
	public static final String CATEGORYTYPE_R00301 = "R003_01" , CATEGORY_R00301 = "合同维护";	 
	public static final String CATEGORYTYPE_R00302 = "R003_02" , CATEGORY_R00302 = "合同审批";	
	public static final String CATEGORYTYPE_R00303 = "R003_03" , CATEGORY_R00303 = "收款节点管理";	 
	public static final String CATEGORYTYPE_R00304 = "R003_04" , CATEGORY_R00304 = "合同执行情况";	
	/**项目管理 **/
	public static final String CATEGORYTYPE_R00401 = "R004_01" , CATEGORY_R00401 = "项目立项";	 
	public static final String CATEGORYTYPE_R00402 = "R004_02" , CATEGORY_R00402 = "项目监控";	 
	public static final String CATEGORYTYPE_R00403 = "R004_03" , CATEGORY_R00403 = "实施监控";	 
	public static final String CATEGORYTYPE_R00404 = "R004_04" , CATEGORY_R00404 = "跟踪表";	
	public static final String CATEGORYTYPE_R00405 = "R004_05" , CATEGORY_R00405 = "报告管理";	 
	public static final String CATEGORYTYPE_R00406 = "R004_06" , CATEGORY_R00406 = "资源管理";	
	public static final String CATEGORYTYPE_R00407 = "R004_07" , CATEGORY_R00407 = "项目维护";
	public static final String CATEGORYTYPE_R00409 = "R004_09" , CATEGORY_R00409 = "主机清单";
	public static final String CATEGORYTYPE_R00408 = "R004_08" , CATEGORY_R00408 = "资产管理";	
	/**质量管理 **/
	public static final String CATEGORYTYPE_R00501 = "R005_01" , CATEGORY_R00501 = "质量控制";	 
	public static final String CATEGORYTYPE_R00502 = "R005_02" , CATEGORY_R00502 = "文档管理";	 
	public static final String CATEGORYTYPE_R00503 = "R005_03" , CATEGORY_R00503 = "管理手册";	
	/**培训管理**/
	public static final String CATEGORYTYPE_R00601 = "R006_01" , CATEGORY_R00601 = "带教计划";	 
	public static final String CATEGORYTYPE_R00602 = "R006_02" , CATEGORY_R00602 = "培训计划";	 
	public static final String CATEGORYTYPE_R00603 = "R006_03" , CATEGORY_R00603 = "晋级管理";
	public static final String CATEGORYTYPE_R00604 = "R006_04" , CATEGORY_R00604 = "新员工入职";
	public static final String CATEGORYTYPE_R00605 = "R006_05" , CATEGORY_R00605 = "带教计划模板";
	/**任务管理**/
	public static final String CATEGORYTYPE_R00701 = "R007_01" , CATEGORY_R00701 = "督办管理";	 
	public static final String CATEGORYTYPE_R00702 = "R007_02" , CATEGORY_R00702 = "任务控制台";	 
	public static final String CATEGORYTYPE_R00703 = "R007_03" , CATEGORY_R00703 = "我的任务";	
	public static final String CATEGORYTYPE_R00704 = "R007_04" , CATEGORY_R00704 = "工时登记";	 
	/**会议管理**/
	public static final String CATEGORYTYPE_R00801 = "R008_01" , CATEGORY_R00801 = "会议室";	 
	public static final String CATEGORYTYPE_R00802 = "R008_02" , CATEGORY_R00802 = "会议管理";	 
	/**绩效管理**/
	public static final String CATEGORYTYPE_R00901 = "R009_01" , CATEGORY_R00901 = "绩效档案";		
	public static final String CATEGORYTYPE_R00902 = "R009_02" , CATEGORY_R00902 = "绩效积分";	 
	public static final String CATEGORYTYPE_R00903 = "R009_03" , CATEGORY_R00903 = "绩效合约";	 
	public static final String CATEGORYTYPE_R00904 = "R009_04" , CATEGORY_R00904 = "年度计划";
	public static final String CATEGORYTYPE_R00905 = "R009_05" , CATEGORY_R00905 = "绩效模板";
	/**团建管理**/
	public static final String CATEGORYTYPE_R01001 = "R010_01" , CATEGORY_R01001 = "活动策划";	 
	public static final String CATEGORYTYPE_R01002 = "R010_02" , CATEGORY_R01002 = "活动计划";	 
	/**报销管理**/
	public static final String CATEGORYTYPE_R01101 = "R011_01" , CATEGORY_R01101 = "差旅报销";	 
	public static final String CATEGORYTYPE_R01102 = "R011_02" , CATEGORY_R01102 = "打车报销";	 
	/**考勤管理**/
	public static final String CATEGORYTYPE_R01201 = "R012_01" , CATEGORY_R01201 = "出勤记录";	
	public static final String CATEGORYTYPE_R01202 = "R012_02" , CATEGORY_R01202 = "请假管理";	
	/**统计分析**/
	public static final String CATEGORYTYPE_R01301 = "R013_01" , CATEGORY_R01301 = "成本报表";	
	public static final String CATEGORYTYPE_R01302 = "R013_02" , CATEGORY_R01302 = "满意度分析";
	public static final String CATEGORYTYPE_R01303 = "R013_03" , CATEGORY_R01303 = "满意度分析";
	/**系统管理**/
	public static final String CATEGORYTYPE_R01401 = "R014_01" , CATEGORY_R01401 = "用户管理";
	public static final String CATEGORYTYPE_R01402 = "R014_02" , CATEGORY_R01402 = "角色管理";
	public static final String CATEGORYTYPE_R01403 = "R014_03" , CATEGORY_R01403 = "基础数据维护";
	public static final String CATEGORYTYPE_R01404 = "R014_04" , CATEGORY_R01404 = "资源管理";
	public static final String CATEGORYTYPE_R01405 = "R014_05" , CATEGORY_R01405 = "组织架构维护";
	public static final String CATEGORYTYPE_R01406 = "R014_06" , CATEGORY_R01406 = "系统日志";
	public static final String CATEGORYTYPE_R01407 = "R014_07" , CATEGORY_R01407 = "修改密码";
	public static final String CATEGORYTYPE_R01408 = "R014_08" , CATEGORY_R01408 = "更新维护";
	public static final String CATEGORYTYPE_R01409 = "R014_09" , CATEGORY_R01409 = "服务单维护";
	public static final String CATEGORYTYPE_R01410 = "R014_10" , CATEGORY_R01410 = "流程管理";
	
	public static final Map<String, String> uploadType;  
    static  
    {  
    	uploadType = new HashMap<String, String>();  
    	uploadType.put(".doc", ".doc");  
    	uploadType.put(".docx", ".docx"); 
    	uploadType.put(".xls", ".xls"); 
    	uploadType.put(".xlsx", ".xlsx"); 
    	uploadType.put(".pdf", ".pdf"); 
    	uploadType.put(".ppt", ".ppt"); 
    	uploadType.put(".pptx", ".pptx"); 
    	uploadType.put(".jpg", ".jpg"); 
    	uploadType.put(".png", ".png"); 
    	uploadType.put(".gif", ".gif"); 
    	uploadType.put(".sql", ".sql"); 
    }  //上传类型
    
    public static final String AGE="24";
	
	public static final String CARID="430502199002220013";
	
	public static final String DATE = "2018-08-08";
	
	public static final int TEXT_AREA_MAX_LENGTH = 2000;		//文本域字数最大值
	
	public static final String NEW_STATE = "新建";
	
	public static final String APPROVAL_STATE = "已批准";
	
	public static final String RELEASE_STATE = "已发布";
}
