package com.ps.controller.presalemanage;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
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
import com.ps.result.presalemanage.SalesActivityVo;
import com.ps.service.presalemanage.ISalesActivityService;


/** 
 * @Description: 销售活动
 * @author：		raomingyi
 * @date：		2018-03-02
 */
@Controller
@RequestMapping(value="/preSalesManage")
public class SalesActivityController extends BaseController {
	
	@Autowired
	private ISalesActivityService salesActivityService;

	//返回页面路径 
	private static final String ACTIVITY_PAGE_EDIT = "preSalesManage/saletrack/saleActivityEdit";//销售活动编辑页
	
	
	/**
	 * @Description: 查询销售活动信息
	 * @author:      raomingyi
	 * @param:       SalesActivityVo
	 * @return:      ListRange数据实体类
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/salesActivityByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询销售活动信息",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange salesActivityByParam(HttpServletRequest request,
					HttpServletResponse response,SalesActivityVo param){
		param.initDataTableParam(request);
		List<SalesActivityVo> dataList =this.salesActivityService.querySalesActivityByParam(param);
		PageInfo<SalesActivityVo> page = new PageInfo<SalesActivityVo>(dataList);
		ListRange lr = new ListRange(param,page);
		return lr;
	}
	
	/**
	 * @Description: 进入销售活动编辑/新增/查看界面
	 * @param  ID
	 * @return URL
	 * @author raomingyi
	 * @date:  2018-03-02
	 */
	@OperateLog(remark="进入销售活动编辑信息页面",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/salesActivityEdit",method=RequestMethod.GET)
	public String salesActivityEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value="id",required=false)String id,
			@RequestParam(value="salesprojectId",required=false) String salesprojectId,
			@RequestParam(value = "operate", required = false) String operate){	
					
			//根据ID查询数据  		     
		    SalesActivityVo vo=this.salesActivityService.querySalesActivityById(id);
		    //新增项目活动，获取项目ID
			if(StringUtils.isBlank(id)){
				 vo.setSalesprojectId(salesprojectId);  	
			}
			request.setAttribute("vo", vo);
			request.setAttribute("operate",operate);
			return ACTIVITY_PAGE_EDIT;
	}
	
	/**
	 * @Description: 销售活动保存
	 * @author:      raomingyi
	 * @param:       SalesActivityVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-02
	 */
	@SecurityValid(resourceCode="R002_02_OPERATION_EDITH")
	@OperateLog(remark="保存销售活动",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveSalesActivity",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo saveSalesActivity(HttpServletRequest request,
			HttpServletResponse response,SalesActivityVo vo){
			this.salesActivityService.saveSalesActivity(vo);
			return this.returnOperateData(null, vo);
	}
	
	
	/**
	 * @Description: 销售活动查询
	 * @author:      raomingyi
	 * @param:       SalesActivityVo
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-02
	 */
	@RequestMapping(value="/searchSalesActivityList",method=RequestMethod.POST)
	@ResponseBody
	public List<SalesActivityVo> searchSalesActivityList(HttpServletRequest request,
			HttpServletResponse response,SalesActivityVo vo){
		List<SalesActivityVo> list = new ArrayList<SalesActivityVo>();
		list = this.salesActivityService.querySalesActivityByParam(vo);
		return list;
	}
	
	/**
	 * @Description: 销售活动删除
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        2018-03-02
	 */
	@SecurityValid(resourceCode="R002_02_OPERATION_EDITH")
	@OperateLog(remark="删除销售活动",cateGory=GlobalConstants.CATEGORY_R00202,cateGoryType=GlobalConstants.CATEGORYTYPE_R00202,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteSalesActivity",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteSalesActivity(HttpServletRequest request,
			HttpServletResponse response,
			@RequestParam(value="id",required=true)String id){
			this.salesActivityService.deleteSalesActivityById(id);
			return this.returnOperateData(null, null);
	}
}