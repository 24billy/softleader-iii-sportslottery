<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sports Lottery Manager</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/Admin/css/admin-style.css"/>">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<style>
</style>
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
				<a class="navbar-brand" href="<c:url value="/Admin/index.jsp"/>">Sports Lottery Admin</a>
			</div>
			
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav side-nav">
					<li class="active">
						<a href="<c:url value="/Admin/index.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
					</li>
					<li>
						<a href="javascript:;" data-toggle="collapse" data-target="#match-manager"><i class="fa fa-fw fa-list"></i> 賽事管理<i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="match-manager" class="collapse">
							<li>
								<a href="<c:url value="/Admin/match-form.jsp"/>"><i class="fa fa-fw fa-pencil-square-o"></i> 新增</a>
							</li>
							<li>
								<a href="<c:url value="/Admin/match-list.jsp"/>"><i class="fa fa-fw fa-table"></i> 查詢</a>
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
					<div class="panel panel-default col-lg-8"></div>
					<div class="panel panel-primary col-lg-4">
					
						<div class="panel-heading " >
							投注區
						</div>
						<!-- 

						
						<div class="panel panel-success" id=lottery2>
							<div class="panel-heading">編號:</div>
							<div class="panel-body">時間:</div>
							<div class="panel-body">隊伍:</div>
							<div class="panel-footer">贏家:</div>
						</div>
						-->
						<table class="table table-striped  table-hover" >
  							<tr>
  								<td id=lottery1>
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div> 																
  								</td>
  							</tr>
  							<tr>
  								<td id="lottery2">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>									  								
  								</td>
  							</tr>
  							<tr>
  								<td id="lottery3">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>									  								
  								</td>
  							</tr>
  							<tr>
  								<td id="lottery4">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
  							</tr>
  							<tr>
  								<td id="lottery5">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>   								
  								</td>
  							</tr>
  							<tr>
  								<td id="lottery6">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>								
  								</td>
  							</tr>
  							<tr>
  								<td id="lottery7">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>								
  								</td>
  							</tr>
  							<tr>
  								<td id="lottery8">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>						
  								</td>
  							</tr>
						</table>
					</div>
				</div>

			</div>
			<!-- .container-fluid -->
		</div>
		<!-- #page-wrapper -->
	
	</div>
	<!-- #wrapper -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script>
	(function($){
		//取得資料
		//將findAll的資料以JSON格式取出，使用google的API來轉換
		$.getJSON('<c:url value="/game" />', {}, function(data){
			var games = data;
			//console.log(games);
		
			var lotteryId=0;
			$.each(games, function(index, game){
				//console.log(game);
					if("SU_H"==game.odds.oddType){
						winner=game.teamHome.teamName;
					}else{
						winner=game.teamAway.teamName;
					}
					$('#lottery'+lotteryId+'> div:eq(0)').append(game.gameNum+" "+game.ballType);				
					$('#lottery'+lotteryId+'> div:eq(1)').append(millisecondToDate(game.gameTime.iLocalMillis)+millisecondToTime(game.gameTime.iLocalMillis));
					$('#lottery'+lotteryId+'> div:eq(2)').append(game.teamAway.teamName+"vs"+game.teamHome.teamName);
					$('#lottery'+lotteryId+'> div:eq(3)').append(winner+'<button type="button" class="close" id=delBet"'+lotteryId+'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>');
					lotteryId++;					
				if(lotteryId>8){
					return false;
				}
			});			
			
			$('.close').click(function(){
				$(this).parent().parent().remove();
			});
		});  //end of getJSON
		
	})(jQuery);
</script>
</body>
</html>