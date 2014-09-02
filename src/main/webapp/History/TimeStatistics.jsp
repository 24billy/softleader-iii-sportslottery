<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>時段統計資訊</title>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/History/css/admin-style.css"/>">
<link rel="stylesheet" href="<c:url value="/History/css/jquery.datetimepicker.css"/>">


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
<!--                        	<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav side-nav">
					<li>
						<a href="<c:url value="/Admin/index.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
					</li>
					<li class="active">
						<a href="javascript:;" data-toggle="collapse" data-target="#match-manager"><i class="fa fa-fw fa-list"></i> 賽事管理<i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="match-manager" class="collapse">
							<li class="open">
								<a href="<c:url value="/Admin/match-form.jsp"/>"><i class="fa fa-fw fa-pencil-square-o"></i> 新增</a>
							</li>
							<li>
								<a href="<c:url value="/Admin/match-list.jsp"/>"><i class="fa fa-fw fa-table"></i> 查詢</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>-->
			
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav side-nav">
					<li>
						<a href="<c:url value="/index.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
					</li>
					<li class="active">
						<a href="javascript:;" data-toggle="collapse" data-target="#history-manager"><i class="fa fa-fw fa-list"></i> 成績歷史資訊<i class="fa fa-fw fa-caret-down"></i></a>
<!--						 可隱藏下拉選單 -->
						<ul id="history-manager" class="collapse">
							<li class="open">
 								<a href="<c:url value="/History/showInTable.jsp"/>"><i class="fa fa-fw fa-table"></i> 查詢</a>
 
							</li>
                                                        <li class="open">
 								<a href="<c:url value="/History/showInTable.jsp"/>"><i class="fa fa-fw fa-table"></i> Statistics</a>
 
							</li>
                                                        <li class="open">
 								<a href="<c:url value="/History/showInTable.jsp"/>"><i class="fa fa-fw fa-table"></i> Comparisions on Map</a>
 
							</li>
                                                        

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
							查詢賽事成績
						</h1>
						<ol class="breadcrumb">
							<li>
								<a href="<c:url value="/History/historyIndex.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
							</li>
							<li>
								<i class="fa fa-fw fa-list"></i> 成績
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
					<div class="col-lg-12">
						<form class="form-inline" role="form" action="<c:url value="/game.action"/>">

							<div class="form-group">
								
	                             <label class="sr-only" for="from">From:</label>
	                             <input class="form-control form-game-time"  id="from" placeholder="From" type="text" name="timeFrom">

        					</div>

                            <div class="form-group">
                                <label class="sr-only" for="to">To:</label>
                            	<input class="form-control form-game-time"  id = "to" placeholder="To" type="text" name="timeTo">
                            </div>
                            
                            <div class="form-group">
                            	<label class="sr-only" for="country">隊名:</label>
                                <select class="form-control form-country" id="country" name="country"  >
                                	<option >不選擇區域 </option>
                                  	<option value="ROC">中華職棒</option>
                                  	<option value="USA">美國職棒</option>
                                  	<option value="JAPAN">日本職棒</option>
                                  	<option value="KOREA">韓國職棒</option>
                                </select>

                            </div>

                            <div class="form-group">
                                    <label class="sr-only" for="teamName">隊名:</label>
                                    <select class="form-control form-team" id="teamName" name="teamName" ></select>

                            </div>


                    
                            <button class="btn btn-default" type="button" id="submitButton">Submit Button</button>
                            <h5>可直接按submit列出所有資訊</h5>
                            <button class="btn btn-default" type="reset" id="reset" >Reset Button</button>
                            
                            
                            
                                 

						</form>
					</div>
				</div>
				<div id="result">
				
				</div>
				
				<div class="row top20">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table class="table table-hover table-striped table-bordered" id="gameTable">
							<thead id="teamListHead">
								
							</thead>
							<tbody id="gameList">
							</tbody>
						</table>
					</div>
					<!-- .table-responsive -->
				</div>
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

<script src="<c:url value="/History/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script>
	(function($) {
		listTeam();
		$( ".form-country" ).change(function() { 

			getTeamsByCountry();

		});


		$('#history-manager').collapse();

		$('#submitButton').click(function(){
			listGame();
			
		
		});
		
		
		function listTeam() {
		 	$('.form-team').empty(); 
			
			var url = '<c:url value="/team.action"/>';
			 $('.form-team').append('<option value="">不選擇隊伍 </option>'); 
				
			 $.getJSON(url, function(data) { //透過team.action從資料庫，取回的Json型式的值，一條條成option
					$.each(data, function(key, value) {
						var str = '<option value=' + value.teamName + '>' + value.teamName + '</option>';
						$('.form-team').append(str);
					});
				});
		}
		
		$('.form-game-time').datetimepicker({
			
			format: 'Y-m-d',
			timepicker: false //取消掉顯示時間
			
		});
		
		function listGame(){
			
			console.log($('#teamName').val());
			console.log($('#from').val());
			console.log($('#to').val());
			
			$.ajax({
				url:'<c:url value="/searchHistory?method:searchHistoryMethod"/>',
				type:'post',
				dataType:'json',
				data:{
					'teamName':$('#teamName').val(),
					'timeFrom':$('#from').val(),
					'timeTo':$('#to').val()	
				},
				success:function(data) {
					console.log(data);
					showResultTable(data);
				}
			});
		}
			
		function showResultTable(data){

			$('#teamListHead').html("<tr><th>時間</th><th>聯盟名稱</th><th>賽事編號</th><th>客隊隊伍</th><th>主隊隊伍</th><th colspan='2'>比分</th></tr>");
			$('#gameList').empty();
			console.log(data);
			/* var gameList = $.parseJSON(data); */
			 $.each(data, function(index, game) {
				console.log(game);
				var child = '';
				var millis = game.gameTime.iLocalMillis;
				console.log(game.gameTime);
				child += '<tr>';
				child += '<td>' + millisecondToDate(millis) + '</td>';
				child += '<td>' + game.leagueName + '</td>';
				child += '<td>' + game.gameNum + '</td>';
				child += '<td>' + game.teamAway.teamName + '</td>';
				child += '<td>' + game.teamHome.teamName + '</td>';
				child += '<td>' + game.gameScoreAway + '</td>';
				child += '<td>' + game.gameScoreHome + '</td>';
				child += '</tr>';
				
				$('#gameList').append(child);
			});
			
		
			
		}
		
		function getTeamsByCountry(){
			
			$.ajax({
				url:'<c:url value="/teamsByCountry?method:getTeamsByCountry"/>',
				type:'post',
				dataType:'json',//不可為text, 不然不是物件
				data:{
					'country':$('#country').val()
				},
				success:function(data) {
					$('.form-team').empty(); 
				/* 	$('.form-team').append('<option value="">不選擇隊伍 </option>');  */
					$.each(data, function(key, value) {
						var str = '<option value=' + value.teamName + '>' + value.teamName + '</option>';
						$('.form-team').append(str);
					});
				 	
				}
			});
			
		}
	})(jQuery);
</script>
</body>
</html>