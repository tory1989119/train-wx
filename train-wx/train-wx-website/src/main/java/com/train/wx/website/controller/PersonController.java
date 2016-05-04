package com.train.wx.website.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.google.gson.JsonObject;
import com.train.wx.common.utils.Configuration;
import com.train.wx.db.dto.UserDto;
import com.train.wx.db.model.WxUserInfo;
import com.train.wx.website.service.UserService;

@Controller
@RequestMapping("/person")
public class PersonController {
	@Autowired
	private UserService userService;
	
	private Logger logger = LoggerFactory.getLogger(PersonController.class);

	private final String PERSON_PAGE = "person"; //首页
	private final String SUBSCRIBE_PAGE = "subscribe";//关注页面
	private final String REGISTER_PAGE = "register";//注册页面
	
	
	/**
	 * 跳转到个人中心
	 * 
	 * @return
	 */
	@RequestMapping(value = "personPage.do", method = RequestMethod.GET)
	public String personPage(){
		return userService.getRequestWxUrl(Configuration.getGlobalMsg("REDIRECT_PERSON_PAGE"),PERSON_PAGE);
	}
	
	/**
	 * 跳转到个人中心
	 * 
	 * @return
	 */
	@RequestMapping(value = "personPageByWx.do", method = RequestMethod.GET)
	public String personPageByWx(HttpServletRequest request,String code){
		try {
			if(code == null || code.equals("")){
				return SUBSCRIBE_PAGE;
			}else{
				//获取微信服务端openid
				JsonObject jo = userService.getOpenidByCode(code);
				String openid = jo.get("openid").getAsString();
				if(openid != null && !openid.equals("")){
					WxUserInfo wxUserInfo = userService.getWxUserByOpenid(openid);
					if(wxUserInfo == null || wxUserInfo.getSubscribe().equals("0")){
						return SUBSCRIBE_PAGE;
					}else{
						UserDto userDto = userService.getUserInfoByOpenid(openid);
						if(userDto == null){
							request.setAttribute("openid", openid);
							request.setAttribute("type", "0");
							return REGISTER_PAGE;
						}
						request.setAttribute("userDto", userDto);
					}
				}else{
					return SUBSCRIBE_PAGE;
				}
			}
		} catch (Exception e) {
			logger.error("PersonController.personPage", e);
			return SUBSCRIBE_PAGE;
		}
		return PERSON_PAGE;
	}
}
