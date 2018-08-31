package com.ps.controller.presalemanage;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.aop.security.SecurityValid;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.presalemanage.CustomerVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.presalemanage.ICustomManageService;


/** 
 * @Description: 客户管理
 * @author：		raomingyi
 * @date：		2018-03-02
 */
@Controller
@RequestMapping(value="/preSalesManage")
public class CustomManageController extends BaseController {
	
	@Autowired
	private ICustomManageService customManageService;

	//返回页面路径 
	private static final String CUSTOM_PAGE_MAIN = "preSalesManage/custommanage/clientManageMain";//客户管理主页面
	private static final String CUSTOM_PAGE_EDIT = "preSalesManage/custommanage/customManageEdit";//客户管理编辑页
	private static final String CUSTOM_PAGE_LOOK = "preSalesManage/custommanage/customManageLook";//客户管理编辑页
	
	
	/**
	 * @Description: 进入客户管理主页
	 * @author:      raomingyi
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-02
	 */
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R00201)
	@OperateLog(remark="进入客户管理主页",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/clientManageMain",method=RequestMethod.GET)
	public String clientManageMain(HttpServletRequest request,HttpServletResponse response){
		return CUSTOM_PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询客户管理信息
	 * @author:      raomingyi
	 * @param:       CustomerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/CustomInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询客户管理信息",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange CustomInfoByParam(HttpServletRequest request,
					HttpServletResponse response,CustomerVo param){
		param.initDataTableParam(request);
		List<CustomerVo> dataList =this.customManageService.queryCustomInfoByParam(param);
		PageInfo<CustomerVo> page = new PageInfo<CustomerVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入客户管理/新增/编辑/界面
	 * @param  
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-02
	 */
	@SecurityValid(resourceCode="R002_01_OPERATION_EDIT")
	@OperateLog(remark="进入客户管理编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/customManageEdit",method=RequestMethod.GET)
	public String customManageEdit(HttpServletRequest request,HttpServletResponse response,
	@RequestParam(value = "id", required = false) String id,
	@RequestParam(value = "operate", required = false) String operate){		
		//根据ID查询数据
		CustomerVo vo=this.customManageService.queryCustomInfoById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("operate",operate);
		return CUSTOM_PAGE_EDIT;
	}
	
	/**
	 * @Description: 进入客户管理/新增/编辑/界面
	 * @param  
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-02
	 */
	@OperateLog(remark="查看信息页面",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/customManageLook",method=RequestMethod.GET)
	public String customManageLook(HttpServletRequest request,HttpServletResponse response,
	@RequestParam(value = "id", required = false) String id,
	@RequestParam(value = "operate", required = false) String operate){		
		//根据ID查询数据
		CustomerVo vo=this.customManageService.queryCustomInfoById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("operate",operate);
		return CUSTOM_PAGE_LOOK;
	}
	
	/**
	 * @Description: 保存客户管理信息
	 * @author:      raomingyi
	 * @param:       CustomerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-02
	 */
	/*@SecurityValid(resourceCode="R002_01_OPERATION_EDIT")
	@OperateLog(remark="保存客户管理信息",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)*/
	@RequestMapping(value="/saveCustom",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveCustom(HttpServletRequest request,
			HttpServletResponse response,CustomerVo vo){
		
			/*MultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
			MultipartHttpServletRequest multipartRequest = resolver.resolveMultipart(request);
		*/
			List<MultipartFile> files = new ArrayList<MultipartFile>();
			MultipartHttpServletRequest  multipartRequest = (MultipartHttpServletRequest)request;
			Map<String, List<MultipartFile>> map = multipartRequest.getMultiFileMap();
			for(Object key : map.keySet()){
				files = map.get(key.toString());
			}
			this.customManageService.saveCustom(files,vo);
			return this.returnOperateData(null, vo);
	}
	
	@OperateLog(remark="保存用户数据",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveUserData",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveUserData(HttpServletRequest request,HttpServletResponse response,UserVo vo){
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		MultipartHttpServletRequest  multipartRequest = (MultipartHttpServletRequest)request;
		Map<String, List<MultipartFile>> map = multipartRequest.getMultiFileMap();
		for(Object key : map.keySet()){
			files = map.get(key.toString());
		}
		//this.userManagerService.saveUser(files,vo);
		return returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 二字码码唯一性验证
	 * @author:      张明
	 * @param:       UserVo 用户信息
	 * @return:      返回MAP格式验证参数
	 * @date:        2018年7月25日
	 */	
	@RequestMapping(value="/querySecondByChecking",method=RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> querySecondByChecking(HttpServletRequest request,
			HttpServletResponse response,CustomerVo vo){
		return this.customManageService.querySecondByChecking(vo);
	}
	
	/**
	 * @Description: 删除客户信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-02
	 */
	@SecurityValid(resourceCode="R002_01_OPERATION_DELC")
	@OperateLog(remark="删除客户信息",cateGory=GlobalConstants.CATEGORY_R00201,cateGoryType=GlobalConstants.CATEGORYTYPE_R00201,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteCustom",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteCustom(HttpServletRequest request,
			HttpServletResponse response,@RequestParam(value = "id", required = false) String id){
			this.customManageService.deleteCustomById(id);
			return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 初始化客户信息
	 * @author:      ZHOUMIN
	 * @param:       
	 * @return:      List<CustomerVo>返回信息
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/initCustomerInfo",method=RequestMethod.POST)
	@ResponseBody
	public List<CustomerVo> initCustomerInfo(HttpServletRequest request,HttpServletResponse response){
		List<CustomerVo> customerList=this.customManageService.getAllCustomerInfo();
		return customerList;
	}
	
}