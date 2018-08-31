package com.ps.controller.pactmanage;

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
import com.ps.result.contractmanage.ContractApprovalVo;
import com.ps.service.contractmanage.IContractApprovalService;



/** 
 * @Description: 合同审批
 * @author：		raomingyi
<<<<<<< HEAD
 * @date：		2018-03-13
=======
 * @date：		2018-08-13
>>>>>>> branch 'master' of https://github.com/JasonZhangCauc/MAVEN-PMS.git
 */
@Controller
@RequestMapping(value="/pactManage")
public class ContractApprovalController extends BaseController {
	
	@Autowired
	private IContractApprovalService contractApprovalService;

	//返回合同审批页面路径 
	//private static final String CONTRACT_APPROVAL_PAGE_MAIN = "pactManage/contractapproval/contractApprovalMain";//合同审计主页面
	private static final String CONTRACT_APPROVAL_PAGE_MAIN = "pactManage/contractmaintenance/contractManageMain";//合同审计主页面
	
	
	
	//private static final String CONTRACT_APPROVAL_PAGE_DETAIL= "pactManage/contractapproval/contractApprovalDetail";//合同审计查看页面
	private static final String CONTRACT_APPROVAL_PAGE_DETAIL= "pactManage/contractmaintenance/contractManageEdit";//合同审计查看页面
	
	/**
	 * @Description: 进入合同审批主页
	 * @author:      raomingyi
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="进入合同审批主页",cateGory="合同审批",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/contractManageMain",method=RequestMethod.GET)
	public String ContractAppMain(HttpServletRequest request,HttpServletResponse response){
		return CONTRACT_APPROVAL_PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询合同审批信息
	 * @author:      raomingyi
	 * @param:       ContractApprovalVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-13
	 */
	@RequestMapping(value="/contractAppInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询合同审批信息",cateGory="合同审批",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange contractAppInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ContractApprovalVo param){
		param.initDataTableParam(request);
		List<ContractApprovalVo> dataList =this.contractApprovalService.queryContractAppInfoByParam(param);
		PageInfo<ContractApprovalVo> page = new PageInfo<ContractApprovalVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}		
	/**
	 * @Description: 进入合同查看界面
	 * @param  ID
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-13
	 */
	@OperateLog(remark="进入合同查看页面",cateGory="合同查看",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/contractApprovalDetail",method=RequestMethod.GET)
	public String contractApprovalDetail(HttpServletRequest request,HttpServletResponse response,
	@RequestParam(value="id",required=false)String id,
	@RequestParam(value = "operate", required = false) String operate){
			//根据ID查询数据
		    ContractApprovalVo vo=this.contractApprovalService.queryContractAppInfoById(id);
			request.setAttribute("vo", vo);
			request.setAttribute("operate",operate);
			return CONTRACT_APPROVAL_PAGE_DETAIL;
	}
	/**
	 * @Description: 审批合同信息
	 * @author:      raomingyi
	 * @param:       ContractApprovalVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="审批合同信息",cateGory="合同审批",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateContractStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateContractStatus(HttpServletRequest request,
			HttpServletResponse response,ContractApprovalVo vo,
			@RequestParam(value="operate",required=true)String operate){
			if (operate.equals("pass")) {
				vo.setContractStatus("2");
			}if (operate.equals("back")) {
				vo.setContractStatus("3");
			}
			this.contractApprovalService.updateContractStatus(vo);
			return this.returnOperateData(null, null);
	}
}