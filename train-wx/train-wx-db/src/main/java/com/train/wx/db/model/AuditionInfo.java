package com.train.wx.db.model;

/**
 * 试听对象
 * 
 * @author wuxj
 *
 */
public class AuditionInfo {
	private Long id;
	private Long organizationId;
	private String name;//
	private String img;// 图片
	private String age;// 适宜年龄
	private String address;// 试听地址
	private String auditionTime;// 试听时间
	private String create_time;// 创建时间

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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
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

	public String getCreate_time() {
		return create_time;
	}

	public void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public String getAuditionTime() {
		return auditionTime;
	}

	public void setAuditionTime(String auditionTime) {
		this.auditionTime = auditionTime;
	}
}
