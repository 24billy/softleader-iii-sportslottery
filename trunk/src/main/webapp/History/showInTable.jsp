<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Show in Table</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/Admin/css/admin-style.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.datetimepicker.css"/>">


</head>
<body>

	<div id="wrapper">
		
		<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
				
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<c:url value="/History/historyIndex.jsp"/>">Sports Lottery Hisory</a>
			</div>
			
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav side-nav">
					<li>
						<a href="<c:url value="/History/historyIndex.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
					</li>
					<li class="active">
						<a href="javascript:;" data-toggle="collapse" data-target="#history-manager"><i class="fa fa-fw fa-list"></i> 歷史資訊<i class="fa fa-fw fa-caret-down"></i></a>
						<!-- 可隱藏下拉選單 -->
						<ul id="match-manager" class="collapse">
							<li class="open">
<%-- 							<a href="<c:url value="/Admin/match-form.jsp"/>"><i class="fa fa-fw fa-pencil-square-o"></i> 新增</a>
 --%>
 								<a href="<c:url value="/History/showInTable.jsp"/>"><i class="fa fa-fw fa-table"></i> 查詢</a>
 
							</li>
<%-- 						<li>
								<a href="<c:url value="/Admin/match-list.jsp"/>"><i class="fa fa-fw fa-table"></i> 查詢</a>
							</li>
 --%>
						</ul>
					</li>
				</ul>
			</div>
			<!-- .navbar-collapse -->
		</nav>
		
		<div id="page-wrapper">
		
			<div class="container-fluid">
			
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header"><!-- 主部分標頭 -->
							查詢賽事歷史
						</h1>
						<ol class="breadcrumb">
							<li>
								<a href="<c:url value="/History/historyIndex.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
							</li>
							<li>
								<i class="fa fa-fw fa-list"></i> 歷史資訊
							</li>
							<li class="active">
								<!-- <i class="fa fa-fw fa-pencil-square-o"></i> 新增 -->
								<i class="fa fa-fw fa-table"></i> 查詢
							</li>
						</ol>
					</div>
				</div>
				<!-- .row -->
				
				<div class="row">
					<div class="col-lg-4">
						<form role="form" action="<c:url value="/game.action"/>">

							<div class="form-group">
								
								<label>From:</label>
           						<input class="form-control form-game-time" type="text" name="model.gameTime">
 
           						</div>
           					<div class="form-group">
           						<label>To:</label>
           						<input class="form-control form-game-time" type="text" name="model.gameTime">
           					
           					</div>

           					<div class="form-group">
           						<label>隊名:</label>
           						<select class="form-control form-team" name="teamHomeId">
								</select>
           					
           					</div>

           					
           					<button class="btn btn-default" type="button" id="submitButton">Submit Button</button>
                            <button class="btn btn-default" type="reset" >Reset Button</button>

						</form>
					</div>
				</div>
				<div id="result">
				
				</div>
				<!-- .row -->
				
				<div class="row">
					<div class="col-lg-4">
					</div>
				</div>
				<!-- .row -->
			
			
			</div>
			<!-- .container-fluid -->
		</div>
		<!-- #page-wrapper -->
	
	</div>
	<!-- #wrapper -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="<c:url value="/Admin/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script>
	(function($) {
		listTeam();
		$('#history-manager').collapse();
		/* $('#submitButton').click(listGame); */
		//var btnClick = document.getElementById("submitButton");
		//btnClick.addEventListener("click",listGame,false);
		
		$('#submitButton').click(function(){
			var url = '<c:url value="/game"/>';
			$.getJSON(url, function(data) {
				$.each(data, function(key, value) {
					var millis = value.gameTime.iLocalMillis;
					//gameTime還是物件，所以還是要繼續取毫秒數
					//millisecondToDate可將毫秒數轉為日期，位址在/js/misc.js 
					var str = '<p>' + millisecondToDate(millis) + millisecondToTime(millis) + ', ' + value.teamHome.teamName + '</p>';
					
					console.log(str);
					$('#result').append(str);
				});
			});
		});
		

		
		function listTeam() {
			$('.form-team').empty();
			
			var url = '<c:url value="/team.action"/>';
			$.getJSON(url, function(data) { //透過team.action從資料庫，取回的Json型式的值，一條條成option	
				$.each(data, function(key, value) {
					var str = '<option value=' + value.id + '>' + value.teamName + '</option>';
					$('.form-team').append(str);
				});
			});
		}
		
		$('.form-game-time').datetimepicker({
			minDate: new Date(),
			format: 'Y-m-d H:i:s'
			
		});
		
		function listGame(){

			
		}
		
	})(jQuery);
</script>
</body>
</html>