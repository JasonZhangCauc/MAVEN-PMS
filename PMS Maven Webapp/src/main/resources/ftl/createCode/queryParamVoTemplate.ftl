package com.${projectName}.param.${packageName};

import com.sms.vo.common.PageParaVo;

/** 
 *@Description: 安全监察报告Param 
 * @author：		${author}
 * @date：		${nowDate?string("yyyy-MM-dd")}
 */
public class ${objectName}ParamVo extends PageParaVo{
	private static final long serialVersionUID = 1L;

	<#list fieldList as var>
	private String ${var.reColName};			//${var.comments}
	</#list>
	
}
