package com.train.wx.db.dto;

/**
 * 试听对象
 * 
 * @author wuxj
 *
 */
public class AuditionDto {
	private Long id;
	private String name;//
	private Long organizationId;
	private String organizationName;
	private String img;// 图片
	private String age;// 适宜年龄
	private String address;// 试听地址
	private String auditionTime;// 试听时间
	private String createTime;// 创建时间
	private String telephone;// 电话
	private String headimg;// 头像

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}

	public String getTelephone() {
		return telephone;
	}

	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getOrganizationId() {
		return organizationId;
	}

	public void setOrganizationId(Long organizationId) {
		this.organizationId = organizationId;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAuditionTime() {
		return auditionTime;
	}

	public void setAuditionTime(String auditionTime) {
		this.auditionTime = auditionTime;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

}
