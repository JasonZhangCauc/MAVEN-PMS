package com.ps.dao.taskManage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.systemmanage.DeptVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.result.taskmanage.TaskIssuedVo;


/**
 * @Description:    任务控制台数据访问DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-08-01
 */
public interface TaskIssuedManagerDao{
	
	/**
	 * @Description: 加载组织架构人员信息树
	 * @author:      ZHOUMIN
	 * @param:       projectBaseInfoVo
	 * @return:      projectBaseInfoVo 列表信息
	 * @date:        2018-07-02
	 */
	List<DeptVo> queryDeptUserTree(DeptVo deptVo);
	
	/**
	 * @Description: 根据任务ID获取任务信息
	 * @param:  	 id 任务Id
	 * @return: 	 TaskIssuedVo 任务信息
	 * @author: 	 ZHOUMIN
	 * @date: 		 2018年2月26日
	 */
	TaskIssuedVo queryTaskIssuedById(@Param("id") String id);
	
	/**
	 * @Description: 新增任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo 任务信息
	 * @return:       
	 * @date:        2018年2月26日
	 */
	void insertTaskIssued(TaskIssuedVo vo);

	/**
	 * @Description: 根据ID更新任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo 任务信息
	 * @return:       
	 * @date:        2018年2月26日
	 */
	void updateTaskIssued(TaskIssuedVo vo);
	
	/**
	 * @Description: 根据部门ID加载所有任务信息
	 * @author:      ZHOUMIN
	 * @param:       deptIds
	 * @return:      List<TaskIssuedVo> 列表信息
	 * @date:        2018-07-02
	 */
	List<TaskIssuedVo> queryTaskIssendByDeptId(@Param("deptIds") String deptIds,@Param("taskStatus") String taskStatus);
	
	/**
	 * @Description: 根据用户ID加载所有任务信息
	 * @author:      ZHOUMIN
	 * @param:       deptIds
	 * @return:      List<TaskIssuedVo> 列表信息
	 * @date:        2018-07-02
	 */
	List<TaskIssuedVo> queryTaskIssendByUserId(@Param("userId") String userId,@Param("taskStatus") String taskStatus);
	
	/**
	 * @Description: 根据部门ID加载所有用户信息
	 * @author:      ZHOUMIN
	 * @param:       deptIds
	 * @return:      List<UserVo> 列表信息
	 * @date:        2018-07-02
	 */
	List<UserVo> queryUserByDeptIds(@Param("deptIds") String deptIds);
	
	/**
	 * @Description: 根据ID删除任务
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo
	 * @return:      
	 * @date:        2018-08-01
	 */
	void deleteTaskIssuedById(@Param("id") String id);
	
	/**
	 * @Description: 根据ID更新我的任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo 任务信息
	 * @return:       
	 * @date:        2018年2月26日
	 */
	void updateMyTask(TaskIssuedVo vo);
}
