package com.train.wx.db.model;

/**
 * 热门课程
 * 
 * @author wuxj
 *
 */
public class HotCourseInfo {
	private Long id;
	private String type;
	private Long tuitionId;
	private Integer readNum;
	private Integer likeNum;
	private String createTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getTuitionId() {
		return tuitionId;
	}

	public void setTuitionId(Long tuitionId) {
		this.tuitionId = tuitionId;
	}

	public Integer getReadNum() {
		return readNum;
	}

	public void setReadNum(Integer readNum) {
		this.readNum = readNum;
	}

	public Integer getLikeNum() {
		return likeNum;
	}

	public void setLikeNum(Integer likeNum) {
		this.likeNum = likeNum;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
}
