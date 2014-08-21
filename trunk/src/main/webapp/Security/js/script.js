$(document).ready(function(){

	jQuery.validator.addMethod("checkPsw", function() {
		var re = /^(?!.*[\u4E00-\u9FA5])(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*])\S{6,}$/g;

        if (re.test($('#password').val())) {
            check = true;
        }else {
            check = false;
        }
        return check;
	}, "密碼格式錯誤");
	
	$('#registration-form').validate({
		rules: {
			'model.userAccount': {
				minlength: 6,
				required: true
			},
		  
			'model.userPassword': {
				required: true,
				minlength: 6,
				checkPsw : true 
			},
			
			confirm_password: {
				required: true,
				minlength: 6,
				equalTo: "#password"
			},
		  
			'model.userEmail': {
				required: true,
				email: true
			},
		  
			agree: "required"
		  
	    },
		highlight: function(element) {
			console.log("fail");
			
			$(element).closest('.control-group').removeClass('success').addClass('error');
		},
		success: function(element) {
			console.log("success");
			element
			.text('OK!').addClass('valid')
			.closest('.control-group').removeClass('error').addClass('success');
		}
	});

}); // end document.ready