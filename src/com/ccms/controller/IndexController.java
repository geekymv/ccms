package com.ccms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.pojo.Activity;
import com.ccms.pojo.Pager;
import com.ccms.service.ActivityService;

@Controller
public class IndexController {

	@Autowired
	private ActivityService activityService;
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public String login(String account, String password) {
		
		return "success";
	}
	
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		
		String pagerOffset = request.getParameter("pager.offset");
		Integer offSet = 0;
		if(pagerOffset != null && !pagerOffset.trim().equals("")) {
			offSet = Integer.parseInt(pagerOffset);
		}
		
		System.out.println(offSet);
		
		Pager<Activity> pager = activityService.queryAllStatusByPage(offSet, 3);
		
		model.addAttribute("pager", pager);
		
		return "student/index";
	}
	
	
	
}























