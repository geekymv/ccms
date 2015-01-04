package com.ccms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ccms.pojo.College;
import com.ccms.service.CollegeService;

@Controller
public class AdminController {
	
	@Autowired
	private CollegeService collegeService;
	/**
	 * 管理员登录成功
	 * @return
	 */
	@RequestMapping("/admin/admin_success")
	public String index() {
		return "redirect:/admin";
	}

	/**
	 * 管理页面首页
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin")
	public String index(Model model) {
		
		return "admin/index";
	}
	
	/**
	 * 查看个人信息
	 * @return
	 */
	@RequestMapping("/admin/myinfo")
	public String myinfo(Model model, HttpSession session) {
		College college = (College) session.getAttribute("user");
		
		college = collegeService.getById(college.getId());
		model.addAttribute("college", college);
		
		System.out.println(college);
		
		return "admin/myinfo";
	}
}















