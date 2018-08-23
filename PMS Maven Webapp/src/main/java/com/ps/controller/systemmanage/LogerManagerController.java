package com.ps.controller.systemmanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GlobalConstants;
import com.aop.exception.BussinessException;
import com.aop.log.OperateLog;
import com.aop.security.SecurityValid;
import com.github.pagehelper.PageInfo;
import com.ps.result.common.ListRange;
import com.ps.result.systemmanage.OperateLogVo;
import com.ps.result.systemmanage.SystemLogerVo;
import com.ps.service.systemmanage.ILogerManagerService;

/**
 * @Description:    日志管理类
 * @author:         ZHOUMIN
 * @date:           2018年3月5日
 */
@Controller
@RequestMapping("/systemManage")
public class LogerManagerController {

	@Autowired
	private ILogerManagerService logManagerService;
	
	/**
	 * @Description: 进入操作日志管理页面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018年3月5日
	 */
	@SecurityValid(resourceCode="R014_06")
	@OperateLog(remark="进入操作日志管理页面",cateGory=GlobalConstants.CATEGORY_R01406,
			cateGoryType=GlobalConstants.CATEGORYTYPE_R01406,operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/logerOperateMain")
	public String logerOperateMain(HttpServletRequest request,HttpServletResponse response) {
		return "systemManage/logerManager/logerOperateMain";
	}
	
	/**
	 * @Description: 根据条件查询操作日志信息
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018年3月5日
	 */
	@OperateLog(remark="根据条件查询操作日志信息",cateGory=GlobalConstants.CATEGORY_R01406,
			cateGoryType=GlobalConstants.CATEGORYTYPE_R01406,operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/queryLogerOperateByParam")
	@ResponseBody
	public ListRange queryOperateLogByParam(OperateLogVo vo,
			HttpServletRequest request, HttpServletResponse response) throws BussinessException{
		vo.initDataTableParam(request);
		List<OperateLogVo> userList = this.logManagerService.queryOperateLogByParam(vo);
		PageInfo<OperateLogVo> page = new PageInfo<OperateLogVo>(userList);
		ListRange lr = new ListRange(vo,page);
		return lr;
	}
	
	/**
	 * @Description: 进入系统日志管理页面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2018年3月5日
	 */
	@SecurityValid(resourceCode="R014_06")
	@OperateLog(remark="进入系统日志管理页面",cateGory=GlobalConstants.CATEGORY_R01406,
		cateGoryType=GlobalConstants.CATEGORYTYPE_R01406,operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/logerSystemMain")
	public String logerSystemMain(HttpServletRequest request,HttpServletResponse response) {
		return "systemManage/logerManager/logerSystemMain";
	}
	
	/**
	 * @Description: 根据条件查询系统日志信息
	 * @author:      ZHOUMIN
	 * @param:       ListRange 
	 * @return:      URL
	 * @date:        2018年3月5日
	 */
	@OperateLog(remark="根据条件查询系统日志信息",cateGory=GlobalConstants.CATEGORY_R01406,
			cateGoryType=GlobalConstants.CATEGORYTYPE_R01406,operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/querySystemLogByParam")
	@ResponseBody
	public ListRange querySystemLogByParam(SystemLogerVo vo,
			HttpServletRequest request, HttpServletResponse response) throws BussinessException{
		vo.initDataTableParam(request);
		List<SystemLogerVo> list = this.logManagerService.querySystemLogByParam(vo);
		PageInfo<SystemLogerVo> page = new PageInfo<SystemLogerVo>(list);
		ListRange lr = new ListRange(vo,page);
		return lr;
	}
}
