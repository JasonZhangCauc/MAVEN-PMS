package com.ps.result.common;

import java.util.List;

import com.github.pagehelper.PageInfo;

/**
 * @Description: 表格插件返回数据实体类
 * @author: HuangPeng
 * @date: 2017年4月15日
 */
public class ListRange{
	
	private Object[] data;
	private long recordsTotal;
	private long recordsFiltered;
	private long draw;
    
	public ListRange(){
		
	}
	/**
	 * 不分页表格数据显示使用
	 * @param data 继承PageParaVo的实体bean的集合
	 */
	public ListRange(List<? extends PageParaVo<?>> data) {
		super();
		this.data = data.toArray();
	}

	/**
	 * 通用分页表格数据显示使用
	 * @param vo 继承PageParaVo的实体bean
	 * @param page 分页封装后PageInfo对象
	 */
	public ListRange(PageParaVo<?> vo,PageInfo<?> page) {
		setDraw(vo.getDraw());
		setData(page.getList().toArray());
		setRecordsFiltered(page.getTotal());
		setRecordsTotal(page.getTotal());
	}
	
	public ListRange(Object[] data, long recordsTotal, long recordsFiltered,
			long draw) {
		super();
		this.data = data;
		this.recordsTotal = recordsTotal;
		this.recordsFiltered = recordsFiltered;
		this.draw = draw;
	}

	public Object[] getData() {
		return data;
	}

	public void setData(Object[] data) {
		this.data = data;
	}

	public long getRecordsTotal() {
		return recordsTotal;
	}

	public void setRecordsTotal(long recordsTotal) {
		this.recordsTotal = recordsTotal;
	}

	public long getRecordsFiltered() {
		return recordsFiltered;
	}

	public void setRecordsFiltered(long recordsFiltered) {
		this.recordsFiltered = recordsFiltered;
	}

	public long getDraw() {
		return draw;
	}

	public void setDraw(long draw) {
		this.draw = draw;
	}
}