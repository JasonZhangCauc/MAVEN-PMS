package com.ps.dao.systemmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.ps.result.systemmanage.UpdateLogVo;

/**
 * @Description:    更新日志DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-07-23
 */
public interface UpdateLogDao{
	
	/**
	 * @Description: 根据参数查询更新日志列表信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo
	 * @return:      UpdateLogVo 列表信息
	 * @date:        2018-07-23
	 */
	List<UpdateLogVo> queryUpdateLogByParam(UpdateLogVo param);
	
	/**
	 * @Description: 根据ID查询更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      UpdateLogVo 数据信息
	 * @date:        2018-07-23
	 */
	public UpdateLogVo queryUpdateLogById(@Param("id")String id);
	
	/**
	 * @Description: 新增更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo
	 * @date:        2018-07-23
	 */
	public void insertUpdateLog(UpdateLogVo vo);
	
	/**
	 * @Description: 修改更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo
	 * @date:        2018-07-23
	 */
	public void updateUpdateLog(UpdateLogVo vo);
	
	/**
	 * @Description: 删除更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @date:        2018-07-23
	 */
	public void deleteUpdateLogById(@Param("id")String id);
	
	/**
	 * @Description: 查询更新日志信息
	 * @author:      ZHOUMIN
	 * @param:       UpdateLogVo
	 * @return:      UpdateLogVo 列表信息
	 * @date:        2018-07-23
	 */
	List<UpdateLogVo> queryUpdateLogInfo();
}
