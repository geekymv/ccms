package com.ccms.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.StudentDAO;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.dto.StudentDto;
import com.ccms.persistence.dto.StudentQueryDto;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.StudentService;
import com.ccms.util.DateUtils;
import com.ccms.util.EncryptUtil;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDAO studentDAO;
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	
	@Override
	public String register(Student student) {
		String num = student.getNum();
		// 默认密码和学号相同
		student.setPwd(EncryptUtil.md5Encrypt(num));
		
		List<Integer> years = DateUtils.getCurrentYear();
		String year = years.get(0) + "-" + years.get(1);
		
		// 判断学号是否存在
		Student stu = studentDAO.queryNumAndYear(num, year);
		if(stu != null) { // 本学年学生已存在
			return "isexist";
		}
		
		student.setYear(year);
		student.setStatus(1);
		
		int res = studentDAO.add(student);
		return res == 1 ? "success": "fail";
	}

	@Override
	public Student login(String num, String pwd) {
		pwd = EncryptUtil.md5Encrypt(pwd);
		return studentDAO.queryByNumAndPwd(num, pwd);
	}


	@Override
	public Student getInfo(String num) {
		
		return studentDAO.queryByNum(num);
	}


	@Override
	public boolean updateInfo(Student student) {
		String pwd = student.getPwd();
		if(StringUtils.isNotBlank(pwd)) {
			student.setPwd(EncryptUtil.md5Encrypt(pwd));
		}
		
		int res = studentDAO.update(student);
		
		return res == 1 ? true : false;
	}


	@Override
	public Pager<StudentDto> findStudentByActivityId(Pager<StudentDto> pager, Integer actId) {
		List<StudentDto> lists = studentDAO.queryByActivityId(actId);
		
		int totalRecord = studentDAO.getTotalRecordByActivityId(actId);
		pager.setTotalRecord(totalRecord );
		
		pager.setPageOffset(pager.getPageIndex(), pager.getPageSize());
		pager.setDatas(lists);
		
		return pager;
	}


	@Override
	public Pager<Student> findStudents(Pager<Student> pager, StudentQueryDto dto) {
		int totalRecord = studentDAO.getTotalStudents(dto);
		pager.setTotalRecord(totalRecord);
		pager.setPageOffset(pager.getPageIndex(), pager.getPageSize());
		
		List<Student> lists = studentDAO.queryStudents(pager, dto);
		pager.setDatas(lists);
		
		return pager;
	}


	@Override
	public String updatePartInfo(Student student) {
		String pwd = student.getPwd();
		if(StringUtils.isNotBlank(pwd)) {
			student.setPwd(EncryptUtil.md5Encrypt(pwd));
		}
		
		int res = studentDAO.updatePartInfo(student);
		return res == 1 ? "success" : "fail";
	}


	@Override
	public String isExist(String num, String year) {
		if(StringUtils.isBlank(year)) {
			List<Integer> years = DateUtils.getCurrentYear();
			year = years.get(0) + "-" + years.get(1);
		}
		
		// 判断学号是否存在
		Student stu = studentDAO.queryNumAndYear(num, year);
		if(stu != null) { // 本学年学生已存在
			return "isexist";
		}
		
		return "notexist";
	}

}




















