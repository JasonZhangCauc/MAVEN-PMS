package com.ps.dao.common;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.ps.result.common.ChangeRecordVo;
import com.ps.result.common.SerialNumberVo;
import com.ps.result.common.UploadVo;
import com.ps.result.systemmanage.UserVo;


/**
 * @Description:    通用DAO
 * @author:         邵国松
 * @date:           2017-08-25
 */
public interface CommonDao {
	
	/**
	 * 获取表中最大编号值
	 * 
	 * @author: 邵国松
	 * @date:   2017-08-25
	 */
	public String getLastSerialNumberLike(SerialNumberVo para);

	/**
	 * 保存文件
	 * 
	 * @param fuVo
	 * @return
	 */
	public Long saveFile(@Param("fuVo") UploadVo fuVo);
	
	/**
	 * 获取上传的文件
	 * @param pageType
	 * @param dataId
	 * @param dataNum 
	 * @return
	 */
	public List<UploadVo> getAllFileUpload(@Param("pageType") String pageType,@Param("dataId") String dataId);
	
	/**
	 * 得到文件的uuid名称
	 * 
	 * @param fileid
	 * @return
	 */
	public UploadVo findFileUUIDNameById(@Param("fileId")String fileid);
	
	/**
	 * 删除文件
	 * @param fileId
	 * @param userId
	 */
	public void deleteFile(@Param("fileId")String fileId);
	
	/**
	 * @Description: 查询table表中id的记录有多少条
	 * @param map
	 * @return	Integer 记录数
	 * @author: 006492
	 * @date: 2017-8-30
	 */
	public Integer countDataById(@Param("map")Map<String,String> map);
	
	/**
	 * @Description: 验证当前编辑条目是否可编辑
	 * @param map
	 * @return	Integer 记录数
	 * @author: 006492
	 * @date: 2017-8-30
	 */
	public Integer countDataStatus(@Param("map")Map<String,String> map);
	
	/**
	 * @Description: 选择人员数据查询
	 * @param param
	 * @return	List<UserVo>用户集合
	 * @author: 006492
	 * @date: 2017-8-31
	 */
	public List<UserVo> choosePersonDialogQueryData(UserVo param);
	
	/**
	 * 保存变更记录
	 * 
	 * @param fuVo
	 * @return
	 */
	public void saveChangeRecord(ChangeRecordVo changeRecordVo);
	
	/**
	 * 获取某功能对应的数据变更记录
	 * @param changeRecordVo
	 * @return
	 */
	public List<ChangeRecordVo> queryChangeRecordByParam(ChangeRecordVo changeRecordVo);
	
}
