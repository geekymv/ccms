package com.ccms.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.dto.StudentDto;
import com.ccms.persistence.dto.StudentQueryDto;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.ActivityType;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.ActivityService;
import com.ccms.service.ActivityTypeService;
import com.ccms.service.CollegeService;
import com.ccms.service.SpecialtyService;
import com.ccms.service.StudentService;

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
	@Autowired
	private ActivityTypeService activityTypeService;
	@Autowired
	private StudentService studentService;
	
	@RequestMapping(value="/getCollegeById", method=RequestMethod.POST)
	@ResponseBody
	public College getById(Integer colId) {
		return collegeService.getById(colId);
	}

	/**
	 * 获得该学院下的所有专业
	 * @return
	 */
	@RequestMapping("/admin/specialties")
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
	public String editSpecialty(HttpSession session, Specialty specialty){
		College college = (College) session.getAttribute("user");
		Specialty spec = specialtyService.getByName(specialty.getName(), college);
		
		if(spec != null) {
			return "isexist";
		}
		
		return specialtyService.edit(specialty);
	}
	
	/**
	 * 获取到所有的活动类型
	 * @return
	 */
	@RequestMapping("/activityTypes")
	@ResponseBody
	public List<ActivityType> activityTypes() {
		return activityTypeService.getAll();
	}
	
	
	/**
	 * 跳转到发布活动页面
	 * @return
	 */
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
	
	/**
	 * 删除活动
	 * @param activityId
	 * @return
	 */
	@RequestMapping("/admin/deleteActivity")
	@ResponseBody
	public String deleteActivity(Integer activityId) {
		activityService.delete(activityId);
		return "success";
	}
	
	/**
	 * 加载所有活动列表
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/college/activities", method=RequestMethod.POST)
	@ResponseBody
	public Pager<Activity> pager(Pager<Activity> pager, HttpSession session) {
		College college = (College)session.getAttribute("user");
		
		return activityService.findAllByPage(pager, college);
	}
	
	/**
	 * 更新活动
	 * @param activity
	 * @return
	 */
	@RequestMapping(value="/college/updateActivity", method=RequestMethod.POST)
	@ResponseBody
	public String updateActivity(Activity activity) {
		return activityService.updateActivity(activity);
	}
	
	/**
	 * 查看学生报名列表
	 * @return
	 */
	@RequestMapping(value="/admin/activity_students/{actId}", method=RequestMethod.GET)
	public String findApplyStudents(@PathVariable("actId")Integer actId, Model model) {
		model.addAttribute("actId", actId);
		return "admin/activityStudents";
	}
	
	/**
	 * 报名学生列表
	 * @return
	 */
	@RequestMapping("/admin/apply_students")
	@ResponseBody
	public Pager<StudentDto> findApplyStudents(HttpSession session, Pager<StudentDto> pager, Integer actId) {
		return studentService.findStudentByActivityId(pager, actId);
	}
	
	/**
	 * 本院学生列表页面
	 * @return
	 */
	@RequestMapping(value="/admin/students", method=RequestMethod.GET)
	public String getStudents() {
		return "admin/collegeStudents";
	}
	
	/**
	 * 加载学生列表
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/admin/students", method=RequestMethod.POST)
	@ResponseBody
	public Pager<Student> getStudents(Pager<Student> pager, StudentQueryDto dto, HttpSession session) {
		College college = (College)session.getAttribute("user");
		studentService.findStudentsByColId(pager, dto, college.getId());
		return pager;
	}
	
	/**
	 * 查看学生信息
	 * @param stuId
	 * @return
	 */
	@RequestMapping("/admin/student/{stuNum}")
	public String student(@PathVariable("stuNum") String stuNum, Model model) {
		Student student = studentService.getInfo(stuNum);
		model.addAttribute("student", student);
		
		return "admin/student";
	}
	
	/**
	 * 学院更新学生信息
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/admin/updateStudentInfo", method=RequestMethod.POST)
	@ResponseBody
	public String updateStudentInfo(Student student) {
		return studentService.updatePartInfo(student);
	}
	
}


















