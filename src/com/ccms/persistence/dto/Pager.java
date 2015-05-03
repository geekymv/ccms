package com.ccms.persistence.dto;

import java.util.List;

public class Pager<T> {
	
	private int pageIndex;	// 第几页
	private int pageSize = 10;	// 每页显示多少条记录
	private int totalRecord; // 总记录数
	private int totalPage; // 总页数
	private int pageOffset;
	
	private List<T> datas;

	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}

	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageOffset() {
		return pageOffset;
	}
	public void setPageOffset(int pageOffset) {
		this.pageOffset = pageOffset;
	}
	
	/**
	 * 设置偏移
	 * @param pageIndex
	 * @param pageSize
	 */
	public void setPageOffset(int pageIndex, int pageSize) {
		this.pageOffset = pageIndex * pageSize;
	}
	
	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}

}
