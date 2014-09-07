<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>登入頁面</title>
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
		
		<div class="container top20">
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<div class="panel panel-default">
						<div class="panel-heading">管理者登入</div>
						<div class="panel-body">
							<c:if test="${param.error != null}">
            					<h4 class="warning">帳號或密碼錯誤</h4>
        					</c:if>
							<!-- <form role="form" action="j_security_check" class=""> -->
							<form role="form" action="<c:url value="/Admin/j_spring_security_check"/>" method="post">
								<div class="form-group">
									<label for="username">帳號</label>
									<input name="j_username" id="username" type="text" class="form-control input-sm">
								</div>
								<div class="form-group">
									<label for="account">密碼</label>
									<input name="j_password" id="account" type="password" class="form-control input-sm">
								</div>
								<button type="submit" class="btn btn-success pull-right">登入</button>
							</form>
								
								
						</div>
					</div>
				</div>
			</div>
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