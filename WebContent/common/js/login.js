layui.use('form', function() {
			var form = layui.form;
			//监听提交
			form.on('submit(login)', function(data) {
				var userCode = $("[name='userCode']").val().trim();
				var userPwd = $("[name='userPwd']").val().trim();
				$.ajax({
					url : 'login.do',
					type : 'post',
					data : {
						'userCode' : userCode,
						'userPwd' : userPwd
					},
					dataType : 'text',
					success : function (data){
						if (data == "true") {
							alert("登錄成功");
							location.href = "main.jsp";
						} else {
							layer.msg("密碼或用戶名錯誤");
						}
					}
				})
				return false;//阻止表单跳转
			});
		});