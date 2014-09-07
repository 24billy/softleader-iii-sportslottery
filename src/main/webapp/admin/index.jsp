<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Index Page</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<!-- <link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css"/>"> -->
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">
</head>
<body>
	<div id="page-wrapper">
		
		<div class="container-fluid top20">
			<a class="btn btn-success" type="button" href="<c:url value="/admin/gameAdmin"/>">Game Table</a>
			<a class="btn btn-success" type="button" href="<c:url value="/admin/teamAdmin"/>">Team Table</a>
			<a class="btn btn-success" type="button" href="<c:url value="/admin/j_spring_security_logout"/>">Log Out</a>
		</div>
		<!-- .container-fluid -->
	</div>
	<!-- #page-wrapper -->

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script>
	(function($) {
		
	})(jQuery);
</script>
</body>
</html>