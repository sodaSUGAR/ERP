//JavaScript代码区域
		layui.use('table', function() {
			var table = layui.table;
		});
		layui.use('form', function(){
		     var form = layui.form;
		     form.on('submit(formset)',function(data){
		    	 $.ajax({
		    		 url : 'updateUser.do',
		    		 type : 'post',
		    		 data : {
		    			 'userCode' : $("input[name='userCode']").val(),
		    			 'userName' : $("input[name='userName']").val(),
		    			 'phone' : $("input[name='phone']").val(),
		    			 'address' : $("input[name='address']").val(),
		    			 'birthday' : $("input[name='birthday']").val(),
		    			 'gender' : $("input[name='gender']").val(),
		    			 'userRole' : $("select option:selected").val(),
		    			 'id' : $("input[type='hidden']").val()
		    		 },
		    		 dataType : 'text',
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
		
		$(document).ready(function (){
			$("select[name='userRole']").empty();
			$.ajax({
				async : false,
				url : 'getRole.do',
				dataType : 'json',
				data : {},
				type : 'post',
				success : function (data){
					var opt = "<option value='' selected = \'selected\'>-------请选择-------</option>";
					$("select[name='userRole']").append(opt);
					$(data).each(function (){
						var option = "<option value=\""+this.id+"\"";
						option += ">"+this.roleName+"</option>";
						$("select[name='userRole']").append(option);
					})
					 layui.form.render('select','boardFilter');
				}
			})
		})