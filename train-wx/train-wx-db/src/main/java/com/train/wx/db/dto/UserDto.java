package com.train.wx.db.dto;

/**
 * 用户对象
 * 
 * @author wuxj
 *
 */
public class UserDto {
	private Long id;
	private String openid;// openid
	private String name;// 家长姓名
	private String childrenName;// 孩子姓名
	private String mobilephone;// 手机号码
	private String address;// 地址
	private String school;// 学校
	private Integer childrenAge;// 年龄
	private String createTime;
	private String headimg;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getChildrenName() {
		return childrenName;
	}

	public void setChildrenName(String childrenName) {
		this.childrenName = childrenName;
	}

	public String getMobilephone() {
		return mobilephone;
	}

	public void setMobilephone(String mobilephone) {
		this.mobilephone = mobilephone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public Integer getChildrenAge() {
		return childrenAge;
	}

	public void setChildrenAge(Integer childrenAge) {
		this.childrenAge = childrenAge;
	}

	public String getHeadimg() {
		return headimg;
	}

	public void setHeadimg(String headimg) {
		this.headimg = headimg;
	}
}
