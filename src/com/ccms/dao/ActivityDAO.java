package com.ccms.dao;

import java.util.List;

import javax.validation.constraints.Pattern;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.dto.ActivitySearchDto;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.Activity;
import com.ccms.persistence.pojo.College;

public interface ActivityDAO extends BaseDAO<Activity> {
	
	/**
	 * 根据活动状态查询总记录数
	 * @param status
	 * @return
	 */
	public int queryTotalRecord(Integer status);
	
	/**
	 * 分页查询所有通过审核的Activity
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public List<Activity> queryAllStatusByPage(@Param("pager")Pager<Activity> pager, @Param("dto")ActivitySearchDto dto);
	
	/**
	 * 分页查询所有
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public List<Activity> queryAllByPage(Pager<Activity> pager);
	
	/**
	 * 根据id查询截止日期
	 * @param actId
	 * @return
	 */
	public String queryByIdGetEndDate(Integer actId);
	
	/**
	 * 管理员审核活动
	 * @param actId
	 * @return
	 */
	public int aduitActivity(Activity activity);
	
	/**
	 * 用工单位查询自己发布的活动信息
	 * @param pager
	 * @param college
	 * @return
	 */
	public List<Activity> queryAllByPageAndCollege(@Param("pager")Pager<Activity> pager, @Param("college")College college);
	
	/**
	 * 用工单位查询自己发布的活动信息总记录数
	 * @param college
	 * @return
	 */
	public int getTotalRecordByCollege(College college);

}
