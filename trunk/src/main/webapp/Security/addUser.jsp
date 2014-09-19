<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add User</title>
<link rel="stylesheet" href="<c:url value="/Security/css/creatAccount-style.css"/>">
<link href="<c:url value="/Security/css/style.css"/>" rel="stylesheet">
<script src="<c:url value='/js/jquery.validate.min.js'/>"></script> 
</head>
	
	
<body>
	<div class="createaccount-body">
		<div class="sing-up">
			<form class="form-horizontal" id="registration-form" action="<c:url value='/addAccount'/>">
				<div class="form-group">
					<label class="input-label" for="username">
						<strong>帳號</strong>
					</label>
					<input class="input-sm" name="model.userAccount" id="username" type="text">
				</div>
				<!--<span class="error"><s:property value="fieldErrors.username"/></span>-->
				<div class="form-group">
					<label for="password">
						<strong>密碼</strong><br>
					</label>
					<input class="input-sm" name="userPassword" id="password" type="password">
				</div>
				<span class="error"><s:property value="fieldErrors.password"/></span>
				<div class="form-group">
					<label for="confirm_password">
						<strong>確認密碼</strong><br>
					</label>
					<input class="input-sm" name="confirm_password" id="confirm_password" type="password">
				</div>
				<div class="form-group">
					<label id="label-account">
						<strong>姓名</strong><br>
					</label>
					<input class="input-sm" name="model.userName" type="text">
				</div>
				<div class="form-group">
					<label id="" for="email">
						<strong>E-mail</strong><br>
						<input class="input-sm" name="model.userEmail" id="email" type="text">
					</label>
				</div>
				<span class="error"><s:property value="fieldErrors.email"/></span>
				
				<div class="form-group">
					<label id="">
						<strong>電話</strong><br>
					</label>
					<input class="input-sm" name="model.userPhone" type="text">
				</div>
				
				<div class="form-group">
					<label id="">
						<strong>
							<span>男</span><input type="radio" name="model.userGender" value="男">
							<span>女</span><input type="radio" name="model.userGender" value="女">
						</strong>
					</label><br>
				</div>
				
				<div class="form-group">
					<label id="">
						<strong>生日</strong><br>
						<input class="input-sm" name="model.userBirthday" id="birth" type="text">
					</label><br>
				</div>
				<button type="submit" class="btn btn-success">註冊</button>
				<button type="reset" class="btn btn-info">清除</button>
				<span class="error"><s:property value="fieldErrors.other"/></span>
				
			</form>
		</div>
	</div>
	
	
	
	<script>
		(function($){
			//帳號重複與驗證
			jQuery.validator.addMethod("alnum", function(value, element) {
  				return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
  	 		}, "只能包括英文字母和数字");
			jQuery.validator.addMethod("checkAccount", function() {
		    	$.ajax({
		    		url:"<c:url value='/checkAccount'/>",
					type:"get",
					data:{
						'model.userAccount': $('#username').val()
					},
					success: function(data) {
						if(data=="success") {
							checeAccount = true;	
						}else {
							checeAccount = false;	
						}
					}
				});
		        return checeAccount;
			}, "帳號重複!");
			
			//驗證Email
			jQuery.validator.addMethod("checkEmail", function() {
		    	$.ajax({
		    		url:"<c:url value='/checkEmail'/>",
					type:"get",
					data:{
						'model.userEmail': $('#email').val()
					},
					success: function(data) {
						if(data=="success") {
							checeEmail = true;	
						}else {
							checeEmail = false;	
						}
					}
				});
		        return checeEmail;
			}, "Email已使用過");
			
			//密碼規則驗證
			jQuery.validator.addMethod("alnumpwd", function(value, element) {
  				return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
  	 		}, "只能包括英文字母和数字");
			jQuery.validator.addMethod("checkPsw1", function() {
				var re1 = /^(?!.*[\u4E00-\u9FA5])(?=.*[0-9])\S{6,}$/g;
		        if (re1.test($('#password').val())) {
		            checkPsw1 = true;
		        }else {
		        	checkPsw1 = false;
		        }
		        return checkPsw1;
			}, "須包含數字");
			jQuery.validator.addMethod("checkPsw2", function() {
				var re2 = /^(?!.*[\u4E00-\u9FA5])(?=.*[a-zA-Z])\S{6,}$/g;
		        if (re2.test($('#password').val())) {
		            checkPsw2 = true;
		        }else {
		        	checkPsw2 = false;
		        }
		        return checkPsw2;
			}, "須包含英文");
			
			$('#registration-form').validate({
				rules: {
					'model.userAccount': {
						minlength: 6,
						required: true,
						checkAccount: true,
						alnum: true
					},
				  
					userPassword: {
						required: true,
						minlength: 6,
						checkPsw1 : true,
						checkPsw2 : true, 
						alnumpwd: true
					},
					
					confirm_password: {
						required: true,
						minlength: 6,
						equalTo: "#password"
					},
				  
					'model.userEmail': {
						required: true,
						email: true,
						checkEmail: true
					},
				  
					'model.userBirthday': {
						dateISO:true
					},
					
					'model.userName': {
						required: true
					}
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
			
			
			
		})(jQuery);
	</script>
	
	
</body>
</html>