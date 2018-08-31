package com.ps.controller.performancemanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.aop.security.SecurityValid;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.performancemanage.DailyReportVo;
import com.ps.service.performancemanage.IDailyReportManagerService;


/** 
 *@Description: 日报管理Controller
 * @author：		ZHOUMIN
 * @date：		2018-03-13
 */
@Controller
@RequestMapping(value="/dailyReportManager")
public class DailyReportManagerController extends BaseController {
	
	@Autowired
	private IDailyReportManagerService dailyReportManagerService;

	//返回页面路径 
	private static final String DAILY_REPORT_MANAGER_MAIN = "performanceManage/dailyReportManager/dailyReportManagerMain";//日报管理主页面
	private static final String DAILY_REPORT_MANAGER_EDIT = "performanceManage/dailyReportManager/dailyReportManagerEdit";//日报管理编辑页
	
	
	/**
	 * @Description: 进入日报管理主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-13
	 */
	@SecurityValid(resourceCode="R006_02")
	@OperateLog(remark=" 进入日报管理主页",cateGory=GlobalConstants.CATEGORY_R00602,cateGoryType=GlobalConstants.CATEGORYTYPE_R00602,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/dailyReportManagerMain",method=RequestMethod.GET)
	public String dailyReportManagerMain(HttpServletRequest request,HttpServletResponse response){
		return DAILY_REPORT_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询日报信息
	 * @author:      ZHOUMIN
	 * @param:       DailyReportVo
	 * @return:      DailyReportVo 日报数据实体类
	 * @date:        2018-03-13
	 */
	@RequestMapping(value="/dailyReportInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询日报信息",cateGory=GlobalConstants.CATEGORY_R00602,cateGoryType=GlobalConstants.CATEGORYTYPE_R00602,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange dailyReportInfoByParam(HttpServletRequest request,
					HttpServletResponse response,DailyReportVo param){
		//数据权限
		param.initDataAuthByCode(request, "DATA0602");
		//分页
		param.initDataTableParam(request);
		List<DailyReportVo> dataList =this.dailyReportManagerService.queryDailyReportInfoByParam(param);
		PageInfo<DailyReportVo> page = new PageInfo<DailyReportVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入日报管理编辑/新增界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-13
	 */
	@SecurityValid(resourceCode="R006_0201")
	@OperateLog(remark="进入日报管理编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R00602,cateGoryType=GlobalConstants.CATEGORYTYPE_R00602,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/dailyReportEdit",method=RequestMethod.GET)
	public String dailyReportEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		DailyReportVo dailyReportVo=this.dailyReportManagerService.queryDailyReportInfoById(id);
		request.setAttribute("dailyReportVo", dailyReportVo);
		request.setAttribute("changeList", dailyReportVo.getChangeList());
		request.setAttribute("operate", operate);
		return DAILY_REPORT_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存日报信息
	 * @author:      ZHOUMIN
	 * @param:       DailyReportVo 日报信息
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="保存日报信息",cateGory=GlobalConstants.CATEGORY_R00602,cateGoryType=GlobalConstants.CATEGORYTYPE_R00602,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveDailyReport",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveDailyReport(HttpServletRequest request,
			HttpServletResponse response,DailyReportVo vo){
		this.dailyReportManagerService.saveDailyReport(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除日报信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-13
	 */
	@SecurityValid(resourceCode="R006_0202")
	@OperateLog(remark="删除日报信息",cateGory=GlobalConstants.CATEGORY_R00602,cateGoryType=GlobalConstants.CATEGORYTYPE_R00602,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteDailyReport",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteDailyReport(HttpServletRequest request,
			HttpServletResponse response){
		String id = request.getParameter("id");
		this.dailyReportManagerService.deleteDailyReportById(id);
		return this.returnOperateData(null, null);
	}
}