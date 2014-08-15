<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/js/misc.js"/>"></script>

<style>

body {
	background: #999999;
}

article {
	background: #ffffff;
	width: 70%;
	margin: 10px 0px;
	border-radius: 5px;
	box-shadow: 0px 0px 10px 5px #333333;
	float:left;
}

aside {
	font-size: 14px;
	font-family: "Lucida Sans Unicode", "Lucida Grande", "微軟正黑體";
	background: #ffffff;
	margin: 10px 0px;
	width: 28%;
	border-radius: 5px;
	box-shadow: 0px 0px 10px 5px #333333;
	padding: 5px;
	float:right;
}

#matchBoard {
	font-family: "Lucida Sans Unicode", "Lucida Grande", "微軟正黑體";
	width: 700px;
	padding: 5px;
	margin: 20px auto;
}

.date {
	margin: 0px auto;
	padding: 10px;
}

.dateLabel {
	margin: 10px;
}

.match {
	font-size: 13px;
	padding: 1px 10px;
	border-left: 4px solid #1e69de;
}

.match div {
	line-height: 20px;
	height: 20px;
	display: inline-block;
	margin: 1px 1px;
	padding: 1px 10px;

	border-left: 1px solid #999999;
	border-right: 1px solid #999999;
	border-top: 1px solid #999999;
}

.match div[name="noneBox"] {
	height: auto;
	display: inline-block;
	margin: auto;
	padding: 0px;

	border: none;
}

.matchNum {
	border-bottom: 2px solid #1e69de;
}

.matchTime {
	border-bottom: 2px solid #76C0E8;
}

.matchTeam {
	background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%,
		rgba(241, 241, 241, 1) 86%, rgba(225, 225, 225, 1) 88%,
		rgba(246, 246, 246, 1) 100%);
	width: 200px;
	border-bottom: 2px solid #1e69de;
	cursor: pointer;
	-webkit-user-select: none;  /* Chrome all / Safari all */
	-moz-user-select: none;     /* Firefox all */
	-ms-user-select: none;      /* IE 10+ */
}

.matchTeam:HOVER {
	background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%,
		rgba(225, 225, 225, 1) 16%, rgba(225, 225, 225, 1) 16%,
		rgba(241, 241, 241, 1) 17%, rgba(255, 255, 255, 1) 88%,
		rgba(246, 246, 246, 1) 100%);
}

.matchTeamChoose {
	background: linear-gradient(to bottom, rgba(125,126,125,1) 0%,rgba(14,14,14,1) 100%);
	color: #ffffff;
	
	width: 200px;
	border-bottom: 2px solid #1e69de;
	cursor: pointer;
	-webkit-user-select: none;  /* Chrome all / Safari all */
	-moz-user-select: none;     /* Firefox all */
	-ms-user-select: none;      /* IE 10+ */
}

.matchTeamChoose:HOVER {
	background: linear-gradient(to bottom, rgba(14,14,14,1) 0%,rgba(125,126,125,1) 100%);
	color: #ffffff;
	
	width: 200px;
	border-bottom: 2px solid #1e69de;
	cursor: pointer;
	-webkit-user-select: none;  /* Chrome all / Safari all */
	-moz-user-select: none;     /* Firefox all */
	-ms-user-select: none;      /* IE 10+ */
}

.oddValue {
	float: right;
}

.icon{
	width:16px;
	text-align:right;

}
.icon_cancel{
	width:16px;
	float:right;
}
.lotteryHead{
	
	padding:10px 5px 0px 5px;
}

.lotteryBody{
	margin:0px 5px 15px 5px;
}
.bodyTime{
	background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%,
		rgba(225, 225, 225, 1) 16%, rgba(225, 225, 225, 1) 16%,
		rgba(241, 241, 241, 1) 17%, rgba(255, 255, 255, 1) 88%,
		rgba(255, 255, 255, 1) 100%);
	color:gray;
	text-align:left;
	padding:3px 6px;
}
.bodyTeam{

	text-align:left;
	padding:3px 6px;
}

.bodyOdds{
	text-align:left;
	background: linear-gradient(to bottom, rgba(125,126,125,1) 0%,rgba(14,14,14,1) 100%);
	color: #ffffff;
	padding:3px 6px;
}

#detailBox{
	transition: opacity 220ms ease;
	opacity: 0;
	position: absolute;
	width:200px;
	height:60px;
	pointer-events: none;
}

