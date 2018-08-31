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
import com.ps.result.projectmanage.DeliveriesVo;
import com.ps.result.projectmanage.MilepostVo;
import com.ps.result.projectmanage.ProjectVo;
import com.ps.service.projectmanage.IProjectManagerService;
import com.util.coder.EncryptPkUtil;


/** 
 *@Description: 项目管理Controller
 * @author：		ZHOUMIN
 * @date：		2018-03-19
 */
@Controller
@RequestMapping(value="/projectManager")
public class ProjectManagerController extends BaseController {
	
	@Autowired
	private IProjectManagerService projectManagerService;

	//返回页面路径 
	private static final String PROJECCT_MANAGER_MAIN = "projectManage/projectManager/projectManagerMain";//项目立项主页面
	private static final String PROJECCT_MANAGER_EDIT = "projectManage/projectManager/projectManagerEdit";//项目立项编辑页
	private static final String MILEPOST_MANAGER_EDIT = "projectManage/projectManager/milepostManagerEdit";//里程碑编辑页
	private static final String DELIVERIES_MANAGER_EDIT = "projectManage/projectManager/deliveriesManagerEdit";//交付物编辑页
	
	
	/**
	 * @Description: 进入项目管理主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="进入项目管理主页",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectManagerMain",method=RequestMethod.GET)
	public String ProjectManagerMain(HttpServletRequest request,HttpServletResponse response){
		return PROJECCT_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询项目立项信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/queryProjectInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询项目立项信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryProjectInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ProjectVo param){
		param.initDataTableParam(request);
		List<ProjectVo> dataList =this.projectManagerService.queryProjectInfoByParam(param);
		PageInfo<ProjectVo> page = new PageInfo<ProjectVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入项目立项编辑/新增界面
	 * @param  todo
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入项目立项编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectManagerEdit",method=RequestMethod.GET)
	public String projectManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		ProjectVo projectVo=this.projectManagerService.queryProjectInfoById(id);
		request.setAttribute("projectVo", projectVo);
		request.setAttribute("operate", operate);
		return PROJECCT_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存项目立项信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="保存项目立项信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveProject",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveProject(HttpServletRequest request,
			HttpServletResponse response,ProjectVo vo){
		ProjectVo projectVo= this.projectManagerService.saveProject(vo);
		return this.returnOperateData(null, EncryptPkUtil.encodeId(projectVo.getId()));
	}
	
	/**
	 * @Description: 删除项目立项信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="删除项目立项信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteProject",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteProject(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.projectManagerService.deleteProjectById(id);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 获取全部已审核项目信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="获取全部项目信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/getAllProjectInfo",method=RequestMethod.POST)
	@ResponseBody
	public List<ProjectVo> getAllProjectInfo(HttpServletRequest request,HttpServletResponse response){
		List<ProjectVo> proList= this.projectManagerService.getAllProjectInfo();
		return proList;
	}
	
	/**
	 * @Description: 提交项目立项
	 * @author:      raomingyi
	 * @param:       ProjectVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="提交项目立项",cateGory="提交项目立项",cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateProjectSendStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateProjectStatus(HttpServletRequest request,
			HttpServletResponse response,ProjectVo vo){			
		vo.setProjectStatus(GlobalConstants.ONE);
		this.projectManagerService.updateProjectSendStatus(vo);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 根据项目id查询交付物信息
	 * @author:      ZHOUMIN
	 * @param:       DeliveriesVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/queryDeliveriesInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="根据项目id查询交付物信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryDeliveriesInfoByParam(HttpServletRequest request,
			HttpServletResponse response,DeliveriesVo param){
		param.initDataTableParam(request);
		List<DeliveriesVo> dataList =this.projectManagerService.queryDeliveriesInfoByParam(param);
		PageInfo<DeliveriesVo> page = new PageInfo<DeliveriesVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 根据项目id查询里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       MilepostVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/queryMilepostInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="根据项目id查询里程碑信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryMilepostInfoByParam(HttpServletRequest request,
			HttpServletResponse response,MilepostVo param){
		param.initDataTableParam(request);
		List<MilepostVo> dataList =this.projectManagerService.queryMilepostInfoByParam(param);
		PageInfo<MilepostVo> page = new PageInfo<MilepostVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入里程碑编辑/新增界面
	 * @param  id 里程碑ID
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入里程碑编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/milepostManagerEdit",method=RequestMethod.GET)
	public String milepostManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate,
			@RequestParam(value = "projectId", required = false) String projectId){
		//根据ID查询数据
		MilepostVo milepostVo=this.projectManagerService.queryMilepostInfoById(id);		
		milepostVo.setProjectId(projectId);
		request.setAttribute("milepostVo", milepostVo);
		request.setAttribute("operate", operate);
		return MILEPOST_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 进入交付物编辑/新增界面
	 * @param  ID 交付物ID
	 * @return URL
	 * @author ZHOUMIN
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入交付物编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deliveriesManagerEdit",method=RequestMethod.GET)
	public String deliveriesManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate,
			@RequestParam(value = "projectId", required = false) String projectId){
		//根据ID查询数据
		DeliveriesVo deliveriesVo=this.projectManagerService.queryDeliveriesInfoById(id);
		deliveriesVo.setProjectId(projectId);
		request.setAttribute("deliveriesVo", deliveriesVo);
		request.setAttribute("operate", operate);
		return DELIVERIES_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 保存里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="保存里程碑信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveMilepost",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveMilepost(HttpServletRequest request,
			HttpServletResponse response,MilepostVo milepostVo){
		this.projectManagerService.saveMilepost(milepostVo);
		return this.returnOperateData(null, milepostVo);
	}
	
	/**
	 * @Description: 删除里程碑信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="删除里程碑信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteMilepost",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteMilepost(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.projectManagerService.deleteMilepost(id);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 保存交付物信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="保存交付物信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveDeliveries",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveDeliveries(HttpServletRequest request,
			HttpServletResponse response,DeliveriesVo deliveriesVo){
		this.projectManagerService.saveDeliveries(deliveriesVo);
		return this.returnOperateData(null, deliveriesVo);
	}
	
	/**
	 * @Description: 删除交付物信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="删除交付物信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteDeliveries",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteDeliveries(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.projectManagerService.deleteDeliveries(id);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 提交项目信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="提交项目信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/submitProject",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo submitProject(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.projectManagerService.submitProject(id);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 校验里程碑是否重复
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      counts返回信息
	 * @date:        2018-04-8
	 */
	@OperateLog(remark=" 校验里程碑是否重复",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/getMilepostProjectStadgeCounts",method=RequestMethod.POST)
	@ResponseBody
	public int getMilepostProjectStadgeCounts(HttpServletRequest request,HttpServletResponse response,
		@RequestParam("projectId") String projectId,
		@RequestParam("projectStadge") String projectStadge){
		int mileCounts=this.projectManagerService.getMilepostProjectStadgeCounts(projectId, projectStadge);
		return mileCounts;
	}
	
	
}