<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<style>
.home {
	float:right;
}
</style>
<body>
<div class="home">
	<jsp:include page="/home.jsp" />
	<jsp:include page="/MustBeUser/updateUser.jsp" />
</div>
<h2>Hello! ${user.userAccount} </h2>
<a href="odds">odds</a>|<a href="Admin/index.jsp">Game Manager</a><br>
<a href="Event/match-index.jsp">Game info</a>|<a href="<c:url value="/History/historyIndex.jsp"/>">History Index</a><br>
<a href="<c:url value="/Security/userOddsSearch.jsp"/>">UserOdds</a>|<a href="<c:url value="/nav"/>">nav</a><br>

</body>
</html>
