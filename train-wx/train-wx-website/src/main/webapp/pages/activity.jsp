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
				<a class="btn-back button-link button-nav pull-left back" href="#">
					<span class="icon icon-back"></span>
				</a>
				<h1 class="title white_txt">活动表演</h1>
			</header>
			<!--底部菜单 注意要放在content的前面-->
			<nav class="bar bar-tab foot-tabs">
				<a href="<%=request.getContextPath()%>/main/indexPage.do" class="tab-item external">
					<span class="icon icon-tab"></span>
					<span class="tab-label">首页</span>
				</a>
				<a href="<%=request.getContextPath()%>/activity/activityPage.do" class="tab-item external active">
					<span class="icon icon-tab1"></span>
					<span class="tab-label">活动表演</span>
				</a>
				<a href="<%=request.getContextPath()%>/person/personPage.do" class="tab-item external">
					<span class="icon icon-tab2"></span>
					<span class="tab-label">家长中心</span>
				</a>
				<a href="<%=request.getContextPath()%>/mall/mallPage.do" class="tab-item external">
					<span class="icon icon-tab3"></span>
					<span class="tab-label">学具商城</span>
				</a>
				<a href="<%=request.getContextPath()%>/welfare/welfarePage.do" class="tab-item external">
					<span class="icon icon-tab4"></span>
					<span class="tab-label">福利优惠</span>
				</a>
			</nav>
			<div class="content native-scroll">
				<div class="imgbox">
					<img src="<%=request.getContextPath()%>/images/img_30.png">
				</div>
				<!--列表-->
				<div class="list-block white_bg bor_gray_tcut">
				      <ul>
				      	<li>
				      		<div class="item-content p_tb_cut">
				      			<div class="item-media round-img imgbox">
				      				<img src="<%=request.getContextPath()%>/images/img_42.png">
			      				</div>
				      			<div class="item-inner">
				      				<div class="item-title-row">
				      					<div class="item-title">绘画暑期班</div>
				      				</div>
				      			</div>
				      			<div class="item-media2">
				      				<a class="button button-orange w-more">免费</a>
			      				</div>
				      		</div>
				      	</li>
				      </ul>
				</div>
				<div class="list-block media-list white_bg m_b_cut">
				      <ul class="bor_none">
				      	<li>
				      		<div class="item-content">
				      			<div class="item-inner">
				      				<div class="item-title-row">
				      					<div class="item-title icon-vip">临平幼教中心</div>
				      				</div>
				      				<div class="item-subtitle">
				      					<div class="sub_txt s_font">
				      						<div>活动时间：<span>2016年6月1日</span></div>
				      						<div>活动地址：<span>临平东湖路1号</span></div>
				      						<div>参与对象：<span>3~10岁</span></div>
				      					</div>
				      					
			      					</div>
				      			</div>
				      			<div class="item-media2">
				      				<a href="tel:12312341234" class="button button-orange">报名咨询</a>
			      				</div>
				      		</div>
				      	</li>
				      </ul>
				</div>
				<div class="imgbox">
					<img src="<%=request.getContextPath()%>/images/img_43.png">
				</div>
				<!--列表-->
				<div class="list-block white_bg bor_gray_tcut">
				      <ul>
				      	<li>
				      		<div class="item-content p_tb_cut">
				      			<div class="item-media round-img imgbox">
				      				<img src="<%=request.getContextPath()%>/images/img_42.png">
			      				</div>
				      			<div class="item-inner">
				      				<div class="item-title-row">
				      					<div class="item-title">冲浪特训班</div>
				      				</div>
				      			</div>
				      			<div class="item-media2">
				      				<a class="button button-orange bor">收费</a>
			      				</div>
				      		</div>
				      	</li>
				      </ul>
				</div>
				<div class="list-block media-list white_bg m_b_cut">
				      <ul class="bor_none">
				      	<li>
				      		<div class="item-content">
				      			<div class="item-inner">
				      				<div class="item-title-row">
				      					<div class="item-title icon-vip">临平幼教中心</div>
				      				</div>
				      				<div class="item-subtitle">
				      					<div class="sub_txt s_font">
				      						<div>活动时间：<span>2016年6月1日</span></div>
				      						<div>活动地址：<span>临平东湖路1号</span></div>
				      						<div>参与对象：<span>3~10岁</span></div>
				      					</div>
				      					
			      					</div>
				      			</div>
				      			<div class="item-media2">
				      				<a tel="13212341234" class="button button-orange">报名咨询</a>
			      				</div>
				      		</div>
				      	</li>
				      </ul>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
</body>
</html>