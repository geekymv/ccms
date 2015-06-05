package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.RankDAO;
import com.ccms.dao.StudentDAO;
import com.ccms.persistence.pojo.Rank;
import com.ccms.persistence.pojo.Student;
import com.ccms.service.RankService;

@Service
public class RankServiceImpl implements RankService {
	@Autowired
	private RankDAO rankDAO;
	@Autowired
	private StudentDAO studentDAO;
	
	@Override
	public List<Rank> findAll() {
		return rankDAO.queryAll();
	}

	@Override
	public int getTotalDuration(Student student) {
		student = studentDAO.queryById(student.getId());
		Integer rankId = student.getRank().getId();
		Rank rank = rankDAO.queryById(rankId );
		
		return rank.getDuration();
	}

}
