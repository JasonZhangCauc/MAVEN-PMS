package com.ps.result.home;

import com.ps.result.common.PageParaVo;

/** 
 * @Description: 服务单VO
 * @author：		ZHOUMIN
 * @date：		2018-07-25 
 */
public class ServiceTicketVo extends PageParaVo<ServiceTicketVo>{

	private String filename;			//文件名
	private String filetype;			//文件类型
	private String uploadby;			//上传人
	private String uploaddate;			//上传时间
	private String filePath;			//附件路径
	private String uploadbyName;		//上传人名称
	private String uploadBeginDate;		//上传开始时间
	private String uploadEndDate;		//上传结束时间
	
	public String getUploadBeginDate() {
		return uploadBeginDate;
	}
	public void setUploadBeginDate(String uploadBeginDate) {
		this.uploadBeginDate = uploadBeginDate;
	}
	public String getUploadEndDate() {
		return uploadEndDate;
	}
	public void setUploadEndDate(String uploadEndDate) {
		this.uploadEndDate = uploadEndDate;
	}
	public String getUploadbyName() {
		return uploadbyName;
	}
	public void setUploadbyName(String uploadbyName) {
		this.uploadbyName = uploadbyName;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
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
}
