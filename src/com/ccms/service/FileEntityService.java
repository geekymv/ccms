package com.ccms.service;

import com.ccms.persistence.pojo.FileEntity;

public interface FileEntityService {
	
	/**
	 * 上传文件
	 * @param file
	 * @return
	 */
	public boolean upload(FileEntity file);

}
