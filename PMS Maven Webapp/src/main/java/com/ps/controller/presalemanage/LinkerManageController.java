package com.ps.controller.presalemanage;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
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
import com.ps.result.presalemanage.LinkerVo;
import com.ps.service.presalemanage.ILinkerManageService;


/** 
 * @Description: 客户联系人
 * @author：		raomingyi
 * @date：		2018-03-05
 */
@Controller
@RequestMapping(value="/preSalesManage")
public class LinkerManageController extends BaseController {
	
	@Autowired
	private ILinkerManageService linkerManageService;

	//返回页面路径 
	private static final String LINKER_PAGE_EDIT = "preSalesManage/custommanage/linkerManageEdit";//编辑联系人页面
	//返回查询界面
	private static final String LINKER_PAGE_LOOK = "preSalesManage/custommanage/linkerManageLook";//返回查询界面
	
	
	/**
	 * @Description: 查询客户联系人信息
	 * @author:      raomingyi
	 * @param:       LinkerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-05
	 */
	@RequestMapping(value="/linkerInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询客户联系人信息",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange linkerInfoByParam(HttpServletRequest request,
					HttpServletResponse response,LinkerVo param){
		param.initDataTableParam(request);
		List<LinkerVo> dataList =this.linkerManageService.queryLinkerInfoByParam(param);
		PageInfo<LinkerVo> page = new PageInfo<LinkerVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入联系人编辑/新增/查看界面
	 * @param  linkerId
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-05
	 */
	@SecurityValid(resourceCode="R002_01_OPERATION_EDITP")
	@OperateLog(remark="进入客户联系人编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/linkerManageEdit",method=RequestMethod.GET)
	public String linkerManageEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="linkerId",required=false) String linkerId,
			@RequestParam(value="customId",required=false) String customId,
			@RequestParam(value="customerId",required=false) String customerId,
			@RequestParam(value = "operate", required = false) String operate){		   
			//根据ID查询数据		     
			LinkerVo vo=this.linkerManageService.queryLinkerInfoById(linkerId);
			//新增联系人，获取客户ID
			if(StringUtils.isBlank(linkerId)){
			  vo.setCustomerId(customId); 	
			 }
			if(!StringUtils.isBlank(customerId)){
				request.setAttribute("linkerId", customerId);
				request.setAttribute("customerId", customerId);
				vo.setCustomerId(customerId); 
			}
			request.setAttribute("vo", vo);
			request.setAttribute("operate",operate);
			return LINKER_PAGE_EDIT;
	}
	
	/**
	 * @Description: 进入联系人编辑/新增/查看界面
	 * @param  linkerId
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-05
	 */
	@OperateLog(remark="查询联系人信息信息页面",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/linkerManageLook",method=RequestMethod.GET)
	public String linkerManageLook(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="linkerId",required=false) String linkerId,
			@RequestParam(value="customId",required=false) String customId,
			@RequestParam(value="customerId",required=false) String customerId,
			@RequestParam(value = "operate", required = false) String operate){		   
			//根据ID查询数据		     
			LinkerVo vo=this.linkerManageService.queryLinkerInfoById(linkerId);
			//新增联系人，获取客户ID
			if(StringUtils.isBlank(linkerId)){
			  vo.setCustomerId(customId); 	
			 }
			if(!StringUtils.isBlank(customerId)){
				request.setAttribute("linkerId", customerId);
				request.setAttribute("customerId", customerId);
				vo.setCustomerId(customerId); 
			}
			request.setAttribute("vo", vo);
			request.setAttribute("operate",operate);
			return LINKER_PAGE_LOOK;
	}
	
	/**
	 * @Description: 保存联系人信息
	 * @author:      raomingyi
	 * @param:       LinkerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-05
	 */
	@SecurityValid(resourceCode="R002_01_OPERATION_EDITP")
	@OperateLog(remark="保存客户联系人信息",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveLinker",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveLinker(HttpServletRequest request,
			HttpServletResponse response,LinkerVo vo){
			this.linkerManageService.saveLinker(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 电话号码唯一性验证
	 * @author:      张明
	 * @param:       UserVo 用户信息
	 * @return:      返回MAP格式验证参数
	 * @date:        2018年7月24日
	 */	
	@RequestMapping(value="/queryPhoneByChecking",method=RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> queryPhoneByChecking(HttpServletRequest request,
			HttpServletResponse response,LinkerVo vo){
		return this.linkerManageService.queryPhoneByChecking(vo);
	}
	
	
	/**
	 * @Description: 删除联系人
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-05
	 */
	@SecurityValid(resourceCode="R002_01_OPERATION_DELP")
	@OperateLog(remark="删除客户联系人信息",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteLinker",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteLinker(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=true) String linkerId){
			this.linkerManageService.deleteLinkerById(linkerId);
			return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 初始化客户联系人信息
	 * @author:      raomingyi
	 * @param:       customId
	 * @return:      List<LinkerVo>返回信息
	 * @date:        2018-03-05
	 */
	@RequestMapping(value="/initCusLinker",method=RequestMethod.POST)
	@ResponseBody
	public List<LinkerVo> initCusLinker(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="customId",required=false) String customId){
		List<LinkerVo> linkerList=this.linkerManageService.getCustomLinker(customId);
		return linkerList;
	}
}