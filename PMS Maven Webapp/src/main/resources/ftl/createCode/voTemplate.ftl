package com.${projectName}.vo.${packageName};

import com.sms.vo.common.PageBaseVo;

/** 
 *@Description: 安全监察报告VO
 * @author：		${author}
 * @date：		${nowDate?string("yyyy-MM-dd")} 
 */
public class ${objectName}Vo extends PageBaseVo{
	private static final long serialVersionUID = 1L;

	<#list fieldList as var>
	private String ${var.reColName};			//${var.comments}
	</#list>
	
}
