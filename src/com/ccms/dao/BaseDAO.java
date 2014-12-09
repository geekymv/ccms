package com.ccms.dao;

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
	public T query(Integer id);
}
