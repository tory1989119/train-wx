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
	
<style>
	#wrapper {
		Z-INDEX: 1;
		POSITION: absolute;
		WIDTH: 100%;
		BOTTOM: 2.9rem;
		OVERFLOW: auto;
		TOP: 12.2rem;
		LEFT: -9999px;
	}
</style>
</head>
<body>
	<div class="page-group">
		<div class="page page-current">
			<header class="bar bar-nav blue_bg fix-top">
				<a class="btn-back button-link button-nav pull-left back" href="<%=request.getContextPath()%>/main/mainPage.do">
					<span class="icon icon-back"></span>
				</a>
				<h1 class="title white_txt">福利优惠</h1>
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
				<div class="imgbox">
					<img src="<%=request.getContextPath()%>/images/img_29.png" />
				</div>
				<div class="bar-nav">
					<div class="search_bar" >
						<form class="search_outer" data-search="search_bar">
							<div class="search_inner"> 
								<i class="icon_search imgbox">
									<img src="<%=request.getContextPath()%>/images/img_03.png" />
								</i>
								<input type="search" class="search_input" id="courseName" placeholder="搜索" required="">		
							</div>
						</form>
						<a href="javascript:void(0)" class="search_cancel cur" id="search_cancel" onclick="searchVoucher();">搜索</a>
					</div>
				</div>
				<!--热门推荐列表-->
				<div class="list-block media-list m_b_cut">
					<div id="wrapper">
						<div id="scroller">
					      <ul id="vouchers"></ul>
					      <div id=pullUp>
								<span class=pullUpIcon></span><span class=pullUpLabel>上拉查看更多...</span>
						  </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/iscroll.js"></script>
	
	<script type="text/javascript">
	var myScroll, pullDownEl, pullDownOffset, pullUpEl, pullUpOffset,lastpage = 0,finished = false;
	
	function searchVoucher(){
		finished = false;
		lastpage = 0;
		$('#vouchers').html('');
		loadData();
	}
	function loadData()
	{
		if(finished)
			return;
		
		$.ajax({
			url: "<%=request.getContextPath()%>/welfare/queryVoucher.do",
			datatype: 'json',
			type: "post",
			data: {
				begin:lastpage,
				rows:10,
				courseName:$('#courseName').val()
			},
			success: function (data) {
				if (data.flag == '1' && data.errorCode == '10000') {
					$('#voucherCount').html(data.pageCount);
					if(data.content.length > 0){
						$.each(data.content,function(i,vouchers){
							var html = '';
							html = html + '<li>';
							html = html + '<div class="item-content">';
							html = html + '<div class="item-media imgbox">';
							html = html + '<img src="' + vouchers.headimg + '">';
							html = html + '</div>';
							html = html + '<div class="item-inner">';
							html = html + '<div class="item-title-row">';
							html = html + '<div class="item-title icon-vip">' + vouchers.organizationName  + '[' + vouchers.courseName + ']</div>';
							html = html + '</div>';
							html = html + '<div class="item-subtitle">';
							html = html + '<div class="sub_txt s_font">';
							html = html + '<div>福利内容：<span>' + vouchers.content + '</span></div>';
							html = html + '<div>截至日期：<span>' + vouchers.endTime + '</span></div>';
							html = html + '<div>授课地点：<span>' + vouchers.address + '</span></div>';
							html = html + '</div></div></div>';
							html = html + '<div class="item-media2">';
							html = html + '<a class="button button-orange" href="<%=request.getContextPath()%>/welfare/getVoucherInfo.do?id=' + vouchers.id + '&userId=${userId}">点击领取</a>';
							html = html + '</div></div></li>';
							$('#vouchers').append(html);
						});
						lastpage = lastpage + 10;
						myScroll.refresh();
						if(data.pageCount < 10){
							$('#pullUp').hide();
							finished = true;
						}else{
							$('#pullUp').show();
						}
					}else{
						if(data.pageCount == 0){
							$('#vouchers').append('<li align="center"><h4>无数据</h4></li>');
						}
						$('#pullUp').hide();
						finished = true;
					}
				}else{
					
				}
			}
		});
	}

	function pullUpAction() {
		loadData();
	}

	function loaded() {
		pullUpEl = document.getElementById('pullUp');
		pullUpOffset = pullUpEl.offsetHeight;

		myScroll = new iScroll(
				'wrapper',
				{
					useTransition : true,
					onRefresh : function() {
						if (pullUpEl.className.match('loading')) {
							pullUpEl.className = '';
							pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉查看更多...';
						}
					},
					onScrollMove : function() {
						if (this.y < (this.maxScrollY - 5)
								&& !pullUpEl.className.match('flip')) {
							pullUpEl.className = 'flip';
							pullUpEl.querySelector('.pullUpLabel').innerHTML = '松开刷新...';
							this.maxScrollY = this.maxScrollY;
						} else if (this.y > (this.maxScrollY + 5)
								&& pullUpEl.className.match('flip')) {
							pullUpEl.className = '';
							pullUpEl.querySelector('.pullUpLabel').innerHTML = '上拉查看更多...';
							this.maxScrollY = pullUpOffset;
						}
					},
					onScrollEnd : function() {
						if (pullUpEl.className.match('flip')) {
							pullUpEl.className = 'loading';
							pullUpEl.querySelector('.pullUpLabel').innerHTML = '正在加载...';
							pullUpAction(); 
						}
					}
				});

		setTimeout(function() {
			document.getElementById('wrapper').style.left = '0';
		}, 800);
		
		loadData();
	}

	document.addEventListener('touchmove', function(e) {e.preventDefault();}, false);
	document.addEventListener('DOMContentLoaded', function() {setTimeout(loaded, 200);}, false);
</script>
</body>
</html>