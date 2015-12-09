package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.FileEntityDAO;
import com.ccms.persistence.dto.FileQueryDto;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.FileEntity;
import com.ccms.persistence.vo.FileEntityVO;
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
	public Pager<FileEntityVO> listByPage(Pager<FileEntityVO> pager, FileQueryDto dto) {
		int totalRecord = fileDao.totalRecord(dto); // // 总记录数
		pager.setTotalRecord(totalRecord);
		
		pager.setPageOffset(pager.getPageIndex(), pager.getPageSize());
		
		List<FileEntityVO> fileEntities = fileDao.queryByPage(pager, dto);
		pager.setDatas(fileEntities);
		return pager;
	}

	@Override
	public FileEntity queryByNewFileName(String newFileName) {
		return fileDao.queryByNewFileName(newFileName);
	}

	@Override
	public String delete(Integer id) {
		fileDao.delete(id);
		return "success";
	}

	@Override
	public String linkFileAndActivity(Integer fileId, String uuid) {
		int res = fileDao.linkFileAndActivity(fileId, uuid);
		return res == 1 ? "success" : "fail";
	}

	@Override
	public List<FileEntity> getByActivityUuid(String activityUuid) {
		return fileDao.queryByActivityUuid(activityUuid);
	}

}


















