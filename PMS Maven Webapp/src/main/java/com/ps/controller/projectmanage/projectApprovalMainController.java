package com.ps.controller.projectmanage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Collection;
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
import com.aop.security.SecurityValid;
import com.github.pagehelper.PageInfo;
import com.ps.controller.common.BaseController;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.projectmanage.DocumentManageVo;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.service.projectmanage.IDocumentManageService;
import com.ps.service.projectmanage.IProjectApprovalService;
import com.util.coder.EncryptPkUtil;
import com.util.file.ImportUtil;
import com.util.file.MultiPartUtil;
import com.util.tool.AppUtil;
import com.util.tool.ChunQiuTool;

/** 
 *@Description: 项目立项Controller
 * @author：		zhangm
 * @date：		2018-08-02
 */
@Controller
@RequestMapping(value="/projectManage")
public class projectApprovalMainController extends BaseController{
	
	@Autowired
	private IProjectApprovalService projectApprovalService;
	
	@Autowired
	private IDocumentManageService documentManageService;

		
	private static final String PROJECCT_APPROVAL_MAIN = "/projectManage/projectApprovalMain/projectApprovalMain";//项目立项主页面
	
	private static final String PROJECCT_APPROVAL_EDIT = "/projectManage/projectApprovalMain/projectApprovalEdit";//项目新增编辑界面
	
	private static final String PROJECCT_APPROVAL_DEAIL = "/projectManage/projectApprovalMain/projectApprovalDetail";//项目立项详情界面
	
	private static final String IMPORT_EXCEL="/projectManage/projectApprovalMain/importExcel";//立项导出

	private static final String SERVICE_MONI_MANAGER_EDIT = "/projectManage/projectApprovalMain/serviceMoniEdit";//项目立项详情界面
	
