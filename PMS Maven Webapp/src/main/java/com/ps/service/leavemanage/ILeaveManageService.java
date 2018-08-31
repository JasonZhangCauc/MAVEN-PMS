package com.ps.service.leavemanage;

import java.util.List;

import com.ps.result.leavemanage.LeaveVo;

/**
 * 
 * 请假管理接口类
 * ILeaveManageService
 * @author：JasonZhang
 * @date：2018-8-13-下午2:01:05 
 *
 */
public interface ILeaveManageService {

	/**
	 * 
	 * @Description:查询请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午2:04:33 
	 * @param param
	 * @return List<LeaveVo>
	 * @exception
	 */
	List<LeaveVo> queryLeaveInfoByParam(LeaveVo param);
	
	/**
	 * 
	 * @Description:根据ID查询请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午2:04:45 
	 * @param id
	 * @return LeaveVo
	 * @exception
	 */
	LeaveVo queryLeaveInfoById(String id);
	
	/**
	 * 
	 * @Description:保存请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午2:04:58 
	 * @param vo void
	 * @exception
	 */
	void saveLeave(LeaveVo vo);
	
	/**
	 * 
	 * @Description:根据ID删除请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午2:05:12 
	 * @param id void
	 * @exception
	 */
	void deleteLeaveById(String id);
	
	
	/**
	 * 
	 * @Description:提交请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-下午2:05:24 
	 * @param id void
	 * @exception
	 */
	void updateLeaveSendStatus(String id);
	
	/**
	 * 
	 * @Description:否决请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-14-下午1:34:23 
	 * @param id void
	 * @exception
	 */
	void updateLeaveState(String id);
	
	/**
	 * 
	 * @Description:通过请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-14-下午1:59:05 
	 * @param id void
	 * @exception
	 */
	void passLeaveState(String id);

}
