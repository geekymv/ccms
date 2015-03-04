package com.ccms.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.FileEntityDAO;
import com.ccms.persistence.pojo.FileEntity;
import com.ccms.service.FileEntityService;

@Service
public class FileEntityServiceImpl implements FileEntityService {
	@Autowired
	private FileEntityDAO fileDao;
	
	@Override
	public boolean upload(FileEntity file) {
		return fileDao.add(file) == 1 ? true : false;
	}

}
