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
import com.ccms.service.ActItemService;
import com.ccms.service.ActivityService;
import com.ccms.service.StudentService;

@Controller
@RequestMapping("/stu")
public class StudentController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ActItemService actItemService;
	
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
	public String detail(@PathVariable Integer id, Model model, HttpSession session) {
		Activity activity = activityService.detail(id);
		model.addAttribute("activity", activity);
		
//		Student student = (Student) session.getAttribute("user");
		Student student = new Student();
		student.setId(1);
		// 判断该学生是否报名
		boolean res = actItemService.isApplyed(activity, student);
		
		if(res) { // 该学生已经报名了该活动
			model.addAttribute("isApplyed", "isApplyed");
		}else {
			model.addAttribute("isApplyed", "unApply");
		}
		return "student/activity_detail";
	}
	
	/**
	 * 学生报名活动
	 * @param id 活动id
	 * @return
	 */
	@RequestMapping("/apply")
	@ResponseBody
	public String apply(Integer id, HttpSession session){
		System.out.println("activity id = " + id);	

		Activity activity = activityService.detail(id);
//		Student student = (Student) session.getAttribute("user");
		
		Student student = new Student();
		student.setId(1);
//		if(student == null) {
//			return "fail";
//		}
		
		boolean res = actItemService.apply(activity, student);
		if(res){
			return "success";
		} else {
			return "fail";
		}
		
	}
}



















