package com.ps.result.common;



/**
 * @Description: 表格插件返回数据实体类
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
public class NodeTreeVo{
	
	private String id;
	private String name;
	private String target;
	private String url;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTarget() {
		return target;
	}
	public void setTarget(String target) {
		this.target = target;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	 
	public NodeTreeVo(){}
	public NodeTreeVo(String id,String name,String target,String url) {
		 this.id=id;
		 this.name=name;
		 this.target=target;
		 this.url=url;
	}
}