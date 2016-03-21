package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.HotCourseDto;
import com.train.wx.db.model.HotCourseInfo;

public interface HotCourseDao {
	/**
	 * 插入信息
	 * @param hotCourseInfo
	 */
	public void insertHotCourse(HotCourseInfo hotCourseInfo);
	
	/**
	 * 查询列表
	 * @param hotCourseInfo
	 * @return
	 */
	public List<HotCourseDto> queryHotCourse(HotCourseInfo hotCourseInfo);
	
}
