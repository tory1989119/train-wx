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
		TOP: 11.2rem;
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
				<h1 class="title white_txt">家长中心</h1>
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
				<a href="<%=request.getContextPath()%>/person/personPage.do" class="tab-item external active">
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
				<div class="list-block media-list m_t_cut white_bg bor_gray_bcut">
				      <ul class="bor_gray_tcut">
				      	<li>
				      		<div class="item-content">
				      			<div class="item-media imgbox">
				      				<img src="${userDto.headimg}">
			      				</div>
				      			<div class="item-inner">
				      				<div class="listsbox">
				      				<p class="txt">用户名称：${userDto.name}</p>
									<p class="txt">学习年龄：${userDto.childrenAge}岁</p>
									<p class="txt">常住地址：${userDto.address}</p>
								</div>
				      			</div>
				      		</div>
				      	</li>
				       </ul>
				      <div class="list-block-foot">
				      	<span class="tit">优惠券使用说明：</span>
				      	<input type="text" class="ipt" placeholder="仅限本人使用" />
				      </div>
				</div>
				<!--列表-->
				<div class="list-block media-list m_tb_cut white_bg bor_gray_tcut">
					<h2 class="tit tit-mar">已领取优惠券列表(<font id="voucherCount">0</font>)</h2>
					<div id="wrapper">
						<div id="scroller">
						      <ul class="bor_gray_tcut" id="vouchers">
						      	
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
			url: "<%=request.getContextPath()%>/welfare/queryVoucherLog.do",
			datatype: 'json',
			type: "post",
			data: {
				begin:lastpage,
				rows:10,
				userId:'${userDto.id}'
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
							html = html + '<div class="item-title icon-vip">' + vouchers.organizationName + '[' + vouchers.courseName + ']</div>';
							html = html + '</div>';
							html = html + '<div class="item-subtitle">';
							html = html + '<div class="sub_txt s_font">';
							html = html + '<div>福利内容：<span>' + vouchers.content + '</span></div>';
							html = html + '<div>截至日期：<span>' + vouchers.endTime + '</span></div>';
							html = html + '<div>授课地点：<span>' + vouchers.address + '</span></div>';
							html = html + '</div></div></div>';
							html = html + '<div class="item-media2">';
							if(vouchers.status == '0'){
								html = html + '<a href="javascript:void(0)" class="button button-orange" onclick="useVoucher(' + vouchers.id + ')" id="voucher' + vouchers.id + '">点击使用</a>';
							}else{
								html = html + '<a href="javascript:void(0)" class="button button-gray">已经使用</a>';
							}
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
	
	function useVoucher(id){
		$.ajax({
			url: "<%=request.getContextPath()%>/welfare/useVoucher.do",
			datatype: 'json',
			type: "post",
			data: {
				id:id
			},
			success: function (data) {
				if (data.flag == '1' && data.errorCode == '10000') {
					alert('使用成功！');
					$('#voucher' + id).html('已经使用');
					$('#voucher' + id).attr("class", "button button-gray");
					$('#voucher' + id).removeAttr("onclick");
				}else{
					
				}
			}
		});
	}

	document.addEventListener('touchmove', function(e) {e.preventDefault();}, false);
	document.addEventListener('DOMContentLoaded', function() {setTimeout(loaded, 200);}, false);
</script>
</body>
</html>