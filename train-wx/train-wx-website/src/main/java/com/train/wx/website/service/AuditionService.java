package com.train.wx.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.train.wx.db.dao.AuditionDao;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.AuditionInfo;

@Service
public class AuditionService {
	
	@Autowired
	AuditionDao auditionDao;
	
	/**
	 * 插入信息
	 * @param auditionInfo
	 */
	public void insertAudition(AuditionInfo auditionInfo){
		auditionDao.insertAudition(auditionInfo);
	}
	
	/**
	 * 查询列表
	 * @param sysSearchDto
	 * @return
	 */
	public BaseResponseDto<Object> queryAudition(SysSearchDto sysSearchDto){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(auditionDao.queryAudition(sysSearchDto));
		br.setPageCount(auditionDao.countAudition(sysSearchDto));
		return br;
	}
	
}
