package com.ps.result.common;

import java.util.List;

/**
 * @Description: 导出数据封装实体类
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
public class ExportVo {
	private String sheetTitle;//每个sheet页的大标题
	private String[] rowheadList;//表头
	private List<List<String>> contentDataList;//表内容 所有数据list
	public String getSheetTitle() {
		return sheetTitle;
	}
	public void setSheetTitle(String sheetTitle) {
		this.sheetTitle = sheetTitle;
	}
	public String[] getRowheadList() {
		return rowheadList;
	}
	public void setRowheadList(String[] rowheadList) {
		this.rowheadList = rowheadList;
	}
	public List<List<String>> getContentDataList() {
		return contentDataList;
	}
	public void setContentDataList(List<List<String>> contentDataList) {
		this.contentDataList = contentDataList;
	}
}
