package com.ps.controller.checkinginmanage;

import java.util.ArrayList;
import java.util.List;

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
import com.ps.result.checkinginmanage.ChickinBaseInfoVo;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.service.checkinginmanage.IChickinBaseInfoService;


/**
 * 
 * @Description: 打卡记录Controller
 * CheckinginManagementController
 * @author：JasonZhang
 * @date：2018-8-2-下午4:29:25 
 *
 */
@Controller
@RequestMapping(value="/checkinginManage")
public class CheckinginManagementController extends BaseController  {
	
	@Autowired
	private IChickinBaseInfoService chickinBaseInfoService; //打卡记录业务处理
	
	//me
	private static final String CHICKIN_BASEINFO_MAIN = "/checkinginManage/chickinBaseinfoManager/chickinBaseinfoMain";//打卡记录主页面
	
	private static final String CHICKIN_BASEINFO_EDIT = "/checkinginManage/chickinBaseinfoManager/chickinBaseinfoEdit";//项目维护编辑界面

	/**
	 * 
	 * @Description:进入打卡记录主页
	 * @author：JasonZhang 
	 * @date：2018-8-2-下午4:30:49 
	 * @param request
	 * @param response
	 * @return String
	 * @exception
	 */
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R01201)
	@OperateLog(remark="进入出勤记录页面",cateGory=GlobalConstants.CATEGORY_R01201,cateGoryType=GlobalConstants.CATEGORYTYPE_R01201,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/cardRecordMain",method=RequestMethod.GET)//projectBaseInfoMain
	public String ChickinMain(HttpServletRequest request,HttpServletResponse response){
		return CHICKIN_BASEINFO_MAIN;
	}
	
	
	/**
	 * 
	 * @Description: 根据ID查询打卡记录信息
	 * @author：JasonZhang 
	 * @date：2018-8-3-下午12:29:12 
	 * @param request
	 * @param response
	 * @param param
	 * @return ListRange
	 * @exception
	 */
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R01201)
	@RequestMapping(value="/querychickinBaseInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询打卡记录信息",cateGory=GlobalConstants.CATEGORY_R01201,cateGoryType=GlobalConstants.CATEGORYTYPE_R01201,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange querychickinBaseInfoByParam(HttpServletRequest request,
					HttpServletResponse response,ChickinBaseInfoVo param){
		//数据权限
		param.initDataAuthByCode(request, "R012_01_DATA");
		param.initDataTableParam(request);
		List<ChickinBaseInfoVo> dataList =this.chickinBaseInfoService.querychickinBaseInfoByParam(param);
		PageInfo<ChickinBaseInfoVo> page = new PageInfo<ChickinBaseInfoVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	
	/**
	 * 
	 * @Description:用户打卡成功记录
	 * @author：JasonZhang 
	 * @date：2018-8-3-下午12:29:30 
	 * @param request
	 * @param response
	 * @param vo
	 * @return List<ChickinBaseInfoVo>
	 * @exception
	 */
	@SecurityValid(resourceCode="R012_01_OPERATION_EDIT")
	@RequestMapping(value="/doChickin",method=RequestMethod.POST)
	@ResponseBody
	public List<ChickinBaseInfoVo> searchSalesActivityList(HttpServletRequest request,
			HttpServletResponse response,ChickinBaseInfoVo vo){
		List<ChickinBaseInfoVo> list = new ArrayList<ChickinBaseInfoVo>();
		chickinBaseInfoService.saveChickinBaseInfo(vo);
		return list;
	}
	
	/**
	 * 
	 * @Description:删除打卡记录信息
	 * @author：JasonZhang 
	 * @date：2018-8-3-下午6:14:24 
	 * @param request
	 * @param response
	 * @param id
	 * @return OperateStatusVo
	 * @exception
	 */
	@SecurityValid(resourceCode="R012_01_OPERATION_DEL")
	@OperateLog(remark="删除打卡记录信息",cateGory=GlobalConstants.CATEGORY_R01201,cateGoryType=GlobalConstants.CATEGORYTYPE_R01201,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteChickin",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteChickin(HttpServletRequest request,
			HttpServletResponse response,@RequestParam("id") String id){
		this.chickinBaseInfoService.deleteChickinBaseInfoById(id);
		return this.returnOperateData(null, null);
	}
	
	
	/**
	 * 
	 * @Description:进入打卡记录编辑/新增/查看界面
	 * @author：JasonZhang 
	 * @date：2018-8-3-下午8:20:37 
	 * @param request
	 * @param response
	 * @param id
	 * @param operate
	 * @return String
	 * @exception
	 */
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R01201)
	@OperateLog(remark="进入打卡记录编辑/新增/查看界面",cateGory=GlobalConstants.CATEGORY_R01201,cateGoryType=GlobalConstants.CATEGORYTYPE_R01201,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/chickinBaseInfoEdit",method=RequestMethod.GET)
	public String otherCostManagerEdit(HttpServletRequest request,HttpServletResponse response,
		@RequestParam(value = "id", required = false) String id,
		@RequestParam(value = "operate", required = true) String operate)
	{
		ChickinBaseInfoVo vo=this.chickinBaseInfoService.queryChickinBaseInfoInfoById(id);
		request.setAttribute("operate",operate);
		request.setAttribute("vo",vo);
		return CHICKIN_BASEINFO_EDIT;
	}
	
	
	
	
	/**
	 * 
	 * @Description: 保存补签记录
	 * @author：JasonZhang 
	 * @date：2018-8-7-下午4:15:41 
	 * @param request
	 * @param response
	 * @param vo
	 * @return OperateStatusVo
	 * @exception
	 */
	@SecurityValid(resourceCode="R012_01_OPERATION_EDIT")
	@OperateLog(remark="保存项目维护信息",cateGory=GlobalConstants.CATEGORY_R01201,cateGoryType=GlobalConstants.CATEGORYTYPE_R01201,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveChickinBaseInfo",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveInsertChickBaseInfo(HttpServletRequest request,
			HttpServletResponse response,ChickinBaseInfoVo vo){
		this.chickinBaseInfoService.saveInsertChickinBaseInfo(vo);
		return this.returnOperateData(null,null);
	}
	
	/**
	 * 
	 * @Description: 审批考勤
	 * @author：JasonZhang 
	 * @date：2018-8-7-下午4:15:41 
	 * @param request
	 * @param response
	 * @param vo
	 * @return OperateStatusVo
	 * @exception
	 */
	@SecurityValid(resourceCode="R012_01_OPERATION_AUTH")
	@OperateLog(remark="审批项目信息",cateGory=GlobalConstants.CATEGORY_R01201,cateGoryType=GlobalConstants.CATEGORYTYPE_R01201,
	operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/updatechickinStatus",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updatechickinStatus(HttpServletRequest request,
		HttpServletResponse response,ChickinBaseInfoVo vo){
		vo.setChickinState(GlobalConstants.TWO);//审核通过
	this.chickinBaseInfoService.updatechickinStatus(vo);
	return this.returnOperateData(null, null);
	}
	
}
