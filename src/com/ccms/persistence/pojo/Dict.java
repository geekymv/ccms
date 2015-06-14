package com.ccms.persistence.pojo;

/**
 * 字典
 */
public class Dict {
	private Integer id;
	/**
	 * 名称
	 */
	private String name;
	/**
	 * 值
	 */
	private String val;
	
	/**
	 * 类型
	 */
	private String category;

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
	
	public String getVal() {
		return val;
	}
	public void setVal(String val) {
		this.val = val;
	}

	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}
