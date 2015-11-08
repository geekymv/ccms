package com.ccms.service.impl;

import java.util.List;

import javax.crypto.SealedObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.StuLevelDao;
import com.ccms.dao.StudentDAO;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.dto.StudentDto;
import com.ccms.persistence.dto.StudentQueryDto;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.persistence.pojo.StuLevel;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.StudentService;
import com.ccms.util.DateUtils;
import com.ccms.util.EncryptUtil;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDAO studentDAO;
	@Autowired
	private StuLevelDao stuLevelDao;
	
	@Override
	public String addStudent(Student student) {
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
		
		if(res == 1) {
			StuLevel stuLevel = new StuLevel(student.getNum(), 
					student.getRank().getId(), student.getYear());
			res = stuLevelDao.add(stuLevel);
			if(res == 1) {
				return "success";
			}
		}
		
		return "fail";
	}

	@Override
	public Student login(String num, String pwd) {
		pwd = EncryptUtil.md5Encrypt(pwd);
		return studentDAO.queryByNumAndPwd(num, pwd);
	}


	@Override
	public Student getInfo(String num, String year) {
		return studentDAO.queryByNumAndYear(num, year);
	}
	
	@Override
	public Student getInfoByNum(String num) {
		StudentDto dto = studentDAO.queryByNum(num);
		Student student = new Student();
		student.setId(dto.getStuId());
		student.setNum(dto.getNum());
		student.setName(dto.getName());
		student.setPhone(dto.getPhone());
		student.setGender(dto.getGender());
		student.setEmail(dto.getEmail());
		student.setIntroduce(dto.getIntroduce());
		student.setQq(dto.getQq());
		student.setCollege(new College(dto.getCollegeId(), dto.getCollegeName()));
		student.setSpecialty(new Specialty(dto.getSpecialtyId(), dto.getSpecialtyName()));
		return student;
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
		int totalRecord = studentDAO.getTotalRecordByActivityId(actId);
		pager.setTotalRecord(totalRecord );
		
		pager.setPageOffset(pager.getPageIndex(), pager.getPageSize());
		
		List<StudentDto> lists = studentDAO.queryByActivityId(pager, actId);
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


	@Override
	public List<StudentDto> getAllStudentByActivityId(Integer actId) {
		return studentDAO.getAllStudentByActivityId(actId);
	}


	@Override
	public List<Student> downloadStudents(StudentQueryDto dto) {
		return studentDAO.queryStudentsByDto(dto);
	}

}






