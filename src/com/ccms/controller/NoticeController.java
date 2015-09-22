package com.ccms.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.vo.NoticeVO;
import com.ccms.service.NoticeService;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 根据用户id查看公告详情
	 * @param noticeId
	 * @return
	 */
	@RequestMapping(value="/notice/detail", method=RequestMethod.POST)
	@ResponseBody
	public NoticeVO getNoticeDetail(Integer noticeId) {
		return noticeService.getById(noticeId);
	}
	
}
