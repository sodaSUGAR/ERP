<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>登录</title>
<!--导入LayUI -->
<link href="common/layui/css/layui.css" rel="stylesheet" type="text/css" />
<script src="common/layui/layui.js" type="text/javascript"></script>
<script type="text/javascript" src="common/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="common/js/login.js"></script>
</head>
<body>
	<div style="width: 650px; position: relative; left: 25%;">
		<form class="layui-form" action="" method="post"
			style="margin-top: 20%;">
			<div class="layui-form-item layui-col-md-offset3">
				<h1>超市管理系统</h1>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">用户名:</label>
				<div class="layui-input-block">
					<input type="text" name="userCode" id="userCode"
						style="width: 300px;" required lay-verify="required"
						placeholder="请输入用户名" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<label class="layui-form-label">密码:</label>
				<div class="layui-input-block">
					<input type="password" name="userPwd" id="userPwd"
						style="width: 300px;" required lay-verify="required"
						placeholder="请输入密码" autocomplete="off" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item">
				<div class="layui-input-block">
					<button class="layui-btn layui-col-md-offset1 layui-btn-radius"
						lay-submit lay-filter="login">登录</button>
					<button type="reset"
						class="layui-btn layui-btn-primary layui-btn-radius">重置</button>
				</div>
			</div>
		</form>
	</div>
</body>
</html>