package com.util.file;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.ps.result.common.ExportVo;
import com.util.PropertiesUtil;

public class ExportUtil {
	
	public static ExportVo setExportData(List<Map<String,String>> dataList,String sheetTitle,String headers,String methods){
		//获取导出字段
		PropertiesUtil.setPropertiesName("config.properties");
		//定义第一张sheet的内容
		ExportVo  sheetVo =new ExportVo();
		String columnsString = PropertiesUtil.getProperty(headers);
		//数据列
		String[] strColumns = columnsString.split(",");
		sheetVo.setSheetTitle(sheetTitle);
		sheetVo.setRowheadList(strColumns);
		
		List<List<String>> sheetdataList = new ArrayList<List<String>>();
		String methodGetter = PropertiesUtil.getProperty(methods);
		//数据列
		String[] strMethods = methodGetter.split(",");
		for(Map<String,String> map:dataList){
			List<String> sheetColList = new ArrayList<String>();
			for(String method:strMethods){
				sheetColList.add(map.get(method));
			}
			sheetdataList.add(sheetColList);
		}
		sheetVo.setContentDataList(sheetdataList);
		return sheetVo;
	}
}
