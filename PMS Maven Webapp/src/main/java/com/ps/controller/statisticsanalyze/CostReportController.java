package com.ps.controller.statisticsanalyze;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.projectmanage.CostReportVo;
import com.ps.result.taskmanage.WorkhoursRecordVo;
import com.ps.service.projectmanage.IProjectBaseInfoService;

@Controller
@RequestMapping(value="/statisticsAnalyze")
public class CostReportController extends BaseController {

	@Autowired
	private IProjectBaseInfoService projectBaseInfoService; //项目维护业务处理
	
	private static final String	COST_REPORT_MAIN="/operationAnalysis/costReport/costReportMain";//成本报表主页
	
	private static final String COST_DETAIL_MAIN="/operationAnalysis/costReport/costDetailMain";//成本明细界面
	
	
	/**
	 * @Description: 进入成本报表主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-02
	 */
	@OperateLog(remark="进入成本报表主页",cateGory=GlobalConstants.CATEGORY_R00703,cateGoryType=GlobalConstants.CATEGORYTYPE_R00703,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/costReportMain",method=RequestMethod.GET)
	public String costReportMain(HttpServletRequest request,HttpServletResponse response){
		return COST_REPORT_MAIN;
	}
	
	/**
	 * @Description: 查询成本报表信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/queryCostReprotByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询成本报表信息",cateGory=GlobalConstants.CATEGORY_R00703,cateGoryType=GlobalConstants.CATEGORYTYPE_R00703,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryCostReprotByParam(HttpServletRequest request,
					HttpServletResponse response,CostReportVo param){
		param.initDataTableParam(request);
		List<CostReportVo> dataList =this.projectBaseInfoService.queryCostReprotByParam(param);
		PageInfo<CostReportVo> page = new PageInfo<CostReportVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入成本明细界面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-07-02
	 */
	@OperateLog(remark="进入成本明细界面",cateGory=GlobalConstants.CATEGORY_R00703,cateGoryType=GlobalConstants.CATEGORYTYPE_R00703,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/viewCostDetail",method=RequestMethod.GET)
	public String viewCostDetail(HttpServletRequest request,HttpServletResponse response,WorkhoursRecordVo param){
		request.setAttribute("vo",param);
		return COST_DETAIL_MAIN;
	}
	
	/**
	 * @Description: 查询成本明细信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/queryCostDetailByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询项目维护信息",cateGory=GlobalConstants.CATEGORY_R00703,cateGoryType=GlobalConstants.CATEGORYTYPE_R00703,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryCostDetailByParam(HttpServletRequest request,
					HttpServletResponse response,WorkhoursRecordVo param){
		param.initDataTableParam(request);
		List<WorkhoursRecordVo> dataList =this.projectBaseInfoService.queryCostDetailByParam(param);
		PageInfo<WorkhoursRecordVo> page = new PageInfo<WorkhoursRecordVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
}
