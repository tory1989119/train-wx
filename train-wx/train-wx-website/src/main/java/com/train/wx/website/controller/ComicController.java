package com.train.wx.website.controller;

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
import com.train.wx.website.service.ComicService;

@Controller
@RequestMapping("/comic")
public class ComicController {
	@Autowired
	private ComicService comicService;
	
	private Logger logger = LoggerFactory.getLogger(ComicController.class);

	private final String COMIC_PAGE = "comic"; //活动页
	
	/**
	 * 跳转到原创动漫
	 * 
	 * @return
	 */
	@RequestMapping(value = "comicPage.do", method = RequestMethod.GET)
	public String comicPage(){
		return COMIC_PAGE;
	}
	
	/**
	 * 查询原创动漫
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	@RequestMapping(value = "queryWxMetarialForComic.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> queryWxMetarialForComic(SysSearchDto sysSearchDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			return comicService.queryWxMetarialForComic(sysSearchDto);
		} catch (Exception e) {
			logger.error("ComicController.queryWxMetarialForComic", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
}
