package com.ps.controller.systemmanage;

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
import com.ps.controller.common.BaseController;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.systemmanage.DeptVo;
import com.ps.service.systemmanage.IDeptManagerService;


/** 
 * @Description:组织架构维护Controller
 * @author：		ZHOUMIN
 * @date：		2018-03-06
 */
@Controller
@RequestMapping(value="/systemManage")
public class DeptManagerController extends BaseController {
	
	@Autowired
	private IDeptManagerService deptManagerService;

	//返回页面路径 
	private static final String DEPT_MANAGER_MAIN = "systemManage/deptManager/deptManagerMain";//主页面
	private static final String DEPT_MANAGER_EDIT = "systemManage/deptManager/deptManagerEdit";//编辑页
	
	
	/**
	 * @Description: 进入组织架构维护主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-06
	 */
	@SecurityValid(resourceCode="R014_04")
	@OperateLog(remark="进入组织架构维护主页",cateGory=GlobalConstants.CATEGORY_R01405,cateGoryType=GlobalConstants.CATEGORYTYPE_R01405,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deptManagerMain",method=RequestMethod.GET)
	public String DeptManagerMain(HttpServletRequest request,HttpServletResponse response){
		return DEPT_MANAGER_MAIN;
	}
	
	
	/**
	 * @Description: 加载组织架构资源树
	 * @param  request
	 * @return List<ResourceVo>
	 * @author HuangPeng
	 * @date:  2016年11月1日
	 */
	@OperateLog(remark="加载组织架构资源树",cateGory=GlobalConstants.CATEGORY_R01405,cateGoryType=GlobalConstants.CATEGORYTYPE_R01405,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/loadDeptResourceTree", method = RequestMethod.POST)
	@ResponseBody
	public List<DeptVo> loadDeptResourceTree(HttpServletRequest request, HttpServletResponse response,DeptVo vo) {
		List<DeptVo> orgData = this.deptManagerService.loadDeptResourceTree(vo);
		return orgData;
	}
	
	/**
	 * @Description: 进入组织架构编辑/新增界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-06
	 */
	@SecurityValid(resourceCode="R014_05_OPERATION_EDIT")
	@OperateLog(remark="进入组织架构编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R01405,cateGoryType=GlobalConstants.CATEGORYTYPE_R01405,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deptEdit",method=RequestMethod.POST)
	public String deptEdit(HttpServletRequest request,HttpServletResponse response,DeptVo vo,
			@RequestParam(value = "operate", required = false) String operate){
		request.setAttribute("deptVo", vo);
		request.setAttribute("operate", operate);
		return DEPT_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存组织架构信息
	 * @author:      ZHOUMIN
	 * @param:       DeptVo 组织架构信息
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-06
	 */
	@OperateLog(remark="保存组织架构信息",cateGory=GlobalConstants.CATEGORY_R01405,cateGoryType=GlobalConstants.CATEGORYTYPE_R01405,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveDept",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveDept(HttpServletRequest request,
			HttpServletResponse response,DeptVo vo){
			this.deptManagerService.saveDept(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 更改组织架构状态
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-06
	 */
	@SecurityValid(resourceCode="R014_05_OPERATION_EDIT")
	@OperateLog(remark="更改组织架构状态",cateGory=GlobalConstants.CATEGORY_R01405,cateGoryType=GlobalConstants.CATEGORYTYPE_R01405,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateDeptFlagById",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateDeptFlagById(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
			this.deptManagerService.updateDeptFlagById(id);
			return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 初始化部门数据
	 * @param  request
	 * @return List<ResourceVo>
	 * @author ZHOUMIN
	 * @date:  2018-03-06
	 */
	@OperateLog(remark="初始化部门数据",cateGory=GlobalConstants.CATEGORY_R01405,cateGoryType=GlobalConstants.CATEGORYTYPE_R01405,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/initDeptData", method = RequestMethod.POST)
	@ResponseBody
	public List<DeptVo> initDeptData(HttpServletRequest request,HttpServletResponse response){
		List<DeptVo> deptList=this.deptManagerService.initDeptData();
		return deptList;
	}
}