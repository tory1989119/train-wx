package com.train.wx.website.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.train.wx.db.dao.TuitionDao;
import com.train.wx.db.model.TuitionInfo;

@Service
public class TuitionService {
	
	@Autowired
	TuitionDao cuitionDao;
	
	/**
	 * 插入信息
	 * @param tuitionInfo
	 */
	public void insertTuition(TuitionInfo tuitionInfo){
		cuitionDao.insertTuition(tuitionInfo);
	}
	
	/**
	 * 查询列表
	 * @param courseId
	 * @return
	 */
	public List<TuitionInfo> queryTuition(String courseId){
		return cuitionDao.queryTuition(courseId);
	}
	
}
