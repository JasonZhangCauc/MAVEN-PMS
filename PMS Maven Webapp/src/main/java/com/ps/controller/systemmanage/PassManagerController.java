package com.ps.controller.systemmanage;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.GlobalConstants;
import com.aop.log.OperateLog;
import com.aop.security.SecurityValid;
import com.ps.controller.common.BaseController;
import com.ps.result.systemmanage.PasswordVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.systemmanage.IPassManagerService;
import com.util.tool.ChunQiuTool;
import com.util.tool.MessageUtil;

/**
 * @Description:    密码管理类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
@Controller
@RequestMapping("/systemManage")
public class PassManagerController extends BaseController{

	@Autowired
	private IPassManagerService passManagerService;
	
	/**
	 * @Description: 进入修改密码主页面
	 * @author:      HuangPeng
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年4月15日
	 */
	@SecurityValid(resourceCode="R014_07")
	@OperateLog(remark="进入修改密码主页面",cateGory="修改密码",cateGoryType="31",operateType="0",isDetail=0)
	@RequestMapping(value="/modifyPassInitMain")
	public String modifyPassInitMain(HttpServletRequest request,HttpServletResponse response){
		return "systemManage/updatePassword/modifyPassInitMain";
	}
	
	/**
	 * 更新密码
	 * @param request
	 * @param response
	 * @return 返回消息
	 */
	@OperateLog(remark="更新密码",cateGory="密码修改",cateGoryType="23",operateType="3",isDetail=0)
	@RequestMapping(value="/updatePassword",method=RequestMethod.POST)
	@ResponseBody
	public String newPasswordPage(HttpServletRequest request,HttpServletResponse response,PasswordVo vo){
		UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
		UserVo uvo=this.passManagerService.updatePassword(vo,loginUser);
 		if(GlobalConstants.SUCCESS.equals(uvo.getFlag())){
 			reloadLoginUser(request, uvo);
			return "ok";
		}else{
			return uvo.getFlag();
		}
	}
	
	/**
	 * 更新密码验证
	 * @param request
	 * @param response
	 * @return 返回消息
	 */
	@RequestMapping(value="/queryExitOldPassword",method=RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> queryExitOldPassword(HttpServletRequest request,HttpServletResponse response,PasswordVo vo){
		UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
		String md5Password = ChunQiuTool.MD5(vo.getOldPassword());
		Map<Object,Object> map=new HashMap<Object,Object>();
		if (loginUser !=null && loginUser.getUserPassword().equals(md5Password)) {
			map.put("ok", "");
		}else{
			map.put("error", MessageUtil.getMessage("label.peoplemanage.oidpassworderror"));
		}
		return map;
	}
	
}
