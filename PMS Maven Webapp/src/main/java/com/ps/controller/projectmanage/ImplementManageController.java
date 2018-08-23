package com.ps.controller.projectmanage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.aop.security.SecurityValid;
import com.ps.controller.common.BaseController;

/** 
 *@Description: 项目立项Controller
 * @author：		zhangm
 * @date：		2018-08-10
 */
@Controller
@RequestMapping(value="/projectManage")
public class ImplementManageController extends BaseController{
	
	private static final String EMBODIMENT_CONSOLE_MAIN = "/projectManage/embodimentConsoleMain/embodimentConsoleMain";//实施监控主页面
	
	/**
	 * @Description: 进入实施监控主页
	 * @author:      zhangm
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-08-02
	 */
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R00403)
	@OperateLog(remark="进入实施监控主页",cateGory=GlobalConstants.CATEGORYTYPE_R00403,cateGoryType=GlobalConstants.CATEGORY_R00403,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/embodimentConsoleMain",method=RequestMethod.GET)
	public String embodimentConsoleMain(HttpServletRequest request,HttpServletResponse response){
		return EMBODIMENT_CONSOLE_MAIN;
	}

}
