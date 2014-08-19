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
		
		$.getJSON('<c:url value="/odds" />', {}, function(data){
			var odds = data;
			
			var events = [];
			$.each(odds, function(index, odd){
				var event = new Object;
				if(events[odd.gameId.gameNum] != null){
					event = events[odd.gameId.gameNum];
				}
				
				event.id = odd.gameId.gameNum;
				event.millis = odd.gameId.gameTime.iLocalMillis;
				event.date = millisecondToDate(event.millis);
				event.time = millisecondToTime(event.millis);
				event.balltype = odd.gameId.ballType;
				event.leagueName = odd.gameId.leagueName;
				event.away = odd.gameId.teamAway.teamName;
				event.home = odd.gameId.teamHome.teamName;
				switch(odd.oddType) {
			    case 'SU_A':
			    	event.suA = odd.oddValue;
			    	event.suCom = odd.oddCombination;
			    	break;
			    case 'SU_H':
					event.suH = odd.oddValue;
					event.suCom = odd.oddCombination;
					break;
			    case 'ATS_A':
			    	event.atsA = odd.oddValue;
			    	event.atsCom = odd.oddCombination;
			    	break;
			    case 'ATS_H':
			    	event.atsH = odd.oddValue;
			    	event.atsCom = odd.oddCombination;
			    	break;
			    case 'SC_A':
			    	event.scA = odd.oddValue;
			    	event.scCom = odd.oddCombination;
			    	break;
			    case 'SC_H':
			    	event.scH = odd.oddValue;
			    	event.scCom = odd.oddCombination;
			    	break;
			    case 'ODD_A':
			    	event.oddA = odd.oddValue;
			    	event.oddCom = odd.oddCombination;
			    	break;
			    case 'ODD_H':
			    	event.oddH = odd.oddValue;
			    	event.oddCom = odd.oddCombination;
			    	break;
			    default:
			    	break;
			}
				events[event.id] = event;
			});
			
			console.log(events);
			
			$.each(events, function(index, event){
				if(event != null){
					if($('div.row[date="' + event.date + '"]').length > 0){
						$('div.row[date="' + event.date + '"] table').append(
								"<tr>"+
								"<td>" + event.id + "</td>"+
								"<td>" + event.time + "</td>"+
								"<td>" + event.away + "</td>"+
								"<td>" + event.suA + "</td>"+
								"<td>" + event.home + "</td>"+
								"<td>" + event.suH + "</td>"+
								"<tr>"
						);
					} else {
						var tempTag = $('#sample').clone();
						tempTag.attr('date', event.date);
						tempTag.attr('id', "");
						
						$('#event_board').append(tempTag);
						
						$('div.row[date="' + event.date + '"] h3').text(event.date);
						$('div.row[date="' + event.date + '"] table').append(
								"<tr>"+
								"<td>" + event.id + "</td>"+
								"<td>" + event.time + "</td>"+
								"<td>" + event.away + "</td>"+
								"<td>" + event.suA + "</td>"+
								"<td>" + event.home + "</td>"+
								"<td>" + event.suH + "</td>"+
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