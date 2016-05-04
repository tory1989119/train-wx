package com.train.wx.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.train.wx.common.enums.WxConsts;
import com.train.wx.common.utils.Configuration;
import com.train.wx.db.dao.UserDao;
import com.train.wx.db.dao.WxUserDao;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.dto.UserDto;
import com.train.wx.db.inf.WxClient;
import com.train.wx.db.model.UserInfo;
import com.train.wx.db.model.WxUserInfo;

@Service
public class UserService {
	
	@Autowired
	UserDao userDao;
	@Autowired
	private WxClient wxClient;
	@Autowired
	private WxUserDao wxUserDao;
	
	/**
	 * 插入信息
	 * 
	 * @param userInfo
	 */
	public void insertUser(UserInfo userInfo){
		userDao.insertUser(userInfo);
	}

	/**
	 * 查询详细
	 * 
	 * @param id
	 * @return
	 */
	public UserDto getUserInfoByOpenid(String openid){
		return userDao.getUserInfoByOpenid(openid);
	}

	/**
	 * 查询详细
	 * 
	 * @param id
	 * @return
	 */
	public UserDto getUserInfo(String id){
		return userDao.getUserInfo(id);
	}

	/**
	 * 查询列表
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	public BaseResponseDto<Object> queryUser(SysSearchDto sysSearchDto){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(userDao.queryUser(sysSearchDto));
		br.setPageCount(userDao.countUser(sysSearchDto));
		return br;
	}
	
	/**
	 * 获取授权信息
	 * @param code
	 * @return
	 */
	public JsonObject getOpenidByCode(String code){
		String grant_type = WxConsts.WY_GRANT_TYPE;
		String appid = Configuration.getGlobalMsg("appid");
		String secret = Configuration.getGlobalMsg("secret");
		return wxClient.getOpenidByCode(grant_type, appid, secret, code);
	}
	
	/**
	 * 获取微信用户信息
	 * @param openid
	 * @return
	 */
	public WxUserInfo getWxUserByOpenid (String openid){
		return wxUserDao.getWxUserByOpenid(openid);
	}
	
	/**
	 * 获取访问微信端获取openid的url
	 * @param url
	 * @return
	 */
	public String getRequestWxUrl(String url,String state){
		String scope = WxConsts.OAUTH2_SCOPE_BASE;
		String appid = Configuration.getGlobalMsg("appid");
		return wxClient.getRequestWxUrl(appid, url, scope,state);
	}
}
