package com.${projectName}.dao.${packageName};

import java.util.List;

import org.apache.ibatis.annotations.Param;
import com.${projectName}.vo.${packageName}.${objectName}Vo;
import com.${projectName}.param.${packageName}.${objectName}ParamVo;

/**
 * @Description:    DAO接口 
 * @author:         ${author}
 * @date:           ${nowDate?string("yyyy-MM-dd")}
 */
public interface ${objectName}Dao{
	
	/**
	 * @Description: 根据参数查询列表信息
	 * @author:      ${author}
	 * @param:       ${objectName}Vo
	 * @return:      ${objectName}Vo 列表信息
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	List<${objectName}Vo> query${objectName}InfoByParam(${objectName}ParamVo param);
	
	/**
	 * @Description: 根据ID查询列表信息
	 * @author:      ${author}
	 * @param:       id
	 * @return:      ${objectName}Vo 数据信息
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	public ${objectName}Vo query${objectName}ById(@Param("id")String id);
	
	/**
	 * @Description: 新增信息
	 * @author:      ${author}
	 * @param:       ${objectName}Vo
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	public void insert${objectName}(@Param("vo")${objectName}Vo vo);
	
	/**
	 * @Description: 修改信息
	 * @author:      ${author}
	 * @param:       ${objectName}Vo
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	public void update${objectName}(@Param("vo")${objectName}Vo vo);
	
	/**
	 * @Description: 删除信息
	 * @author:      ${author}
	 * @param:       id
	 * @date:        ${nowDate?string("yyyy-MM-dd")}
	 */
	public void delete${objectName}ById(@Param("id")String id);
}
