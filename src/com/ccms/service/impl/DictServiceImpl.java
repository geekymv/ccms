package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.DictDao;
import com.ccms.persistence.pojo.Dict;
import com.ccms.service.DictService;

@Service
public class DictServiceImpl implements DictService {
	@Autowired
	private DictDao dictDao;
	
	@Override
	public List<Dict> getByCategory(String category) {
		return dictDao.queryByCategory(category);
	}

	@Override
	public int updateDict(Dict dict) {
		return dictDao.update(dict);
	}
}
