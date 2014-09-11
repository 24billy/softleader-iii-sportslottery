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

<style>
	#game_list{
		position: relative;
	}
	.gametag{
		font-family:"微軟正黑體";
		margin:5px;
		padding:5px;
		color: #ffffff;
		float:left;
		position: absolute;
		width:220px;
	}
	.gametag *{
		transition: all 220ms ease;
	}
	.gametag:HOVER{
		box-shadow: inset 0px 0px 10px 0px #FFFFFF;
	}
	.gametag.primary{
		background: #428bca url(<c:url value="/images/bg-blueprint.png"/>);
	}
	.gametag.success{
		background: #5cb85c url(<c:url value="/images/bg-blueprint.png"/>);
	}
	.gametag.info{
		background: #5bc0de url(<c:url value="/images/bg-blueprint.png"/>);
	}
	.gametag.warning{
		background: #f0ad4e url(<c:url value="/images/bg-blueprint.png"/>);
	}
	.gametag.danger{
		background: #d9534f url(<c:url value="/images/bg-blueprint.png"/>);
	}
	
	.clickfield.clickable{
		cursor: pointer;
	}
	
	
	.detial{
		height: 0px;
		opacity: 0;
		visibility: hidden;
	}
	.detial.active{
		height: 324px;
		opacity: 1;
		visibility: visible;
	}
	.detial .btn-group-vertical{
		width:100%;
	}
	.detial .btn-group-vertical .btn{
		width:100%;
		margin: auto;
		box-shadow: 0;
	}
	
	.sample{
		display:none;
	}
</style>

</head>
<body>
	<div id="page-wrapper">
		<div class="container top20">
			<div class="row" id="game_list">
				<div id="gametagSample" class="well gametag sample">
					<div class="clickfield">
						<h4><strong name="gameTitle">No.101 亞洲職棒</strong></h4>
						<p class="text-left" name="teamAway">亞歷桑那響尾蛇</p>
						<p class="text-right" name="teamHome">科羅拉多落磯山</p>
					</div>
					<div class="detial">
						<div>不讓分:</div>
						<div class="btn-group-vertical btn-group-sm" data-toggle="buttons">
							<label id="labelSample1" class="btn btn-default">
								<input type="checkbox" id="checkSample1">
								<samp></samp>
								<samp style="float:right"></samp>
							</label>
							<label id="labelSample2" class="btn btn-default">
								<input type="checkbox" id="checkSample2">
								<samp></samp>
								<samp style="float:right"></samp>
							</label>
						</div>
						<br/>
						<div>讓分:</div>
						<div class="btn-group-vertical btn-group-sm" data-toggle="buttons">
							<label id="labelSample3" class="btn btn-default">
								<input type="checkbox" id="checkSample3">
								<samp></samp>
								<samp style="float:right"></samp>
							</label>
							<label id="labelSample4" class="btn btn-default">
								<input type="checkbox" id="checkSample4">
								<samp></samp>
								<samp style="float:right"></samp>
							</label>
						</div>
						<br/>
						<div>總分:</div>
						<div class="btn-group-vertical btn-group-sm" data-toggle="buttons">
							<label id="labelSample5" class="btn btn-default">
								<input type="checkbox" id="checkSample5">
								<samp></samp>
								<samp style="float:right"></samp>
							</label>
							<label id="labelSample6" class="btn btn-default">
								<input type="checkbox" id="checkSample6">
								<samp></samp>
								<samp style="float:right"></samp>
							</label>
						</div>
						<br/>
						<div>單雙:</div>
						<div class="btn-group-vertical btn-group-sm" data-toggle="buttons">
							<label id="labelSample7" class="btn btn-default">
								<input type="checkbox" id="checkSample7">
								<samp></samp>
								<samp style="float:right"></samp>
							</label>
							<label id="labelSample8" class="btn btn-default">
								<input type="checkbox" id="checkSample8">
								<samp></samp>
								<samp style="float:right"></samp>
							</label>
						</div>
					</div>
					<div class="clickfield">
						<h4 name="gameTime">10:20</h4>
					</div>
				</div>
			</div>
		</div>
	</div>
	


<script>
(function($){
	superRefresh();
})(jQuery);

