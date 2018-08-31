package com.ps.result.common;

/**
 * 上传文件实体类
 * @author 	WB083
 * @date 	2017-8-31
 */
public class UploadVo{
	private String id;
	private String dataNum;				//数据编号
	private String fileName;			//文件名
	private String filePath;			//文件路径
	private String tabIndex;			//tab顺序
	private String fileStatus;			//是否删除   1:已删除 0:未删除
	private String fileFlag;			//是否原始报告
	private String dataId;				//功能对应的数据id
	private String fileType;			//文件类型
	private String pageType;			//功能类型
	private String createBy;			//创建人
	private String createTime;			//创建时间
	private String createUnit;			//创建单位
	private Integer error;				//KindEditor需要
	private String url;					//KindEditor需要
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDataNum() {
		return dataNum;
	}
	public void setDataNum(String dataNum) {
		this.dataNum = dataNum;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getTabIndex() {
		return tabIndex;
	}
	public void setTabIndex(String tabIndex) {
		this.tabIndex = tabIndex;
	}
	public String getFileStatus() {
		return fileStatus;
	}
	public void setFileStatus(String fileStatus) {
		this.fileStatus = fileStatus;
	}
	public String getFileFlag() {
		return fileFlag;
	}
	public void setFileFlag(String fileFlag) {
		this.fileFlag = fileFlag;
	}
	public String getDataId() {
		return dataId;
	}
	public void setDataId(String dataId) {
		this.dataId = dataId;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getPageType() {
		return pageType;
	}
	public void setPageType(String pageType) {
		this.pageType = pageType;
	}
	public Integer getError() {
		return error;
	}
	public void setError(Integer error) {
		this.error = error;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCreateBy() {
		return createBy;
	}
	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}
	public String getCreateTime() {
		return createTime;
	}
	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
	public String getCreateUnit() {
		return createUnit;
	}
	public void setCreateUnit(String createUnit) {
		this.createUnit = createUnit;
	}
	
}
