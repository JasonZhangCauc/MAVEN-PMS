package com.ps.result.systemmanage;

import java.io.Serializable;
import java.util.List;

/**
 * @Description: 资源关系实体类
 * @author: HuangPeng
 * @date: 2017年7月28日
 */
public class ResourceNodeVo implements Serializable {
	
	private static final long serialVersionUID = -7780679957569654380L;
	private int id;
	private int pId;
	private String name;
	private String url;
	private List<ResourceNodeVo> children;
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getpId() {
		return pId;
	}

	public void setpId(int pId) {
		this.pId = pId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public List<ResourceNodeVo> getChildren() {
		return children;
	}

	public void setChildren(List<ResourceNodeVo> children) {
		this.children = children;
	}

}
