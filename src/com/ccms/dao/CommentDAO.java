package com.ccms.dao;


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.dto.CommentDto;
import com.ccms.persistence.pojo.Comment;


public interface CommentDAO extends BaseDAO<Comment> {
	
	/**
	 * 根据活动id分页查询活动评论
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public List<CommentDto> queryAllByPage(@Param("pageOffset")int pageOffset, 
			@Param("pageSize")int pageSize, @Param("activityId")Integer activityId);
	
	/**
	 * 根据活动id查询活动评论总数
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public int queryTotalRecord(@Param("activityId")Integer activityId);
	
}
