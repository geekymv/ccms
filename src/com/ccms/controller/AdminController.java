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
import com.ccms.persistence.dto.StudentQueryDto;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.ActivityItem;
import com.ccms.persistence.pojo.ActivityType;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Dict;
import com.ccms.persistence.pojo.Notice;
import com.ccms.persistence.pojo.SecondLevel;
import com.ccms.persistence.pojo.Student;
import com.ccms.persistence.vo.NoticeVO;
import com.ccms.service.ActivityItemService;
import com.ccms.service.ActivityService;
import com.ccms.service.ActivityTypeService;
import com.ccms.service.CollegeService;
import com.ccms.service.DictService;
import com.ccms.service.NoticeService;
import com.ccms.service.RankService;
import com.ccms.service.SecondLevelService;
import com.ccms.service.SpecialtyService;
import com.ccms.service.StudentService;
import com.ccms.util.SysCode;

@Controller
public class AdminController {
	@Autowired
	private CollegeService collegeService;
	@Autowired
	private SpecialtyService specialtyService;
	@Autowired
	private ActivityService activityService;
	@Autowired
	private RankService rankService;
	@Autowired
	private StudentService studentService;
	@Autowired
	private ActivityItemService activityItemService;
	@Autowired
	private ActivityTypeService activityTypeService;
	@Autowired
	private SecondLevelService secondLevelService;
	@Autowired
	private DictService dictService;
	@Autowired
	private NoticeService noticeService;
	
	/**
	 * 管理员登录成功
	 * @return
	 */
	@RequestMapping("/admin/admin_success")
	public String index() {
		return "redirect:/admin";
	}

	/**
	 * 管理页面首页
	 * @param model
	 * @return
	 */
	@RequestMapping("/admin")
	public String index(Model model) {
		
		return "admin/index";
	}
	
	/**
	 * 查看个人信息
	 * @return
	 */
	@RequestMapping("/admin/myinfo")
	public String myinfo(Model model, HttpSession session) {
		College college = (College) session.getAttribute("user");
		college = collegeService.getById(college.getId());
		model.addAttribute("college", college);
		
		return "admin/myinfo";
	}
	
	/**
	 * 跳转到文档管理页面
	 * @return
	 */
	@RequestMapping("/admin/doc")
	public String fileUpload() {
		return "admin/doc";
	}
	
	/**
	 * 跳转到用工单位列表
	 * @return
	 */
	@RequestMapping(value="/admin/employers", method=RequestMethod.GET)
	public String colleges() {
		return "admin/colleges";
	}
	
	/**
	 * 查看所有的用工单位列表
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/admin/employers", method=RequestMethod.POST)
	@ResponseBody
	public Pager<College> colleges(Pager<College> pager) {
		collegeService.page(pager);
		return pager;
	}
	
	/**
	 * 跳转到添加用工单位页面
	 * @return
	 */
	@RequestMapping(value="/admin/add_employer", method=RequestMethod.GET)
	public String addEmployer() {
		return "admin/add_employer";
	}
	
	/**
	 * 处理添加用工单位请求
	 * @param college
	 * @return
	 */
	@RequestMapping(value="/admin/add_employer", method=RequestMethod.POST)
	@ResponseBody
	public String addEmployer(College college) {
		return collegeService.addEmployer(college);
	}
	
	
	/**
	 * 更新用工单位信息
	 * @param college
	 * @return
	 */
	@RequestMapping("/admin/update")
	@ResponseBody
	public String update(College college) {
		int res = collegeService.update(college);
		return res == 1 ? "success" : "fail";
	}
	
	/**
	 * 跳转到活动列表页面
	 * @return
	 */
	@RequestMapping(value="/admin/activities", method=RequestMethod.GET)
	public String activities() {
		return "admin/activities";
	}
	
	/**
	 * 加载所有活动列表
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/admin/activities", method=RequestMethod.POST)
	@ResponseBody
	public Pager<Activity> pager(Pager<Activity> pager) {
		return activityService.findAllByPage(pager);
	}

	/**
	 * 跳转到活动详情页面
	 * @return
	 */
	@RequestMapping(value="/admin/activity_detail/{id}", method=RequestMethod.GET)
	public String activityDetail(@PathVariable("id") Integer id, Model model) {
		model.addAttribute("activityId", id);
		return "admin/activityDetail";
	}
	
