package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.Rank;
import com.ccms.persistence.pojo.Student;

public interface RankService {
	
	public List<Rank> findAll();

	/**
	 * 根据学生id获取学生对应等级的要完成的总时长
	 * @param student
	 * @return
	 */
	public int getTotalDuration(Student student);

}
