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
import com.train.wx.website.service.ActivityService;

@Controller
@RequestMapping("/activity")
public class ActivityController {
	@Autowired
	private ActivityService activityService;
	
	private Logger logger = LoggerFactory.getLogger(ActivityController.class);

	private final String ACTIVITY_PAGE = "activity"; //活动页
	
	/**
	 * 跳转到活动页
	 * 
	 * @return
	 */
	@RequestMapping(value = "activityPage.do", method = RequestMethod.GET)
	public String activityPage(){
		return ACTIVITY_PAGE;
	}
	
	/**
	 * 查询活动列表
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	@RequestMapping(value = "queryActivity.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> queryActivity(SysSearchDto sysSearchDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			return activityService.queryActivity(sysSearchDto);
		} catch (Exception e) {
			logger.error("ActivityController.queryActivity", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
}