function superRefresh(){
	(function($){
		
		gameTagTemp = $('#gametagSample').clone();
		gameTagTemp.removeAttr('id');
		gameTagTemp.removeClass('sample');

			var searchScopeStr = $('#searchScopeGroup input:checked').val();
			var queryScopeURI = "";
			switch(searchScopeStr) {
		    case 'near':
		    	queryScopeURI = '<c:url value="/game?method:selectNearDays" />';
		    	break;
		    case 'notEnd':
		    	queryScopeURI = '<c:url value="/game?method:selectNotEnd" />';
				break;
		    case 'All':
		    	queryScopeURI = '<c:url value="/game?method:select" />';
		    	break;
		    default:
		    	break;
			}
			
			userOddsCount = 0;
			$.ajax({
				url: '<c:url value="/game?method:select" />',
				type:'post',
				dataType:'json',
				data:{
					'complexBallType':$('#ballType').val()
				},
				success:function(datas){
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
					console.log(games);
					console.log('-----------');
					console.log(odds);
					console.log('-----------');

					var userOdds = [];

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
							
							//將games 與odds 輸出到index
							golbalInsert(games, odds);
							
							//生成動態磚
							var thisGame = gameTagTemp.clone();
							$('[name="gameTitle"]', thisGame).text(game.gameNum + ' ' + game.teamHome.leagueName);
							$('[name="teamAway"]', thisGame).text(game.teamAway.teamName);
							$('[name="teamHome"]', thisGame).text(game.teamHome.teamName);
							$('[name="gameTime"]', thisGame).text(game.date + ' ' + game.time);
							
							//生成動態磚內的投注選項
							if(sessionStorage.userOdds){
								userOdds = sessionStorage.userOdds.split(',');
								userOddsCount = userOdds.length;
							}
							
							var count = 0;			
							$.each(game.odds, function(index, odd){					
								var thisCheckbox = $('input:eq(' + count + ')', thisGame);
								var thislabel = $('label:eq(' + count + ')', thisGame);
								thisCheckbox.attr('id', 'cb' + odd.id);
								thislabel.attr('oddId', odd.id);
								thislabel.attr('for', 'cb' + odd.id);
								thislabel.attr('id', '');
								
								if(userOdds.indexOf(odd.id+"") != -1){
									thislabel.addClass('active');
								}
								
								//根據odd的類型來生成按鈕的標籤文字
								labelText = '';
								labelText += odd.labelText;

								labelText += '(' + odd.oddCombination + ')';
								$('samp:eq(0)', thislabel).text(labelText);
								$('samp:eq(1)', thislabel).text(odd.oddValue);
								
								count++;
							});
							
							if(game.isEnd){
								thisGame.addClass('warning');
							} else {
								thisGame.addClass('success');
								$('.clickfield', thisGame).addClass('clickable');
							}
							tagColorfn(thisGame);
							$('#game_list').prepend(thisGame);
						}
					});

					
					
					$('#game_list').shapeshift({
						enableDrag:false,
						enableCrossDrop: false,
					});
					
					//動態磚被按下時的情形
					$('#game_list .clickfield.clickable').on('click',function(){
						toggleHidden($(this).parent());
					});
					
					//投注按鈕被案下的情形
					$('#game_list .detial label').on('click',function(){
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

						var thisTag = $(this).parent().parent().parent();
						//依據投注狀況更換動態磚顏色
						var tagColor = function(){
							if($('.detial label.active', thisTag)[0]){
								thisTag.removeClass('success');
								thisTag.addClass('primary');
							} else {
								thisTag.removeClass('primary');
								thisTag.addClass('success');
							}
						}
						setTimeout(tagColor);
						
					});
					
					
				}//Ajax function
			});//Ajax
		//切換detial的顯示狀態 target為detial所在的父元素
		function toggleHidden(target){
			if($('.detial', target).hasClass('active')){
				$('.detial', target).removeClass('active');
			} else {
				$('.detial', target).addClass('active');
			}
			//使動態磚在改變大小的同時，動態改變其他動態磚的位置
			var timer = setInterval(function(){
				$('#game_list').shapeshift({
					enableDrag:false,
					enableCrossDrop: false,
				});
				},10);
			setTimeout(function(){clearInterval(timer);}, 300);
		}
		
		//依據投注狀況更換動態磚顏色
		function tagColorfn(target){
			if($('.detial label.active', target)[0]){
				target.removeClass('success');
				target.addClass('primary');
			} else {
				target.removeClass('primary');
				target.addClass('success');
			}
		}
		
	}(jQuery));
}//superRefresh
</script>
</body>
</html>