#teamDetails{
	font-size: 14px;
	font-family: "Lucida Sans Unicode", "Lucida Grande", "微軟正黑體";
	color: #ffffff;
	text-align: center;
	line-height:18px;

	width:200px;
	height:40px;
	background: #333333;
	pointer-events: none;
}



#arrow{
	border-style:solid;
	border-color:#333333 rgba(225, 225, 225, 0) rgba(225, 225, 225, 0) rgba(225, 225, 225, 0);
	border-width:10px;
	width:0px;
	height:0px;

	pointer-events: none;
	margin: 0px auto;
}

</style>

</head>
<body>
	<article>
		<div id="detailBox">
			<div id="teamDetails"></div>
			<div id="arrow"></div>
		</div>
		
		<div id="matchBoard"></div>
	</article>
	<aside>
		<div class='lotteryHead'><img class="icon" src="<c:url value='/images/coins.gif'/>" >投注區</div>			
		<div id="lottery" class='lotteryBody'></div>
	</aside>

	<script>
	(function($){
		//取得資料
		//將findAll的資料以JSON格式取出，使用google的API來轉換
		var odds = [];
		$.getJSON('<c:url value="/odds" />', {}, function(data){
			odds = data;

			//var json = '${modelsJson}';
			//var odds = $.parseJSON(json);
			var models = [];
			$.each(odds, function(index,odd){
				var hasGet = false;
				$.each(models, function(index,model){
					if(odd.gameId.gameNum == model.gameNum){
						hasGet = true;
					}
				});
				if(!hasGet){
					models.push(odd.gameId);
					console.log(odd);
				}
			});
			
			//轉換資料
			//使用一個item陣列儲存model裡的資料，時間資料則經由misc.js裡的方法來格式化
			var items = [];
			$.each(models, function(index,model){
				var item = new Object;
				
				item.gameNum = model.gameNum;
				item.date = millisecondToDate(model.gameTime.iLocalMillis);
				item.time = millisecondToTime(model.gameTime.iLocalMillis);
				item.teamAway = model.teamAway.teamName;
				item.teamHome = model.teamHome.teamName;
				item.leagueName = model.leagueName;
				item.ballType = model.ballType;
				item.id = model.id;
				
				items.push(item);
			});
			
			//顯示頁面
			//將賽事資料以日期做分類，使同日期的賽事顯示在同一個區塊中
			var matchDate = getMatchDates(models);
			$.each(matchDate, function(index,date){
				var strHtml =  '<div class="date">';
					strHtml += '<div class="dateLabel">' + date + '</div>';
					strHtml += '<div class="match">';
				$.each(items, function(index,item){
					if(date == item.date){
						strHtml += '<div name="noneBox">';
						strHtml += '<div class="matchNum">' + item.gameNum + '</div>';
						strHtml += '<div class="matchTime">' + item.time + '</div>';
						strHtml += '<div class="matchTeam" oddId="' + item.id + '" name="away" gameId="' + item.gameNum + '" team="' + item.teamAway + '">' + item.teamAway + '<span class="oddValue">' + getOddValue(item.id, "SU_A").toFixed(2) + '</span></div>';
						strHtml += '<div class="matchTeam" oddId="' + item.id + '" name="home" gameId="' + item.gameNum + '" team="' + item.teamHome + '">' + item.teamHome + '<span class="oddValue">' + getOddValue(item.id, "SU_H").toFixed(2) + '</span></div>';
						strHtml += '</div>';
						strHtml += '<br>';
					}
				});
				strHtml += '</div>';
				strHtml += '</div>';
				$('#matchBoard').append(strHtml);
			});
			
			//處理滑鼠移到隊伍上時顯示的詳細資訊
			$('.matchTeam').mousemove(function(event){
				$('#detailBox').css('opacity','0.7');
				$('#detailBox').css('left',$(this).position().left+11);
				$('#detailBox').css('top',$(this).position().top-55);
				
				var detail = '';
				var thisTeam = $(this).attr("team");
				var hasGet = false;
				$.each(items, function(index,item){
					if(!hasGet && (item.teamAway == thisTeam || item.teamHome == thisTeam)){
						detail += item.ballType + ' - ' +item.leagueName + '<br>';
						hasGet = true;
					}
				});
				detail += thisTeam;
				$('#teamDetails').html(detail);
			});
			//處理滑鼠移開的動作
			$('.matchTeam').mouseout(function(event){
				$('#detailBox').css('opacity','0');
				$('#teamDetails').html('');
			});
			
			//處理選擇的情形
			//最多選擇八種玩法
			var oddsTotal = 0;
			$('.matchTeam').click(function(event){
				$(this).toggleClass('matchTeamChoose');
				if($(this).hasClass('matchTeamChoose')){
					if(oddsTotal<8){
						oddsTotal += 1;
						addOdd(this);
					} else {
						$(this).toggleClass('matchTeamChoose');
						alert('您最多只能選擇8種玩法');//暫時處置
					}
				} else {
					oddsTotal -= 1;
					removeOdd(this);
				}
			});
			
			var userOddStorge = [];
			//紀錄已經下注的訂單
			function addOdd(input){
				//userOdd.home=$(input).parent().find("div[name='home']").attr("team");
				//userOdd.away=$(input).parent().find("div[name='away']").attr("team");
				var thisTeam = $(input).attr("team");
				var thisGame = $(input).attr("gameId");
				var homeAway = $(input).attr("name");

				if(homeAway == 'home'){
					$.each(odds, function(index, odd){
						if(thisTeam == odd.gameId.teamHome.teamName && thisGame == odd.gameId.gameNum && odd.oddType == "SU_H"){
							userOddStorge.push(odd);
							return false;
						}
					});
				} else if(homeAway == 'away'){
					$.each(odds, function(index, odd){
						if(thisTeam == odd.gameId.teamAway.teamName && thisGame == odd.gameId.gameNum && odd.oddType == "SU_A"){
							userOddStorge.push(odd);
							return false;
						}
					});
				} else {
					alert('大老你又開掛了');
				}
				refresh();
			}
			
			//刪除已經下注的訂單
			function removeOdd(input){
				//userOdd.home=$(input).parent().find("div[name='home']").attr("team");
				//userOdd.away=$(input).parent().find("div[name='away']").attr("team");
				var thisTeam = $(input).attr("team");
				var thisGame = $(input).attr("gameId");
				var homeAway = $(input).attr("name");
				
				if(homeAway == 'home'){
					$.each(odds, function(index, odd){
						if(thisTeam == odd.gameId.teamHome.teamName && thisGame == odd.gameId.gameNum && odd.oddType == "SU_H"){
							console.log(userOddStorge.indexOf(odd));
							userOddStorge.splice(userOddStorge.indexOf(odd),1);
							return false;
						}
					});
				} else if(homeAway == 'away'){
					$.each(odds, function(index, odd){
						if(thisTeam == odd.gameId.teamAway.teamName && thisGame == odd.gameId.gameNum && odd.oddType == "SU_A"){
							console.log(userOddStorge.indexOf(odd));
							userOddStorge.splice(userOddStorge.indexOf(odd),1);
							return false;
						}
					});
				} else {
					alert('大老你又開掛了');
				}
				refresh();
			}
			
			//刷新清單顯示
			function refresh(){
				//console.log(userOddStorge);
				var strHtml = '';
				$.each(userOddStorge, function(index, odd){
					var winner='';
					if("SU_H"==odd.oddType){
						winner=odd.gameId.teamHome.teamName;
					}else{
						winner=odd.gameId.teamAway.teamName;
					}
					console.log(winner);
					strHtml +='<div class="lotteryBody" oddId="' + odd.id + '">';
					strHtml +='<div class="bodyTime">' + odd.gameId.ballType +','+ millisecondToDate(odd.gameId.gameTime.iLocalMillis) + millisecondToTime(odd.gameId.gameTime.iLocalMillis)+ '</div>' ; 
					strHtml +='<div class="bodyTeam"><label>編號:</label>' +odd.gameId.gameNum+odd.gameId.teamAway.teamName +'@'+odd.gameId.teamHome.teamName+ '</div>' ;
					strHtml +='<div class="bodyOdds">'+ castOddType(odd.oddType) +':'+odd.oddValue+'('+winner+')';
					strHtml +='<img class="icon_cancel" src="<c:url value='/images/delete.png'/>" ></div>' ;
					strHtml +='</div>';
				});
				$('#lottery').html(strHtml);
			}
					
			//取得OddValue
			function getOddValue(gameId, oddType) {
				var oddValue = 0;
				$.each(odds, function(index, odd){
					if (odd.gameId.id == gameId && odd.oddType == oddType) {
						oddValue = odd.oddValue;
						return false;
					}
				});
				return oddValue;
			}
		});
		

		
	})(jQuery);
	</script>
</body>
</html>