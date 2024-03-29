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
<link rel="stylesheet" href="<c:url value="/css/admin-style.css"/>">
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
					</div>
					
					<div class="col-lg-4">
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist" id="myTab">
							<li class="active"><a href="#single" role="tab"
								data-toggle="tab">單場</a></li>
							<li><a href="#pass" role="tab" data-toggle="tab">過關</a></li>
							<li><a href="#passCom" role="tab" data-toggle="tab">過關組合</a></li>
						</ul>

						<!-- Tab panes -->
						<div class="tab-content">
							<div class="tab-pane active" id="single">單場</div>
							<div class="tab-pane" id="pass">過關</div>
							<div class="tab-pane" id="passCom">過關組合</div>

						</div>
					</div>
				</div>
<script >
	
</script>				

				
				
				
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
		
		//以AJAX讀數資料
		$.getJSON('<c:url value="/game" />', {}, function(datas){
			var games = [];
			var odds = [];
			//根據gameId與oddId分配出game陣列與odd陣列方便後續使用
			$.each(datas, function(index, data){
				games[data.gameNum] = data;
				$.each(data.odds, function(index, odd){
					odds[odd.id] = odd;
				});
			});
			
			//debug用
			//console.log(games);
			//console.log('-----------');
			//console.log(odds);
			
			//此段作備忘用 無意義
			//var userOddIds = sessionStorage.userOdds.split(',');
			//$.each(userOddIds, function(index, userOddId){
			//	games[odds[userOddId].gameId];
			//	odds[userOddId];
			//});
				
			
			//game資料進一步處理 將odds中的資料往上提方便後續使用
			$.each(games, function(index, game){
				if(game != null){
					game.iMillis = game.gameTime.iLocalMillis
					game.date = millisecondToDate(game.iMillis);
					game.time = millisecondToTime(game.iMillis);
					
					//根據odd的內容來建立game的屬性
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
					//主隊與客隊的標籤上的span是彈出式的說明字串
					if(game != null){
						//當該日期已存在的情況下，直接加入
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
						//日期不存在的情況下，新增日期標籤，並加入在後續
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
			//畫面生成完畢後 進行JQuery UI及BootStrap效果套用
			$('span').popover({trigger: 'hover'});
			
			//點選建立dialog的處理
			$('.trClick').click(function(){
				//如果session存在,則取得使用者的臨時下注紀錄
				var userOdds = [];
				if(sessionStorage.userOdds){
					userOdds = sessionStorage.userOdds.split(',');
				}
				
				//從已存在的dialog複製出新的物件
				var tempDialog = $('#dialog').clone();
				tempDialog.attr('title', '賽事編號 ' + $(this).attr('gameId'));
				tempDialog.attr('id', '');
				tempDialog.attr('name', 'dialogToggle');
				
				//設定dialog的詳細內容(所有玩法的按鈕,以及按鈕上的文字)
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
					
					//根據odd的類型來生成按鈕的標籤文字
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
				//套用JQuery UI的效果
				$('input',tempDialog).button();
				$('#event_board').append(tempDialog);
				
				//右上角X的作用模式(刪除此dialog)
				$('div[name="dialogToggle"]').dialog({
					width: 700,
					modal: true,
					close: function() {
						$(this).remove();
					}
				});
				
				//點選按鈕的情形,將結果以字串陣列的模式輸入到session,key為userOdds
				//!注意! session無法直接儲存陣列,只能存為字串,因此取出時需要依賴split(',')來取出成陣列
				$('input',tempDialog).click(function(){
					if($(this).prop('checked')){
						userOdds.push($(this).attr('oddId'));	
					} else {
						userOdds.splice(userOdds.indexOf($(this).attr('oddId')),1);
					}
					sessionStorage.userOdds = userOdds;
				});
			});

			$('.close').click(function(){
				$(this).parent().parent().remove();
			});
			
		});


		
		$('#myTab a:last').tab('show'); 


		
	})(jQuery);
</script>

</body>
</html>