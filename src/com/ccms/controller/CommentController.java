package com.ccms.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.dto.CommentDto;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Comment;
import com.ccms.service.CommentService;

@Controller
@RequestMapping("/comment")
public class CommentController {
	@Autowired
	private CommentService commentService;
	
	/**
	 * 发布评论
	 * @param comment
	 * @return
	 */
	@RequestMapping("/publish")
	@ResponseBody
	public String publish(Comment comment) {
		commentService.publish(comment);
		return "success";
	}
	
	/**
	 * 分页显示评论
	 * @param pager
	 * @param activityId
	 * @return
	 */
	@RequestMapping(value="/pager", method=RequestMethod.POST)
	@ResponseBody
	public Pager<CommentDto> list(Pager<CommentDto> pager, Integer activityId) {
		commentService.pager(pager, activityId);
		return pager;
	}
	
	
	
}
