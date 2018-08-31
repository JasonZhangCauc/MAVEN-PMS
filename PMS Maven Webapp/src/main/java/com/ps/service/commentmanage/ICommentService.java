package com.ps.service.commentmanage;

import com.ps.result.commentmanage.CommentUser;
import com.ps.result.commentmanage.CommentVO;

import java.util.List;

public interface ICommentService {
    public int saveComment(CommentVO commentVO);
    public List<CommentUser> queryCommentUserList(CommentVO commentVO);
}
