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
		width:240px;
	}
	.gametag *{
		transition: all 220ms ease;
	}
	.gametag:HOVER{
		box-shadow: inset 0px 0px 10px 0px #000000;
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
	.gametag.unable{
		background: #777777 url(<c:url value="/images/bg-blueprint.png"/>);
	}
	.gametag.resulted{
		background: rgba(217,83,79,0.7) url(<c:url value="/images/bg-blueprint.png"/>);
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
		height: 320px;
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
	
	#noGameResult{
		margin: 20px 5px;
	}
	
	#loader{
		position:absolute;
		height: 300px;
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
		top: 50%;
		margin-top: -32px;
		left: 50%;
		margin-left: -32px;
		display: none;
	}
	
	.width80{
		width:80%;
	}
</style>

<style>
.spinner {
  -webkit-animation: rotator 1.4s linear infinite;
          animation: rotator 1.4s linear infinite;
}

@-webkit-keyframes rotator {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(270deg);
            transform: rotate(270deg);
  }
}

@keyframes rotator {
  0% {
    -webkit-transform: rotate(0deg);
            transform: rotate(0deg);
  }
  100% {
    -webkit-transform: rotate(270deg);
            transform: rotate(270deg);
  }
}
.path {
  stroke-dasharray: 187;
  stroke-dashoffset: 0;
  -webkit-transform-origin: center;
      -ms-transform-origin: center;
          transform-origin: center;
  -webkit-animation: dash 1.4s ease-in-out infinite, colors 5.6s ease-in-out infinite;
          animation: dash 1.4s ease-in-out infinite, colors 5.6s ease-in-out infinite;
}

@-webkit-keyframes colors {
  0% {
    stroke: #4285F4;
  }
  25% {
    stroke: #DE3E35;
  }
  50% {
    stroke: #F7C223;
  }
  75% {
    stroke: #1B9A59;
  }
  100% {
    stroke: #4285F4;
  }
}

@keyframes colors {
  0% {
    stroke: #4285F4;
  }
  25% {
    stroke: #DE3E35;
  }
  50% {
    stroke: #F7C223;
  }
  75% {
    stroke: #1B9A59;
  }
  100% {
    stroke: #4285F4;
  }
}
@-webkit-keyframes dash {
  0% {
    stroke-dashoffset: 187;
  }
  50% {
    stroke-dashoffset: 46.75;
    -webkit-transform: rotate(135deg);
            transform: rotate(135deg);
  }
  100% {
    stroke-dashoffset: 187;
    -webkit-transform: rotate(450deg);
            transform: rotate(450deg);
  }
}
@keyframes dash {
  0% {
    stroke-dashoffset: 187;
  }
  50% {
    stroke-dashoffset: 46.75;
    -webkit-transform: rotate(135deg);
            transform: rotate(135deg);
  }
  100% {
    stroke-dashoffset: 187;
    -webkit-transform: rotate(450deg);
            transform: rotate(450deg);
  }
}
</style>

</head>
<body>
	<div id="page-wrapper">
		<div class="container-fluid top20 width80">
			<div class="row" id="loader">
				<svg class="spinner" width="65px" height="65px" viewBox="0 0 66 66" xmlns="http://www.w3.org/2000/svg">
				   <circle class="path" fill="none" stroke-width="6" stroke-linecap="round" cx="33" cy="33" r="30"></circle>
				</svg>
			</div>
			<div class="row" id="game_form">
				<form role="form" class="form-inline pull-left" >
					<select class="form-control form-ball-type" id="ballType" >
						<option value="Baseball">棒球</option>
						<option value="Basketball">籃球</option>
						<option value="Basketball">足球</option>
					</select>
					<a href="#" role="button" class="btn btn-default" id="today" >回到今日</a>
					<div id="searchScopeGroup" class="btn-group" data-toggle="buttons" >
						<a href="#" role="button" class="btn btn-success" name="searchScope" data-toggle="button">
							<span class="glyphicon glyphicon-backward"></span>
						</a>
						<a href="#" role="button" class="btn btn-success" name="searchScope" data-toggle="button">
							<span id="searchPreview"></span><span class="glyphicon glyphicon-chevron-left"></span>
						</a>
						<a href="#" role="button" class="btn btn-default active" id="searchScopeDefault" name="searchScope" data-toggle="button" >
							<span id="searchDefault" >當日</span>
						</a>
						<a href="#" role="button" class="btn btn-success" name="searchScope" data-toggle="button">
							<span id="searchNextview"></span><span class="glyphicon glyphicon-chevron-right"></span>
						</a>
						<a href="#" role="button" class="btn btn-success" name="searchScope" data-toggle="button">
							<span class="glyphicon glyphicon-forward"></span>
						</a>
					</div>
				</form>
			</div>
			<div class="alert alert-warning" id="noGameResult" role="alert"><span class="glyphicon glyphicon-remove-sign"><strong>尚無賽事資料</strong></span></div>
			<div class="row" id="game_list">
				<div id="gametagSample" class="well gametag sample">
					<div class="clickfield">
						<h4 style="display:inline-block;"><strong name="gameTitle">No.101 亞洲職棒</strong>
							<h6 style="display:inline-block;" id="gameMark" class="glyphicon pull-right"></h6>
						</h4>
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

