package com.ps.controller.systemmanage;

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

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.aop.security.SecurityValid;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.systemmanage.UserRoleVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.systemmanage.IUserManagerService;

/**
 * @Description:    用户管理controller
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
@Controller
@RequestMapping("/systemManage")
public class UserManagerController extends BaseController {

	@Autowired
	private IUserManagerService userManagerService;
	
	private static final String USER_MANAGE_MAIN = "systemManage/userManager/userManagerMain";//用户管理主页面
	private static final String USER_MANAGE_EDIT="systemManage/userManager/userManagerEdit";//用户管理编辑界面
	private static final String ASSIGN_ROLE="systemManage/userManager/assignRole";//角色列表界面
	
	/**
	 * @Description: 进入用户管理主页面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年4月15日
	 */
	@SecurityValid(resourceCode="R014_01")
	@OperateLog(remark="进入用户管理主页面",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/userManagerMain",method=RequestMethod.GET)
	public String userManagementMain(HttpServletRequest request,HttpServletResponse response){
		return USER_MANAGE_MAIN;
	}
	
	
	/**
	 * @Description: 根据查询条件获取用户信息
	 * @author:      HuangPeng
	 * @param:       UserVo 用户表
	 * @return:      ListRange数据实体类
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value="/queryUserInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="获取用户信息",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
			operateType=GlobalConstants.OPERATETYPE_FOUR,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryUserInfoByParam(HttpServletRequest request,HttpServletResponse response,UserVo vo){
		//数据权限
		vo.initDataAuthByCode(request, "R014_01_DATA");
		//参数设置
		vo.initDataTableParam(request);
		vo.setUserType(GlobalConstants.ZERO);//查询用户类型的用户信息
		List<UserVo> userList = this.userManagerService.queryUserInfoByParam(vo);
		PageInfo<UserVo> page = new PageInfo<UserVo>(userList);
		ListRange lr = new ListRange(vo,page);
		return lr;
	}
	
	/**
	 * @Description: 新增/编辑用户窗口
	 * @author:      HuangPeng
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年4月15日
	 */
	@SecurityValid(resourceCode="R014_01_OPERATION_EDIT")
	@OperateLog(remark="进入新增/编辑用户窗口",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/userManagerEdit",method=RequestMethod.GET)
	public String userManagerNavtabEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "userId", required = false) String userId,
			@RequestParam(value = "operate", required = false) String operate){
		UserVo vo = this.userManagerService.queryUserInfoById(userId);
		request.setAttribute("vo", vo);
		request.setAttribute("operate", operate);
		return USER_MANAGE_EDIT;
	}
	
	/**
	 * @Description: 保存用户信息
	 * @author:      ZHOUMIN
	 * @param:       UserVo 用户表
	 * @return:      返回消息
	 * @date:        2018年3月15日
	 */
	@OperateLog(remark="保存用户数据",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
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
		this.userManagerService.saveUser(files,vo);
		return returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 禁用用户/启用用户
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      返回消息
	 * @date:        2017年4月15日
	 */
	@SecurityValid(resourceCode="R014_01_OPERATION_DISABLED")
	@OperateLog(remark="禁用用户/启用用户",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/userDisable",method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo userDisable(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("userId") String userId,
			@RequestParam("userFlag") String userFlag) {
		this.userManagerService.updateUserStatus(userId,userFlag);
		return returnOperateData(null, null);
	}
	
	/**
	 * @Description:	用户加载分配角色页面
	 * @author:      	ZHOUMIN
	 * @param: 			request
	 * @param: 			response
	 * @return: 		返回消息
	 * @date:        	2018年3月15日
	 */
	@RequestMapping(value="/assignRole")
	public String assignRole(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "userId", required = false) String userId){
		request.setAttribute("userId", userId);
		return ASSIGN_ROLE;
	}
	
	/**
	 * @Description:	分配角色
	 * @author:      	ZHOUMIN
	 * @param:  		request
	 * @param:  		response
	 * @return: 		 返回消息
	 * @date:        	2017年4月15日
	 */
	@SecurityValid(resourceCode="R014_02_OPERATION_ALLOT")
	@OperateLog(remark="分配角色",cateGory=GlobalConstants.CATEGORY_R00101,
			cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/addUserRolePage",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo addUserRolePage(HttpServletRequest request,HttpServletResponse response,UserRoleVo vo){
		this.userManagerService.saveUserRole(vo);
		return returnOperateData(null, null);
	}
	
	/**
	 * @Description:	重置密码
	 * @author:      	ZHOUMIN
	 * @param: 			request
	 * @param: 			response
	 * @return:		 	返回消息
	 * @date:        	2017年4月15日
	 */
	@SecurityValid(resourceCode="R014_01_OPERATION_RESET")
	@OperateLog(remark="重置密码",cateGory=GlobalConstants.CATEGORY_R00101,
			cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,operateType=GlobalConstants.THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updatePasswordPage",method=RequestMethod.POST)
	@ResponseBody
	public String updatePasswordPage(HttpServletRequest request,HttpServletResponse response){
		String userId = request.getParameter("userId");
		return this.userManagerService.resetPassword(userId);
	}
	
	/**
	 * @Description: 登录名唯一性验证
	 * @author:      HuangPeng
	 * @param:       UserVo 用户信息
	 * @return:      返回MAP格式验证参数
	 * @date:        2017年4月15日
	 */	
	@RequestMapping(value="/queryUserInfoByChecking",method=RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> queryUserInfoByAccount(HttpServletRequest request,
			HttpServletResponse response,UserVo vo){
		return this.userManagerService.queryUserInfoByChecking(vo);
	}
	
	/**
	 * 身份证号码唯一标识验证
	 * @param request
	 * @param response
	 * @return 返回消息
	 */
	@ResponseBody
	@RequestMapping(value = "/verificationIdentityCard")
	public Map<String, Object> verificationIdentityCard(HttpServletRequest request, HttpServletResponse response,UserVo vo){
		Map<String, Object> map = userManagerService.verificationIdentityCard(vo);
		return map;
	}
	
	/**
	 * @Description: 初始化用户数据
	 * @param  request
	 * @return List<ResourceVo>
	 * @author ZHOUMIN
	 * @date:  2018-03-06
	 */
	@OperateLog(remark="初始化用户数据",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/initUserInfo", method = RequestMethod.POST)
	@ResponseBody
	public List<UserVo> initUserInfo(HttpServletRequest request,HttpServletResponse response){
		List<UserVo> deptList=this.userManagerService.queryUserInfoByParam(null);
		return deptList;
	}
	
	/**
	 * @Description: 初始化销售用户数据
	 * @param  request
	 * @return List<ResourceVo>
	 * @author zhangm
	 * @date:  2018-08-09
	 */
	@OperateLog(remark="初始化销售用户数据",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/initUserInfoSale", method = RequestMethod.POST)
	@ResponseBody
	public List<UserVo> initUserInfoSale(HttpServletRequest request,HttpServletResponse response,UserVo vo){
		List<UserVo> deptList=this.userManagerService.queryUserInfoByParamSale(vo);
		return deptList;
	}
	
	/**
	 * @Description:初始化销售负责人数据
	 * @param  request
	 * @return List<ResourceVo>
	 * @author zhangm
	 * @date:  2018-08-09
	 */
	@OperateLog(remark="初始化销售负责人数据",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/businessPeople", method = RequestMethod.POST)
	@ResponseBody
	public List<UserVo> businessPeople(HttpServletRequest request,HttpServletResponse response,UserVo vo){
		List<UserVo> deptList=this.userManagerService.businessPeople(vo);
		return deptList;
	}
	
	/**
	 * @Description:初始化项目负责人数据
	 * @param  request
	 * @return List<ResourceVo>
	 * @author zhangm
	 * @date:  2018-08-09
	 */
	@OperateLog(remark="初始化项目负责人数据",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/projectPeople", method = RequestMethod.POST)
	@ResponseBody
	public List<UserVo> projectPeople(HttpServletRequest request,HttpServletResponse response,UserVo vo){
	List<UserVo> deptList=this.userManagerService.projectPeople(vo);
	return deptList;
	}
	
	/**
	 * @Description:初始化产品经理
	 * @param  request
	 * @return List<ResourceVo>
	 * @author zhangm
	 * @date:  2018-08-09
	 */
	@OperateLog(remark="初始化产品经理",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/productManager", method = RequestMethod.POST)
	@ResponseBody
	public List<UserVo> productManager(HttpServletRequest request,HttpServletResponse response,UserVo vo){
	List<UserVo> deptList=this.userManagerService.productManager(vo);
	return deptList;
	}
	
	@OperateLog(remark="初始化次要负责人数据",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/responsibleSecondary", method = RequestMethod.POST)
	@ResponseBody
	public List<UserVo> responsibleSecondary(HttpServletRequest request,HttpServletResponse response){
	List<UserVo> deptList=this.userManagerService.responsibleSecondary(null);
	return deptList;
	}
	
	
	/**
	 * @Description: 根据查询条件获取用户信息
	 * @author:      HuangPeng
	 * @param:       UserVo 用户表
	 * @return:      ListRange数据实体类
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value="/queryUserSelectByParam",method=RequestMethod.POST)
	@OperateLog(remark="获取用户信息",cateGory=GlobalConstants.CATEGORY_R00101,cateGoryType=GlobalConstants.CATEGORYTYPE_R00101,
			operateType=GlobalConstants.OPERATETYPE_FOUR,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryUserSelectByParam(HttpServletRequest request,HttpServletResponse response,UserVo vo){
		//数据权限
		vo.initDataAuthByCode(request, "R014_01_DATA");
		//分页参数设置
		vo.initDataTableParam(request);
		List<UserVo> userList = this.userManagerService.queryUserSelectByParam(vo);
		PageInfo<UserVo> page = new PageInfo<UserVo>(userList);
		ListRange lr = new ListRange(vo,page);
		return lr;
	}
	
	/**
	 * @Description: 根据组织架构获取用户信息
	 * @author:      HuangPeng
	 * @param:       UserVo 用户表
	 * @return:      ListRange数据实体类
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value="/queryUserByDept",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo queryUserByDept(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("deptId") String deptId){
		Map<String,String> map=this.userManagerService.queryUserByDept(deptId);
		return returnOperateData(null, map);
	}
}
