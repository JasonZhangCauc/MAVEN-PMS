package com.ps.service.impl.commentmanage;

import java.util.Collections;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ps.dao.commentmanage.CommentDao;
import com.ps.result.commentmanage.CommentUser;
import com.ps.result.commentmanage.CommentVO;
import com.ps.service.commentmanage.ICommentService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:注释/备注服务类
 * @author: WangYongcan
 * @date: 2018/7/13
 */
@Service
public class CommentServiceImpl implements ICommentService {
	
    @Autowired
    private CommentDao commentDao;

    /**
     * 添加注释/备注
     * @param commentVO
     * @return
     */
    @Override
    public int saveComment(CommentVO commentVO) {
    	if(StringUtils.isNotBlank(commentVO.getUserId())){
    		commentVO.setUserId(EncryptPkUtil.decodeId(commentVO.getUserId()));
    	}
    	if(StringUtils.isNotBlank(commentVO.getDataId())){
    		commentVO.setDataId(EncryptPkUtil.decodeId(commentVO.getDataId()));
    	}
        return commentDao.insertComment(commentVO);
    }

    @Override
    public List<CommentUser> queryCommentUserList(CommentVO commentVO) {
        if(null==commentVO){
            return Collections.emptyList();
        }
        if(null==commentVO.getDataId() || null==commentVO.getFunctionNo()){
            return Collections.emptyList();
        }
        return commentDao.queryCommentUserList(commentVO);
    }
}
