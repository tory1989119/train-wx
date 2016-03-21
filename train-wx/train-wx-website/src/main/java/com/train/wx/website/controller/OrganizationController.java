package com.train.wx.website.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.train.wx.db.model.CourseType;
import com.train.wx.db.model.EnvironmentImg;
import com.train.wx.db.model.OrganizationInfo;
import com.train.wx.db.model.TeacherImg;
import com.train.wx.website.service.CourseService;
import com.train.wx.website.service.OrganizationService;

@Controller
@RequestMapping("/organization")
public class OrganizationController {
	@Autowired
	private OrganizationService organizationService;
	@Autowired
	private CourseService courseService;
	
	private Logger logger = LoggerFactory.getLogger(OrganizationController.class);

	private final String ORGANIZATION_PAGE = "organization"; //机构首页
	
	/**
	 * 跳转到机构首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "organizationPage.do", method = RequestMethod.GET)
	public String organizationPage(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			//机构信息
			OrganizationInfo organizationInfo = organizationService.getOrganizationInfo(id);
			request.setAttribute("organizationInfo", organizationInfo);
			//教学环境图片
			List<EnvironmentImg> environmentImgs = organizationService.queryEnvironmentImg(id);
			request.setAttribute("environmentImgs", environmentImgs);
			//老师图片
			List<TeacherImg> teacherImgs = organizationService.queryTeacherImg(id);
			request.setAttribute("teacherImgs", teacherImgs);
			//课程类型
			List<CourseType> courseTypes = courseService.queryCourseType(id);
			request.setAttribute("courseTypes", courseTypes);
			//课程信息
			request.setAttribute("courses", courseService.queryCourse(organizationInfo.getId().toString()));
		} catch (Exception e) {
			logger.error("OrganizationController.organizationPage", e);
		}
		return ORGANIZATION_PAGE;
	}
	
}
