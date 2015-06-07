package com.ccms.persistence.dto;

public class ActivitySearchDto {
	/**
	 * 发布单位名称
	 */
	private String collegeName;
	
	/**
	 * 学生所在学院id
	 */
	private String colId;
	
	/**
	 * 活动类型id
	 */
	public Integer actType;

	public String getCollegeName() {
		return collegeName;
	}
	public void setCollegeName(String collegeName) {
		this.collegeName = collegeName;
	}

	public Integer getActType() {
		return actType;
	}
	public void setActType(Integer actType) {
		this.actType = actType;
	}
	public String getColId() {
		return colId;
	}
	public void setColId(String colId) {
		this.colId = colId;
	}
	
}
