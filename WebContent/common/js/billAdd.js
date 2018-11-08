layui.use('table', function() {
		var table = layui.table;
	});
	layui.use('form', function(){
	     var form = layui.form;
	     form.on('submit(formDemo)',function(data){
	    	 $.ajax({
	    		 url : 'addBill.do',
	    		 type : 'post',
	    		 data : {
	    			 'billCode' : $("input[name='billCode']").val(),
	    			 'productName' : $("input[name='productName']").val(),
	    			 'productDesc' : $("input[name='productDesc']").val(),
	    			 'productUnit' : $("input[name='productUnit']").val(),
	    			 'productCount' : $("input[name='productCount']").val(),
	    			 'totalPrice' : $("input[name='totalPrice']").val(),
	    			 'isPayment'  : $("input[type='radio']:checked").val(),
	    			 'providerId' : $("select option:selected").val()
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