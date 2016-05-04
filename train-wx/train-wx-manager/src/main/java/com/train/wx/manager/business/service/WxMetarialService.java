package com.train.wx.manager.business.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.train.wx.common.enums.ErrorCode;
import com.train.wx.common.utils.Configuration;
import com.train.wx.db.dao.WxMetarialDao;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.inf.WxClient;
import com.train.wx.db.model.WxMetarialInfo;

@Service
public class WxMetarialService {
	@Autowired
	private WxMetarialDao wxMetarialDao;
	@Autowired
	private WxClient wxClient;

	/**
	 * 查询素材列表
	 * 
	 * @param searchDto
	 * @return
	 */
	public BaseResponseDto<Object> queryWxMetarial(SysSearchDto searchDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(wxMetarialDao.queryWxMetarial(searchDto));
		br.setPageCount(wxMetarialDao.countWxMetarial(searchDto));
		return br;
	}
	
	
	public BaseResponseDto<Object> syncWxMetarial(){
		wxMetarialDao.truncateWxMetarial();
		BaseResponseDto<Object> br = syncNews();
		if(br.getErrorCode().equals(ErrorCode.sucessed.getCode())){
			br = syncImage();
		}
		return br;
	}
	
	
	/**
	 * 同步图文素材
	 * @return
	 */
	private BaseResponseDto<Object> syncNews(){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		Integer begin = 0;
		boolean flag = true;
		while (flag) {
			JsonObject jo = wxClient.metarialQuery("news",begin);
			if(jo.get("errcode") == null){
				begin = begin +20;
				Integer item_count = jo.get("item_count").getAsInt();
				if(item_count > 0){
					JsonArray ja = jo.get("item").getAsJsonArray();
					for (int i = 0; i < ja.size(); i++) {
						JsonObject metarialJo = ja.get(i).getAsJsonObject();
						String media_id = metarialJo.get("media_id").getAsString();
						Long update_time = metarialJo.get("update_time").getAsLong();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						String date = sdf.format(new Date(update_time*1000));
						JsonArray metarualJa = metarialJo.get("content").getAsJsonObject().get("news_item").getAsJsonArray();
						for (int j = 0; j < metarualJa.size(); j++) {
							JsonObject mediaJo = metarualJa.get(j).getAsJsonObject();
							WxMetarialInfo wxMetarial = new WxMetarialInfo();
							wxMetarial.setType("news");
							wxMetarial.setMediaId(media_id);
							wxMetarial.setUpdateTime(date);
							wxMetarial.setTitle(mediaJo.get("title").getAsString());
							wxMetarial.setThumbMediaId(mediaJo.get("thumb_media_id").getAsString());
							wxMetarial.setThumbUrl(mediaJo.get("thumb_url").getAsString());
							wxMetarial.setShowCoverPic(mediaJo.get("show_cover_pic").getAsString());
							wxMetarial.setAuthor(mediaJo.get("author").getAsString());
							wxMetarial.setDigest(mediaJo.get("digest").getAsString());
							wxMetarial.setContent(mediaJo.get("content").getAsString());
							wxMetarial.setUrl(mediaJo.get("url").getAsString());
							wxMetarial.setContentSourceUrl(mediaJo.get("content_source_url").getAsString());
							wxMetarialDao.insertWxMetarial(wxMetarial);
						}
					}
				}else{
					flag = false;
				}
			}else{
				br.setErrorCode(ErrorCode.wx_error.getCode());
				br.setContent(jo.get("errcode").getAsString() + "--" + jo.get("errmsg").getAsString());
			}
		}
		return br;
	}
	
	/**
	 * 同步图片素材
	 * @return
	 */
	private BaseResponseDto<Object> syncImage(){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		Integer begin = 0;
		boolean flag = true;
		while (flag) {
			JsonObject jo = wxClient.metarialQuery("image",begin);
			if(jo.get("errcode") == null){
				begin = begin +20;
				Integer item_count = jo.get("item_count").getAsInt();
				if(item_count > 0){
					JsonArray ja = jo.get("item").getAsJsonArray();
					for (int i = 0; i < ja.size(); i++) {
						JsonObject metarialJo = ja.get(i).getAsJsonObject();
						String media_id = metarialJo.get("media_id").getAsString();
						Long update_time = metarialJo.get("update_time").getAsLong();
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
						String date = sdf.format(new Date(update_time*1000));
						WxMetarialInfo wxMetarial = new WxMetarialInfo();
						wxMetarial.setMediaId(media_id);
						wxMetarial.setUpdateTime(date);
						String img_path = Configuration.getGlobalMsg("img_path");
						String img_url_path = Configuration.getGlobalMsg("img_url_path");
						download(metarialJo.get("url").getAsString(), img_path + metarialJo.get("name").getAsString());
						wxMetarial.setUrl(img_url_path + metarialJo.get("name").getAsString());
						//wxMetarial.setUrl(metarialJo.get("url").getAsString());
						wxMetarial.setName(metarialJo.get("name").getAsString());
						wxMetarial.setTitle(metarialJo.get("name").getAsString());
						wxMetarial.setType("image");
						wxMetarialDao.insertWxMetarial(wxMetarial);
					}
				}else{
					flag = false;
				}
			}else{
				br.setErrorCode(ErrorCode.wx_error.getCode());
				br.setContent(jo.get("errcode").getAsString() + "--" + jo.get("errmsg").getAsString());
			}
		}
		return br;
	}
	
	/**
	   * 下载文件到本地
	   *
	   * @param urlString
	   *          被下载的文件地址
	   * @param filename
	   *          本地文件名
	   * @throws Exception
	   *           各种异常
	   */
	public void download(String urlString, String filename) {
		OutputStream os = null;
		InputStream is = null;
		try {
			// 构造URL
		    URL url = new URL(urlString);
		    // 打开连接
		    URLConnection con = url.openConnection();
		    // 输入流
		    is = con.getInputStream();
		    // 1K的数据缓冲
		    byte[] bs = new byte[1024];
		    // 读取到的数据长度
		    int len;
		    // 输出的文件流
		    os = new FileOutputStream(filename);
		    // 开始读取
		    while ((len = is.read(bs)) != -1) {
		      os.write(bs, 0, len);
		    }
		    // 完毕，关闭所有链接
		    os.close();
		    is.close();
		} catch (Exception e) {
			
		}finally{
			// 完毕，关闭所有链接
		    try {
		    	if(os != null){
		    		os.close();
		    	}
		    	if(is != null){
		    		is.close();	
			    }
			} catch (IOException e) {
			}
		   
		}
	   
	} 
}
