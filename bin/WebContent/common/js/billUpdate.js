	//JavaScript代码区域
		layui.use('table', function() {
			var table = layui.table;
		});
		layui.use('form', function(){
		     var form = layui.form;
		     form.on('submit(formset)',function(data){
		    	 $.ajax({
		    		 url : 'updateBill.do',
		    		 type : 'post',
		    		 data : {
		    			 'billCode' : $("input[name='billCode']").val(),
		    			 'productName' : $("input[name='productName']").val(),
		    			 'productDesc' : $("input[name='productDesc']").val(),
		    			 'productUnit' : $("input[name='productUnit']").val(),
		    			 'productCount' : $("input[name='productCount']").val(),
		    			 'totalPrice' : $("input[name='totalPrice']").val(),
		    			 'isPayment'  : $("input[type='radio']:checked").val(),
		    			 'providerId' : $("select option:selected").val(),
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
			$("select[name='providerId']").empty();
			$.ajax({
				async : false,
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