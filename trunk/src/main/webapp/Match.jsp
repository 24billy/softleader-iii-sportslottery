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

#matchBoard {
	font-family: "Lucida Sans Unicode", "Lucida Grande", "微軟正黑體";
	width: 70%;
	padding: 5px;
	margin: 0px auto;
}

.date {
	margin: 20px auto;
	padding: 10px;
	box-shadow: 0px 0px 2px 2px #999999;
}

.dateLabel {
	margin: 10px;
}

.match {
	font-size: 12px;
	padding: 1px 10px;
	border-left: 4px solid #1e69de;
}

.match div {
	height: 15px;
	display: inline-block;
	margin: 1px 1px;
	padding: 1px 10px;
	background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%,
		rgba(241, 241, 241, 1) 86%, rgba(225, 225, 225, 1) 88%,
		rgba(246, 246, 246, 1) 100%);
	border-left: 1px solid #999999;
	border-right: 1px solid #999999;
	border-top: 1px solid #999999;
}

.matchNum {
	border-bottom: 2px solid #1e69de;
}

.matchTime {
	border-bottom: 2px solid #76C0E8;
}

.matchHome {
	width: 200px;
	border-bottom: 2px solid #1e69de;
}

.matchHome:HOVER {
	background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%,
		rgba(225, 225, 225, 1) 16%, rgba(225, 225, 225, 1) 16%,
		rgba(241, 241, 241, 1) 17%, rgba(255, 255, 255, 1) 88%,
		rgba(246, 246, 246, 1) 100%);
}

.matchAway {
	width: 200px;
	border-bottom: 2px solid #1e69de;
}

.matchAway:HOVER {
	background: linear-gradient(to bottom, rgba(255, 255, 255, 1) 0%,
		rgba(225, 225, 225, 1) 16%, rgba(225, 225, 225, 1) 16%,
		rgba(241, 241, 241, 1) 17%, rgba(255, 255, 255, 1) 88%,
		rgba(246, 246, 246, 1) 100%);
}
</style>

</head>
<body>


	<article>
		<div id="matchBoard">
			<div class="date">
				<s:iterator value="models">
					<joda:format var="dateJoda" value="${gameTime}" pattern="yyyy-MM-dd" />
					<div class="dateLabel">${dateJoda}</div>
					<joda:format var="timeJoda" value="${gameTime}" pattern="HH:mm:ss" />
					<div class="match">
						<div class="matchNum">${gameNum}</div>
						<div class="matchTime">${timeJoda}</div>
						<div class="matchAway">${teamAway.teamName}</div>
						<div class="matchHome">${teamHome.teamName}</div>
					</div>
				</s:iterator>
			</div>
		</div>
	</article>
	
	

	<script>
	(function($){
		<s:iterator value="models">   
			<joda:format var="dateJoda" value="${gameTime}" pattern="yyyy-MM-dd" />
			<joda:format var="timeJoda" value="${gameTime}" pattern="HH:mm:ss" />
			console.log('${gameNum}');
			console.log('${dateJoda}');
			console.log('${timeJoda}');
			console.log('${teamAway.teamName}');
			console.log('${teamHome.teamName}');
		</s:iterator>
	})(jQuery);
	</script>
</body>
</html>