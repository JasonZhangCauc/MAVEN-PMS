package com.${projectName}.service.${packageName};

import java.util.List;

import com.${projectName}.vo.${packageName}.${objectName}Vo;
import com.${projectName}.param.${packageName}.${objectName}ParamVo;

/**
 * @Description:    接口类
 * @author:         ${author}
 * @date:           ${nowDate?string("yyyy-MM-dd")}
 */
public interface I${objectName}Service {

	/**
	 * @Description: 查询列表信息
	 * @author:      ${author}
	 * @param:       ${objectName}Vo
	 * @return:      List<${objectName}Vo>数据列表   
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	List<${objectName}Vo> query${objectName}InfoByParam(${objectName}ParamVo param);
	
	/**
	 * @Description: 根据ID查询数据信息
	 * @author:      ${author}
	 * @param:       id
	 * @return:      ${objectName}Vo数据   
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	${objectName}Vo query${objectName}InfoById(String id);
	
	/**
	 * @Description: 保存信息
	 * @author:      ${author}
	 * @param:       ${objectName}Vo   
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	void save${objectName}(${objectName}Vo vo);
	
	/**
	 * @Description: 根据ID删除信息
	 * @author:      ${author}
	 * @param:       id 
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	void delete${objectName}ById(String id);
}

