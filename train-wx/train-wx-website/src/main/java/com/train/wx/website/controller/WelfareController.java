package com.train.wx.website.controller;

import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.google.gson.JsonObject;
import com.train.wx.common.enums.BusErrorCode;
import com.train.wx.common.enums.ErrorCode;
import com.train.wx.common.utils.Configuration;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.UserDto;
import com.train.wx.db.dto.VoucherDto;
import com.train.wx.db.model.VoucherInfo;
import com.train.wx.db.model.VoucherLog;
import com.train.wx.db.model.WxUserInfo;
import com.train.wx.website.service.UserService;
import com.train.wx.website.service.WelfareService;

@Controller
@RequestMapping("/welfare")
public class WelfareController {
	@Autowired
	private WelfareService welfareService;
	@Autowired
	private UserService userService;
	
	private Logger logger = LoggerFactory.getLogger(WelfareController.class);

	private final String WELFARE_PAGE = "welfare"; //首页
	
	private final String VOUCHER_INFO_PAGE = "voucherInfo"; //首页
	private final String SUBSCRIBE_PAGE = "subscribe";//关注页面
	private final String REGISTER_PAGE = "register";//注册页面
	
	
	/**
	 * 跳转到福利首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "welfarePage.do", method = RequestMethod.GET)
	public String welfarePage(){
		return userService.getRequestWxUrl(Configuration.getGlobalMsg("REDIRECT_WELFARE_PAGE"),WELFARE_PAGE);
	}
	
	
	/**
	 * 跳转到福利首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "welfarePageByWx.do", method = RequestMethod.GET)
	public String welfarePageByWx(HttpServletRequest request,String code){
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
							request.setAttribute("type", "1");
							return REGISTER_PAGE;
						}
						request.setAttribute("userId", userDto.getId());
					}
				}else{
					return SUBSCRIBE_PAGE;
				}
			}
		} catch (Exception e) {
			logger.error("PersonController.personPage", e);
			return SUBSCRIBE_PAGE;
		}
		return WELFARE_PAGE;
	}
	
	/**
	 * 查询活动列表
	 * 
	 * @param voucherDto
	 * @return
	 */
	@RequestMapping(value = "queryVoucher.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> queryVoucher(VoucherDto voucherDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			return welfareService.queryVoucher(voucherDto);
		} catch (Exception e) {
			logger.error("WelfareController.queryVoucher", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
	
	/**
	 * 查询活动列表
	 * 
	 * @param voucherDto
	 * @return
	 */
	@RequestMapping(value = "queryVoucherLog.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> queryVoucherLog(VoucherDto voucherDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			return welfareService.queryVoucherLog(voucherDto);
		} catch (Exception e) {
			logger.error("WelfareController.queryVoucherLog", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
	
	/**
	 * 使用券
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	@RequestMapping(value = "useVoucher.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> useVoucher(String id) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			welfareService.useVoucher(id);
		} catch (Exception e) {
			logger.error("WelfareController.useVoucher", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
	
	/**
	 * 查询券是否领取
	 * 
	 * @param sysSearchDto
	 * @return
	 */
	@RequestMapping(value = "insertVoucherLog.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> insertVoucherLog(String id,Long userId) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			VoucherDto voucherDto = new VoucherDto();
			voucherDto.setUserId(userId);
			voucherDto.setVoucherId(Long.valueOf(id));
			if(welfareService.countVoucherLog(voucherDto) <= 0){
				VoucherInfo voucherInfo = welfareService.getVoucherInfo(id);
				VoucherLog voucherLog = new VoucherLog();
				voucherLog.setContent(voucherInfo.getContent());
				voucherLog.setCourseId(voucherInfo.getCourseId());
				voucherLog.setEndTime(voucherInfo.getEndTime());
				voucherLog.setOrganizationId(voucherInfo.getOrganizationId());
				voucherLog.setPrice(voucherInfo.getPrice());
				voucherLog.setStartTime(voucherInfo.getStartTime());
				voucherLog.setType(voucherInfo.getType());
				voucherLog.setUserId(userId);
				voucherLog.setVoucherId(Long.valueOf(id));
				welfareService.insertVoucherLog(voucherLog);
			}else{
				br.setErrorCode(BusErrorCode.get_voucher_error.getCode());
				br.setContent(BusErrorCode.get_voucher_error.getDes());
			}
		} catch (Exception e) {
			logger.error("WelfareController.insertVoucherLog", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
	
	/**
	 * 券详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "getVoucherInfo.do", method = RequestMethod.GET)
	public String getVoucherInfo(String id,String userId,HttpServletRequest request){
		return userService.getRequestWxUrl(Configuration.getGlobalMsg("REDIRECT_VOUCHER_PAGE"),id);
	}
	
	/**
	 * 券详情
	 * 
	 * @return
	 */
	@RequestMapping(value = "getVoucherInfoByWx.do", method = RequestMethod.GET)
	public String getVoucherInfoByWx(HttpServletRequest request,String code,String state){
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
						VoucherDto voucherDto = welfareService.getVoucherDto(state);
						request.setAttribute("voucherDto", voucherDto);
						request.setAttribute("userId", userDto.getId());
					}
				}else{
					return SUBSCRIBE_PAGE;
				}
			}
		} catch (Exception e) {
			logger.error("PersonController.personPage", e);
			return SUBSCRIBE_PAGE;
		}
		
		return VOUCHER_INFO_PAGE;
	}
	
}
