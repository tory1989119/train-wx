package com.train.wx.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.train.wx.db.dao.ActivityDao;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.ActivityInfo;

@Service
public class ActivityService {
	
	@Autowired
	ActivityDao activityDao;
	
	/**
	 * 插入信息
	 * @param activityInfo
	 */
	public void insertActivity(ActivityInfo activityInfo){
		activityDao.insertActivity(activityInfo);
	}
	
	/**
	 * 查询列表
	 * @param sysSearchDto
	 * @return
	 */
	public BaseResponseDto<Object> queryActivity(SysSearchDto sysSearchDto){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(activityDao.queryActivity(sysSearchDto));
		br.setPageCount(activityDao.countActivity(sysSearchDto));
		return br;
	}
}
