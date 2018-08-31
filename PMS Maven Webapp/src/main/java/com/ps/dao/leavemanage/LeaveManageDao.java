package com.ps.dao.leavemanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.leavemanage.LeaveVo;



/**
 * 
 * 请假管理Dao接口
 * LeaveManageDao
 * @author：JasonZhang
 * @date：2018-8-13-上午10:19:44 
 *
 */
public interface LeaveManageDao {
	
	/**
	 * 
	 * @Description:根据参数查询请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-上午10:20:20 
	 * @param param
	 * @return List<ContractVo>
	 * @exception
	 */
	public List<LeaveVo> queryLeaveInfoByParam(LeaveVo param);
	
	
	/**
	 * 
	 * @Description:根据ID查询请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-上午10:20:39 
	 * @param id
	 * @return LeaveVo
	 * @exception
	 */
	public LeaveVo queryLeaveById(@Param("id")String id);
	

	/**
	 * 
	 * @Description:新增请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-上午10:21:03 
	 * @param vo void
	 * @exception
	 */
	public void insertLeave(LeaveVo vo);
	
	/**
	 * 
	 * @Description:修改请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-上午10:21:18 
	 * @param vo void
	 * @exception
	 */
	public void updateLeave(LeaveVo vo);
	
	/**
	 * 
	 * @Description:删除请假信息
	 * @author：JasonZhang 
	 * @date：2018-8-13-上午10:21:37 
	 * @param id void
	 * @exception
	 */
	public void deleteLeaveById(@Param("id")String id);
	/**
	 * 
	 * @Description:提交请假申请
	 * @author：JasonZhang 
	 * @date：2018-8-13-上午10:21:48 
	 * @param id void
	 * @exception
	 */
	public void updateLeaveSendStatus(@Param("id")String id);
	/**
	 * 
	 * @Description:否决请假申请
	 * @author：JasonZhang 
	 * @date：2018-8-14-下午1:36:20 
	 * @param id void
	 * @exception
	 */
	public void updateLeaveState(@Param("id")String id);
	/**
	 * 
	 * @Description:通过请假申请
	 * @author：JasonZhang 
	 * @date：2018-8-14-下午2:01:22 
	 * @param id void
	 * @exception
	 */
	public void passLeaveState(@Param("id")String id);
}
