package com.ccms.persistence.dto;

public class StudentQueryDto {
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
	 * 等级id
	 */
	private Integer rankId;
	
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
	public Integer getRankId() {
		return rankId;
	}
	public void setRankId(Integer rankId) {
		this.rankId = rankId;
	}
}
