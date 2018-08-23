package com.ps.service.impl.presalemanage;

import java.util.ArrayList;
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
import com.ps.dao.presalemanage.CustomManageDao;
import com.ps.dao.presalemanage.LinkerManageDao;
import com.ps.dao.systemmanage.UserManagerDao;
import com.ps.result.presalemanage.CustomerVo;
import com.ps.result.presalemanage.LinkerVo;
import com.ps.service.common.ICommonService;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.presalemanage.ICustomManageService;
import com.util.PropertiesUtil;
import com.util.coder.EncryptPkUtil;
import com.util.file.MultiPartUtil;
import com.util.tool.AppUtil;
import com.util.tool.ChunQiuTool;
import com.util.tool.DateUtil;
import com.util.tool.MessageUtil;

/**
 * @Description:    客户管理业务逻辑实现类
 * @author:         raomingyi
 * @date:           2018-03-02
 */
@Service
public class CustomManageServiceImpl extends BaseServiceImpl implements ICustomManageService{
	
	@Autowired
	private CustomManageDao customManageDao;
	
	@Autowired
	private ICommonService commonService;
	
	@Autowired
	private LinkerManageDao linkerManageDao;
	
	@Autowired
	private UserManagerDao userManagerDao;

	@Override
	public List<CustomerVo> queryCustomInfoByParam(CustomerVo param) {
		//根据查询条件分别查询不同的结构
		//如果客户为主表
		List<CustomerVo> dataList = new ArrayList<CustomerVo>();
		if(param.getCustomeContact()!=null){
			if(param.getCustomeContact().equals(GlobalConstants.ONE)){
				dataList = this.customManageDao.queryCustomInfoByParam(param);
			}else{
				//如果不是主表，则通过传进来的字段查询联系人姓名，然后通过姓名带出对应的客户
				dataList = this.customManageDao.queryCustomInfoByParamByContact(param);
			}
		}else{
			dataList = this.customManageDao.queryCustomInfoByParam(param);
		}
		
		
		for (CustomerVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public CustomerVo queryCustomInfoById(String id) {
		String temId = id;
		CustomerVo vo = new CustomerVo();
		if(!StringUtils.isBlank(temId)){		
			id = EncryptPkUtil.decodeId(id);
			vo = this.customManageDao.queryCustomById(id);
			if(vo != null){
				vo.setId(temId);
			}
		}
		vo.setCurrentTime(DateUtil.today());
		return vo;
	}
	
	@Override
	public void saveCustom(List<MultipartFile> files,CustomerVo vo){
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
				vo.setUserPic("/assets/pages/media/users/avatar80_7.jpg");
			}
			if(StringUtils.isEmpty(vo.getId())){
				//录入创建人
				vo.setCreateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//录入更新人
				vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//新增
				this.customManageDao.insertCustom(vo);
			}else{
				//解密
				vo.setId(EncryptPkUtil.decodeId(vo.getId()));
				//录入更新人
				vo.setUpdateBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
				//修改
				this.customManageDao.updateCustom(vo);
				
				//记录变更记录
				if(StringUtils.isNotBlank(vo.getChangeDetails())){
					commonService.saveChangeRecode(vo.getChangeDetails(),"R00201", vo.getId());
				}
			}
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.syserror"), e);
		}
	}

	@Override
	public void deleteCustomById(String id){
		if(StringUtils.isNotEmpty(id)){
		  //解密
			id = EncryptPkUtil.decodeId(id);
			this.customManageDao.deleteCustomById(id);
		}
		//删除客户以及客户下面的联系人对应的用户信息
		//根据客户查询下面的用户有哪些
		LinkerVo vo = new LinkerVo();
		vo.setCustomerId(id);
		List<LinkerVo> list = this.linkerManageDao.queryLinkerInfoByParam(vo);
		String ids = "";
		//把联系人id记录下来
		for (LinkerVo linkerVo : list) {
			ids +=","+linkerVo.getId();
		}
		//当联系人id不为空时删除用户
		if(!ids.equals("")){
			this.userManagerDao.deleteUserByContactId(ids.substring(1).split(","));
		}
		//删联系人
		this.linkerManageDao.deleteLinkerByCustomerId(id);
		
	}

	@Override
	public List<CustomerVo> getAllCustomerInfo() {
		List<CustomerVo> dataList = this.customManageDao.getAllCustomerInfo();
		for (CustomerVo vo : dataList) {
			//加密
			vo.setId(EncryptPkUtil.encodeId(vo.getId()));
		}
		return dataList;
	}

	@Override
	public Map<Object, Object> querySecondByChecking(CustomerVo vo) {
		Map<Object,Object> map=new HashMap<Object,Object>();
		CustomerVo user= this.customManageDao.querySecondByAccount(vo.getSecond().trim());
		if(StringUtils.isEmpty(vo.getId())){
			if(user==null){
				map.put("ok", "");
			}else{
				map.put("error", MessageUtil.getMessage("label.userManage.second"));
			}
		}else{
			CustomerVo usere= this.customManageDao.querySecondById(EncryptPkUtil.decodeId(vo.getId()));
			if(!StringUtils.isBlank(usere.getSecond())){
				if(usere.getSecond().toLowerCase().equals(vo.getSecond().trim().toLowerCase())){
					map.put("ok", "");
				}else if(user==null){
					map.put("ok", "");
				}else{
					map.put("error", MessageUtil.getMessage("label.userManage.second"));
				}
			}else{
				if(user==null){
					map.put("ok", "");
				}else{
					map.put("error", MessageUtil.getMessage("label.userManage.second"));
				}
			}
			
		}
		return map;
	}
	
}
