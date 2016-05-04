package com.train.wx.db.model;

/**
 * 热门机构
 * 
 * @author wuxj
 *
 */
public class HotOrganizationInfo {
	private Long id;
	private Long organizationId;
	private String createTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Long organizationId) {
		this.organizationId = organizationId;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
