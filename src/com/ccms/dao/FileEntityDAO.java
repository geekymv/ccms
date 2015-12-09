package com.ccms.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.ccms.base.dao.BaseDAO;
import com.ccms.persistence.dto.FileQueryDto;
import com.ccms.persistence.dto.Pager;
import com.ccms.persistence.pojo.FileEntity;
import com.ccms.persistence.vo.FileEntityVO;

public interface FileEntityDAO extends BaseDAO<FileEntity> {

	/**
	 * 根据权限分页查询
	 * @param authority 权限
	 * @param pageOffset
	 * @param pageSize
	 * @return
	 */
	public List<FileEntityVO> queryByPage(@Param("pager")Pager<FileEntityVO> pager, @Param("dto") FileQueryDto dto) ;
	
	/**
	 * 根据权限查询总记录数
	 * @param dto
	 * @return
	 */
	public int totalRecord(@Param("dto") FileQueryDto dto);
	
	/**
	 * 根据文件新名称查询
	 * @param newFileName
	 * @return
	 */
	public FileEntity queryByNewFileName(String newFileName);
	
	/**
	 * 将活动和附件关联起来
	 * @param fileId 附件id
	 * @param uuid 活动的uuid
	 * @return
	 */
	public int linkFileAndActivity(@Param("fileId")Integer fileId, @Param("uuid")String uuid);
	
	/**
	 * 根据活动id加载附件
	 * @param activityUuid
	 * @return
	 */
	public List<FileEntity> queryByActivityUuid(String activityUuid);

}
