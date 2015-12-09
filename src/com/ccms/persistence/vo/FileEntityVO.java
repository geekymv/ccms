package com.ccms.persistence.vo;

public class FileEntityVO {
	/**
	 * 文件id
	 */
	private Integer id;
	/**
	 * 用工单位id
	 */
	private Integer colId;
	/**
	 * 用工单位名称
	 */
	private String colName;
	private String activityUuid;	// 活动的uuid
	private String originalFilename; // 文件原始名称
	private String newFileName;	// 文件新的名称
	private String saveUrl;		// 文件的保存路径
	private String fileSize;	// 文件大小
	private String uploadDate;	// 上传时间
	/**
	 * 种类
	 */
	private String category;
	/**
	 * 1 公有：所有用户都可以看
	 * 0 一般：管理员和用工单位可以看
	 * -1 私有：只有本单位可以看
	 */
	private Integer authority;	// 查看文件的权限
	private Integer status; // 文件状态：1默认, -1删除
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getColId() {
		return colId;
	}
	public void setColId(Integer colId) {
		this.colId = colId;
	}
	public String getColName() {
		return colName;
	}
	public void setColName(String colName) {
		this.colName = colName;
	}
	public String getActivityUuid() {
		return activityUuid;
	}
	public void setActivityUuid(String activityUuid) {
		this.activityUuid = activityUuid;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getSaveUrl() {
		return saveUrl;
	}
	public void setSaveUrl(String saveUrl) {
		this.saveUrl = saveUrl;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public Integer getAuthority() {
		return authority;
	}
	public void setAuthority(Integer authority) {
		this.authority = authority;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

	
}
