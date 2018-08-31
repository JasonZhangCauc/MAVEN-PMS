package com.ps.service.systemmanage;

import java.util.List;

import com.ps.result.systemmanage.DeptVo;

/**
 * @Description:    组织架构维护业务接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-06
 */
public interface IDeptManagerService {
	/**
	 * @Description: 保存组织架构信息
	 * @author:      ZHOUMIN
	 * @param:       DeptManagerVo   
	 * @date:        2018-03-06
	 */
	void saveDept(DeptVo vo);
	
	/**
	 * @Description: 根据ID修改组织架构状态
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-06
	 */
	void updateDeptFlagById(String id);
	
	/**
	 * @Description: 根据查询条件获取所有组织架构信息
	 * @author:      ZHOUMIN
	 * @param:       DeptVo 组织架构信息
	 * @return:      List<DeptVo> 组织架构信息集合
	 * @date:        2018-03-06
	 */
    List<DeptVo> loadDeptResourceTree(DeptVo vo);
    
    /**
	 * @Description: 初始化部门信息
	 * @author:      ZHOUMIN
	 * @param:       
	 * @return:      List<DeptVo> 组织架构信息集合
	 * @date:        2018-03-06
	 */
    List<DeptVo> initDeptData();
}

