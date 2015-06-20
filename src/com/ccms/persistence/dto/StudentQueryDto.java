package com.ccms.persistence.dto;

public class StudentQueryDto {
	/**
	 * 学年
	 */
	private String year;
	/**
	 * 学号
	 */
	private String num;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 专业id
	 */
	private Integer specId;
	
	/**
	 * 学院id
	 */
	private Integer colId;
	
	/**
	 * 等级id
	 */
	private Integer rankId;
	
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getSpecId() {
		return specId;
	}
	public void setSpecId(Integer specId) {
		this.specId = specId;
	}
	public Integer getColId() {
		return colId;
	}
	public void setColId(Integer colId) {
		this.colId = colId;
	}
	public Integer getRankId() {
		return rankId;
	}
	public void setRankId(Integer rankId) {
		this.rankId = rankId;
	}
}
