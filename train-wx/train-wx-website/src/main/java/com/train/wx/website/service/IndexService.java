package com.train.wx.website.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.train.wx.db.dao.BannerDao;
import com.train.wx.db.dao.HotCourseDao;
import com.train.wx.db.dto.HotCourseDto;
import com.train.wx.db.model.BannerInfo;
import com.train.wx.db.model.HotCourseInfo;

@Service
public class IndexService {
	@Autowired
	BannerDao bannerDao;
	
	@Autowired
	HotCourseDao hotCourseDao;
	
	/**
	 * 查询首页广告
	 * @param type
	 * @return
	 */
	public List<BannerInfo> queryBanner(String type){
		BannerInfo bannerInfo = new BannerInfo();
		bannerInfo.setType(type);
		return bannerDao.queryBanner(bannerInfo);
	}
	
	/**
	 * 获取热门课程
	 * @return
	 */
	public List<HotCourseDto> queryHotCourse(String type){
		HotCourseInfo hotCourseInfo = new HotCourseInfo();
		hotCourseInfo.setType(type);
		return hotCourseDao.queryHotCourse(hotCourseInfo);
	}
}
