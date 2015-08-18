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
	 * 分页查询所有已发布的公告通知
	 * @param pager
	 * @param status
	 * @return
	 */
	public List<NoticeVO> queryPageByStatus(@Param("pager")Pager<NoticeVO> pager, 
			@Param("status")int status);
	
}
