package com.ps.service.impl.performancemanage;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.performancemanager.PerformanceContractManagerDao;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.performancemanage.PerformanceContractVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.performancemanage.PerformanceContractManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;
@Service
public class PerformanceContractManagerServiceImpl extends BaseServiceImpl implements PerformanceContractManagerService{

	@Autowired
	private PerformanceContractManagerDao performanceContractManagerDao;
	
	@Autowired
	private ICommonService commonService;
	

	@Autowired
	private ICommentService commentService;
	
	@Override
	public List<PerformanceContractVo> getAllPerformanceContract(
			PerformanceContractVo VO) {
		VO.setAuthUserId(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		List<PerformanceContractVo> list=performanceContractManagerDao.getAllPerformanceContract(VO);
		for (PerformanceContractVo vo : list) {
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return list;
	}

	@Override
	public void savePerformanceContract(PerformanceContractVo VO) {
		if(StringUtils.isNotEmpty(VO.getId())){//更新
			VO.setId(EncryptPkUtil.decodeId(VO.getId()));
			performanceContractManagerDao.updatePerformanceContract(VO);
		}else{//新增
			VO.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			VO.setPcBy(VO.getCreateBy());
			VO.setPcStatus(GlobalConstants.ZERO);//状态置零
			performanceContractManagerDao.addPerformanceContract(VO);
		}	
	}
	
	
	
	@Override
	public PerformanceContractVo getPerformanceContractById(String id) {
		PerformanceContractVo vo = new PerformanceContractVo();
		if (StringUtils.isNotEmpty(id)) {
			vo = this.performanceContractManagerDao.getPerformanceContractById(EncryptPkUtil.decodeId(id));
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setChangeList(this.commonService.queryChangeRecordByUserId("R009_03",vo.getId()));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00903);
			vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}else{
			vo.setPcCreateDate(DateUtil.today());
		}
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00903);
		return vo;
	}

	@Override
	public void deletePerformanceContract(PerformanceContractVo VO) {
		VO.setId(EncryptPkUtil.decodeId(VO.getId()));
		performanceContractManagerDao.deletePerformanceContract(VO);
		
	}

	@Override
	public void submitPerformanceContract(PerformanceContractVo VO) {
		VO.setId(EncryptPkUtil.decodeId(VO.getId()));
		performanceContractManagerDao.updatePerformanceContractStatus(VO);
	}

	@Override
	public void auditPerformanceContract(PerformanceContractVo VO) {
		VO.setId(EncryptPkUtil.decodeId(VO.getId()));
		if(VO.getPcStatus().equals("0")){
			VO.setPcStatus("2");
		}else
			VO.setPcStatus("3");
		performanceContractManagerDao.auditPerformanceContract(VO);
		
	}

}
