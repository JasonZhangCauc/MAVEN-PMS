package com.ps.dao.projectmanage;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.projectmanage.DocumentManageVo;


/**
 * @Description:    DAO接口 
 * @author:         zhangm
 * @date:           2018-08-03
 */
public interface DocumentManageDao{
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      zhangm
	 * @param:       DocumentManageVo
	 * @return:      DocumentManageVo 列表信息
	 * @date:        2018-08-03
	 */
	List<DocumentManageVo> queryDocumentManageInfoByParam(DocumentManageVo param);
	
	/**
	 * @Description: 根据ID查询列表信息
	 * @author:      zhangm
	 * @param:       id
	 * @return:      DocumentManageVo 数据信息
	 * @date:        2018-08-03
	 */
	public DocumentManageVo queryDocumentManageById(@Param("id")String id);
	
	/**
	 * @Description: 新增信息
	 * @author:      zhangm
	 * @param:       DocumentManageVo
	 * @date:        2018-08-03
	 */
	public void insertDocumentManage(@Param("vo")DocumentManageVo vo);
	
	/**
	 * @Description: 修改信息
	 * @author:      zhangm
	 * @param:       DocumentManageVo
	 * @date:        2018-08-03
	 */
	public void updateDocumentManage(@Param("vo")DocumentManageVo vo);
	
	/**
	 * @Description: 删除信息
	 * @author:      zhangm
	 * @param:       id
	 * @date:        2018-08-03
	 */
	public void deleteDocumentManageById(@Param("id")String id);
	
	/**
	 * 根据监控id查询文档信息
	 * @param vo
	 */
	public List<DocumentManageVo> searchDoucmentList(DocumentManageVo vo);
}
