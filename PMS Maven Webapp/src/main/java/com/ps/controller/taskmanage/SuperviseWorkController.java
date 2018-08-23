package com.ps.controller.taskmanage;

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
import com.ps.result.taskmanage.AdjustRecordVo;
import com.ps.result.taskmanage.OverseeVo;
import com.ps.service.taskmanage.IOverseeService;

/** 
 *@Description: 督办管理Controller
 * @author：		zhangm
 * @date：		2018-07-27
 */
@Controller
@RequestMapping(value="/taskManage")
public class SuperviseWorkController extends BaseController{
	@Autowired
	private IOverseeService overseeService;
	
	private static final String SUPERVISE_WORK_LIST = "/taskManage/superviseManageMain/superviseManageMain";//督办主页面
	
	private static final String SUPERVISE_WORK_EDIT = "/taskManage/superviseManageMain/superviseWorkInfoEdit";//编辑
	
	private static final String SUPERVISE_WORK_AUTH = "/taskManage/superviseManageMain/superviseWorkInfoAuthEdit";//审核
	
	private static final String SUPERVISE_WORK_LOOK = "/taskManage/superviseManageMain/superviseWorkInfoLook";//查看
	
	private static final String SUPERVISE_WORK_ADJUST = "/taskManage/superviseManageMain/superviseWorkInfoAuthAdjust";//调整
	
	/**
	 * @Description: 保存督办信息
	 * @author:      zhangm
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-27
	 */
	@OperateLog(remark="保存督办信息",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveSuperviseInfo",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveSuperviseInfo(HttpServletRequest request,
			HttpServletResponse response,OverseeVo vo){
		this.overseeService.saveSuperviseInfo(vo);
		return this.returnOperateData(null,null);
	}
	
	@OperateLog(remark="保存督办信息",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateSuperviseInfo",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateSuperviseInfo(HttpServletRequest request,
			HttpServletResponse response,OverseeVo vo){
		this.overseeService.updateSuperviseInfo(vo);
		return this.returnOperateData(null,null);
	}
	
	/**
	 * @Description: 责任人进行处理
	 * @author:      zhangm
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-27
	 */
	@OperateLog(remark="保存项目维护信息",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveSuperviseInfoCL",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveSuperviseInfoCL(HttpServletRequest request,
			HttpServletResponse response,OverseeVo vo){
		this.overseeService.saveSuperviseInfoCL(vo);
		return this.returnOperateData(null,null);
	}
	
	
	/**
	 * @Description: 进入督办基本信息编辑/新增/查看界面
	 * @return URL
	 * @author zhangm
	 * @date:  2018-07-27
	 */
	@SecurityValid(resourceCode="R007_01_OPERATION_EDIT")
	@OperateLog(remark="进入项目基本信息编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/superviseWorkInfoEdit",method=RequestMethod.GET)
	public String superviseWorkInfoEdit(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = true) String operate){
		OverseeVo vo=this.overseeService.queryOverseeBaseInfoById(id);
		request.setAttribute("operate",operate);
		request.setAttribute("vo",vo);
		return SUPERVISE_WORK_EDIT;
	}
	
	/**
	 * @Description: 进入督办基本信息编辑/新增/查看界面
	 * @return URL
	 * @author zhangm
	 * @date:  2018-07-27
	 */
	@SecurityValid(resourceCode="R007_01_OPERATION_LOOK")
	@RequestMapping(value="/superviseWorkInfoLook",method=RequestMethod.GET)
	public String superviseWorkInfoLook(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = true) String operate){
		OverseeVo vo=this.overseeService.queryOverseeBaseInfoById(id);
		request.setAttribute("operate",operate);
		request.setAttribute("vo",vo);
		return SUPERVISE_WORK_LOOK;
	}
	
	/**
	 * @Description: 进入督办基本信息编辑/新增/查看界面
	 * @return URL
	 * @author zhangm
	 * @date:  2018-07-27
	 */
	@SecurityValid(resourceCode="R007_01_OPERATION_CL")
	@OperateLog(remark="进入项目基本信息编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/superviseWorkInfoAuthAdjust",method=RequestMethod.GET)
	public String superviseWorkInfoAuthAdjust(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = true) String operate){
		OverseeVo vo=this.overseeService.queryOverseeBaseInfoById(id);
		request.setAttribute("operate",operate);
		request.setAttribute("vo",vo);
		return SUPERVISE_WORK_ADJUST;
	}
	
	@SecurityValid(resourceCode="R007_01_OPERATION_TZ")
	@OperateLog(remark="进入项目基本信息编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/superviseWorkInfoAuthEdit",method=RequestMethod.GET)
	public String superviseWorkInfoAuthEdit(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = true) String operate){
		OverseeVo vo=this.overseeService.queryOverseeBaseInfoById(id);
		request.setAttribute("operate",operate);
		request.setAttribute("vo",vo);
		return SUPERVISE_WORK_AUTH;
	}
	
	
	/**
	 * @Description: 审批督办信息
	 * @author:      zhangm
	 * @param:       ContractApprovalVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-02
	 */
	@SecurityValid(resourceCode="R007_01_OPERATION_AUTH")
	@OperateLog(remark="审批项目信息",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateSuperviseInfoStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateSuperviseInfoStatus(HttpServletRequest request,
			HttpServletResponse response,OverseeVo vo){
		this.overseeService.updateSuperviseInfoStatus(vo);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 进入督办信息主页
	 * @author:      zhangm
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-27
	 */
	
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R00701)
	@OperateLog(remark="进入督办信息主页",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/superviseManageMain",method=RequestMethod.GET)
	public String superviseManageMain(HttpServletRequest request,HttpServletResponse response){
		return SUPERVISE_WORK_LIST;
	}
	
	/**
	 * @Description: 查询督办维护信息
	 * @author:      zhangm
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-07-27
	 */
	@RequestMapping(value="/querySuperviseBaseInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询督办维护信息",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange querySuperviseBaseInfoByParam(HttpServletRequest request,
					HttpServletResponse response,OverseeVo param){
		//数据权限
		param.initDataAuthByCode(request, "R007_01_DATA");
		param.initDataTableParam(request);
		List<OverseeVo> dataList =this.overseeService.queryOverseeInfoByParam(param);
		PageInfo<OverseeVo> page = new PageInfo<OverseeVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 查询督办维护信息
	 * @author:      zhangm
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-07-27
	 */
	@RequestMapping(value="/queryAdjustRecordVoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询督办维护信息",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryAdjustRecordVoByParam(HttpServletRequest request,
					HttpServletResponse response,AdjustRecordVo param){
		//数据权限
		param.initDataAuthByCode(request, "DATA0504");
		param.initDataTableParam(request);
		List<AdjustRecordVo> dataList =this.overseeService.queryAdjustRecordVoByParam(param);
		PageInfo<AdjustRecordVo> page = new PageInfo<AdjustRecordVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	
	/**
	 * @Description: 删除督办信息
	 * @author:      zhangm
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-27
	 */
	@SecurityValid(resourceCode="R007_01_OPERATION_DEL")
	@OperateLog(remark="删除项目维护信息",cateGory=GlobalConstants.CATEGORY_R00701,cateGoryType=GlobalConstants.CATEGORYTYPE_R00701,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteSuperviseInfo",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteSuperviseInfo(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.overseeService.deleteSuperviseInfo(id);
		return this.returnOperateData(null, null);
	}

}
