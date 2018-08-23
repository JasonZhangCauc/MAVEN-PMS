package com.ps.controller.workbenchmanager;

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
import com.ps.result.workbenchmanager.ComplaintsAndAdviceVo;
import com.ps.service.workbenchmanage.IComplaintsAndAdviceService;

/**
 * @Description 投诉与建议  Controller
 * @author zhujiejie
 * @date  2018年7月25日
 */
@Controller
@RequestMapping(value="/workbenchManage")
public class ComplaintsAndAdviceController extends BaseController {
	
	@Autowired
	private IComplaintsAndAdviceService complaintsAndAdviceService;

	//返回页面路径 
	private static final String COMPLAINTS_ADVICE_MAIN = "workbenchManage/complaintsAndAdviceMain/complaintsAndAdviceMain";//主页面
	private static final String COMPLAINTS_ADVICE_EDIT = "workbenchManage/complaintsAndAdviceMain/complaintsAndAdviceEdit";//编辑页
	private static final String COMPLAINTS_ADVICE_LOOK = "workbenchManage/complaintsAndAdviceMain/complaintsAndAdviceLook";//查看页
	
	
	/**
	 * @Description: 进入投诉与建议主页
	 * @author:      zhujiejie
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-25
	 */
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R00102)
	@OperateLog(remark="进入投诉与建议主页",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/complaintsAndAdviceMain",method=RequestMethod.GET)
	public String ComplaintsAndAdviceMain(HttpServletRequest request,HttpServletResponse response){
		return COMPLAINTS_ADVICE_MAIN;
	}
	
	/**
	 * @Description: 查询投诉与建议信息
	 * @author:      zhujiejie
	 * @param:       ComplaintsAndAdviceVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-07-25
	 */
	@RequestMapping(value="/complaintsAndAdviceInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询投诉与建议信息",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange complaintsAndAdviceInfoByParam(HttpServletRequest request,HttpServletResponse response,ComplaintsAndAdviceVo param){
		//数据权限
		param.initDataAuthByCode(request, "R001_02_DATA");
		param.initDataTableParam(request);
		List<ComplaintsAndAdviceVo> dataList =this.complaintsAndAdviceService.queryComplaintsAndAdviceInfoByParam(param);
		PageInfo<ComplaintsAndAdviceVo> page = new PageInfo<ComplaintsAndAdviceVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入投诉与建议编辑/新增/查看界面
	 * @param  todo
	 * @return URL
	 * @author zhujiejie
	 * @date:  2018-07-25
	 */
	@OperateLog(remark="进入投诉与建议编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/complaintsAndAdviceEdit",method=RequestMethod.GET)
	public String complaintsAndAdviceEdit(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		String operate = request.getParameter("operate");
		//根据ID查询数据
		ComplaintsAndAdviceVo vo=this.complaintsAndAdviceService.queryComplaintsAndAdviceInfoById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("operate", operate);
		return COMPLAINTS_ADVICE_EDIT;
	}
	
	/**
	 * @Description: 进入投诉与建议编辑/新增/查看界面
	 * @param  todo
	 * @return URL
	 * @author zhujiejie
	 * @date:  2018-07-25
	 */
	@OperateLog(remark="查看信息页面",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/complaintsAndAdviceLook",method=RequestMethod.GET)
	public String complaintsAndAdviceLook(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		String operate = request.getParameter("operate");
		//根据ID查询数据
		ComplaintsAndAdviceVo vo=this.complaintsAndAdviceService.queryComplaintsAndAdviceInfoById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("operate", operate);
		return COMPLAINTS_ADVICE_LOOK;
	}
	/**
	 * @Description: 保存投诉与建议信息
	 * @author:      zhujiejie
	 * @param:       ComplaintsAndAdviceVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-25
	 */
	@SecurityValid(resourceCode="R001_02_OPERATION_EDIT")
	@OperateLog(remark="保存投诉与建议信息",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveComplaintsAndAdvice",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveComplaintsAndAdvice(HttpServletRequest request,HttpServletResponse response,ComplaintsAndAdviceVo vo){
		this.complaintsAndAdviceService.saveComplaintsAndAdvice(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除投诉与建议信息
	 * @author:      zhujiejie
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-25
	 */
	@SecurityValid(resourceCode="R001_02_OPERATION_DELC")
	@OperateLog(remark="删除投诉与建议信息",cateGory=GlobalConstants.CATEGORY_R00102,cateGoryType=GlobalConstants.CATEGORYTYPE_R00102,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteComplaintsAndAdvice",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteComplaintsAndAdvice(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		this.complaintsAndAdviceService.deleteComplaintsAndAdviceById(id);
		return this.returnOperateData(null, null);
	}
}