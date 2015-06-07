package com.ccms.persistence.dto;

public class CommentDto {
	
	private Integer id;
	/**
	 * 被评论对象id
	 */
	private Integer objectId;
	
	/**
	 * 评论人id
	 */
	private Integer userId;
	
	/**
	 * 评论人姓名
	 */
	private String username;
	
	/**
	 * 评论内容
	 */
	private String content;
	
	/**
	 * 评论时间
	 */
	private String comDate;

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getObjectId() {
		return objectId;
	}
	public void setObjectId(Integer objectId) {
		this.objectId = objectId;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getComDate() {
		return comDate;
	}
	public void setComDate(String comDate) {
		this.comDate = comDate;
	}
	
}
