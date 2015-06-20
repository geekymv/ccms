package com.ccms.service;

import java.util.List;

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
	
	/**
	 * 根据id删除附件
	 * @param id
	 * @return
	 */
	public String delete(Integer id);
	
	/**
	 * 将活动和附件关联起来
	 * @param fileId 附件id
	 * @param uuid 活动的uuid
	 * @return
	 */
	public String linkFileAndActivity(Integer fileId, String uuid);
	
	/**
	 * 根据活动activityUuid加载附件
	 * @param activityUuid
	 * @return
	 */
	public List<FileEntity> getByActivityUuid(String activityUuid);
	
}
