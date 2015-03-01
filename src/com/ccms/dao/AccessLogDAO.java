package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.AccessLog;

public interface AccessLogDAO extends BaseDAO<AccessLog> {

	/**
	 * 根据用户id和用户状态(是否在线)查询
	 * @param userId
	 * @param status
	 * @return
	 */
	public List<AccessLog> queryByUserIdAndStatus(
			@Param("userId")String userId, @Param("status")int status);

}
