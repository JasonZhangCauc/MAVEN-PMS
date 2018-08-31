package com.ps.dao.common;

import java.util.List;

import com.ps.result.systemmanage.ResourceVo;

/**
 * @Description:    资源类数据访问接口类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
public interface ResourceDao {

	/**
	 * @Description 获取所有的资源
	 * @author HuangPeng
	 * @date 2016年8月25日
	 */
	public List<ResourceVo> getAllResource();

}
