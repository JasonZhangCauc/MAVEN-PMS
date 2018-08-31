package com.ps.controller.projectmanage;

import java.util.List;
import java.util.Map;

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
import com.ps.result.projectmanage.WorkHoursVo;
import com.ps.service.projectmanage.IWorkHoursManagerService;
import com.util.file.DocumentHandlerUtil;


/** 
 *@Description: 工时统计Controller
 * @author：		jczou
 * @date：		2018-03-15
 */
@Controller
@RequestMapping(value="/projectManagement")
public class WorkHoursManagerController extends BaseController {
	
	@Autowired
	private IWorkHoursManagerService workHoursManagerService;

	//返回页面路径 
	private static final String WORK_HOURS_MAIN = "projectManage/workhoursmanager/workHoursManagerMain";//主页面
	private static final String WORK_HOURS_EDIT = "projectManage/workhoursmanager/workHoursManagerEdit";//编辑页
	
	
	/**
	 * @Description: 进入工时统计主页
	 * @author:      jczou
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-15
	 */
	@SecurityValid(resourceCode="R004_04")
	@OperateLog(remark="进入工时统计主页",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/workHoursManagerMain",method=RequestMethod.GET)
	public String WorkHoursManagerMain(HttpServletRequest request,HttpServletResponse response){
		return WORK_HOURS_MAIN;
	}
	
	/**
	 * @Description: 查询工时统计信息
	 * @author:      jczou
	 * @param:       WorkHoursManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-15
	 */
	@RequestMapping(value="/workHoursInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询工时统计信息",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange workHoursInfoByParam(HttpServletRequest request,
					HttpServletResponse response,WorkHoursVo param){
		param.initDataTableParam(request);
		List<WorkHoursVo> dataList =this.workHoursManagerService.queryWorkHoursInfoByParam(param);
		PageInfo<WorkHoursVo> page = new PageInfo<WorkHoursVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入工时编辑/新增/查看界面
	 * @param  
	 * @return URL
	 * @author jczou
	 * @date:  2018-03-15
	 */
	@SecurityValid(resourceCode="R004_0401")
	@OperateLog(remark="进入工时编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/workHoursEdit",method=RequestMethod.GET)
	public String workHoursEdit(HttpServletRequest request,HttpServletResponse response, 
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		WorkHoursVo workHoursVo=this.workHoursManagerService.queryWorkHoursInfoById(id);
		request.setAttribute("workHoursVo", workHoursVo);
		request.setAttribute("operate",operate);
		request.setAttribute("changeList", workHoursVo.getChangeList());
		return WORK_HOURS_EDIT;
	}
	
	/**
	 * @Description: 保存工时统计信息
	 * @author:      jczou
	 * @param:       WorkHoursManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-15
	 */
	@OperateLog(remark="保存工时统计信息",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveWorkHours",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveWorkHours(HttpServletRequest request,
			HttpServletResponse response,WorkHoursVo vo){
			this.workHoursManagerService.saveWorkHours(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除工时统计信息
	 * @author:      jczou
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-15
	 */
	@SecurityValid(resourceCode="R004_0402")
	@OperateLog(remark="删除工时统计信息",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
		operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteWorkHours",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteWorkHours(HttpServletRequest request,
			HttpServletResponse response){
			String id = request.getParameter("id");
			this.workHoursManagerService.deleteWorkHoursById(id);
			return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 导出工时统计信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@SecurityValid(resourceCode="R004_0403")
	@RequestMapping(value="/exportWorkHoursInfo", method=RequestMethod.POST)
	@OperateLog(remark="导出工时统计信息",cateGory=GlobalConstants.CATEGORY_R00404,cateGoryType=GlobalConstants.CATEGORYTYPE_R00404,
		operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=0)
	public void exportWorkHoursInfo(HttpServletRequest request, HttpServletResponse response,
			WorkHoursVo workHoursVo) throws Exception{
		//构建导出数据
		Map<String, Object> param = this.workHoursManagerService.exportWorkHoursInfo(workHoursVo);
		//文档名称国际化
		DocumentHandlerUtil documentHandlerUtil = new DocumentHandlerUtil();
		documentHandlerUtil.createFile(request, response, param, param.get("template").toString(), 
				param.get("fileName").toString(), param.get("fileType").toString());
	}
}