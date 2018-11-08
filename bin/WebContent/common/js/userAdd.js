layui.use('table', function() {
		var table = layui.table;
	});
	layui.use('form', function(){
	     var form = layui.form;
	     form.on('submit(formDemo)',function(data){
	    	 $.ajax({
	    		 url : 'addUser.do',
	    		 type : 'post',
	    		 data : {
	    			 'userCode' : $("input[name='userCode']").val(),
	    			 'userName' : $("input[name='userName']").val(),
	    			 'userPassword' : $("input[name='userPassword']").val(),
	    			 'phone' : $("input[name='phone']").val(),
	    			 'address' : $("input[name='address']").val(),
	    			 'birthday' : $("input[name='birthday']").val(),
	    			 'gender' : $("input[type='radio']:checked").val(),
	    			 'userRole' : $("select option:selected").val()
	    		 },
	    		 dataType : 'text',
	    		 success : function(data){
	    			 if(data == "true"){
	    				 layer.msg("增加成功");
	    			 } else {
	    				 layer.msg("增加失败");
	    			 }
	    		 }
	    	 })
	    	 return false;
	     })
	});
	
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