	/**
	 * 活动详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/admin/activity_detail", method=RequestMethod.POST)
	@ResponseBody
	public Activity activityDetail(Integer id) {
		 return activityService.detail(id);
	}
		
	/**
	 * 管理员审核活动
	 * @param actId
	 * @return
	 */
	@RequestMapping("/admin/aduitActivity")
	@ResponseBody
	public String aduitActivity(Activity activity) {
		return activityService.aduitActivity(activity);
	}
	
	/**
	 * 待审核的学生报名Item
	 * @return
	 */
	@RequestMapping("/admin/auditActivityItem")
	@ResponseBody
	public String auditActivityItem(ActivityItem item) {
		activityItemService.auditActivityItem(item);
		return "success";
	}
	
	/**
	 * 设置活动类别
	 * @return
	 */
	@RequestMapping(value="/admin/setCategory", method=RequestMethod.GET)
	public String setSecondLevel() {
		return "admin/setCategory";
	}
	
	/**
	 * 加载所有一级类别
	 * @return
	 */
	@RequestMapping(value="/admin/categories", method=RequestMethod.POST)
	@ResponseBody
	public List<ActivityType> categories() {
		return activityTypeService.getAll();
	}
	
	/**
	 * 编辑活动类别
	 * @param type
	 * @return
	 */
	@RequestMapping(value="/admin/setCategory", method=RequestMethod.POST)
	@ResponseBody
	public String setCategory(ActivityType type) {
		return activityTypeService.setCategory(type);
	}

	/**
	 * 跳转到二级分类页面
	 * @return
	 */
	@RequestMapping(value="/admin/secondLevels/{superiorId}", method=RequestMethod.GET)
	public String secondLevels(@PathVariable("superiorId")Integer superiorId, Model model) {
		model.addAttribute("superiorId", superiorId);
		return "admin/secondLevels";
	}
	
	/**
	 * 根据一级活动类别id加载二级类别
	 * @param superiorId
	 * @return
	 */
	@RequestMapping(value="/admin/secondLevels", method=RequestMethod.POST)
	@ResponseBody
	public List<SecondLevel> secondLevels(Integer superiorId) {
		return secondLevelService.listAll(superiorId);
	}

	/**
	 * 编辑二级分类
	 * @param level
	 * @return
	 */
	@RequestMapping(value="/admin/editLevel", method=RequestMethod.POST)
	@ResponseBody
	public String editLevel(SecondLevel level) {
		return secondLevelService.update(level);
	}

	/**
	 * 编辑用工单位
	 * @return
	 */
	@RequestMapping("/admin/editEmployer/{id}")
	public String editEmployer(@PathVariable("id")Integer id, Model model) {
		model.addAttribute("empId", id);
		return "admin/edit_employer";
	}
	
	/**
	 * 查询详情
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/admin/getCollege", method=RequestMethod.POST)
	@ResponseBody
	public College getCollege(Integer id) {
		return collegeService.getById(id);
	}
	
	/**
	 * 更新
	 * @param college
	 * @return
	 */
	@RequestMapping(value="/admin/editCollege", method=RequestMethod.POST)
	@ResponseBody
	public String editCollege(College college) {
		int res = collegeService.update(college);
		return res == 1 ? "success": "fail";
	}
	
	@RequestMapping(value="/admin/students", method=RequestMethod.GET)
	public String students() {
		return "admin/adminStudents";
	}
	
	/**
	 * 管理员-学生列表
	 * @param pager
	 * @param dto
	 * @return
	 */
	@RequestMapping("/admin/students")
	@ResponseBody
	public Pager<Student> students(Pager<Student> pager, StudentQueryDto dto) {
		studentService.findStudents(pager, dto);
		return pager;
	}
	
	
	/**
	 * 设置认证时间
	 * @return
	 */
	@RequestMapping("/admin/setAuthTime")
	public String setAuthTime() {
		return "admin/setAuthTime";
	}
	
	/**
	 * 设置添加学生时间
	 * @return
	 */
	@RequestMapping("/admin/setAddStudentTime")
	public String setAddStudentTime() {
		return "admin/setAddStudentTime";
	}
	
	/**
	 * 获取已设置的添加学生时间
	 * @return
	 */
	@RequestMapping(value="/admin/getAddStudentTime", method=RequestMethod.POST)
	@ResponseBody
	public List<Dict> getAddStudentTime() {
		return dictService.getByCategory(SysCode.ADD_STUDENT_TIME);
	}
	
