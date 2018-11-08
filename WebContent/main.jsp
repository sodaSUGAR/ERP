<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>主页面</title>
<link rel="stylesheet" href="common/layui/css/layui.css">
<script src="common/layui/layui.js"></script>
</head>
<body class="layui-layout-body">
	<div class="layui-layout layui-layout-admin">
		<div class="layui-header">
			<div class="layui-logo" style="font-size: 20px; color: #00F7DE">超市订单管理系统</div>
			<!-- 头部区域（可配合layui已有的水平导航） -->
			<ul class="layui-nav layui-layout-left">
				<li class="layui-nav-item"><a href="userList.jsp" target="main">用户管理</a></li>
				<li class="layui-nav-item"><a href="product.html" target="main">供应商管理</a></li>
				<li class="layui-nav-item"><a
					href="bill.jsp?userId=${user.id }" target="main">订单管理</a></li>
				<li class="layui-nav-item"><a href="javascript:;">其它系统</a>
					<dl class="layui-nav-child">
						<dd>
							<a href="">邮件管理</a>
						</dd>
						<dd>
							<a href="">消息管理</a>
						</dd>
						<dd>
							<a href="">授权管理</a>
						</dd>
					</dl></li>
			</ul>
			<ul class="layui-nav layui-layout-right">
				<li class="layui-nav-item"><i href="javascript:;"
					class="layui-icon layui-icon-set-sm"> ${user.userName} </i>
					<dl class="layui-nav-child">
						<dd>
							<a href="">基本资料</a>
						</dd>
						<dd>
							<a href="">安全设置</a>
						</dd>
					</dl></li>
				<li class="layui-nav-item"><a href="">退出</a></li>
			</ul>
		</div>

		<div class="layui-side layui-bg-black">
			<div class="layui-side-scroll">
				<!-- 左侧导航区域（可配合layui已有的垂直导航） -->
				<ul class="layui-nav layui-nav-tree" lay-filter="test">
					<li class="layui-nav-item layui-nav-itemed"><a class=""
						href="userList.jsp" target="main">用户管理</a></li>
					<li class="layui-nav-item"><a href="product.html"
						target="main">供应商管理</a></li>
					<li class="layui-nav-item"><a
						href="bill.jsp?userId=${user.id }" target="main">订单管理</a></li>
					<li class="layui-nav-item"><a href="javascript:;">退出系统</a></li>
					<li class="layui-nav-item" style="height: 30px; text-align: center"></li>
				</ul>
			</div>
		</div>

		<div class="layui-body">
			<iframe name="main" width="100%" height="100%" scrolling="no"
				frameborder="0"> </iframe>
		</div>

		<div class="layui-footer">
			<!-- 底部固定区域 -->
			© 版权所属
		</div>
	</div>
	<script>
		//JavaScript代码区域
		layui.use('element', function() {
			var element = layui.element;
		});
	</script>
</body>
</html>