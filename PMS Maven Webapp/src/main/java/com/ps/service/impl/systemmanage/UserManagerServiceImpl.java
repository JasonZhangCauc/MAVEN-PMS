package com.ps.service.impl.systemmanage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.GlobalConstants;
import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.result.commentmanage.CommentVO;
import com.ps.result.systemmanage.UserRoleVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.commentmanage.ICommentService;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.systemmanage.IUserManagerService;
import com.util.PropertiesUtil;
import com.util.coder.EncryptPkUtil;
import com.util.coder.MD5;
import com.util.coder.RSAUtils;
import com.util.file.MultiPartUtil;
import com.util.tool.AppUtil;
import com.util.tool.ChunQiuTool;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    用户管理业务逻辑实现类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
@Service
public class UserManagerServiceImpl extends BaseServiceImpl implements IUserManagerService{

	@Autowired
	private UserManagerDao userManagerDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private ICommentService commentService;
	
	@Override
	public List<UserVo> queryUserInfoByParam(UserVo vo) {
		List<UserVo> list=this.userManagerDao.queryUserInfoByParam(vo);
		for (UserVo userVo : list) {
			//加密
			userVo.setId(EncryptPkUtil.encodeId(userVo.getId()));
		}
		return list;
	}

	@Override
	public UserVo saveUser(List<MultipartFile> files,UserVo vo) {
		try {
			if(!files.isEmpty()){
				String serverPath = AppUtil.getServletContextPath();
				PropertiesUtil.setPropertiesName("system.properties");
				String configPath = "/assets/template/userIcon/".concat(ChunQiuTool.getUUID());
				String flieName=files.get(0).getOriginalFilename(); //文件名
				String flieType=flieName.substring(flieName.lastIndexOf(".")); //文件类型
				if(GlobalConstants.uploadType.containsKey(flieType)){
					//上传附件
					MultiPartUtil.uploadFiles(files, serverPath,configPath,flieType);
					vo.setUserPic(configPath+flieType);
				}
			}else{//设置默认头像
				if(StringUtils.equals(vo.getUserSex(),GlobalConstants.ZERO)){//男
					vo.setUserPic("/assets/pages/media/users/avatar80_7.jpg");
				}else if(StringUtils.equals(vo.getUserSex(),GlobalConstants.ONE)){//女
					vo.setUserPic("/assets/pages/media/users/avatar80_2.jpg");
				}
			}
			if (StringUtils.isEmpty(vo.getId())) {
				//录入创建人
				vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//录入更新人
				vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//设置默认密码
				vo.setUserPassword(MD5.getMD5Encode(GlobalConstants.PASSWORD));
				//新增用户信息
				vo.setUserType(GlobalConstants.ZERO);//赋予用户类型
				this.userManagerDao.insertUser(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//录入更新人
				vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//修改用户信息
				vo.setUserType(GlobalConstants.ZERO);//赋予用户类型
				this.userManagerDao.updateUser(vo);
				
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),GlobalConstants.CATEGORYTYPE_R00101, vo.getId());
				}
			}
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
			return vo;
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.syserror"), e);
		}
	}

	@Override
	public UserVo queryUserInfoById(String userId) {
		UserVo vo = new UserVo();
		if(StringUtils.isNotEmpty(userId)){
			String uId = EncryptPkUtil.decodeId(userId);
			vo = this.userManagerDao.queryUserInfoById(uId);
			vo.setId(userId);
			vo.setChangeList(this.commonService.queryChangeRecordByUserId(GlobalConstants.CATEGORYTYPE_R00101,vo.getId()));
			CommentVO commentVo =new CommentVO();
			commentVo.setDataId(EncryptPkUtil.decodeId(vo.getId()));
			commentVo.setFunctionNo(GlobalConstants.CATEGORYTYPE_R00101);
			vo.setCommentUserList(this.commentService.queryCommentUserList(commentVo));
		}
		vo.setLoginUserName(this.getLoginUser().getUserName());
		vo.setCurrentTime(DateUtil.today());
		vo.setLoginUserPic(this.getLoginUser().getUserPic());
		vo.setLoginUserId(this.getLoginUser().getId());
		vo.setFunctionCode(GlobalConstants.CATEGORYTYPE_R00101);
		return vo;
	}
	
	@Override
	public void updateUserStatus(String userId, String status) {
		if(StringUtils.isNotEmpty(userId)){
			userId=EncryptPkUtil.decodeId(userId);
			//1是启用 0是禁用
			if(StringUtils.equals(GlobalConstants.ONE, status)){
				this.userManagerDao.updateUserStatus(userId, GlobalConstants.ZERO);
			}else{
				this.userManagerDao.updateUserStatus(userId, GlobalConstants.ONE);
			}
		}
	}

	@Override
	public void saveUserRole(UserRoleVo vo) {
		try {
			//解密
			String userId = EncryptPkUtil.decodeId(vo.getUserId());
			String roleId[]={};
			//判断所选角色是否为空
			if(StringUtils.isNotBlank(vo.getRoleId())){
				roleId=vo.getRoleId().split(",");
			}
			for (int i = 0; i < roleId.length; i++) {
				 roleId[i]= EncryptPkUtil.decodeId(roleId[i]);
			}
			if(roleId.length>0){
				this.userManagerDao.deleteUserRole(userId);// 先删除此用户的角色
				this.userManagerDao.saveUserRole(userId,roleId);// 再分配角色
			}
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.dateerror"), e);
		}
	}
	
	@Override
	public String resetPassword(String userId) {
		try {
			UserVo vo = new UserVo();
			String Password =  GlobalConstants.PASSWORD;
			String args[]={Password};
			vo.setUserPassword(MD5.getMD5Encode(RSAUtils
					.decryptStringByJs(Password)));
			vo.setUserId(EncryptPkUtil.decodeId(userId));
			this.userManagerDao.resetPassword(vo); // 更新密码
			//返回消息
			BussinessExceptionBean retMessage = new BussinessExceptionBean("message.resetpwdhint",args);
			return retMessage.getErrorMessage();

		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.syserror"), e);
		}
	}

	@Override
	public Map<Object, Object> queryUserInfoByChecking(UserVo vo) {
		Map<Object,Object> map=new HashMap<Object,Object>();
		UserVo user= this.userManagerDao.queryUserInfoByAccount(vo.getUserAccount().trim());
		if(StringUtils.isEmpty(vo.getId())){
			if(user==null){
				map.put("ok", "");
			}else{
				map.put("error", MessageUtil.getMessage("label.userManage.existinputUserAccount"));
			}
		}else{
			UserVo usere= this.userManagerDao.queryUserInfoById(EncryptPkUtil.decodeId(vo.getId()));
			if(usere.getUserAccount().toLowerCase().equals(vo.getUserAccount().trim().toLowerCase())){
				map.put("ok", "");
			}else if(user==null){
				map.put("ok", "");
			}else{
				map.put("error", MessageUtil.getMessage("label.userManage.existinputUserAccount"));
			}
		}
		return map;
	}

	@Override
	public Map<String, Object> verificationIdentityCard(UserVo vo) {
		Map<String,Object> map=new HashMap<String,Object>();
		UserVo user= this.userManagerDao.verificationIdentityCard(vo.getUserIdcard());
		if(StringUtils.isEmpty(vo.getId())){
			if(user==null){
				map.put("ok", "");
			}else{
				map.put("error", MessageUtil.getMessage("label.usermanagement.existinputIdCard"));
			}
		}else{
			UserVo usere= this.userManagerDao.queryUserInfoById(EncryptPkUtil.decodeId(vo.getId()));
			if(StringUtils.equals(usere.getUserIdcard(), vo.getUserIdcard())){
				map.put("ok", "");
			}else if(user==null){
				map.put("ok", "");
			}else{
				map.put("error", MessageUtil.getMessage("label.usermanagement.existinputIdCard"));
			}
		}
		return map;
	}

	@Override
	public List<UserVo> queryUserSelectByParam(UserVo vo) {
		List<UserVo> list=this.userManagerDao.queryUserInfoByParam(vo);
		return list;
	}

	@Override
	public List<UserVo> queryUserInfoByParamSale(UserVo vo) {
		List<UserVo> list=this.userManagerDao.queryUserInfoByParamSale(vo);
		/*for (UserVo userVo : list) {
			userVo.setId(EncryptPkUtil.encodeId(userVo.getId()));
		}*/
		return list;
	}

	@Override
	public Map<String, String> queryUserByDept(String deptId) {
		return this.userManagerDao.queryUserByDept(deptId);
	}

	@Override
	public List<UserVo> businessPeople(UserVo vo) {
		return userManagerDao.businessPeople(vo);
	}

	@Override
	public List<UserVo> projectPeople(UserVo vo) {
		return userManagerDao.projectPeople(vo);
	}

	@Override
	public List<UserVo> responsibleSecondary(UserVo vo) {
		return userManagerDao.responsibleSecondary(vo);
	}

	@Override
	public List<UserVo> productManager(UserVo vo) {
		return userManagerDao.productManager(vo);
	}
	
}
	
