package com.ps.dao.systemmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.systemmanage.DeptVo;

/**
 * @Description:    组织架构维护数据访问接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-06
 */
public interface DeptManagerDao{
	
	/**
	 * @Description: 根据查询条件获取所有组织架构信息
	 * @author:      ZHOUMIN
	 * @param:       DeptVo 组织架构信息
	 * @return:      List<DeptVo> 组织架构信息集合
	 * @date:        2018-03-06
	 */
    List<DeptVo> queryDeptInfoByParam(DeptVo vo);
	
	/**
	 * @Description: 新增组织架构信息
	 * @author:      ZHOUMIN
	 * @param:       DeptManagerVo
	 * @date:        2018-03-06
	 */
	public void insertDept(DeptVo vo);
	
	/**
	 * @Description: 修改组织架构信息
	 * @author:      ZHOUMIN
	 * @param:       DeptManagerVo
	 * @date:        2018-03-06
	 */
	public void updateDept(DeptVo vo);
	
	/**
	 * @Description: 根据ID修改组织架构状态
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-03-06
	 */
	public void updateDeptFlagById(@Param("id")String id);
	
	/**
	 * @Description: 根据查询条件获取所有组织架构信息
	 * @author:      ZHOUMIN
	 * @param:       
	 * @return:      List<DeptVo> 组织架构信息集合
	 * @date:        2018-03-06
	 */
    List<DeptVo> initDeptData();
}
