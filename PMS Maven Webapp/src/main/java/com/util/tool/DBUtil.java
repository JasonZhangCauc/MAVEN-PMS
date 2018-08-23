package com.util.tool;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
 
/**
 * @Description:    APP
 * @author          HuangPeng
 * @version         1.0.0
 * @date:           2017年4月15日
 */
public class DBUtil{
	public static Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			String url = "jdbc:oracle:thin:@192.168.210.58:1521:spring";
			String user = "ZBAA";
			String pass = "ZBAA";
			conn = DriverManager.getConnection(url, user, pass);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public static List<String> getTableCol(String table) {
		List<String> list = new ArrayList<String>();
		Connection conn = getConnection();
		String sql = "select * from "+table;
		PreparedStatement stmt;
		try {
			stmt = conn.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery(sql);
			ResultSetMetaData data = rs.getMetaData();
			for (int i = 1; i <= data.getColumnCount(); i++) {
				// 获得指定列的列名
				String columnName = data.getColumnName(i);
				String name = StringUtils.lowerCase(columnName);
				int ind = name.indexOf("_");
				if(ind>0){
					name = name.substring(0, ind) 
							+ StringUtils.upperCase(name.substring(ind+1,ind+2))
							+ name.substring(ind+2, name.length());
				}
				list.add(name);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}
