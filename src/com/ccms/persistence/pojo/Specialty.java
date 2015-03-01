package com.ccms.persistence.pojo;

/**
 * 专业类
 * @author Geek_ymv
 */
public class Specialty {
	
	private Integer id;
	private String name;
	private College college; // 所属学院
	
	public Specialty() {
	}
	
	public Specialty(String name, College college) {
		this.name = name;
		this.college = college;
	}
	public Specialty(Integer id, String name) {
		this.id = id;
		this.name = name;
	}
	public Specialty(Integer id, String name, College college) {
		this(name, college);
		this.id = id;
	}

	@Override
	public String toString() {
		return "Specialty [id=" + id + ", name=" + name + ", college="
				+ college + "]";
	}

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
