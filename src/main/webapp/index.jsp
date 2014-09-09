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
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>


<!--sidepanel  -->
<script type="text/javascript" src="js/jquery.slidepanel.js"></script>

<link rel="stylesheet" type="text/css" href="css/jquery.slidepanel.css">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">

<!-- <link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>"> -->
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">    

	<style>
		@import url(http://fonts.googleapis.com/css?family=Oswald);
	
		#nav{
		    font-family: 'Oswald', sans-serif;
		}
		
		.btn{
		    margin: 4px;
		    box-shadow: 1px 1px 5px #888888;
		}
		
		.btn-xs{
		    font-weight: 300;
		}
		   
		.btn-hot {
		color: #fff;
		background-color: #db5566;
		border-bottom:2px solid #af4451;
		}
		
		.btn-hot:hover, .btn-sky.active:focus, .btn-hot:focus, .open>.dropdown-toggle.btn-hot {
		color: #fff;
		background-color: #df6a78;
		border-bottom:2px solid #b25560;
		outline: none;}
		
		
		.btn-hot:active, .btn-hot.active {
		color: #fff;
		background-color: #c04b59;
		border-top:2px solid #9a3c47;
		margin-top: 2px;
		}
		
		.btn-sunny {
		color: #fff;
		background-color: #f4ad49;
		border-bottom:2px solid #c38a3a;
		}
		
		.btn-sunny:hover, .btn-sky.active:focus, .btn-sunny:focus, .open>.dropdown-toggle.btn-sunny {
		color: #fff;
		background-color: #f5b75f;
		border-bottom:2px solid #c4924c;
		outline: none;
		}
		
		
		.btn-sunny:active, .btn-sunny.active {
		color: #fff;
		background-color: #d69840;
		border-top:2px solid #ab7a33;
		margin-top: 2px;
		}
		
		.btn-fresh {
		color: #fff;
		background-color: #51bf87;
		border-bottom:2px solid #41996c;
		}
		
		.btn-fresh:hover, .btn-sky.active:focus, .btn-fresh:focus, .open>.dropdown-toggle.btn-fresh {
		color: #fff;
		background-color: #66c796;
		border-bottom:2px solid #529f78;
		outline: none;
		}
		
		
		.btn-fresh:active, .btn-fresh.active {
		color: #fff;
		background-color: #47a877;
		border-top:2px solid #39865f;
		outline: none;
		outline-offset: none;
		margin-top: 2px;
		}
		
		.btn-sky {
		color: #fff;
		background-color: #0bacd3;
		border-bottom:2px solid #098aa9;
		}
		
		.btn-sky:hover,.btn-sky.active:focus, .btn-sky:focus, .open>.dropdown-toggle.btn-sky {
		color: #fff;
		background-color: #29b6d8;
		border-bottom:2px solid #2192ad;
		outline: none;
		}
		
		.btn-sky:active, .btn-sky.active {
		color: #fff;
		background-color: #0a97b9;
		border-top:2px solid #087994;
		outline-offset: none;
		margin-top: 2px;
		}
		
		.btn-tree {
		color: #fff;
		background-color: #66CDAA;
		border-bottom:2px solid #098aa9;
		}
		
		.btn-tree:hover,.btn-tree.active:focus, .btn-tree:focus, .open>.dropdown-toggle.btn-tree {
		color: #fff;
		background-color: #66CDAA;
		border-bottom:2px solid #2192ad;
		outline: none;
		}
		
		.btn-tree:active, .btn-tree.active {
		color: #fff;
		background-color: #66CDAA;
		border-top:2px solid #087994;
		outline-offset: none;
		margin-top: 2px;
		}
		
		.btn:focus,
		.btn:active:focus,
		.btn.active:focus {
		    outline: none;
		    outline-offset: 0px;
		}
</style>
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
				<a href="" data-slidepanel="panel"><button type="button"
						class="btn btn-tree text-uppercase btn-lg " id="lotteryBoard">投注區</button></a>
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

	<div >		
		<div class="container-fluid" >
			<div class="row-fluid" >
				<!-- content start -->
				<div id="target">
					<jsp:include page="/go.jsp" />				
				</div>
				<!-- content end -->

			</div>
		</div>
		<!-- .container-fluid -->
	</div>
	<!-- #page-wrapper -->

</body>
  <script type="text/javascript">
      $(document).ready(function(){
          $('[data-slidepanel]').slidepanel({
              orientation: 'right',
              mode: 'overlay',
              static: true
          });
      });
      
  	$('#game').click(function() {		
  		window.location='<c:url value="/game"/>';
 	});
	$('#history').click(function() {
		window.location='<c:url value="/history"/>';
	});
	$('#user').click(function() {
		window.location='<c:url value="/userInfo"/>';
	});
</script>
<body>
<div>
	<jsp:include page="topPage.jsp"/>
</div>
</body>
</html>