package com.train.wx.website.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.train.wx.website.service.MainService;

@Controller
@RequestMapping("/mall")
public class MallController {
	@Autowired
	private MainService indexService;
	
	private Logger logger = LoggerFactory.getLogger(MallController.class);

	private final String MALL_PAGE = "mall"; //首页
	
	/**
	 * 跳转到医院首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "mallPage.do", method = RequestMethod.GET)
	public String mallPage(){
		return MALL_PAGE;
	}
	
}