	/**
	 * @Description: 进入项目立项主页
	 * @author:      zhangm
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-08-02
	 */
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R00401)
	@OperateLog(remark="进入项目立项信息主页",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectApprovalMain",method=RequestMethod.GET)
	public String projectApprovalMain(HttpServletRequest request,HttpServletResponse response){
		return PROJECCT_APPROVAL_MAIN;
	}
	
	/**
	 * @Description: 查询项目立项信息
	 * @author:      zhangm
	 * @param:       ProjectManagerVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-08-02
	 */
	@RequestMapping(value="/queryProjectApprovalByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询项目维护信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange queryProjectApprovalByParam(HttpServletRequest request,
					HttpServletResponse response,ProjectBaseInfoVo param){
		//数据权限
		param.initDataAuthByCode(request, "R004_01_DATA");
		param.initDataTableParam(request);
		List<ProjectBaseInfoVo> dataList =this.projectApprovalService.queryProjectApprovalByParam(param);
		PageInfo<ProjectBaseInfoVo> page = new PageInfo<ProjectBaseInfoVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入项目立项信息编辑/新增/查看界面
	 * @return URL
	 * @author zhangm
	 * @date:  2018-08-02
	 */
	@SecurityValid(resourceCode="R004_01_OPERATION_EDIT")
	@OperateLog(remark="进入项目基本信息编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectApprovalEdit",method=RequestMethod.GET)
	public String projectApprovalEdit(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = true) String operate){
		ProjectBaseInfoVo vo=this.projectApprovalService.queryProjectApprovalfoById(id);
		request.setAttribute("operate",operate);
		request.setAttribute("vo",vo);
		return PROJECCT_APPROVAL_EDIT;
	}
	
	/**
	 * @Description: 删除项目立项信息
	 * @author:      zhangm
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-08-02
	 */
	@SecurityValid(resourceCode="R004_01_OPERATION_DEL")
	@OperateLog(remark="删除项目维护信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteProjectApproval",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteProjectApproval(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.projectApprovalService.deleteProjectApproval(id);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 审批项目信息
	 * @author:      zhangm
	 * @param:       ContractApprovalVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-08-02
	 */
	@SecurityValid(resourceCode="R004_01_OPERATION_AUTH")
	@OperateLog(remark="审批项目信息",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updateProjectApprovalStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateProjectApprovalStatus(HttpServletRequest request,
			HttpServletResponse response,ProjectBaseInfoVo vo){
		this.projectApprovalService.updateProjectApprovalStatus(vo);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description: 项目立项信息导入
	 * @author:      zhangm
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-08-02
	 */
	@OperateLog(remark="项目立项信息导入",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value = "/importExcelApproval")
	public String importExcel(HttpServletRequest request, HttpServletResponse response) {
		return IMPORT_EXCEL;
	}
	
	/**
	 * @Description: 导入项目维护信息
	 * @author:      PanXG
	 * @param:       request
	 * @return:      URL
	 * @date:        2017年5月18日
	 */
	@RequestMapping(value="/importProjectApprovalFile",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo importProjectFile(HttpServletRequest request,HttpServletResponse response){
		List<Map<Integer, Collection<?>>> dataList = ImportUtil.excel2007ImportXlsx(request,"myfiles",1);
		List<String> list =this.projectApprovalService.importTitleFile(dataList);
	    return this.returnOperateData(null, list);
	}
	
	/**
	 *  项目立项信息导入模板下载
	 * @author: zhangm
	 * @date: 2018年08月02日
	 * @param request
	 * @param response
	 * @param vo
	 * @return
	 */
	@RequestMapping(value = "/downloadProjectApprovalTemplate")
	public void downloadProjectApprovalTemplate(HttpServletRequest request, HttpServletResponse response) throws IOException{		
		ImportUtil.downloadForFile(response, "file.import.excel.file.name", "label.excel.model");//下载模板
	}
	
	/**
	 *  项目立项跳转详情界面
	 * @author: zhangm
	 * @date: 2018年08月02日
	 * @param request
	 * @param response
	 * @param vo
	 * @return
	 */
	
	@OperateLog(remark="进入客户管理编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/projectApprovalDetail",method=RequestMethod.GET)
	public String projectApprovalDetail(HttpServletRequest request,HttpServletResponse response,
	@RequestParam(value = "id", required = false) String id,
	@RequestParam(value = "operate", required = false) String operate){		
		ProjectBaseInfoVo vo=this.projectApprovalService.queryProjectApprovalfoById(id);
		request.setAttribute("operate",operate);
		request.setAttribute("vo",vo);
		return PROJECCT_APPROVAL_DEAIL;
	}
	
	/**
	 * @Description: 进入监控上传界面
	 * @return URL
	 * @author zhangm
	 * @date:  2018-08-03
	 */
	@OperateLog(remark="进入监控上传界面",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/serviceMoniEdit",method=RequestMethod.GET)
	public String serviceMoniEdit(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "operate", required = false) String operate){
		request.setAttribute("operate",operate);
		return SERVICE_MONI_MANAGER_EDIT;
	}
	
	/**
	 * @Description: 监控文件上传
	 * @return URL
	 * @author zhangm
	 * @date:  2018-08-03
	 */
	@OperateLog(remark="监控文件上传",cateGory=GlobalConstants.CATEGORY_R00401,cateGoryType=GlobalConstants.CATEGORYTYPE_R00401,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/upload",method=RequestMethod.POST) 
    @ResponseBody
    public String fildUpload(HttpServletRequest request,HttpServletResponse response,Model model,@RequestParam(value="moniDucId",required=false)String moniDucId){  
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
				DocumentManageVo serviceTicketVo=new DocumentManageVo();
	    	    serviceTicketVo.setMoniFilename(flieName);
	    	    serviceTicketVo.setMoniFiletype(flieType);
	    	    serviceTicketVo.setFilePath(path);
	    	    moniDucId = EncryptPkUtil.decodeId(moniDucId);
	    	    serviceTicketVo.setMoniDucId(moniDucId);
	    	    this.documentManageService.saveDocumentManage(serviceTicketVo);
	       }
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.syserror"), e);
		}
        request.setAttribute("imagesPath", path); 
        model.addAttribute("imgPath",path);
        request.setAttribute("path",path);
        return path;  
    }
	
	/**
	 * @Description: 保存项目立项信息
	 * @author:      ZHOUMIN
	 * @param:       ProjectManagerVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-19
	 */
	@OperateLog(remark="保存项目维护信息",cateGory=GlobalConstants.CATEGORY_R00406,cateGoryType=GlobalConstants.CATEGORYTYPE_R00406,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveProjectApproval",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveProjectApproval(HttpServletRequest request,
			HttpServletResponse response,ProjectBaseInfoVo vo){
		this.projectApprovalService.saveProjectApproval(vo);
		return this.returnOperateData(null,null);
	}
	

}
