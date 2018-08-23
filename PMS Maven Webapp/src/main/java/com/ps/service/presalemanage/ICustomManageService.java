package com.ps.service.presalemanage;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.ps.result.presalemanage.CustomerVo;
import com.ps.result.presalemanage.LinkerVo;

/**
 * @Description:    客户管理业务接口类
 * @author:         raomingyi
 * @date:           2018-03-02
 */
public interface ICustomManageService {

	/**
	 * @Description: 查询客户列表信息
	 * @author:      raomingyi
	 * @param:      CustomerVo
	 * @return:      List<CustomManageVo>数据列表   
	 * @date:        2018-03-02
	 */
	List<CustomerVo> queryCustomInfoByParam(CustomerVo param);
	
	/**
	 * @Description: 根据ID查询客户数据信息
	 * @author:      raomingyi
	 * @param:       id
	 * @return:     CustomerVo数据   
	 * @date:        2018-03-02
	 */
	CustomerVo queryCustomInfoById(String id);
	
	/**
	 * @Description: 保存客户信息
	 * @author:      raomingyi
	 * @param:      CustomerVo   
	 * @date:        2018-03-02
	 */
	void saveCustom(List<MultipartFile> files,CustomerVo vo);
	
	/**
	 * @Description: 根据ID删除客户信息
	 * @author:      raomingyi
	 * @param:       id 
	 * @date:        2018-03-02
	 */
	void deleteCustomById(String id);
	
	/**
	 * @Description: 查询客户列表信息
	 * @author:      raomingyi
	 * @return:      List<CustomManageVo>数据列表   
	 * @date:        2018-03-02
	 */
	List<CustomerVo> getAllCustomerInfo();
	
	
	/**
	 * @Description: 根据客户二字码判断表中是否存在
	 * @author:      zhangm
	 * @param:       CustomerVo 用户信息
	 * @return:      返回MAP格式验证参数
	 * @date:        2018年07月25日
	 */
	Map<Object,Object> querySecondByChecking(CustomerVo vo);
}

