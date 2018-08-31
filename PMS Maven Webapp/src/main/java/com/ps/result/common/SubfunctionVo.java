package com.ps.result.common;
/**
 * 传递父id，获取数据列表
 * 
 * @author wb085
 * @date 2017-8-31 下午6:26:10
 * @version 1.1.0
 *
 */
public class SubfunctionVo extends PageParaVo<SubfunctionVo>{
	
	private String pId;			//父id
	private String classifyPId; //关联父id

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public String getClassifyPId() {
		return classifyPId;
	}

	public void setClassifyPId(String classifyPId) {
		this.classifyPId = classifyPId;
	}
	
	
}
