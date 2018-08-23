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
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.projectmanage.ProjectVo;
import com.ps.service.projectmanage.IProjectCheckService;


/** 
 *@Description: 项目审批Controller
 * @author：		raomingyi
 * @date：		2018-03-26
 */
@Controller
@RequestMapping(value="/projectManager")
public class ProjectCheckController extends BaseController {
	
	@Autowired
	private IProjectCheckService projectCheckService;

	//返回页面路径 
	private static final String PROJECCT_CHECK_MAIN = "projectManage/projectcheck/projectCheckMain";//项目立项主页面
	private static final String PROJECCT_CHECK_DETAIL = "projectManage/projectcheck/projectCheckDetail";//项目立项编辑页
	
	
	/**
	 * @Description: 进入项目审核主页
	 * @author:      raomingyi
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-26
	 */
	@OperateLog(remark="进入项目审核主页",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectCheckMain",method=RequestMethod.GET)
	public String ProjectCheckMain(HttpServletRequest request,HttpServletResponse response){
		return PROJECCT_CHECK_MAIN;
	}
	
	/**
	 * @Description: 查询项目信息
	 * @author:      raomingyi
	 * @param:       ProjectVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-26
	 */
	@RequestMapping(value="/queryProjectCheckInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询项目信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryProjectCheckInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ProjectVo param){
		param.initDataTableParam(request);
		List<ProjectVo> dataList =this.projectCheckService.queryProjectCheckInfoByParam(param);
		PageInfo<ProjectVo> page = new PageInfo<ProjectVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入项目查看界面
	 * @param  
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-26
	 */
	@OperateLog(remark="进入项目查看界面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectCheckDetail",method=RequestMethod.GET)
	public String projectCheckDetail(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		ProjectVo projectVo=this.projectCheckService.queryProjectCheckInfoById(id);
		request.setAttribute("projectVo", projectVo);
		request.setAttribute("operate", operate);
		return PROJECCT_CHECK_DETAIL;
	}
	
	/**
	 * @Description: 项目立项审批
	 * @author:      raomingyi
	 * @param:       ProjectVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="项目立项审批",cateGory="立项审批",cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateProjectStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateProjectStatus(HttpServletRequest request,
		HttpServletResponse response,ProjectVo vo,
		@RequestParam(value="operate",required=true)String operate){
		if (operate.equals("pass")) {
			vo.setProjectStatus("2");
		}if (operate.equals("back")) {
			vo.setProjectStatus("0");
		}
		this.projectCheckService.updateProjectStatus(vo);
		return this.returnOperateData(null, null);
	}
}