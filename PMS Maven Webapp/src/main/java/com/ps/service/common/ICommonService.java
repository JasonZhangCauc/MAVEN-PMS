package com.ps.service.common;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

import com.ps.result.common.ChangeRecordVo;
import com.ps.result.common.TableVo;
import com.ps.result.common.UploadVo;
import com.ps.result.systemmanage.CodeVo;
import com.ps.result.systemmanage.UserVo;

/**
 * @Description:    主页
 * @author:         HuangPeng
 * @date:           2017年7月28日
 */
public interface ICommonService {

	/**
	 * @Description: 根据登录用户加载菜单
	 * @param request
	 * @param response
	 * @return String
	 * @author HuangPeng
	 * @date 2017年4月15日
	 */
	public String loadMenu(HttpServletRequest request);
	
	/**
	 * @Description 根据表查询数据表中字段信息
	 * @param tableName：表名
	 * @return List<TableVo>
	 * @author wb010
	 */
	public List<TableVo> getColumnsByTable(String tableName);
	
	/**
	 * @Description 根据表查询数据表中字段信息
	 * @param tableName：表名
	 * @return UploadVo 文件上传实体类
	 * @author wb010
	 */
	public UploadVo saveUploadFiles(List<MultipartFile> files,UserVo userVo,UploadVo uploadVo);
	
	/**
	 * 获取某功能下对应数据id下面的附件
	 * @param pageType
	 * @param dataId
	 * @return
	 */
	public List<UploadVo> getAllFileUpload(String pageType,String dataId);
	
	/**
	 * 删除文件
	 * @param fileId
	 * @param userId
	 */
	public void deleteFile(String fileId);
	
	/**
	 * 得到文件uuid名称
	 * @param fileid
	 * @return
	 */
	public UploadVo findFileUUIDNameById(String fileid);
	
	/**
	 * 保存变更内容
	 * @param changeDetails
	 */
	public void saveChangeRecode(String changeDetails,String changeType,String changeId);
	
	/**
	 * 获取某功能对应的数据变更记录
	 * @param changeRecordVo
	 * @return
	 */
	public List<ChangeRecordVo> queryChangeRecordByParam(ChangeRecordVo changeRecordVo);
	
	/**
	 * 根据用户ID获取某功能对应的数据变更记录
	 * @param changeType 功能类别
	 * @return
	 */
	public List<ChangeRecordVo> queryChangeRecordByUserId(String changeType,String changeId);
	
}
