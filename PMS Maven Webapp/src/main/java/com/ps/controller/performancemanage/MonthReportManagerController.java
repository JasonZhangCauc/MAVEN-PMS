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
import com.ps.result.performancemanage.MonthReportVo;
import com.ps.service.performancemanage.IMonthReportManagerService;


/** 
 *@Description: 月报管理Controller
 * @author：		ZHOUMIN
 * @date：		2018-03-14
 */
@Controller
@RequestMapping(value="/monthReportManager")
public class MonthReportManagerController extends BaseController {
	
	@Autowired
	private IMonthReportManagerService monthReportManagerService;

	//返回页面路径 
	private static final String MONTH_REPORT_MANAGER_MAIN = "performanceManage/monthReportManager/monthReportManagerMain";//主页面
	private static final String MONTH_REPORT_MANAGER_EDIT = "performanceManage/monthReportManager/monthReportManagerEdit";//编辑页
	
	
	/**
	 * @Description: 进入月报管理主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-14
	 */
	@SecurityValid(resourceCode="R006_03")
	@OperateLog(remark="进入月报管理主页",cateGory=GlobalConstants.CATEGORY_R00603,cateGoryType=GlobalConstants.CATEGORYTYPE_R00603,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/monthReportManagerMain",method=RequestMethod.GET)
	public String MonthReportManagerMain(HttpServletRequest request,HttpServletResponse response){
		return MONTH_REPORT_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询月报信息
	 * @author:      ZHOUMIN
	 * @param:       MonthReportManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-14
	 */
	@RequestMapping(value="/monthReportInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询月报信息",cateGory=GlobalConstants.CATEGORY_R00603,cateGoryType=GlobalConstants.CATEGORYTYPE_R00603,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange monthReportInfoByParam(HttpServletRequest request,
					HttpServletResponse response,MonthReportVo param){
		param.initDataAuthByCode(request, "DATA0603");
		param.initDataTableParam(request);
		List<MonthReportVo> dataList =this.monthReportManagerService.queryMonthReportInfoByParam(param);
		PageInfo<MonthReportVo> page = new PageInfo<MonthReportVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入月报编辑/新增界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-14
	 */
	@SecurityValid(resourceCode="R006_0301")
	@OperateLog(remark="进入月报编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R00603,cateGoryType=GlobalConstants.CATEGORYTYPE_R00603,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/monthReportEdit",method=RequestMethod.GET)
	public String monthReportEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		MonthReportVo monthReportVo=this.monthReportManagerService.queryMonthReportInfoById(id);
		request.setAttribute("monthReportVo", monthReportVo);
		request.setAttribute("changeList", monthReportVo.getChangeList());
		request.setAttribute("operate", operate);
		return MONTH_REPORT_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存月报信息
	 * @author:      ZHOUMIN
	 * @param:       MonthReportManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-14
	 */
	@OperateLog(remark="保存月报信息",cateGory=GlobalConstants.CATEGORY_R00603,cateGoryType=GlobalConstants.CATEGORYTYPE_R00603,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveMonthReport",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveMonthReport(HttpServletRequest request,
			HttpServletResponse response,MonthReportVo vo){
		this.monthReportManagerService.saveMonthReport(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除月报信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-14
	 */
	@SecurityValid(resourceCode="R006_0302")
	@OperateLog(remark="删除月报信息",cateGory=GlobalConstants.CATEGORY_R00603,cateGoryType=GlobalConstants.CATEGORYTYPE_R00603,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteMonthReport",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteMonthReport(HttpServletRequest request,
			HttpServletResponse response){
		String id = request.getParameter("id");
		this.monthReportManagerService.deleteMonthReportById(id);
		return this.returnOperateData(null, null);
	}
}