	/**
	 * 更新字典表
	 * @param dict
	 * @return
	 */
	@RequestMapping(value="/admin/updateDict", method=RequestMethod.POST)
	@ResponseBody
	public String updateDict(Dict dict) {
		return dictService.updateDict(dict) == 1 ? "success" : "fail";
	}
	
	/**
	 * 跳转到发布资讯页面
	 * @return
	 */
	@RequestMapping(value="/admin/pubNotice", method=RequestMethod.GET)
	public String pubNotice() {
		return "admin/pubNotice";
	}
	
	/**
	 * 发布(编辑)资讯
	 * @param notice
	 * @return
	 */
	@RequestMapping(value="/admin/pubNotice", method=RequestMethod.POST)
	@ResponseBody
	public String pubNotice(Notice notice, HttpSession session) {
		College college = (College) session.getAttribute("user");
		notice.setPublisherId(college.getId());
		return noticeService.pubNotice(notice);
	}
	
	/**
	 * 跳转到资讯列表
	 * @return
	 */
	@RequestMapping(value="/admin/noticeList", method=RequestMethod.GET)
	public String noticeList() {
		return "admin/noticeList";
	}
	
	/**
	 * 加载资讯列表
	 * @param pager
	 * @return
	 */
	@RequestMapping(value="/admin/noticeList", method=RequestMethod.POST)
	@ResponseBody
	public Pager<NoticeVO> noticeList(Pager<NoticeVO> pager) {
		noticeService.getAllNotice(pager);
		return pager;
	}
	
//	// 循环读取Excel的内容
//	public void readExcel2() {
//		try {
//			Workbook workbook = Workbook.getWorkbook(new File("C:/Users/miying/Desktop/20150503/2014-2015学年受资助生一轮考核情况统计表.xls"));
//			Sheet sheet = workbook.getSheet(0);
//
//			int cols = sheet.getColumns();
//			int rows = sheet.getRows();
////			System.out.println("列数 = " + cols + ", 行数 = " + rows);
//			
//			List<Rank> ranks = rankService.findAll();	// 查询所有等级
//			List<College> colleges = collegeService.getColleges(); // 获取所有的学院
//			
//			Student student = null;
//			for (int i = 2; i < rows; i++) {
//				student = new Student();
//				
//				// 姓名
//				String name = sheet.getCell(1, i).getContents();
//				// 学号
//				String num = sheet.getCell(2, i).getContents();
//				// 初始密码
//				String pwd = num;
//				// 性别
//				String gender = sheet.getCell(3, i).getContents();
////				String mz = sheet.getCell(4, i).getContents();
////				String nj = sheet.getCell(5, i).getContents();
//				
//				// 专业名称
//				String specName = sheet.getCell(6, i).getContents();
//				// 学院名称
//				String colName = sheet.getCell(7, i).getContents();
//				// 等级名称
//				String rankName = sheet.getCell(8, i).getContents();
//				
////				for (int j = 0; j < cols; j++) {
////					value = sheet.getCell(j, i).getContents();
////				}
//
//				// 匹配等级
//				Rank rank = null;
//				for(Rank r : ranks) {
//					String rName = r.getName();
//					if(rName.equals(rankName)) {
//						rank = r;
//						break;
//					}
//				}
//				
//				// 匹配学院
//				for(College col : colleges) {
////					int colId = col.getId(); // 学院id
//					String c_name = col.getName();	// 学院名称
//					
//					if(c_name.equals(colName)) {
//						student = new Student(num, pwd, name, gender, "2014-2015", rank, col, 1);
//						break;
//					}
//					
////					// 专业
////					List<Specialty> specialties = collegeService.getSpecialties(colId);
////					boolean isExist = false;
////					for(Specialty spec : specialties) {
////						String spName = spec.getName();
////						if(c_name.equals(colName) && spName.equals(specName)) {
////							student = new Student(num, pwd, name, gender, "2014-2015", rank, col, spec, 1);
////							isExist = true;
////						}
////					}
////					
////					if(isExist) {
////						break;
////					}
//				}
//				
//				// 插入数据库
//				studentService.register(student);
//			}
//
//			workbook.close();
//
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//
//	}
	
}


