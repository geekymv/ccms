package com.ccms.pojo;

/**
 * 受助等级：甲乙丙
 * @author Geek_ymv
 */
public class Rank {
	
	private Integer id;
	private String name; // 等级名称
	
	@Override
	public String toString() {
		return "Rank [id=" + id + ", name=" + name + "]";
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
}
