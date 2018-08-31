package com.ps.dao.systemmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.systemmanage.CodeVo;

/**
 * @Description:    基础数据维护DAO接口 
 * @author:         ZHOUMIN
 * @date:           2018-03-02
 */
public interface CodeManagerDao{
	
	/**
	 * @Description: 根据参数查询基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       CodeVo 查询条件
	 * @return:      List<CodeVo> 字典列表信息
	 * @date:        2018-03-02
	 */
	List<CodeVo> queryCodeInfoByParam(CodeVo param);
	
	/**
	 * @Description: 根据ID查询基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       id 字典ID
	 * @return:      CodeVo 字典信息
	 * @date:        2018-03-02
	 */
	public CodeVo queryCodeById(@Param("id")String id);
	
	/**
	 * @Description: 新增基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       CodeVo 字典信息
	 * @return:
	 * @date:        2018-03-02
	 */
	public void insertCode(CodeVo vo);
	
	/**
	 * @Description: 根据ID修改基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       CodeVo 字典信息
	 * @return:
	 * @date:        2018-03-02
	 */
	public void updateCode(CodeVo vo);
	
	/**
	 * @Description: 根据参数查询有效基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       
	 * @return:      List<CodeVo> 字典列表信息
	 * @date:        2018-03-02
	 */
	public List<CodeVo> getValidCodeInfo();
	
	/**
	 * @Description: 根据码表类型查询当前码值是否重复
	 * @author:      ZhouMin
	 * @param:       codeVo 码表
	 * @return:      CodeVo 码表信息
	 * @date:        2018-03-02
	 */
	CodeVo getCodeInfoByCodeType(CodeVo codeVo);
	
	/**
	 * @Description: 根据码表ID更新码表状态
	 * @author:      ZhouMin
	 * @param:       codeId 码表ID, codeFlag 禁用/启用
	 * @return:      
	 * @date:        2018-03-02
	 */
	void updateCodeFlag(@Param("codeId")String codeId,@Param("codeFlag")String codeFlag);
	
	/**
	 * @Description: 根据数据类型查询基础数据维护信息
	 * @author:      ZHOUMIN
	 * @param:       id 字典ID
	 * @return:      CodeVo 字典信息
	 * @date:        2018-03-02
	 */
	List<CodeVo> getCodeInfoByType(@Param("codeType")String codeType);
	
	/**
	 * @Description: 获取父级码表
	 * @author:      ZHOUMIN
	 * @param:       CodeVo 查询条件
	 * @return:      List<CodeVo> 字典列表信息
	 * @date:        2018-03-02
	 */
	List<CodeVo> queryParentCode(CodeVo param);
	
	/**
	 * @Description: 根据码表类型查询下一个码值
	 * @author:      ZHOUMIN
	 * @param:       codeType 码表类型
	 * @return:      int 下一个码值
	 * @date:        2018-03-02
	 */
	int getNextCodeValueByType(@Param("codeType")String codeType);
}
