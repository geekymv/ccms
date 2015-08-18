package com.ccms.persistence.vo;

public class RankVO {
	
	private Integer id;
	/**
	 * 学生id
	 */
	private Integer stuId;
	/**
	 * 学生学号
	 */
	private String num;
	/**
	 * 学生受助等级名称
	 */
	private String rankName;
	/**
	 * 受助年份
	 */
	private String year;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getStuId() {
		return stuId;
	}
	public void setStuId(Integer stuId) {
		this.stuId = stuId;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getRankName() {
		return rankName;
	}
	public void setRankName(String rankName) {
		this.rankName = rankName;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
}
