package com.ccms.android.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.ActivityService;
import com.ccms.service.StudentService;

@Controller
public class StudentRestService {
	@Autowired
	private StudentService studentService;

	@Autowired
	private ActivityService activityService;
	
	/*
	public Student login(StudentDto studentDto) {
		return studentService.login(studentDto.getNum(), studentDto.getPwd());
	}
	*/
	
	/**
	 * 活动列表
	 * @param pager
	 * @return
	 */
	@RequestMapping("/activities")
	@ResponseBody
	public Pager<Activity> activity(Pager<Activity> pager) {
		activityService.findAllByPage(pager);
		return pager;
	}
	
	/**
	 * 学生登录
	 * @param num
	 * @param pwd
	 * @return
	 */
	@RequestMapping(value="/login/{num}/{pwd}", method=RequestMethod.GET)
	@ResponseBody
	public Student login(@PathVariable("num")String num, 
				@PathVariable("pwd")String pwd) {
		Student student = studentService.login(num, pwd);
		return student;
	}

}
