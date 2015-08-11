package com.ccms.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
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
import com.ccms.persistence.pojo.FileEntity;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.ActivityService;
import com.ccms.service.ActivityTypeService;
import com.ccms.service.CollegeService;
import com.ccms.service.FileEntityService;
import com.ccms.service.SpecialtyService;
import com.ccms.service.StudentService;
import com.ccms.util.ExcelUtil;

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
	@Autowired
	private FileEntityService fileEntityService;
	
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
		
		return activityService.add(activity);
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
	 * 根据活动activityUuid加载附件
	 * @param activityUuid
	 * @return
	 */
	@RequestMapping(value="/admin/getFileByActivityUuid", method=RequestMethod.POST)
	@ResponseBody
	public List<FileEntity> getFileByActivityUuid(String activityUuid) {
		return fileEntityService.getByActivityUuid(activityUuid);
	}
	
	/**
	 * 更新活动
	 * @param activity
	 * @return
	 */
	@RequestMapping(value="/college/updateActivity", method=RequestMethod.POST)
	@ResponseBody
	public String updateActivity(Activity activity) {
		String res = activityService.updateActivity(activity);
		if("success" == res) {
			return activity.getActivityUuid();
		}
		
		return "";
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
	public Pager<StudentDto> findApplyStudents(Pager<StudentDto> pager, Integer actId) {
		return studentService.findStudentByActivityId(pager, actId);
	}
	
	/**
	 * 下载报名学生名单
	 * @param actId
	 * @param response
	 * @return
	 */
	@RequestMapping("/downloadApplyStudents")
	public void downloadApplyStudents(Integer actId, HttpServletResponse response) {
		List<String> titles = Arrays.asList("序号", "学号", "姓名", "联系方式", "学院", "专业");
		List<StudentDto> dtos = studentService.getAllStudentByActivityId(actId);
		
		ExcelUtil.downloadApplyStudents(dtos, titles , response);
	}
	
	
	/**
	 * 本院学生列表页面
	 * @return
	 */
	@RequestMapping(value="/college/students", method=RequestMethod.GET)
	public String getStudents() {
		return "admin/collegeStudents";
	}
	
	/**
	 * 加载学生列表
	 * @param session
	 * @return
	 */
	@RequestMapping(value="/college/students", method=RequestMethod.POST)
	@ResponseBody
	public Pager<Student> getStudents(Pager<Student> pager, StudentQueryDto dto, HttpSession session) {
		College college = (College)session.getAttribute("user");
		dto.setColId(college.getId());
		studentService.findStudents(pager, dto);
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
	
	/**
	 * 跳转到添加学生页面
	 * @return
	 */
	@RequestMapping(value="/college/addStudent", method=RequestMethod.GET)
	public String addStudent() {
		return "admin/add_student";
	}
	
	/**
	 * 学院添加学生请求
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/admin/addStudent", method=RequestMethod.POST)
	@ResponseBody
	public String addStudent(Student student, HttpSession session) {
		College college = (College) session.getAttribute("user");
		student.setCollege(college);
		
		return studentService.register(student);
	}
	
	/**
	 * 判断学生是否存在
	 * @param num 学号
	 * @param year 学年
	 * @return
	 */
	@RequestMapping(value="/studentIsExist", method=RequestMethod.POST)
	@ResponseBody
	public String studentIsExist(String num, String year) {
		return studentService.isExist(num, year);
	}
	
}
