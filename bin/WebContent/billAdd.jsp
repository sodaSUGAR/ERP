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
<script type="text/javascript" src="common/js/billAdd.js"></script>
</head>
<body>
	<!-- 内容主体区域 -->
	<form class="layui-form layui-form-pane" action="" method="post"
		style="margin-top: 50px; padding-left: 150px;"
		style="text-align: center;" lay-filter="boardFilter">
		<input type="hidden" id="uid" value="${userId }" />
		<div class="layui-form-item">
			<label class="layui-form-label">订单编码:</label>
			<div class="layui-input-block">
				<input type="text" style="width: 300px;" name="billCode" required
					lay-verify="required" placeholder="请输入订单编码" autocomplete="off"
					class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">商品描述:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="productDesc" required
					lay-verify="required" placeholder="请输入商品描述" autocomplete="off"
					class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">商品名称:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="productName" required
					lay-verify="required" placeholder="请输入商品名称" autocomplete="off"
					class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">商品单位:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="productUnit" required
					lay-verify="required" placeholder="请输入商品单位" autocomplete="off"
					class="layui-input" />
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">商品数量:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="productCount"
					required lay-verify="required" placeholder="请输入商品数量"
					autocomplete="off" class="layui-input" />
			</div>
		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">商品金额:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="totalPrice" required
					lay-verify="required" placeholder="请输入商品金额" autocomplete="off"
					class="layui-input" />
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">供应商:</label>
			<div class="layui-input-inline"
				style="width: 300px; height: 39px; border-radius: 10px;">
				<select name="providerId">
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
			<label class="layui-form-label">是否支付</label>
			<div class="layui-input-block">
				<input type="radio" name="isPayment" value="2" title="已付款" checked />
				<input type="radio" name="isPayment" value="1" title="未付款" />
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