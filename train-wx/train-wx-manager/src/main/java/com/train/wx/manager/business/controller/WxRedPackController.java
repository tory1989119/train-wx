package com.train.wx.manager.business.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.train.wx.common.enums.ErrorCode;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.manager.business.service.WxRedPackService;

@Controller
@RequestMapping("/bus/redPack")
public class WxRedPackController {
	@Autowired
	WxRedPackService wxRedPackService;
	
	private Logger logger = LoggerFactory.getLogger(WxRedPackController.class);

	private final String WX_RED_PACK_MANA_PAGE = "bus/redPack/wxRedPackMana"; // 微信红包管理界面

	/**
	 * 跳转到微信红包管理界面
	 * 
	 * @return
	 */
	@RequestMapping(value = "wxRedPackManaPage.do", method = RequestMethod.GET)
	public String wxRedPackManaPage() {
		return WX_RED_PACK_MANA_PAGE;
	}

	/**
	 * 查询微信红包列表
	 * 
	 * @param searchDto
	 * @return
	 */
	@RequestMapping(value = "queryWxRedPack.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> queryWxRedPack(SysSearchDto searchDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			return wxRedPackService.queryWxRedPack(searchDto);
		} catch (Exception e) {
			logger.error("WxUserManagerController.queryWxRedPack", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
}
