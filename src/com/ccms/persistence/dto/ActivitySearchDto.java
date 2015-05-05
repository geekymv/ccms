package com.ccms.persistence.dto;

public class ActivitySearchDto {
	/**
	 * 发布单位名称
	 */
	private String collegeName;
	
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
	
}
