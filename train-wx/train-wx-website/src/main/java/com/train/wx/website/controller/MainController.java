package com.train.wx.website.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.train.wx.common.enums.ErrorCode;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.model.UserInfo;
import com.train.wx.website.service.MainService;
import com.train.wx.website.service.UserService;

@Controller
@RequestMapping("/main")
public class MainController {
	@Autowired
	private MainService mainService;
	@Autowired
	private UserService userService;
	
	private Logger logger = LoggerFactory.getLogger(MainController.class);

	private final String MAIN_PAGE = "main"; //首页
	
	/**
	 * 首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "mainPage.do", method = RequestMethod.GET)
	public String mainPage(HttpServletRequest request){
		try {
			//首页广告
			request.setAttribute("banners", mainService.queryBanner("0"));
			//中间广告
			request.setAttribute("banner", mainService.queryBanner("1").get(0));
			
			//热门课程中间
			request.setAttribute("hotCourse", mainService.queryHotCourse("0"));
			//热门机构
			request.setAttribute("hotOrganization", mainService.queryHotOrganization());
		} catch (Exception e) {
			logger.error("MainController.indexPage", e);
		}
		return MAIN_PAGE;
	}
	
	/**
	 * 注册
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	@RequestMapping(value = "register.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> register(UserInfo userInfo) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			if(userService.getUserInfoByOpenid(userInfo.getOpenid()) == null){
				userService.insertUser(userInfo);
			}
		} catch (Exception e) {
			logger.error("MainController.register", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
	
}
