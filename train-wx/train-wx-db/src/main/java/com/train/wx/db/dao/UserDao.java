package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.dto.UserDto;
import com.train.wx.db.model.UserInfo;

public interface UserDao {
	/**
	 * 插入信息
	 * 
	 * @param userInfo
	 */
	public void insertUser(UserInfo userInfo);

	/**
	 * 查询详细
	 * 
	 * @param openid
	 * @return
	 */
	public UserDto getUserInfoByOpenid(String openid);

	/**
	 * 查询详细
	 * 
	 * @param id
	 * @return
	 */
	public UserDto getUserInfo(String id);

	/**
	 * 查询列表
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	public List<UserInfo> queryUser(SysSearchDto sysSearchDto);

	/**
	 * 查询列表数
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	public Integer countUser(SysSearchDto sysSearchDto);
}
