<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>微信管理后台</title>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/rightCommon.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
	<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" />
	
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/layer/layer.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/plugin/jqPaginator/jqPaginator.js"></script>
</head>
<body>
<div class="mainSemt">
	<div class="navigateItem pl20">
		公众号管理>客服管理
	</div>
	<div class="search">
		<ul class="mb20 overflow">
			<li>
				<span class="btnSearch whitefc f14 mt5 clearfix cursor" onclick="add();">
					新增
				</span>
			</li>
			<li>
				<span class="btnSearch whitefc f14 mt5 clearfix cursor" onclick="syncWxKf();">
					同步客服
				</span>
			</li>
		</ul>
	</div>
	<div class="rightMain tc p10">
		<table width="100%">
			<tr>
				<td>客服昵称</td>
				<td>客服账号</td>
				<td>操作</td>
			</tr>
			<tbody id="tbodyId">
				<tr >
					<td colspan="3">无数据</td>
				</tr>
            </tbody>
		</table>
		<div class="page tc f14 mt20 customBootstrap" id="pageId" style="display:none">
			<div class="fl">共<span class="bluefc" id="showPageCount"></span>页记录</div><ul class="pagination" id="paginationId"></ul>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	//定义查询选择框
	$.jqPaginator('#paginationId', {
        totalPages: 1,
        currentPage: 1,
        first:'首页',
        first: '<li class="first"><a href="javascript:void(0);">首页<\/a><\/li>',
        prev: '<li class="prev"><a href="javascript:void(0);">上一页<\/a><\/li>',
        next: '<li class="next"><a href="javascript:void(0);">下一页<\/a><\/li>',
        last: '<li class="last"><a href="javascript:void(0);">末页<\/a><\/li>',
        page: '<li class="page"><a href="javascript:void(0);">{{page}}<\/a><\/li>',
        onPageChange: function (num, type) {
        	search(num);
        }
    });
})

var pageSize = 10;

//查询 刷新当前页数pageNum
function search(pageNum){
	layer.load(2);//遮罩层
	$.ajax({
	      url: "<%=request.getContextPath()%>/bus/kf/queryWxKf.do",
	      datatype: 'json',
	      type: "post",
	      data: {
	    	  begin:(pageNum-1)*pageSize,
	    	  rows:pageSize
	    	  },
	      success: function (data) {
	    	  layer.closeAll('loading');
	        if (data.flag == '1' && data.errorCode == '10000') {
	        	table(data,pageNum);//显示列表
	        }else{
	        	layer.alert(data.content, {icon: 6});
	        }
	      }
	    });
}

//列表显示内容
function table(data,pageNum){
	if(data.content == null || data.content.length <= 0){
		$("#tbodyId").html('<tr ><td colspan="3">无数据</td></tr>');
		$('#pageId').css('display','none');
		return;
	}else{
		$('#pageId').css('display','block');
	}
	
	//计算页数
    if(data.pageCount%10 > 0){
  	  var pageCount = (data.pageCount - data.pageCount%10)/10 + 1; 
    }else{
  	  var pageCount = data.pageCount/10; 
    }
    
    $('#paginationId').jqPaginator('option', {
    	currentPage: pageNum, //当前页数
        totalPages: pageCount //总页数
    });

    $("#showPageCount").html(pageCount);//按时一共查询出几页
	
	var str = '';
	for (var i = 0; i < data.content.length; i++) {
		str = str + '<tr>';
		str = str + '<td>' + data.content[i].nickname + '</td>';
		str = str + '<td>' + data.content[i].kfAccount + '</td>';
		str = str + '<td><a href="javascript:void(0)" onclick="modify(\'' + data.content[i].id + '\')">修改</a> <a href="javascript:void(0)" onclick="dele(\'' + data.content[i].id + '\',\'' + data.content[i].kfAccount + '\')">删除</a></td>';
		str = str + '</tr>';
    }
	$("#tbodyId").html(str);
}
/**
 * 新增
 */
function add(){
	//iframe层-父子操作
	var index = layer.open({
	    type: 2,
	    area: ['900px', '500px'],
	    fix: false, //不固定
	    maxmin: true,
	    content: '<%=request.getContextPath()%>/bus/kf/addWxKfPage.do'
	});
	layer.full(index);
}
/**
 * 修改
 */
function modify(id){
	//iframe层-父子操作
	var index = layer.open({
	    type: 2,
	    area: ['900px', '500px'],
	    fix: false, //不固定
	    maxmin: true,
	    content: '<%=request.getContextPath()%>/bus/kf/modifyWxKfPage.do?id='+id
	});
	layer.full(index);
}
/**
 * 删除
 */
function dele(id,kfAccount){
	layer.confirm('确定删除该分组？',{
		btn: ['确定','取消']
	},function(){
		$.ajax({
			url: "<%=request.getContextPath()%>/bus/kf/deleteWxKf.do",
			datatype: 'json',
			type: "post",
			data: {
				id:id,
				kfAccount:kfAccount
			},
			success: function (data) {
				if (data.flag == '1' && data.errorCode == '10000') {
					layer.alert('删除成功！', {
						icon: 6
					},function(index){
						search(parseInt($('.active').attr('jp-data')));
						layer.close(index);
					});
				}else{
					layer.alert(data.content, {icon: 6});
				}
			}
		});
	});
}
/**
 * 同步分组
 */
function syncWxKf(){
	layer.load(2);//遮罩层
	$.ajax({
	      url: "<%=request.getContextPath()%>/bus/kf/syncWxKf.do",
	      datatype: 'json',
	      type: "post",
	      data: {},
	      success: function (data) {
	    	  layer.closeAll('loading');
	        if (data.flag == '1' && data.errorCode == '10000') {
	        	layer.alert("同步成功", {icon: 6});
	        	search(1);
	        }else{
	        	layer.alert(data.content, {icon: 6});
	        }
	      }
	    });
}
</script>
</body>
</html>