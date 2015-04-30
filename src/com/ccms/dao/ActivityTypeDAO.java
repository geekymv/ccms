package com.ccms.dao;

import java.util.List;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.ActivityType;

/**
 * 活动类型Dao
 * @author miying
 */
public interface ActivityTypeDAO extends BaseDAO<ActivityType> {
	
	/**
	 * 查询所有的活动类型
	 * @return
	 */
	public List<ActivityType> list();

}
