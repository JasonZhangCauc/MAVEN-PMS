package com.ps.dao.commentmanage;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import com.ps.result.commentmanage.CommentUser;
import com.ps.result.commentmanage.CommentVO;

/**
 * @Description:注释表dao
 * @author: WangYongcan
 * @date: 2018/7/13
 */
public interface CommentDao {
	
    @Insert("insert into PMS_COMMENT (USER_ID,COMMENT_TIME,DATA_ID,COMMENT_CONTENT,FUNCTION_NO) values(#{commentVO.userId},to_date(#{commentVO.commentTime},'YYYY-MM-DD'),#{commentVO.dataId},#{commentVO.commentContent},#{commentVO.functionNo})")
    public int insertComment(@Param("commentVO") CommentVO commentVO);

    @Select("SELECT u.USER_PIC,u.USER_NAME,c.COMMENT_TIME,c.COMMENT_CONTENT FROM PMS_COMMENT c LEFT JOIN PMS_USER u ON c.USER_ID=u.ID where c.FUNCTION_NO=#{commentVO.functionNo} and c.DATA_ID=#{commentVO.dataId}")
    @Results({
            @Result(property = "userPic", column = "USER_PIC"),
            @Result(property = "userName", column = "USER_NAME"),
            @Result(property = "commentTime", column = "COMMENT_TIME"),
            @Result(property = "comment", column = "COMMENT_CONTENT")
    })
    public List<CommentUser> queryCommentUserList(@Param("commentVO") CommentVO commentVO);
}
