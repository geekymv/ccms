package com.ccms.pojo;

/**
 * 活动类型：劳务类，文体类，实践类
 * @author Geek_ymv
 */
public class ActivityType {
	
	private Integer id;
	private String name;	//活动类型名称
	
	@Override
	public String toString() {
		return "ActivityType [id=" + id + ", name=" + name + "]";
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
