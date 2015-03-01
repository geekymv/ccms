package com.ccms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.service.CollegeService;
import com.ccms.service.SpecialtyService;

@Controller
public class CollegeController {

	@Autowired
	private CollegeService collegeService;
	
	@Autowired
	private SpecialtyService specialtyService;
	
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
	 * 判断该专业是否已经存在于该学院
	 * @param name
	 * @param session
	 * @return
	 */
	@RequestMapping("/college/exist")
	@ResponseBody
	public String exist(String name, HttpSession session) {
		
		College college = (College) session.getAttribute("user");
		Specialty specialty = specialtyService.getByName(name, college);
		
		if(specialty == null) { // 专业不存在
			return "noexist";
			
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
	
	
}
