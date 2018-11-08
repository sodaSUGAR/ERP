<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/SMBMS/common/layui/layui.js"></script>
<script type="text/javascript" src="/SMBMS/common/js/jquery-1.12.4.js"></script>
<link href="/SMBMS/common/layui/css/layui.css" rel="stylesheet"
	type="text/css" />
</head>
<body>
	<div class="demoTable " id="demoTable" style="margin:20px;">
		搜索商品名称:
		<div class="layui-inline">
			<input class="layui-input" name="productName" id="demoReload"
				autocomplete="off">
		</div>
		<button class="layui-btn" data-type="reload">搜索</button>
	</div>
	<table class="layui-hide" id="bill" lay-filter="bill"></table>
	<div id="colstoolbar">
		<i class="layui-icon" lay-event="add">&#xe654;</i> <i
			class="layui-icon" lay-event="edit">&#xe642;</i> <i
			class="layui-icon" style="color: #FF5722" lay-event="del">&#xe640;</i>
	</div>
	<script type="text/javascript">
		layui.use('table', function() {

			//方法级渲染
			var table = layui.table;
			table.render({
				elem : '#bill',
				url : 'pageBill.do',
				limit : 5,
				limits : [ 5, 10, 15, 20 ],
				count : 500,
				cellMinWidth : 80,
				defaultToolbar : [],
				cols : [ [ {
					field : 'id',
					title : 'ID'
				}, {
					field : 'billCode',
					title : '账单编号'
				}, {
					field : 'productName',
					title : '商品名称'
				}, {
					field : 'totalPrice',
					title : '商品总价'
				}, {
					field : 'productUnit',
					title : '商品单位'
				}, {
					field : 'productCount',
					title : '商品数量'
				}, {
					field : 'productDesc',
					title : '商品描述'
				}, {
					field : 'isPayment',
					title : '是否支付',
					templet : function(d) {
						if (d.isPayment == 1) {
							return '未支付';
						} else {
							return '已支付';
						}
					}
				}, {
					field : 'provider',
					title : '供应商',
					templet : function(d) {
						return d.provider.proName;
					}
				}, {
					field : 'cz',
					title : '操作',
					toolbar : '#colstoolbar'
				} ] ]
			,id: 'testReload'
			,page : true
			,height : 570
			});

			// 监听行工具事件
			table.on('tool(bill)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') {
					layer.confirm('真的删除行么', function(index) {
						$.ajax({
							url : 'dellBill.do',
							data : {
								'id' : data.id
							},
							type : 'post',
							dataType : 'text',
							success : function(data) {
								if (data == "true") {
									layer.msg("删除成功");
								} else {
									layer.msg("删除失败");
								}
							}
						})
						obj.del();
						layer.close(index);
					});
				} else if (obj.event === 'edit') {
					layer.open({
						  type: 2,
						  title : '编辑订单',
						  area: ['700px', '600px'],
						  fixed: false, //不固定
						  maxmin: true,
						  content: "getBillListById.do?id=" + data.id
						});
				} else if (obj.event === 'add') {
					layer.open({
						  type: 2,
						  title : '新增订单',
						  area: ['700px', '600px'],
						  fixed: false, //不固定
						  maxmin: true,
						  content: 'billAdd.jsp'
						});
				}
			});

			 var $ = layui.$, active = {
				reload : function() {
					var proName = $('#demoReload');
					// 执行重载
					table.reload('testReload', {
						page : {
							curr : 1
						// 重新从第 1 页开始
						},
						where : {
							proName : proName.val()
						}
					});
				}
			} 
			 $('.demoTable .layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			}); 

		});
	</script>
</body>
</html>