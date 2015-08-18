package com.ccms.service;

import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.vo.NoticeVO;

public interface NoticeService {

	/**
	 * 分页查询所有已发布的公告通知
	 * @param pager
	 * @param status
	 * @return
	 */
	public void queryPageByStatus(Pager<NoticeVO> pager, int status);
}
