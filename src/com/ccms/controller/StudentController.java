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

import com.ccms.persistence.dto.ActivityItemDto;
import com.ccms.persistence.dto.ActivitySearchDto;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.ActivityItem;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.FileEntity;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.persistence.pojo.Student;
import com.ccms.persistence.vo.NoticeVO;
import com.ccms.persistence.vo.RankActivityTypeVO;
import com.ccms.persistence.vo.RankVO;
import com.ccms.service.ActivityItemService;
import com.ccms.service.ActivityService;
import com.ccms.service.CollegeService;
import com.ccms.service.FileEntityService;
import com.ccms.service.NoticeService;
import com.ccms.service.RankService;
import com.ccms.service.StudentService;
import com.ccms.util.DateUtils;
import com.ccms.util.SysCode;

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
	@Autowired
	private FileEntityService fileService;
	@Autowired
	private RankService rankService;
	@Autowired
	private NoticeService noticeService;

	/**
	 * 学生登录成功
	 */
	@RequestMapping(value="/stu_success", method=RequestMethod.GET)
	public String login() {

		return "redirect:index";
	}
	
	
	/**
	 * 跳转到首页
	 * @return
	 */
	@RequestMapping("/index")
	public String index() {
		return "student/index";
	}
	
	/**
	 * 活动列表
	 * @return
	 */
	@RequestMapping(value="/activities", method=RequestMethod.GET)
	public String activities() {
		return "student/activities";
	}
	
	/**
	 * 分页显示通过审核的活动
	 * 学生只可以查看自己学院发布的和面向全校的活动
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/activities", method=RequestMethod.POST)
	@ResponseBody
	public Pager<Activity> pager(Pager<Activity> pager, ActivitySearchDto dto) {
		return activityService.findAllStatusByPage(pager, dto);
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
	 * 判断活动报名是否截止
	 * @return
	 */
	@RequestMapping("/isPastDue")
	@ResponseBody
	public String isPastDue(Integer actId) {
		return activityService.isPastDut(actId);
	}
	
	/**
	 * 学生报名活动
	 * @param id 活动id
	 * @return
	 */
	@RequestMapping("/apply")
	@ResponseBody
	public String apply(Integer id, HttpSession session){
		Activity activity = activityService.detail(id);
		Student student = (Student) session.getAttribute("user");
		
		if(student == null) {
			return "fail";
		}
		
		return actItemService.apply(activity, student);
	}
	
	/**
	 * 取消报名
	 * @param session
	 * @param activityId
	 * @return
	 */
	@RequestMapping("/cancelActivity")
	@ResponseBody
	public String cancel(HttpSession session, Integer activityId) {
		Student student = (Student) session.getAttribute("user");
		return actItemService.cancel(activityId, student.getId());
	}
	
	
	/**
	 * 学生查看我的活动列表
	 * @return
	 */
	@RequestMapping(value="/myactivities", method=RequestMethod.GET)
	public String myactivities() {
		return "student/my_activity";
	}
	
	/**
	 * 显示学生报名的活动
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/myactivities", method=RequestMethod.POST)
	@ResponseBody
	public List<ActivityItem> applyedActivities(Model model, HttpSession session) {
		Student student = (Student) session.getAttribute("user");
		return actItemService.queryAllActivityItem(student.getId());
	}
	
	/**
	 * 跳转到个人信息管理页面
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/{num}/infocenter", method=RequestMethod.GET)
	public String infoCenter(@PathVariable String num, Model model) {
		List<Integer> years = DateUtils.getCurrentYear();
		String year = years.get(0) + "-" + years.get(1);	// 获取当前年
		
		Student student = studentService.getInfo(num, year);
		if(student != null) {
			model.addAttribute("student", student);
			
			College college = student.getCollege();
			// 获得该学生所在学院的所有专业
			List<Specialty> specialties = collegeService.getSpecialties(college.getId());
			model.addAttribute("specialties", specialties);
			
			// 查询所有学院
			List<College> colleges = collegeService.getColleges();
			model.addAttribute("colleges", colleges);
		}
		

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
	public String updateInfo(Student student, HttpSession session){
		boolean res = studentService.updateInfo(student);
		if(res){ // 更新session
			session.setAttribute("user", student);	
			return "success";
		}else {
			return "fail";
		}
	}
	
	/**
	 * 跳转到时间统计页面
	 * @return
	 */
	@RequestMapping(value="/timeCounter", method=RequestMethod.GET)
	public String timeCounter() {
		return "student/time_counter";
	}
	/**
	 * 时间统计
	 * @return
	 */
	@RequestMapping(value="/timeCounter", method=RequestMethod.POST)
	@ResponseBody
	public List<RankActivityTypeVO> timeCounter(HttpSession session, Model model, ActivityItemDto dto) {
		Student student = (Student) session.getAttribute("user");
		dto.setStudentId(student.getId());
		
		List<RankActivityTypeVO> itemVOs = actItemService.queryRankActivityItemVO(dto);
		
		return itemVOs;
	}
	
	/**
	 * 获取学生对应等级的要完成的总时长
	 * @param session
	 * @return
	 */
	@RequestMapping("/getTotalDuration")
	@ResponseBody
	public int totalTime(HttpSession session) {
		Student student = (Student)session.getAttribute("user");
		return rankService.getTotalDuration(student);	
	}
	
	/**
	 * 分页显示文档
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/docs")
	public String docs(HttpServletRequest request, Model model) {
		String pagerOffset = request.getParameter("pager.offset");
		Integer offSet = 0;
		if(pagerOffset != null && !pagerOffset.trim().equals("")) {
			offSet = Integer.parseInt(pagerOffset);
		}
		
		Pager<FileEntity> pager = fileService.listByPage(SysCode.FileAuthority.FILE_PUBLIC, offSet, 3);
		model.addAttribute("pager", pager);
		
		return "student/docs";
	}
	
	/**
	 * 学生评论活动
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/comment/{id}", method=RequestMethod.GET)
	public String comment(@PathVariable Integer id, Model model) {
		model.addAttribute("comment", "comment");
		
		Activity activity = activityService.detail(id);
		model.addAttribute("activity", activity);
		
		return "student/activity_detail";
	}

	/**
	 * 学生查看我的等级
	 * @return
	 */
	@RequestMapping(value="/myrank", method=RequestMethod.GET)
	public String myRank() {
		return "student/myrank";
	}
	/**
	 * 根据学生学号查看学生历年受助等级
	 * @param num
	 * @return
	 */
	@RequestMapping(value="/getRanks", method=RequestMethod.POST)
	@ResponseBody
	public List<RankVO> getRanks(String num) {
		return rankService.getByStudentNum(num);
	}
	
	/**
	 * 分页显示公告通知
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/notices", method=RequestMethod.POST)
	@ResponseBody
	public Pager<NoticeVO> pager(Pager<NoticeVO> pager) {
		noticeService.queryPageByStatus(pager, 1);
		return pager;
	}
}



















