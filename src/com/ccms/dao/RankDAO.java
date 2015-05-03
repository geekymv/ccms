package com.ccms.dao;

import java.util.List;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.Rank;


public interface RankDAO extends BaseDAO<Rank>{

	public List<Rank> queryAll();
}
	
