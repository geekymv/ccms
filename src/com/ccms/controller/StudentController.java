package com.ccms.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.pojo.Activity;
import com.ccms.pojo.Student;
import com.ccms.service.ActivityService;
import com.ccms.service.StudentService;

@Controller
@RequestMapping("/stu")
public class StudentController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private ActivityService activityService;
	
	/**
	 * 学生登录
	 * @param account
	 * @param password
	 * @param session
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login", method=RequestMethod.POST)
	@ResponseBody
	public String login(String account, String password, 
							HttpSession session, HttpServletRequest request) {
		
		Student student = studentService.login(account, password);
		
		if(student == null) {
			return "fail";
		}
		
		session.setAttribute("user", student);
		session.setMaxInactiveInterval(30);
		
		return "success";
	}
	
	/**
	 * 用户退出
	 * @param session
	 * @return
	 */
	@RequestMapping("/logout")
	@ResponseBody
	public String logout(HttpSession session){

		session.invalidate();
		
		System.out.println("exit...");
		return "success";
	}
	
	/**
	 * 查看活动
	 * @param id
	 * @return
	 */
	@RequestMapping("/activity_detail/{id}")
	public String detail(@PathVariable Integer id, Model model) {
		
		System.out.println("id = " + id);
		
		Activity activity = activityService.detail(id);
		model.addAttribute("activity", activity);
		
		return "student/activity_detail";
	}
	
	/**
	 * 学生报名活动
	 * @param id 活动id
	 * @return
	 */
	@RequestMapping("/apply")
	@ResponseBody
	public String apply(Integer id){
		
		System.out.println("activity id = " + id);	
		
		return "success";
	}
}



















