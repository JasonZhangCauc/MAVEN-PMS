package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.ProjectBaseInfoVo;


/**
 * @Description:    项目立项DAO接口 
 * @author:         zhangm
 * @date:           2018-08-02
 */
public interface ProjectApprovalDao {
	
	/**
	 * @Description: 根据参数查询项目维护列表信息
	 * @author:      zhangm
	 * @param:       projectBaseInfoVo
	 * @return:      projectBaseInfoVo 列表信息
	 * @date:        2018-08-02
	 */
	List<ProjectBaseInfoVo> queryProjectApprovalByParam(ProjectBaseInfoVo param);
	
	/**
	 * @Description: 根据ID查询项目维护列表信息
	 * @author:      zhangm
	 * @param:       id
	 * @return:      projectBaseInfoVo 数据信息
	 * @date:        2018-08-02
	 */
	public ProjectBaseInfoVo queryProjectApprovalfoById(@Param("id")String id);
	
	/**
	 * @Description: 删除项目立项信息
	 * @author:      zhangm
	 * @param:       id
	 * @date:        2018-08-02
	 */
	public void deleteProjectApproval(@Param("id")String id);
	
	/**
	 * @Description: 审核项目
	 * @author:      zhangm
	 * @param:       id 
	 * @date:        2018-08-02
	 */
	void updateProjectApprovalStatus(ProjectBaseInfoVo projectBaseInfoVo);
	
	/**
	 * @Description: 根据用户查询用户id
	 * @author:      zhangm
	 * @param:       id 
	 * @date:        2018-08-02
	 */
	String getUserIdByUserName(@Param("userNames")String userNames);
	
	/**
	 * @Description: 新增项目立项信息
	 * @author:      zhangm
	 * @param:       projectBaseInfoVo
	 * @date:        2018-08-02
	 */
	public void insertProjectApproval(ProjectBaseInfoVo vo);
	
	/**
	 * @Description: 修改项目立项信息
	 * @author:      zhangm
	 * @param:       projectBaseInfoVo
	 * @date:        2018-08-02
	 */
	public void updateProjectApproval(ProjectBaseInfoVo vo);
	

}
