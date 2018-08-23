package com.ps.dao.workbenchmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.workbenchmanager.ComplaintsAndAdviceVo;

/**
 * @Description:    投诉与建议DAO接口 
 * @author:         zhujiejie
 * @date:           2018-07-25
 */
public interface ComplaintsAndAdviceDao{
	
	/**
	 * @Description: 根据参数查询投诉与建议列表信息
	 * @author:      zhujiejie
	 * @param:       ComplaintsAndAdviceVo
	 * @return:      ComplaintsAndAdviceVo 列表信息
	 * @date:        2018-07-25
	 */
	List<ComplaintsAndAdviceVo> queryComplaintsAndAdviceInfoByParam(ComplaintsAndAdviceVo param);
	
	/**
	 * @Description: 根据ID查询投诉与建议列表信息
	 * @author:      zhujiejie
	 * @param:       id
	 * @return:      ComplaintsAndAdviceVo 数据信息
	 * @date:        2018-07-25
	 */
	public ComplaintsAndAdviceVo queryComplaintsAndAdviceById(@Param("id")String id);
	
	/**
	 * @Description: 新增投诉与建议信息
	 * @author:      zhujiejie
	 * @param:       ComplaintsAndAdviceVo
	 * @date:        2018-07-25
	 */
	public void insertComplaintsAndAdvice(@Param("vo")ComplaintsAndAdviceVo vo);
	
	/**
	 * @Description: 修改投诉与建议信息
	 * @author:      zhujiejie
	 * @param:       ComplaintsAndAdviceVo
	 * @date:        2018-07-25
	 */
	public void updateComplaintsAndAdvice(@Param("vo")ComplaintsAndAdviceVo vo);
	
	/**
	 * @Description: 删除投诉与建议信息
	 * @author:      zhujiejie
	 * @param:       id
	 * @date:        2018-07-25
	 */
	public void deleteComplaintsAndAdviceById(@Param("id")String id);
}