<script src="<c:url value="/js/jquery.shapeshift.min.js"/>"></script>
<script src="<c:url value="/js/jquery-dateFormat.min.js"/>"></script>

<script>

//生成動態磚
function gameRefresh(games, odds){
	//初始化gameList
	var gameTagSample = $('#gametagSample').clone();
	$('#game_list').html('');
	$('#game_list').prepend(gameTagSample);
	
	var userOdds = [];
	if(sessionStorage.userOdds){
		userOdds = sessionStorage.userOdds.split(',');
		userOddsCount = userOdds.length;
	}
	var userOddInfo = sessionStorage.userOddInfo ? JSON.parse(sessionStorage.userOddInfo) : [];
	var userGameInfo = sessionStorage.userGameInfo ? JSON.parse(sessionStorage.userGameInfo) : [];
	
	$.each(games, function(index, game){
		if(game){
			var thisGame = $('#gametagSample').clone();
			thisGame.removeAttr('id');
			thisGame.removeClass('sample');
			thisGame.attr('gameStatus', game.gameStatus);
			$('[name="gameTitle"]', thisGame).text(game.gameNum + ' ' + game.teamHome.leagueName);
			$('[name="teamAway"]', thisGame).text(game.teamAway.teamName);
			$('[name="teamHome"]', thisGame).text(game.teamHome.teamName);
			$('[name="gameTime"]', thisGame).text(game.date + ' ' + game.time);
			
			var count = 0;			
			$.each(game.odds, function(index, odd){	
				switch(odd.oddType) {
			    case 'SU_A': count = 0; break;
			    case 'SU_H': count = 1; break;
			    case 'ATS_A': count = 2; break;
			    case 'ATS_H': count = 3; break;
			    case 'SC_H': count = 4; break;
			    case 'SC_L': count = 5; break;
			    case 'ODD': count = 6; break;
			    case 'EVEN': count = 7; break;
			    default: break;
				}
				
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

			});

			//根據是否可投注賦予顏色
			if(game.gameStatus == 0){
				thisGame.addClass('unable');
				$('#gameMark', thisGame).addClass('glyphicon-remove-circle');
				$('#gameMark', thisGame).text('未開局');
			} else if(game.gameStatus == 3) {
				thisGame.addClass('resulted');
				$('#gameMark', thisGame).addClass('glyphicon-usd');
				$('#gameMark', thisGame).text('已派彩');
			} else if(game.gameStatus != 1) {
				thisGame.addClass('warning');
				$('#gameMark', thisGame).addClass('glyphicon-exclamation-sign');
				$('#gameMark', thisGame).text('已開賽');
			} else {
				thisGame.addClass('success');
				$('.clickfield', thisGame).addClass('clickable');
				$('#gameMark', thisGame).addClass('glyphicon-ok-circle');
				$('#gameMark', thisGame).text('可投注');
			}
			tagColorfn(thisGame);
			$('#game_list').prepend(thisGame);
		}
	});
	
	//套用動態磚效果
	try {
		$('#game_list').shapeshift({
			enableDrag:false,
			enableCrossDrop: false,
		});
		$('#noGameResult').hide();
	}
	catch(err) {
	    $('#noGameResult').show();
	}
	
	//動態磚被按下時的情形
	$('#game_list .clickfield.clickable').off('click');
	$('#game_list .clickfield.clickable').on('click',function(){
		toggleHidden($(this).parent());
	});
	
	//投注按鈕被案下的情形
	$('#game_list .detial label').off('click');
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
			userOddInfo[$(this).attr('oddId')] = null;
			userOddsCount--;
		}
		
		//將資訊以JSON格式紀錄在sessionStorage
		//注意!!此處將不會進行資料的更新以及刪除，資料一旦被記錄，除非使用者操作刪除的動作，否則將會一直保留。
		$.each(userOdds, function(index, userOddID){
			if(!userOddInfo[userOddID]){
				var thisOdd = odds[userOddID];
				var thisGame = games[thisOdd.gameNum];
				userOddInfo[userOddID] = thisOdd;
				userGameInfo[thisOdd.gameNum] = thisGame;
			}
		});
		sessionStorage.userOddInfo = JSON.stringify(userOddInfo);
		sessionStorage.userGameInfo = JSON.stringify(userGameInfo);
		sessionStorage.userOdds = userOdds;
		
		odds_refresh();
		
		var thisTag = $(this).parent().parent().parent();
		var tagColor = function(){
			tagColorfn(thisTag);
		}
		setTimeout(tagColor);
	});
}

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
	if(target.attr('gameStatus') == 1){
		if($('.detial label.active', target)[0]){
			target.removeClass('success');
			target.addClass('primary');
			$('#gameMark', target).removeClass('glyphicon-ok-circle');
			$('#gameMark', target).addClass('glyphicon-thumbs-up');
			$('#gameMark', target).text('已下注');
		} else {
			target.removeClass('primary');
			target.addClass('success');
			$('#gameMark', target).removeClass('glyphicon-thumbs-up');
			$('#gameMark', target).addClass('glyphicon-ok-circle');
			$('#gameMark', target).text('可投注');
		}
	}
}

