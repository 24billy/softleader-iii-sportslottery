<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Email Success</title>
</head>
<body>
   <h1>您的密碼已寄到 <s:property value="to"/> ,請盡速接收.2秒回首頁</h1>
   
   <script>setTimeout('document.location.href="<c:url value='/goIndex'/>"' ,2000);</script>
</body>
</html>