package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.FileEntityDAO;
import com.ccms.persistence.dto.Pager;
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

	@Override
	public Pager<FileEntity> listByPage(int authority, int pageOffset,
			int pageSize) {
		Pager<FileEntity> pager = new Pager<FileEntity>();
		
		int totalRecord = fileDao.totalRecord(authority); // // 总记录数
		int totalPage = totalRecord % pageSize == 0 ? 
				totalRecord / pageSize : totalRecord / pageSize + 1; // 总页数
		pager.setTotalRecord(totalRecord);
		pager.setTotalPage(totalPage);
		
		List<FileEntity> fileEntities = fileDao.queryByPage(authority, pageOffset, pageSize);
		pager.setDatas(fileEntities);
		
		return pager;
	}

	@Override
	public FileEntity queryByNewFileName(String newFileName) {
		return fileDao.queryByNewFileName(newFileName);
	}

}


















