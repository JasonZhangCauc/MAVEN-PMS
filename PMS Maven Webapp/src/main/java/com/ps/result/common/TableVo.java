package com.ps.result.common;


/**
 * 数据表Vo，生成代码使用
 * @author WB010
 *
 */
public class TableVo {
	private String tableName;	//表名
	private String columnName;	//数据库中字段名
	private String reColName;	//重命名
	public String getReColName() {
		return reColName;
	}
	public void setReColName(String reColName) {
		this.reColName = reColName;
	}
	private String comments;	//注释
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getColumnName() {
		return columnName;
	}
	public void setColumnName(String columnName) {
		this.columnName = columnName;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
}
