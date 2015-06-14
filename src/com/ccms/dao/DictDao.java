package com.ccms.dao;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.Dict;

public interface DictDao extends BaseDAO<Dict> {
	
	public Dict queryByCategory(String category);
	
}
