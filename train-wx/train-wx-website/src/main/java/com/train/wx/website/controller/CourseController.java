package com.train.wx.website.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.train.wx.common.enums.ErrorCode;
import com.train.wx.db.dto.BaseResponseDto;
import com.train.wx.db.dto.CourseDto;
import com.train.wx.db.model.CourseImg;
import com.train.wx.website.service.CourseService;
import com.train.wx.website.service.OrganizationService;

@Controller
@RequestMapping("/course")
public class CourseController {
	@Autowired
	private CourseService courseService;
	@Autowired
	private OrganizationService organizationService;
	
	private Logger logger = LoggerFactory.getLogger(CourseController.class);

	private final String COURSE_PAGE = "course"; //课程首页
	private final String SEARCH_PAGE = "search"; //课程首页
	
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
			CourseDto courseDto = courseService.getCourseInfoByVoucher(id);
			request.setAttribute("courseDto", courseDto);
			//课程图片
			List<CourseImg> courseImgs = courseService.queryCourseImg(id);
			request.setAttribute("courseImgs", courseImgs);
		} catch (Exception e) {
			logger.error("CourseController.coursePage", e);
		}
		return COURSE_PAGE;
	}
	
	/**
	 * 跳转到课程查询
	 * 
	 * @return
	 */
	@RequestMapping(value = "searchPage.do", method = RequestMethod.GET)
	public String searchPage(HttpServletRequest request,String type,String courseName){
		request.setAttribute("courseName", courseName);
		request.setAttribute("type", type);
		return SEARCH_PAGE;
	}
	
	/**
	 * 查询课程
	 * 
	 * @param voucherDto
	 * @return
	 */
	@RequestMapping(value = "queryCourses.do", method = RequestMethod.POST, produces = "application/json")
	@ResponseBody
	public BaseResponseDto<Object> queryCourses(CourseDto courseDto) {
		BaseResponseDto<Object> br = new BaseResponseDto<Object>();
		try {
			return courseService.queryCourses(courseDto);
		} catch (Exception e) {
			logger.error("CourseController.queryCourses", e);
			br.setErrorCode(ErrorCode.sys_error.getCode());
			br.setContent(ErrorCode.sys_error.getDes());
		}
		return br;
	}
}
