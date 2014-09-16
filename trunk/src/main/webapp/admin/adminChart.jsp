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
<link rel="stylesheet" href="<c:url value="/css/metro-bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
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
					<div class="col-sm-3 container-left">
						<jsp:include page="slider.jsp"/>
					</div>
					<!-- .container-left -->
					<div class="col-sm-9 container-right">
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
					<!-- .container-right -->
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
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/highcharts.js"/>"></script>
<script src="<c:url value="/js/exporting.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script>
	(function($) {
		
		//Begin of profitChart
		var months = [];
		var currentMonth = new Date().getMonth() + 2;
		for (var i = 12; i >= 1; i--) {
			var month = currentMonth - i;
			if (month <= 0) {
				month = 12 + month;
			}
			months.push(month + '月');				
		}
		
		$('#profitChart').highcharts({
			'chart': {
				'type': 'area'
			},
			'title': {
				'text': '獲利表',
				'x': -20
			},
			'xAxis': {
				'categories': months
			},
			'yAxis': {
				'title': {
					'text': '台幣'
				},
				'plotLines': [{
					'value': 0,
					'width': 1,
					'color': '#808080'
				}]
			},
			'tooltip': {
				'valueSuffix': '台幣'
			},
			'legend': {
				'layout': 'vertical',
				'align': 'right',
				'verticalAlign': 'middle',
				'borderWidth': 0
			},
			'series': [{
				'name': '總獲利',
				'data': $.parseJSON('${json}')
			}]
		});
		//End of profitChart
		
		//Begin of styling
		var currentUrl = document.location.pathname;
		var currentPath = currentUrl.substr(currentUrl.lastIndexOf('/') + 1);
		$('nav a[href*="' + currentPath + '"]').parent().addClass('active');
		//End of styling
	})(jQuery);
</script>
</body>
</html>