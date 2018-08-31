package com.ps.dao.applymanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.applymanage.ReimburseVo;


/**
 * 
 * @Description: 报销申请数据管理接口类
 * @author lanjunjie
 * @date: 2018-8-2
 */
public interface ReimburseManagerDao {
	
	/**
	 * 
	 * @Description: 根据查询条件获取报销申请信息
	 * @author lanjunjie
	 * @param: ReimburseVo 报销申请信息
	 * @return: List<ReimburseVo> 报销申请信息集合
	 * @date: 2018-8-2
	 */
	List<ReimburseVo> queryReimburseInfoByParam(ReimburseVo vo);
	
	/**
	 * 
	 * @Description: 添加新的报销申请
	 * @author lanjunjie
	 * @param: ReimburseVo 报销申请信息
	 * @return:
	 * @date: 2018-8-2
	 */
	void saveReimbures(ReimburseVo vo);
	
	/**
	 * 
	 * @Description: 获取下一项id
	 * @author lanjunjie
	 * @param: 
	 * @return: id
	 * @date: 2018-8-2
	 */
	int getNextId();
	
	/**
	 * 
	 * @Description: 根据参数更新报销申请信息
	 * @author lanjunjie
	 * @param: ReimburseVo 报销申请信息
	 * @return:
	 * @date: 2018-8-2
	 */
	void updateReimbures(ReimburseVo vo);
	
	/**
	 * 
	 * @Description: 根据id查询申请单信息
	 * @author lanjunjie
	 * @param: id 申请单id
	 * @return: ReimburseVo 申请单信息
	 * @date: 2018-8-2
	 */
	ReimburseVo queryReimburseInfoById(@Param("id") String id);
	
	/**
	 * 
	 * @Description: 根据id删除报销申请信息
	 * @author lanjunjie
	 * @param: id 报销申请单序列号，唯一识别
	 * @return:	
	 * @date: 2018-8-2
	 */
	void deleteReimburseInfoById(@Param("id") String id);
	
	/**
	 * @Description:	更新报销申请状态
	 * @author 			lanjunjie
	 * @param:			vo 报销申请信息
	 * @return:			
	 * @date: 			2018-8-7
	 */
	void updateReimburseStatus(ReimburseVo vo);
}
