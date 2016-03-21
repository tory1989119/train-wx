package com.train.wx.website.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.train.wx.db.dao.OrganizationDao;
import com.train.wx.db.model.EnvironmentImg;
import com.train.wx.db.model.OrganizationInfo;
import com.train.wx.db.model.TeacherImg;

@Service
public class OrganizationService {
	
	@Autowired
	OrganizationDao organizationDao;
	
	/**
	 * 获取机构详细信息
	 * @param id
	 * @return
	 */
	public OrganizationInfo getOrganizationInfo(String id){
		return organizationDao.getOrganizationInfo(id);
	}
	
	/**
	 * 获取环境图片
	 * @param organizationId
	 * @return
	 */
	public List<EnvironmentImg> queryEnvironmentImg(String organizationId){
		return organizationDao.queryEnvironmentImg(organizationId);
	}
	
	/**
	 * 获取老师图片
	 * @param organizationId
	 * @return
	 */
	public List<TeacherImg> queryTeacherImg(String organizationId){
		return organizationDao.queryTeacherImg(organizationId);
	}
	
}
