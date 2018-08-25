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
import com.ps.result.contractmanage.ContractVo;
import com.ps.service.contractmanage.IContractManageService;


/** 
 * @Description: 合同维护
 * @author：		Jasonzhang
 * @date：		2018-03-13
 */
@Controller
@RequestMapping(value="/contractmanage")
public class ContractManageController extends BaseController {
	
	@Autowired
	private IContractManageService contractManageService;

	//返回页面路径 
	private static final String CONTRACT_PAGE_MAIN = "pactManage/contractmaintenance/contractManageMain";//主页面
	private static final String CONTRACT_PAGE_EDIT = "pactManage/contractmaintenance/contractManageEdit";//编辑页
	private static final String CONTRACT_SELECT_MAIN= "pactManage/contractmaintenance/contractSelectMain";//合同选择界面
	
	
	/**
	 * @Description: 进入合同维护主页
	 * @author:      Jasonzhang
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="进入合同维护主页",cateGory="合同维护",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/contractManageMain",method=RequestMethod.GET)
	public String ContractManageMain(HttpServletRequest request,HttpServletResponse response){
		return CONTRACT_PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询合同维护信息
	 * @author:      Jasonzhang
	 * @param:       ContractVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-13
	 */
	@RequestMapping(value="/contractInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询合同维护信息",cateGory="合同维护",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange contractManageInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ContractVo param){
		param.initDataTableParam(request);
		List<ContractVo> dataList =this.contractManageService.queryContractInfoByParam(param);
		PageInfo<ContractVo> page = new PageInfo<ContractVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入合同编辑/新增/查看界面
	 * @param  
	 * @return URL
	 * @author Jasonzhang
	 * @date:  2018-03-13
	 */
	@OperateLog(remark="进入合同编辑信息页面",cateGory="合同维护",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/contractManageEdit",method=RequestMethod.GET)
	public String contractManageEdit(HttpServletRequest request,HttpServletResponse response,
	@RequestParam(value="id",required=false)String id,
	@RequestParam(value = "operate", required = false) String operate){	
		//根据ID查询数据
		ContractVo vo=this.contractManageService.queryContractInfoById(id);
		request.setAttribute("vo", vo);
		request.setAttribute("changeList", vo.getChangeList());
		request.setAttribute("operate",operate);
		return CONTRACT_PAGE_EDIT;
	}
	
	/**
	 * @Description: 保存
	 * @author:      Jasonzhang
	 * @param:       ContractVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="保存合同信息",cateGory="合同维护",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveContract",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveContract(HttpServletRequest request,
			HttpServletResponse response,ContractVo vo){
		this.contractManageService.saveContract(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除合同信息
	 * @author:      Jasonzhang
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="删除合同信息",cateGory="合同维护",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteContract",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteContract(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=false)String id){
			this.contractManageService.deleteContractById(id);
			return this.returnOperateData(null, null);
	}
	/**
	 * @Description: 提交合同
	 * @author:      Jasonzhang
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-13
	 */
	@OperateLog(remark="提交合同",cateGory="合同维护",cateGoryType=GlobalConstants.CATEGORYTYPE_R00301,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateContractSendStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo submmitContract(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=false)String id){
			this.contractManageService.updateContractSendStatus(id);
			return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 进入合同选择界面
	 * @author:      Jasonzhang
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-13
	 */
	@RequestMapping(value="/contractSelectMain",method=RequestMethod.GET)
	public String contractSelectMain(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("contractId")String contractId,
			@RequestParam("showId")String showId,
			@RequestParam("hiddenId")String hiddenId){
		request.setAttribute("contractId", contractId);
		request.setAttribute("showId", showId);
		request.setAttribute("hiddenId", hiddenId);
		return CONTRACT_SELECT_MAIN;
	}
}