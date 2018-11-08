<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>订单增加</title>
<link rel="stylesheet" href="common/layui/css/layui.css">
<script type="text/javascript" src="common/layui/layui.js"></script>
<script type="text/javascript" src="common/js/jquery-1.12.4.js"></script>
<script type="text/javascript" src="common/js/userAdd.js"></script>
</head>
<body>
	<!-- 内容主体区域 -->
	<form class="layui-form layui-form-pane" action="" method="post"
		style="margin-top: 50px; padding-left: 150px;"
		style="text-align: center;" lay-filter="boardFilter">
		<input type="hidden" id="uid" value="${userId }" />
		<div class="layui-form-item">
			<label class="layui-form-label">用户编码:</label>
			<div class="layui-input-block">
				<input type="text" style="width: 300px;" name="userCode" required
					lay-verify="required" placeholder="请输入用户编码" autocomplete="off"
					class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">用户名称:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="userName" required
					lay-verify="required" placeholder="请输入用户名称" autocomplete="off"
					class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">用户密码:</label>
			<div class="layui-input-inline">
				<input type="password" style="width: 300px;" name="userPassword"
					required lay-verify="required" placeholder="请输入用户密码"
					autocomplete="off" class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">手机号码:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="phone" required
					lay-verify="required" placeholder="请输入手机号码" autocomplete="off"
					class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">用户地址:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="address" required
					lay-verify="required" placeholder="请输入用户地址" autocomplete="off"
					class="layui-input" />
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">用户生日:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="birthday" required
					lay-verify="required" placeholder="yyyy-MM-dd" autocomplete="off"
					class="layui-input" />
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">性别:</label>
			<div class="layui-input-block">
				<input type="radio" name="gender" value="2" title="女" checked /> <input
					type="radio" name="gender" value="1" title="男" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">用户角色:</label>
			<div class="layui-input-inline"
				style="width: 300px; height: 39px; border-radius: 10px;">
				<select name="userRole">
					<option value="">-------请选择-------</option>
					<option value="1">北京</option>
					<option value="2">上海</option>
					<option value="3">广州</option>
					<option value="4">深圳</option>
					<option value="5">杭州</option>
				</select>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button type="submit" class=" layui-btn layui-btn-radius" lay-submit
					lay-filter="formDemo">提交</button>
				<button type="reset" id="back"
					class="layui-btn layui-btn-radius layui-btn-danger">重置</button>
			</div>
		</div>
	</form>
</body>
</html>