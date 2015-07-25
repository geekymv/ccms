package com.ccms.dao;

import java.util.List;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.Dict;

public interface DictDao extends BaseDAO<Dict> {
	
	/**
	 * 根据类别查询
	 * @param category
	 * @return
	 */
	public List<Dict> queryByCategory(String category);

	
}
