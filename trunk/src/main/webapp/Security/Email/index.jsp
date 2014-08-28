<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<title>Email Form</title>
</head>
<body>
   
   <s:form action="emailer" namespace="/"  method="post">
   <h1>馬上找回您寶貝的密碼</h1>
   
   <label for="account">輸入您註冊的帳號</label><br/>
   <input type="text" name="account"/><br/>
   
   <label for="to">輸入您註冊的Email</label><br/>
   <input type="text" name="to"/><br/>
   
   <input type="submit" value="發信" />
   <s:submit value="Send Email" method="execute"/>
   </s:form>
</body>
</html>