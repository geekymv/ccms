package com.ccms.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpSession;

import jxl.Sheet;
import jxl.Workbook;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Rank;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.ActivityItemService;
import com.ccms.service.ActivityService;
import com.ccms.service.CollegeService;
import com.ccms.service.RankService;
import com.ccms.service.SpecialtyService;
import com.ccms.service.StudentService;

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
	public String aduitActivity(Integer actId, Integer status) {
		return activityService.aduitActivity(actId, status);
	}
	
	/**
	 * 待审核的学生报名Item
	 * @param itemId
	 * @param status
	 * @return
	 */
	@RequestMapping("/admin/auditActivityItem")
	@ResponseBody
	public String auditActivityItem(Integer itemId, Integer status) {
		activityItemService.auditActivityItem(itemId, status);
		return "success";
	}
	
	/**
	 * 导入学生名单
	 */
	@RequestMapping("/admin/import")
	public void importStudents() {
		readExcel2();
	}
	
	// 循环读取Excel的内容
	public void readExcel2() {
		try {
			Workbook workbook = Workbook.getWorkbook(new File("C:/Users/miying/Desktop/20150503/2014-2015学年受资助生一轮考核情况统计表.xls"));
			Sheet sheet = workbook.getSheet(0);

			int cols = sheet.getColumns();
			int rows = sheet.getRows();
//			System.out.println("列数 = " + cols + ", 行数 = " + rows);
			
			List<Rank> ranks = rankService.findAll();	// 查询所有等级
			List<College> colleges = collegeService.getColleges(); // 获取所有的学院
			
			Student student = null;
			for (int i = 2; i < rows; i++) {
				student = new Student();
				
				// 姓名
				String name = sheet.getCell(1, i).getContents();
				// 学号
				String num = sheet.getCell(2, i).getContents();
				// 初始密码
				String pwd = num;
				// 性别
				String gender = sheet.getCell(3, i).getContents();
//				String mz = sheet.getCell(4, i).getContents();
//				String nj = sheet.getCell(5, i).getContents();
				
				// 专业名称
				String specName = sheet.getCell(6, i).getContents();
				// 学院名称
				String colName = sheet.getCell(7, i).getContents();
				// 等级名称
				String rankName = sheet.getCell(8, i).getContents();
				
//				for (int j = 0; j < cols; j++) {
//					value = sheet.getCell(j, i).getContents();
//				}

				// 匹配等级
				Rank rank = null;
				for(Rank r : ranks) {
					String rName = r.getName();
					if(rName.equals(rankName)) {
						rank = r;
						break;
					}
				}
				
				// 匹配学院
				for(College col : colleges) {
//					int colId = col.getId(); // 学院id
					String c_name = col.getName();	// 学院名称
					
					if(c_name.equals(colName)) {
						student = new Student(num, pwd, name, gender, "2014-2015", rank, col, 1);
						break;
					}
					
//					// 专业
//					List<Specialty> specialties = collegeService.getSpecialties(colId);
//					boolean isExist = false;
//					for(Specialty spec : specialties) {
//						String spName = spec.getName();
//						if(c_name.equals(colName) && spName.equals(specName)) {
//							student = new Student(num, pwd, name, gender, "2014-2015", rank, col, spec, 1);
//							isExist = true;
//						}
//					}
//					
//					if(isExist) {
//						break;
//					}
				}
				
				// 插入数据库
				studentService.register(student);
			}

			workbook.close();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}















