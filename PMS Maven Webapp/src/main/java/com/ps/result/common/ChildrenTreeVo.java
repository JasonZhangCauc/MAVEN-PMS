package com.ps.result.common;

import java.util.List;

/**
 * @Description: 表格插件返回数据实体类
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
public class ChildrenTreeVo{
	
	private String name;
	private List<NodeTreeVo> children;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<NodeTreeVo> getChildren() {
		return children;
	}

	public void setChildren(List<NodeTreeVo> children) {
		this.children = children;
	}

	public ChildrenTreeVo(String name,List<NodeTreeVo> children) {
		 this.name=name;
		 this.children=children;
	}
	
}