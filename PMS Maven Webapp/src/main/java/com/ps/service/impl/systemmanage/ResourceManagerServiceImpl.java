package com.ps.service.impl.systemmanage;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.GlobalConstants;
import com.ps.dao.systemmanage.ResourceManagerDao;
import com.ps.result.systemmanage.ResourceVo;
import com.ps.service.impl.common.BaseServiceImpl;
import com.ps.service.systemmanage.IResourceManagerService;
import com.util.coder.EncryptPkUtil;

/**
 * @Description:    资源管理业务逻辑实现类
 * @author:         ZHOUMIN
 * @date:           2018-03-02
 */
@Service
public class ResourceManagerServiceImpl extends BaseServiceImpl implements IResourceManagerService{
	
	@Autowired
	private ResourceManagerDao resourceManagerDao;

	@Override
	public List<ResourceVo> loadResourceTree(String language) {
		List<ResourceVo> rootResourceList=new ArrayList<ResourceVo>();
		rootResourceList = this.resourceManagerDao.loadResourceTree();
		for (ResourceVo resourceVo : rootResourceList) {
			//加密
			resourceVo.setId(resourceVo.getId());
			resourceVo.setpId(resourceVo.getpId());
			if("en".equals(language)){
				resourceVo.setName(resourceVo.getResourceDescen());
			}else{
				resourceVo.setName(resourceVo.getResourceDescch());
			}
		}
		ResourceVo resourceVo= new ResourceVo();
		resourceVo.setId(GlobalConstants.ZERO);
		resourceVo.setpId(GlobalConstants.ZERO);
		resourceVo.setName("根目录");
		rootResourceList.add(resourceVo);
		return rootResourceList;
	}

	@Override
	public void resourceMobile(String resourceId, String targetId) {
		this.resourceManagerDao.updateResourcePid(resourceId, targetId);
	}

	@Override
	public void resourceDisableOrEnable(String resourceId, String resourceFlag) {
		if(StringUtils.equals(resourceFlag,GlobalConstants.ZERO)){
			this.resourceManagerDao.updateResourceFlag(resourceId, GlobalConstants.ONE);
		}else{
			this.resourceManagerDao.updateResourceFlag(resourceId, GlobalConstants.ZERO);
		}
	}

	@Override
	public ResourceVo queryResourceById(String resourceId,String pId) {
		ResourceVo resourceVo=new ResourceVo();
		if(StringUtils.isNotBlank(resourceId)){
			resourceVo=this.resourceManagerDao.queryResourceById(resourceId);
			resourceVo.setId(EncryptPkUtil.encodeId(resourceId));
		}else{
			if(StringUtils.equals(pId, GlobalConstants.ZERO)){
				resourceVo.setpId(pId);
				resourceVo.setResourceType(GlobalConstants.ZERO);
			}else{
				resourceVo.setpId(pId);
				resourceVo.setResourceType(GlobalConstants.ONE);
			}
		}
		return resourceVo;
	}

	@Override
	public void saveResource(ResourceVo resourceVo) {
		if(StringUtils.isBlank(resourceVo.getId())){
			//新增
			this.resourceManagerDao.insertResource(resourceVo);
		}else{
			//加密
			resourceVo.setId(EncryptPkUtil.decodeId(resourceVo.getId()));
			//修改
			this.resourceManagerDao.updateResource(resourceVo);
		}
	}
	
	
}
