package com.ccms.persistence.dto;

/**
 * 资讯Dto
 * @author miying
 */
public class NoticeDto {
	/**
	 * 主键id
	 */
	private Long id;
	/**
	 * 标题
	 */
	private String title;
	/**
	 * 内容
	 */
	private String content;
	/**
	 * 发布单位id
	 */
	private Integer publisherId;
	
	/**
	 * 发布单位名称
	 */
	private String publishName;
	
	
	/**
	 * 发布时间
	 */
	private String pubTime;
	
	/**
	 * 公告uuid
	 */
	private String nociceUuid;
	
	/**
	 * 公告状态(-1已删除，0保存， 1已发布)
	 */
	private int status;

	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public Integer getPublisherId() {
		return publisherId;
	}
	public void setPublisherId(Integer publisherId) {
		this.publisherId = publisherId;
	}

	public String getPubTime() {
		return pubTime;
	}
	public void setPubTime(String pubTime) {
		this.pubTime = pubTime;
	}
	public String getNociceUuid() {
		return nociceUuid;
	}
	public void setNociceUuid(String nociceUuid) {
		this.nociceUuid = nociceUuid;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getPublishName() {
		return publishName;
	}
	public void setPublishName(String publishName) {
		this.publishName = publishName;
	}
	
}
