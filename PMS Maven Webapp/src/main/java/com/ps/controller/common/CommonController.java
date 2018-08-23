package com.ps.controller.common;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.aop.exception.BussinessException;
import com.github.pagehelper.PageInfo;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.common.ChangeRecordVo;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.common.UploadVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.util.file.DownloadUtil;
import com.util.tag.AuthorizationService;
import com.util.tool.AppUtil;

/**
 * @Description:    公共类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
@Controller
@RequestMapping("/common")
public class CommonController extends BaseController {
	
	@Autowired
	private ICommonService commonService;
	@Autowired
	private AuthorizationService authorizationService;
	@Autowired
	private ICommentService commentService;
	
	/**
	 * @Description: 返回主容器
	 * @author:      HuangPeng
	 * @param:       request
	 * @return:      String
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value = "/welcome", method = RequestMethod.GET)
	public String welcome(HttpServletRequest request,
			HttpServletResponse response) {
		UserVo user =(UserVo) request.getSession().getAttribute("user");
		if(user==null){
			request.getSession().removeAttribute("user");
			request.getSession().invalidate();
			return "common/login";
		}else{
			request.setAttribute("user", user);
		}
		return "common/menu";
	}
	
	/**
	 * @Description: 根据用户登录角色加载菜单
	 * @author:      HuangPeng
	 * @param        request
	 * @param        response
	 * @return:      JOIN 菜单
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value = "/loadIndex", method = RequestMethod.GET)
	public String loadIndex(HttpServletRequest request,
			HttpServletResponse response) {
		return "common/index";
	}
	
	/**
	 * @Description: 根据用户登录角色加载菜单
	 * @author:      HuangPeng
	 * @param        request
	 * @param        response
	 * @return:      JOIN 菜单
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value = "/loadMenu", method = RequestMethod.POST)
	@ResponseBody
	public String loadMenu(HttpServletRequest request,
			HttpServletResponse response) {
		String menu = this.commonService.loadMenu(request);
		return menu;
	}
	
	/**
	 * @Description: 注销
	 * @author:      HuangPeng
	 * @param        request
	 * @param        response
	 * @return:      String
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value="/logout",method=RequestMethod.GET)
	public String logoutUser(HttpServletRequest request,HttpServletResponse response){
		request.getSession().removeAttribute("user");
		request.getSession().invalidate();
		return "../../login";
	} 
	
	/**
	 * @Description: 锁定
	 * @author:      HuangPeng
	 * @param        request
	 * @param        response
	 * @return:      String
	 * @date:        2017年4月15日
	 */
	@RequestMapping(value="/lockUser",method=RequestMethod.GET)
	public String lockUser(HttpServletRequest request,HttpServletResponse response){
		UserVo loginUser = (UserVo)request.getSession().getAttribute("user");
		if(loginUser!=null){
			request.getSession().removeAttribute("user");
			request.getSession().invalidate();
			request.setAttribute("userAccount", loginUser.getUserAccount());
			request.setAttribute("userName", loginUser.getUserName());
			return "../../lockMain";
		}else{
			return "../../login";
		}
	}
	
	/**
	 * @Description: 验证自定义标签权限
	 * @author:      HuangPeng
	 * @param        request
	 * @param        response
	 * @return:      boolean
	 * @date:        2017年4月15日 
	 */
	@ResponseBody
	@RequestMapping(value="/isUserHasAuth",method=RequestMethod.POST)
	public boolean isUserHasAuth(@RequestParam("sourceCode") String rsourceCode,
			HttpServletRequest request,HttpServletResponse response){
		return this.authorizationService.validAuthorizaiton(rsourceCode);
	}
	
	/**
	 * @Description: 部门选择框
	 * @author:      HuangPeng
	 * @param 		 request
	 * @param 	     response
	 * @return       返回消息
	 * @date:        2017年4月15日 
	 */
	@RequestMapping(value = "/getDeptList")
	public String getDeptList(HttpServletRequest request, HttpServletResponse response){
		String type = request.getParameter("type");
		if(StringUtils.isEmpty(type)){
			type="radio";
		}
		request.setAttribute("type", type);
		request.setAttribute("showId", request.getParameter("showId"));
		request.setAttribute("hiddenId", request.getParameter("hiddenId"));
		request.setAttribute("deptId", request.getParameter("deptId"));
		return "common/deptListPage";
	}
	
	/**
	 * 多文件上传
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping(value = "/multiFile")
	@ResponseBody
	public OperateStatusVo uploadFile(HttpServletRequest request,
			HttpServletResponse response,UploadVo param) throws Exception {
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		MultipartHttpServletRequest  multipartRequest = (MultipartHttpServletRequest)request;
		Map<String, List<MultipartFile>> map = multipartRequest.getMultiFileMap();
		for(Object key : map.keySet()){
			files = map.get(key.toString());
		}
        UploadVo uploadVo=this.commonService.saveUploadFiles(files,getLoginUser(request),param);
		return this.returnOperateData(null, uploadVo);
	}
	
	/**
	 * 得到所有的上传文件
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping(value = "/getAllFile", method = RequestMethod.POST)
	@ResponseBody
	public List<UploadVo> getAllFileUpload(HttpServletRequest request,
			HttpServletResponse response) throws BussinessException {
		String pageType = request.getParameter("pageType");// 功能类型
		String dataId=request.getParameter("dataId");//功能对应id
		List<UploadVo> fileList = commonService.getAllFileUpload(pageType,dataId);
		return fileList;
	}
	
	/**
	 * 删除文件
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/deleteFile", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteFile(HttpServletRequest request,
			HttpServletResponse response) throws BussinessException {
		String fileID = request.getParameter("fileid");
		commonService.deleteFile(fileID);
		return this.returnOperateData("success", null);
	}
	
	/**
	 * 文件下载
	 * 
	 * @param request
	 * @param response
	 */
	@RequestMapping(value = "/downloadFile")
	@ResponseBody
	public void downLoadFile(HttpServletRequest request,
			HttpServletResponse response) throws BussinessException {
		String fileid = request.getParameter("fileid");
		UploadVo fuv = commonService.findFileUUIDNameById(fileid);
		String serverPath = AppUtil.getServletContextPath();
		request.setAttribute("fileName", fuv.getFileName());
		request.setAttribute(
				"loadPath",serverPath+"/"+fuv.getFilePath());
		DownloadUtil.download(request, response);
	}
	
	/**
	 * @Description: 进入数据变更查询页
	 * @author:      raomingyi
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/changeRecordMain",method=RequestMethod.GET)
	public String changeRecordMain(HttpServletRequest request,HttpServletResponse response,
		ChangeRecordVo changeRecordVo){
		request.setAttribute("changeRecordVo", changeRecordVo);
		return "common/changeRecordMain";
	}
	
	/**
	 * @Description: 查询数据变更日志
	 * @author:      ZHOUMIN
	 * @param:       changeRecodeVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/changeRecordByParam",method=RequestMethod.POST)
	@ResponseBody
	public ListRange changeRecordByParam(HttpServletRequest request,
					HttpServletResponse response,ChangeRecordVo changeRecordVo){
		UserVo user =(UserVo) request.getSession().getAttribute("user");
		changeRecordVo.setAuthDeptId(changeRecordVo.getDeptStrByDeptId(user.getDeptId()));
		changeRecordVo.initDataTableParam(request);
		List<ChangeRecordVo> dataList =this.commonService.queryChangeRecordByParam(changeRecordVo);
		PageInfo<ChangeRecordVo> page = new PageInfo<ChangeRecordVo>(dataList);
		ListRange lr = new ListRange(changeRecordVo,page);
		return lr;
	}
	
	/**
	 * @Description: 人员选择框
	 * @author:      HuangPeng
	 * @param 		 request
	 * @param 	     response
	 * @return       返回消息
	 * @date:        2017年4月15日 
	 */
	@RequestMapping(value = "/userSelectMain")
	public String userSelectMain(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("type", request.getParameter("type"));
		request.setAttribute("radio", request.getParameter("radio"));
		request.setAttribute("showId", request.getParameter("showId"));
		request.setAttribute("hideId", request.getParameter("hideId"));
		request.setAttribute("users", request.getParameter("users"));
		request.setAttribute("userPosition", request.getParameter("userPosition"));
		request.setAttribute("deptId", request.getParameter("deptId"));
		return "common/userSelectMain";
	}
	
	/**
	 * @Description: 保存注释信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@RequestMapping(value="/saveComment",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveComment(HttpServletRequest request,
			HttpServletResponse response,CommentVO commentVO){
		this.commentService.saveComment(commentVO);
		return this.returnOperateData(null,commentVO);
	}
	
	
}
