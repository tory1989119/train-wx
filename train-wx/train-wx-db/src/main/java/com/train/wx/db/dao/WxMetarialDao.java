package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.WxMetarialInfo;

public interface WxMetarialDao {
	/**
	 * 插入信息
	 * @param wxMetarial
	 */
	public void insertWxMetarial(WxMetarialInfo wxMetarial);
	
	/**
	 * 查询微信用户素材列表
	 * @param searchDto
	 * @return
	 */
	public List<WxMetarialInfo> queryWxMetarial(SysSearchDto searchDto);
	
	/**
	 * 查询素材列表数
	 * @param searchDto
	 * @return
	 */
	public int countWxMetarial(SysSearchDto searchDto);
	
	/**
	 * 根据id获取素材信息
	 * @param id
	 * @return
	 */
	public WxMetarialInfo getWxMetarialInfo(Long id);
	
	/**
	 * 清空表数据
	 */
	public void truncateWxMetarial();
	
	/**
	 * 删除素材
	 * @param id
	 */
	public void deleteWxMetarial(Long id);
}
