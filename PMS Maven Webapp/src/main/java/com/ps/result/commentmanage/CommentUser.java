package com.ps.result.commentmanage;

import java.io.Serializable;

/**
 * @Description:
 * @author: WangYongcan
 * @date: 2018/7/13
 */
public class CommentUser implements Serializable {
 
	private static final long serialVersionUID = 1L;
	private String comment;
    private String commentTime;
    private String userPic;
    private String userName;

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCommentTime() {
        return commentTime;
    }

    public void setCommentTime(String commentTime) {
        this.commentTime = commentTime;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
