package com.ps.service.impl.taskmanage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.taskManage.WorkhoursRecordDao;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.systemmanage.UserVo;
import com.ps.result.taskmanage.WorkhoursRecordVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.taskmanage.IWorkhoursRecordService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         RAOMINGYI
 * @date:           2018-07-02
 */
@Service
public class WorkhoursRecordServiceImpl extends BaseServiceImpl implements IWorkhoursRecordService{
	
	@Autowired
	private WorkhoursRecordDao workhoursRecordDao;

	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private ICommentService commentService;
	
	@Override
	public List<WorkhoursRecordVo> queryWorkhoursRecordInfoByParam(WorkhoursRecordVo param) {
		String id = "";
		if(param.getProjectId()!=null){
			String [] ids = param.getProjectId().split(",");
			param.setProjectId(EncryptPkUtil.decodeId(param.getProjectId()));
			
			for (int i = 0; i < ids.length; i++) {
				id +=","+EncryptPkUtil.decodeId(ids[i]);
			}
			param.setProjectId(id.substring(1));
		}
		List<WorkhoursRecordVo> dataList = this.workhoursRecordDao.queryWorkhoursRecordInfoByParam(param);
		for (WorkhoursRecordVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			vo.setLoginUserId(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		}
		return dataList;
	}

	@Override
	public WorkhoursRecordVo queryWorkhoursRecordInfoById(String id) {
		String temId = id;
		WorkhoursRecordVo vo = new WorkhoursRecordVo();
		if(StringUtils.isEmpty(id)){
			//创建人信息
			UserVo create = this.getLoginUser();
			vo.setWorkerName(create.getUserName());				
			vo.setWorkDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		}else{
			id = EncryptPkUtil.decodeId(id);
			vo = this.workhoursRecordDao.queryWorkhoursRecordById(id);
			if(vo != null){
				vo.setId(temId);
				vo.setWorkerId(EncryptPkUtil.encodeId(vo.getWorkerId()));
				vo.setProjectId(EncryptPkUtil.encodeId(vo.getProjectId()));
				vo.setChangeList(this.commonService.queryChangeRecordByUserId("R005_0301",vo.getId()));
				CommentVO commentVo =new CommentVO();
				commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
				commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00503);
				vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
			}
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		vo.setLoginUserId(this.getLoginUser().getId());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00503);
		return vo;
	}
	
	@Override
	public void saveWorkhoursRecord(WorkhoursRecordVo vo){
		vo.setProjectId(EncryptPkUtil.decodeId(vo.getProjectId()));
		//创建人信息
		UserVo create = this.getLoginUser();
		if(StringUtils.isEmpty(vo.getId())){
			//新增				
			vo.setCreateBy(EncryptPkUtil.decodeId(create.getId()));
			vo.setWorkerId(EncryptPkUtil.decodeId(create.getId()));
			vo.setCreateDept(create.getDeptId());
			vo.setStatus("0");
			this.workhoursRecordDao.insertWorkhoursRecord(vo);
		}else{
			//解密
			vo.setUpdateBy(EncryptPkUtil.decodeId(create.getId()));
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			vo.setWorkerId(EncryptPkUtil.decodeId(vo.getWorkerId()));
			//更新
			this.workhoursRecordDao.updateWorkhoursRecord(vo);
			
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R005_0301", vo.getId());
			}
		}
	}

	@Override
	public void deleteWorkhoursRecordById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.workhoursRecordDao.deleteWorkhoursRecordById(id);
		}
	}
	
	@Override
	public void updateRecordStatus(WorkhoursRecordVo vo){
		if(StringUtils.isNotEmpty(vo.getId())){
		    //解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId())) ;
			this.workhoursRecordDao.updateRecordStatus(vo);
		}
	}
	@Override
	public String queryWorkhoursTotalByParam(WorkhoursRecordVo vo){		
		return this.workhoursRecordDao.queryWorkhoursTotalByParam(vo);		
	}
	
}
