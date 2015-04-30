package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.FileEntity;

public interface FileEntityDAO extends BaseDAO<FileEntity> {

	/**
	 * 根据权限分页查询
	 * @param authority 权限
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public List<FileEntity> queryByPage(@Param("authority") Integer authority, 
			@Param("pageOffset")int pageOffset, @Param("pageSize")int pageSize);
	
	/**
	 * 根据权限查询总记录数
	 * @param authority
	 * @return
	 */
	public int totalRecord(@Param("authority") Integer authority);
}
