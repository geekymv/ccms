package com.ccms.dao;

import java.util.List;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.SecondLevel;

public interface SecondLevelDAO extends BaseDAO<SecondLevel> {
	
	/**
	 * 根据一级分类id获得所有二级分类
	 * @param superiorId
	 * @return
	 */
	public List<SecondLevel> listAll(Integer superiorId);
	
}