//取得今天日期
var d = new Date();
var searchDay = $.format.date(d.getTime(), 'yyyy-MM-dd');


//更換頁面按鈕上顯示的時間，以及顯示模式
function changeDate(){
	$('#searchPreview').text($.format.date(d.setDate(d.getDate()-1), 'yyyy-MM-dd'));
	d = new Date(Date.parse(searchDay));
	$('#searchDefault').text($.format.date(d.getTime(), 'yyyy-MM-dd'));
	d = new Date(Date.parse(searchDay));
	$('#searchNextview').text($.format.date(d.setDate(d.getDate()+1), 'yyyy-MM-dd'));
	d = new Date(Date.parse(searchDay));
	
	$('#searchScopeGroup label:eq(2)').button('toggle');
}
changeDate();

//頁面上按鈕的觸發事件
$('#ballType').off('change');
$('#ballType').on('change', function(){
	superRefresh();
});

//往前一日
$('#searchScopeGroup a:eq(1)').off('click');
$('#searchScopeGroup a:eq(1)').on('click', function(){
	d = new Date(Date.parse(searchDay));
	searchDay = $.format.date(d.setDate(d.getDate()-1), 'yyyy-MM-dd');
	changeDate();
	superRefresh();
});

//往後一日
$('#searchScopeGroup a:eq(3)').off('click');
$('#searchScopeGroup a:eq(3)').on('click', function(){
	d = new Date(Date.parse(searchDay));
	searchDay = $.format.date(d.setDate(d.getDate()+1), 'yyyy-MM-dd');
	changeDate();
	superRefresh();
});

//往前三日
$('#searchScopeGroup a:eq(0)').off('click');
$('#searchScopeGroup a:eq(0)').on('click', function(){
	d = new Date(Date.parse(searchDay));
	searchDay = $.format.date(d.setDate(d.getDate()-3), 'yyyy-MM-dd');
	changeDate();
	superRefresh();
});

//往後三日
$('#searchScopeGroup a:eq(4)').off('click');
$('#searchScopeGroup a:eq(4)').on('click', function(){
	d = new Date(Date.parse(searchDay));
	searchDay = $.format.date(d.setDate(d.getDate()+3), 'yyyy-MM-dd');
	changeDate();
	superRefresh();
});

//回到今日
$('#today').off('click');
$('#today').on('click', function(){
	searchDay = $.format.date(new Date, 'yyyy-MM-dd');
	changeDate();
	superRefresh();
});

console.log(searchDay);
function superRefresh(){
	$('#loader').css('display','flex');
	userOddsCount = 0;
	$.ajax({
		url: '<c:url value="/game?method:selectNearNotEnd" />',
		type:'post',
		dataType:'json',
		data:{
			'complexBallType':$('#ballType').val(),
			'complexTimeBegin':searchDay,
			'complexTimeEnd':searchDay,
		},
		success:function(datas){
			$('#loader').css('display','none');
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
			//console.log('-----------');

			//初始化gameList
			var gameTagSample = $('#gametagSample').clone();
			$('#game_list').html('');
			$('#game_list').prepend(gameTagSample);
			
			userOdds = [];
			if(sessionStorage.userOdds){
				userOdds = sessionStorage.userOdds.split(',');
				userOddsCount = userOdds.length;
			}
			
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
				}
			});
			
			//將games 與odds 輸出到index
			golbalInsert(games, odds);
			gameRefresh(games, odds);
			
		}//Ajax function
	});//Ajax
}//superRefresh

superRefresh();
</script>
</body>
</html>