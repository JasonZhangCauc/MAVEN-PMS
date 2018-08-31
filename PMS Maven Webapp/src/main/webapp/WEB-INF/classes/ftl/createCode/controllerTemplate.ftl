package com.${projectName}.controller.${packageName};

import java.util.List;
import java.util.Map;

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
import com.github.pagehelper.PageInfo;
import com.${projectName}.controller.common.BaseController;
import com.${projectName}.service.${packageName}.I${objectName}Service;
import com.${projectName}.vo.common.ListRange;
import com.${projectName}.vo.common.OperateStatusVo;
import com.${projectName}.vo.${packageName}.${objectName}Vo;
import com.${projectName}.param.${packageName}.${objectName}ParamVo;


/** 
 *@Description: 安全监察报告
 * @author：		${author}
 * @date：		${nowDate?string("yyyy-MM-dd")}
 */
@Controller
@RequestMapping(value="/${objectNameLower}")
public class ${objectName}Controller extends BaseController {
	
	@Autowired
	private I${objectName}Service ${objectNameLower}Service;

	//返回页面路径 
	private static final String PAGE_MAIN = "${packageName}/${objectNameLower}Main";//主页面
	private static final String PAGE_EDIT = "${packageName}/${objectNameLower}Edit";//编辑页
	
	
	/**
	 * @Description: 进入安全监察报告主页
	 * @author:      ${author}
	 * @param:       request
	 * @return:      URL
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	@OperateLog(remark="进入安全监察报告主页",cateGory="安全监察报告",cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/${objectNameLower}Main",method=RequestMethod.GET)
	public String ${objectName}Main(HttpServletRequest request,HttpServletResponse response){
		return PAGE_MAIN;
	}
	
	/**
	 * @Description: 查询安全监察报告信息
	 * @author:      ${author}
	 * @param:       ${objectName}Vo
	 * @return:      ListRange数据实体类
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	@RequestMapping(value="/${objectNameLower}InfoByParam",method=RequestMethod.POST)
	@OperateLog(remark="查询安全监察报告信息",cateGory="安全监察报告",cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
	operateType=GlobalConstants.OPERATETYPE_THREE,isDetail=GlobalConstants.ISDETAIL_N)
	@ResponseBody
	public ListRange ${objectNameLower}InfoByParam(HttpServletRequest request,
					HttpServletResponse response,${objectName}ParamVo param){
		param.initDataTableParam(request,true);
		List<${objectName}Vo> dataList =this.${objectNameLower}Service.query${objectName}InfoByParam(param);
		PageInfo<${objectName}Vo> page = new PageInfo<${objectName}Vo>(dataList);
		ListRange lr = new ListRange(page);
		return lr;
	}
	
	/**
	 * @Description: 进入编辑/新增/查看界面
	 * @param  todo
	 * @return URL
	 * @author ${author}
	 * @date:  ${nowDate?string("yyyy-MM-dd")}
	 */
	@OperateLog(remark="进入安全监察报告编辑信息页面",cateGory="安全监察报告",cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
			operateType=GlobalConstants.OPERATETYPE_ZERO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/${objectNameLower}Edit",method=RequestMethod.POST)
	public String ${objectNameLower}Edit(HttpServletRequest request,HttpServletResponse response){
			String id = request.getParameter("id");
			//根据ID查询数据
			${objectName}Vo vo=this.${objectNameLower}Service.query${objectName}InfoById(id);
			request.setAttribute("vo", vo);
			return PAGE_EDIT;
	}
	
	/**
	 * @Description: 保存
	 * @author:      ${author}
	 * @param:       ${objectName}Vo
	 * @return:      OperateStatusVo返回信息
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	@OperateLog(remark="保存安全监察报告信息",cateGory="安全监察报告",cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
			operateType=GlobalConstants.OPERATETYPE_ONE,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/save${objectName}",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo save${objectName}(HttpServletRequest request,
			HttpServletResponse response,${objectName}Vo vo){
			this.${objectNameLower}Service.save${objectName}(vo);
			return this.returnOperateData(null, vo);
	}
	
	/**
	 * @Description: 删除
	 * @author:      ${author}
	 * @param:       id
	 * @return:      OperateStatusVo返回信息
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	@OperateLog(remark="删除安全监察报告信息",cateGory="安全监察报告",cateGoryType=GlobalConstants.CATEGORYTYPE_R00502,
			operateType=GlobalConstants.OPERATETYPE_TWO,isDetail=GlobalConstants.ISDETAIL_N)
	@RequestMapping(value="/delete${objectName}",method=RequestMethod.POST)
	@ResponseBody
	public OperateStatusVo delete${objectName}(HttpServletRequest request,
			HttpServletResponse response){
			String id = request.getParameter("id");
			this.${objectNameLower}Service.delete${objectName}ById(id);
			return this.returnOperateData(null, null);
	}
}