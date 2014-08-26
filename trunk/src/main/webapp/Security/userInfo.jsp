<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.non-user-input {
	display:none;
}
#update-meseeage {
	color:green;
}
</style>
<body>
	<div>
		<form action="<c:url value='/userUpdate'/>">
			<input class="non-user-input" type="radio" name="model.userGender" value="${user.userGender}" >
			<input class="non-user-input" type="text" name="model.userAccount" value="${user.userAccount}">
			<label>
				<strong>密碼</strong><br>
				<input class="input-xlarge" name="model.userPassword" type="password" value="${user.userPassword}">
			</label><br>
			
			<label id="label-account">
				<strong>姓名</strong><br>
				<input name="model.userName" type="text" value="${user.userName}" />
			</label><br>
			
			<label id="label-account">
				<strong>電話</strong><br>
				<input name="model.userPhone" type="text" value="${user.userPhone}" />
			</label><br>
			
			<label id="label-account">
				<strong>生日</strong><br>
				<input name="model.userBirthday" type="text" value="${user.userBirthday}" />
			</label><br>
			
			<label id="label-account">
				<strong>E-mail</strong><br>
				<input name="model.userEmail" type="text" value="${user.userEmail}" />
			</label><br>
			<button type="submit">儲存</button>
		</form>
		<div>
			<h5 id="update-meseeage">${updateSuccess}</h5>
		</div>
	</div>
</body>
</html>