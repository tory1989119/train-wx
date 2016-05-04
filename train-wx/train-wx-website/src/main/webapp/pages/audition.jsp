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
		TOP: 2.2rem;
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
				<h1 class="title white_txt">我要试听</h1>
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
				<a href="<%=request.getContextPath()%>/audition/auditionPage.do" class="tab-item external active">
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
						
			<div id="wrapper">
				<div id="scroller">
					<div class="content native-scroll" id="auditions"></div>
					<div id=pullUp>
						<span class=pullUpIcon></span><span class=pullUpLabel>上拉查看更多...</span>
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
	
	function loadData()
	{
		if(finished)
			return;
		
		$.ajax({
			url: "<%=request.getContextPath()%>/audition/queryAudition.do",
			datatype: 'json',
			type: "post",
			data: {
				begin:lastpage,
				rows:10
			},
			success: function (data) {
				if (data.flag == '1' && data.errorCode == '10000') {
					if(data.content.length > 0){
						
						$.each(data.content,function(i,auditions){
							
							var html = '';
							html = html + '<div class="imgbox">';
							html = html + '<img src="' + auditions.img + '">';
							html = html + '</div>';
							html = html + '<div class="list-block media-list white_bg m_b_cut">';
							html = html + '<ul class="bor_none"><li><div class="item-content"><div class="item-inner">';
							html = html + '<div class="item-title-row"><div class="item-title icon-vip">' + auditions.organizationName + '</div>';
							html = html + '</div>';
							html = html + '<div class="item-subtitle">';
							html = html + '<div class="sub_txt s_font">';
							html = html + '<div>试听名称：<span>' + auditions.name + '</span></div>';
							html = html + '<div>试听时间：<span>' + auditions.auditionTime + '</span></div>';
							html = html + '<div>试听地址：<span>' + auditions.address + '</span></div>';
							html = html + '<div>参与对象：<span>' + auditions.age + '</span></div>';
							html = html + '</div></div></div><div class="item-media2">';
							html = html + '<a href="tel:' + auditions.telephone + '" class="button button-orange">报名咨询</a></div></div></li></ul></div>';
							$('#auditions').append(html);
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