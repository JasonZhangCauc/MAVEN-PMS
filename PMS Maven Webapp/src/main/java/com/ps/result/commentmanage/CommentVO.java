package com.ps.result.commentmanage;

import java.io.Serializable;

/**
 * @Description:注释表
 * @author: WangYongcan
 * @date: 2018/7/13
 */
public class CommentVO implements Serializable {
	
	private static final long serialVersionUID = 1L;
	
	private String userId;
    private String commentTime;
    private String dataId;
    private String commentContent;
    private String functionNo;
    
    public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCommentTime() {
		return commentTime;
	}

	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}

	public String getDataId() {
        return dataId;
    }

    public void setDataId(String dataId) {
        this.dataId = dataId;
    }

    public String getCommentContent() {
        return commentContent;
    }

    public void setCommentContent(String commentContent) {
        this.commentContent = commentContent;
    }

    public String getFunctionNo() {
        return functionNo;
    }

    public void setFunctionNo(String functionNo) {
        this.functionNo = functionNo;
    }
}
