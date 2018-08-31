package com.ps.dao.presalemanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.presalemanage.CustomerVo;
import com.ps.result.presalemanage.LinkerVo;

/**
 * @Description:    客户管理DAO接口 
 * @author:         raomingyi
 * @date:           2018-03-02
 */
public interface CustomManageDao{
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      raomingyi
	 * @param:      CustomerVo
	 * @return:     CustomerVo 列表信息
	 * @date:        2018-03-02
	 */
	List<CustomerVo> queryCustomInfoByParam(CustomerVo param);
	
	/**
	 * @Description: 根据ID查询列表信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:     CustomerVo 数据信息
	 * @date:        2018-03-02
	 */
	public CustomerVo queryCustomById(@Param("id")String id);
	
	/**
	 * @Description: 新增客户信息
	 * @author:      raomingyi
	 * @param:      CustomerVo
	 * @date:        2018-03-02
	 */
	public void insertCustom(CustomerVo vo);
	
	/**
	 * @Description: 修改客户信息
	 * @author:      raomingyi
	 * @param:      CustomerVo
	 * @date:        2018-03-02
	 */
	public void updateCustom(CustomerVo vo);
	
	/**
	 * @Description: 删除客户信息
	 * @author:      raomingyi
	 * @param:       id
	 * @date:        2018-03-02
	 */
	public void deleteCustomById(@Param("id")String id);
	
	/**
	 * @Description: 查询列表信息
	 * @author:      raomingyi
	 * @return:     CustomerVo 列表信息
	 * @date:        2018-03-02
	 */
	List<CustomerVo> getAllCustomerInfo();
	
	/**
	 * 
	 * 判断二字码是否存在
	 * @param second
	 * @return
	 */
	CustomerVo querySecondByAccount(@Param("second") String second);
	
	/**
	 * @Description: 根据二字码对应id查询是否存在
	 * @param:  	 CustomerVo 用户Id
	 * @return: 	 CustomerVo 用户信息
	 * @author: 	 zhangm
	 * @date: 		 2018年7月25日
	 */
	CustomerVo querySecondById(@Param("id") String id);
	
	/**
	 * @Description: 根据参数查询列表信息联系人带客户
	 * @author:      raomingyi
	 * @param:      CustomerVo
	 * @return:     CustomerVo 列表信息
	 * @date:        2018-03-02
	 */
	List<CustomerVo> queryCustomInfoByParamByContact(CustomerVo param);
	
}
