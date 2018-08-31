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
import com.ps.result.contractmanage.ContractVo;
import com.ps.result.contractmanage.ReceiveNodeVo;
import com.ps.service.contractmanage.IContractExecuInfoService;
import com.ps.service.contractmanage.IReceiveNodeManageService;


/** 
 * @Description: 收款节点
 * @author：		raomingyi
 * @date：		2018-03-19
 */
@Controller
@RequestMapping(value="/contractmanage")
public class ReceiveNodeManageController extends BaseController {
	
	@Autowired
	private IReceiveNodeManageService receiveNodeManageService;
	
	@Autowired
	private IContractExecuInfoService contractExecuInfoService;

	//返回页面路径 
	private static final String RECEIVE_NODE_PAGE_MAIN = "pactManage/receivenodemanage/receiveNodeManageMain";//主页面
	private static final String RECEIVE_NODE_PAGE_EDIT = "pactManage/receivenodemanage/receiveNodeEdit";//编辑页
	
	
	/**
	 * @Description: 进入收款节点主页
	 * @author:      raomingyi
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="进入收款节点主页",cateGory=GlobalConstants.CATEGORY_R00303,cateGoryType=GlobalConstants.CATEGORYTYPE_R00303,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/receiveNodeManageMain",method=RequestMethod.GET)
	public String ReceiveNodeManageMain(HttpServletRequest request,HttpServletResponse response){
		return RECEIVE_NODE_PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询合同信息
	 * @author:      raomingyi
	 * @param:       ContractVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/contractNodeInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询合同信息",cateGory=GlobalConstants.CATEGORY_R00303,cateGoryType=GlobalConstants.CATEGORYTYPE_R00303,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange contractNodeInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ContractVo param){
		param.initDataTableParam(request);
		List<ContractVo> dataList =this.contractExecuInfoService.queryContractExecuInfoByParam(param);
		PageInfo<ContractVo> page = new PageInfo<ContractVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}		
	
	
	/**
	 * @Description: 查询收款节点信息
	 * @author:      raomingyi
	 * @param:       ReceiveNodeVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/receiveNodeInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询收款节点信息",cateGory=GlobalConstants.CATEGORY_R00303,cateGoryType=GlobalConstants.CATEGORYTYPE_R00303,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange receiveNodeInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ReceiveNodeVo param){
		param.initDataTableParam(request);
		List<ReceiveNodeVo> dataList =this.receiveNodeManageService.queryReceiveNodeInfoByParam(param);
		PageInfo<ReceiveNodeVo> page = new PageInfo<ReceiveNodeVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入收款节点编辑/新增/查看界面
	 * @param  
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入收款节点编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00303,cateGoryType=GlobalConstants.CATEGORYTYPE_R00303,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/receiveNodeEdit",method=RequestMethod.GET)
	public String receiveNodeEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="id",required=false)String id,
			@RequestParam(value="contractId",required=false)String contractId,
			@RequestParam(value = "operate", required = false) String operate){					    
			//根据ID查询数据
			ReceiveNodeVo vo=this.receiveNodeManageService.queryReceiveNodeInfoById(id);
			if(StringUtils.isBlank(id)){
				ContractVo  contractVo=contractExecuInfoService.queryContractExecuInfoById(contractId);
		    	vo.setContractId(contractId);
		    	vo.setBelongCustomerid(contractVo.getBelongCustomerid());
		    	vo.setBelongProduct(contractVo.getBelongProduct());
		    }
			request.setAttribute("vo", vo);
			request.setAttribute("operate",operate);
			return RECEIVE_NODE_PAGE_EDIT;
	}
	
	/**
	 * @Description: 保存收款节点信息
	 * @author:      raomingyi
	 * @param:       ReceiveNodeVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="保存收款节点信息",cateGory=GlobalConstants.CATEGORY_R00303,cateGoryType=GlobalConstants.CATEGORYTYPE_R00303,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveReceiveNode",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo savereceiveNode(HttpServletRequest request,
			HttpServletResponse response,ReceiveNodeVo vo){
			this.receiveNodeManageService.saveReceiveNode(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除收款节点信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="删除收款节点信息",cateGory=GlobalConstants.CATEGORY_R00303,cateGoryType=GlobalConstants.CATEGORYTYPE_R00303,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteReceiveNode",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deletereceiveNode(HttpServletRequest request,
			HttpServletResponse response){
			String id = request.getParameter("id");
			this.receiveNodeManageService.deleteReceiveNodeById(id);
			return this.returnOperateData(null, null);
	}
}