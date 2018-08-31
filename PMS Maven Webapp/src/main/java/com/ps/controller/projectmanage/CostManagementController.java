package com.ps.controller.projectmanage;

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
import com.ps.result.projectmanage.CostManagementVo;
import com.ps.service.projectmanage.ICostManagementService;


/** 
 *@Description: 单价管理Controller
 * @author：		jczou
 * @date：		2018-02-28
 */
@Controller
@RequestMapping(value="/projectManagement")
public class CostManagementController extends BaseController {
	
	@Autowired
	private ICostManagementService costManagementService;

	//返回页面路径 
	private static final String COST_MANANGER_MAIN = "projectManage/costmanager/costManagementMain";//主页面
	private static final String COST_MANANGER_EDIT = "projectManage/costmanager/costManagementEdit";//编辑页
	
	
	/**
	 * @Description: 进入单价管理主页
	 * @author:      jczou
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-02-28
	 */
	@SecurityValid(resourceCode="R004_03")
	@OperateLog(remark="进入单价管理主页",cateGory=GlobalConstants.CATEGORY_R00403,cateGoryType=GlobalConstants.CATEGORYTYPE_R00403,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/costManagementMain",method=RequestMethod.GET)
	public String CostManagementMain(HttpServletRequest request,HttpServletResponse response){
		return COST_MANANGER_MAIN;
	}
	
	/**
	 * @Description: 查询单价管理信息
	 * @author:      jczou
	 * @param:       CostManagementVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-02-28
	 */
	@RequestMapping(value="/costManagementInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询单价管理信息",cateGory=GlobalConstants.CATEGORY_R00403,cateGoryType=GlobalConstants.CATEGORYTYPE_R00403,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange costManagementInfoByParam(HttpServletRequest request,
					HttpServletResponse response,CostManagementVo vo){
		vo.initDataTableParam(request);
		List<CostManagementVo> dataList =this.costManagementService.queryCostManagementInfoByParam(vo);
		PageInfo<CostManagementVo> page = new PageInfo<CostManagementVo>(dataList);
		ListRange lr = new ListRange(vo,page);
		return lr;
	}
	
	/**
	 * @Description: 进入单价管理编辑/新增/查看界面
	 * @param  
	 * @return URL
	 * @author jczou
	 * @date:  2018-02-28
	 */
	@SecurityValid(resourceCode="R004_0301")
	@OperateLog(remark="进入单价管理编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R00403,cateGoryType=GlobalConstants.CATEGORYTYPE_R00403,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/costManagementEdit",method=RequestMethod.GET)
	public String costManagementEdit(HttpServletRequest request,HttpServletResponse response, 
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		CostManagementVo vo=this.costManagementService.queryCostManagementInfoById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("operate",operate);
		request.setAttribute("changeList", vo.getChangeList());
		return COST_MANANGER_EDIT;
	}
	
	/**
	 * @Description: 保存单价管理信息
	 * @author:      jczou
	 * @param:       CostManagementVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-02-28
	 */
	@OperateLog(remark="保存单价管理信息",cateGory=GlobalConstants.CATEGORY_R00403,cateGoryType=GlobalConstants.CATEGORYTYPE_R00403,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveCostManagement",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveCostManagement(HttpServletRequest request,
		HttpServletResponse response,CostManagementVo vo){
		this.costManagementService.saveCostManagement(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除单价管理信息
	 * @author:      jczou
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-02-28
	 */
	@SecurityValid(resourceCode="R004_0302")
	@OperateLog(remark="删除单价管理信息",cateGory=GlobalConstants.CATEGORY_R00403,cateGoryType=GlobalConstants.CATEGORYTYPE_R00403,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteCostManagement",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteCostManagement(HttpServletRequest request,
		HttpServletResponse response){
		String id = request.getParameter("id");
		this.costManagementService.deleteCostManagementById(id);
		return this.returnOperateData(null, null);
	}
}