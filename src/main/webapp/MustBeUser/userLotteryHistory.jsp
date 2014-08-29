<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>hahaha</h1>
	<div></div>
	
	
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="<c:url value="/js/misc.js"/>"></script>
	<script>
	
		(function($) {
			
			var strHtml = "";
			var uLottery = [];
			var odd = [];
			$.getJSON("<c:url value='/userSearchOdds?method:selectByUser' />",{},function(data){
				
				$.each(data, function(index,lottery) {
					var len = $.map(lottery, function(n, i) { return i; }).length;
					uLottery = lottery;
					
					//把每張lottery的注取出來
					var oddi = 1;
					for(var i=3;i<(len-3);i++) {
						
						odd[oddi] = lottery[i];
						uLottery[lottery.id] = odd[oddi];
						
						oddi++;
						console.log(uLottery);
					}
					
					//user的全部投注單
					
					
					
					
					
					
					console.log("樂投資訊");
					console.log(lottery.id);						//Lottery的id
					console.log(lottery.confirmTime.iLocalMillis);	//投注時間
					console.log(lottery.capital);					//本金
					console.log(lottery.win);						//獎金
					console.log("注的資訊");
					console.log(lottery.oddsId1);
					console.log(len);
					console.log("-------------------");
					
					//strHtml += '<span class="ulottery-id">' + lottery.id + '</span><span class="ulottery-time">'+;
				});
				//uLottery[data.id] = data
				
				
			});
			
		})(jQuery);
	</script>
</body>
</html>