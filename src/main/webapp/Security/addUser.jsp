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
</head>
	
	<script src="<c:url value="/Security/js/jquery-1.7.1.min.js"/>"></script>
	<script src="<c:url value="/Security/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value='/Security/js/button.js'/>"></script> 
	<script src="<c:url value='/Security/js/jquery.validate.min.js'/>"></script> 
	
<body>
	<div class="createaccount-body">
		<div class="sing-up">
			<form class="form-horizontal" id="registration-form" action="<c:url value='/addAccount'/>">
				<label class="input-label">
					<strong>帳號</strong>
					<input class="input-xlarge" name="model.userAccount" id="username" type="text">
				</label>
				<span class="error"><s:property value="fieldErrors.username"/></span>
				
				<label>
					<strong>密碼</strong><br>
					<input class="input-xlarge" name="model.userPassword" id="password" type="password">
				</label>
				<span class="error"><s:property value="fieldErrors.password"/></span>
				
				<label>
					<strong>確認密碼</strong><br>
					<input class="input-xlarge" name="confirm_password" id="confirm_password" type="password">
				</label>
				
				<label id="label-account">
					<strong>姓名</strong><br>
					<input class="input-xlarge" name="model.userName" type="text">
				</label>
				
				<label id="label-account">
					<strong>E-mail</strong><br>
					<input class="input-xlarge" name="model.userEmail" type="text">
				</label>
				<span class="error"><s:property value="fieldErrors.email"/></span>
				
				<label id="label-account">
					<strong>電話</strong><br>
					<input class="input-xlarge" name="model.userPhone" type="text">
				</label>
				
				<label id="label-account">
					<strong>
						<span>男</span><input type="radio" name="model.userGender" value="男">
						<span>女</span><input type="radio" name="model.userGender" value="女">
					</strong>
				</label><br>
				
				<label id="label-account">
					<strong>生日</strong><br>
					<input class="input-xlarge" name="model.userBirthday" id="birth" type="text">
				</label><br>
				
				<button type="submit" class="btn btn-success">註冊</button>
				<button type="reset" class="btn btn-info">清除</button>
				<span class="error"><s:property value="fieldErrors.other"/></span>
				
			</form>
		</div>
	</div>
	
	
	
	<script>
		(function($){
			//帳號重複驗證
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
						console.log(data);
						if(data=="fail") {
							checeAccount = false;	
						}else {
							checeAccount = true;	
						}
					}
				});
		        return checeAccount;
			}, "Repeat Account");
			
			//密碼規則驗證
			jQuery.validator.addMethod("alnumpwd", function(value, element) {
  				return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
  	 		}, "只能包括英文字母和数字");
			jQuery.validator.addMethod("checkPswA", function() {
				var re = /^(?!.*[\u4E00-\u9FA5])(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*])\S{6,}$/g;
		        if (re.test($('#password').val())) {
		            checkPsw = true;
		        }else {
		        	checkPsw = false;
		        }
		        return checkPsw;
			}, "Non-compliance");
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
				  
					'model.userPassword': {
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
						email: true
					},
				  
					'model.userBirthday': {
						dateISO:true
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