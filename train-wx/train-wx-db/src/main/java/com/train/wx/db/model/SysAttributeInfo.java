package com.train.wx.db.model;

/**
 * 系统参数表
 * 
 * @author wuxj
 *
 */
public class SysAttributeInfo {
	private Long id;
	private String code;
	private String value;
	private String type;

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
