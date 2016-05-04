package com.train.wx.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.train.wx.db.dao.WxMetarialDao;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.SysSearchDto;

@Service
public class ComicService {
	
	@Autowired
	WxMetarialDao wxMetarialDao;
	
	
	/**
	 * 查询列表
	 * @param sysSearchDto
	 * @return
	 */
	public BaseResponseDto<Object> queryWxMetarialForComic(SysSearchDto sysSearchDto){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(wxMetarialDao.queryWxMetarialForComic(sysSearchDto));
		br.setPageCount(wxMetarialDao.countWxMetarialForComic(sysSearchDto));
		return br;
	}
}
