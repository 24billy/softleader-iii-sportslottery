<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<link href="Security/css/style.css" rel="stylesheet">
<style>
.non-user-input {
	display:none;
}
#update-meseeage {
	color:green;
}
.update-div {
	float:right;
	display:none;
}
</style>
<body>

	<div class="update-div">
		<form id="update-form" action="<c:url value='/userUpdate'/>">
			<input class="non-user-input" type="radio" name="model.userGender" value="${user.userGender}" >
			<input class="non-user-input" type="text" name="model.userAccount" value="${user.userAccount}">
			<label>
				<strong>修改密碼</strong><br>
				<input class="input-xlarge" id="password" class="input-xlarge" name="model.userPassword" type="password" value="${user.userPassword}">
			</label><br>
			
			<label>
				<strong>確認密碼</strong><br>
				<input class="input-xlarge" class="input-xlarge" name="confirm_password" type="password" value="${user.userPassword}">
			</label><br>
			
			<label>
				<strong>姓名</strong><br>
				<input class="input-xlarge" name="model.userName" type="text" value="${user.userName}" />
			</label><br>
			
			<label>
				<strong>電話</strong><br>
				<input class="input-xlarge" name="model.userPhone" type="text" value="${user.userPhone}" />
			</label><br>
			
			<label>
				<strong>生日</strong><br>
				<input class="input-xlarge" name="model.userBirthday" type="text" value="${user.userBirthday}" />
			</label><br>
			
			<label>
				<strong>E-mail</strong><br>
				<input class="input-xlarge" name="model.userEmail" type="text" value="${user.userEmail}" />
			</label><br>
			<button type="submit">儲存</button>
		</form>
		
		<form id="update-form" action="<c:url value='/goIndex'/>">
			<button type="submit">取消變更</button>
		</form>
		
	</div>

<script src="<c:url value='/Security/js/jquery-1.7.1.min.js'/>"></script> 
<script src="<c:url value='/Security/js/bootstrap.min.js'/>"></script> 
<script src="<c:url value='/Security/js/button.js'/>"></script> 
<script src="<c:url value='/Security/js/jquery.validate.min.js'/>"></script> 
<script>
		(function($){
			$('#update').click(function() {
				$('.update-div').css("display","inline");
			});
			
			//密碼規則驗證
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
			
			$('#update-form').validate({
				rules: {
					'model.userAccount': {
						minlength: 6,
						required: true,
						checkAccount: true
					},
				  
					'model.userPassword': {
						required: true,
						minlength: 6,
						checkPsw1 : true,
						checkPsw2 : true 
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