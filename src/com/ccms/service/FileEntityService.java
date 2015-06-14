package com.ccms.service;

import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.FileEntity;

public interface FileEntityService {
	
	/**
	 * 上传文件
	 * @param file
	 * @return
	 */
	public boolean upload(FileEntity file);

	/**
	 * 根据文件权限分页显示所有文件
	 * @param authority
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public Pager<FileEntity> listByPage(int authority, int pageOffset, int pageSize);

	/**
	 * 根据文件新名称查询
	 * @param newFileName
	 * @return
	 */
	public FileEntity queryByNewFileName(String newFileName);
	
}
