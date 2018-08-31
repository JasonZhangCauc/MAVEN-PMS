package com.ps.service.impl.systemmanage;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.authority.CustomInvocationSecurityMetadataSourceService;
import com.ps.dao.systemmanage.RoleManagerDao;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.systemmanage.ResourceVo;
import com.ps.result.systemmanage.RoleVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.systemmanage.IRoleManagerService;
import com.util.coder.EncryptPkUtil;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    角色管理业务逻辑实现类
 * @author:         WB083
 * @date:           2017年8月24日
 */
@Service
public class RoleManagerServiceImpl extends BaseServiceImpl implements IRoleManagerService {

	@Autowired
	private RoleManagerDao roleManagerDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private ICommentService commentService;
		
	@Override
	public List<RoleVo> queryRoleInfoByUser(UserVo vo) {
		if(StringUtils.isNotBlank(vo.getId())){
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
		}
		List<RoleVo> list = this.roleManagerDao.queryRoleInfoByUser(vo);
		for (RoleVo roleVo : list) {
			//加密
			roleVo.setId(EncryptPkUtil.encodeId(roleVo.getId()));
			roleVo.setUserId(EncryptPkUtil.encodeId(roleVo.getUserId()));
		}
		return list;
	}
	
	@Override
	public List<RoleVo> queryRoleInfoByParam(RoleVo vo) {
		List<RoleVo> list=new ArrayList<RoleVo>();
		//解密
		if(!StringUtils.isBlank(vo.getUserId())){
			vo.setUserId(EncryptPkUtil.decodeId(vo.getUserId()));
		}
		list = this.roleManagerDao.queryRoleInfoByParam(vo);
		for (RoleVo roleVo : list) {
			//加密
			roleVo.setId(EncryptPkUtil.encodeId(roleVo.getId()));
			roleVo.setUserId(EncryptPkUtil.encodeId(roleVo.getUserId()));
		}
		return list;
	}

	@Override
	public RoleVo getRoleInfoById(String roleId) {
		RoleVo roleVo = new RoleVo();
		if(!StringUtils.isBlank(roleId)){
			//解密
			roleId=EncryptPkUtil.decodeId(roleId);
			roleVo=this.roleManagerDao.getRoleInfoById(roleId);
			//加密
			roleVo.setId(EncryptPkUtil.encodeId(roleVo.getId()));
			roleVo.setChangeList(this.commonService.queryChangeRecordByUserId(GlobalConstants.CATEGORYTYPE_R00102,roleVo.getId()));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(roleVo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00102);
			roleVo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}
		roleVo.setLoginUserName(this.getLoginUser().getUserName());
		roleVo.setCurrentTime(DateUtil.today());
		roleVo.setLoginUserPic(this.getLoginUser().getUserPic());
		roleVo.setLoginUserId(this.getLoginUser().getId());
		roleVo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00102);
		return roleVo;
	}

	@Override
	public void updateRoleFlag(String roleId, String roleFlag) {
		//解密
		if(!StringUtils.isBlank(roleId)){
			roleId=EncryptPkUtil.decodeId(roleId);
			if(StringUtils.equals("1", roleFlag)){
				roleFlag=GlobalConstants.ZERO;
			}else{
				roleFlag=GlobalConstants.ONE;
			}
			
			this.roleManagerDao.updateRoleFlag(roleId, roleFlag);
		}
	}

	@Override
	public void saveRole(RoleVo vo) {
		//根据角色id判断新增/修改
		if(StringUtils.isBlank(vo.getId())){
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//新增
			this.roleManagerDao.addRoleInfo(vo);
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//修改
			this.roleManagerDao.updateRoleInfo(vo);
			
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),GlobalConstants.CATEGORYTYPE_R00102, vo.getId());
			}
		}
	}

	@Override
	public Map<Object, Object> queryRoleInfoByChecking(RoleVo roleVo) {
		Map<Object,Object> map=new HashMap<Object,Object>();
		//解密
		roleVo.setId(EncryptPkUtil.decodeId(roleVo.getId()));
		RoleVo rolevos= this.roleManagerDao.getRoleInfoByRoleCode(roleVo);
		//存在ok、不存在 error 固定格式
		if(rolevos==null){
			map.put("ok", "");
		}else{
			map.put("error", MessageUtil.getMessage("label.rolemanage.existuserroleCode"));
		}
		return map;
	}

	@Override
	public List<ResourceVo> loadRoleResourceTree(String language) {
		List<ResourceVo> rootResourceList=new ArrayList<ResourceVo>();
		rootResourceList = this.roleManagerDao.loadRoleResourceTree();
		for (ResourceVo resourceVo : rootResourceList) {
			//加密
			resourceVo.setId(EncryptPkUtil.encodeId(resourceVo.getId()));
			resourceVo.setpId(EncryptPkUtil.encodeId(resourceVo.getpId()));
			if("en".equals(language)){
				resourceVo.setName(resourceVo.getResourceDescen());
			}else{
				resourceVo.setName(resourceVo.getResourceDescch());
			}
		}
		return rootResourceList;
	}

	@Override
	public List<String> loadRoleResourceId(String roleId) {
		List<String> idList=new ArrayList<String>();
		if(!StringUtils.isEmpty(roleId)){
			roleId=EncryptPkUtil.decodeId(roleId);
			// 加载角色对应资源
			idList=this.roleManagerDao.loadRoleResourceId(roleId);
		}
		for (int i = 0; i < idList.size(); i++) {
			idList.set(i, EncryptPkUtil.encodeId(idList.get(i)));
		}
		return idList;
	}

	@Override
	public void assignRoleResources(String roleId, String resourceId) {
		if(!StringUtils.isBlank(roleId) && !StringUtils.isBlank(resourceId)){
			String resourceIds[] = resourceId.split(",");
			//解密
			for (int i = 0; i < resourceIds.length; i++) {
				resourceIds[i]= EncryptPkUtil.decodeId(resourceIds[i]);
			}
			roleId=EncryptPkUtil.decodeId(roleId);
			this.roleManagerDao.deleteRoleResources(roleId);//清空用户原有资源
			this.roleManagerDao.addRoleResource(roleId,resourceIds);//添加用户现有资源
			CustomInvocationSecurityMetadataSourceService.refresh();
		}
	}

}
