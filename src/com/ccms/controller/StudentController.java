package com.ccms.controller;

import java.util.ArrayList;
import java.util.List;

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
import com.ccms.pojo.ActivityItem;
import com.ccms.pojo.College;
import com.ccms.pojo.Pager;
import com.ccms.pojo.RankActivityTypeVO;
import com.ccms.pojo.Specialty;
import com.ccms.pojo.Student;
import com.ccms.service.ActivityItemService;
import com.ccms.service.ActivityService;
import com.ccms.service.CollegeService;
import com.ccms.service.StudentService;

@Controller
@RequestMapping("/stu")
public class StudentController {

	@Autowired
	private StudentService studentService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private ActivityItemService actItemService;
	@Autowired
	private CollegeService collegeService;
	
	/**
	 * 学生登录成功
	 */
	@RequestMapping(value="/success", method=RequestMethod.GET)
	public String login() {

		return "redirect:index";
	}
	
	
	/**
	 * 分页显示activity
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/index")
	public String index(HttpServletRequest request, Model model) {
		
		String pagerOffset = request.getParameter("pager.offset");
		Integer offSet = 0;
		if(pagerOffset != null && !pagerOffset.trim().equals("")) {
			offSet = Integer.parseInt(pagerOffset);
		}
		
		System.out.println("offSet = " + offSet);
		
		Pager<Activity> pager = activityService.queryAllStatusByPage(offSet, 3);
		
		model.addAttribute("pager", pager);
		
		return "student/index";
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
		
		Student student = (Student) session.getAttribute("user");

//		Student student = new Student();
//		student.setId(1);
		
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
		Student student = (Student) session.getAttribute("user");
		
//		Student student = new Student();
//		student.setId(1);
		
		if(student == null) {
			return "fail";
		}
		
		boolean res = actItemService.apply(activity, student);
		if(res){
			return "success";
		} else {
			return "fail";
		}
	}
	
	
	/**
	 * 显示学生报名的活动
	 * @param model
	 * @return
	 */
	@RequestMapping("/myactivities")
	public String applyedActivities(Model model, HttpSession session) {
		Student student = (Student) session.getAttribute("user");
		List<ActivityItem> actItems = actItemService.queryAllActivityItem(student.getId());
		
		model.addAttribute("actItems", actItems);
		
		return "student/my_activity";
	}
	
	/**
	 * 跳转到个人信息管理页面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{num}/infocenter", method=RequestMethod.GET)
	public String infoCenter(@PathVariable String num, Model model) {
		
		Student student = studentService.getInfo(num);
		model.addAttribute("student", student);
		
		// 获得该学生所在学院的所有专业
		List<Specialty> specialties = collegeService.getSpecialties(student.getCollege().getId());
		model.addAttribute("specialties", specialties);
		
		// 查询所有学院
		List<College> colleges = collegeService.getColleges();
		model.addAttribute("colleges", colleges);

		return "student/into_center";
	}

	/**
	 * 表单级联响应Ajax请求获得该学院所有专业
	 * @param collegeId
	 * @return
	 */
	@RequestMapping("/getSpecialties")
	@ResponseBody
	public List<Specialty> getSpecialties(Integer collegeId){
		
		List<Specialty> specialties = collegeService.getSpecialties(collegeId);
		
		if(specialties == null){ // 没有查到该学院的专业集合
			specialties = new ArrayList<Specialty>();
		}
		
		return specialties;
	}

	/**
	 * 更新学生信息
	 * @param student
	 * @return
	 */
	@RequestMapping(value="/updateInfo", method=RequestMethod.POST)
	@ResponseBody
	public String updateInfo(Student student){
		
		Integer speId = student.getSpecialty().getId();
		if(speId == -1){
			student.getSpecialty().setId(null);
		}
		
		boolean res = studentService.updateInfo(student);
		if(res){
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 时间统计
	 * @return
	 */
	@RequestMapping("/timeCounter")
	public String timeCounter(HttpSession session, Model model) {
		
		Student student = (Student) session.getAttribute("user");
		
		List<RankActivityTypeVO> itemVOs = actItemService.queryRankActivityItemVO(student.getId());
		
		model.addAttribute("itemVOs", itemVOs);
		
		return "student/time_counter";
	}
	
	
	
	
}



















