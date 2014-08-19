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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/Security/css/creatAccount-style.css"/>">

</head>
<body>
	<div class="createaccount-body">
		<h1 class="create-title">註冊系統</h1>
		<div class="sing-up">
			<form class="form-createaccount">
				<label>
					<strong>帳號</strong><br>
					<input id="account" type="text">
				</label>
				<div class="error" id="acountIn"></div>
				
				<label>
					<strong>密碼</strong><br>
					<input id="pwd" type="password">
				</label>
				<div class="error" id="pwdIn"></div>
				
				<label>
					<strong>確認密碼</strong><br>
					<input id="chek_pwd" type="password">
				</label>
				<div class="error" id="chek_pwdIn"></div>
				
				<label id="label-account">
					<strong>姓名</strong><br>
					<input type="text">
				</label>
				<label id="label-account">
					<strong>E-mail</strong><br>
					<input type="text">
				</label>
				<label id="label-account">
					<strong>電話</strong><br>
					<input type="text">
				</label>
				<div class="error" id="acountIn"></div>
				<label id="label-account">
					<strong>
						<span>男</span><input type="radio" name="gender" value="男">
						<span>女</span><input type="radio" name="gender" value="女">
					</strong>
				</label><br>
				<label id="label-account">
					<strong>生日</strong><br>
					<input id="form-element-name" type="text">
				</label><br>
				
				<button type="submit" class="btn btn-success">註冊</button>
				<button type="reset" class="btn btn-info">清除</button>
			</form>
		</div>
	</div>
	<script type="text/javascript">
		(function($){
			$('#pwd').focusout(chekPwd);
			function chekPwd() {
				var re = /^(?!.*[\u4E00-\u9FA5])(?=.*[0-9])(?=.*[a-zA-Z])(?=.*[!@#$%^&*])\S{6,}$/g;
		        if (re.test($('#pwd').val())) {
		        	$('#pwdIn').html("格式正確");
		        }else {
		        	$('#pwdIn').html("格式錯誤");
		            //console.log("失敗: " + $('#pwd').val());
		        }
			};
			
			$('#chek_pwd').focusout(chekPwdAgain);
			function chekPwdAgain() {
		        if ($('#chek_pwd').val()!="" && $('#chek_pwd').val()==$('#pwd').val()) {
		        	$('#chek_pwdIn').html("O");
		        	console.log($('#chek_pwd').val() + "成功: " + $('#pwd').val());
		        }else {
		        	$('#chek_pwdIn').html("X");
		            console.log($('#chek_pwd').val() + "失敗: " );
		        }
			};
			
			$('#account').focusout(chekAc);
			
			function chekAc() {
				$.ajax( {
					url:"<c:url value='/chekAccount'/>",
					type:"get",
					success: function(data) {
						alert(data);
					}
					
					
				});
			};
			
			
			
			
			
			$('#loadImg').hide();
			$(document).ajaxStart(function() {
				$('#loadImg').show();
			}).ajaxStop(function() {
				$('#loadImg').hide();
			});
			
			
		})(jQuery)
	</script>
	
</body>
</html>