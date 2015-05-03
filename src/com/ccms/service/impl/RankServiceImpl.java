package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.RankDAO;
import com.ccms.persistence.pojo.Rank;
import com.ccms.service.RankService;

@Service
public class RankServiceImpl implements RankService {
	@Autowired
	private RankDAO rankDAO;
	
	@Override
	public List<Rank> findAll() {
		return rankDAO.queryAll();
	}

}
