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
				<h1 class="title white_txt">机构详情</h1>
			</header>
			<!--底部菜单 注意要放在content的前面-->
			<nav class="bar bar-tab foot-tabs">
				<a href="<%=request.getContextPath()%>/main/indexPage.do" class="tab-item external active">
					<span class="icon icon-tab"></span>
					<span class="tab-label">首页</span>
				</a>
				<a href="<%=request.getContextPath()%>/activity/activityPage.do" class="tab-item external">
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
					<img src="${organizationInfo.img}">
				</div>
				<!---->
				<div class="agency-name-box white_bg bor_gray_tbcut m_t_cut">
					<h2 class="icon-vip tit">${organizationInfo.name}</h2>
					<c:forEach  var="item" items="${courseTypes}">
						<a class="round-txtbg bg${item.code}">${item.value}</a>
					</c:forEach>
				</div>
				<div class="info-box white_bg bor_gray_tcut m_t_cut">
					<p class="mar_none p_lr_cut font-normal">联系地址：${organizationInfo.address}</p>
					<a class="mar_none p_lr_cut font-normal">咨询电话:<a href="tel:${organizationInfo.telephone}" class="orange_txt">${organizationInfo.telephone}</a></a>
				</div>
				<article class="info-box white_bg bor_gray_tbcut">
					<h2 class="orange_txt t_c font-normal">机构简介</h2>
					<p class="sub-txt p_lr_cut mar_none">${organizationInfo.introduction}</p>
				</article>
				<section class="info-box white_bg m_tb_cut bor_gray_tbcut">
					<h2 class="tit_orange">课程总数</h2>
					<div class="item-txt p_lr_cut ">
					<c:forEach  var="item" items="${courses}">
						<a href="<%=request.getContextPath()%>/course/coursePage.do?id=${item.id}">${item.name}</a>
					</c:forEach>
					</div>
				</section>
				<section class="white_bg ">
					<h2 class="tit_orange">师资展示</h2>
					<section class="imgbox">
						<div class="swiper-container4 hidden ">
							  <div class="swiper-wrapper">
								    <div class="swiper-slide blue-slide">
								    	<div class="img-lists-col4 cansel_scrollbar">
											<div class="ins c_f ">
												<c:forEach  var="item" items="${teacherImgs}">
													<div class="item imgbox">
														<img src="${item.url}" />
													</div>
												</c:forEach>
											</div>
										</div>
								    </div>
							  </div>
						</div>
					</section>
					
				</section>
				<section class="info-box white_bg">
					<h2 class="tit_orange">机构环境</h2>
					<div class="img-lists m_lr_cut imgbox">
						<c:forEach  var="item" items="${environmentImgs}">
								<img src="${item.url}" />
						</c:forEach>
						<a href="#" class="button button-big button-orange">我要跟TA学习</a>
					</div>
				</section>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
	<script type="text/javascript">
//	var mySwiper4 = new Swiper('.swiper-container4',{
//  	  	loop: true,
//		autoplay: 3000,
//		pagination: '.swiper-pagination3',
//		paginationClickable :true,
//	});
	</script>
</body>
</html>