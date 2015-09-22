package com.ccms.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ccms.dao.NoticeDao;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Notice;
import com.ccms.persistence.vo.NoticeVO;
import com.ccms.service.NoticeService;
import com.ccms.util.DateUtils;

@Service
public class NoticeServiceImpl implements NoticeService {
	@Autowired
	private NoticeDao noticeDao;

	@Override
	public void queryPageByStatus(Pager<NoticeVO> pager, int status) {
		// 计算总页数
		int totalRecord = noticeDao.getTotleRecordByStatus(status);
		pager.setTotalRecord(totalRecord);
		
		pager.setPageOffset(pager.getPageIndex(), pager.getPageSize());
		List<NoticeVO> datas = noticeDao.queryPageByStatus(pager, status);
		pager.setDatas(datas);
	}
	
	@Override
	public void getAllNotice(Pager<NoticeVO> pager) {
		// 计算总页数
		int totalRecord = noticeDao.getTotleRecord();
		pager.setTotalRecord(totalRecord);
		
		pager.setPageOffset(pager.getPageIndex(), pager.getPageSize());
		List<NoticeVO> datas = noticeDao.queryAllByPage(pager);
		pager.setDatas(datas);
	}

	@Override
	public String pubNotice(Notice notice) {
		Long id = notice.getId();

		int res = 0;
		if(id != null) {	// 编辑
			noticeDao.update(notice);
			res = 1;
		}else {	// 添加
			notice.setNociceUuid(UUID.randomUUID().toString());
			notice.setPubTime(DateUtils.getCurrentGaDate());
			res = noticeDao.add(notice);
		}
		return res == 1 ? "success": "fail";
	}

	@Override
	public NoticeVO getById(Integer id) {
		return noticeDao.queryByNoticeId(id);
	}

	
}
