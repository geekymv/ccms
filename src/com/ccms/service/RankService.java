package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.Rank;
import com.ccms.persistence.pojo.Student;
import com.ccms.persistence.vo.RankVO;

public interface RankService {
	
	public List<Rank> findAll();

	/**
	 * 根据学生id获取学生对应等级的要完成的总时长
	 * @param student
	 * @return
	 */
	public int getTotalDuration(Student student);
	
	/**
	 * 根据学生学号查看学生历年受助等级
	 * @param num
	 * @return
	 */
	public List<RankVO> getByStudentNum(String num);

}
