package com.ps.service.impl.projectManage;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.projectmanage.ProjectMoniInfoDao;
import com.ps.result.projectmanage.ProjectMoniInfoVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.projectmanage.IProjectMoniInfoService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;

/**
 * @Description:    业务逻辑实现类
 * @author:         zhangm
 * @date:           2018-08-03
 */
@Service
public class ProjectMoniInfoServiceImpl extends BaseServiceImpl implements IProjectMoniInfoService{
	
	@Autowired
	private ProjectMoniInfoDao projectMoniInfoDao;

	
	@Override
	public List<ProjectMoniInfoVo> queryProjectMoniInfoInfoByParam(ProjectMoniInfoVo param) {
			//解码
			param.setProjectBaseinfoId(EncryptPkUtil.decodeId(param.getProjectBaseinfoId()));
			List<ProjectMoniInfoVo> dataList = this.projectMoniInfoDao.queryProjectMoniInfoInfoByParam(param);
			for (ProjectMoniInfoVo vo : dataList) {
				//加密
				vo.setId(EncryptPkUtil.encodeId(vo.getId()));
				if(vo.getMoniStatus().equals(GlobalConstants.ZERO)){
					vo.setMoniStatusStr(GlobalConstants.NOT_AT_THE);
				}else if(vo.getMoniStatus().equals(GlobalConstants.ONE)){
					vo.setMoniStatusStr(GlobalConstants.ONGOING);
				}else if(vo.getMoniStatus().equals(GlobalConstants.TWO)){
					vo.setMoniStatusStr(GlobalConstants.COMPLETE);
				}
			}
			return dataList;
	}

	
	@Override
	public void saveProjectMoniInfo(ProjectMoniInfoVo vo){
			if(StringUtils.isEmpty(vo.getId())){
				//新增
				//创建人信息
				UserVo create = this.getLoginUser();
				vo.setCreateBy(EncryptPkUtil.decodeId(create.getId()));
				vo.setCreateDept(create.getDeptId());
				this.projectMoniInfoDao.insertProjectMoniInfo(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//根据时间计划状态
				if(vo.getMoniStartDate()!=null&&vo.getMoniEndDate()!=null){
					
				}else{
					vo.setMoniStatus(GlobalConstants.ZERO);//未开始
				}
				
				vo.setMoniStatus(returnStatus(vo.getMoniStartDate(),vo.getMoniEndDate()));
				//更新
				this.projectMoniInfoDao.updateProjectMoniInfo(vo);
			}
	}
	
	public String returnStatus(String date1,String date2){
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
		String today = sdf.format(new Date());
		String state = "";
		if(date1!=null&&date2!=null){
			//当前时间小于开始时间（0） 中间（1） 大于结束时间（2）
			int res=date1.compareTo(today);
			if(res>0){//开始时间大于当前时间
				state = GlobalConstants.ZERO;
			}else if(res<0){//当前时间大于开始时间
				int res2=date2.compareTo(today);
				if(res2>0){//结束时间大于当前时间
					state = GlobalConstants.ONE;
				}else{//结束时间小于于当前时间
					state = GlobalConstants.TWO;
				}
			}else{
				state = GlobalConstants.ONE;
			}
		}else if(date1!=null&&date2==null){
			//当前时间大于开始时间则就是进行中（1）反之（0）
			int res=date1.compareTo(today);
			if(res>0){
				state = GlobalConstants.ZERO;
			}else{
				state = GlobalConstants.ONE;
			}
		}else if(date1==null&&date2!=null){
			state = GlobalConstants.ZERO;
		}else{
			state = GlobalConstants.ZERO;
		}
		return state;
	}

	@Override
	public void deleteProjectMoniInfoById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.projectMoniInfoDao.deleteProjectMoniInfoById(id);
		}
	}


	@Override
	public ProjectMoniInfoVo queryProjectMoniInfoInfoById(String id) {
		//解码
		id = (EncryptPkUtil.decodeId(id));
		ProjectMoniInfoVo vo = projectMoniInfoDao.queryProjectMoniInfoById(id);
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		return vo;
		
	}

}
