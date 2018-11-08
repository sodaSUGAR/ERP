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