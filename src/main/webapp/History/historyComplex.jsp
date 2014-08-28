<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap-dialog.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.dataTables_themeroller.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/global.css"/>">
</head>
<body>
	<div id="page-wrapper">
		
		<div class="container top20">
			
			<div class="row">
				<div class="col-lg-12">
					<form role="form" class="form-inline pull-left" action="<c:url value="/gameManager"/>">
						<div class="form-group">
							<select class="form-control form-ball-type" id="catagory" name="catagory">
								<option value="Baseball">棒球</option>
								<option value="Basketball">籃球</option>
								<option value="Basketball">足球</option>
							</select>
						</div>
                        <input type="text" class="form-control form-game-time" id="timeBegin" placeholder="起始時間" xname="timeFrom">
                        <input type="text" class="form-control form-game-time" id="timeEnd" placeholder="截止時間" name="timeFrom">
                        <input type="text" class="form-control" >
					</form>
				</div>
			</div>
			<!-- .row -->
                
			<div class="row top20">
				<div class="col-lg-12">
					<!-- <div class="table-responsive"> -->
						<table id="gameTable" class="table table-hover table-condensed table-bordered table-striped">
							<thead>
								<tr>
									<th>賽事編號</th>
									<th>比賽日期</th>
									<th>客隊隊伍</th>
									<th>主隊隊伍</th>
									<th>投注比</th>
									<th>已結束</th>
	                            </tr>
							</thead>
							<tbody id="gameList">
							</tbody>
						</table>
					<!-- </div>  -->
					<!-- .table-responsive -->
				</div>
			</div>
			<!-- .row -->
		</div>
		<!-- .container-fluid -->
	</div>
	<!-- #page-wrapper -->
	
<script src="<c:url value="/Admin/js/jquery.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap-dialog.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>

<script>
	(function($) {
		//data格式{"xxx":'ooo'}
		$('.form-game-time').datetimepicker({
			format: 'Y-m-d',
			timepicker: false //取消掉顯示時間
		});
		
		$.getJSON('<c:url value="/searchHistoryComplex?method:searchHistoryComplexData" />', {}, function(datas){
			console.log(datas);
			
			
			$.each(datas, function(index, game){
				var dataString = "";
				
				timeString = "";
				timeString += millisecondToDate(game.gameTime.iLocalMillis);
				timeString += " ";
				timeString += millisecondToTime(game.gameTime.iLocalMillis);
				
				dataString += "<tr>";
				dataString += "<td>" + game.gameNum + "</td>";
				dataString += "<td>" + timeString + "</td>";
				dataString += "<td>" + game.teamAway.teamName + "</td>";
				dataString += "<td>" + game.teamHome.teamName + "</td>";
				dataString += "<td>" + "none" + "</td>";
				dataString += "<td>" + game.isEnd + "</td>";
				dataString += "</tr>";
				$('#gameList').append(dataString);
			});

			$('#gameTable').dataTable({
				responsive: true
			});
		});
		
	})(jQuery);
</script>
</body>
</html>