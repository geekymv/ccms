package com.ccms.service;

import com.ccms.persistence.dto.CommentDto;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Comment;

public interface CommentService {
	/**
	 * 发表评论
	 * @param comment
	 */
	public void publish(Comment comment);
	
	/**
	 * 分页显示活动评论
	 * @param pager
	 * @param activityId
	 */
	public void pager(Pager<CommentDto> pager, Integer activityId);
	
}
