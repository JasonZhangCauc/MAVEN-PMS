package com.ps.service.impl.presalemanage;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.presalemanage.LinkerManageDao;
import com.ps.dao.systemmanage.RoleManagerDao;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.result.presalemanage.LinkerVo;
import com.ps.result.systemmanage.RoleVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.presalemanage.ILinkerManageService;
import com.util.coder.EncryptPkUtil;
import com.util.coder.MD5;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    客户联系人管理业务逻辑实现类
 * @author:         raomingyi
 * @date:           2018-03-05
 */
@Service
public class LinkerManageServiceImpl extends BaseServiceImpl implements ILinkerManageService{
	
	@Autowired
	private LinkerManageDao linkerManageDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private UserManagerDao userManagerDao;
	
	@Autowired
	private RoleManagerDao roleManagerDao;
	
	
	
	@Override
	public List<LinkerVo> queryLinkerInfoByParam(LinkerVo param) {
		//解密
		if(param.getCustomerId()!=null){
			if(StringUtils.isNotBlank(param.getCustomerId())){
				param.setCustomerId(EncryptPkUtil.decodeId(param.getCustomerId()));
			}
		}
		List<LinkerVo> dataList = new ArrayList<LinkerVo>();
		if(param.getCustomerId()!=null){
			dataList = this.linkerManageDao.queryLinkerInfoByParam(param);
		}else{
			//如果联系人为主表
			if(param.getContactCustome()!=null){
				if(param.getContactCustome().equals(GlobalConstants.ONE)){
					dataList = this.linkerManageDao.queryLinkerInfoByParam(param);
				}else{
					//如果客户为主表
					dataList = this.linkerManageDao.queryLinkerInfoByParamCustomeName(param);
				}
			}else{
				dataList = this.linkerManageDao.queryLinkerInfoByParam(param);
			}
			
		}
		//客户ID不能为空
		
		for (LinkerVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public LinkerVo queryLinkerInfoById(String id) {
		String temId = id;
		LinkerVo vo = new LinkerVo();
		if(!StringUtils.isBlank(id)){
            //解密
			id = EncryptPkUtil.decodeId(id);
			vo = this.linkerManageDao.queryLinkerById(id);
			if(vo != null){
				vo.setId(temId);
			}
		}
		vo.setCurrentTime(DateUtil.today());
		return vo;
	}
	
	@Override
	public void saveLinker(LinkerVo vo){
		if(StringUtils.isBlank(vo.getId())){				
			//录入创建人
			vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//解密
			vo.setCustomerId(EncryptPkUtil.decodeId(vo.getCustomerId()));
			if(!StringUtils.isBlank(vo.getCustomerIdNew())){
				vo.setCustomerId(EncryptPkUtil.decodeId(vo.getCustomerIdNew()));
			}
			//新增联系人
			this.linkerManageDao.insertLinker(vo);
			//数据同步进用户表
			String fhid = this.operationLinker(vo,vo.getId());
			//赋予客户默认角色
			UserVo userRole = new UserVo();
			userRole.setUserId(fhid);//用户信息添加成功之后返回的数据
			//根据角色标识码查询客户默认角色
			RoleVo role = new RoleVo();
			role.setRoleCode(GlobalConstants.ROLE_CODE);//角色标识码
			role = roleManagerDao.getRoleInfoByRoleCode(role);//根据角色标志码查询
			userRole.setRoleId(role.getId());//角色id
			userManagerDao.saveUserRoleOneToOne(userRole);//赋予角色
			
		}else{
			//解密
			vo.setId(EncryptPkUtil.decodeId(vo.getId()));
			//录入更新人
			vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
			//更新联系人
			this.linkerManageDao.updateLinker(vo);
			
			//更新用户表信息
			this.operationLinkerUpdate(vo);
			
			//记录变更记录
			if(StringUtils.isNotBlank(vo.getChangeDetails())){
				commonService.saveChangeRecode(vo.getChangeDetails(),"R0020103", vo.getId());
			}
		}
	}
	
	public String operationLinker(LinkerVo vo,String id){
		//同步数据进入用户表（新增）
		UserVo user = new UserVo();
		user.setUserName(vo.getContactName());//姓名
		user.setUserAccount(vo.getMobilePhone());//工号（同联系人电话号码）
		user.setUserEmail(vo.getEmail());//邮箱
		user.setUserPosition(GlobalConstants.ZERO);//岗位
		user.setUserAge(GlobalConstants.AGE);//年龄
		//user.setUserIdcard(GlobalConstants.CARID);//默认身份证号
		user.setUserMobile(vo.getMobilePhone());//手机
		user.setUserNature(GlobalConstants.ONE);//默认用户性质
		user.setUserBirth(GlobalConstants.DATE);//默认日期
		user.setEntryDate(GlobalConstants.DATE);//入职日期
		user.setUserPic("/assets/pages/media/users/avatar80_7.jpg");//默认头像
		user.setUserSex(GlobalConstants.ONE);//默认性别
		user.setDeptId(this.getLoginUser().getDeptId());//部门（取当前登录人所在的部门）
		//录入创建人
		user.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		//录入更新人
		user.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		//设置默认密码
		user.setUserPassword(MD5.getMD5Encode(GlobalConstants.PASSWORD));
		user.setUserType(GlobalConstants.ONE);//默认客户
		user.setContactId(id);//客户联系id
		this.userManagerDao.saveUser(user);
		String fhUserId = user.getId();
		return fhUserId;
	}

	public void operationLinkerUpdate(LinkerVo vo){
		UserVo us = new UserVo();
		//解密
		us.setId(EncryptPkUtil.decodeId(vo.getId()));
		//录入更新人
		us.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		us.setUserName(vo.getContactName());//姓名
		us.setUserAccount(vo.getMobilePhone());//工号（同联系人电话号码）
		us.setUserEmail(vo.getEmail());//邮箱
		us.setUserPosition(GlobalConstants.ZERO);//岗位
		us.setUserAge(GlobalConstants.AGE);//年龄
		//user.setUserIdcard(GlobalConstants.CARID);//默认身份证号
		us.setUserMobile(vo.getMobilePhone());//手机
		us.setUserNature(GlobalConstants.ONE);//默认用户性质
		us.setUserBirth(GlobalConstants.DATE);//默认日期
		us.setEntryDate(GlobalConstants.DATE);//入职日期
		us.setUserPic("/assets/pages/media/users/avatar80_7.jpg");//默认头像
		us.setUserSex(GlobalConstants.ONE);//默认性别
		us.setDeptId(this.getLoginUser().getDeptId());//部门（取当前登录人所在的部门）
		//录入创建人
		us.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		//设置默认密码
		us.setUserPassword(MD5.getMD5Encode(GlobalConstants.PASSWORD));
		us.setUserType(GlobalConstants.ONE);//默认客户
		//对应联系id
		us.setContactId(vo.getId());
		//修改用户信息
		this.userManagerDao.updateUserByContactId(us);
	}
	
	@Override
	public void deleteLinkerById(String id){
		if(StringUtils.isNotEmpty(id)){
		    //解密
			id = EncryptPkUtil.decodeId(id);
			LinkerVo linkerVo = this.linkerManageDao.queryLinkerById(id);
			this.linkerManageDao.deleteLinkerByIdPhysical(id);
			//记录变更记录	
			commonService.saveChangeRecode("删除联系人"+linkerVo.getContactName(),"R00201",linkerVo.getCustomerId());
			//同时删除用户表数据
			userManagerDao.deleteUserByContactIdPhysical(id);
		}
	}
	@Override
	public List<LinkerVo> getCustomLinker(String customId) {
		//如果客户id为空则返回空list
		List<LinkerVo> dataList = new ArrayList<LinkerVo>();
		if(!customId.equals("")){
			dataList = this.linkerManageDao.getCustomLinker(EncryptPkUtil.decodeId(customId));
		}
		for (LinkerVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public Map<Object, Object> queryPhoneByChecking(LinkerVo vo) {
		Map<Object,Object> map=new HashMap<Object,Object>();
		LinkerVo user= this.linkerManageDao.queryPhoneByAccount(vo.getMobilePhone().trim());
		if(StringUtils.isEmpty(vo.getId())){
			if(user==null){
				map.put("ok", "");
			}else{
				map.put("error", MessageUtil.getMessage("label.userManage.existinputPhone"));
			}
		}else{
			LinkerVo usere= this.linkerManageDao.queryPhoneById(EncryptPkUtil.decodeId(vo.getId()));
			if(usere.getMobilePhone().toLowerCase().equals(vo.getMobilePhone().trim().toLowerCase())){
				map.put("ok", "");
			}else if(user==null){
				map.put("ok", "");
			}else{
				map.put("error", MessageUtil.getMessage("label.userManage.existinputPhone"));
			}
		}
		return map;
	}

}
