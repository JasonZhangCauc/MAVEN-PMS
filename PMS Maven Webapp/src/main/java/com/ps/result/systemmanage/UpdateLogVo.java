package com.ps.result.systemmanage;

import com.ps.result.common.PageParaVo;


/** 
 *@Description: 更新日志VO
 * @author：		ZHOUMIN
 * @date：		2018-07-23 
 */
public class UpdateLogVo extends PageParaVo<UpdateLogVo>{

	private String id;					//ID
	private String updateDate;			//更新日期
	private String versionNum;			//版本号
	private String updateContent;		//更新内容
	private String createByPic;			//录入人图标
	
	public String getVersionNum() {
		return versionNum;
	}
	public void setVersionNum(String versionNum) {
		this.versionNum = versionNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}
	public String getUpdateContent() {
		return updateContent;
	}
	public void setUpdateContent(String updateContent) {
		this.updateContent = updateContent;
	}
	public String getCreateByPic() {
		return createByPic;
	}
	public void setCreateByPic(String createByPic) {
		this.createByPic = createByPic;
	}
}
