package com.ps.controller.systemmanage;

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
import com.ps.result.systemmanage.CodeVo;
import com.ps.service.systemmanage.ICodeManagerService;


/** 
 *@Description: 基础数据维护controller
 * @author：		ZHOUMIN
 * @date：		2018-03-02
 */
@Controller
@RequestMapping(value="/systemManage")
public class CodeManagerController extends BaseController {
	
	@Autowired
	private ICodeManagerService codeManagerService;

	//返回页面路径 
	private static final String CODE_MANAGER_MAIN = "systemManage/codeManager/codeManagerMain";//主页面
	private static final String CODE_MANAGER_EDIT = "systemManage/codeManager/codeManagerEdit";//编辑页
	
	
	/**
	 * @Description: 进入基础数据维护主页
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-02
	 */
	@SecurityValid(resourceCode="R014_03")
	@OperateLog(remark="进入基础数据维护主页",cateGory=GlobalConstants.CATEGORY_R01403,cateGoryType=GlobalConstants.CATEGORYTYPE_R01403,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/codeManagerMain",method=RequestMethod.GET)
	public String CodeManagerMain(HttpServletRequest request,HttpServletResponse response){
		return CODE_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 查询基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       CodeManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/queryCodeInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询基础数据维护信息",cateGory=GlobalConstants.CATEGORY_R01403,cateGoryType=GlobalConstants.CATEGORYTYPE_R01403,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryCodeInfoByParam(HttpServletRequest request,
					HttpServletResponse response,CodeVo vo){
		vo.initDataTableParam(request);
		List<CodeVo> dataList =this.codeManagerService.queryCodeInfoByParam(vo);
		PageInfo<CodeVo> page = new PageInfo<CodeVo>(dataList);
		ListRange lr = new ListRange(vo,page);
		return lr;
	}
	
	/**
	 * @Description:  	进入基础数据维护编辑信息页面
	 * @param  			todo
	 * @return 			URL
	 * @author 			ZHOUMIN
	 * @date:  			2018-03-02
	 */
	@SecurityValid(resourceCode="R014_03_OPERATION_EDIT")
	@OperateLog(remark="进入基础数据维护编辑信息页面",cateGory=GlobalConstants.CATEGORY_R01403,cateGoryType=GlobalConstants.CATEGORYTYPE_R01403,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/codeManagerEdit",method=RequestMethod.GET)
	public String codeManagerEdit(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "codeId", required = false) String codeId,
		@RequestParam(value = "operate", required = false) String operate){
		//根据ID查询数据
		CodeVo vo=this.codeManagerService.queryCodeInfoById(codeId);
		request.setAttribute("codeVo", vo);
		request.setAttribute("operate", operate);
		return CODE_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 判断码值唯一性
	 * @author:      ZhouMin
	 * @param:       CodeVo码表信息
	 * @return:      Map<Object,Object>返回信息
	 * @date:        2017年8月15日
	 */
	@RequestMapping(value="/queryCodeInfoByChecking",method=RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> queryCodeInfoByChecking(HttpServletRequest request,HttpServletResponse response,CodeVo vo){
		return this.codeManagerService.queryCodeInfoByChecking(vo);
	}
	
	/**
	 * @Description: 保存
	 * @author:      ZHOUMIN
	 * @param:       CodeManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-02
	 */
	@OperateLog(remark="保存基础数据维护信息",cateGory=GlobalConstants.CATEGORY_R01403,cateGoryType=GlobalConstants.CATEGORYTYPE_R01403,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveCode",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveCode(HttpServletRequest request,
			HttpServletResponse response,CodeVo vo){
			this.codeManagerService.saveCode(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 禁用字典/启用字典
	 * @author:      ZHOUMIN
	 * @param:       codeId 码表ID codeFlag 码表状态
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018年3月6日
	 */
	@SecurityValid(resourceCode="R014_03_OPERATION_DELETE")
	@OperateLog(remark="禁用字典/启用字典",cateGory=GlobalConstants.CATEGORY_R01403,cateGoryType=GlobalConstants.CATEGORYTYPE_R01403,
			operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/codeDisable",method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo codeDisable(HttpServletRequest request,HttpServletResponse response,
			@RequestParam("codeId") String codeId,
			@RequestParam("codeFlag") String codeFlag) {
		this.codeManagerService.updateCodeFlag(codeId, codeFlag);
		return this.returnOperateData(GlobalConstants.SUCCESS_STATUS_CODE,null);
	}
	
	/**
	 * @Description: 将基础信息维护以树形结构数据展示
	 * @author:      ZHOUMIN
	 * @param:       
	 * @return:      Map<String,List<CodeVo>> 返回基础维护信息
	 * @date:        2018年3月6日
	 */
	@ResponseBody
	@RequestMapping(value="/initCodeInfo")
	public  Map<String,List<CodeVo>> initCodeInfo(HttpServletRequest request,HttpServletResponse response){
		return codeManagerService.initCodeInfo();
	}
	
	/**
	 * @Description: 初始化客户信息
	 * @author:      ZHOUMIN
	 * @param:       
	 * @return:      List<CustomerVo>返回信息
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/initParentCode",method=RequestMethod.POST)
	@ResponseBody
	public List<CodeVo> initParentCode(HttpServletRequest request,HttpServletResponse response){
		List<CodeVo> parentCodeList=this.codeManagerService.getParentCode();
		return parentCodeList;
	}
}