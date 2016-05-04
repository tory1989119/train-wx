package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.VoucherDto;
import com.train.wx.db.model.VoucherInfo;
import com.train.wx.db.model.VoucherLog;

public interface VoucherDao {
	/**
	 * 插入信息
	 * @param voucherInfo
	 */
	public void insertVoucher(VoucherInfo voucherInfo);
		
	/**
	 * 插入信息
	 * @param voucherLog
	 */
	public void insertVoucherLog(VoucherLog voucherLog);
	
	/**
	 * 查询列表
	 * @param voucherDto
	 * @return
	 */
	public List<VoucherDto> queryVoucher(VoucherDto voucherDto);
	
	/**
	 * 查询列表数
	 * @param voucherDto
	 * @return
	 */
	public Integer countVoucher(VoucherDto voucherDto);
	
	/**
	 * 查询列表
	 * @param 查询列表数
	 * @return
	 */
	public List<VoucherDto> queryVoucherLog(VoucherDto voucherDto);
	
	/**
	 * 查询列表数
	 * @param voucherDto
	 * @return
	 */
	public Integer countVoucherLog(VoucherDto voucherDto);
	
	/**
	 * 使用券
	 * @param id
	 */
	public void useVoucher(String id);
	
	/**
	 * 获取详情
	 * @param id
	 * @return
	 */
	public VoucherInfo getVoucherInfo(String id);
	
	/**
	 * 获取详情
	 * @param id
	 * @return
	 */
	public VoucherDto getVoucherDto(String id);
}
