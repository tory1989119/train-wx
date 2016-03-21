package com.train.wx.db.model;

/**
 * 广告对象
 * 
 * @author wuxj
 *
 */
public class TuitionInfo {
	private Long id;
	private Long courseId;//课程id'
	private String age;//适宜年龄'
	private String classTime;//上课时间'
	private String quarterHour;//季度课时'
	private Double price;//单价',
	private Double total;//总价',
	private String createTime;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getCourseId() {
		return courseId;
	}

	public void setCourseId(Long courseId) {
		this.courseId = courseId;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getClassTime() {
		return classTime;
	}

	public void setClassTime(String classTime) {
		this.classTime = classTime;
	}

	public String getQuarterHour() {
		return quarterHour;
	}

	public void setQuarterHour(String quarterHour) {
		this.quarterHour = quarterHour;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}
}
