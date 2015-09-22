package com.ccms.service;

import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Notice;
import com.ccms.persistence.vo.NoticeVO;

public interface NoticeService {
	
	/**
	 * 发布或保存资讯
	 * @param notice
	 * @return "success" 成功， "fail" 失败
	 */
	public String pubNotice(Notice notice);

	/**
	 * 分页查询所有已发布的公告通知
	 * @param pager
	 * @param status
	 * @return
	 */
	public void queryPageByStatus(Pager<NoticeVO> pager, int status);
	
	/**
	 * 分页查询所有发布/保存的公告通知
	 * @param pager
	 */
	public void getAllNotice(Pager<NoticeVO> pager);
	
	/**
	 * 根据用户id 获取通知详情
	 * @param id
	 * @return
	 */
	public NoticeVO getById(Integer id);
}
