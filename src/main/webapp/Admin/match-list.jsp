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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<c:url value="/Admin/css/admin-style.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.datetimepicker.css"/>">
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
					<li>
						<a href="<c:url value="/Admin/index.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
					</li>
					<li class="active">
						<a href="javascript:;" data-toggle="collapse" data-target="#match-manager"><i class="fa fa-fw fa-list"></i> 賽事管理<i class="fa fa-fw fa-caret-down"></i></a>
						<ul id="match-manager" class="collapse">
							<li>
								<a href="<c:url value="/Admin/match-form.jsp"/>"><i class="fa fa-fw fa-pencil-square-o"></i> 新增</a>
							</li>
							<li class="open">
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
							賽事管理
						</h1>
						<ol class="breadcrumb">
							<li>
								<a href="<c:url value="/Admin/index.jsp"/>"><i class="fa fa-fw fa-home"></i> 首頁</a>
							</li>
							<li>
								<i class="fa fa-fw fa-list"></i> 賽事管理
							</li>
							<li class="active">
								<i class="fa fa-fw fa-table"></i> 查詢
							</li>
						</ol>
					</div>
				</div>
				<!-- .row -->
                
                <div class="row">
                	<div class="col-lg-12">
                		<div role="form" class="form-inline pull-left">
                			<div class="form-group">
		                    	<select class="form-control form-ball-type" name="model.ballType">
									<option value="Baseball" selected>棒球</option>
									<option value="Basketball">籃球</option>
									<option value="Basketball">足球</option>
								</select>
	                    	</div>
	                    	<button class="btn btn-primary" type="button">Submit</button>
                    	</div>
                    	<button class="btn btn-success pull-right" type="button">Add Game</button>
                	</div>
                </div>
                <!-- .row -->
                
                <div class="row top20">
                	<div class="col-lg-12">
						<div class="table-responsive">
	                    	<table class="table table-hover table-striped table-bordered">
	                    	   	<thead>
	                            	<tr>
	                            		<th>賽事編號</th>
	                            		<th>比賽時間</th>
	                            		<th>客隊隊伍</th>
	                            		<th>客隊分數</th>
	                            		<th>主隊隊伍</th>
	                            		<th>主隊分數</th>
	                            	</tr>
	                            </thead>
	                            <tbody>
	                            	
	                            </tbody>
	                        </table>
	                    </div>
	                    <!-- .table-responsive -->
                    </div>
                </div>
				<!-- .row -->
				
				<div class="modal fade" id="matchModal" tabindex="-1" role="dialog" aria-labelledby="新增賽事" aria-hidden="true">
					 <div class="modal-dialog modal-sm">
					 	<div class="modal-content">
					 	</div>
					 </div>
				</div>
				
			</div>
			<!-- .container-fluid -->
		</div>
		<!-- #page-wrapper -->
	
	</div>
	<!-- #wrapper -->
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="<c:url value="/Admin/js/jquery.datetimepicker.js"/>"></script>
<script>
	(function($) {
		$('#match-manager').collapse();
	})(jQuery);
</script>
</body>
</html>