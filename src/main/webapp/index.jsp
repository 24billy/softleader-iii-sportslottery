<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>運動彩卷</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/bootstrap-dialog.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/jquery.shapeshift.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script src="<c:url value="/js/jquery.sidr.min.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>

<link rel="stylesheet" type="text/css" href="css/jquery.sidr.light.css">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-dialog.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">    
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
<link rel="stylesheet" href="<c:url value="/css/sophia.css"/>"> 

<style>
		@import url(http://fonts.googleapis.com/css?family=Oswald);
</style>

<script>

</script>
</head>
<body>
<br><br>
<div id="page-wrapper">
		<!-- top start -->
		<div>		   
		</div>		
		<!-- top end -->
		<!-- navbar start -->
		<div class="navbar navbar-default">
			<div class="navbar-header">
				<button type="button" class="btn btn-hot text-uppercase btn-lg"
					id="game">賽事投注</button>
				<button type="button" class="btn btn-sunny text-uppercase btn-lg"
					id="history">歷史紀錄</button>
				<button type="button" class="btn btn-sky text-uppercase btn-lg "
					id="user">使用者資訊</button>
				<a id="simple-menu" href="#sidr"><button type="button"
						class="btn btn-tree text-uppercase btn-lg " id="lotteryBoard">投注區</button></a>
 			</div>
		</div>
		<!-- navbar end -->
	</div>

	<div >		
		<div class="container-fluid" >
			<div class="row-fluid" >
				<!-- content start -->
				<div id="target">
					<jsp:include page="/Event/test-events.jsp" />				
				</div>
				<!-- content end -->

			</div>
		</div>
		<!-- .container-fluid -->
	</div>
	<!-- #page-wrapper -->

</body>
  <script type="text/javascript">
      
  	$('#game').click(function() {		  		
  		$("#target").load('<c:url value="/Event/test-events.jsp"/>');  		
 	});
	$('#history').click(function() {
		$("#target").load('<c:url value="/History/historyComplex.jsp"/>');
	});
	$('#user').click(function() {
		$("#target").load('<c:url value="/Event/test-events.jsp"/>');
	});
</script>
<body>
<div>
	<jsp:include page="topPage.jsp"/>
</div>
<div id="sidr">
  <!-- lottery content -->
  <ul>
    <li><a href="#">List 1</a></li>
    <li class="active"><a href="#">List 2</a></li>
    <li><a href="#">List 3</a></li>
  </ul>
</div>
<!--sidepanel  -->  
<script type="text/javascript" src="js/jquery.slidepanel.js"></script>
<script type="text/javascript" src="js/jquery.sidr.min.js"></script>
<script>
$(document).ready(function(){
    $('#simple-menu').sidr();

});

var galbalGames;
var galbalOdds;
function golbalInsert(games, odds){
	galbalGames = games;
	galbalOdds = odds;
}

function odds_refresh(){
	(function($){
		var games = galbalGames;
		var odds = galbalOdds;
		console.log('odds_refresh call');
	})(jQuery);
}

</script>
</body>
</html>