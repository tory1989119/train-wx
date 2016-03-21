package com.train.wx.website.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.train.wx.website.service.IndexService;

@Controller
@RequestMapping("/activity")
public class ActivityController {
	@Autowired
	private IndexService indexService;
	
	private Logger logger = LoggerFactory.getLogger(ActivityController.class);

	private final String ACTIVITY_PAGE = "activity"; //首页
	
	/**
	 * 跳转到医院首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "activityPage.do", method = RequestMethod.GET)
	public String activityPage(){
		return ACTIVITY_PAGE;
	}
	
}
