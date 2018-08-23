package com.ps.service.presalemanage;

import java.util.List;
import java.util.Map;

import com.ps.result.presalemanage.LinkerVo;
import com.ps.result.systemmanage.UserVo;

/**
 * @Description:    接口类
 * @author:         raomingyi
 * @date:           2018-03-05
 */
public interface ILinkerManageService {

	/**
	 * @Description: 查询列表信息
	 * @author:      raomingyi
	 * @param:       LinkerVo
	 * @return:      List<LinkerVo>数据列表   
	 * @date:        2018-03-05
	 */
	List<LinkerVo> queryLinkerInfoByParam(LinkerVo param);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:      LinkerManageVo数据   
	 * @date:        2018-03-05
	 */
	LinkerVo queryLinkerInfoById(String id);
	
	/**
	 * @Description: 保存信息
	 * @author:      raomingyi
	 * @param:       LinkerVo   
	 * @date:        2018-03-05
	 */
	void saveLinker(LinkerVo vo);
	
	/**
	 * @Description: 根据ID删除信息
	 * @author:      raomingyi
	 * @param:       id 
	 * @date:        2018-03-05
	 */
	void deleteLinkerById(String id);
	/**
	 * @Description: 查询客户联系人信息
	 * @author:      raomingyi
	 * @param:       customId
	 * @return:      List<LinkerVo>数据列表   
	 * @date:        2018-03-05
	 */
	List<LinkerVo> getCustomLinker(String customId);
	
	/**
	 * @Description: 根据联系人电话号码判断电话是否存在
	 * @author:      zhangm
	 * @param:       LinkerVo 用户信息
	 * @return:      返回MAP格式验证参数
	 * @date:        2018年07月24日
	 */
	Map<Object,Object> queryPhoneByChecking(LinkerVo vo);
	
	
	
}

