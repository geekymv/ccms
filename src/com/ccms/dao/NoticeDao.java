package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Notice;
import com.ccms.persistence.vo.NoticeVO;

/**
 * 公告通知Dao
 * @author miying
 */
public interface NoticeDao extends BaseDAO<Notice>{
	
	/**
	 * 分页查询所有已发布的资讯
	 * @param pager
	 * @param status
	 * @return
	 */
	public List<NoticeVO> queryPageByStatus(@Param("pager")Pager<NoticeVO> pager, 
			@Param("status")int status);
	
	/**
	 * 根据公告状态资讯总记录数
	 * @param status
	 * @return
	 */
	public int getTotleRecordByStatus(int status);
	
	/**
	 * 分页查询所有资讯（草稿、已发布）
	 * @param pager
	 */
	public List<NoticeVO> queryAllByPage(@Param("pager")Pager<NoticeVO> pager);
	
	/**
	 * 所有资讯（草稿、已发布）总记录数
	 * @param status
	 * @return
	 */
	public int getTotleRecord();
	
	/**
	 * 根据id查询
	 * @param noticeId
	 * @return
	 */
	public NoticeVO queryByNoticeId(Integer noticeId);
	
}
