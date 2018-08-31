package com.ps.controller.performancemanage;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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
import com.ps.result.applymanage.TaxiBillVo;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.performancemanage.PerformanceContractVo;
import com.ps.result.performancemanage.PerformanceVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.performancemanage.IPerformanceManagerService;
import com.ps.service.performancemanage.PerformanceContractManagerService;
import com.ps.service.systemmanage.IUserManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;


/** 
 * @Description: 绩效合约Controller
 * @author：		zlshi
 * @date：		2018-03-12
 */
@Controller
@RequestMapping(value="/performanceManage")
public class PerformanceContractManagerController extends BaseController {
	
	@Autowired
	private PerformanceContractManagerService performanceContractManagerService;

	//返回页面路径 
	private static final String PERFORMANCE_MANAGER_MAIN = "performanceManage/performanceContractManager/performanceContractManagerMain";//績效合约主页面
	private static final String PERFORMANCE_MANAGER_EDIT = "performanceManage/performanceContractManager/performanceContractManagerEdit";//绩效合约编辑页
	private static final String PERFORMANCE_MANAGER_VIEW = "performanceManage/performanceContractManager/performanceContractManagerView";//绩效合约查看页
	private static final String PERFORMANCE_MANAGER_AUDIT = "performanceManage/performanceContractManager/performanceContractManagerAudit";//绩效合约审核页
	
	/**
	 * @Description: 进入绩效合约主页
	 * @author:      zlshi
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-08-09
	 */

	@OperateLog(remark="进入绩效合约主页",cateGory=GlobalConstants.CATEGORY_R00903,cateGoryType=GlobalConstants.CATEGORYTYPE_R00903,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/performanceContractMain",method=RequestMethod.GET)
	public String performanceContractMain(HttpServletRequest request,HttpServletResponse response){
		return PERFORMANCE_MANAGER_MAIN;
	}

	/**
	 * @Description: 进入绩效合约编辑/新增/查看界面
	 * @param  request
	 * @return URL
	 * @author zlshi
	 * @date:  2018-08-09
	 */
	@OperateLog(remark="进入绩效合约编辑/新增界面",cateGory=GlobalConstants.CATEGORY_R00903,cateGoryType=GlobalConstants.CATEGORYTYPE_R00903,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/performanceContractEdit",method=RequestMethod.GET)
	public String performanceManagerEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		PerformanceContractVo VO=this.performanceContractManagerService.getPerformanceContractById(id);
		request.setAttribute("vo", VO);
		request.setAttribute("operate", operate);
		return PERFORMANCE_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 进入績效合约查看界面
	 * @param  request
	 * @return URL
	 * @author zlshi
	 * @date:  2018-08-09
	 */
	@OperateLog(remark="进入绩效合约查看界面",cateGory=GlobalConstants.CATEGORY_R00903,cateGoryType=GlobalConstants.CATEGORYTYPE_R00903,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/performanceContractView",method=RequestMethod.GET)
	public String performanceContractView(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		PerformanceContractVo VO=this.performanceContractManagerService.getPerformanceContractById(id);
		request.setAttribute("vo", VO);
		request.setAttribute("operate", operate);
		return PERFORMANCE_MANAGER_VIEW;
	}
	
	/**
	 * @Description: 进入績效合约审核界面
	 * @param  request
	 * @return URL
	 * @author zlshi
	 * @date:  2018-08-09
	 */
	@OperateLog(remark="进入绩效合约审核界面",cateGory=GlobalConstants.CATEGORY_R00903,cateGoryType=GlobalConstants.CATEGORYTYPE_R00903,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/performanceContractAudit",method=RequestMethod.GET)
	public String performanceContractAudit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		PerformanceContractVo VO=this.performanceContractManagerService.getPerformanceContractById(id);
		request.setAttribute("vo", VO);
		request.setAttribute("operate", operate);
		return PERFORMANCE_MANAGER_AUDIT;
	}
	
	
	
	/**
	 * @Description:   按条件查询绩效合约信息
	 * @author:        zlshi
	 * @param:         request
	 * @return:        List<TaxiBillVO>
	 * @date:		   2018-8-2
	 */
	@RequestMapping(value ="/getAllPreformanceContract", method = RequestMethod.POST)
	@ResponseBody
	public ListRange getAllTaxiBill(HttpServletRequest request,
			HttpServletResponse response,PerformanceContractVo VO){
		//数据权限
		VO.initDataAuthByCode(request, "R009_03_DATA");
		VO.initDataTableParam(request);
		VO.setPcBy((EncryptPkUtil.decodeId(VO.getPcBy())));
		List<PerformanceContractVo> list = this.performanceContractManagerService.getAllPerformanceContract(VO);
		PageInfo<PerformanceContractVo> page = new PageInfo<PerformanceContractVo>(list);
		ListRange lr = new ListRange(VO,page);
		return lr;
	}
	
	/**
	 * @Description:   用于编辑界面的保存（新增或更新）
	 * @author:        zlshi
	 * @param:         request
	 * @date:		   2018-8-12
	 */
	@SecurityValid(resourceCode="R009_03_OPERATION_EDIT")
	@RequestMapping(value ="/savePerformanceContract", method = RequestMethod.POST)
	@ResponseBody
	public void savePerformanceContract(HttpServletRequest request,
			HttpServletResponse response,PerformanceContractVo VO){
		performanceContractManagerService.savePerformanceContract(VO);
	}
	
	/**
	 * @Description:   用于删除绩效合约信息
	 * @author:        zlshi
	 * @param:         request
	 * @date:		   2018-8-12
	 */
	@SecurityValid(resourceCode="R009_03_OPERATION_DEL")
	@RequestMapping(value ="/deletePerformanceContract", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deletePerformanceContract(HttpServletRequest request,
			HttpServletResponse response,PerformanceContractVo VO){
		performanceContractManagerService.deletePerformanceContract(VO);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description:   提交绩效合约信息
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-12
	 */
	@SecurityValid(resourceCode="R009_03_OPERATION_COMMIT")
	@RequestMapping(value = "/submitPerformanceContract", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo submitPerformanceContract(HttpServletRequest request,
			HttpServletResponse response,PerformanceContractVo VO){
		VO.setPcStatus("1");
		performanceContractManagerService.submitPerformanceContract(VO);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description:   审核绩效合约信息
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-12
	 */
	@SecurityValid(resourceCode="R009_03_OPERATION_AUDIT")
	@RequestMapping(value = "/auditPerformanceContract", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo auditPerformanceContract(HttpServletRequest request,
			HttpServletResponse response,PerformanceContractVo VO){
		performanceContractManagerService.auditPerformanceContract(VO);
		return this.returnOperateData(null, null);
	}
	
	
}