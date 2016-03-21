package com.train.wx.db.dao;

import java.util.List;
import com.train.wx.db.model.TuitionInfo;

public interface TuitionDao {
	/**
	 * 插入信息
	 * @param tuitionInfo
	 */
	public void insertTuition(TuitionInfo tuitionInfo);
	
	/**
	 * 查询列表
	 * @param courseId
	 * @return
	 */
	public List<TuitionInfo> queryTuition(String courseId);
}
