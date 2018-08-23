package com.ps.controller.projectmanage;

import java.util.List;
import java.util.Map;

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
import com.aop.security.SecurityValid;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.projectmanage.OtherCostManagerVo;
import com.ps.service.projectmanage.IOtherCostManagerService;
import com.util.file.DocumentHandlerUtil;


/** 
 * @Description: 其他成本Controller
 * @author：		jczou
 * @date：		2018-03-19
 */
@Controller
@RequestMapping(value="/projectManagement")
public class OtherCostManagerController extends BaseController {
	
	@Autowired
	private IOtherCostManagerService otherCostManagerService;

	//返回页面路径 
	private static final String OTHER_COST_MAIN = "projectManage/othercostmanager/otherCostManagerMain";//主页面
	private static final String OTHER_COST_EDIT = "projectManage/othercostmanager/otherCostManagerEdit";//编辑页
	
	
	/**
	 * @Description: 进入其他成本主页
	 * @author:      jczou
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-19
	 */
	@SecurityValid(resourceCode="R004_05")
	@OperateLog(remark="进入其他成本主页",cateGory=GlobalConstants.CATEGORY_R00405,cateGoryType=GlobalConstants.CATEGORYTYPE_R00405,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/otherCostMain",method=RequestMethod.GET)
	public String OtherCostMain(HttpServletRequest request,HttpServletResponse response){
		return OTHER_COST_MAIN;
	}
	
	/**
	 * @Description: 查询其他成本信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/otherCostManagerInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询其他成本信息",cateGory=GlobalConstants.CATEGORY_R00405,cateGoryType=GlobalConstants.CATEGORYTYPE_R00405,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange otherCostManagerInfoByParam(HttpServletRequest request,
					HttpServletResponse response,OtherCostManagerVo param){
		param.initDataTableParam(request);
		List<OtherCostManagerVo> dataList =this.otherCostManagerService.queryOtherCostManagerInfoByParam(param);
		PageInfo<OtherCostManagerVo> page = new PageInfo<OtherCostManagerVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入其他成本编辑/新增/查看界面
	 * @param  todo
	 * @return URL
	 * @author jczou
	 * @date:  2018-03-19
	 */
	@SecurityValid(resourceCode="R004_0501")
	@OperateLog(remark="进入其他成本编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00405,cateGoryType=GlobalConstants.CATEGORYTYPE_R00405,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/otherCostManagerEdit",method=RequestMethod.GET)
	public String otherCostManagerEdit(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		OtherCostManagerVo otherCostVo=this.otherCostManagerService.queryOtherCostManagerInfoById(id);
		request.setAttribute("otherCostVo", otherCostVo);
		request.setAttribute("operate",operate);
		request.setAttribute("changeList", otherCostVo.getChangeList());
		return OTHER_COST_EDIT;
	}
	
	/**
	 * @Description: 保存其他成本信息
	 * @author:      jczou
	 * @param:       OtherCostManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="保存其他成本信息",cateGory=GlobalConstants.CATEGORY_R00405,cateGoryType=GlobalConstants.CATEGORYTYPE_R00405,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveOtherCostManager",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveOtherCostManager(HttpServletRequest request,
		HttpServletResponse response,OtherCostManagerVo vo){
		this.otherCostManagerService.saveOtherCostManager(vo);
		return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除其他成本信息
	 * @author:      jczou
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@SecurityValid(resourceCode="R004_0502")
	@OperateLog(remark="删除其他成本信息",cateGory=GlobalConstants.CATEGORY_R00405,cateGoryType=GlobalConstants.CATEGORYTYPE_R00405,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteOtherCostManager",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteOtherCostManager(HttpServletRequest request,
		HttpServletResponse response){
		String id = request.getParameter("id");
		this.otherCostManagerService.deleteOtherCostManagerById(id);
		return this.returnOperateData(null, null);
	}
	
	
	/**
	 * @Description: 导出其他成本信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@SecurityValid(resourceCode="R004_0503")
	@RequestMapping(value="/exportOtherCostInfo", method=RequestMethod.POST)
	@OperateLog(remark="导出其他成本信息",cateGory=GlobalConstants.CATEGORY_R00405,cateGoryType=GlobalConstants.CATEGORYTYPE_R00405,
		operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=0)
	public void exportOtherCostInfo(HttpServletRequest request, HttpServletResponse response,
			OtherCostManagerVo otherCostVo) throws Exception{
		//构建导出数据
		Map<String, Object> param = this.otherCostManagerService.exportOtherCostInfo(otherCostVo);
		//文档名称国际化
		DocumentHandlerUtil documentHandlerUtil = new DocumentHandlerUtil();
		documentHandlerUtil.createFile(request, response, param, param.get("template").toString(), 
				param.get("fileName").toString(), param.get("fileType").toString());
	}
}