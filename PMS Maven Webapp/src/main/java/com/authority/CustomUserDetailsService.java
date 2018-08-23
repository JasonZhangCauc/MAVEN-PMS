package com.authority;

import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.MDC;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.ps.dao.common.UserDao;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.result.systemmanage.UserVo;

@Service
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private UserManagerDao userManagerDao;
	
	/**
	 * 根据登陆的用户名加载用户的所有角色权限
	 * @param
	 * @return
	 * @throws Exception
	 */
	@Override
	public UserDetails loadUserByUsername (String userAccount) throws UsernameNotFoundException{
		UserVo userInfo = new UserVo();
		try {
			userInfo=userManagerDao.queryUserInfoByAccount(userAccount);
			userInfo.setRoleList(userDao.getUserRolesByUserAccount(userAccount));
			if (userInfo.getRoleList() != null && !userInfo.getRoleList().isEmpty()) {
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("roleList", userInfo.getRoleList());
				userInfo.setResources(userDao.getUserResources(map));
			}
			
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.systemeloadmenu"), e);
		}
		String password = userInfo.getUserPassword().toUpperCase();
		if(userInfo.getUserPassword()==null||"".equals(userInfo.getUserPassword()))
		{
			throw new UsernameNotFoundException("Can't find the user "+userAccount);
		}
		Set<GrantedAuthority> grantedAuths = obtionGrantedAuthorities(userInfo.getRoleList());
		UserDetails userDetails = new User(userAccount, password, true, true, true, true,
				grantedAuths);
		MDC.put("username", userDetails.getUsername());
		return userDetails;
	}
	
	private Set<GrantedAuthority> obtionGrantedAuthorities(List<String> roleNameList) {
		Set<GrantedAuthority> set = new HashSet<GrantedAuthority>();
		for (String roleName : roleNameList) {
			set.add(new SimpleGrantedAuthority(roleName));
		}	
		return set;
	}
}