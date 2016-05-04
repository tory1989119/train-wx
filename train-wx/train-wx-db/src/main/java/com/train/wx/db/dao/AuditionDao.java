package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.AuditionDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.AuditionInfo;

public interface AuditionDao {
	/**
	 * 插入信息
	 * @param auditionInfo
	 */
	public void insertAudition(AuditionInfo auditionInfo);
	
	/**
	 * 查询列表
	 * @param sysSearchDto
	 * @return
	 */
	public List<AuditionDto> queryAudition(SysSearchDto sysSearchDto);
	
	/**
	 * 查询列表数
	 * @param sysSearchDto
	 * @return
	 */
	public Integer countAudition(SysSearchDto sysSearchDto);
}
