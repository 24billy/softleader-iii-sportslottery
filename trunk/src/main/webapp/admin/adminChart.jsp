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
<title><s:text name="admin.adminChart"/></title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css"/>">
<!-- <link rel="stylesheet" href="<c:url value="/css/metro-bootstrap.min.css"/>"> -->
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
			<div class="container">
				<div class="row">
					<div class="col-sm-3 container-left">
						<jsp:include page="sider.jsp"/>
					</div>
					<!-- .container-left -->
					<div class="col-sm-9 container-right animated fadeIn">
						<div class="row">
							<div class="col-sm-12">
								<ul class="breadcrumb">
		  							<li><a href="<c:url value="/admin"/>"><i class="fa fa-fw fa-home"></i><span class="left5"><s:text name="admin.home"/></span></a></li>
		  							<li class="active"><i class="fa fa-fw fa-line-chart"></i></i><span class="left5"><s:text name="admin.adminChart"/></span></li>
								</ul>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row container-table">
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
<c:choose>
	<c:when test="${locale.language eq 'zh'}">
		<script src="<c:url value="/js/highcharts_zh.js"/>"></script>
		<script src="<c:url value="/js/exporting_zh.js"/>"></script>
	</c:when>
	<c:otherwise>
		<script src="<c:url value="/js/highcharts.js"/>"></script>
		<script src="<c:url value="/js/exporting.js"/>"></script>
	</c:otherwise>
</c:choose>
<script src="<c:url value="/js/highcharts.theme.sand-signika.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script src="<c:url value="/js/admin-navgation.js"/>"></script>
<script>
	(function($) {
		var zh = '${locale.language}' == 'zh';
		
		//Begin of profitChart
		var months = [];
		var currentMonth = new Date().getMonth() + 2;
		for (var i = 12; i >= 1; i--) {
			var month = currentMonth - i;
			if (month <= 0) {
				month = 12 + month;
			}
			if (zh) {
				months.push(month + '月');
			} else {
				months.push(toMonth(month));
			}
		}
		
		function toMonth(num) {
			switch(num) {
				case 1: return 'Jan'; break;
				case 2: return 'Feb'; break;
				case 3: return 'Mar'; break;
				case 4: return 'Apr'; break;
				case 5: return 'May'; break;
				case 6: return 'Jun'; break;
				case 7: return 'Jul'; break;
				case 8: return 'Aug'; break;
				case 9: return 'Sep'; break;
				case 10: return 'Oct'; break;
				case 11: return 'Nov'; break;
				case 12: return 'Dec'; break;
			}
		}
		
		$('#profitChart').highcharts({
			'chart': {
				'type': 'area',
			},
			'title': {
				'text': '<s:text name="admin.adminChart.chartTitle"/>',
				'x': -20
			},
			'xAxis': {
				'categories': months
			},
			'yAxis': {
				'title': {
					'text': '<s:text name="admin.adminChart.chartYAxis"/>'
				},
				'plotLines': [{
					'value': 0,
					'width': 1,
					'color': '#808080'
				}]
			},
			'tooltip': {
				'valueSuffix': '<s:text name="admin.adminChart.chartTooltip"/>'
			},
			'legend': {
				'layout': 'vertical',
				'align': 'right',
				'verticalAlign': 'middle',
				'borderWidth': 0
			},
			'series': [{
				'name': '<s:text name="admin.adminChart.chartSeries"/>',
				'data': $.parseJSON('${json}'),
				'color': 'rgba(119,136,153,.25)',
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