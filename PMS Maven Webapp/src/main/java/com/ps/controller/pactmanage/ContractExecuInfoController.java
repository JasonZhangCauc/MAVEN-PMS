package com.ps.controller.pactmanage;

import java.util.List;

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
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.contractmanage.ContractExecuInfoVo;
import com.ps.result.contractmanage.ContractVo;
import com.ps.service.contractmanage.IContractExecuInfoService;


/** 
 * @Description: 合同执行情况
 * @author：		raomingyi
 * @date：		2018-03-21
 */
@Controller
@RequestMapping(value="/contractmanage")
public class ContractExecuInfoController extends BaseController {
	
	@Autowired
	private IContractExecuInfoService contractExecuInfoService;

	//返回页面路径 
	private static final String CONTRACT_EXECUINFO_PAGE_MAIN = "pactManage/contracttrack/contractExecuInfo";//合同执行情况主页面
	private static final String CONTRACT_TRACK_PAGE_MAIN = "pactManage/contracttrack/contractTrackMain";//合同跟踪编辑页
	private static final String CONTRACT_TRACK_PAGE_EDIT = "pactManage/contracttrack/contractTrackEdit";//合同跟踪编辑页
	
	
	/**
	 * @Description: 进入合同执行情况主页面
	 * @author:      raomingyi
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-21
	 */
	@OperateLog(remark="进入合同执行情况主页面",cateGory="合同执行情况",cateGoryType=GlobalConstants.CATEGORYTYPE_R00304,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/contractExecuInfoMain",method=RequestMethod.GET)
	public String ContractExecuInfoMain(HttpServletRequest request,HttpServletResponse response){
		return CONTRACT_EXECUINFO_PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询同执行情况信息
	 * @author:      raomingyi
	 * @param:       ContractVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-21
	 */
	@RequestMapping(value="/contractExecuInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询合同跟踪信息",cateGory="合同跟踪",cateGoryType=GlobalConstants.CATEGORYTYPE_R00304,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange contractExecuInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ContractVo param){
		param.initDataTableParam(request);
		List<ContractVo> dataList =this.contractExecuInfoService.queryContractExecuInfoByParam(param);
		PageInfo<ContractVo> page = new PageInfo<ContractVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	
	/**
	 * @Description: 根据合同ID进入合同跟踪界面
	 * @param 
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-12
	 */
	@OperateLog(remark="根据合同ID进入合同跟踪界面",cateGory=GlobalConstants.CATEGORY_R00304,cateGoryType=GlobalConstants.CATEGORYTYPE_R00601,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/contractTrackMain",method=RequestMethod.GET)
	public String contractTrackMain(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "contractId", required = false) String contractId){
		ContractVo contractVo=this.contractExecuInfoService.queryContractExecuInfoById(contractId);
		request.setAttribute("contractVo", contractVo);
		//根据ID查询数据
		return CONTRACT_TRACK_PAGE_MAIN;
	}	
	
	/**
	 * @Description: 查询合同跟踪信息
	 * @author:      raomingyi
	 * @param:       ContractExecuInfoVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-21
	 */
	@RequestMapping(value="/contractTrackInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询合同跟踪信息",cateGory="合同跟踪",cateGoryType=GlobalConstants.CATEGORYTYPE_R00304,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange contractTrackInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ContractExecuInfoVo param){
		param.initDataTableParam(request);
		List<ContractExecuInfoVo> dataList =this.contractExecuInfoService.queryContractTrackInfoByParam(param);
		PageInfo<ContractExecuInfoVo> page = new PageInfo<ContractExecuInfoVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	/**
	 * @Description: 进入编辑合同跟踪/新增/查看界面
	 * @param  
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-21
	 */
	@OperateLog(remark="进入合同跟踪编辑信息页面",cateGory="合同跟踪",cateGoryType=GlobalConstants.CATEGORYTYPE_R00304,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/contractTrackEdit",method=RequestMethod.GET)
	public String contractTrackEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="id",required=false)String id,
			@RequestParam(value="contractId",required=false)String contractId,
			@RequestParam(value = "operate", required = false) String operate){						
			//根据ID查询数据
			ContractExecuInfoVo vo=this.contractExecuInfoService.queryContractTrackInfoById(id);
			if (StringUtils.isNotBlank(contractId)) {
		    	vo.setContractId(contractId);				
			}
			request.setAttribute("vo", vo);
			request.setAttribute("operate",operate);
			return CONTRACT_TRACK_PAGE_EDIT;
	}
	
	/**
	 * @Description: 保存合同跟踪
	 * @author:      raomingyi
	 * @param:       ContractExecuInfoVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-21
	 */
	@OperateLog(remark="保存合同跟踪信息",cateGory="合同跟踪",cateGoryType=GlobalConstants.CATEGORYTYPE_R00304,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveContractTrack",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveContractTrack(HttpServletRequest request,
			HttpServletResponse response,ContractExecuInfoVo vo){		    
			this.contractExecuInfoService.saveContractTrack(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 合同跟踪删除
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-21
	 */
	@OperateLog(remark="删除合同跟踪信息",cateGory="合同跟踪",cateGoryType=GlobalConstants.CATEGORYTYPE_R00304,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteContractTrack",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteContractTrack(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=false)String id){
			this.contractExecuInfoService.deleteContractTrackById(id);
			return this.returnOperateData(null, null);
	}
}