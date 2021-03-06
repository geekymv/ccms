package com.ccms.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.ActivityService;
import com.ccms.service.CollegeService;
import com.ccms.service.StudentService;

@Controller
public class IndexController {

	@Autowired
	private ActivityService activityService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private CollegeService collegeService;
	
	/**
	 * 跳转到登录页面
	 * @return
	 */
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String login(){
		return "login";
	}
	
	/**
	 * 处理用户登录请求
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public String login(String account, String password, HttpSession session, Model model){
		Student student = studentService.login(account, password);
		if(student != null) {
			session.setAttribute("user", student);
			return "student_success";
		}else {
			College college = collegeService.login(account, password);
			if(college != null){
				session.setAttribute("user", college);
				return "college_success";
			}else {
				model.addAttribute("errors", "用户名或密码错误！");
				return "errors";
			}	
		}
	}
	
	/**
	 * 用户退出
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	public String logout(HttpSession session){
		session.invalidate();
		// 页面跳转到首页
		return "redirect:/";
	}
	
}
