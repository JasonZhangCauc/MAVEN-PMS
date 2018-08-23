package com.ps.service.impl.applymanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.applymanage.ReimburseManagerDao;
import com.ps.result.applymanage.ReimburseVo;
import com.ps.result.commentmanage.CommentVO;
import com.ps.service.applymanage.IReimburseManagerService;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;



/**
 * @Description: 报销申请业务逻辑实现类
 * @author lanjunjie
 * @date: 2018-8-2
 */
@Service
public class ReimburseManagerServiceImpl extends BaseServiceImpl implements IReimburseManagerService {
	
	@Autowired
	 ReimburseManagerDao reimburseManagerDao;
	
	@Autowired
	private ICommonService commonService;
	
	
	@Autowired
	private ICommentService commentService;
	
	
	@Override
	public List<ReimburseVo> queryReimburseInfoByParam(ReimburseVo vo) {
		if (StringUtils.isNotEmpty(vo.getId())) {
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
		}
		StringBuffer stringBuffer = new StringBuffer();
		if (StringUtils.isNotEmpty(vo.getProjectName())) {
			vo.setProjectName(EncryptPkUtil.decodeId(vo.getProjectName()));
		}
		vo.setAuthUserId(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		List<ReimburseVo> list = this.reimburseManagerDao.queryReimburseInfoByParam(vo);
		for (ReimburseVo reimburseVo : list) {
			//加密
			reimburseVo.setId(EncryptPkUtil.encodeId(reimburseVo.getId()));
			//reimburseVo.setProjectName(EncryptPkUtil.encodeId(reimburseVo.getProjectName()));
		}
		return list;
	}

	@Override
	public void saveReimbures(ReimburseVo vo) {
		if (StringUtils.isNotEmpty(vo.getId())) {
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			vo.setProjectName(EncryptPkUtil.decodeId(vo.getProjectName()));
			reimburseManagerDao.updateReimbures(vo);
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R011_01", vo.getId());
			}
		}else {
			//该报销申请的id序列
			String id = reimburseManagerDao.getNextId()+"";
			//设置id信息
			vo.setId(id);
			//生成并设置报销申请单编号
			String applyNo = "REI";
			for (int i = 0; i < 5-id.length(); i++) {
				applyNo+="0";
			}
			applyNo+=id;
			vo.setApplyNo(applyNo);
			vo.setProjectName(EncryptPkUtil.decodeId(vo.getProjectName()));
			vo.setStatus("1");
			//添加创建人id
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			reimburseManagerDao.saveReimbures(vo);
		}
		
		
	}



	@Override
	public ReimburseVo queryReimburseInfoById(String id) {
		ReimburseVo vo = new ReimburseVo();
		if (StringUtils.isNotEmpty(id)) {
			vo = this.reimburseManagerDao.queryReimburseInfoById(EncryptPkUtil.decodeId(id));
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setProjectName(EncryptPkUtil.encodeId(vo.getProjectName()));
			vo.setChangeList(this.commonService.queryChangeRecordByUserId("R011_01",vo.getId()));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R01101);
			vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		if(StringUtils.isNotEmpty(vo.getCreateDate())){
			vo.setCurrentTime(vo.getCreateDate());
		}else {
			vo.setCurrentTime(DateUtil.today());
		}
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R01101);
		return vo;
	}


	@Override
	public void deleteReimburseInfoById(String id) {
		id = EncryptPkUtil.decodeId(id);
		reimburseManagerDao.deleteReimburseInfoById(id);
	}

	@Override
	public void updateReimburseStatus(ReimburseVo vo) {
		vo.setId(EncryptPkUtil.decodeId(vo.getId()));
		if (StringUtils.isEmpty(vo.getStatus())) {
			vo = reimburseManagerDao.queryReimburseInfoById(vo.getId());
			String string=vo.getStatus();
			if(string.equals("4")){
				string="4";
			}else{
				string=(Integer.parseInt(vo.getStatus())+1)+"";
			}
			vo.setStatus(string);
		}
		reimburseManagerDao.updateReimburseStatus(vo);	
	}

}
