package com.ps.controller.projectmanage;

import java.io.IOException;
import java.util.Collection;
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

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.aop.security.SecurityValid;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.service.projectmanage.IProjectBaseInfoService;
import com.util.file.ImportUtil;

/** 
 *@Description: 项目基本信息管理Controller
 * @author：		ZHOUMIN
 * @date：		2018-03-19
 */
@Controller
@RequestMapping(value="/projectManage")
public class ProjectBaseinfoController extends BaseController  {
	
	@Autowired
	private IProjectBaseInfoService projectBaseInfoService; //项目维护业务处理
	
	private static final String PROJECCT_BASEINFO_MAIN = "/projectManage/projectBaseinfoManager/projectBaseinfoMain";//项目维护主页面
	
	private static final String PROJECT_BASEINFO_EDIT = "/projectManage/projectBaseinfoManager/projectBaseinfoEdit";//项目维护编辑界面
	
	private static final String IMPORT_EXCEL="/projectManage/projectBaseinfoManager/importExcel";
	
	/**
	 * @Description: 进入项目基本信息主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-02
	 */
	@OperateLog(remark="进入项目基本信息主页",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectBaseInfoMain",method=RequestMethod.GET)
	public String ProjectManagerMain(HttpServletRequest request,HttpServletResponse response){
		return PROJECCT_BASEINFO_MAIN;
	}
	
	/**
	 * @Description: 进入项目基本信息编辑/新增/查看界面
	 * @return URL
	 * @author zhoumin
	 * @date:  2018-03-19
	 */
	@SecurityValid(resourceCode="R004_07_OPERATION_EDIT")
	@OperateLog(remark="进入项目基本信息编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectBaseInfoEdit",method=RequestMethod.GET)
	public String otherCostManagerEdit(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = true) String operate){
		ProjectBaseInfoVo vo=this.projectBaseInfoService.queryProjectBaseInfoInfoById(id);
		request.setAttribute("operate",operate);
		request.setAttribute("vo",vo);
		return PROJECT_BASEINFO_EDIT;
	}
	
	/**
	 * @Description: 查询项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/queryProjectBaseInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询项目维护信息",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryProjectInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ProjectBaseInfoVo param){
		//数据权限
		param.initDataAuthByCode(request, "DATA0407");
		param.initDataTableParam(request);
		List<ProjectBaseInfoVo> dataList =this.projectBaseInfoService.queryProjectBaseInfoInfoByParam(param);
		PageInfo<ProjectBaseInfoVo> page = new PageInfo<ProjectBaseInfoVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 保存项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="保存项目维护信息",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveProjectBaseInfo",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveProjectBaseInfo(HttpServletRequest request,
			HttpServletResponse response,ProjectBaseInfoVo vo){
		this.projectBaseInfoService.saveProjectBaseInfo(vo);
		return this.returnOperateData(null,null);
	}
	
	/**
	 * @Description: 删除项目维护信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="删除项目维护信息",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteProjectBaseInfo",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteProjectBaseInfo(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.projectBaseInfoService.deleteProjectBaseInfoById(id);
		return this.returnOperateData(null, null);
	}
	
	
	/**
	 * @Description: 项目维护信息导入
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年5月19日
	 */
	@OperateLog(remark="项目维护信息导入",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/importExcel")
	public String importExcel(HttpServletRequest request, HttpServletResponse response) {
		return IMPORT_EXCEL;
	}
	
	/**
	 *  项目维护信息导入模板下载
	 * @author: PXG
	 * @date: 2017年5月28日
	 * @param request
	 * @param response
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/downloadProjectTemplate")
	public void downloadProjectTemplate(HttpServletRequest request, HttpServletResponse response) throws IOException{		
		ImportUtil.downloadForFile(response, "file.import.excel.file.name", "label.excel.model");//下载模板
	}
	
	/**
	 * @Description: 导入项目维护信息
	 * @author:      PanXG
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年5月18日
	 */
	@RequestMapping(value="/importProjectFile",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo importProjectFile(HttpServletRequest request,HttpServletResponse response){
		List<Map<Integer, Collection<?>>> dataList = ImportUtil.excel2007ImportXlsx(request,"myfiles",1);
		List<String> list =this.projectBaseInfoService.importTitleFile(dataList);
	    return this.returnOperateData(null, list);
	}
	 
	/**
	 * @Description: 获取全部已维护的项目信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-06
	 */
	@OperateLog(remark="获取全部项目信息",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/getAllRecordProjectInfo",method=RequestMethod.POST)
	@ResponseBody
	public List<ProjectBaseInfoVo> getAllRecordProjectInfo(HttpServletRequest request,HttpServletResponse response){
		List<ProjectBaseInfoVo> proList= this.projectBaseInfoService.getAllRecordProjectInfo();
		return proList;
	}
	
	/**
	 * @Description: 审批项目信息
	 * @author:      ZHOUMIN
	 * @param:       ContractApprovalVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-02
	 */
	@OperateLog(remark="审批项目信息",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateProjectBaseInfoStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateProjectBaseInfoStatus(HttpServletRequest request,
			HttpServletResponse response,ProjectBaseInfoVo vo){
		this.projectBaseInfoService.updateProjectBaseInfoStatus(vo);
		return this.returnOperateData(null, null);
	}
	
}
