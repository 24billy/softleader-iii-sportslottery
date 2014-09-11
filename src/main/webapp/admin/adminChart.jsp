<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>報表</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<!-- <link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css"/>"> -->
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">
<link rel="stylesheet" href="<c:url value="/css/adminStyle.css"/>">
</head>
<body>
	<div id="wrapper">
		<jsp:include page="navigation.jsp"/>
		<div id="page-wrapper">
			<div class="container animated fadeIn">
				<div class="row">
					<div class="col-sm-2 container-left">
						<jsp:include page="slider.jsp"/>
					</div>
					<!-- .col-sm-2 -->
					<div class="col-sm-10 container-right">
						<div class="row">
							<div class="col-sm-12">
								<div class="page-header">
									<h1>報表</h1>
								</div>
								<ol class="breadcrumb">
		  							<li><a href="<c:url value="/admin"/>"><i class="fa fa-fw fa-home"></i> 首頁</a></li>
		  							<li class="active"><i class="fa fa-fw fa-line-chart"></i> 報表</li>
								</ol>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-sm-12">
								<div id="profitChart">
								</div>
							</div>
						</div>
						<!-- .row -->
					</div>
					<!-- .col-sm-10 -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container -->
		</div>
		<!-- #page-wrapper -->
		<jsp:include page="footer.jsp"/>
	</div>
	<!-- #wrapper -->
	
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script src="<c:url value="/js/highcharts.js"/>"></script>
<script src="<c:url value="/js/exporting.js"/>"></script>
<script>
	(function($) {
		$('#profitChart').highcharts({
			title: {
				text: '每月獲利',
				x: -20
			},
			xAxis: {
				categories: ['1月', '2月', '3月', '4月', '5月', '6月', '7月', '8月', '9月', '10月', '11月', '12月']
			},
			tooltip: {
				valueSuffix: '台幣'
			},
			legend: {
				layout: 'vertical',
				align: 'right',
				verticalAlign: 'middle',
				borderWidth: 0
			},
			series: [{
				name: '獲利',
				color: '#582',
				data: [12345, -100, 42654, 75611, 45351, 48613, -13151, 84351, 98460, 12315, -1235, 45643]
			}]
		});
		
		//Begin of styling
		var currentUrl = document.location.pathname;
		var currentPath = currentUrl.substr(currentUrl.lastIndexOf('/') + 1);
		$('nav a[href*="' + currentPath + '"]').parent().addClass('active');
		//End of styling
	})(jQuery);
</script>
</body>
</html>