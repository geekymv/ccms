package com.ccms.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.uti.DateUtils;

@Controller
public class CommonController {
	
	/**
	 * 学生时间统计，获得最近5个学年
	 * @return
	 */
	@RequestMapping("/recent5Years")
	@ResponseBody
	public List<String> getRecent5Years() {
		return DateUtils.getRecent5XueYear();
	}
	
}













