package com.ps.controller.performancemanage;

import java.util.Date;
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
import com.ps.result.performancemanage.PerformanceVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.performancemanage.IPerformanceManagerService;
import com.ps.service.systemmanage.IUserManagerService;
import com.util.tool.DateUtil;


/** 
 *@Description: 績效管理Controller
 * @author：		ZHOUMIN
 * @date：		2018-03-12
 */
@Controller
@RequestMapping(value="/performanceManage")
public class PerformanceManagerController extends BaseController {
	
	@Autowired
	private IPerformanceManagerService performanceManagerService;
	
	@Autowired
	private IUserManagerService userManagerService;

	//返回页面路径 
	private static final String PERFORMANCE_MANAGER_MAIN = "performanceManage/performanceNature/performanceManagerMain";//績效管理主页面
	private static final String PERFORMANCE_NATRUE_MAIN = "performanceManage/performanceNature/performanceNatrueMain";//绩效管理界面
	private static final String PERFORMANCE_MANAGER_EDIT = "performanceManage/performanceNature/performanceManagerEdit";//打績效页
	
	/**
	 * @Description: 进入績效管理主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-12
	 */

	@OperateLog(remark="进入績效管理主页",cateGory=GlobalConstants.CATEGORY_R00601,cateGoryType=GlobalConstants.CATEGORYTYPE_R00601,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/superviseManageMain",method=RequestMethod.GET)
	public String performanceManagerMain(HttpServletRequest request,HttpServletResponse response){
		return PERFORMANCE_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询所有绩效的用户信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-12
	 */
	@RequestMapping(value="/performanceUserByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询所有绩效的用户信息",cateGory=GlobalConstants.CATEGORY_R00601,cateGoryType=GlobalConstants.CATEGORYTYPE_R00601,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange performanceUserByParam(HttpServletRequest request,
			HttpServletResponse response,UserVo userVo){
		userVo.initDataTableParam(request);
		List<UserVo> dataList =this.performanceManagerService.queryPerformanceUserByParam(userVo);
		PageInfo<UserVo> page = new PageInfo<UserVo>(dataList);
		ListRange lr = new ListRange(userVo,page);
		return lr;
	}
	
	/**
	 * @Description: 查询績效管理信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-12
	 */
	@RequestMapping(value="/performanceInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询績效管理信息",cateGory=GlobalConstants.CATEGORY_R00601,cateGoryType=GlobalConstants.CATEGORYTYPE_R00601,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange performanceInfoByParam(HttpServletRequest request,
			HttpServletResponse response,PerformanceVo param){
		param.initDataTableParam(request);
		List<PerformanceVo> dataList =this.performanceManagerService.queryPerformanceInfoByParam(param);
		PageInfo<PerformanceVo> page = new PageInfo<PerformanceVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 生成当月績效信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-12
	 */
	@SecurityValid(resourceCode="R006_0101")
	@OperateLog(remark="生成当月績效信息",cateGory=GlobalConstants.CATEGORY_R00601,cateGoryType=GlobalConstants.CATEGORYTYPE_R00601,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/generateTheSameMonthPerformance",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo generateTheSameMonthPerformance(HttpServletRequest request,
		HttpServletResponse response,@RequestParam(value = "userIds", required = false) String userIds){
		this.performanceManagerService.generateTheSameMonthPerformance(userIds);
		return this.returnOperateData(null, userIds);
	}
	
	/**
	 * @Description: 根据用户ID进入績效档案界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-12
	 */
	@SecurityValid(resourceCode="R006_0102")
	@OperateLog(remark="根据用户ID进入績效档案界面",cateGory=GlobalConstants.CATEGORY_R00601,cateGoryType=GlobalConstants.CATEGORYTYPE_R00601,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/performanceNatrueMain",method=RequestMethod.GET)
	public String performanceNatrueMain(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "userId", required = false) String userId){
		UserVo userVo=this.userManagerService.queryUserInfoById(userId);
		request.setAttribute("yearMonth", DateUtil.format(new Date(), "YYYY-MM"));
		request.setAttribute("userVo", userVo);
		//根据ID查询数据
		return PERFORMANCE_NATRUE_MAIN;
	}
	
	/**
	 * @Description: 进入績效管理编辑/新增界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-12
	 */
	@SecurityValid(resourceCode="R006_0103")
	@OperateLog(remark="进入績效管理编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R00601,cateGoryType=GlobalConstants.CATEGORYTYPE_R00601,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/performanceManagerEdit",method=RequestMethod.GET)
	public String performanceManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		PerformanceVo performanceVo=this.performanceManagerService.queryPerformanceInfoById(id);
		UserVo userVo=this.userManagerService.queryUserInfoById(performanceVo.getUserId());
		request.setAttribute("performanceVo", performanceVo);
		request.setAttribute("userVo", userVo);
		request.setAttribute("operate", operate);
		return PERFORMANCE_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存績效管理信息
	 * @author:      ZHOUMIN
	 * @param:       PerformanceManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-12
	 */
	@OperateLog(remark="保存績效管理信息",cateGory=GlobalConstants.CATEGORY_R00601,cateGoryType=GlobalConstants.CATEGORYTYPE_R00601,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/savePerformance",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo savePerformance(HttpServletRequest request,
		HttpServletResponse response,PerformanceVo vo){
		this.performanceManagerService.savePerformance(vo);
		return this.returnOperateData(null, vo);
	}
}