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
				<h1 class="title white_txt">新用户注册</h1>
			</header>
			<div class="content native-scroll">
				<div class="list-block form-inputs">
					<ul>
						<!-- Text inputs -->				
						<li>
							<div class="item-content">
								<div class="item-media icon"> 
									<i class="icon icon-form-phone"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="text" placeholder="请输入手机号码" id="mobilephone">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item-content">
								<div class="item-media icon"> 
									<i class="icon icon-form-name"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="text" placeholder="请输入姓名" id="name">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item-content">
								<div class="item-media icon"> 
									<i class="icon icon-form-childage"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="text" placeholder="请输入孩子姓名" id="childrenName">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item-content">
								<div class="item-media icon"> 
									<i class="icon icon-form-code"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="text" placeholder="请输入孩子年龄" id="childrenAge">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item-content">
								<div class="item-media icon"> 
									<i class="icon icon-form-adress"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="text" placeholder="请输入地址地区" id="address">
									</div>
								</div>
							</div>
						</li>
						<li>
							<div class="item-content">
								<div class="item-media icon"> 
									<i class="icon icon-form-code"></i>
								</div>
								<div class="item-inner">
									<div class="item-input">
										<input type="text" placeholder="请输入就读学校" id="school">
									</div>
								</div>
							</div>
						</li>
					</ul>
				</div>
				<div class="content-block mar_none">
					<p>为了保证您的权益，准确填写资料。</p>
					<p><a href="javascript:void(0)" class="button button-big white-btn" onclick="register();">提交注册 </a></p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.8.3.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/swiper.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/demo.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/layer/layer.js"></script>
	
	<script type="text/javascript">
		function register(){
	 		if($('#mobilephone').val() != ''){
				if(!(/^1\d{10}$/.test($('#mobilephone').val()))){ 
		 			layer.tips('请输入正确的手机号码', '#mobilephone', {
						tipsMore: true,
					    tips: [1, '#3E7FE7']
					}); 
					return false; 
		 		}
	 		}else{
	 			layer.tips('请输入手机号码', '#mobilephone', {
					tipsMore: true,
				    tips: [1, '#3E7FE7']
				}); 
				return false; 
	 		}
			
			if($('#name').val() == ''){ 
	 			layer.tips('请输入名称', '#name', {
					tipsMore: true,
				    tips: [1, '#3E7FE7']
				}); 
				return false; 
	 		}
			
			if($('#childrenName').val() == ''){ 
	 			layer.tips('请输入孩子名称', '#childrenName', {
					tipsMore: true,
				    tips: [1, '#3E7FE7']
				}); 
				return false; 
	 		}
			
			if($('#childrenAge').val() == ''){ 
	 			layer.tips('请输入孩子年龄', '#childrenAge', {
					tipsMore: true,
				    tips: [1, '#3E7FE7']
				}); 
				return false; 
	 		}
			
			if($('#address').val() == ''){ 
	 			layer.tips('请输入地址', '#address', {
					tipsMore: true,
				    tips: [1, '#3E7FE7']
				}); 
				return false; 
	 		}
			
			if($('#school').val() == ''){
	 			layer.tips('请输入学校', '#school', {
					tipsMore: true,
				    tips: [1, '#3E7FE7']
				}); 
				return false; 
	 		}
			
			$.ajax({
				url: "<%=request.getContextPath()%>/main/register.do",
				datatype: 'json',
				type: "post",
				data: {
					mobilephone:$('#mobilephone').val(),
					name:$('#name').val(),
					childrenName:$('#childrenName').val(),
					childrenAge:$('#childrenAge').val(),
					address:$('#address').val(),
					school:$('#school').val(),
					openid:'${openid}'
				},
				success: function (data) {
					if (data.flag == '1' && data.errorCode == '10000') {
						alert('注册成功！');
						if('${type}' == '0'){
							window.location.href='<%=request.getContextPath()%>/person/personPage.do';
						}else if('${type}' == '1'){
							window.location.href='<%=request.getContextPath()%>/welfare/welfarePage.do';
						}else{
							window.location.href='<%=request.getContextPath()%>/main/mainPage.do';
						}
					}else{
						alert(data.content);
					}
				}
			});
		}
	
	</script>
</body>
</html>