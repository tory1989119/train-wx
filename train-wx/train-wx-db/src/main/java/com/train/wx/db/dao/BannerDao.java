package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.model.BannerInfo;

public interface BannerDao {
	/**
	 * 插入信息
	 * @param bannerInfo
	 */
	public void insertBanner(BannerInfo bannerInfo);
	
	/**
	 * 查询列表
	 * @param bannerInfo
	 */
	public List<BannerInfo> queryBanner(BannerInfo bannerInfo);
	
	/**
	 * 插入信息
	 * @param bannerInfo
	 */
	public void updateBanner(BannerInfo bannerInfo);
	
}
