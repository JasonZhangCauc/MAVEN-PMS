package com.ps.service.taskmanage;

import java.util.List;

import com.ps.result.systemmanage.DeptVo;
import com.ps.result.taskmanage.TaskIssuedVo;


/**
 * @Description:    任务控制台任务接口类
 * @author:         ZHOUMIN
 * @date:           2018-08-01
 */
public interface ITaskIssuedManagerService {

	/**
	 * @Description: 加载组织架构人员信息树
	 * @author:      ZHOUMIN
	 * @param:       deptVo
	 * @return:      List<DeptVo> 列表信息
	 * @date:        2018-07-02
	 */
	List<DeptVo> loadDeptUserTree(DeptVo deptVo);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      taskIssuedManagerVo数据   
	 * @date:        2018-08-01
	 */
	TaskIssuedVo queryTaskIssuedById(TaskIssuedVo taskIssuedVo);
	
	
	/**
	 * @Description: 保存任务下发信息
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo
	 * @return:      
	 * @date:        2018-08-01
	 */
	void saveTaskIssued(TaskIssuedVo vo);
	
	/**
	 * @Description: 根据用户id或部门ID加载任务信息
	 * @author:      ZHOUMIN
	 * @param:       selectId
	 * @return:      List<TaskIssuedVo> 列表信息
	 * @date:        2018-07-02
	 */
	List<TaskIssuedVo> queryTaskIssendByDpetOrUser(String selectId,String taskStatus);
	
	/**
	 * @Description: 任务时间变更
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo
	 * @return:      
	 * @date:        2018-08-01
	 */
	void updateTaskIssuedDateOne(String selectId,String dayDelta);
	
	/**
	 * @Description: 任务时间变更
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo
	 * @return:      
	 * @date:        2018-08-01
	 */
	void updateTaskIssuedDateTwo(String selectId,String dayDelta);
	
	
	/**
	 * @Description: 根据ID删除任务
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo
	 * @return:      
	 * @date:        2018-08-01
	 */
	void deleteTaskIssuedById(String id);
	
	/**
	 * @Description: 获取我的任务
	 * @author:      ZHOUMIN
	 * @param:       selectId
	 * @return:      List<TaskIssuedVo> 列表信息
	 * @date:        2018-07-02
	 */
	List<TaskIssuedVo> queryMyTask(String taskStatus);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      taskIssuedManagerVo数据   
	 * @date:        2018-08-01
	 */
	TaskIssuedVo queryMyTaskById(String taskId);
	
	/**
	 * @Description: 保存我的任务信息
	 * @author:      ZHOUMIN
	 * @param:       TaskIssuedVo
	 * @return:      
	 * @date:        2018-08-01
	 */
	void saveMyTask(TaskIssuedVo vo);
}

