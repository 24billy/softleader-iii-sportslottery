<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登出</title>
</head>
<body>
<!-- 先將使用者名稱取出 -->
<c:set var="memberName" value="${user.userAccount}" />
<!-- 移除放在session物件內的屬性物件 -->
<c:remove var="user" scope="session" />
<!-- 下列六行敘述設定登出後要顯示的感謝訊息 -->

<font color='blue' ><BR>
	<h1>訪客${ memberName }，感謝您使用本系統。</h1><BR>
	<h3>您已經登出，三秒後倒入首頁</h3><BR>
</font>
<script type="text/javascript">
	setTimeout('document.location.href="<c:url value='/home.jsp'/>"' ,3000);
	
</script>
<%
  session.invalidate();
%>

</body> 
</html>