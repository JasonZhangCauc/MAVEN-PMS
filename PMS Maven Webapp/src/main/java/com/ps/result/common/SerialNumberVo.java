package com.ps.result.common;

import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Description:    编号生成表
 * @author:         邵国松
 * @date:           2017-08-25
 */
public class SerialNumberVo {

	public String tableName;// 表名

	public String columnName;// 编号字段名

	public String idColumn;// 表中主键字段名

	public String page;

	public String numPrefix;

	public String getIdColumn() {
		return idColumn;
	}

	public void setIdColumn(String idColumn) {
		this.idColumn = idColumn;
	}

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

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
		switch (Integer.parseInt(page)) {
			case 1:{
				this.tableName = "SMS_SAFEREPORT";//对应数据库表
				this.columnName = "SAFEREPORT_NO";//对应数据库表生成编号的字段
				this.idColumn = "ID";//对应数据库表的主键
				this.numPrefix =  'R'+"-"+this.getDateFormatString("yyyyMMdd")+"-";//编号生成的规则
				break;
			}
			case 2:{ //检查单库
				this.tableName = "SMS_CHECKLIST_LIB";//对应数据库表
				this.columnName = "CHECKLIST_NUM";//对应数据库表生成编号的字段
				this.idColumn = "ID";//对应数据库表的主键
				this.numPrefix =  "AQJCD"+"-"+this.getDateFormatString("yyyyMMdd")+"-";//编号生成的规则
				break;
			}
			case 3:{ //隐患管理
				this.tableName = "SMS_HIDDANGER_MANAGE";//对应数据库表
				this.columnName = "HIDDANGER_NUMBER";//对应数据库表生成编号的字段
				this.idColumn = "ID";//对应数据库表的主键
				this.numPrefix =  "DG"+"-"+this.getDateFormatString("yyyyMMdd")+"-";//编号生成的规则
				break;
			}
			case 4:{ //自愿报告
				this.tableName = "SMS_ACTIVE_REPORT";//对应数据库表
				this.columnName = "REPORT_NUMER";//对应数据库表生成编号的字段
				this.idColumn = "ID";//对应数据库表的主键
				this.numPrefix =  "Q"+"-"+this.getDateFormatString("yyyyMMdd")+"-";//编号生成的规则
				break;
			}
			default:break;
		}
	}

	public String getNumPrefix() {
		return numPrefix;
	}

	public void setNumPrefix(String numPrefix) {
		this.numPrefix = numPrefix;
	}
	
	/**
	 * 获取当日时间 格式：
	 * @param pattern 例如：yyyy-MM
	 * @return
	 */
	private String getDateFormatString(String pattern) {
		SimpleDateFormat format = new SimpleDateFormat(pattern);
		Date date = new Date();
		String dateFormat = format.format(date);
		return dateFormat;
	}
}
