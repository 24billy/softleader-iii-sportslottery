<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/Admin/css/admin-style.css"/>">
<style>
	#sample{
		display:none;
	}
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
				<a class="navbar-brand" href="<c:url value="/Event/match-index.jsp"/>">Sports Lottery</a>
			</div>
			
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav side-nav">
					<li class="active">
						<a href="javascript:;" data-toggle="collapse" data-target="#match-manager"><i class="fa fa-fw fa-list"></i> 賽事投注<i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="match-manager" class="collapse">
							<li class="open">
								<a href="<c:url value="/Event/match-index.jsp"/>"><i class="fa fa-fw fa-bars"></i> 近期賽事</a>
							</li>
							<li>
								<a href="<c:url value="/Event/match-events.jsp"/>"><i class="fa fa-fw fa-table"></i> 全部賽事</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- .navbar-collapse -->
		</nav>
		
		<div id="page-wrapper">
		
			<div class="container-fluid" id="event_board">
			
				<div class="row">
					<div class="col-lg-9">
						<h1 class="page-header">
							近期賽事
						</h1>
					</div>
					
					<div class="col-lg-3">
						<h1 class="page-header">
							投注區
						</h1>
					</div>
				</div>
				
				<div class="row" name="event_list" id="sample" date="">
					<div class="col-lg-9">
						<h3>2014年4月20日</h3>
						<table class="table table-striped table-hover">
							<tr>
								<th width="100px">賽事編號</th>
								<th width="100px">比賽時間</th>
								<th width="200px">客場對伍</th>
								<th width="50px"></th>
								<th width="200px">主場隊伍</th>
								<th width="50px"></th>
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
<script src="<c:url value="/js/misc.js"/>"></script>
<script>
	(function($) {
		$('#match-manager').collapse();
		
		$.getJSON('<c:url value="/game" />', {}, function(data){
			var games = data;
			console.log(games);
			
			$.each(games, function(index, game){
				game.iMillis = game.gameTime.iLocalMillis
				game.date = millisecondToDate(game.iMillis);
				game.time = millisecondToTime(game.iMillis);
				
				$.each(game.odds, function(index, odd){
					switch(odd.oddType) {
				    case 'SU_A':
				    	game.suA = odd.oddValue;
				    	game.suCom = odd.oddCombination;
				    	break;
				    case 'SU_H':
				    	game.suH = odd.oddValue;
				    	game.suCom = odd.oddCombination;
						break;
				    case 'ATS_A':
				    	game.atsA = odd.oddValue;
				    	game.atsCom = odd.oddCombination;
				    	break;
				    case 'ATS_H':
				    	game.atsH = odd.oddValue;
				    	game.atsCom = odd.oddCombination;
				    	break;
				    case 'SC_A':
				    	game.scA = odd.oddValue;
				    	game.scCom = odd.oddCombination;
				    	break;
				    case 'SC_H':
				    	game.scH = odd.oddValue;
				    	game.scCom = odd.oddCombination;
				    	break;
				    case 'ODD_A':
				    	game.oddA = odd.oddValue;
				    	game.oddCom = odd.oddCombination;
				    	break;
				    case 'ODD_H':
				    	game.oddH = odd.oddValue;
				    	game.oddCom = odd.oddCombination;
				    	break;
				    default:
				    	break;
					}	
				});
				
				if(game != null){
					if($('div.row[date="' + game.date + '"]').length > 0){
						$('div.row[date="' + game.date + '"] table').append(
								"<tr>"+
								"<td>" + game.gameNum + "</td>"+
								"<td>" + game.time + "</td>"+
								"<td>" + game.teamAway.teamName + "</td>"+
								"<td>" + game.suA + "</td>"+
								"<td>" + game.teamHome.teamName + "</td>"+
								"<td>" + game.suH + "</td>"+
								"<tr>"
						);
					} else {
						var tempTag = $('#sample').clone();
						tempTag.attr('date', game.date);
						tempTag.attr('id', "");
						
						$('#event_board').append(tempTag);
						
						$('div.row[date="' + game.date + '"] h3').text(game.date);
						$('div.row[date="' + game.date + '"] table').append(
								"<tr>"+
								"<td>" + game.gameNum + "</td>"+
								"<td>" + game.time + "</td>"+
								"<td>" + game.teamAway.teamName + "</td>"+
								"<td>" + game.suA + "</td>"+
								"<td>" + game.teamHome.teamName + "</td>"+
								"<td>" + game.suH + "</td>"+
								"<tr>"
						);
					}
				}
			});
			
			
		});

	})(jQuery);
</script>
</body>
</html>