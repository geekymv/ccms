package com.ccms.pojo;

/**
 * 专业类
 * @author Geek_ymv
 */
public class Specialty {
	
	private Integer id;
	private String name;
	private College college; // 所属学院
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
	}
	
}
