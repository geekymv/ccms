package com.ccms.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.StudentDAO;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.dto.StudentDto;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.StudentService;
import com.ccms.util.EncryptUtil;

@Service("studentService")
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	private StudentDAO studentDAO;
	public void setStudentDAO(StudentDAO studentDAO) {
		this.studentDAO = studentDAO;
	}
	
	
	@Override
	public boolean register(Student student) {
		student.setPwd(EncryptUtil.md5Encrypt(student.getPwd()));
		studentDAO.add(student);
		return false;
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

}




















