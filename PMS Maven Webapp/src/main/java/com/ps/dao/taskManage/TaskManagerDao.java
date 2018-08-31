package com.ps.dao.taskManage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.taskmanage.TaskVo;

/**
 * @Description:    任务数据访问DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-15
 */
public interface TaskManagerDao{
	
	/**
	 * @Description: 根据参数查询任务列表信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @return:      TaskVo 列表信息
	 * @date:        2018-03-15
	 */
	List<TaskVo> queryTaskInfoByParam(TaskVo param);
	
	/**
	 * @Description: 根据ID查询任务信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      TaskVo 数据信息
	 * @date:        2018-03-15
	 */
	public TaskVo queryTaskById(@Param("id")String id);
	
	/**
	 * @Description: 新增任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @date:        2018-03-15
	 */
	public void insertTask(TaskVo vo);
	
	/**
	 * @Description: 修改任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @date:        2018-03-15
	 */
	public void updateTask(TaskVo vo);
	
	/**
	 * @Description: 修改任务有效性
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-03-15
	 */
	public void updateStatusById(@Param("id")String id);
	
	/**
	 * @Description: 修改任务发送状态
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-03-15
	 */
	public void updateSendStatusById(@Param("id")String id,@Param("sendStatus")String sendStatus);
	
	/**
	 * @Description: 根据参数查询我的任务列表信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @return:      TaskVo 列表信息
	 * @date:        2018-03-15
	 */
	List<TaskVo> queryMyTaskInfoByParam(TaskVo param);
	
	/**
	 * @Description: 修改我的任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @date:        2018-03-15
	 */
	public void updateMyTask(TaskVo vo);
}
