package com.train.wx.manager.job;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Configurable;

import com.thoughtworks.xstream.XStream;
import com.thoughtworks.xstream.io.xml.XmlFriendlyReplacer;
import com.thoughtworks.xstream.io.xml.XppDriver;
import com.train.wx.common.enums.GlobConstants;
import com.train.wx.common.enums.WxConsts;
import com.train.wx.common.utils.Configuration;
import com.train.wx.common.utils.MD5Utils;
import com.train.wx.common.utils.RandomUtil;
import com.train.wx.db.dao.WxRedPackDao;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.dto.WxSendRedPackDto;
import com.train.wx.db.inf.WxClient;
import com.train.wx.db.model.WxRedPackInfo;

/**
 * 发送红包job
 * 
 * @author wuxj
 *
 */
@Configurable
public class SendRedPackJob {

	@Autowired
	private WxClient wxClient;

	@Autowired
	private WxRedPackDao wxRedPackDao;

	private Logger logger = LoggerFactory.getLogger(SendRedPackJob.class);

	// 轮询发送红包
	public void execute() {
		SysSearchDto sysSearch = new SysSearchDto();
		sysSearch.setBegin(0);
		sysSearch.setRows(100);
		List<WxRedPackInfo> list = wxRedPackDao.queryWxRedPackForJob(sysSearch);
		for (int i = 0; i < list.size(); i++) {
			String client_ip = Configuration.getGlobalMsg("client_ip");
			String mch_id = Configuration.getGlobalMsg("mch_id");
			String nonce_str = RandomUtil.getRandomString(32);
			String wxappid = Configuration.getGlobalMsg("appid");
			String key = Configuration.getGlobalMsg("key");
			WxRedPackInfo wxRedPack = list.get(i);
			String stringSignTemp = String.format(WxConsts.SENDREDPACK_PARAMS,
					wxRedPack.getActName(), client_ip,
					wxRedPack.getMchBillno(), mch_id, nonce_str,
					wxRedPack.getReOpenid(), wxRedPack.getRemark(),
					wxRedPack.getSendName(),
					wxRedPack.getTotalAmount(),
					wxRedPack.getTotalNum(), wxRedPack.getWishing(),
					wxappid, key);
			String sign = "";
			try {
				sign = MD5Utils.getMD5String(stringSignTemp).toUpperCase();
			} catch (UnsupportedEncodingException e) {
				logger.error(e.getMessage());
			}
			
			WxSendRedPackDto wxSendRedPackDto = new WxSendRedPackDto();
			wxSendRedPackDto.setNonce_str(nonce_str);// 随机字符串
			wxSendRedPackDto.setSign(sign);// 签名
			wxSendRedPackDto.setMch_billno(wxRedPack.getMchBillno());// 商户订单号
			wxSendRedPackDto.setMch_id(mch_id);// 商户号
			wxSendRedPackDto.setWxappid(wxappid);// 公众账号appid
			wxSendRedPackDto.setSend_name(wxRedPack.getSendName());// 商户名称
			wxSendRedPackDto.setRe_openid(wxRedPack.getReOpenid());// 用户openid
			wxSendRedPackDto.setTotal_amount(wxRedPack.getTotalAmount());// 付款金额
			wxSendRedPackDto.setTotal_num(wxRedPack.getTotalNum());// 红包发放总人数
			wxSendRedPackDto.setWishing(wxRedPack.getWishing());// 红包祝福语
			wxSendRedPackDto.setClient_ip(client_ip);// Ip地址
			wxSendRedPackDto.setAct_name(wxRedPack.getActName());// 活动名称
			wxSendRedPackDto.setRemark(wxRedPack.getRemark());// 备注
			
			String certfile = Configuration.getGlobalMsg("certfile");
			String pwd_cert = Configuration.getGlobalMsg("pwd_cert");
			
			XStream xStream = new XStream(new XppDriver(new XmlFriendlyReplacer("_-", "_")));
			xStream.alias("xml", WxSendRedPackDto.class);
			String str = xStream.toXML(wxSendRedPackDto);
			wxSendRedPackDto = (WxSendRedPackDto) xStream.fromXML(wxClient.sendRedPack(str, certfile, pwd_cert));
			if(wxSendRedPackDto.getReturn_code().equals(GlobConstants.WX_SENDREDPACK_FLAG_SUCCESSED) && wxSendRedPackDto.getResult_code().equals(GlobConstants.WX_SENDREDPACK_FLAG_SUCCESSED)){
				wxRedPack.setStatus("1");
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String date = sdf.format(new Date(wxSendRedPackDto.getSend_time()));
				wxRedPack.setSendTime(date);
				wxRedPack.setSendListid(wxSendRedPackDto.getSend_listid());
				wxRedPackDao.updateWxRedPack(wxRedPack);
			}else{
				wxRedPack.setStatus("9");
				wxRedPack.setError(wxSendRedPackDto.getErr_code_des());
				wxRedPackDao.updateWxRedPack(wxRedPack);
			}
		}

	}
}
