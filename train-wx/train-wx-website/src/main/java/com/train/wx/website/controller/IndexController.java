package com.train.wx.website.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.train.wx.website.service.IndexService;

@Controller
@RequestMapping("/main")
public class IndexController {
	@Autowired
	private IndexService indexService;
	
	private Logger logger = LoggerFactory.getLogger(IndexController.class);

	private final String INDEX_PAGE = "index"; //首页
	
	/**
	 * 首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "indexPage.do", method = RequestMethod.GET)
	public String indexPage(HttpServletRequest request){
		try {
			//首页广告
			request.setAttribute("banners", indexService.queryBanner("0"));
			//中间广告
			request.setAttribute("banner", indexService.queryBanner("1").get(0));
			
			//热门课程中间
			request.setAttribute("hotCourse0", indexService.queryHotCourse("0"));
			//热门课程底部
			request.setAttribute("hotCourse1", indexService.queryHotCourse("1"));
		} catch (Exception e) {
			logger.error("IndexController.indexPage", e);
		}
		return INDEX_PAGE;
	}
	
}
