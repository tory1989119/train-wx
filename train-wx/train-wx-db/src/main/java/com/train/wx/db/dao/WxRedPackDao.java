package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.WxRedPackInfo;

public interface WxRedPackDao {

	/**
	 * 插入信息
	 * 
	 * @param wxRedPack
	 */
	public void insertWxRedPack(WxRedPackInfo wxRedPack);

	/**
	 * 发送成功修改红包状态
	 * 
	 * @param sysSearch
	 * @return
	 */
	public void updateWxRedPack(WxRedPackInfo wxRedPack);

	/**
	 * 查询微信红包记录
	 * 
	 * @param sysSearch
	 * @return
	 */
	public List<WxRedPackInfo> queryWxRedPack(SysSearchDto sysSearch);

	/**
	 * 查询微信红包记录数
	 * 
	 * @param sysSearch
	 * @return
	 */
	public Integer countWxRedPack(SysSearchDto sysSearch);
	
	/**
	 * 查询需要发送的红包
	 * 
	 * @param sysSearch
	 * @return
	 */
	public List<WxRedPackInfo> queryWxRedPackForJob(SysSearchDto sysSearch);

}
