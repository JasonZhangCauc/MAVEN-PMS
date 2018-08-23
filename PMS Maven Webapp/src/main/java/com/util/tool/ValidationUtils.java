package com.util.tool;

import java.util.HashMap;
import java.util.Map;
import java.util.Set;

import javax.validation.ConstraintViolation;
import javax.validation.Validator;
import javax.validation.groups.Default;

import org.apache.commons.collections.CollectionUtils;

import com.ps.result.common.ValidationResult;

/**
 * @Description 后端校验工具类   
 * @author zhujiejie
 * @date  2017年9月1日
 */
public class ValidationUtils {

	
	private static Validator validator =  (Validator) AppUtil.getBean("validator");
	
	/**
	 * @Description 校验实体的方法
	 * @param obj 需要校验的实体
	 * @return 校验结果
	 * @author zhujiejie
	 * @date 2017年9月1日
	 */
	public static <T> ValidationResult validateEntity(T obj){
		ValidationResult result = new ValidationResult();
		 Set<ConstraintViolation<T>> set = validator.validate(obj,Default.class);
		 if( CollectionUtils.isNotEmpty(set) ){
			 result.setHasErrors(true);
			 Map<String,String> errorMsg = new HashMap<String,String>();
			 for(ConstraintViolation<T> cv : set){
				 errorMsg.put(cv.getPropertyPath().toString(), cv.getMessage());
			 }
			 result.setErrorMsg(errorMsg);
		 }
		 return result;
	}
	
	/**
	 * @Description 校验实体对象的某一个属性
	 * @param obj 需要校验的实体
	 * @param propertyName 需要校验的实体属性
	 * @return 校验结果
	 * @author zhujiejie
	 * @date 2017年9月1日
	 */
	public static <T> ValidationResult validateProperty(T obj,String propertyName){
		ValidationResult result = new ValidationResult();
		 Set<ConstraintViolation<T>> set = validator.validateProperty(obj,propertyName,Default.class);
		 if( CollectionUtils.isNotEmpty(set) ){
			 result.setHasErrors(true);
			 Map<String,String> errorMsg = new HashMap<String,String>();
			 for(ConstraintViolation<T> cv : set){
				 errorMsg.put(propertyName, cv.getMessage());
			 }
			 result.setErrorMsg(errorMsg);
		 }
		 return result;
	}
}
