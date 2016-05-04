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
				<h1 class="title white_txt">福利领取</h1>
			</header>
			<!--底部菜单 注意要放在content的前面-->
			<nav class="bar bar-tab foot-tabs">
				<a href="<%=request.getContextPath()%>/main/mainPage.do" class="tab-item external">
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
				<a href="<%=request.getContextPath()%>/welfare/welfarePage.do" class="tab-item external active">
					<span class="icon icon-tab4"></span>
					<span class="tab-label">福利优惠</span>
				</a>
			</nav>
			<div class="content native-scroll">
				<!--列表-->
				<div class="list-block media-list m_t_cut">
				      <ul>
				      	<li>
				      		<div class="item-content">
				      			<div class="item-media imgbox">
				      				<img src="${voucherDto.headimg}">
			      				</div>
				      			<div class="item-inner">
				      				<div class="listsbox">
				      					<p class="txt">机构名称：${voucherDto.organizationName}</p>
									<p class="txt">福利内容：${voucherDto.content}</p>
									<p class="txt">活动截止：${voucherDto.endTime}</p>
									<p class="txt">活动地点：${voucherDto.address}</p>
								</div>
				      			</div>
				      		</div>
				      	</li>
				       </ul>
				</div>
				<section class="white_bg bor_gray_tcut bor_gray_bcut m_t_cut">
					<h2 class="tit tit-mar">福利详情</h2>
					<article class="article-box bor_gray_tcut">
						<p class="sub-txt">${voucherDto.introduce}</p>
					</article>
				</section>
				<div class="white_bg t_c  sec_pad_t_b bor_gray_bcut">
					<a href="javascript:void(0)" class="btn-padd orange-btn" onclick="insertVoucherLog(${voucherDto.id})">点击领取</a>
					<p class="orange_txt">将存入家长中心</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
	
	<script type="text/javascript">
	function insertVoucherLog(id){
		$.ajax({
			url: "<%=request.getContextPath()%>/welfare/insertVoucherLog.do",
			datatype: 'json',
			type: "post",
			data: {
				id:id,
				userId:'${userId}'
			},
			success: function (data) {
				if (data.flag == '1' && data.errorCode == '10000') {
					alert('领取成功！');
				}else{
					alert(data.content);
				}
			}
		});
	}
	</script>
</body>
</html>	
