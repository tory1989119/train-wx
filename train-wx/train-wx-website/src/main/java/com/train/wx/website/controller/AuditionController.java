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
import com.train.wx.website.service.AuditionService;

@Controller
@RequestMapping("/audition")
public class AuditionController {
	@Autowired
	private AuditionService auditionService;
	
	private Logger logger = LoggerFactory.getLogger(AuditionController.class);

	private final String AUDITION_PAGE = "audition"; //试听页
	
	/**
	 * 跳转到试听页
	 * 
	 * @return
	 */
	@RequestMapping(value = "auditionPage.do", method = RequestMethod.GET)
	public String auditionPage(){
		return AUDITION_PAGE;
	}
	
	/**
	 * 查询列表
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	@RequestMapping(value = "queryAudition.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> queryAudition(SysSearchDto sysSearchDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			return auditionService.queryAudition(sysSearchDto);
		} catch (Exception e) {
			logger.error("AuditionController.queryAudition", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
}
