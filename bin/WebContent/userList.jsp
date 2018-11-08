<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="common/js/jquery-1.12.4.js"></script>
<link href="common/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="common/js/userList.js"></script>
</head>
<body>
	<div class="demoTable " id="demoTable" style="margin: 20px;">
		搜索用户名:
		<div class="layui-inline">
			<input class="layui-input" name="userName" id="demoReload"
				autocomplete="off">
		</div>
		<button class="layui-btn" data-type="reload">搜索</button>
	</div>
	<table class="layui-hide" id="user" lay-filter="user"></table>
	<div id="colstoolbar">
		<i class="layui-icon" lay-event="add">&#xe654;</i> <i
			class="layui-icon" lay-event="edit">&#xe642;</i> <i
			class="layui-icon" style="color: #FF5722" lay-event="del">&#xe640;</i>
	</div>
</html>