<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="<c:url value="/Admin/js/jquery.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/Admin/js/dataTables.responsive.js"/>"></script>

<!--Include the slidepanel plugin -->
<script type="text/javascript" src="<c:url value="/js/jquery.slidepanel.js"/>"></script>
<!--Add the css -->
<link rel="stylesheet" type="text/css" href="css/jquery.slidepanel.css">


<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap.min.css"/>">
<!-- <link rel="stylesheet" href="<c:url value="/Admin/css/font-awesome.min.css"/>"> -->
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/global.css"/>">
<title>運動彩卷</title>
</head>
<body>
	<div id="page-wrapper">
		<!-- top start -->
		<div>
		  <jsp:include page="/top.jsp"></jsp:include>
		</div>		
		<!-- top end -->
		<!-- navbar start -->
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<jsp:include page="/nav.jsp"></jsp:include>
			</div>
			
			<!-- 
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-responsive-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">運動彩券</a>
			</div>
			<div class="navbar-collapse collapse navbar-responsive-collapse">
				<ul class="nav navbar-nav">
					<li class="active"><a href="#">Active</a></li>
					<li><a href="#">Link</a></li>

				</ul>

				
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#">Link</a></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Dropdown <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Action</a></li>
							<li><a href="#">Another action</a></li>
							<li><a href="#">Something else here</a></li>
							<li class="divider"></li>
							<li><a href="#">Separated link</a></li>
						</ul></li>
				</ul>
				 -->
		</div>
		<!-- navbar end -->
	</div>

	<div>		
		<div class="container-fluid">
			<div class="row-fluid">
				<!-- content end -->
				<div class="">
				<h3>put target page here</h3>
				<!--Body content-->
				</div>
				<!-- content end -->
				<div class="">
				
					<a href="nav.jsp" data-slidepanel="panel">Show Panel</a>
				</div>
			</div>
		</div>
		<!-- .container-fluid -->
	</div>
	<!-- #page-wrapper -->









<script>
	(function($) {
		$('[data-slidepanel]').slidepanel({
			orientation : 'right', //default left, available: top, right, bottom, left
			mode : 'push', //default push, available: push, overlay
			static : false
		//default false, available: true, false
		});
	})(jQuery);
</script>


</body>
</html>