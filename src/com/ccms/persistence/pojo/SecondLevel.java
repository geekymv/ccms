package com.ccms.persistence.pojo;

/**
 * 活动二级分类
 */
public class SecondLevel {
	private Integer id;
	/**
	 * 名称
	 */
	private String name;
	
	/**
	 * 上级id
	 */
	private Integer superior;

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

	public Integer getSuperior() {
		return superior;
	}
	public void setSuperior(Integer superior) {
		this.superior = superior;
	}
}
