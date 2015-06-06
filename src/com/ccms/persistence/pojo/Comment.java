package com.ccms.persistence.pojo;

/**
 * 评论
 * ① 学生对活动进行评论
 * ② 学院对学生进行评价
 */
public class Comment {
	private Integer id;
	/**
	 * 被评论对象id
	 */
	private Integer objectId;

	/**
	 * 被评论对象的类别
	 * 1活动
	 * 2学生
	 */
	private int category;
	
	/**
	 * 评论人id
	 */
	private Integer userId;
	
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

	public int getCategory() {
		return category;
	}
	public void setCategory(int category) {
		this.category = category;
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
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
