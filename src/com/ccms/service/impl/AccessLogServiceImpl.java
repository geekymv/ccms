package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.AccessLogDAO;
import com.ccms.pojo.AccessLog;
import com.ccms.service.AccessLogService;

@Service("accessLogService")
public class AccessLogServiceImpl implements AccessLogService {

	@Autowired
	private AccessLogDAO accessLogDAO;
	
	@Override
	public boolean login(AccessLog accessLog) {

		return accessLogDAO.add(accessLog) == 1 ? true : false;
	}

	@Override
	public boolean logout(AccessLog accessLog) {
		
		return accessLogDAO.update(accessLog) == 1 ? true : false;
	}

	@Override
	public List<AccessLog> queryByUserIdAndStatus(String userId, int status) {
		
		return accessLogDAO.queryByUserIdAndStatus(userId, status);
	}

}
