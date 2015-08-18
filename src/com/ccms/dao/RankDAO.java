package com.ccms.dao;

import java.util.List;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.pojo.Rank;
import com.ccms.persistence.vo.RankVO;


public interface RankDAO extends BaseDAO<Rank>{

	public List<Rank> queryAll();
	
	/**
	 * 根据学生学号查看学生历年受助等级
	 * @param num
	 * @return
	 */
	public List<RankVO> queryByStudentNum(String num);
}
	
