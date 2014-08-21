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
<link rel="stylesheet" href="https://code.jquery.com/ui/1.11.0-beta.2/themes/smoothness/jquery-ui.css" />
<style>
	#sample{
		display:none;
	}
	
	#dialog{
		display:none;
	}
	
	.noneDisplay{
		display:none;
	}
	
	ul[name='checkbox_list']{
		text-align: center;
	}
	
	ul[name='checkbox_list'] label{
		margin:auto;
		width:250px;
		text-align: left;
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
					<div class="col-lg-8">
						<h1 class="page-header">
							近期賽事
						</h1>
					</div>
					
					<div class="col-lg-4">
						<h1 class="page-header">
							投注區
						</h1>
					</div>
				</div>
				
				<div class="row" name="event_list" id="sample" date="">
					<div class="col-lg-8">
						<h3>2014年4月20日</h3>
						<table class="table table-hover">
							<tr class="info">
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
				
				<div id="dialog" title="Basic dialog">
					<div class="panel panel-default">
						<ul name="checkbox_list" class="list-group">
							<li class="list-group-item">
								<span>不讓分</span>
								<input type="checkbox" id="checkSample1">
								<label id="labelSample1" for="checkSample1">
									<samp></samp>
									<samp style="float:right"></samp>
								</label>
								<input type="checkbox" id="checkSample2">
								<label id="labelSample2" for="checkSample2">
									<samp></samp>
									<samp style="float:right"></samp>
								</label>
							</li>
							<li class="list-group-item">
								<span>　讓分</span>
								<input type="checkbox" id="checkSample3">
								<label id="labelSample3" for="checkSample3">
									<samp></samp>
									<samp style="float:right"></samp>
								</label>
								<input type="checkbox" id="checkSample4">
								<label id="labelSample4" for="checkSample4">
									<samp></samp>
									<samp style="float:right"></samp>
								</label>
							</li>
							<li class="list-group-item">
								<span>　總分</span>
								<input type="checkbox" id="checkSample5">
								<label id="labelSample5" for="checkSample5">
									<samp></samp>
									<samp style="float:right"></samp>
								</label>
								<input type="checkbox" id="checkSample6">
								<label id="labelSample6" for="checkSample6">
									<samp></samp>
									<samp style="float:right"></samp>
								</label>
							</li>
							<li class="list-group-item">
								<span>　單雙</span>
								<input type="checkbox" id="checkSample7">
								<label id="labelSample7" for="checkSample7">
									<samp></samp>
									<samp style="float:right"></samp>
								</label>
								<input type="checkbox" id="checkSample8">
								<label id="labelSample8" for="checkSample8">
									<samp></samp>
									<samp style="float:right"></samp>
								</label>
							</li>
						</ul>
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
<script src="https://code.jquery.com/ui/1.11.0-beta.2/jquery-ui.js"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script>
	(function($) {
		$('#match-manager').collapse();
		
		$.getJSON('<c:url value="/game" />', {}, function(datas){
			var games = [];
			var odds = [];
			$.each(datas, function(index, data){
				games[data.gameNum] = data;
				$.each(data.odds, function(index, odd){
					odds[odd.id] = odd;
				});
			});
			console.log(games);
			console.log('-----------');
			console.log(odds);
			
			//var userOddIds = sessionStorage.userOdds.split(',');
			//$.each(userOddIds, function(index, userOddId){
			//	games[odds[userOddId].gameId];
			//	odds[userOddId];
			//});
				
			
			//資料處理
			$.each(games, function(index, game){
				if(game != null){
					game.iMillis = game.gameTime.iLocalMillis
					game.date = millisecondToDate(game.iMillis);
					game.time = millisecondToTime(game.iMillis);
					
					$.each(game.odds, function(index, odd){
						switch(odd.oddType) {
					    case 'SU_A':
					    	game.suA = odd.oddValue;
					    	game.suACom = odd.oddCombination;
					    	break;
					    case 'SU_H':
					    	game.suH = odd.oddValue;
					    	game.suHCom = odd.oddCombination;
							break;
					    case 'ATS_A':
					    	game.atsA = odd.oddValue;
					    	game.atsACom = odd.oddCombination;
					    	break;
					    case 'ATS_H':
					    	game.atsH = odd.oddValue;
					    	game.atsHCom = odd.oddCombination;
					    	break;
					    case 'SC_H':
					    	game.scH = odd.oddValue;
					    	game.scCom = odd.oddCombination;
					    	break;
					    case 'SC_L':
					    	game.scL = odd.oddValue;
					    	game.scCom = odd.oddCombination;
					    	break;
					    case 'ODD':
					    	game.oeOdd = odd.oddValue;
					    	game.oeCom = odd.oddCombination;
					    	break;
					    case 'EVEN':
					    	game.oeEven = odd.oddValue;
					    	game.oeCom = odd.oddCombination;
					    	break;
					    default:
					    	break;
						}	
						game.detialHome = "不讓分:" + game.suHCom  + " 賠率:" + game.suH + "/讓分:" + game.atsHCom + " 賠率:" + game.atsH;
						game.detialAway = "不讓分:" + game.suACom  + " 賠率:" + game.suA + "/讓分:" + game.atsACom + " 賠率:" + game.atsA;
					});
				
					//生成畫面
					if(game != null){
						
						
						if($('div.row[date="' + game.date + '"]').length > 0){
							$('div.row[date="' + game.date + '"] table').append(
									"<tr class='trClick' gameId=" + game.gameNum + ">"+
									"<td>" + game.gameNum + "</td>"+
									"<td>" + game.time + "</td>"+
									"<td><span data-toggle='popover' data-placement='top' data-content='" + game.detialAway + "'>" + game.teamAway.teamName + "</span></td>"+
									"<td>" + game.suA + "</td>"+
									"<td><span data-toggle='popover' data-placement='top' data-content='" + game.detialHome + "'>" + game.teamHome.teamName + "</span></td>"+
									"<td>" + game.suH + "</td>"+
									"<tr>"
							);
						} else {
							var tempTag = $('#sample').clone();
							tempTag.attr('date', game.date);
							tempTag.attr('id', '');
							
							$('#event_board').append(tempTag);
							
							$('div.row[date="' + game.date + '"] h3').text(game.date);
							$('div.row[date="' + game.date + '"] table').append(
									"<tr class='trClick' gameId=" + game.gameNum + ">"+
									"<td>" + game.gameNum + "</td>"+
									"<td>" + game.time + "</td>"+
									"<td><span data-toggle='popover' data-placement='top' data-content='" + game.detialAway + "'>" + game.teamAway.teamName + "</span></td>"+
									"<td>" + game.suA + "</td>"+
									"<td><span data-toggle='popover' data-placement='top' data-content='" + game.detialHome + "'>" + game.teamHome.teamName + "</span></td>"+
									"<td>" + game.suH + "</td>"+
									"<tr>"
							);
						}
					}
				}
			});
			//JQuery UI及BootStrap效果套用
			$('span').popover({trigger: 'hover'});
			
			//點選建立dialog的處理
			$('.trClick').click(function(){
				var userOdds = [];
				if(sessionStorage.userOdds){
					userOdds = sessionStorage.userOdds.split(',');
				}
				
				var tempDialog = $('#dialog').clone();
				tempDialog.attr('title', '賽事編號 ' + $(this).attr('gameId'));
				tempDialog.attr('id', '');
				tempDialog.attr('name', 'dialogToggle');
				//tempDialog.text('測試');
				
				var thisGame = games[$(this).attr('gameId')];
				var count = 0;			
				$.each(thisGame.odds, function(index, odd){					
					thisCheckbox = $('input:eq(' + count + ')', tempDialog);
					thislabel = $('label:eq(' + count + ')', tempDialog);
					thisCheckbox.attr('id', 'cb' + odd.id);
					thisCheckbox.attr('oddId', odd.id);
					thislabel.attr('for', 'cb' + odd.id);
					thislabel.attr('id', '');
					
					if(userOdds.indexOf(odd.id+"") != -1){
						console.log('found!');
						thisCheckbox.prop('checked', true);
					}
					
					
					labelText = '';
					switch(odd.oddType) {
				    case 'SU_A':
				    	labelText += thisGame.teamAway.teamName;
				    	break;
				    case 'SU_H':
				    	labelText += thisGame.teamHome.teamName;
						break;
				    case 'ATS_A':
				    	labelText += thisGame.teamAway.teamName;
				    	break;
				    case 'ATS_H':
				    	labelText += thisGame.teamHome.teamName;
				    	break;
				    case 'SC_H':
				    	labelText += "總分合大於";
				    	break;
				    case 'SC_L':
				    	labelText += "總分合小於";
				    	break;
				    case 'ODD':
				    	labelText += "總分合為單數";
				    	break;
				    case 'EVEN':
				    	labelText += "總分合為偶數";
				    	break;
				    default:
				    	break;
					}
					
					labelText += '(' + odd.oddCombination + ')';
					$('samp:eq(0)', thislabel).text(labelText);
					$('samp:eq(1)', thislabel).text('賠率:' + odd.oddValue);
					
					count++;
				});
				$('input',tempDialog).button();
				$('#event_board').append(tempDialog);
				$('div[name="dialogToggle"]').dialog({
					width: 700,
					modal: true,
					close: function() {
						$(this).remove();
					}
				});
				
				$('input',tempDialog).click(function(){
					if($(this).prop('checked')){
						userOdds.push($(this).attr('oddId'));	
					} else {
						userOdds.splice(userOdds.indexOf($(this).attr('oddId')),1);
					}
					sessionStorage.userOdds = userOdds;
				});
			});
		});
		
		
	})(jQuery);
</script>
</body>
</html>