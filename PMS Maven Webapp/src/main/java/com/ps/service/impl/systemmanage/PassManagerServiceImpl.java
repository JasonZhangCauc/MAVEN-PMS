package com.ps.service.impl.systemmanage;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.ps.dao.systemmanage.PassManagerDao;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.result.systemmanage.PasswordVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.systemmanage.IPassManagerService;
import com.util.coder.MD5;
import com.util.coder.RSAUtils;
import com.util.tool.ChunQiuTool;


/**
 * @Description:    密码管理业务逻辑实现类
 * @author:         HuangPeng
 * @date:           2017年4月15日
 */
@Service
public class PassManagerServiceImpl implements IPassManagerService{
	
	@Autowired
	private PassManagerDao passManagerDao;
	
	@Autowired
	private UserManagerDao userManagerDao;
	
	@Override
	public boolean validateUserFirstLoginOrNot(String loginId) {
		try {
			String flag=passManagerDao.validateUserFirstLoginOrNot(loginId);
			if(StringUtils.isNotBlank(flag) && flag.equals(GlobalConstants.ZERO)){
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("message.operatefail"));
		}
		
	}
	
	@Override
	public UserVo updatePassword(PasswordVo vo,UserVo loginUser) {
		UserVo userInfo=null;
		if(loginUser !=null){
			userInfo= userManagerDao.queryUserInfoByAccount(loginUser.getUserAccount());
		}
		String flag = "";
		vo.setOldPassword(RSAUtils.decryptStringByJs(vo.getOldPassword()));
		String md5Password = MD5.getMD5Encode(vo.getOldPassword());//密码加密
		if (userInfo !=null && userInfo.getUserPassword().equals(md5Password)) {//判断加密的密码是否一致
			vo.setConfirmPass(RSAUtils.decryptStringByJs(vo.getConfirmPass()));
			vo.setNewPassword(RSAUtils.decryptStringByJs(vo.getNewPassword()));
			if(!vo.getOldPassword().equals(vo.getNewPassword())){
				if (StringUtils.equals(vo.getConfirmPass(), vo.getNewPassword())) {//判断确认密码和新密码是否相同
					String regex="^(?![0-9]+$)(?![A-Za-z]+$)(?![^A-Za-z0-9]+$)([^\\f\\n\\r\\t\\v\\s]){6,20}$";
					Pattern pattern=Pattern.compile(regex);
					Matcher matcher=pattern.matcher(vo.getNewPassword());
					if(matcher.matches()){//验证通过
					   String Password = ChunQiuTool.MD5(vo.getNewPassword());//将新密码加密
						vo.setNewPassword(Password);//重新设置密码
						vo.setUserId(userInfo.getId());
						this.passManagerDao.updatePassword(vo);	//更新密码		
						flag = GlobalConstants.SUCCESS;	//返回成功	 
				   }else{
					   flag= GlobalConstants.NOTMATCH;
				   }
				}else{
					flag= GlobalConstants.ERROR;//当密码不一致返回error
				}
			}else{
				flag= GlobalConstants.SAME;//当新密码与原密码相同返回same
			}
		} else {
			flag= GlobalConstants.FAIL;//当原密码不一致返回fail
		}
		loginUser.setFlag(flag);
		return loginUser;
	}
}
