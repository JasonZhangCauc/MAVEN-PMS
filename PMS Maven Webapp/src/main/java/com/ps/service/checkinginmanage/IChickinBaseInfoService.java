package com.ps.service.checkinginmanage;

import java.util.Collection;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;


import com.GlobalConstants;
import com.ps.dao.checkinginmanage.ChickinBaseInfoDao;
import com.ps.result.checkinginmanage.ChickinBaseInfoVo;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.projectmanage.CostReportVo;
import com.ps.result.projectmanage.ProjectBaseInfoVo;
import com.ps.result.projectmanage.ProjectVo;
import com.ps.result.systemmanage.CodeVo;
import com.ps.result.taskmanage.WorkhoursRecordVo;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * 
 * 打卡记录类
 * IChickinBaseInfoService
 * @author：JasonZhang
 * @date：2018-8-2-下午4:22:55 
 *
 */
public interface IChickinBaseInfoService {

	
	/**
	 * 
	 * @Description:查询打卡记录列表信息
	 * @author：JasonZhang 
	 * @date：2018-8-2-下午4:23:08 
	 * @param param
	 * @return List<ProjectBaseInfoVo>数据列表   
	 * @exception
	 */
	List<ChickinBaseInfoVo> queryChickinBaseInfoInfoByParam(ChickinBaseInfoVo param);
	
	List<ChickinBaseInfoVo> querychickinBaseInfoByParam(ChickinBaseInfoVo param);
	
	/**
	 * @return 
	 * 
	 * @Description:记录打卡记录
	 * @author：JasonZhang 
	 * @date：2018-8-3-下午3:01:10 
	 * @param vo
	 * @return ProjectVo
	 * @exception
	 */
	void saveChickinBaseInfo(ChickinBaseInfoVo vo);
	
	/**
	 * 
	 * @Description:根据id删除相应打卡记录
	 * @author：JasonZhang 
	 * @date：2018-8-3-下午5:50:20 
	 * @param id void
	 * @exception
	 */
	void deleteChickinBaseInfoById(String id);

	

	void deleteChickinById(String id);

	

	 ChickinBaseInfoVo queryChickinBaseInfoInfoById(String id) ;

	void saveInsertChickinBaseInfo(ChickinBaseInfoVo vo);
	
	void updatechickinStatus(ChickinBaseInfoVo vo); 
}

