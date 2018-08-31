package com.ps.service.taskmanage;

import java.util.List;

import com.ps.result.taskmanage.TaskVo;

/**
 * @Description:    任务业务接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-15
 */
public interface ITaskManagerService {

	/**
	 * @Description: 查询任务列表信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @return:      List<TaskVo>数据列表   
	 * @date:        2018-03-15
	 */
	List<TaskVo> queryTaskInfoByParam(TaskVo param);
	
	/**
	 * @Description: 根据ID查询任务数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      TaskVo数据   
	 * @date:        2018-03-15
	 */
	TaskVo queryTaskInfoById(String id);
	
	/**
	 * @Description: 保存任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo   
	 * @date:        2018-03-15
	 */
	void saveTask(TaskVo vo);
	
	/**
	 * @Description: 根据ID删除任务信息
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @date:        2018-03-15
	 */
	void deleteTaskById(String id);
	
	/**
	 * @Description: 根据ID发送任务
	 * @author:      ZHOUMIN
	 * @param:       id 
	 * @param:       sendStatus 发送状态
	 * @date:        2018-03-15
	 */
	void updateSendStatus(String id,String sendStatus);
	
	/**
	 * @Description: 查询我的任务列表信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo
	 * @return:      List<TaskVo>数据列表   
	 * @date:        2018-03-15
	 */
	List<TaskVo> queryMyTaskInfoByParam(TaskVo taskVo);
	
	/**
	 * @Description: 保存我的任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskVo   
	 * @date:        2018-03-15
	 */
	void saveMyTask(TaskVo vo);
}

