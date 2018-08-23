package com.ps.dao.common;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ps.result.common.TableVo;

/**
 * 生成代码工具Dao
 * @author WB010
 *
 */
public interface ProductCodeDao {

	/**
	 * @Description 根据表查询数据表中字段信息
	 * @param tableName 表名
	 * @return List<TableVo> 
	 * @author Wb010
	 * @date 2017年8月21日
	 */
	public List<TableVo> getColumnsByTable(@Param("tableName")String tableName);
}
