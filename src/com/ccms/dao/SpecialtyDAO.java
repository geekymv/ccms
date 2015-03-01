package com.ccms.dao;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.College;
import com.ccms.persistence.pojo.Specialty;

/**
 * 专业DAO
 * @author Geek_ymv
 */
public interface SpecialtyDAO extends BaseDAO<Specialty>{
	
	/**
	 * 根据专业名称查询该学院的专业
	 * @param name
	 * @param college
	 * @return
	 */
	public Specialty queryByName(@Param("name")String name, @Param("college")College college);

}
