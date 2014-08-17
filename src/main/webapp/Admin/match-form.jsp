<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Sports Lottery Manager</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/admin-style.css">
<link rel="stylesheet" href="css/jquery.datetimepicker.css">
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
				<a class="navbar-brand" href="index.jsp">Sports Lottery Admin</a>
			</div>
			
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav side-nav">
					<li>
						<a href="index.jsp"><i class="fa fa-fw fa-home"></i> 首頁</a>
					</li>
					<li class="active">
						<a href="javascript:;" data-toggle="collapse" data-target="#match-manager"><i class="fa fa-fw fa-list"></i> 賽事管理<i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="match-manager" class="collapse">
							<li class="open">
								<a href="match-form.jsp"><i class="fa fa-fw fa-pencil-square-o"></i> 新增</a>
							</li>
							<li>
								<a href="match-list.jsp"><i class="fa fa-fw fa-table"></i> 查詢</a>
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
							新增賽事
						</h1>
						<ol class="breadcrumb">
							<li>
								<a href="index.jsp"><i class="fa fa-fw fa-home"></i> 首頁</a>
							</li>
							<li>
								<i class="fa fa-fw fa-list"></i> 賽事管理
							</li>
							<li class="active">
								<i class="fa fa-fw fa-pencil-square-o"></i> 新增
							</li>
						</ol>
					</div>
				</div>
				<!-- .row -->
				
				<div class="row">
					<div class="col-lg-6">
						<form role="form">
							<div class="form-group">
								<label>BALL TYPE</label>
								<select class="form-control form-ball-type">
									<option value="Baseball" selected>棒球</option>
									<option value="Basketball">籃球</option>
									<option value="Basketball">足球</option>
								</select>
								<label>TEAM HOME</label>
								<select class="form-control form-team">
								</select>
								<label>TEAM AWAY</label>
								<select class="form-control form-team">
								</select>
								<label>GAME TIME</label>
           						<input class="form-control form-game-time" type="text">
							</div>
						</form>
					</div>
				</div>
				<!-- .row -->
				
				<div class="row">
					<div class="col-lg-6">
					</div>
				</div>
				<!-- .row -->
			
			
			</div>
			<!-- .container-fluid -->
		</div>
		<!-- #page-wrapper -->
	
	</div>
	<!-- #wrapper -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="js/jquery.datetimepicker.js"></script>
<script>
	(function($) {
		listTeam();
		$('#match-manager').collapse();
		$('.form-ball-type').change(listTeam);
		
		function listTeam() {
			$('.form-team').empty();
			
			var url = '<c:url value="/team"/>';
			$.getJSON(url, function(data) {
								
				$.each(data, function(key, value) {
					var str = '<option value=' + value.id + '>' + value.teamName + '</option>';
					$('.form-team').append(str);
				});
			});
		}
		
		$('.form-game-time').datetimepicker({
			minDate: new Date()
		});
		
	})(jQuery)
</script>
</body>
</html>