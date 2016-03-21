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
			<header class="bar-nav fix-top">
				<div class="search_bar blue_bg" >
					<div class="search_outer" data-search="search_bar">
						<div class="search_inner"> 
							<i class="icon_search imgbox">
								<img src="<%=request.getContextPath()%>/images/img_03.png" />
							</i>
							<input type="text" class="search_input" id="search_input" placeholder="请输入课程名" required="">	
						</div>
					</div>
					<a href="javascript:" class="search_cancel" id="search_cancel">搜索</a>
				</div>
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
				<section class="imgbox">
					<div class="swiper-container">
						  <div class="swiper-wrapper">
						  		<c:forEach  var="item" items="${banners}">
							  		<div class="swiper-slide blue-slide">
								    	<a href="${item.linkUrl}"><img src="${item.pictureUrl}"></a>
								    </div>
						  		</c:forEach>
						  </div>
						  <!-- 如果需要分页器 -->
						  <div class="swiper-pagination"></div>
					</div>
				</section>
				<!--8个icon入口-->
				<section class="white_bg m_t_cut bor_gray_tbcut">
					<div class="swiper-container2 hidden">
						  <div class="swiper-wrapper">
							    <div class="swiper-slide blue-slide">
							    	<section class="icons_enter_box">
									<ul>
										<li class="list">
											<a href="index2.html">
												<span class="iconbox">
													<img src="<%=request.getContextPath()%>/images/img_10.png" />
												</span>
												<span class="dis">综合</span>
											</a>
										</li>
										<li class="list">
											<a href="#">
												<span class="iconbox">
													<img src="<%=request.getContextPath()%>/images/img_12.png" />
												</span>
												<span class="dis">学科</span>
											</a>
										</li>
										<li class="list">
											<a href="#">
												<span class="iconbox">
													<img src="<%=request.getContextPath()%>/images/img_14.png" />
												</span>
												<span class="dis">舞蹈</span>
											</a>
										</li>
										<li class="list">
											<a href="#">
												<span class="iconbox">
													<img src="<%=request.getContextPath()%>/images/img_16.png" />
												</span>
												<span class="dis">字画</span>
											</a>
										</li>
										<li class="list">
											<a href="#">
												<span class="iconbox">
													<img src="<%=request.getContextPath()%>/images/img_22.png" />
												</span>
												<span class="dis">音乐</span>
											</a>
										</li>
										<li class="list">
											<a href="#">
												<span class="iconbox">
													<img src="<%=request.getContextPath()%>/images/img_23.png" />
												</span>
												<span class="dis">运动</span>
											</a>
										</li>
										<li class="list">
											<a href="#">
												<span class="iconbox">
													<img src="<%=request.getContextPath()%>/images/img_24.png" />
												</span>
												<span class="dis">语言</span>
											</a>
										</li>
										<li class="list">
											<a href="#">
												<span class="iconbox">
													<img src="<%=request.getContextPath()%>/images/img_25.png" />
												</span>
												<span class="dis">婴幼</span>
											</a>
										</li>
									</ul>
								</section>
							    </div>
						  </div>
					</div>
				</section>
				<!--热门推荐列表-->
				<div class="list-block media-list m_t_cut white_bg bor_gray_tcut">
					<h2 class="tit tit-mar">热门推荐</h2>
				      <ul class="bor_gray_tcut">
				      	<c:forEach  var="item" items="${hotCourse0}">
				      		<li>
					      		<div class="item-content">
					      			<div class="item-media imgbox">
					      				<img src="${item.url}" onclick="window.open('<%=request.getContextPath()%>/organization/organizationPage.do?id=' + ${item.organizationId})">
				      				</div>
					      			<div class="item-inner">
					      				<div class="item-title-row">
					      					<div class="item-title icon-vip"><a href="<%=request.getContextPath()%>/organization/organizationPage.do?id=${item.organizationId}">${item.organizationName}</a></div>
					      				</div>
					      				<div class="item-subtitle">
					      					<div class="stars-list c_f">
					      						<a href="javascript:void(0)" class="on"></a>
					      						<a href="javascript:void(0)" class="on"></a>
					      						<a href="javascript:void(0)" class="on"></a>
					      						<a href="javascript:void(0)" class="on"></a>
					      						<a href="javascript:void(0)" class="on"></a>
					      						<span>${item.price}元/课时</span>
					      					</div>
					      					<span class="item-subtitle dis">${item.courseName}</span>
				      					</div>
					      			</div>
					      			<div class="item-media2 user-nums">
					      				<a href="javascript:void(0)" class="icon-view" data-addnum>${item.readNum}</a>
					      				<a href="javascript:void(0)" class="icon-zan" data-addnum>${item.likeNum}</a>
				      				</div>
					      		</div>
				      		</li>
				      	</c:forEach>
				      </ul>
				</div>
				<!--比一比输入框-->
				<div class="searchbar row mysearchar2">
					<div class="search-input col-75">
						<label class="icon icon-search" for="search"></label>
						<input type="search" id="search" placeholder="请输入感兴趣的课程"></div>
					<a class="btn-icon-add col-25">找一找</a>
				</div>
				<!--图文两张并列列表-->
				<div class="grid-demo img-txt-lists2 white_bg bor_gray_tcut bor_gray_bcut">
					<div class="row no-gutter">
					        <div class="col-50">
					        	<div class="ins-col-80 imgbox bor">
					        		<a href="index9.html"><img src="<%=request.getContextPath()%>/images/pic_09.png" class="img" /></a>
					        		<h3 class="gray-tit">全外教英语口语初级</h3>
					        		<ul class="listsbox m_b_cut">
					        			<li><i></i>费用：120元/课时</li>
					        			<li><i></i>课时：102节/学期</li>
					        			<li><i></i>优惠：送1课时</li>
					        			<li><i></i>师资：国家级</li>
					        			<li><i></i>特色：3-10岁</li>
					        		</ul>
					        		<a href="tel:12312341234" class="btn-padd orange-btn">试听报名</a>
					        	</div>
					        </div>
					        <div class="col-50">
					        	<div class="ins-col-80 imgbox bor">
					        		<a href="index9.html"><img src="<%=request.getContextPath()%>/images/pic_10.png" class="img" /></a>
					        		<h3 class="gray-tit">全外教英语口语初级</h3>
					        		<ul class="listsbox m_b_cut">
					        			<li><i></i>费用：120元/课时</li>
					        			<li><i></i>课时：102节/学期</li>
					        			<li><i></i>优惠：送1课时</li>
					        			<li><i></i>师资：国家级</li>
					        			<li><i></i>特色：3-10岁</li>
					        		</ul>
					        		<a href="tel:12312341234" class="btn-padd orange-btn">试听报名</a>
					        	</div>
					        </div>
					</div>
				</div>
				<div class="noticebox">
					<div class="txt orange_txt" id="scrollobj">专家建议：凉爽的午后，泡一杯浓浓的咖啡，慵懒地窝在阳台上的靠椅里。</div>
				</div>
				<div class="imgbox m_b_cut">
					<a href="${banner.linkUrl}"><img src="${banner.pictureUrl}" /></a>
				</div>
				<!--三列并列列表-->
				<div class="white_bg bor_gray_tbcut">
					<h2 class="tit tit-mar">推荐课程</h2>
					<section class="">
						<div class="swiper-container3 hidden">
							  <div class="swiper-wrapper">
								    <div class="swiper-slide blue-slide">
									    <div class="img-lists-col3 cansel_scrollbar">
											<div class="ins ">
												<c:forEach  var="item" items="${hotCourse1}">
													<div class="item imgbox bor">
														<a href="<%=request.getContextPath()%>/course/coursePage.do?id=${item.courseId}"><img src="${item.url}"></a>
													</div>
												</c:forEach>
											</div>
										</div>
								    </div>
							  </div>
						</div>
					</section>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
	<script type="text/javascript">
  	var mySwiper = new Swiper('.swiper-container',{
  	  loop: true,
		autoplay: 3000,
		pagination: '.swiper-pagination',
		paginationClickable :true,
	});
//	var mySwiper2 = new Swiper('.swiper-container2',{
//  	  loop: true,
//		autoplay: 3500,
//		pagination: '.swiper-pagination2',
//		paginationClickable :true,
//	});
//	var mySwiper3 = new Swiper('.swiper-container3',{
//  	  loop: true,
//		autoplay: 3000,
//		pagination: '.swiper-pagination3',
//		paginationClickable :true,
//	});
	//公告滚动
	function scroll(obj) {
		var tmp = (obj.scrollLeft)++;
		//当滚动条到达右边顶端时
		if (obj.scrollLeft==tmp) obj.innerHTML += obj.innerHTML; 
		//当滚动条滚动了初始内容的宽度时滚动条回到最左端
		if (obj.scrollLeft>=obj.firstChild.offsetWidth) obj.scrollLeft=0;
	}
	setInterval("scroll(document.getElementById('scrollobj'))",20); 
	</script>
</body>
</html>