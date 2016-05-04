package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.HotOrganizationDto;
import com.train.wx.db.model.HotOrganizationInfo;

public interface HotOrganizationDao {
	/**
	 * 插入信息
	 * @param hotOrganizationInfo
	 */
	public void insertHotOrganization(HotOrganizationInfo hotOrganizationInfo);
	
	/**
	 * 查询列表
	 * @return
	 */
	public List<HotOrganizationDto> queryHotOrganization();
	
}
