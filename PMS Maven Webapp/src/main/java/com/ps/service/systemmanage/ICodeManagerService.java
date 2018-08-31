package com.ps.service.systemmanage;

import java.util.List;
import java.util.Map;

import com.ps.result.systemmanage.CodeVo;

/**
 * @Description:    基础数据维护接口类
 * @author:         ZHOUMIN
 * @date:           2018-03-02
 */
public interface ICodeManagerService {

	/**
	 * @Description: 查询基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       CodeVo 查询条件
	 * @return:      List<CodeVo>数据列表   
	 * @date:        2018-03-02
	 */
	List<CodeVo> queryCodeInfoByParam(CodeVo vo);
	
	/**
	 * @Description: 根据ID查询基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       id
	 * @return:      CodeVo 基础维护信息数据   
	 * @date:        2018-03-02
	 */
	CodeVo queryCodeInfoById(String codeId);
	
	/**
	 * @Description: 保存基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       CodeManagerVo   
	 * @date:        2018-03-02
	 */
	void saveCode(CodeVo vo);
	
	/**
	 * @Description: 获取所有基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       
	 * @return:		 Map<String,List<CodeVo>> 基础数据维护信息
	 * @date:        2018-03-02
	 */
	Map<String,List<CodeVo>> initCodeInfo();
	
	/**
	 * @Description: 根据上级码表ID及自身ID判断码值唯一性
	 * @author:      ZhouMin
	 * @param:       CodeVo 码表信息
	 * @return:      Map<Object,Object> 是否重复信息
	 * @date:        2017年8月15日
	 */
	Map<Object,Object> queryCodeInfoByChecking(CodeVo codeVo);
	
	/**
	 * @Description: 根据码表ID修改码表状态
	 * @author:      ZhouMin
	 * @param: 	     codeId 码表ID
	 * @param:		 codeFlag 码表状态
	 * @date:        2017年8月15日
	 */
	void updateCodeFlag(String codeId,String codeFlag);
	
	/**
	 * 根据获取父级码值
	 * @param changeType 功能类别
	 * @return
	 */
	public List<CodeVo> getParentCode();
}

