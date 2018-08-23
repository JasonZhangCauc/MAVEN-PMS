package com.ps.service.workbenchmanage;

import java.util.List;

import com.ps.result.workbenchmanager.ComplaintsAndAdviceVo;

/**
 * @Description:    投诉与建议接口类
 * @author:         zhujiejie
 * @date:           2018-07-25
 */
public interface IComplaintsAndAdviceService {

	/**
	 * @Description: 查询投诉与建议列表信息
	 * @author:      zhujiejie
	 * @param:       ComplaintsAndAdviceVo
	 * @return:      List<ComplaintsAndAdviceVo>数据列表   
	 * @date:        2018-07-25
	 */
	List<ComplaintsAndAdviceVo> queryComplaintsAndAdviceInfoByParam(ComplaintsAndAdviceVo param);
	
	/**
	 * @Description: 根据ID查询投诉与建议数据信息
	 * @author:      zhujiejie
	 * @param:       id
	 * @return:      ComplaintsAndAdviceVo数据   
	 * @date:        2018-07-25
	 */
	ComplaintsAndAdviceVo queryComplaintsAndAdviceInfoById(String id);
	
	/**
	 * @Description: 保存投诉与建议信息
	 * @author:      zhujiejie
	 * @param:       ComplaintsAndAdviceVo   
	 * @date:        2018-07-25
	 */
	void saveComplaintsAndAdvice(ComplaintsAndAdviceVo vo);
	
	/**
	 * @Description: 根据ID删除投诉与建议信息
	 * @author:      zhujiejie
	 * @param:       id 
	 * @date:        2018-07-25
	 */
	void deleteComplaintsAndAdviceById(String id);
}

