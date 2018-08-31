package com.ps.service.projectmanage;

import java.util.List;

import com.ps.result.projectmanage.DocumentManageVo;


/**
 * @Description:    接口类
 * @author:         zhangm
 * @date:           2018-08-03
 */
public interface IDocumentManageService {

	/**
	 * @Description: 查询列表信息
	 * @author:      zhangm
	 * @param:       DocumentManageVo
	 * @return:      List<DocumentManageVo>数据列表   
	 * @date:        2018-08-03
	 */
	List<DocumentManageVo> queryDocumentManageInfoByParam(DocumentManageVo param);
	
	/**
	 * @Description: 根据监控id查询文档信息
	 * @author:      zhangm
	 * @param:       DocumentManageVo
	 * @return:      List<DocumentManageVo>数据列表   
	 * @date:        2018-08-03
	 */
	List<DocumentManageVo> searchDoucmentList(DocumentManageVo param);
	
	
	/**
	 * @Description: 保存信息
	 * @author:      zhangm
	 * @param:       DocumentManageVo   
	 * @date:        2018-08-03
	 */
	void saveDocumentManage(DocumentManageVo vo);
	
	/**
	 * @Description: 根据ID删除信息
	 * @author:      zhangm
	 * @param:       id 
	 * @date:        2018-08-03
	 */
	void deleteDocumentManageById(String id);
}

