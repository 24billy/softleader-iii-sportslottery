<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lottery</title>
</head>
<body>
	<h1>你已經完成投注，三秒後回到賽事表頁面。</h1>
    
<script>

setTimeout(function(){
	document.location.href='<c:url value="/index.jsp"/>';
},3000);
</script>
</body>
</html>
   