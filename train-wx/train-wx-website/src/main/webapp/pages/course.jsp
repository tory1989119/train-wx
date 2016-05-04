<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>一个班</title>
	<meta name="viewport" content="initial-scale=1, minimum-scale=1, maximum-scale=1,user-scalable=no,minimal-ui"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sm.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sm-extend.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demos.css">
</head>
<body>
	<div class="page-group">
		<div class="page page-current">
			<header class="bar bar-nav blue_bg fix-top">
				<a class="btn-back button-link button-nav pull-left back" href="<%=request.getContextPath()%>/main/mainPage.do">
					<span class="icon icon-back"></span>
				</a>
				<h1 class="title white_txt">${courseDto.organizationName}[${courseDto.name}]</h1>
			</header>
			<!--底部菜单 注意要放在content的前面-->
			<nav class="bar bar-tab foot-tabs">
				<a href="<%=request.getContextPath()%>/main/mainPage.do" class="tab-item external active">
					<span class="icon icon-tab"></span>
					<span class="tab-label">首页</span>
				</a>
				<a href="<%=request.getContextPath()%>/activity/activityPage.do" class="tab-item external">
					<span class="icon icon-tab1"></span>
					<span class="tab-label">活动表演</span>
				</a>
				<a href="<%=request.getContextPath()%>/audition/auditionPage.do" class="tab-item external">
					<span class="icon icon-tab3"></span>
					<span class="tab-label">我要试听</span>
				</a>
				<a href="<%=request.getContextPath()%>/person/personPage.do" class="tab-item external">
					<span class="icon icon-tab2"></span>
					<span class="tab-label">家长中心</span>
				</a>
				<!-- 
				<a href="<%=request.getContextPath()%>/mall/mallPage.do" class="tab-item external">
					<span class="icon icon-tab3"></span>
					<span class="tab-label">学具商城</span>
				</a>
				 -->
				<a href="<%=request.getContextPath()%>/welfare/welfarePage.do" class="tab-item external">
					<span class="icon icon-tab4"></span>
					<span class="tab-label">福利优惠</span>
				</a>
			</nav>
			<div class="content native-scroll">
				<div class="imgbox">
					<img src="${courseDto.bannerimg}">
				</div>
				<div class="agency-name-box white_bg bor_gray_tbcut m_t_cut">
					<h2 class="icon-vip tit"><a href="<%=request.getContextPath()%>/organization/organizationPage.do?id=${courseDto.organizationId}">${courseDto.organizationName}</a></h2>
				</div>
				<!---->
				<section class="info-box white_bg">
					<h2 class="tit_orange">课程介绍</h2>
					<div class="txtbox-p sub-txt">
						<p>适龄建议：${courseDto.age}</p>
						<p>教学内容：${courseDto.content}</p>
						<p>教学特色：${courseDto.feature}</p>
					</div>
				</section>
				<section class="info-box white_bg">
					<h2 class="tit_orange">课程费用</h2>
					<div class="txtbox-p sub-txt">
						<p>教学时间：${courseDto.classTime}</p>
						<p>教学费用：${courseDto.price}</p>
					</div>
				</section>
				<section class="info-box white_bg">
					<h2 class="tit_orange">教学展示</h2>
					<div class="img-lists m_lr_cut imgbox">
						<c:forEach  var="item" items="${courseImgs}">
								<img src="${item.url}" />
						</c:forEach>
						<c:if test="${courseDto.voucherId != null && courseDto.voucherId != ''}">
							<a href="<%=request.getContextPath()%>/welfare/getVoucherInfo.do?id=${courseDto.voucherId}" class="button button-big button-orange">我要优惠券</a>
						</c:if>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
</body>
</html>