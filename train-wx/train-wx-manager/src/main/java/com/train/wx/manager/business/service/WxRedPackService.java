package com.train.wx.manager.business.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.train.wx.db.dao.WxRedPackDao;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.SysSearchDto;

@Service
public class WxRedPackService {
	@Autowired
	private WxRedPackDao wxRedPackDao;
	
	/**
	 * 查询微信用户列表
	 * 
	 * @param searchDto
	 * @return
	 */
	public BaseResponseDto<Object> queryWxRedPack(SysSearchDto searchDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(wxRedPackDao.queryWxRedPack(searchDto));
		br.setPageCount(wxRedPackDao.countWxRedPack(searchDto));
		return br;
	}
}
