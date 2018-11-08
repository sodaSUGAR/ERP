layui.use('table', function() {

			//方法级渲染
			var table = layui.table;
			table.render({
				elem : '#user',
				url : 'pageUser.do',
				limit : 5,
				limits : [ 5, 10, 15, 20 ],
				count : 500,
				cellMinWidth : 80,
				defaultToolbar : [],
				cols : [ [ {
					field : 'id',
					title : 'ID'
				}, {
					field : 'userCode',
					title : '用户编号'
				}, {
					field : 'userName',
					title : '用户名称'
				}, {
					field : 'phone',
					title : '手机号码'
				}, {
					field : 'address',
					title : '用户地址'
				}, {
					field : 'birthday',
					title : '用户生日'
				}, {
					field : 'gender',
					title : '性别',
					templet : function(d) {
						if (d.gender == 1) {
							return '男';
						} else {
							return '女';
						}
					}
				}, {
					field : 'userRole',
					title : '用户角色',
					templet : function(d) {
						if (d.userRole == 1) {
							return '系统管理员';
						} else if (d.userRole == 2) {
							return '经理';
						} else {
							return '普通员工';
						}
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
			table.on('tool(user)', function(obj) {
				var data = obj.data;
				if (obj.event === 'del') {
					layer.confirm('真的删除行么', function(index) {
						$.ajax({
							url : 'delUser.do',
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
						  content: "getUserListById.do?id=" + data.id
						});
				} else if (obj.event === 'add') {
					layer.open({
						  type: 2,
						  title : '新增订单',
						  area: ['700px', '600px'],
						  fixed: false, //不固定
						  maxmin: true,
						  content: 'userAdd.jsp'
						});
				}
			});

			 var $ = layui.$, active = {
				reload : function() {
					var userName = $('#demoReload');
					// 执行重载
					table.reload('testReload', {
						page : {
							curr : 1
						// 重新从第 1 页开始
						},
						where : {
							userName : userName.val()
						}
					});
				}
			} 
			 $('.demoTable .layui-btn').on('click', function() {
				var type = $(this).data('type');
				active[type] ? active[type].call(this) : '';
			}); 

		});