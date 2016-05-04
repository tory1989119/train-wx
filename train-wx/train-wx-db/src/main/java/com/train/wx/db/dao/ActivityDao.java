package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.ActivityDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.ActivityInfo;

public interface ActivityDao {
	/**
	 * 插入信息
	 * @param activityInfo
	 */
	public void insertActivity(ActivityInfo activityInfo);
	
	/**
	 * 查询列表
	 * @param sysSearchDto
	 * @return
	 */
	public List<ActivityDto> queryActivity(SysSearchDto sysSearchDto);
	
	/**
	 * 查询列表数
	 * @param sysSearchDto
	 * @return
	 */
	public Integer countActivity(SysSearchDto sysSearchDto);
}
