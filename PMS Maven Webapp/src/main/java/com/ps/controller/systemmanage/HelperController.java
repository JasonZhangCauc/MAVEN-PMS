package com.ps.controller.systemmanage;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.GlobalConstants;
import com.aop.log.OperateLog;

/**
 * @Description: 帮助类
 * @author: ZHOUMIN
 * @date: 2018-4-8
 */
@Controller
@RequestMapping("/helper")
public class HelperController {
	
	/**
	 * @Description: 	进入帮助主页面
	 * @author: 		ZHOUMIN
	 * @param: 			request
	 * @param: 			response
	 * @return:
	 * @date: 			2018-4-8
	 */
	@OperateLog(remark="进入帮助主页面",cateGory="使用帮助",cateGoryType="24",operateType="0",isDetail=0)
	@RequestMapping(value = "/helperMain")
	public String helperMain(HttpServletRequest request, Integer parent, Integer child) {
		request.setAttribute("parent", parent);
		request.setAttribute("child", child);
		return "systemManage/helper/helperMain";
	}
	
	@OperateLog(remark="进入主页面",cateGory=GlobalConstants.CATEGORYTYPE_R00801,cateGoryType=GlobalConstants.CATEGORYTYPE_R00801,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/toHelpHome")
	public String toHelpHome() {
		return "systemManage/helper/helper1";
	}
}