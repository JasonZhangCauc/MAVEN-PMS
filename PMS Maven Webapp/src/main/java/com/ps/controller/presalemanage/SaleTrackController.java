package com.ps.controller.presalemanage;

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
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.result.presalemanage.SaleTrackVo;
import com.ps.service.presalemanage.ISaleTrackService;


/** 
 * @Description:销售跟踪
 * @author：		raomingyi
 * @date：		2018-03-09
 */
@Controller
@RequestMapping(value="/preSalesManage")
public class SaleTrackController extends BaseController {
	
	@Autowired
	private ISaleTrackService saleTrackService;

	//返回页面路径 
	private static final String SALE_PAGE_MAIN = "preSalesManage/saletrack/saleTrackMain";//销售跟踪主页面
	private static final String SALE_PAGE_EDIT = "preSalesManage/saletrack/saleTrackEdit";//销售跟踪编辑页
	private static final String SALE_PAGE_LOOK = "preSalesManage/saletrack/saleTrackLook";//销售跟踪查看页
	
	
	/**
	 * @Description: 进入销售跟踪主页
	 * @author:      raomingyi
	 * @param:       request
	 * @return:      URL
	 * @date:        2018-03-09
	 */
	@SecurityValid(resourceCode=GlobalConstants.CATEGORYTYPE_R00202)
	@OperateLog(remark="进入销售跟踪主页",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saleTrackMain",method=RequestMethod.GET)
	public String SaleTrackMain(HttpServletRequest request,HttpServletResponse response){
		return  SALE_PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询销售跟踪信息
	 * @author:      raomingyi
	 * @param:       SaleTrackVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-09
	 */
	@RequestMapping(value="/saleTrackInfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询销售跟踪信息",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange saleTrackInfoByParam(HttpServletRequest request,
					HttpServletResponse response,SaleTrackVo param){
		param.initDataTableParam(request);
		List<SaleTrackVo> dataList =this.saleTrackService.querySaleTrackInfoByParam(param);
		PageInfo<SaleTrackVo> page = new PageInfo<SaleTrackVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入销售跟踪编辑/新增/查看界面
	 * @param  
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-09
	 */
	@OperateLog(remark="进入销售跟踪编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saleTrackEdit",method=RequestMethod.GET)
	public String saleTrackEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="id",required=false)String id,
			@RequestParam(value = "operate", required = false) String operate){			
			//根据ID查询数据
			SaleTrackVo vo=this.saleTrackService.querySaleTrackInfoById(id);
			request.setAttribute("vo", vo);
			request.setAttribute("operate",operate);
			return  SALE_PAGE_EDIT;
	}
	
	/**
	 * @Description: 查看界面
	 * @param  
	 * @return URL
	 * @author zhangm
	 * @date:  2018-08-10
	 */
	@OperateLog(remark="进入销售跟踪编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saleTrackLook",method=RequestMethod.GET)
	public String saleTrackLook(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="id",required=false)String id,
			@RequestParam(value = "operate", required = false) String operate){			
			//根据ID查询数据
			SaleTrackVo vo=this.saleTrackService.querySaleTrackInfoById(id);
			request.setAttribute("vo", vo);
			request.setAttribute("operate",operate);
			return  SALE_PAGE_LOOK;
	}
	
	/**
	 * @Description: 保存销售跟踪信息
	 * @author:      raomingyi
	 * @param:       SaleTrackVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-09
	 */
	 @SecurityValid(resourceCode="R002_02_OPERATION_EDIT")
	@OperateLog(remark="保存销售跟踪信息",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveSaleTrack",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveSaleTrack(HttpServletRequest request,
			HttpServletResponse response,SaleTrackVo vo){
			this.saleTrackService.saveSaleTrack(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除销售跟踪信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-09
	 */
	 @SecurityValid(resourceCode="R002_02_OPERATION_DELP")
	@OperateLog(remark="删除销售跟踪信息",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteSaleTrack",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteSaleTrack(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=true)String id){
			this.saleTrackService.deleteSaleTrackById(id);
			return this.returnOperateData(null, null);
	}
}