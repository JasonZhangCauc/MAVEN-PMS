package com.ps.result.projectmanage;

import com.ps.result.common.PageBaseVo;


/** 
 *@Description: 安全监察报告VO
 * @author：		zhangm
 * @date：		2018-08-03 
 */
public class DocumentManageVo extends PageBaseVo{
	private static final long serialVersionUID = 1L;

	private String id;			//ID
	private String moniDucId;			//监控id
	private String moniFilename;			//文件名
	private String moniFiletype;			//文件类型
	private String uploadby;			//上传人
	private String uploaddate;			//上传时间
	private String filePath;			//上传路径
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMoniDucId() {
		return moniDucId;
	}
	public void setMoniDucId(String moniDucId) {
		this.moniDucId = moniDucId;
	}
	public String getMoniFilename() {
		return moniFilename;
	}
	public void setMoniFilename(String moniFilename) {
		this.moniFilename = moniFilename;
	}
	public String getMoniFiletype() {
		return moniFiletype;
	}
	public void setMoniFiletype(String moniFiletype) {
		this.moniFiletype = moniFiletype;
	}
	public String getUploadby() {
		return uploadby;
	}
	public void setUploadby(String uploadby) {
		this.uploadby = uploadby;
	}
	public String getUploaddate() {
		return uploaddate;
	}
	public void setUploaddate(String uploaddate) {
		this.uploaddate = uploaddate;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
}
