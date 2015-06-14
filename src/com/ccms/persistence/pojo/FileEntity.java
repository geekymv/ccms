package com.ccms.persistence.pojo;

import java.util.Date;

/**
 * 文件类
 * @author miying
 */
public class FileEntity {
	private Integer id;
	private College college;	// 所属用工单位
	private String originalFilename; // 文件原始名称
	private String newFileName;	// 文件新的名称
	private String saveUrl;		// 文件的保存路径
	private String fileSize;	// 文件大小
	private Date uploadDate;	// 上传时间
	/**
	 * 1 公有：所有用户都可以看
	 * 0 一般：管理员和用工单位可以看
	 * -1 私有：只有本单位可以看
	 */
	private Integer authority;	// 查看文件的权限
	private Integer status = 1; // 文件状态：1默认, -1删除

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public College getCollege() {
		return college;
	}
	public void setCollege(College college) {
		this.college = college;
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
	public Date getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(Date uploadDate) {
		this.uploadDate = uploadDate;
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
