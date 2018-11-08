<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">
<title>订单修改</title>
<script type="text/javascript" src="/SMBMS/common/layui/layui.js"></script>
<script type="text/javascript" src="/SMBMS/common/js/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="/SMBMS/common/layui/css/layui.css">
</head>
<body>
	<!-- 内容主体区域 -->
	<form class="layui-form layui-form-pane" action="" method="post"
		style="margin-top: 50px; padding-left: 150px;"
		style="text-align: center;" lay-filter="boardFilter">

		<div class="layui-form-item">
			<label class="layui-form-label">订单编码:</label>
			<div class="layui-input-block">
				<input type="text" style="width: 300px;" name="billCode" required
					lay-verify="required" placeholder="请输入订单编码" autocomplete="off"
					class="layui-input" value="${bill.billCode }">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">商品描述:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="productDesc" required
					lay-verify="required" placeholder="请输入商品描述" autocomplete="off"
					class="layui-input" value="${bill.productDesc }">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">商品名称:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="productName" required
					lay-verify="required" placeholder="请输入商品名称" autocomplete="off"
					class="layui-input" value="${bill.productName }">
			</div>
		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">商品单位:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="productUnit" required
					lay-verify="required" placeholder="请输入商品单位" autocomplete="off"
					class="layui-input" value="${bill.productUnit }">
			</div>

		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">商品数量:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="productCount"
					required lay-verify="required" placeholder="请输入商品数量"
					autocomplete="off" class="layui-input"
					value="${bill.productCount }">
			</div>

		</div>


		<div class="layui-form-item">
			<label class="layui-form-label">商品金额:</label>
			<div class="layui-input-inline">
				<input type="text" style="width: 300px;" name="totalPrice" required
					lay-verify="required" placeholder="请输入商品金额" autocomplete="off"
					class="layui-input" value="${bill.totalPrice }">
			</div>

		</div>

		<div class="layui-form-item">
			<label class="layui-form-label">供应商:</label>
			<div class="layui-input-inline"
				style="width: 300px; height: 39px; border-radius: 10px;">
				<select id="fulSel" name="providerId" lay-filter="text">
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
				<c:if test="${bill.isPayment == 2 }">
					<input type="radio" name="isPayment" value="2" title="已付款" checked>
					<input type="radio" name="isPayment" value="1" title="未付款">
				</c:if>
				<c:if test="${bill.isPayment == 1 }">
					<input type="radio" name="isPayment" value="2" title="已付款">
					<input type="radio" name="isPayment" value="1" title="未付款" checked>
				</c:if>
			</div>
		</div>

		<div class="layui-form-item">
			<div class="layui-input-block">
				<button class=" layui-btn layui-btn-radius" lay-submit id="data-set"
					type="submit" lay-filter="formset">提交</button>
				<button type="reset" id="back"
					class="layui-btn layui-btn-radius layui-btn-danger">重置</button>
			</div>
		</div>
	</form>
<script>
		//JavaScript代码区域
		layui.use('table', function() {
			var table = layui.table;
		});
		layui.use('form', function(){
		     var form = layui.form;
		     form.on('submit(formset)',function(data){
		    	 $.ajax({
		    		 url : 'updateBill.do',
		    		 dataType : 'text',
		    		 type : 'post',
		    		 data : {
		    			 'billCode' : $("input[name='billCode']").val(),
		    			 'productName' : $("input[name='productName']").val(),
		    			 'productDesc' : $("input[name='productDesc']").val(),
		    			 'productUnit' : $("input[name='productUnit']").val(),
		    			 'productCount' : $("input[name='productCount']").val(),
		    			 'totalPrice' : $("input[name='totalPrice']").val(),
		    			 'providerId' : $("select option:selected").val(),
		    			 'isPayment'  : $("input[type='radio']:checked").val()
		    		 },
		    		 success : function(data){
		    			 if(data == "true"){
		    				 layer.msg("修改成功");
		    			 } else {
		    				 layer.msg("修改失败");
		    			 }
		    		 }
		    	 })
		    	 return false;
		     })
		})
	</script>
	<script type="text/javascript">
		$(document).ready(function (){
			$("select[name='providerId']").empty();
			$.ajax({
				async : true,
				url : 'getProvider.do',
				dataType : 'json',
				data : {},
				type : 'post',
				success : function (data){
					var opt = "<option value='' selected = \'selected\'>-------请选择-------</option>";
					$("select[name='providerId']").append(opt);
					$(data).each(function (){
						var option = "<option value=\""+this.id+"\"";
						option += ">"+this.proName+"</option>";
						$("select[name='providerId']").append(option);
					})
					 layui.form.render('select','boardFilter');
				}
			})
		})
	</script>
</body>
</html>