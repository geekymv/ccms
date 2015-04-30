package com.ccms.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.CollegeDAO;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;
import com.ccms.service.CollegeService;
import com.ccms.util.EncryptUtil;
import com.ccms.util.SysCode;

@Service
public class CollegeServiceImpl implements CollegeService {

	@Autowired
	private CollegeDAO collegeDAO;
	
	@Override
	public List<College> getColleges() {
		
		return collegeDAO.queryAllByType(SysCode.COLTYPE_COLLEGE);
	}

	@Override
	public List<Specialty> getSpecialties(Integer collegeId) {
		College college = collegeDAO.querySpecialtys(collegeId);
		if(college == null){ // 该学院暂时没有专业
			return null;
		}
		List<Specialty> specialties = college.getSpecialties();
		
		return specialties;
	}

	@Override
	public College login(String account, String pwd) {
		pwd = EncryptUtil.md5Encrypt(pwd);
		return collegeDAO.queryByAccountPwd(account, pwd);
	}

	@Override
	public College getById(Integer id) {
		return collegeDAO.queryById(id);
	}

	@Override
	public int update(College college) {
		String pwd = college.getPwd();
		if(StringUtils.isNotBlank(pwd)) {
			college.setPwd(EncryptUtil.md5Encrypt(pwd));
		}
		
		return collegeDAO.update(college);
	}

	@Override
	public Pager<College> page(Pager<College> pager) {
		List<College> colleges = collegeDAO.queryAll();
		pager.setDatas(colleges);
		return pager;
	}

	@Override
	public String addEmployer(College college) {
		college.setAuthority(SysCode.CollegeAuthority.COMMON);

		// 判断账号是否已经存在
		College col = collegeDAO.queryByAccount(college.getAccount());
		if(col != null) {
			return "accountIsExist";
		}
		
		// 判断名称是否存在
		col = collegeDAO.queryByName(college.getName());
		if(col != null) {
			return "nameIsExist";
		}
		college.setPwd(EncryptUtil.md5Encrypt(college.getPwd()));
		int res = collegeDAO.add(college);
		return res == 1 ? "success" : "fail";
	}

}
