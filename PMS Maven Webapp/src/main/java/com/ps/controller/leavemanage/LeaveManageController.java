package com.ps.controller.leavemanage;

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
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.leavemanage.LeaveVo;
import com.ps.service.leavemanage.ILeaveManageService;

/**
 * 
 * 请假管理
 * LeaveManageController
 * @author：JasonZhang
 * @date：2018-8-13-上午11:19:41 
 *
 */
@Controller
@RequestMapping(value="/checkinginManage")
public class LeaveManageController extends BaseController{
	
	@Autowired
	private ILeaveManageService leaveManageService;

	//返回页面路径 
	private static final String LEAVE_PAGE_MAIN = "checkinginManage/leaveManage/leaveManageMain";//主页面
	private static final String LEAVE_PAGE_EDIT = "checkinginManage/leaveManage/leaveManageEdit";//编辑页
	
	
	/**
	 * 
	 * @Description:进入请假管理主页
	 * @author：JasonZhang 
	 * @date：2018-8-13-上午11:23:06 
	 * @param request
	 * @param response
	 * @return String
	 * @exception
	 */
	@OperateLog(remark="进入请假管理主页",cateGory="请假管理",cateGoryType=GlobalConstants.CATEGORYTYPE_R01202,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/leaveManageMain",method=RequestMethod.GET)
	public String LeaveManageMain(HttpServletRequest request,HttpServletResponse response){
		return LEAVE_PAGE_MAIN;
	}
	
	/**
	 * 
	 * @Description:根据参数查询请假管理信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午1:46:10 
	 * @param request
	 * @param response
	 * @param param
	 * @return ListRange
	 * @exception
	 */
	@RequestMapping(value="/leaveInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询请假信息",cateGory="请假管理",cateGoryType=GlobalConstants.CATEGORYTYPE_R01202,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange leaveManageInfoByParam(HttpServletRequest request,
					HttpServletResponse response,LeaveVo param){
		param.initDataTableParam(request);
		List<LeaveVo> dataList =this.leaveManageService.queryLeaveInfoByParam(param);
		PageInfo<LeaveVo> page = new PageInfo<LeaveVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	/**
	 * 
	 * @Description:进入请假记录编辑/新增/查看界面
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午1:46:24 
	 * @param request
	 * @param response
	 * @param id
	 * @param operate
	 * @return String
	 * @exception
	 */
	@OperateLog(remark="进入请假编辑信息页面",cateGory="请假管理",cateGoryType=GlobalConstants.CATEGORYTYPE_R01202,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/leaveManageEdit",method=RequestMethod.GET)
	public String leaveManageEdit(HttpServletRequest request,HttpServletResponse response,
	@RequestParam(value="id",required=false)String id,
	@RequestParam(value = "operate", required = false) String operate){	
		//根据ID查询数据
		LeaveVo vo=this.leaveManageService.queryLeaveInfoById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("changeList", vo.getChangeList());
		request.setAttribute("operate",operate);
		return LEAVE_PAGE_EDIT;
	}
	
	/**
	 * 
	 * @Description:保存
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午1:48:34 
	 * @param request
	 * @param response
	 * @param vo
	 * @return OperateStatusVo
	 * @exception
	 */
	@OperateLog(remark="保存请假信息",cateGory="请假管理",cateGoryType=GlobalConstants.CATEGORYTYPE_R01202,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveLeave",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveLeave(HttpServletRequest request,
			HttpServletResponse response,LeaveVo vo){
		this.leaveManageService.saveLeave(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * 
	 * @Description:删除
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午1:50:02 
	 * @param request
	 * @param response
	 * @param id
	 * @return OperateStatusVo
	 * @exception
	 */
	@OperateLog(remark="删除请假信息",cateGory="请假管理",cateGoryType=GlobalConstants.CATEGORYTYPE_R01202,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteLeave",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteLeave(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=false)String id){
			this.leaveManageService.deleteLeaveById(id);
			return this.returnOperateData(null, null);
	}
	/**
	 * 
	 * @Description:提交请假请求
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午1:51:59 
	 * @param request
	 * @param response
	 * @param id
	 * @return OperateStatusVo
	 * @exception
	 */
	@OperateLog(remark="提交请假请求",cateGory="请假管理",cateGoryType=GlobalConstants.CATEGORYTYPE_R01202,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateLeaveSendStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo submmitLeave(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=false)String id){
			this.leaveManageService.updateLeaveSendStatus(id);
			return this.returnOperateData(null, null);
	}
	
	/**
	 * 
	 * @Description:否决请假请求
	 * @author：JasonZhang 
	 * @date：2018-8-14-下午1:34:45 
	 * @param request
	 * @param response
	 * @param id
	 * @return OperateStatusVo
	 * @exception
	 */
	@OperateLog(remark="否决请假请求",cateGory="请假管理",cateGoryType=GlobalConstants.CATEGORYTYPE_R01202,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateLeaveState",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo backLeave(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=false)String id){
			this.leaveManageService.updateLeaveState(id);
			return this.returnOperateData(null, null);
	}
	
	@OperateLog(remark="通过请假请求",cateGory="请假管理",cateGoryType=GlobalConstants.CATEGORYTYPE_R01202,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/passLeaveState",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo passLeave(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=false)String id){
			this.leaveManageService.passLeaveState(id);
			return this.returnOperateData(null, null);
	}

}
