<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:text name="admin.login"/></title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">
<link rel="stylesheet" href="<c:url value="/css/adminStyle.css"/>">
</head>
<body>
	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<c:redirect url="/admin/home"/>
	</sec:authorize>
	<div id="wrapper">
		<div class="container animated fadeIn">
			<div class="row">
				<div class="col-sm-12">
					<h1 id="loginTitle" class="text-center"><i class="fa fa-fw fa-futbol-o"></i><span class="left5">Sports Lottery Admin</span></h1>
				</div>
			</div>
			<div class="row">
				<div class="col-sm-4 col-sm-offset-4">
					<c:if test="${param.error != null}">
            			<div class="alert alert-danger" role="alert"><s:text name="admin.login.error"/></div>
        			</c:if>
					<form role="form" id="loginForm" action="<c:url value="/admin/j_spring_security_check"/>" method="post">
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-fw fa-user"></i></span>
								<input name="j_username" id="username" type="text" class="form-control" placeholder="<s:text name="admin.login.username.placeholder"/>">
							</div>
						</div>
						<div class="form-group">
							<div class="input-group">
								<span class="input-group-addon"><i class="fa fa-fw fa-key"></i></span>
								<input name="j_password" id="account" type="password" class="form-control" placeholder="<s:text name="admin.login.password.placeholder"/>">
							</div>
						</div>
						<button type="submit" class="btn btn-success pull-right"><i class="fa fa-fw fa-sign-in"></i><span class="left5"><s:text name="admin.login.loginBtn"/></span></button>
					</form>
				</div>
			</div>
			<!-- .row -->
		</div>
		<!-- .container -->
	</div>
	<!-- #wrapper -->

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/highcharts.js"/>"></script>
<script src="<c:url value="/js/exporting.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script src="<c:url value="/js/admin-navgation.js"/>"></script>
<script>
	(function($) {
		$('#username').focus();
	})(jQuery);
</script>
</body>
</html>