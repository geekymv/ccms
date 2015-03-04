package com.ccms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.service.ActivityService;
import com.ccms.service.CollegeService;
import com.ccms.service.SpecialtyService;

/**
 * 学院/社团Controller
 * @author Geek_ymv
 */
@Controller
public class CollegeController {
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private ActivityService activityService;
	
	@RequestMapping("/college/update")
	@ResponseBody
	public String update(College college) {
		int res = collegeService.update(college);
		return res == 1 ? "success" : "fail";
	}
	
	/**
	 * 获得该学院下的所有专业
	 * @return
	 */
	@RequestMapping("/college/specialties")
	public String specialties(Model model, HttpSession session){
		College college = (College) session.getAttribute("user");
		
		List<Specialty> specialties = collegeService.getSpecialties(college.getId());
		model.addAttribute("specialties", specialties);
		
		return "admin/specialties";
	}
	
	/**
	 * 添加专业
	 * @param name
	 * @param session
	 * @return
	 */
	@RequestMapping("/college/addSpec")
	@ResponseBody
	public String addSpec(String name, HttpSession session) {
		College college = (College) session.getAttribute("user");
		Specialty specialty = specialtyService.getByName(name, college);
		if(specialty == null) { // 专业不存在
			// 添加专业
			boolean res = specialtyService.add(name, college);
			return res == true ? "success" : "fail";
			
		}else { // 专业存在
			return "isexist";
		}
	}
	
	/**
	 * 修改专业信息
	 * @param specialty
	 * @return
	 */
	@RequestMapping("/college/editSpecialty")
	@ResponseBody
	public String editSpecialty(Specialty specialty){
		
		return "success";
	}
	
	@RequestMapping(value="/admin/pubActivity", method=RequestMethod.GET)
	public String pubActivity() {
		return "admin/pubActivity";
	}
	
	/**
	 * 发布活动
	 * @param activity
	 * @return
	 */
	@RequestMapping(value="/admin/pubActivity", method=RequestMethod.POST)
	@ResponseBody
	public String pubActivity(Activity activity, HttpSession session) {
		College college = (College) session.getAttribute("user");
		activity.setCollege(college);
		
		int res = activityService.add(activity);
		return res == 1 ? "success" : "fail";
	}
}


















