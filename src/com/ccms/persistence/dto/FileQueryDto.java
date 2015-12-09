package com.ccms.persistence.dto;

public class FileQueryDto {
	
	/**
	 * 文件权限
	 */
	private int authority;

	/**
	 * 文件种类
	 */
	private String category;
	
	public FileQueryDto() {
	}
	
	public FileQueryDto(int authority, String category) {
		this.authority = authority;
		this.category = category;
	}

	public int getAuthority() {
		return authority;
	}

	public void setAuthority(int authority) {
		this.authority = authority;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	
}
