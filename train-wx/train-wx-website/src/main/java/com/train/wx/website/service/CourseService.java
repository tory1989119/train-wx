package com.train.wx.website.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.train.wx.db.dao.CourseDao;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.CourseDto;
import com.train.wx.db.dto.SysSearchDto;
import com.train.wx.db.model.CourseImg;
import com.train.wx.db.model.CourseInfo;
import com.train.wx.db.model.CourseType;

@Service
public class CourseService {
	
	@Autowired
	CourseDao courseDao;
	
	/**
	 * 查询课程列表
	 * @param searchDto
	 * @return
	 */
	public List<CourseInfo> queryCourse(String organizationId){
		return courseDao.queryCourseByOrganizationId(organizationId);
	}
	
	/**
	 * 查询课程列表
	 * @param searchDto
	 * @return
	 */
	public BaseResponseDto<Object> queryCourse(SysSearchDto searchDto){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(courseDao.queryCourse(searchDto));
		br.setPageCount(courseDao.countCourse(searchDto));
		return br;
	}
	
	/**
	 * 查询列表
	 * @param courseDto
	 * @return
	 */
	public BaseResponseDto<Object> queryCourses(CourseDto courseDto){
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		br.setContent(courseDao.queryCourses(courseDto));
		br.setPageCount(courseDao.countCourses(courseDto));
		return br;
	}
	
	/**
	 * 查询课程详情
	 * @param id
	 * @return
	 */
	public CourseInfo getCourseInfo(String id){
		return courseDao.getCourseInfo(id);
	}
	
	/**
	 * 查询详细信息
	 * @param id
	 * @return
	 */
	public CourseDto getCourseInfoByVoucher(String id){
		return courseDao.getCourseInfoByVoucher(id);
	}
	
	/**
	 * 查询课程图片
	 * @param id
	 * @return
	 */
	public List<CourseImg> queryCourseImg(String courseId){
		return courseDao.queryCourseImg(courseId);
	}
	
	/**
	 * 查询课程类型
	 * @param id
	 * @return
	 */
	public List<CourseType> queryCourseType(String organizationId){
		return courseDao.queryCourseType(organizationId);
	}
	
}
