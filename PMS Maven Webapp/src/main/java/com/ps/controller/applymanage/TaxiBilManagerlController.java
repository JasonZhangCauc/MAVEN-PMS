package com.ps.controller.applymanage;

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
import com.ps.result.applymanage.TaxiBillVo;
import com.ps.result.common.ListRange;
import com.ps.result.common.OperateStatusVo;
import com.ps.service.applymanage.TaxiBillManagerService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description: 打车报销
 * @author:   	 zlshi
 * @date:        2018-8-2 
 *
 */
@Controller
@RequestMapping("/applyManage")
public class TaxiBilManagerlController extends BaseController{

	@Autowired
	private TaxiBillManagerService taxiBillService;
	
	//返回页面路径
	private static final String TAXI_BILL_MAIN = "applyManage/taxiApplyManage/taxiApplyMain";//打车报销主页面
	private static final String TAXI_BILL_EDIT = "applyManage/taxiApplyManage/taxiApplyEdit";//打车报销编辑/新增
	
	/**
	 * @Description:   进入打车报销主页
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-3
	 */
	@OperateLog(remark="进入打车报销主页",cateGory=GlobalConstants.CATEGORY_R01102,cateGoryType=GlobalConstants.CATEGORYTYPE_R01102,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/taxiApplyMain",method=RequestMethod.GET)
	public String taxiApplyMain(HttpServletRequest request,HttpServletResponse response){
		return TAXI_BILL_MAIN;
	}
	
	/**
	 * 
	 * @Description:   进入打车报销编辑/新增页
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-3
	 */
	@SecurityValid(resourceCode="R011_02_OPERATION_EDIT")
	@OperateLog(remark="进入打车报销编辑页",cateGory=GlobalConstants.CATEGORY_R01102,cateGoryType=GlobalConstants.CATEGORYTYPE_R01102,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/taxiApplyEdit",method=RequestMethod.GET)
	public String taxiApplyEdit(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = false) String operate){
		TaxiBillVo tbVO = taxiBillService.getTaxiBillByID(id);
		request.setAttribute("vo", tbVO);
		request.setAttribute("operate", operate);
		return TAXI_BILL_EDIT;
	}
	
	
	/**
	 * @Description:   按条件查询打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        List<TaxiBillVO>
	 * @date:		   2018-8-2
	 */
	@RequestMapping(value = "/getAllTaxiBill", method = RequestMethod.POST)
	@ResponseBody
	public ListRange getAllTaxiBill(HttpServletRequest request,
			HttpServletResponse response,TaxiBillVo tbVO){
		//数据权限
		tbVO.initDataAuthByCode(request,"R011_02_DATA");
		tbVO.initDataTableParam(request);
		tbVO.setProjectId(EncryptPkUtil.decodeId(tbVO.getProjectId()));
		List<TaxiBillVo> list = this.taxiBillService.getAllTaxiBill(tbVO);
		PageInfo<TaxiBillVo> page = new PageInfo<TaxiBillVo>(list);
		ListRange lr = new ListRange(tbVO,page);
		return lr;
	}

	/**
	 * @Description:   保存打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-2
	 */
	@SecurityValid(resourceCode="R011_02_OPERATION_EDIT")
	@RequestMapping(value = "/saveTaxiBill", method = RequestMethod.POST)
	@ResponseBody
	public void saveTaxiBill(HttpServletRequest request,
			HttpServletResponse response,TaxiBillVo tbVO){
		taxiBillService.saveTaxiBill(tbVO);
	}
	
	/**
	 * @Description:   删除打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-2
	 */
	@SecurityValid(resourceCode="R011_02_OPERATION_DEL")
	@RequestMapping(value = "/deleteTaxiBill", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo deleteTaxiBill(HttpServletRequest request,
			HttpServletResponse response,TaxiBillVo tbVO){
		taxiBillService.deleteTaxiBill(tbVO);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description:   更新打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-2
	 */
	@SecurityValid(resourceCode="R011_02_OPERATION_COMMIT")
	@RequestMapping(value = "/updateTaxiBill", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo updateTaxiBill(HttpServletRequest request,
			HttpServletResponse response,TaxiBillVo tbVO){
		taxiBillService.updateTaxiBill(tbVO);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description:   提交打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-2
	 */
	@SecurityValid(resourceCode="R011_02_OPERATION_COMMIT")
	@RequestMapping(value = "/submitTaxiBill", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo submitTaxiBill(HttpServletRequest request,
			HttpServletResponse response,TaxiBillVo tbVO){
		tbVO.setTaxibillStatus("1");
		taxiBillService.updateTaxiBillStatus(tbVO);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description:   拒绝打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-2
	 */
	@SecurityValid(resourceCode="R011_02_OPERATION_COMMIT")
	@RequestMapping(value = "/refusedTaxiBill", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo refusedTaxiBill(HttpServletRequest request,
			HttpServletResponse response,TaxiBillVo tbVO){
		tbVO.setTaxibillStatus("0");
		taxiBillService.updateTaxiBillStatus(tbVO);
		return this.returnOperateData(null, null);
	}
	
	/**
	 * @Description:   审核通过打车报销单
	 * @author:        zlshi
	 * @param:         request
	 * @return:        URL
	 * @date:		   2018-8-2
	 */
	@SecurityValid(resourceCode="R011_02_OPERATION_COMMIT")
	@RequestMapping(value = "/auditTaxiBill", method = RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo auditTaxiBill(HttpServletRequest request,
			HttpServletResponse response,TaxiBillVo tbVO){
		tbVO.setTaxibillStatus("2");
		taxiBillService.updateTaxiBillStatus(tbVO);
		return this.returnOperateData(null, null);
	}

}

