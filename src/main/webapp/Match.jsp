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
	width: 98%;
	margin: 10px auto;
	border-radius: 5px;
	box-shadow: 0px 0px 10px 5px #333333;
}

aside {
	background: #ffffff;
	margin: 10px auto;
	width: 98%;
	border-radius: 5px;
}

#matchBoard {
	font-family: "Lucida Sans Unicode", "Lucida Grande", "微軟正黑體";
	width: 70%;
	padding: 5px;
	margin: 0px auto;
}

.date {
	margin: 20px auto;
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
	padding: auto;

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
		<div>
			
		</div>
		<div id="lottery"></div>
	</aside>

	<script>
	(function($){
		//取得資料
		//將findAll的資料以JSON格式取出，使用google的API來轉換
		var json = '${modelsJson}';
		var odds = $.parseJSON(json);
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
					strHtml += '<div class="matchTeam" name="away" team="' + item.teamAway + '">' + item.teamAway + '<span class="oddValue">' + getOddValue(item.id, "SU_A").toFixed(2) + '</span></div>';
					strHtml += '<div class="matchTeam" name="home" team="' + item.teamHome + '">' + item.teamHome + '<span class="oddValue">' + getOddValue(item.id, "SU_H").toFixed(2) + '</span></div>';
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
					oddStorage(this);
				} else {
					$(this).toggleClass('matchTeamChoose');
					alert('您最多只能選擇8種玩法');//暫時處置
				}
			} else {
				oddsTotal -= 1;
			}
		});
		
		function oddStorage(input){
			//var eleChild=$(input).text();
			var home=$(input).parent().find("div[name='home']");
			var away=$(input).parent().find("div[name='away']");
			
			// var nextOne=$(this).next();
			//var nextChild=nextOne.text();
			$('#lottery').append("<div>"+away.attr("team")+":"+home.attr("team")+"</div>");
		
		}
		
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
		
	})(jQuery);
	</script>
</body>
</html>