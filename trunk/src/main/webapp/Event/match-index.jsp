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
	
	.trClick{
		cursor: pointer;
	}
	
	.btn{
		text-align: center;
		width: 250px;
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
	
			<div class="container-fluid" >
			
				<div class="row">
					<div class="col-lg-8"  id="event_board" >
						<div class="page-header">
							<h1>近期賽事</h1>
						</div>
						<div name="event_list" id="sample" date="">
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

					<div class="panel panel-primary  col-lg-4">
					  <div class="panel-heading ">
					  	<h6>投注區</h3>
					  </div>
						<!-- Nav tabs -->
						<ul class="nav nav-tabs" role="tablist" id="myTab">
							<li class="active"><a href="#single" role="tab"
								data-toggle="tab">單場</a></li>
							<li><a href="#pass" role="tab" data-toggle="tab">過關</a></li>
							<li><a href="#passCom" role="tab" data-toggle="tab">過關組合</a></li>
						</ul>
						<!-- Tab panes -->
						<table class="table table-striped  table-hover">
							<tr>
								<td id="lottery1" hidden="true" name="oddList">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
							</tr>
							<tr>
								<td id="lottery2" hidden="true" name="oddList">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
							</tr>
							<tr>
								<td id="lottery3" hidden="true" name="oddList">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
							</tr>
							<tr>
								<td id="lottery4" hidden="true" name="oddList">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
							</tr>
							<tr>
								<td id="lottery5" hidden="true" name="oddList">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
							</tr>
							<tr>
								<td id="lottery6" hidden="true" name="oddList">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
							</tr>
							<tr>
								<td id="lottery7" hidden="true" name="oddList">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
							</tr>
							<tr>
								<td id="lottery8" hidden="true" name="oddList">
									<div>編號:</div>
									<div>時間:</div>
									<div>隊伍:</div>
									<div class="bg-success">贏家:</div>
								</td>
							</tr>
							<tr>
								<td id="clearLottery" hidden="true">
									<div>
										<button id="clearbtn" type="button"
											class="btn btn-warning btn-xs">清除投注區</button>
									</div>
								</td>
							</tr>
						</table>
					</div>
					<!-- End of Lottery Panel   -->
					<div id="betBoard" hidden="true" class="panel panel-primary col-lg-4">
					  <!-- Tab panes -->
					  <div class="tab-content">
						<div class="tab-pane active" id="single">
					      <!-- Begin of Single Bet Panel -->
						  <div class="panel-body">
							<form class="form-inline" action="<c:url value="/lottery"/>">
								<div class="form-group ">
									<div style="display: inline-block" id="singleBet"></div>
									<div style="display: inline-block">個組合 每組合投注金額100元 X</div>
									<div style="display: inline-block">
										<input style="width: 40px" type="text" class="betValue" value="1">
									</div>
								</div>

								<div>
									<div style="width: 50%; display: inline-block" >總價</div>
									<div id="singleCapital" style=" display: inline-block"										 ></div>
								</div>
								<div>
									<div style="width: 50%; display: inline-block" >最高中獎金額</div>
									<div id="singleTopPrice" style=" display: inline-block"										></div>
								</div>
								<div class="lotteryOdds" hidden="true">
									<input type="text" class="capital" name="model.capital" value="">
									<input type="text" class="oddId1" name="oddsIdList.oddId1" value="">
									<input type="text" class="oddId2" name="oddsIdList.oddId2" value="">
									<input type="text" class="oddId3" name="oddsIdList.oddId3" value="">
									<input type="text" class="oddId4" name="oddsIdList.oddId4" value="">
									<input type="text" class="oddId5" name="oddsIdList.oddId5" value="">
									<input type="text" class="oddId6" name="oddsIdList.oddId6" value="">
									<input type="text" class="oddId7" name="oddsIdList.oddId7" value="">
									<input type="text" class="oddId8" name="oddsIdList.oddId8" value="">
									
								</div>
								<div>
									<button class="btn btn-danger btn-xs" type="submit">投注</button>
								</div>
							</form>
						  </div>
						  <!-- End of Bet Panel -->
						
						</div>
						<div class="tab-pane" id="pass"> 
						  <!-- Begin of Pass Bet Panel -->
						  <div class="panel-body">
							<form class="form-inline" action="<c:url value="/lottery"/>">
								<div class="form-group ">
									<div style="display: inline-block" id="passBet"></div>
									<div style="display: inline-block">個組合 每組合投注金額100元 X</div>
									<div style="display: inline-block">
										<input style="width: 40px" type="text" class="betValue" value="1">
									</div>
								</div>

								<div>
									<div style="width: 50%; display: inline-block" >總價</div>
									<div id="passCapital" style=" display: inline-block"										 ></div>
								</div>
								<div>
									<div style="width: 50%; display: inline-block" >最高中獎金額</div>
									<div id="passTopPrice" style=" display: inline-block"										></div>
								</div>
								<div class="lotteryOdds" hidden="true">
									<input type="text" class="capital" name="model.capital" value="">
									<input type="text" class="oddId1" name="oddsIdList.oddId1" value="">
									<input type="text" class="oddId2" name="oddsIdList.oddId2" value="">
									<input type="text" class="oddId3" name="oddsIdList.oddId3" value="">
									<input type="text" class="oddId4" name="oddsIdList.oddId4" value="">
									<input type="text" class="oddId5" name="oddsIdList.oddId5" value="">
									<input type="text" class="oddId6" name="oddsIdList.oddId6" value="">
									<input type="text" class="oddId7" name="oddsIdList.oddId7" value="">
									<input type="text" class="oddId8" name="oddsIdList.oddId8" value="">
								</div>
								<div>
									<button class="btn btn-danger btn-xs" type="submit">投注</button>
								</div>
							</form>
						  </div>
						  <!-- End of Bet Panel -->
						</div>
						<div class="tab-pane" id="passCom">
						  <!-- Begin of Combination Bet Panel -->
						  <div class="panel-body">
							<form class="form-inline" action="<c:url value="/lottery"/>">
								<div class="form-group ">
									<div style="display: inline-block" id="comBet"></div>
									<div style="display: inline-block">個組合 每組合投注金額100元 X</div>
									<div style="display: inline-block">
										<input style="width: 40px" type="text" class="betValue" value="1">
									</div>
								</div>

								<div>
									<div style="width: 50%; display: inline-block" >總價</div>
									<div id="comCapital" style=" display: inline-block" ></div>
								</div>
								<div>
									<div style="width: 50%; display: inline-block" >最高中獎金額</div>
									<div id="comTopPrice" style=" display: inline-block"></div>
								</div>
								<div class="lotteryOdds" hidden="true">
									<input type="text" class="capital" name="model.capital" value="">
									<input type="text" class="oddId1" name="oddsIdList.oddId1" value="">
									<input type="text" class="oddId2" name="oddsIdList.oddId2" value="">
									<input type="text" class="oddId3" name="oddsIdList.oddId3" value="">
									<input type="text" class="oddId4" name="oddsIdList.oddId4" value="">
									<input type="text" class="oddId5" name="oddsIdList.oddId5" value="">
									<input type="text" class="oddId6" name="oddsIdList.oddId6" value="">
									<input type="text" class="oddId7" name="oddsIdList.oddId7" value="">
									<input type="text" class="oddId8" name="oddsIdList.oddId8" value="">
								</div>
								<div>
									<button class="btn btn-danger btn-xs" type="submit">投注</button>
								</div>
							</form>
						  </div>
						  <!-- End of Bet Panel -->						
						</div>
					  </div>
						
					</div>
					
				</div>
				
			</div>
				
				<div id="dialog" class="modal fade">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
								<h4 class="modal-title">Basic dialog</h4>
							</div>
							<div class="modal-body">
							<ul name="checkbox_list" class="list-group">
								<li class="list-group-item">
									<span>不讓分</span>
									<div class="btn-group" data-toggle="buttons">
										<label id="labelSample1" class="btn btn-primary">
											<input type="checkbox" id="checkSample1">
											<samp></samp>
											<samp style="float:right"></samp>
										</label>
										<label id="labelSample2" class="btn btn-primary">
											<input type="checkbox" id="checkSample2">
											<samp></samp>
											<samp style="float:right"></samp>
										</label>
									</div>
								</li>
								<li class="list-group-item">
									<span>　讓分</span>
									<div class="btn-group" data-toggle="buttons">
										<label id="labelSample3" class="btn btn-primary">
											<input type="checkbox" id="checkSample3">
											<samp></samp>
											<samp style="float:right"></samp>
										</label>
										<label id="labelSample4" class="btn btn-primary">
											<input type="checkbox" id="checkSample4">
											<samp></samp>
											<samp style="float:right"></samp>
										</label>
									</div>
								</li>
								<li class="list-group-item">
									<span>　總分</span>
									<div class="btn-group" data-toggle="buttons">
										<label id="labelSample5" class="btn btn-primary">
											<input type="checkbox" id="checkSample5">
											<samp></samp>
											<samp style="float:right"></samp>
										</label>
										<label id="labelSample6" class="btn btn-primary">
											<input type="checkbox" id="checkSample6">
											<samp></samp>
											<samp style="float:right"></samp>
										</label>
									</div>
								</li>
								<li class="list-group-item">
									<span>　單雙</span>
									<div class="btn-group" data-toggle="buttons">
										<label id="labelSample7" class="btn btn-primary">
											<input type="checkbox" id="checkSample7">
											<samp></samp>
											<samp style="float:right"></samp>
										</label>
										<label id="labelSample8" class="btn btn-primary">
											<input type="checkbox" id="checkSample8">
											<samp></samp>
											<samp style="float:right"></samp>
										</label>
									</div>
								</li>
							</ul>
						</div><!-- /.modal-content -->
					</div><!-- /.modal-dialog -->
				</div><!-- /.modal -->
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
		
		var userOddsCount = 0;
		
		//以AJAX讀數資料
		$.getJSON('<c:url value="/game?method:select" />', {}, function(datas){
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
			console.log("games="+games);
			console.log('-----------');
			console.log("odds="+odds);
			console.log('-----------');
			//此段作備忘用 無意義

				
			
			//game資料進一步處理 將odds中的資料往上提方便後續使用
			$.each(games, function(index, game){
				if(game != null){
					game.iMillis = game.gameTime.iLocalMillis;
					game.date = millisecondToDate(game.iMillis);
					game.time = millisecondToTime(game.iMillis);
					//根據odd的內容來建立game的屬性

					$.each(game.odds, function(index, odd){
						odd.gameNum = game.gameNum;
						switch(odd.oddType) {
					    case 'SU_A':
					    	game.suA = odd.oddValue;
					    	game.suACom = odd.oddCombination;
					    	odd.labelText = game.teamAway.teamName;
					    	break;
					    case 'SU_H':
					    	game.suH = odd.oddValue;
					    	game.suHCom = odd.oddCombination;
					    	odd.labelText = game.teamHome.teamName;
							break;
					    case 'ATS_A':
					    	game.atsA = odd.oddValue;
					    	game.atsACom = odd.oddCombination;
					    	odd.labelText = game.teamAway.teamName;
					    	break;
					    case 'ATS_H':
					    	game.atsH = odd.oddValue;
					    	game.atsHCom = odd.oddCombination;
					    	odd.labelText = game.teamHome.teamName;
					    	break;
					    case 'SC_H':
					    	game.scH = odd.oddValue;
					    	game.scCom = odd.oddCombination;
					    	odd.labelText = "總分合大於";
					    	break;
					    case 'SC_L':
					    	game.scL = odd.oddValue;
					    	game.scCom = odd.oddCombination;
					    	odd.labelText = "總分合小於";
					    	break;
					    case 'ODD':
					    	game.oeOdd = odd.oddValue;
					    	game.oeCom = odd.oddCombination;
					    	odd.labelText = "總分合為單數";
					    	break;
					    case 'EVEN':
					    	game.oeEven = odd.oddValue;
					    	game.oeCom = odd.oddCombination;
					    	odd.labelText = "總分合為偶數";
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
						if($('div[name = "event_list"][date="' + game.date + '"]').length > 0){
							$('div[name = "event_list"][date="' + game.date + '"] table').append(
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
							
							$('div[name = "event_list"][date="' + game.date + '"] h3').text(game.date);
							$('div[name = "event_list"][date="' + game.date + '"] table').append(
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
				$('div[name="dialogToggle"]').remove();
				//如果session存在,則取得使用者的臨時下注紀錄
				var userOdds = [];
				if(sessionStorage.userOdds){
					userOdds = sessionStorage.userOdds.split(',');
					userOddsCount = userOdds.length;
					console.log(userOddsCount);
				}
				
				//從已存在的dialog複製出新的物件
				var tempDialog = $('#dialog').clone();		
				
				//設定dialog的詳細內容(所有玩法的按鈕,以及按鈕上的文字)
				var thisGame = games[$(this).attr('gameId')];
				$('h4.modal-title', tempDialog).text('[No.' + $(this).attr('gameId') + ']   ' + thisGame.teamAway.teamName + ' VS ' + thisGame.teamHome.teamName);
				tempDialog.removeAttr('id');
				tempDialog.attr('name', 'dialogToggle');
				
				var count = 0;			
				$.each(thisGame.odds, function(index, odd){					
					thisCheckbox = $('input:eq(' + count + ')', tempDialog);
					thislabel = $('label:eq(' + count + ')', tempDialog);
					thisCheckbox.attr('id', 'cb' + odd.id);
					thislabel.attr('oddId', odd.id);
					thislabel.attr('for', 'cb' + odd.id);
					thislabel.attr('id', '');
					
					if(userOdds.indexOf(odd.id+"") != -1){
						console.log('found!');
						thislabel.addClass('active');
					}
					
					//根據odd的類型來生成按鈕的標籤文字
					labelText = '';
					labelText += odd.labelText;
					
					
					labelText += '(' + odd.oddCombination + ')';
					$('samp:eq(0)', thislabel).text(labelText);
					$('samp:eq(1)', thislabel).text('賠率:' + odd.oddValue);
					
					count++;
				});
				//套用JQuery UI的效果
				$('input',tempDialog).button();
				$('#event_board').append(tempDialog);
				
				//套用Bootstrap效果
				$('div[name="dialogToggle"]').modal();
				//$('div[name="dialogToggle"]').on('hidden.bs.modal', function (e) {
				//});
				
				//點選按鈕的情形,將結果以字串陣列的模式輸入到session,key為userOdds
				//!注意! session無法直接儲存陣列,只能存為字串,因此取出時需要依賴split(',')來取出成陣列
				$('label',tempDialog).click(function(){
					if(sessionStorage.userOdds){
						userOdds = sessionStorage.userOdds.split(',');
						userOddsCount = userOdds.length;
					} else {
						userOddsCount = 0;
					}
					if(!$(this).hasClass('active')){
						userOddsCount++;
						if(userOddsCount>8){
							$(this).addClass('active');
							userOddsCount--;
							//alert('下注超過八個');
						} else {
							userOdds.push($(this).attr('oddId'));	
						}
					} else {
						userOdds.splice(userOdds.indexOf($(this).attr('oddId')),1);
						userOddsCount--;
					}
					sessionStorage.userOdds = userOdds;
					odds_refresh();
				});
			});
			odds_refresh();
			//-----------------------------------------------------
			//投注區更新
			function odds_refresh(){
				
				//取出投注
				var userOddIds = [];
				if(sessionStorage.userOdds){
					userOddIds  = sessionStorage.userOdds.split(',');
				}
				console.log("userOddIds:"+userOddIds);

				//顯示投注區
				var lotteryId=1;
				var gameIsSelect=[];
				var combination=true;
				//投注的本金計錄；最高中獎金額紀錄
				var capitalValue=100;
				var singlePrice=0;
				var passPrice=1;
				
				$.each(userOddIds, function(index, userOddId){
					//判斷是否有重覆選取同一賽事			
					var oddGameNum=odds[userOddId].gameNum;
					if(gameIsSelect[oddGameNum]!=-1 && gameIsSelect[oddGameNum]!=oddGameNum){
						gameIsSelect[oddGameNum]=oddGameNum;
					
					}else{
						gameIsSelect[oddGameNum]=-1;
						combination=false;
					}
					
					var oddType=odds[userOddId].labelText;
					var oddValue=odds[userOddId].oddValue;
					//調整最高中獎金額
					singlePrice=singlePrice+oddValue;
					passPrice=passPrice*oddValue;
					var bet = games[odds[userOddId].gameNum];
						$('#lottery'+lotteryId).attr("hidden",false);
						$('#lottery'+lotteryId+'> div:eq(0)').html("編號:"+bet.gameNum+" "+bet.ballType);				
						$('#lottery'+lotteryId+'> div:eq(1)').html("時間:"+millisecondToDate(bet.gameTime.iLocalMillis)+millisecondToTime(bet.gameTime.iLocalMillis));
						$('#lottery'+lotteryId+'> div:eq(2)').html("隊伍:"+bet.teamAway.teamName+"vs"+bet.teamHome.teamName);
						$('#lottery'+lotteryId+'> div:eq(3)').html(oddType+'<span">'+oddValue+'</span>'+'<button oddId="'+(lotteryId-1)+'" type="button" class="close" lotteryId="'+lotteryId+'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>');
						
					//加入odd至投注form中
					    $('.oddId'+lotteryId).val(userOddId);
					lotteryId++;
				});
				//更新過關組合類型與計算金額
				console.log("combination:"+combination);
				//過關總投注金、最高中獎金額
				$('#passBet').html(1);
				$('#passCapital').html($('.betValue').attr("value")*capitalValue+"元");
				$('#passTopPrice').html(Math.floor(passPrice*100)+"元");
				
				
				//單場總投注金、最高中獎金額
				$('#singleBet').html(userOddIds.length);
				$('#singleCapital').html((userOddIds.length)*$('.betValue').attr("value")*capitalValue+"元");
				$('#singleTopPrice').html(Math.floor(singlePrice*100)+"元");
				
				//每一注投注金計算
				$('.capital').val((userOddIds.length)*$('.betValue').attr("value")*capitalValue);
				if((userOddIds.length>=2)&&combination){
					//過關
					$('#myTab li:eq(1) a').tab('show');
					$('#myTab li:eq(1) a').off('click');
					$('#myTab li:eq(2) a').off('click');
				}
				else{
					//單場
					$('#myTab li:eq(0) a').tab('show');
					//若同一場賽事過關或過關組合僅能選擇一種遊戲玩法，凍結過關與過關組合
					$('#myTab li:eq(1) a').on('click',function(){
						return false;
					});
					$('#myTab li:eq(2) a').on('click',function(){
						return false;
					});
				}
				
				//隱藏未投注的投注區，未投注的值設定為空值
				while(lotteryId<=8){
					$('#lottery'+lotteryId).attr("hidden",true);
					$('.oddId'+lotteryId).val("");
					lotteryId++;
					
				}
				//刪除指定投注
				$('td[name="oddList"] .close').click(function(){
					userOddIds.splice(userOddIds.indexOf($(this).attr('lotteryId')),1);
					sessionStorage.userOdds = userOddIds;
					$(this).parent().parent().parent().attr("hidden",true);	
					odds_refresh();
				});

				if (userOddIds!=""){
					//有投注時才顯示投注區
					$('#betBoard').attr("hidden",false);
					$('#clearLottery').attr("hidden",false);

				}
				else{
					//沒有投注時才隱藏投注區
					$('#betBoard').attr("hidden",true);
					$('#clearLottery').attr("hidden",true);
				}
				
				//清除投注區
				$('#clearbtn').click(function(){
					sessionStorage.userOdds="";
					odds_refresh();
				});
			}

		});
		
		
	})(jQuery);
</script>
</body>
</html>