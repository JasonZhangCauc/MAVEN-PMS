package com.ps.service.impl.common;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.GlobalConstants;
import com.aop.exception.BussinessException;
import com.aop.exception.BussinessExceptionBean;
import com.ps.dao.common.CommonDao;
import com.ps.dao.common.ProductCodeDao;
import com.ps.dao.common.UserDao;
import com.ps.result.common.ChangeRecordVo;
import com.ps.result.common.TableVo;
import com.ps.result.common.UploadVo;
import com.ps.result.systemmanage.ResourceVo;
import com.ps.result.systemmanage.UserVo;
import com.ps.service.common.ICommonService;
import com.util.coder.EncryptPkUtil;
import com.util.file.MultiPartUtil;
import com.util.tool.AppUtil;
import com.util.tool.ChunQiuTool;

/**
 * @Description: 菜单栏显示
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
@Service
public class CommonServiceImpl extends BaseServiceImpl implements ICommonService {

	@Autowired
	private UserDao userDao;
	
	@Autowired
	private ProductCodeDao productCodeDao;
	
	@Autowired
	private CommonDao commonDao;
	
	@Override
	public String loadMenu(HttpServletRequest request) {
		try {
			UserVo userInfo = (UserVo) request.getSession().getAttribute("user");
			String language = "";
			Object lang = request.getSession().getAttribute("language");
			if (lang == null) {
				language = "ch";
			} else if ("en".equals(lang.toString())) {
				language = "en";
			} else {
				language = "ch";
			}
			if (userInfo == null || "".equals(language)) {
				throw new BussinessException(new BussinessExceptionBean("message.operatefail"));
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("roleList", userInfo.getRoleList());
			List<ResourceVo> resources = this.userDao.getUserResources(map);
			
			StringBuffer menu =new StringBuffer();
			for (ResourceVo resourceVo : resources) {
				//拼装主菜单html
				if("0".equals(resourceVo.getResourceType())){
					menu.append("<li class=\"nav-item start\"><a href='javascript:;' class=\"nav-link nav-toggle\"><i class=\""+resourceVo.getResourceIcon()+"\"></i><span class=\"title\">");// 拼接一级菜单样式前半部分
					if("en".equals(language)){
						menu.append(resourceVo.getResourceDescen()); 
					}else{
						menu.append(resourceVo.getResourceDescch()); 
					}
					menu.append("</span><span class=\"selected\"></span><span class=\"arrow open\"></span></a>");// 拼接一级菜单样式后半部分
					menu.append(getSubNote(resourceVo.getId(),resources,language));				 
					menu.append("</li>");
				}
			}
			return menu.toString();
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.systemeloadmenu"), e);
		}
	}
	/**
	 * 构建二级菜单
	 * @param resourceId 员工ID
	 * @param resources	权限列表
	 * @param language 国际化
	 * @param request
	 * @return
	 */
	public String getSubNote(String id,List<ResourceVo> resources,String language) {
		StringBuffer menuSub =new StringBuffer();
		menuSub.append("<ul class=\"sub-menu\">");// 根据一级菜单添加二级菜单容器样式
		for (ResourceVo resourceVo : resources) {
			if(id.equals(resourceVo.getpId())&&"1".equals(resourceVo.getResourceType())){
				// 添加二级菜单样式前半部分+名称+后半部分+点击事件
				menuSub.append("<li class=\"nav-item start\"><a \"nav-link\" title='"+resourceVo.getResourceDescch()+"' addtabs='"+resourceVo.getResourceCode()+ "' url='"+resourceVo.getResourceUrl()+ "'>");
				//menuSub.append("<li><a style='cursor:pointer;' onclick=\"loadPageMenu('"+resourceVo.getResourceUrl()+ "',this)\" >");
				if("en".equals(language)){
					menuSub.append(resourceVo.getResourceDescen()); 
				}else{
					menuSub.append(resourceVo.getResourceDescch()); 
				}
				menuSub.append("</a></li>");
			}
		}
		menuSub.append("</ul>");
		return menuSub.toString();
	}
	@Override
	public List<TableVo> getColumnsByTable(String tableName) {
		return this.productCodeDao.getColumnsByTable(tableName);
	}
	
	@Override
	public UploadVo saveUploadFiles(List<MultipartFile> files,UserVo userVo,UploadVo parme) {
		try {
			String serverPath = AppUtil.getServletContextPath();
			String configPath = "/assets/template/userIcon/".concat(ChunQiuTool.getUUID());
			String flieName=files.get(0).getOriginalFilename(); //文件名
			String flieType=flieName.substring(flieName.lastIndexOf(".")); //文件类型
			if(GlobalConstants.uploadType.containsKey(flieType)){
				UploadVo uploadVo=new UploadVo();
				uploadVo.setFilePath(configPath+flieType); //文件路径
				uploadVo.setFileType(flieType); //文件类型
				uploadVo.setDataId(EncryptPkUtil.decodeId(parme.getDataId())); //对应数据ID
				uploadVo.setCreateBy(EncryptPkUtil.decodeId(userVo.getId())); //录入人
				uploadVo.setCreateUnit(userVo.getDeptId()); //录入部门
				uploadVo.setFileName(flieName); //文件名
				uploadVo.setPageType(parme.getPageType()); //功能类型
				commonDao.saveFile(uploadVo);
				//上传附件
				MultiPartUtil.uploadFiles(files, serverPath,configPath,flieType);
				return uploadVo;
			}else{
				return null;
			}
		} catch (Exception e) {
			throw new BussinessException(new BussinessExceptionBean("exception.error.syserror"), e);
		}
	}
	@Override
	public List<UploadVo> getAllFileUpload(String pageType, String dataId) {
		dataId = EncryptPkUtil.decodeId(dataId);
		List<UploadVo> list = commonDao.getAllFileUpload(pageType, dataId);
		for (UploadVo uploadVo : list) {
			//加密
			uploadVo.setDataId(EncryptPkUtil.encodeId(uploadVo.getDataId()));
			uploadVo.setId(EncryptPkUtil.encodeId(uploadVo.getId()));
		}
		return list;
	}
	@Override
	public void deleteFile(String fileId) {
		if(StringUtils.isNotEmpty(fileId)){
			commonDao.deleteFile(EncryptPkUtil.decodeId(fileId));
		}
	}
	@Override
	public UploadVo findFileUUIDNameById(String fileid) {
		UploadVo uploadVo = null;
		if(StringUtils.isNotEmpty(fileid)){
			uploadVo = commonDao.findFileUUIDNameById(EncryptPkUtil.decodeId(fileid));
		}else{
			uploadVo = new UploadVo();
		}
		return uploadVo;
	}
	@Override
	public void saveChangeRecode(String changeDetails,String changeType,String changeId) {
		ChangeRecordVo changeRecordVo=new ChangeRecordVo();
		changeRecordVo.setChangeBy(EncryptPkUtil.decodeId(this.getLoginUser().getId()));
		changeRecordVo.setChangeType(changeType);
		changeRecordVo.setChangeContent(changeDetails);
		changeRecordVo.setChangeId(changeId);
		this.commonDao.saveChangeRecord(changeRecordVo);
	}
	
	@Override
	public List<ChangeRecordVo> queryChangeRecordByParam(
			ChangeRecordVo changeRecordVo) {
		//解密
		changeRecordVo.setChangeId(EncryptPkUtil.decodeId(changeRecordVo.getChangeId()));
		List<ChangeRecordVo> changeRecordVos=this.commonDao.queryChangeRecordByParam(changeRecordVo);
		for (ChangeRecordVo changeRecordVo2 : changeRecordVos) {
			//加密
			changeRecordVo2.setId(EncryptPkUtil.encodeId(changeRecordVo2.getId()));
			changeRecordVo2.setChangeId(EncryptPkUtil.encodeId(changeRecordVo2.getChangeId()));
		}
		return changeRecordVos;
	}
	
	@Override
	public List<ChangeRecordVo> queryChangeRecordByUserId(String changeType,String changeId) {
		ChangeRecordVo changeRecordVo=new ChangeRecordVo();
		changeRecordVo.setChangeId(EncryptPkUtil.decodeId(changeId));
		changeRecordVo.setChangeType(changeType);
		changeRecordVo.setAuthDeptId(this.getLoginUser().getDeptId());
		List<ChangeRecordVo> changeRecordVos=this.commonDao.queryChangeRecordByParam(changeRecordVo);
		for (ChangeRecordVo changeRecordVo2 : changeRecordVos) {
			//加密
			changeRecordVo2.setId(EncryptPkUtil.encodeId(changeRecordVo2.getId()));
			changeRecordVo2.setChangeId(EncryptPkUtil.encodeId(changeRecordVo2.getChangeId()));
		}
		return changeRecordVos;
	}
	
	
	
}
