<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>一个班</title>
	<meta name="viewport" content="initial-scale=1, minimum-scale=1, maximum-scale=1,user-scalable=no,minimal-ui"/>
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/reset.css?1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sm.css?1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/sm-extend.css?1">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/demos.css?1">

<style>
	#wrapper {
		Z-INDEX: 1;
		POSITION: absolute;
		WIDTH: 100%;
		BOTTOM: 2.9rem;
		OVERFLOW: auto;
		TOP: 5.0rem;
		LEFT: -9999px;
	}
</style>
</head>
<body>
	<div class="page-group">
		<div class="page page-current">
			<header class="bar-nav fix-top">
				<div class="search_bar blue_bg" >
					<form class="search_outer" data-search="search_bar">
						<div class="search_inner"> 
							<i class="icon_search imgbox">
								<img src="<%=request.getContextPath()%>/images/img_03.png" />
							</i>
							<input type="search" class="search_input" placeholder="请输入课程名" required="" id="name" value="${courseName}">
							<input type="hidden" id="type" value="${type}">
							<input type="hidden" id="areaCode">
						</div>
					</form>
					<a href="javascript:void(0)" class="search_cancel" id="search_cancel" onclick="searchCourse();">搜索</a>
				</div>
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
				<!--关键字-->
				<div class="keyword-box">
					<ul>
						<li><a  href="javascript:void(0)" class="white-btn" onclick="searchCourse();">按人气</a></li>
						<li><a  href="javascript:void(0)" class="white-btn" data-showmarkbox="selectAdress">按地区</a></li>
					</ul>
				</div>
				<!--列表-->
				<div class="list-block media-list white_bg bor_gray_tcut">
				
					<div id="wrapper">
						<div id="scroller">
						      <ul id="courses">
						      	
						      </ul>
						      <div id=pullUp>
								<span class=pullUpIcon></span><span class=pullUpLabel>上拉查看更多...</span>
							</div>
						</div>
					</div>
					
				</div>
			</div>
		</div>
	</div>
	<!--地区选择弹出层-->
	<div class="markbox" id="markBox" >
          <div class="classesbox" data-showmarkbox="selectAdress">
               <ul class="in_01">
                    <li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('001');">临平街道</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('002');">南苑街道</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('003');">东湖街道</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('004');">星桥街道</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('005');">五常街道</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('006');">乔司镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('007');">运河镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('008');">塘栖镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('009');">崇贤镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('010');">仁和镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('011');">良渚镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('012');">闲林镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('013');">仓前镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('014');">余杭镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('015');">径山镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('016');">瓶窑镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('017');">鸬鸟镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('018');">百丈镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('019');">黄湖镇</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('020');">中泰乡</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('021');">余杭经济开发区</a></li>
					<li class="list"><a href="javascript:void(0)" class="btn_c" onclick="searchByArea('022');">钱江经济开发区塘南办事处</a></li>
               </ul>
          </div>
     </div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/iscroll.js"></script>
	
	<script type="text/javascript">
	var myScroll, pullDownEl, pullDownOffset, pullUpEl, pullUpOffset,lastpage = 0,finished = false;
	
	function searchByArea(areaCode){
		$('#areaCode').val(areaCode);
		searchCourse();
	}
	
	function searchCourse(){
		finished = false;
		lastpage = 0;
		$('#courses').html('');
		loadData();
	}
	function loadData()
	{
		if(finished)
			return;
		
		$.ajax({
			url: "<%=request.getContextPath()%>/course/queryCourses.do",
			datatype: 'json',
			type: "post",
			data: {
				begin:lastpage,
				rows:10,
				name:$('#name').val(),
				type:$('#type').val(),
				areaCode:$('#areaCode').val(),
				
			},
			success: function (data) {
				if (data.flag == '1' && data.errorCode == '10000') {
					if(data.content.length > 0){
						$.each(data.content,function(i,courses){
							var html = '';
							html = html + '<li>';
							html = html + '<div class="item-content" onclick="window.open(\'<%=request.getContextPath()%>/course/coursePage.do?id=' + courses.id  + '\')">';
							html = html + '<div class="item-media imgbox">';
							html = html + '<img style="width: 80px;height: 80px" src="' + courses.headimg + '">';
							html = html + '</div>';
							html = html + '<div class="item-inner">';
							html = html + '<div class="item-title-row">';
							html = html + '<div class="item-title">' + courses.organizationName + '[' + courses.name + ']</div>';
							html = html + '</div>';
							html = html + '<div class="item-subtitle">';
							html = html + '<div class="stars-list">';
							html = html + '<span>' + courses.price + '</span>';
							html = html + '</div>';
							html = html + '<span href="#" class="item-subtitle s_font">' + courses.classTime + '</span>';
							html = html + '</div>';
							html = html + '</div>';
							html = html + '<div class="item-media2">';
							if(courses.voucherId != null && courses.voucherId != ''){
								html = html + '<a href="<%=request.getContextPath()%>/welfare/getVoucherInfo.do?id=' + courses.voucherId + '" class="button button-orange">抢优惠</a>';
							}
							html = html + '</div>';
							html = html + '</div>';
							html = html + '</li>';
							$('#courses').append(html);
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
							$('#courses').append('<li align="center"><h4>无数据</h4></li>');
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
						if (this.y < (this.maxScrollY - 5)&& !pullUpEl.className.match('flip')) {
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