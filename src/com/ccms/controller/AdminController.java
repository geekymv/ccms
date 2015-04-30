package com.ccms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.College;
import com.ccms.service.CollegeService;
import com.ccms.service.SpecialtyService;

@Controller
public class AdminController {
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private SpecialtyService specialtyService;
	
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
		
		return "admin/myinfo";
	}
	
	/**
	 * 跳转到文档管理页面
	 * @return
	 */
	@RequestMapping("/admin/doc")
	public String fileUpload() {
		return "admin/doc";
	}
	
	/**
	 * 跳转到用工单位列表
	 * @return
	 */
	@RequestMapping(value="/admin/employers", method=RequestMethod.GET)
	public String colleges() {
		return "admin/colleges";
	}
	
	/**
	 * 查看所有的用工单位列表
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/admin/employers", method=RequestMethod.POST)
	@ResponseBody
	public Pager<College> colleges(Pager<College> pager) {
		collegeService.page(pager);
		return pager;
	}
	
	/**
	 * 跳转到添加用工单位页面
	 * @return
	 */
	@RequestMapping("/admin/add_employer")
	public String addEmployer() {
		return "admin/add_employer";
	}
	
	
	/**
	 * 更新用工单位信息
	 * @param college
	 * @return
	 */
	@RequestMapping("/admin/update")
	@ResponseBody
	public String update(College college) {
		int res = collegeService.update(college);
		return res == 1 ? "success" : "fail";
	}
	
	
	
	
}















