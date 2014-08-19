<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sports Lottery Manager</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/Admin/css/admin-style.css"/>">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<style>
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
				<a class="navbar-brand" href="<c:url value="/Admin/index.jsp"/>">Sports Lottery Admin</a>
			</div>
			
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav side-nav">
					<li class="active">
						<a href="<c:url value="/Admin/index.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
					</li>
					<li>
						<a href="javascript:;" data-toggle="collapse" data-target="#match-manager"><i class="fa fa-fw fa-list"></i> 賽事管理<i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="match-manager" class="collapse">
							<li>
								<a href="<c:url value="/Admin/match-form.jsp"/>"><i class="fa fa-fw fa-pencil-square-o"></i> 新增</a>
							</li>
							<li>
								<a href="<c:url value="/Admin/match-list.jsp"/>"><i class="fa fa-fw fa-table"></i> 查詢</a>
							</li>
						</ul>
					</li>
				</ul>
			</div>
			<!-- .navbar-collapse -->
		</nav>
		
		<div id="page-wrapper">
			<div class="container-fluid">
				<div class="row">
					<div class="col-lg-12">
						<h1 class="page-header">
							<div>投注區</div>
						</h1>						
						<table class="table table-striped table-hover" id="lottery">
  							<tr>
  								<td >
  									<button type="button" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
  								</td>
  							</tr>
							
						</table>
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

			//刷新清單顯示

				//console.log(userOddStorge);
				var strHtml = '';
				$.each(odds, function(index, odd){
					var winner='';
					if("SU_H"==odd.oddType){
						winner=odd.gameId.teamHome.teamName;
					}else{
						winner=odd.gameId.teamAway.teamName;
					}
					strHtml +='<tr><td>';
					strHtml +='<button type="button" class="close"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>';
					strHtml += odd.gameId.ballType +','+ millisecondToDate(odd.gameId.gameTime.iLocalMillis) + millisecondToTime(odd.gameId.gameTime.iLocalMillis)+'<br>' ; 
					strHtml +='編號:' +odd.gameId.gameNum+odd.gameId.teamAway.teamName +'@'+odd.gameId.teamHome.teamName+'<br>' ;
					strHtml +=castOddType(odd.oddType) +':'+odd.oddValue+'('+winner+')';
					strHtml +='</td></tr>';
				});
				$('#lottery').html(strHtml);

					

		});
		

		
	})(jQuery);
</script>
</body>
</html>