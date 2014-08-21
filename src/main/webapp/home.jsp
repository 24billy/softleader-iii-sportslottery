<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<script src="<c:url value="Security/js/jquery-1.7.1.min.js"/>"></script>
<script src="<c:url value="Security/js/jquery.XYTipsWindow.min.2.8.js"/>"></script>
<script src="<c:url value="Security/js/bootstrap.js"/>"></script>

<style>
#form{
	float:right;
}
.info{
	width:100px;
}
#reg{
	float:right;
}
.error{
	font-family: "Lucida Sans Unicode", "Lucida Grande", "微軟正黑體";
	font-weight: 700;
	font-size: 13px;
	line-height: 20px;
	color:red;
}
</style>
</head>
<body>

	<form id="form" class="form-inline" action="<c:url value="checkLogin"/>" >
		<div>
			<input type="text" class="info" name="model.userAccount" placeholder="請輸入帳號" required>
			<input type="password" class="info" name="model.userPassword" placeholder="請輸入密碼" required>
			<s:submit cssClass="btn btn-success" value="登入" method="login"/>
		</div>
		<div>
			<button type="button" class="btn btn-link">忘記密碼</button>
			<span class="error">${errors.LoginFail}</span>
			<button type="button" id="reg" class="btn btn-info">註冊</button>
		</div>
	</form>

<script>
	(function($){
		$("#reg").click(function(){
			$.XYTipsWindow({
				___title:"",
				___content:"iframe:Security/addUser.jsp",
				___width:"400",
				___height:"500",
				___showbg:true,
				___drag:"___boxTitle"
			});
		});
	})(jQuery);
</script>

</body>
</html>