package com.ccms.service;

import java.util.List;

import com.ccms.persistence.pojo.Dict;

/**
 * 字典服务接口
 * @author miying
 *
 */
public interface DictService {
	
	/**
	 * 通过类别查询
	 * @param category
	 * @return
	 */
	public List<Dict> getByCategory(String category);
	
	/**
	 * 更新字典表
	 * @param dict
	 * @return
	 */
	public int updateDict(Dict dict);
}
