package com.ccms.base.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface BaseDAO<T> {

	/**
	 * 添加
	 * @param t
	 * @return
	 */
	public int add(T t);
	
	/**
	 * 根据id删除
	 * @param id
	 * @return
	 */
	public int delete(Integer id);
	
	/**
	 * 修改
	 * @param t
	 * @return
	 */
	public int update(T t);
	
	/**
	 * 根据id查询
	 * @param id
	 * @return
	 */
	public T queryById(Integer id);
	
	/**
	 * 分页查询
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public List<T> queryByPage(@Param("pageOffset")int pageOffset, @Param("pageSize")int pageSize);
	
	/**
	 * 总记录数
	 * @return
	 */
	public int totalRecord();

}

















