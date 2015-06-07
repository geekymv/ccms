package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.CommentDAO;
import com.ccms.persistence.dto.CommentDto;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Comment;
import com.ccms.service.CommentService;
import com.ccms.util.DateUtils;

@Service
public class CommentServiceImpl implements CommentService {
	@Autowired
	private CommentDAO commentDAO;
	
	@Override
	public void publish(Comment comment) {
		comment.setComDate(DateUtils.getCurrentGaDate());
		commentDAO.add(comment);
	}
	
	@Override
	public void pager(Pager<CommentDto> pager, Integer activityId) {
		int pageIndex = pager.getPageIndex();
		pager.setPageOffset(pageIndex, pager.getPageSize());
		
		List<CommentDto> datas = commentDAO.queryAllByPage(pager.getPageOffset(), pager.getPageSize(), activityId);
		pager.setDatas(datas);
		
	}
	
}
