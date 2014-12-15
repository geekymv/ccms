package com.ccms.controller.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ccms.pojo.Activity;
import com.ccms.service.ActivityService;

@Controller
public class ActivityController {
	
	@Autowired
	private ActivityService activityService;
	
	/**
	 * 查看活动
	 * @param id
	 * @return
	 */
	@RequestMapping("activity/detail/{id}")
	public String detail(@PathVariable Integer id, Model model) {
		
		System.out.println("id = " + id);
		
		Activity activity = activityService.detail(id);
		model.addAttribute("activity", activity);
		
		return "student/activity_detail";
	}
	
}


























