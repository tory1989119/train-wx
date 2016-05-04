package com.train.wx.website.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.train.wx.db.dao.VoucherDao;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.VoucherDto;
import com.train.wx.db.model.VoucherInfo;
import com.train.wx.db.model.VoucherLog;

@Service
public class WelfareService {
	
	@Autowired
	VoucherDao voucherDao;
	
	/**
	 * 插入信息
	 * @param voucherInfo
	 */
	public void insertVoucher(VoucherInfo voucherInfo){
		voucherDao.insertVoucher(voucherInfo);
	}
	
	/**
	 * 插入信息
	 * @param voucherLog
	 */
	public void insertVoucherLog(VoucherLog voucherLog){
		voucherDao.insertVoucherLog(voucherLog);
	}
	
	/**
	 * 查询列表
	 * @param voucherDto
	 * @return
	 */
	public BaseResponseDto<Object> queryVoucher(VoucherDto voucherDto){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(voucherDao.queryVoucher(voucherDto));
		br.setPageCount(voucherDao.countVoucher(voucherDto));
		return br;
	}
	
	/**
	 * 查询列表
	 * @param voucherDto
	 * @return
	 */
	public BaseResponseDto<Object> queryVoucherLog(VoucherDto voucherDto){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(voucherDao.queryVoucherLog(voucherDto));
		br.setPageCount(voucherDao.countVoucherLog(voucherDto));
		return br;
	}
	
	/**
	 * 使用优惠券
	 * @param id
	 */
	public void useVoucher(String id){
		voucherDao.useVoucher(id);
	}
	
	/**
	 * 查询是否拥有该券
	 * @param voucherDto
	 */
	public Integer countVoucherLog(VoucherDto voucherDto){
		return voucherDao.countVoucherLog(voucherDto);
	}
	
	/**
	 * 获取详情
	 * @param id
	 * @return
	 */
	public VoucherInfo getVoucherInfo(String id){
		return voucherDao.getVoucherInfo(id);
	}
	
	/**
	 * 获取详情
	 * @param id
	 * @return
	 */
	public VoucherDto getVoucherDto(String id){
		return voucherDao.getVoucherDto(id);
	}
}
