package com.ps.controller.projectmanage;

import java.util.ArrayList;
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
import com.ps.result.presalemanage.SalesActivityVo;
import com.ps.result.projectmanage.DocumentManageVo;
import com.ps.result.projectmanage.ProjectMoniInfoVo;
import com.ps.service.projectmanage.IDocumentManageService;
import com.ps.service.projectmanage.IProjectMoniInfoService;


/** 
 *@Description: 安全监察报告
 * @author：		zhangm
 * @date：		2018-08-03
 */
@Controller
@RequestMapping(value="/projectMoniInfo")
public class ProjectMoniInfoController extends BaseController {
	
	@Autowired
	private IProjectMoniInfoService projectMoniInfoService;
	
	@Autowired
	private IDocumentManageService documentManageService;

	//返回页面路径 
	private static final String PAGE_MAIN = "projectManage/projectMoniInfoMain";//主页面
	private static final String PAGE_EDIT = "projectManage/projectApprovalMain/projectMoniEdit";//编辑页
	
	
	/**
	 * @Description: 进入安全监察报告主页
	 * @author:      zhangm
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-08-03
	 */
	@OperateLog(remark="进入安全监察报告主页",cateGory="安全监察报告",cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectMoniInfoMain",method=RequestMethod.GET)
	public String ProjectMoniInfoMain(HttpServletRequest request,HttpServletResponse response){
		return PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询安全监察报告信息
	 * @author:      zhangm
	 * @param:       ProjectMoniInfoVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-08-03
	 */
	@RequestMapping(value="/projectMoniInfoInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询安全监察报告信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange projectMoniInfoInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ProjectMoniInfoVo param){
		param.initDataTableParam(request);
		List<ProjectMoniInfoVo> dataList =this.projectMoniInfoService.queryProjectMoniInfoInfoByParam(param);
		PageInfo<ProjectMoniInfoVo> page = new PageInfo<ProjectMoniInfoVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入编辑/新增/查看界面
	 * @param  todo
	 * @return URL
	 * @author zhangm
	 * @date:  2018-08-03
	 */
	@OperateLog(remark="进入安全监察报告编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectMoniInfoEdit",method=RequestMethod.GET)
	public String projectMoniInfoEdit(HttpServletRequest request,HttpServletResponse response){
			String id = request.getParameter("id");
			//根据ID查询数据
			ProjectMoniInfoVo vo=this.projectMoniInfoService.queryProjectMoniInfoInfoById(id);
			request.setAttribute("vo", vo);
			return PAGE_EDIT;
	}
	
	/**
	 * @Description: 保存
	 * @author:      zhangm
	 * @param:       ProjectMoniInfoVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-08-03
	 */
	 @SecurityValid(resourceCode="R004_01_OPERATION_EDITJK")
	@OperateLog(remark="保存安全监察报告信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveProjectMoniInfo",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveProjectMoniInfo(HttpServletRequest request,
			HttpServletResponse response,ProjectMoniInfoVo vo){
			this.projectMoniInfoService.saveProjectMoniInfo(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除
	 * @author:      zhangm
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-08-03
	 */
	@OperateLog(remark="删除安全监察报告信息",cateGory="安全监察报告",cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteProjectMoniInfo",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteProjectMoniInfo(HttpServletRequest request,
			HttpServletResponse response){
			String id = request.getParameter("id");
			this.projectMoniInfoService.deleteProjectMoniInfoById(id);
			return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 进入项目监控编辑界面
	 * @param  linkerId
	 * @return URL
	 * @author zhangm
	 * @date:  2018-08-03
	 */
	@SecurityValid(resourceCode="R004_01_OPERATION_EDITJK")
	@OperateLog(remark="进入项目监控编辑界面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/linkerManageEdit",method=RequestMethod.GET)
	public String linkerManageEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="projectMoinId",required=false) String projectMoinId){		   
			//根据ID查询数据		     
			ProjectMoniInfoVo vo=this.projectMoniInfoService.queryProjectMoniInfoInfoById(projectMoinId);
			request.setAttribute("vo", vo);
			return PAGE_EDIT;
	}
	
	/**
	 * @Description: 销售活动查询
	 * @author:      zhangm
	 * @param:       SalesActivityVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/searchDoucmentList",method=RequestMethod.POST)
	@ResponseBody
	public List<DocumentManageVo> searchDoucmentList(HttpServletRequest request,
			HttpServletResponse response,DocumentManageVo vo){
		List<DocumentManageVo> list = new ArrayList<DocumentManageVo>();
		list = this.documentManageService.searchDoucmentList(vo);
		return list;
	}
}