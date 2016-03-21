package com.train.wx.website.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.train.wx.website.service.IndexService;

@Controller
@RequestMapping("/person")
public class PersonController {
	@Autowired
	private IndexService indexService;
	
	private Logger logger = LoggerFactory.getLogger(PersonController.class);

	private final String PERSON_PAGE = "person"; //首页
	
	/**
	 * 跳转到医院首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "personPage.do", method = RequestMethod.GET)
	public String personPage(){
		return PERSON_PAGE;
	}
	
}
