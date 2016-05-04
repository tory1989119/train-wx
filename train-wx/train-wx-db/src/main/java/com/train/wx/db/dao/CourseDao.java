package com.train.wx.db.dao;

import java.util.List;

import com.train.wx.db.dto.CourseDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.CourseImg;
import com.train.wx.db.model.CourseInfo;
import com.train.wx.db.model.CourseType;

public interface CourseDao {
	/**
	 * 插入信息
	 * @param courseInfo
	 */
	public void insertCourse(CourseInfo courseInfo);
	
	/**
	 * 查询详细信息
	 * @param id
	 * @return
	 */
	public CourseInfo getCourseInfo(String id);
	
	/**
	 * 查询详细信息
	 * @param id
	 * @return
	 */
	public CourseDto getCourseInfoByVoucher(String id);
	
	/**
	 * 查询列表
	 * @param searchDto
	 * @return
	 */
	public List<CourseInfo> queryCourse(SysSearchDto searchDto);
	
	/**
	 * 查询列表数
	 * @param searchDto
	 * @return
	 */
	public Integer countCourse(SysSearchDto searchDto);
	
	/**
	 * 查询课程图片
	 * @param courseId
	 * @return
	 */
	public List<CourseImg> queryCourseImg(String courseId);
	
	/**
	 * 查询课程类型
	 * @param organizationId
	 * @return
	 */
	public List<CourseType> queryCourseType(String organizationId);
	
	/**
	 * 查询列表
	 * @param searchDto
	 * @return
	 */
	public List<CourseInfo> queryCourseByOrganizationId(String organizationId);
	
	/**
	 * 查询列表
	 * @param searchDto
	 * @return
	 */
	public List<CourseDto> queryCourses(CourseDto courseDto);
	
	/**
	 * 查询列表数
	 * @param courseDto
	 * @return
	 */
	public Integer countCourses(CourseDto courseDto);
}
