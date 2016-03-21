package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.EnvironmentImg;
import com.train.wx.db.model.OrganizationInfo;
import com.train.wx.db.model.TeacherImg;

public interface OrganizationDao {
	/**
	 * 插入信息
	 * @param organizationInfo
	 */
	public void insertOrganization(OrganizationInfo organizationInfo);
	
	/**
	 * 获取详细信息
	 * @param id
	 * @return
	 */
	public OrganizationInfo getOrganizationInfo(String id);
	
	/**
	 * 查询列表
	 * @param searchDto
	 * @return
	 */
	public List<OrganizationInfo> queryOrganization(SysSearchDto searchDto);
	
	/**
	 * 查询列表数
	 * @param searchDto
	 * @return
	 */
	public Integer countOrganization(SysSearchDto searchDto);
	
	/**
	 * 查询教师图片
	 * @param organizationId
	 * @return
	 */
	public List<TeacherImg> queryTeacherImg(String organizationId);

	/**
	 * 查询环境图片
	 */
	public List<EnvironmentImg> queryEnvironmentImg(String organizationId);
	
}
