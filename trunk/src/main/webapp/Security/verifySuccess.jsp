<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div class="row">
		<div class="send-mail-div col-sm-8 col-sm-offset-2">
			<div style="font-size:2em">${user.userName}感謝您的註冊您可以開始。。。↓</div>
			<img src="<c:url value='/images/gameValidate.JPG'/>" alt="玩法介紹">
		</div>
	</div>
</body>
</html>