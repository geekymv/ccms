package com.ccms.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ccms.pojo.Activity;
import com.ccms.pojo.Pager;
import com.ccms.service.ActivityService;

@Controller
public class IndexController {

	@Autowired
	private ActivityService activityService;
	
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
	
	
	@RequestMapping("activity/detail/{id}")
	public String detail(@PathVariable Integer id) {
		
		System.out.println("id = " + id);
		
		return "student/activity_detail";
	}
}























