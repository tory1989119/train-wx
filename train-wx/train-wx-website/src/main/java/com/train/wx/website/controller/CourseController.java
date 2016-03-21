package com.train.wx.website.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.train.wx.db.model.CourseImg;
import com.train.wx.db.model.CourseInfo;
import com.train.wx.db.model.OrganizationInfo;
import com.train.wx.db.model.TuitionInfo;
import com.train.wx.website.service.CourseService;
import com.train.wx.website.service.OrganizationService;
import com.train.wx.website.service.TuitionService;

@Controller
@RequestMapping("/course")
public class CourseController {
	@Autowired
	private CourseService courseService;
	@Autowired
	private OrganizationService organizationService;
	@Autowired
	TuitionService tuitionService;
	
	private Logger logger = LoggerFactory.getLogger(CourseController.class);

	private final String COURSE_PAGE = "course"; //课程首页
	
	/**
	 * 跳转到课程首页
	 * 
	 * @return
	 */
	@RequestMapping(value = "coursePage.do", method = RequestMethod.GET)
	public String coursePage(HttpServletRequest request){
		try {
			String id = request.getParameter("id");
			//课程信息
			CourseInfo courseInfo = courseService.getCourseInfo(id);
			request.setAttribute("courseInfo", courseInfo);
			//课程图片
			List<CourseImg> courseImgs = courseService.queryCourseImg(id);
			request.setAttribute("courseImgs", courseImgs);
			//机构信息
			OrganizationInfo organizationInfo = organizationService.getOrganizationInfo(courseInfo.getOrganizationId().toString());
			request.setAttribute("organizationInfo", organizationInfo);
			//课程价格信息
			List<TuitionInfo> tuitionInfos= tuitionService.queryTuition(id);
			request.setAttribute("tuitionInfos", tuitionInfos);
		} catch (Exception e) {
			logger.error("CourseController.coursePage", e);
		}
		return COURSE_PAGE;
	}
	
}
