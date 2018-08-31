package com.ps.controller.systemmanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.systemmanage.UpdateLogVo;
import com.ps.service.systemmanage.IUpdateLogService;

/** 
 *@Description: 更新日志controller
 * @author：		ZHOUMIN
 * @date：		2018-07-23
 */
@Controller
@RequestMapping(value="/systemManage")
public class UpdateLogController extends BaseController{
	@Autowired
	private IUpdateLogService updateLogService;

	//返回页面路径 
	private static final String UPDATE_LOG_MAIN = "systemManage/updateLog/updateLogMain";//主页面
	private static final String UPDATE_LOG_EDIT = "systemManage/updateLog/updateLogEdit";//编辑页
	private static final String UPDATE_LOG_VIEW_MAIN="systemManage/updateLog/updateLogViewMain";//查看主页面
	
	
	/**
	 * @Description: 进入更新日志主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-23
	 */
	@OperateLog(remark="进入更新日志主页",cateGory=GlobalConstants.CATEGORY_R01408,cateGoryType=GlobalConstants.CATEGORYTYPE_R01408,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateLogMain",method=RequestMethod.GET)
	public String UpdateLogMain(HttpServletRequest request,HttpServletResponse response){
		return UPDATE_LOG_MAIN;
	}
	
	/**
	 * @Description: 进入更新日志主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-23
	 */
	@OperateLog(remark="进入更新日志主页",cateGory=GlobalConstants.CATEGORY_R01408,cateGoryType=GlobalConstants.CATEGORYTYPE_R01408,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateLogViewMain",method=RequestMethod.GET)
	public String updateLogViewMain(HttpServletRequest request,HttpServletResponse response){
		List<UpdateLogVo> dataList =this.updateLogService.queryUpdateLogInfo();
		request.setAttribute("updatelogList", dataList);
		return UPDATE_LOG_VIEW_MAIN;
	}
	
	/**
	 * @Description: 查询更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-07-23
	 */
	@RequestMapping(value="/queryUpdateLogByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询更新日志信息",cateGory=GlobalConstants.CATEGORY_R01408,cateGoryType=GlobalConstants.CATEGORYTYPE_R01408,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange updateLogByParam(HttpServletRequest request,
					HttpServletResponse response,UpdateLogVo param){
		param.initDataTableParam(request);
		List<UpdateLogVo> dataList =this.updateLogService.queryUpdateLogByParam(param);
		PageInfo<UpdateLogVo> page = new PageInfo<UpdateLogVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入更新日志编辑/新增/查看界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-07-23
	 */
	@OperateLog(remark="进入更新日志编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R01408,cateGoryType=GlobalConstants.CATEGORYTYPE_R01408,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateLogEdit",method=RequestMethod.GET)
	public String updateLogEdit(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		//根据ID查询数据
		UpdateLogVo vo=this.updateLogService.queryUpdateLogInfoById(id);
		request.setAttribute("vo", vo);
		return UPDATE_LOG_EDIT;
	}
	
	/**
	 * @Description: 保存更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-23
	 */
	@OperateLog(remark="保存更新日志信息",cateGory=GlobalConstants.CATEGORY_R01408,cateGoryType=GlobalConstants.CATEGORYTYPE_R01408,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveUpdateLog",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveUpdateLog(HttpServletRequest request,
			HttpServletResponse response,UpdateLogVo vo){
		this.updateLogService.saveUpdateLog(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-23
	 */
	@OperateLog(remark="删除更新日志信息",cateGory=GlobalConstants.CATEGORY_R01408,cateGoryType=GlobalConstants.CATEGORYTYPE_R01408,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteUpdateLog",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteUpdateLog(HttpServletRequest request,
			HttpServletResponse response){
		String id = request.getParameter("id");
		this.updateLogService.deleteUpdateLogById(id);
		return this.returnOperateData(null, null);
	}
}
