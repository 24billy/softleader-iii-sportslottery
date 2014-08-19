<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add User</title>
<link rel="stylesheet" href="<c:url value="/Security/css/creatAccount-style.css"/>">
<link href="css/style.css" rel="stylesheet">
</head>
<body>
	<div class="createaccount-body">
		<h1 class="create-title">註冊系統</h1>
		<div class="sing-up">
			<form class="form-horizontal" id="registration-form">
				<label>
					<strong>帳號</strong><br>
					<input class="input-xlarge" name="model.userAccount" id="username" type="text">
				</label>
				<div class="error" id="acountIn"></div>
				
				<label>
					<strong>密碼</strong><br>
					<input class="input-xlarge" name="model.userPassword" id="password" type="password">
				</label>
				<div class="error" id="pwdIn"></div>
				
				<label>
					<strong>確認密碼</strong><br>
					<input class="input-xlarge" name="confirm_password" id="confirm_password" type="password">
				</label>
				<div class="error" id="chek_pwdIn"></div>
				
				<label id="label-account">
					<strong>姓名</strong><br>
					<input class="input-xlarge" name="model.userName" type="text">
				</label>
				<label id="label-account">
					<strong>E-mail</strong><br>
					<input class="input-xlarge" name="model.userEmail" type="text">
				</label>
				<label id="label-account">
					<strong>電話</strong><br>
					<input class="input-xlarge" name="model.userPhone" type="text">
				</label>
				<div class="error" id="acountIn"></div>
				<label id="label-account">
					<strong>
						<span>男</span><input type="radio" name="model.userGender" value="男">
						<span>女</span><input type="radio" name="model.userGender" value="女">
					</strong>
				</label><br>
				<label id="label-account">
					<strong>生日</strong><br>
					<input class="input-xlarge" name="model.userBirthday" id="form-element-name" type="text">
				</label><br>
				
				<button type="submit" class="btn btn-success">註冊</button>
				<button type="reset" class="btn btn-info">清除</button>
			</form>
		</div>
	</div>
	
	<script src="js/jquery-1.7.1.min.js"></script> 
	<script src="js/jquery.validate.js"></script> 
	<script src="js/script.js"></script> 
	
	<script>
		(function($){
			$('#username').focusout(chekAc);
			function chekAc() {
				$.ajax( {
					url:"<c:url value='/chekAccount'/>",
					type:"get",
					data:{
						'model.userAccount': $('#username').val()
					},
					success: function(data) {
						alert(data);
					}
				});
			};		
		})(jQuery);
	</script>
	
</body>
</html>