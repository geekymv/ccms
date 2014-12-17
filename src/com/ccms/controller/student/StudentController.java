package com.ccms.controller.student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.pojo.Student;
import com.ccms.service.StudentService;

@Controller
@RequestMapping("/stu")
public class StudentController {

	@Autowired
	private StudentService studentService;
	
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
	
}



















