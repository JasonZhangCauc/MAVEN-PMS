package com.ps.dao.presalemanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.presalemanage.LinkerVo;
import com.ps.result.systemmanage.UserVo;

/**
 * @Description:    DAO接口 
 * @author:         raomingyi
 * @date:           2018-03-05
 */
public interface LinkerManageDao{
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      raomingyi
	 * @param:       LinkerVo
	 * @return:      LinkerVo 列表信息
	 * @date:        2018-03-05
	 */
	List<LinkerVo> queryLinkerInfoByParam(LinkerVo param);
	
	/**
	 * @Description: 根据ID查询列表信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      LinkerVo 数据信息
	 * @date:        2018-03-05
	 */
	public LinkerVo queryLinkerById(@Param("id")String id);
	
	/**
	 * @Description: 新增信息
	 * @author:      raomingyi
	 * @param:       LinkerVo
	 * @date:        2018-03-05
	 */
	public int insertLinker(LinkerVo vo);
	
	/**
	 * @Description: 修改信息
	 * @author:      raomingyi
	 * @param:       LinkerVo
	 * @date:        2018-03-05
	 */
	public void updateLinker(LinkerVo vo);
	
	/**
	 * @Description: 删除信息
	 * @author:      raomingyi
	 * @param:       id
	 * @date:        2018-03-05
	 */
	public void deleteLinkerById(@Param("linkerId")String linkerId);
	
	/**
	 * @Description: 物理删除
	 * @author:      zhangm
	 * @param:       id
	 * @date:        2018-07-25
	 */
	public void deleteLinkerByIdPhysical(@Param("linkerId")String linkerId);
	
	/**
	 * @Description: 根据客户删除联系人删除信息
	 * @author:      zhangm
	 * @param:       id
	 * @date:        2018-07-24
	 */
	public void deleteLinkerByCustomerId(@Param("customerId")String customerId);
	
	/**
	 * @Description: 查询客户联系人信息
	 * @author:      raomingyi
	 * @return:       LinkerVo 列表信息
	 * @date:        2018-03-05
	 */
	List<LinkerVo> getCustomLinker(@Param("customId")String customId);
	
	/**
	 * @Description: 根据联系人手机号码获取用户对象
	 * @param:  	 userAccount 用户登录名
	 * @return:		 LinkerVo 用户信息
	 * @author:		 zhangm
	 * @date: 		 2018年7月24日
	 */
	LinkerVo queryPhoneByAccount(@Param("mobilePhone") String mobilePhone);
	
	/**
	 * @Description: 根据电话号码对应ID获取信息
	 * @param:  	 userId 用户Id
	 * @return: 	 LinkerVo 用户信息
	 * @author: 	 zhangm
	 * @date: 		 2018年7月24日
	 */
	LinkerVo queryPhoneById(@Param("id") String id);
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      raomingyi
	 * @param:       LinkerVo
	 * @return:      LinkerVo 列表信息
	 * @date:        2018-03-05
	 */
	List<LinkerVo> queryLinkerInfoByParamCustomeName(LinkerVo param);
	
}
