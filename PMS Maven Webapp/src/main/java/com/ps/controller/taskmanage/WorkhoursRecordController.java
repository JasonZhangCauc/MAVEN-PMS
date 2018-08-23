package com.ps.controller.taskmanage;

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
import com.ps.result.taskmanage.WorkhoursRecordVo;
import com.ps.service.taskmanage.IWorkhoursRecordService;


/** 
 *@Description: 工时登记
 * @author：		RAOMINGYI
 * @date：		2018-07-02
 */
@Controller
@RequestMapping(value="/taskManage")
public class WorkhoursRecordController extends BaseController {
	
	@Autowired
	private IWorkhoursRecordService workhoursRecordService;

	//返回页面路径 
	private static final String WORKHOURS_PAGE_MAIN = "taskManage/workhoursRecord/workhoursRecordMain";//主页面
	private static final String WORKHOURS_PAGE_EDIT = "taskManage/workhoursRecord/workhoursRecordEdit";//编辑页
	
	
	/**
	 * @Description: 进入工时登记主页
	 * @author:      RAOMINGYI
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-02
	 */
	@OperateLog(remark="进入工时登记主页",cateGory="工时登记",cateGoryType=GlobalConstants.CATEGORYTYPE_R00503,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/workhoursRecordMain",method=RequestMethod.GET)
	public String WorkhoursRecordMain(HttpServletRequest request,HttpServletResponse response){
		return WORKHOURS_PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询工时登记信息
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-07-02
	 */
	@RequestMapping(value="/workhoursRecordInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询工时登记信息",cateGory="工时登记",cateGoryType=GlobalConstants.CATEGORYTYPE_R00503,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange workhoursRecordInfoByParam(HttpServletRequest request,
					HttpServletResponse response,WorkhoursRecordVo param){
		param.initDataAuthByCode(request, "R007_04_DATA");
		param.initDataTableParam(request);
		List<WorkhoursRecordVo> dataList =this.workhoursRecordService.queryWorkhoursRecordInfoByParam(param);
		PageInfo<WorkhoursRecordVo> page = new PageInfo<WorkhoursRecordVo>(dataList);
		ListRange lr = new ListRange(param,page);	
		return lr;
	}
	
	/**
	 * @Description: 进入编辑/新增/查看工时登记界面
	 * @param  ID
	 * @author RAOMINGYI
	 * @date:  2018-07-02
	 */
	@OperateLog(remark="进入工时登记编辑信息页面",cateGory="工时登记",cateGoryType=GlobalConstants.CATEGORYTYPE_R00503,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/workhoursRecordEdit",method=RequestMethod.GET)
	public String workhoursRecordEdit(HttpServletRequest request,HttpServletResponse response){
		String id = request.getParameter("id");
		//根据ID查询数据
		WorkhoursRecordVo vo=this.workhoursRecordService.queryWorkhoursRecordInfoById(id);
		request.setAttribute("vo", vo);
		return WORKHOURS_PAGE_EDIT;
	}
	
	/**
	 * @Description: 保存工时登记
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-02
	 */
	@OperateLog(remark="保存工时登记信息",cateGory="工时登记",cateGoryType=GlobalConstants.CATEGORYTYPE_R00503,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveWorkhoursRecord",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveWorkhoursRecord(HttpServletRequest request,
			HttpServletResponse response,WorkhoursRecordVo vo){
		this.workhoursRecordService.saveWorkhoursRecord(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除工时登记
	 * @author:      RAOMINGYI
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-02
	 */
	@OperateLog(remark="删除工时登记信息",cateGory="工时登记",cateGoryType=GlobalConstants.CATEGORYTYPE_R00503,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteWorkhoursRecord",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteWorkhoursRecord(HttpServletRequest request,
			HttpServletResponse response){
			String id = request.getParameter("id");
			this.workhoursRecordService.deleteWorkhoursRecordById(id);
			return this.returnOperateData(null, null);
	}
	/**
	 * @Description: 审批工时登记
	 * @author:      raomingyi
	 * @param:       ContractApprovalVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-07-02
	 */
	@OperateLog(remark="审批工时登记",cateGory="工时登记",cateGoryType=GlobalConstants.CATEGORYTYPE_R00503,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateRecordStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateContractStatus(HttpServletRequest request,
			HttpServletResponse response,WorkhoursRecordVo vo,
			@RequestParam(value="operate",required=true)String operate){
		if("send".equals(operate)){
			vo.setStatus(GlobalConstants.ONE);
		}
		else if ("pass".equals(operate)) {
			vo.setStatus(GlobalConstants.TWO);
		}else if (operate.equals("back")) {
			vo.setStatus(GlobalConstants.ZERO);
		}
		this.workhoursRecordService.updateRecordStatus(vo);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 查询总工时信息
	 * @author:      RAOMINGYI
	 * @param:       WorkhoursRecordVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-07-02
	 */
	@RequestMapping(value="/queryWorkhoursTotalByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询工时登记信息",cateGory="工时登记",cateGoryType=GlobalConstants.CATEGORYTYPE_R00503,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public String queryWorkhoursTotalByParam(HttpServletRequest request,
					HttpServletResponse response,WorkhoursRecordVo param){
		String workHoursTotal=this.workhoursRecordService.queryWorkhoursTotalByParam(param);
		return workHoursTotal;
	}
}