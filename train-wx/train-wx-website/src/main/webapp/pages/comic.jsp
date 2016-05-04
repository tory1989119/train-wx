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
		TOP: 2.0rem;
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
				<h1 class="title white_txt">原创动漫</h1>
			</header>
			<div class="content native-scroll">
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
			url: "<%=request.getContextPath()%>/comic/queryWxMetarialForComic.do",
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
						$.each(data.content,function(i,comics){
							var html = '';
							html = html + '<li>';
							html = html + '<div class="item-content" onclick="window.open(\'' + comics.url + '\')">';
							html = html + '<div class="item-media imgbox">';
							html = html + '<img style="width: 80px;height: 80px" src="' + comics.thumbUrl + '" data-src="' + comics.thumbUrl + '"></img>';
							html = html + '</div>';
							html = html + '<div class="item-inner">';
							html = html + '<div class="item-title-row">';
							html = html + '<div class="item-title">' + comics.title + '</div>';
							html = html + '</div>';
							html = html + '<div class="item-subtitle">';
							html = html + '<div class="stars-list">';
							html = html + '</div>';
							html = html + '</div>';
							html = html + '</div>';
							html = html + '<div class="item-media2">';
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