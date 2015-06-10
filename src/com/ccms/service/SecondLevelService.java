package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.SecondLevel;

public interface SecondLevelService {

	/**
	 * 根据一级分类id获得所有二级分类
	 * @param superiorId
	 * @return
	 */
	public List<SecondLevel> listAll(Integer superiorId);
	
	/**
	 * 更新
	 * @param secondLevel
	 * @return
	 */
	public String update(SecondLevel secondLevel);
	
}
