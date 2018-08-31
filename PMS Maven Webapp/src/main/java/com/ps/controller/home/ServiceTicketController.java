package com.ps.controller.home;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.GlobalConstants;
import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.aop.log.OperateLog;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.home.ServiceTicketVo;
import com.ps.service.home.IServiceTicketService;
import com.util.file.ImportUtil;
import com.util.file.MultiPartUtil;
import com.util.tool.AppUtil;
import com.util.tool.ChunQiuTool;

/**
 * @Description:    服务单
 * @author:         ZHOUMIN
 * @date:           2018年07月27日
 */
@Controller
@RequestMapping("/systemManage")
public class ServiceTicketController  extends BaseController{
	
	public static final String SERVICE_TICKET_MANAGER_MAIN="home/serviceTicket/serviceTicketMain"; //服务单主界面
	public static final String SERVICE_TICKET_MANAGER_EDIT="home/serviceTicket/serviceTicketEdit"; //服务单上传界面
	
	@Autowired
	private IServiceTicketService serviceTicketService;
	
	/**
	 * @Description: 进入服务单主页面
	 * @author:      ZHOUMIN
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年8月24日
	 */
	@OperateLog(remark="进入服务单主页面",cateGory=GlobalConstants.CATEGORY_R01001,cateGoryType=GlobalConstants.CATEGORYTYPE_R01001,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/serviceTicketMain",method=RequestMethod.GET)
	public String serviceTicketMain(HttpServletRequest request,HttpServletResponse response){
		return SERVICE_TICKET_MANAGER_MAIN;
	}
	
	/**
	 * @Description: 根据参数获取服务单信息
	 * @param  RoleVo 角色表
	 * @return ListRange数据实体类
	 * @author ZHOUMIN
	 * @date:  2017年8月24日
	 */
	@RequestMapping(value="/queryServiceTicketByParam",method=RequestMethod.POST)
	@OperateLog(remark="根据参数获取服务单信息",cateGory=GlobalConstants.CATEGORY_R01001,cateGoryType=GlobalConstants.CATEGORYTYPE_R01001,
			operateType=GlobalConstants.OPERATETYPE_FOUR,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryServiceTicketByParam(HttpServletRequest request,HttpServletResponse response,
			ServiceTicketVo param){
		param.initDataTableParam(request);
		List<ServiceTicketVo> dataList = serviceTicketService.queryServiceTicketByParam(param);
		PageInfo<ServiceTicketVo> page = new PageInfo<ServiceTicketVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入服务单上传界面
	 * @return URL
	 * @author zhoumin
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="进入服务单上传界面",cateGory=GlobalConstants.CATEGORY_R01001,cateGoryType=GlobalConstants.CATEGORYTYPE_R01001,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/serviceTicketEdit",method=RequestMethod.GET)
	public String serviceTicketEdit(HttpServletRequest request,HttpServletResponse response){
		return SERVICE_TICKET_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 服务单上传
	 * @return URL
	 * @author zhoumin
	 * @date:  2018-03-19
	 */
	@OperateLog(remark="服务单上传",cateGory=GlobalConstants.CATEGORY_R01001,cateGoryType=GlobalConstants.CATEGORYTYPE_R01001,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/upload",method=RequestMethod.POST) 
    @ResponseBody
    public String fildUpload(HttpServletRequest request,HttpServletResponse response,Model model){  
		List<MultipartFile> files = new ArrayList<MultipartFile>();
		MultipartHttpServletRequest  multipartRequest = (MultipartHttpServletRequest)request;
		Map<String, List<MultipartFile>> map = multipartRequest.getMultiFileMap();
		for(Object key : map.keySet()){
			files = map.get(key.toString());
		}
		String path="";
		try {
			//获得物理路径webapp所在路径  
	       if(!files.isEmpty()){
				String serverPath = AppUtil.getServletContextPath();
				String configPath = "/assets/template/serviceTicket/".concat(ChunQiuTool.getUUID());
				String flieName=files.get(0).getOriginalFilename(); //文件名
				String flieType=flieName.substring(flieName.lastIndexOf(".")); //文件类型
				//上传附件
				MultiPartUtil.uploadFiles(files, serverPath,configPath,flieType);
				path=configPath+flieType;
			    ServiceTicketVo serviceTicketVo=new ServiceTicketVo();
	    	    serviceTicketVo.setFilename(flieName);
	    	    serviceTicketVo.setFiletype(flieType);
	    	    serviceTicketVo.setFilePath(path);
	    	    this.serviceTicketService.saveServiceTicket(serviceTicketVo);
	       }
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.syserror"), e);
		}
        request.setAttribute("imagesPath", path); 
        model.addAttribute("imgPath",path);
        return path;  
    } 
	
	/**
	 * @Description: 删除服务单
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="删除服务单",cateGory=GlobalConstants.CATEGORY_R01001,cateGoryType=GlobalConstants.CATEGORYTYPE_R01001,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteServiceTicket",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteServiceTicket(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.serviceTicketService.deleteServiceTicketById(id);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * 附件下载
	 * @author: ZHOUMIN
	 * @date: 2018年7月25日
	 * @param request
	 * @param response
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/downloadServiceTicket")
	public void downloadServiceTicket(HttpServletRequest request, HttpServletResponse response,
			@RequestParam(value = "id", required = true) String id) throws IOException{	
		ServiceTicketVo serviceTicketVo=this.serviceTicketService.queryServiceTicketById(id);
		ImportUtil.downloadFile(response, serviceTicketVo.getFilename(), serviceTicketVo.getFilePath());
	}
	
}
