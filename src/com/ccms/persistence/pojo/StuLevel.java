package com.ccms.persistence.pojo;

/**
 * 
 * @author miying
 */
public class StuLevel {
	
	public StuLevel() {
	}
	
	public StuLevel(String num, Integer rankId, String year) {
		this.num = num;
		this.rankId = rankId;
		this.year = year;
	}

	/**
	 * 主键
	 */
	private Integer id;

	/**
	 * 学号
	 */
	private String num;
	/**
	 * 受助等级
	 */
	private Integer rankId;
	/**
	 * 学年
	 */
	private String year;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public Integer getRankId() {
		return rankId;
	}
	public void setRankId(Integer rankId) {
		this.rankId = rankId;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	
}
