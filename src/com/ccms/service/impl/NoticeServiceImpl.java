package com.ccms.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.NoticeDao;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.vo.NoticeVO;
import com.ccms.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public void queryPageByStatus(Pager<NoticeVO> pager, int status) {
		List<NoticeVO> datas = noticeDao.queryPageByStatus(pager, status);
		pager.setDatas(datas );
		
	}

}
