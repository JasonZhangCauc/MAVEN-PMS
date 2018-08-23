package com.aop.log;

import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * @Description:    aop自定义注解
 * @author:         011770
 * @date:           2018年2月5日
 */
@Target({ElementType.METHOD})
@Retention(RetentionPolicy.RUNTIME)
@Documented
@Inherited
public @interface  OperateLog {
	String remark() default "";      //功能操作描述
	String cateGory() default "";    //功能描述
	String cateGoryType() default "";//功能类型
	String operateType() default ""; //操作类型：  0为进入页面 、 1为保存 、2为删除、3为重要操作、4查询、5 邮件、6 系统
	int isDetail();                  //是否为子表  1是0否
}
