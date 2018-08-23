package com.ps.controller.applymanage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
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
import com.ps.result.applymanage.ReimburseVo;
import com.ps.result.common.ListRange;
import com.ps.service.applymanage.IReimburseManagerService;


/**
 * @Description: 报销管理Controller
 * @author 		 lanjunjie
 * @date: 		 2018-8-2
 */
@Controller
@RequestMapping("/applyManage")
public class ReimburseManagerController extends BaseController{
	
	@Autowired
	IReimburseManagerService reimburseManagerService;
	
	private static final String REIMBURSE_MANAGE_MAIN = "applyManage/reimburseManage/evectionApplyMain";//差旅报销管理主页面
	private static final String REIMBURSE_MANAGE_EDIT = "applyManage/reimburseManage/evectionApplyEdit";//差旅报销添加/编辑主页面
	
	
	
	/**
	 * @Description: 进入差旅报销管理主页面
	 * @author lanjunjie
	 * @param:
	 * @return: url
	 * @date: 2018-8-2
	 */
	@SecurityValid(resourceCode="R011_01")
	@OperateLog(remark="进入差旅报销信息维护页面",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/evectionApplyMain",method=RequestMethod.GET)
	public String reimburseManageMain(HttpServletResponse response,HttpServletRequest request){
		return REIMBURSE_MANAGE_MAIN;
	}
	
	/**
	 * @Description: 打开差旅报销编辑页面
	 * @author lanjunjie
	 * @param:
	 * @return: URL
	 * @date: 2018-8-3
	 */
	@SecurityValid(resourceCode="R011_01_OPERATION_EDIT")
	@OperateLog(remark="进入差旅报销信息添加/编辑/查看页面",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/evectionApplyEdit",method=RequestMethod.GET)
	public String reimburseManageEdit(HttpServletResponse response,HttpServletRequest request,
			@RequestParam(value = "id", required = false) String id,
			@RequestParam(value = "operate", required = true) String operate){
		ReimburseVo vo = reimburseManagerService.queryReimburseInfoById(id);
		request.setAttribute("operate", operate);
		request.setAttribute("vo", vo);
		return REIMBURSE_MANAGE_EDIT;
	}
	
	
	/**
	 * @Description: 根据查询条件获取报销申请信息
	 * @author 		 lanjunjie
	 * @param:       ReimburseVo 报销申请信息
	 * @return:		 List<ReimburseVo> 报销申请信息集合
	 * @date: 		 2018-8-2
	 */
	@SecurityValid(resourceCode="R011_01")
	@OperateLog(remark="获取差旅报销信息列表",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/queryReimburseVoInfoByParam",method=RequestMethod.POST)
	@ResponseBody
	public ListRange queryUserInfoByParam(ReimburseVo vo,HttpServletRequest request,HttpServletResponse response){
		//数据权限
		vo.initDataAuthByCode(request, "R011_01_DATA");
		//参数设置
		vo.initDataTableParam(request);
		//根据参数获取报销申请信息列表
		List<ReimburseVo> list = reimburseManagerService.queryReimburseInfoByParam(vo);
		//分页
		PageInfo<ReimburseVo> page = new PageInfo<>(list);
		ListRange lr = new ListRange(vo,page);
		return lr;	
	}
	
	
	/**
	 * @Description: 根据id获取报销申请单数据
	 * @author lanjunjie
	 * @param: id 报销申请单序列号
	 * @return: ReimburseVo 报销申请单详细信息
	 * @date: 2018-8-2
	 */
	@SecurityValid(resourceCode="R011_01")
	@OperateLog(remark="获取差旅报销申请详细信息",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/queryReimburseInfoById",method=RequestMethod.POST)
	@ResponseBody
	public Object queryReimburseInfoById(@Param("id")String id, HttpServletRequest request,HttpServletResponse response){
		//数据权限
		return reimburseManagerService.queryReimburseInfoById(id);
	}
	
	/**
	 * 
	 * @Description: 添加新的报销申请信息
	 * @author lanjunjie
	 * @param: ReimburseVo 报销申请信息
	 * @return:	map 操作结果
	 * @date: 2018-8-2
	 */
	@SecurityValid(resourceCode="R011_01_OPERATION_EDIT")
	@OperateLog(remark="保存差旅报销申请信息",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/saveReimburse",method=RequestMethod.POST)
	@ResponseBody
	public void saveReimburse(ReimburseVo vo,HttpServletResponse response,HttpServletRequest request){
		reimburseManagerService.saveReimbures(vo);	
	}
	
	/**
	 * 
	 * @Description: 根据id删除对应申请单
	 * @author lanjunjie
	 * @param: id 报销申请数据唯一标识码
	 * @return: 
	 * @date: 2018-8-2
	 */
	@SecurityValid(resourceCode="R011_01_OPERATION_DEL")
	@OperateLog(remark="删除差旅报销信息",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/deleteReimburseInfoById",method=RequestMethod.POST)
	@ResponseBody
	public Object deleteReimburseInfoById(@Param("id") String id,HttpServletRequest request){
		reimburseManagerService.deleteReimburseInfoById(id);
		return null;
	}
	
	
	/**
	 * @Description:	更新报销申请状态
	 * @author 			lanjunjie
	 * @param:			vo 报销申请信息
	 * @return:			
	 * @date: 			2018-8-7
	 */
	@SecurityValid(resourceCode="R011_01_OPERATION_COMMIT")
	@OperateLog(remark="提交差旅报销申请状态",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/commitReimburse",method=RequestMethod.POST)
	@ResponseBody
	void commitReimburse(ReimburseVo vo,HttpServletRequest request,
			HttpServletResponse response){
		reimburseManagerService.updateReimburseStatus(vo);
	}
	
	/**
	 * @Description: 审核报销申请信息
	 * @author lanjunjie
	 * @param:	vo 报销申请信息
	 * @return:
	 * @date: 2018-8-8
	 */
	@SecurityValid(resourceCode="R011_01_OPERATION_AUDIT")
	@OperateLog(remark="审核差旅报销申请状态",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/auditReimburse",method=RequestMethod.POST)
	@ResponseBody
	void auditReimburse(ReimburseVo vo,HttpServletRequest request,
			HttpServletResponse response){
		reimburseManagerService.updateReimburseStatus(vo);
	}
	
	/**
	 * @Description: 批准报销申请信息
	 * @author lanjunjie
	 * @param:	vo 报销申请信息
	 * @return:
	 * @date: 2018-8-8
	 */
	@SecurityValid(resourceCode="R011_01_OPERATION_RATIFY")
	@OperateLog(remark="批准差旅报销申请状态",cateGory=GlobalConstants.CATEGORY_R01101,cateGoryType=GlobalConstants.CATEGORYTYPE_R01101,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/ratifyReimburse",method=RequestMethod.POST)
	@ResponseBody
	void ratifyReimburse(ReimburseVo vo,HttpServletRequest request,
			HttpServletResponse response){
		reimburseManagerService.updateReimburseStatus(vo);
	}

}
