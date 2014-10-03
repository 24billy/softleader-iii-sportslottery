<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><s:text name="admin.gameAdmin"/></title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">
<link rel="stylesheet" href="<c:url value="/css/adminStyle.css"/>">
</head>
<body>
	<div id="wrapper">
		<jsp:include page="navigation.jsp"/>
		<div id="page-wrapper">
			<div class="container">
				<div class="row">
					<div class="col-sm-3 container-left">
						<jsp:include page="sider.jsp"/>
					</div>
					<!-- .container-left -->
					<div class="col-sm-9 container-right animated fadeIn">
						<div class="row">
							<div class="col-sm-12">
								<ol class="breadcrumb">
									<li><a href="<c:url value="/admin/home"/>"><i class="fa fa-fw fa-home"></i><span class="left5"><s:text name="admin.home"/></span></a></li>
		  							<li class="active"><i class="fa fa-fw fa-table"></i><span class="left5"><s:text name="admin.gameAdmin"/></span></li>
								</ol>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-sm-12">
								<form role="form" class="form-inline pull-left" action="<c:url value="/admin/gameAdmin"/>" method="post">
									<select class="input-sm" id="catagory" name="catagory">
										<c:forEach var="ballType" items="${ballTypes}">
											<c:choose>
												<c:when test="${ballType eq 'Baseball'}">
													<option value="Baseball" selected><s:text name="admin.teamAdmin.ballType.baseball"/></option>
												</c:when>
												<c:when test="${ballType eq 'Basketball'}">
													<option value="Basketball"><s:text name="admin.teamAdmin.ballType.basketball"/></option>
												</c:when>
												<c:when test="${ballType eq 'Soccer'}">
													<option value="Soccer"><s:text name="admin.teamAdmin.ballType.soccer"/></option>
												</c:when>
											</c:choose>
										</c:forEach>
									</select>
									<button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-fw fa-search"></i></button>
								</form>
								<button id="btnAddGame" class="btn btn-success pull-right btn-sm" type="button" data-toggle="modal" data-target="#gameModal"><i class="fa fa-fw fa-plus"></i><span class="left5"><s:text name="admin.gameAdmin.add"/></span></button>
								<button class="btn btn-warning pull-right btn-sm btn-payoutToday" type="button" data-toggle="modal" data-target="#payoutTodayModal"><i class="fa fa-fw fa-trophy"></i><span class="left5"><s:text name="admin.gameAdmin.payoutToday"/></span></button>
							</div>
						</div>
						<!-- .row -->
			            
			            <!-- Begin of gameTable -->    
						<div class="row top20 container-table">
							<div class="col-sm-12">
								<div class="table-responsive">
									<table id="gameTable" class="table compact hover order-column row-border nowrap">
										<thead>
											<tr>
												<th><s:text name="admin.game.gameNum"/></th>
												<th><s:text name="admin.game.gameTime"/></th>
												<th><s:text name="admin.game.teamAway"/></th>
												<th><s:text name="admin.game.teamHome"/></th>
												<th><s:text name="admin.game.gameStatus"/></th>
												<th><s:text name="admin.btn.action"/></th>
											</tr>
										</thead>
										<tbody id="gameList">
										</tbody>
									</table>
								</div>
							</div>
						</div>
						<!-- .row -->
						<!-- End of gameTable -->
					</div>
					<!-- .container-right -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container -->
		</div>
		<!-- #page-wrapper -->
		
		<!-- Begin of gameModal -->
		<div class="modal fade" id="gameModal" role="dialog" aria-labelledby="gameModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog">
				<div class="modal-content">
				
					<div id="gameModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="gameModalTitle" class="modal-title"><s:text name="admin.form.gameForm"/></h3>
					</div>
					<!-- modal-header -->
					<form role="form" id="gameForm">
					
						<div class="modal-body">
							<div class="row">
							
								<!-- Begin of gameInfo -->
								<div class="col-sm-6">
									
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label for="ballType"><s:text name="admin.team.ballType"/></label>
												<select class="form-control input-sm" id="ballType" name="model.ballType">
													
												</select>
											</div>
										</div>
									</div>
									<!-- .row -->
									
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label for="leagueName"><s:text name="admin.team.leagueName"/></label>
												<select class="form-control input-sm" id="leagueName" name="model.leagueName">
												</select>
											</div>
										</div>
									</div>
									<!-- .row -->
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="teamAwayList"><s:text name="admin.game.teamAway"/></label>
												<select class="form-control input-sm" id="teamAwayList" name="teamAwayId">
												</select>
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="teamHomeList"><s:text name="admin.game.teamHome"/></label>
												<select class="form-control input-sm" id="teamHomeList" name="teamHomeId">
												</select>
											</div>
										</div>
									</div>
									<!-- .row -->
									
									<div class="row">
										<div class="col-sm-12">
											<div class="form-group">
												<label for="gameTime"><s:text name="admin.game.gameTime"/></label>
												<input class="form-control input-sm" id="gameTime" type="text" name="model.gameTime">
											</div>
										</div>
									</div>
									<!-- .row -->
								</div>
								<!-- End of gameInfo -->
								
								<!-- Begin of oddsInfo -->
								<div class="col-sm-6">
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="SU_A"><s:text name="admin.odds.SU_A"/></label>
												<input class="form-control input-sm form-decimal" id="SU_A" type="text" name="SU_A">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="SU_H"><s:text name="admin.odds.SU_H"/></label>
												<input class="form-control input-sm form-decimal" id="SU_H" type="text" name="SU_H">
											</div>
										</div>
									</div>
									<!-- .row -->
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="ATS_A"><s:text name="admin.odds.ATS_A"/></label>
												<input class="form-control input-sm form-decimal" id="ATS_A" type="text" name="ATS_A">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="ATS_H"><s:text name="admin.odds.ATS_H"/></label>
												<input class="form-control input-sm form-decimal" id="ATS_H" type="text" name="ATS_H">
											</div>
										</div>
									</div>
									<!-- .row -->
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="SC_H"><s:text name="admin.odds.SC_H"/></label>
												<input class="form-control input-sm form-decimal" id="SC_H" type="text" name="SC_H">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="SC_L"><s:text name="admin.odds.SC_L"/></label>
												<input class="form-control input-sm form-decimal" id="SC_L" type="text" name="SC_L">
											</div>
										</div>
									</div>
									<!-- .row -->
									
									<div class="row">
										<div class="col-sm-6">
											<div class="form-group">
												<label for="EVEN"><s:text name="admin.odds.SC_EVEN"/></label>
												<input class="form-control input-sm form-decimal" id="EVEN" type="text" name="EO_EVEN">
											</div>
										</div>
										<div class="col-sm-6">
											<div class="form-group">
												<label for="ODD"><s:text name="admin.odds.SC_ODD"/></label>
												<input class="form-control input-sm form-decimal" id="ODD" type="text" name="EO_ODD">
											</div>
										</div>
									</div>
									<!-- .row -->
								</div>
								<!-- End of oddsInfo -->
								
								<div class="col-sm-4">
									
									<div class="form-group">
										<label for="ATS_A_Combination"><s:text name="admin.odds.ATS_A_Combination"/></label>
										<input class="form-control input-sm" id="ATS_A_Combination" type="text" name="ATS_A_Combination">
									</div>
								</div>
								
								<div class="col-sm-4">
									<div class="form-group">
										<label for="ATS_H_Combination"><s:text name="admin.odds.ATS_H_Combination"/></label>
										<input class="form-control input-sm" id="ATS_H_Combination" type="text" name="ATS_H_Combination">
									</div>
								</div>
								
								<div class="col-sm-4">
									<div class="form-group">
										<label for="SC_Combination"><s:text name="admin.odds.SC_Combination"/></label>
										<input class="form-control input-sm" id="SC_Combination" type="text" name="SC_Combination">
									</div>
								</div>
							</div>
							<!-- .row -->
		      			</div>
		      			<!-- .modal-body -->
		      		</form>
					<!-- #gameForm -->	
		      		<div id="gameModalFooter" class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><s:text name="admin.btn.cancel"/></button>
						<button type="button" class="btn btn-primary btn-sm" id="btnMerge"><s:text name="admin.btn.confirm"/></button>
		      		</div>
	      			
				</div>
				<!-- .modal-content -->
			</div>
			<!-- .modal-dialog -->
		</div>
		<!-- End of gameModal -->
		
		<!-- Begin of deleteModal -->
		<div class="modal fade" id="deleteModal" role="dialog" aria-labelledby="deleteModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<div id="deleteModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="deleteModalTitle" class="modal-title"><s:text name="admin.gameAdmin.delete"/></h3>
					</div>
					<!-- modal-header -->
					
					<div class="modal-body">
					
						<div class="row">
							<div class="col-sm-12">
								<h4 class="text-center"><s:text name="admin.gameAdmin.delete.message"/></h4>
							</div>
						</div>
						<!-- .row -->
					</div>
					<!-- .modal-body -->
							
		      		<div id="deleteModalFooter" class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><s:text name="admin.btn.cancel"/></button>
						<button type="button" class="btn btn-primary btn-sm" id="btnDelete"><s:text name="admin.btn.confirm"/></button>
		      		</div>
		      		<!-- .modal-footer -->
				</div>
				<!-- .modal-content -->
			</div>
			<!-- .modal-dialog -->
		</div>
		<!-- End of deleteModal -->
		
		<!-- Begin of statusModal -->
		<div class="modal fade" id="statusModal" role="dialog" aria-labelledby="statusModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<div id="statusModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="statusModalTitle" class="modal-title"><s:text name="admin.gameAdmin.setGameScore"/></h3>
					</div>
					<!-- modal-header -->
					
					<div class="modal-body">
					
						<div class="row">
							<div class="col-sm-6">
								<div class="form-group">
									<label for="gameScoreAway"><s:text name="admin.game.gameScoreAway"/></label>
									<input class="form-control input-sm form-score" id="gameScoreAway" type="text" name="model.gameScoreAway">
								</div>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="gameScoreHome"><s:text name="admin.game.gameScoreHome"/></label>
									<input class="form-control input-sm form-score" id="gameScoreHome" type="text" name="model.gameScoreHome">
								</div>
							</div>
						</div>
						<!-- .row -->
						
					</div>
					<!-- .modal-body -->
							
		      		<div id="statusModalFooter" class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><s:text name="admin.btn.cancel"/></button>
						<button type="button" class="btn btn-primary btn-sm" id="btnStatus"><s:text name="admin.btn.confirm"/></button>
		      		</div>
		      		<!-- .modal-footer -->
				</div>
				<!-- .modal-content -->
			</div>
			<!-- .modal-dialog -->
		</div>
		<!-- End of statusModal -->
		
		<!-- Begin of openModal -->
		<div class="modal fade" id="openModal" role="dialog" aria-labelledby="openModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<div id="openModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="openModalTitle" class="modal-title"><s:text name="admin.gameAdmin.openOdds"/></h3>
					</div>
					<!-- modal-header -->
					
					<div class="modal-body">
					
						<div class="row">
							<div class="col-sm-12">
								<h4 class="text-center"><s:text name="admin.gameAdmin.openOdds.message"/></h4>
							</div>
						</div>
						<!-- .row -->
					</div>
					<!-- .modal-body -->
							
		      		<div id="openModalFooter" class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><s:text name="admin.btn.cancel"/></button>
						<button type="button" class="btn btn-primary btn-sm" id="btnOpen"><s:text name="admin.btn.confirm"/></button>
		      		</div>
		      		<!-- .modal-footer -->
				</div>
				<!-- .modal-content -->
			</div>
			<!-- .modal-dialog -->
		</div>
		<!-- End of openModal -->
		
		<!-- Begin of payoutModal -->
		<div class="modal fade" id="payoutModal" role="dialog" aria-labelledby="payoutModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<div id="payoutModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="payoutModalTitle" class="modal-title"><s:text name="admin.gameAdmin.payout"/></h3>
					</div>
					<!-- modal-header -->
					
					<div class="modal-body">
					
						<div class="row">
							<div class="col-sm-12">
								<h4 class="text-center"><s:text name="admin.gameAdmin.payout.message"/></h4>
							</div>
						</div>
						<!-- .row -->
					</div>
					<!-- .modal-body -->
							
		      		<div id="payoutModalFooter" class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><s:text name="admin.btn.cancel"/></button>
						<button type="button" class="btn btn-primary btn-sm" id="btnPayout"><s:text name="admin.btn.confirm"/></button>
		      		</div>
		      		<!-- .modal-footer -->
				</div>
				<!-- .modal-content -->
			</div>
			<!-- .modal-dialog -->
		</div>
		<!-- End of payoutModal -->
		
		<!-- Begin of payoutTodayModal -->
		<div class="modal fade" id="payoutTodayModal" role="dialog" aria-labelledby="payoutTodayModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<div id="payoutTodayModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="payoutTodayModalTitle" class="modal-title"><s:text name="admin.gameAdmin.payoutToday"/></h3>
					</div>
					<!-- modal-header -->
					
					<div class="modal-body">
					
						<div class="row">
							<div class="col-sm-12">
								<h4 class="text-center"><s:text name="admin.gameAdmin.payoutToday.message"/></h4>
							</div>
						</div>
						<!-- .row -->
					</div>
					<!-- .modal-body -->
							
		      		<div id="payoutTodayModalFooter" class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><s:text name="admin.btn.cancel"/></button>
						<button type="button" class="btn btn-primary btn-sm" id="btnPayoutToday"><s:text name="admin.btn.confirm"/></button>
		      		</div>
		      		<!-- .modal-footer -->
				</div>
				<!-- .modal-content -->
			</div>
			<!-- .modal-dialog -->
		</div>
		<!-- End of payoutTodayModal -->
		<jsp:include page="footer.jsp"/>
	</div>
	<!-- #wrapper -->
	
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/highcharts.js"/>"></script>
<script src="<c:url value="/js/exporting.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script src="<c:url value="/js/admin-navgation.js"/>"></script>
<script>
	(function($) {
		var zh = '${locale.language}' == 'zh';
		
		//Begin of catagory
		var catagory = '${catagory}';
		if (catagory == null || catagory == "") {
			$('#catagory')[0].selectedIndex = 0;
		} else {
			$('#catagory').val(catagory);
		}
		//End of catagory
		
		//Begin of gameTable
		var gameList = $.parseJSON('${json}');
		$.each(gameList, function(index, game) {
			var child = '';
			child += '<tr>';
			child += '<td>' + game.gameNum + '</td>';
			child += '<td>';
			var gameTime = game.gameTime.iLocalMillis;
			if (zh) {
				child += millisecondToDate(gameTime) + ' ' + millisecondToTime(gameTime);
			} else {
				child += millisecondToDateEn(gameTime) + ' ' + millisecondToTimeEn(gameTime);
			}
			
			child += '</td>';
			var teamAway = zh? game.teamAway.teamName:game.teamAway.teamNameEn;
			var teamHome = zh? game.teamHome.teamName:game.teamHome.teamNameEn;
			child += '<td>' + teamAway + '</td>';
			child += '<td>' + teamHome + '</td>';
			
			var currentDate = new Date().getTime();
			var gameTime = new Date(game.gameTime.iLocalMillis - 8 * 60 * 60 * 1000).getTime();
			
			if (game.gameStatus == 3) {
				child += '<td><button type="button" class="btn btn-success btn-xs disabled btn-block"><s:text name="admin.gameAdmin.status.paid"/></button></td>';
				child += '<td>';
			} else if (game.gameStatus == 2)  {
				child += '<td><button type="button" class="btn btn-warning btn-xs disabled btn-block"><s:text name="admin.gameAdmin.status.finished"/></button></td>';
				child += '<td>';
				child += '<button type="button" value="' + game.id + '" class="btn btn-default btn-xs btn-status" data-toggle="modal" data-target="#statusModal"><i class="fa fa-fw fa-flag"></i></button>';
				child += '<button type="button" value="' + game.id + '" class="btn btn-default btn-xs btn-payout left5" data-toggle="modal" data-target="#payoutModal"><i class="fa fa-fw fa-trophy"></i></button>';
			} else if (currentDate >= gameTime) {
				child += '<td><button type="button" class="btn btn-primary btn-xs disabled btn-block"><s:text name="admin.gameAdmin.status.progress"/></button></td>';
				child += '<td>';
				child += '<button type="button" value="' + game.id + '" class="btn btn-default btn-xs btn-status" data-toggle="modal" data-target="#statusModal"><i class="fa fa-fw fa-flag"></i></button>';
			} else if (game.gameStatus == 1) {
				child += '<td><button type="button" class="btn btn-info btn-xs disabled btn-block"><s:text name="admin.gameAdmin.status.opened"/></button></td>';
				child += '<td>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-default btn-xs btn-edit" data-toggle="modal" data-target="#gameModal"><i class="fa fa-fw fa-pencil-square-o"></i></button>';
			} else {
				child += '<td><button type="button" class="btn btn-xs disabled btn-block"><s:text name="admin.gameAdmin.status.unopened"/></button></td>';
				child += '<td>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-default btn-xs btn-edit" data-toggle="modal" data-target="#gameModal"><i class="fa fa-fw fa-pencil-square-o"></i></button>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-default btn-xs btn-del left5" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-fw fa-trash-o"></i></button>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-default btn-xs btn-open left5" data-toggle="modal" data-target="#openModal"><i class="fa fa-fw fa-check-square-o"></i></button>';
			}
			child += '</td>';
			child += '</tr>';
			
			$('#gameList').append(child);
		});
		//End of gameTable
		
		//Begin of listBallType
		$.ajax({
			url: '<c:url value="/admin/teamAdmin?method:getBallTypes"/>',
			type: 'post',
			dataType: 'json',
			success: function(data) {
				var child = '';
				$.each(data, function(index, ballType) {
					switch(ballType) {
						case 'Baseball': child += '<option value="Baseball" selected><s:text name="admin.teamAdmin.ballType.baseball"/></option>'; break;
						case 'Basketball': child += '<option value="Basketball"><s:text name="admin.teamAdmin.ballType.basketball"/></option>'; break;
						case 'Soccer': child += '<option value="Soccer"><s:text name="admin.teamAdmin.ballType.soccer"/></option>'; break;
					}
				});
				$('#ballType').append(child);
			},
			async: false
		});
		$('#ballType').change(function() {
			resetInput();
			listLeague();
		});
				
		//End of listBallType
		
		//Begin of listLeague
		function listLeague() {
			$('#leagueName').empty();
			$.ajax({
				url: '<c:url value="/admin/teamAdmin?method:getLeagueNames"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.ballType':$('#ballType').val()
				},
				success: function(data) {
					$.each(data, function(index, leagueName) {
						var str = '<option value="' + leagueName + '">' + leagueName + '</option>';
						$('#leagueName').append(str);
					});
					$('#leagueName')[0].selectedIndex = 0;
				},
				async: false
			});
			$('#leagueName').change();
		}
		$('#leagueName').change(listTeam);
		//End of listLeague
		
		//Begin of listTeam
		function listTeam() {
			$('#teamAwayList,#teamHomeList').empty();
			$.ajax({
				url: '<c:url value="/admin/teamAdmin?method:select"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.leagueName':$('#leagueName').val()
				},
				success: function(data) {
					console.log(data);
					$.each(data, function(key, value) {
						var teamName = zh? value.teamName:value.teamNameEn;
						var str = '<option value=' + value.id + '>' + teamName + '</option>';
						$('#teamAwayList,#teamHomeList').append(str);
					});
					
					$('#teamAwayList')[0].selectedIndex = 0;
					$('#teamAwayList').change();
					$('#teamHomeList')[0].selectedIndex = 1;
					$('#teamHomeList').change();
				},
				async: false
			});
		}
		//End of listTeam
		
		//Begin of btnAddGame
		$('#btnAddGame').click(function() {
			$('#ballType')[0].selectedIndex = 0;
			$('#ballType').change();
			resetInput();
		});
		//End of btnAddGame
		
		//Begin of btnEdit
		$('.btn-edit').click(function() {
			var gameId = $(this).val();
			$('#btnMerge').val(gameId);
			$('#gameModalTitle').text('<s:text name="admin.gameAdmin.edit"/>');
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:select"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':gameId
				},
				success: function(data) {
					var dateTime = new Date(data.gameTime.iLocalMillis);
					var year = dateTime.getUTCFullYear();
					var month = addZero(dateTime.getUTCMonth() + 1);
					var date = addZero(dateTime.getUTCDate());
					var hours = addZero(dateTime.getUTCHours());
					var minutes = addZero(dateTime.getUTCMinutes());
					var teamAwayId = data.teamAway.id;
					var teamHomeId = data.teamHome.id;
					var dataLeagueName = data.teamHome.leagueName;
					var dataLeagueNameEn = data.teamHome.leagueNameEn;
					var odds = data.odds;
					function addZero(str) {
						if (str < 10) {
							str = '0' + str;
						}
						return str;
					}
					$('#gameTime').val(year + '-' + month + '-' + date + ' ' + hours + ':' + minutes);
					$('#ballType').val(data.ballType);
					$('#ballType').change();
					if (zh) {
						$('#leagueName').val(dataLeagueName);
					} else {
						$('#leagueName').val(dataLeagueNameEn);
					}
					$('#leagueName').change();
					if (teamAwayId != null && teamHomeId != null) {
						$('#teamAwayList').val(teamAwayId);
						$('#teamAwayList').change();
						$('#teamHomeList').val(teamHomeId);
						$('#teamHomeList').change();
						if (odds.length != 0) {
							$.each(odds, function(index, odd) {
								$('[name$="' + odd.oddType + '"]').val(odd.oddValue.toFixed(2));
								if (odd.oddType == "ATS_A") {
									$('#ATS_A_Combination').val(odd.oddCombination.toFixed(2));
								} else if (odd.oddType == "ATS_H") {
									$('#ATS_H_Combination').val(odd.oddCombination.toFixed(2));
								} else if (odd.oddType == "SC_H") {
									$('#SC_Combination').val(odd.oddCombination.toFixed(2));
								}
							});
						} else {
							$('.form-decimal').val('2.00');
						}
					} else {
						$('#teamAwayList')[0].selectedIndex = 0;
						$('#teamHomeList')[0].selectedIndex = 1;
						resetInput();
					}
				},
				async: false
			});
		});
		//End of btnEdit
		
		//Begin of btnStatus
		$('.btn-status').click(function() {
			$('#btnStatus').val($(this).val());
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:select"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':$(this).val()
				},
				success: function(data) {
					$('#gameScoreAway').val(data.gameScoreAway);
					$('#gameScoreHome').val(data.gameScoreHome);
				},
				async: false
			});
		});
		
		$('#btnStatus').click(function() {
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:update"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':$(this).val(),
					'model.isEnd':true,
					'model.gameScoreAway':$('#gameScoreAway').val(),
					'model.gameScoreHome':$('#gameScoreHome').val()
				},
				success: function(data) {
				},
				async: false
			});
			window.location.reload(true);
		});
		//End of btnStatus
		
		//Begin of btnMerge
		$('#btnMerge').click(function() {
			var error = 0;
			if ($('#gameTime').val().search(/[0-9]/) == -1) {
				if (!$('#gameTime').parent().hasClass('has-error')) {
					$('#gameTime').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#gameTime').parent().removeClass('has-error');
			}
			
			if ($('#teamAwayList').val() == $('#teamHomeList').val()) {
				if (!$('#teamAwayList').parent().hasClass('has-error')) {
					$('#teamAwayList').parent().addClass('has-error');
				}
				if (!$('#teamHomeList').parent().hasClass('has-error')) {
					$('#teamHomeList').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#teamAwayList').parent().removeClass('has-error');
				$('#teamHomeList').parent().removeClass('has-error');
			}
			
			if (error > 0) {
				return;
			}
			
			var gameId = $(this).val();
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:insert"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':gameId,
					'model.ballType':$('#ballType').val(),
					'model.leagueName':$('#leagueName').val(),
					'model.gameNum':'${maxGameNum + 1}',
					'model.gameTime':$('#gameTime').val(),
					'teamAwayId':$('#teamAwayList').val(),
					'teamHomeId':$('#teamHomeList').val(),
					'model.gameScoreAway':0,
					'model.gameScoreHome':0
				},
				success: function(data) {
					$('.form-decimal').each(function() {
						var oddCombination = 0;
						
						var oddType = $(this).attr('name');
						if (oddType.indexOf('EO_') != -1) {
							oddType = oddType.replace('EO_', '');
						} else if (oddType == 'ATS_A') {
							oddCombination = $('#ATS_A_Combination').val();
						} else if (oddType == 'ATS_H') {
							oddCombination = $('#ATS_H_Combination').val();
						} else if (oddType.indexOf('SC_') != -1) {
							oddCombination = $('#SC_Combination').val();
						}
						$.ajax({
							url: '<c:url value="/admin/oddsAdmin"/>',
							type: 'post',
							dataType: 'json',
							data: {
								'model.gameId':data,
						    	'model.oddType':oddType,
						    	'model.oddValue':$(this).val(),
						    	'model.oddCombination':oddCombination,
						    	'model.count':0,
							},
							success: function(data) {
							},
							async: false
						});
					});
				},
				async: false
			});
			window.location.reload(true);
		});
		//End of btnMerge
		
		//Begin of btnDelete		
		$('.btn-del').click(function() {
			$('#btnDelete').val($(this).val());
		});
		
		$('#btnDelete').click(function() {
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:delete"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':$(this).val()
				},
				success: function(data) {
				},
				async: false
			});
			window.location.reload(true);
		});
		//End of btnDelete
		
		//Begin of btnPayout
		$('.btn-payout').click(function() {
			$('#btnPayout').val($(this).val());
		});
		
		$('#btnPayout').click(function() {
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:payout"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':$(this).val()
				},
				success: function(data) {
				},
				async: false
			});
			window.location.reload(true);
		});
		//End of btnPayout
		
		//Begin of btnPayoutToday
		$('#btnPayoutToday').click(function() {
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:payoutToday"/>',
				type: 'post',
				dataType: 'json',
				success: function(data) {
				},
				async: false
			});
			window.location.reload(true);
		});
		//End of btnPayoutToday
		
		//Begin of btnOpen
		$('.btn-open').click(function() {
			$('#btnOpen').val($(this).val());
		});
		
		$('#btnOpen').click(function() {
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:open"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':$(this).val()
				},
				success: function() {
				},
				async: false
			});
			window.location.reload(true);
		});
		//End of btnOpen
		
		//Begin of styling
		function resetInput() {
			$('#gameTime').val('');
			$('#btnMerge').val('');
			$('.form-decimal').val('2.00');
			switch ($('#ballType').val()) {
				case 'Baseball':
					$('#ATS_A_Combination').val('1.50');
					$('#ATS_H_Combination').val('-1.50');
					$('#SC_Combination').val('7.50');
					break;
				case 'Basketball':
					$('#ATS_A_Combination').val('15.50');
					$('#ATS_H_Combination').val('-15.50');
					$('#SC_Combination').val('125.50');
					break;
				case 'Soccer':
					$('#ATS_A_Combination').val('1.50');
					$('#ATS_H_Combination').val('-1.50');
					$('#SC_Combination').val('3.50');
					break;
			}
			
			$('#gameTime').datetimepicker({
				'defaultDate': new Date(),
				'minDate': new Date(),
				'format': 'Y-m-d H:i',
				'mask': true,
				'lang': 'ch'
			});
			
			$('.form-decimal').TouchSpin({
				'min': 1.00,
				'step': 0.05,
				'decimals': 2,
				'buttondown_class': 'btn btn-info',
	            'buttonup_class': 'btn btn-success'
			});
			
			$('.form-score').TouchSpin({
				'min': 0,
				'max': 999,
				'initval': 0,
				'step': 1,
				'buttondown_class': 'btn btn-info',
	            'buttonup_class': 'btn btn-success'
			});
			
			$('#ATS_A_Combination, #ATS_H_Combination').TouchSpin({
				'step': 0.05,
				'decimals': 2,
				'buttondown_class': 'btn btn-info',
	            'buttonup_class': 'btn btn-success'
			});
			
			$('#ATS_A_Combination').change(function() {
				value = $(this).val() * -1;
				if (value % 1 == 0) {
					value = value.toString() + '.00';
				} else if (value * 10 % 1 == 0) {
					value = value.toString() + '0';
				}
				$('#ATS_H_Combination').val(value);
			});
				
			$('#ATS_H_Combination').change(function() {
				value = $(this).val() * -1;
				if (value % 1 == 0) {
					value = value.toString() + '.00';
				} else if (value * 10 % 1 == 0) {
					value = value.toString() + '0';
				}
				$('#ATS_A_Combination').val(value);
			});
			
			$('#SC_Combination').TouchSpin({
				'min': 0,
				'max': 999,
				'step': 0.05,
				'decimals': 2,
				'buttondown_class': 'btn btn-info',
	            'buttonup_class': 'btn btn-success'
			});
		}
		
		resetInput();
		
		$('.btn-edit').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.gameAdmin.edit"/>'
		});
		
		$('.btn-del').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.gameAdmin.delete"/>'
		});
		
		$('.btn-status').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.gameAdmin.setGameScore"/>'
		});
		
		$('.btn-payout').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.gameAdmin.payout"/>'
		});
		
		$('.btn-open').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.gameAdmin.openOdds"/>'
		});
				
		$('#gameTable').dataTable({
			'order': [[ 0, 'desc' ]],
			'oLanguage': {
				'sProcessing': '<s:text name="dataTables.sProcessing"/>',
				'sLengthMenu': '<s:text name="dataTables.sLengthMenu"/>',
				'sZeroRecords': '<s:text name="dataTables.sZeroRecords"/>',
				'sInfo': '<s:text name="dataTables.sInfo"/>',
				'sInfoEmpty': '<s:text name="dataTables.sInfoEmpty"/>',
				'sInfoFiltered': '<s:text name="dataTables.sInfoFiltered"/>',
				'sInfoPostFix': '',
				'sSearch': '<s:text name="dataTables.sSearch"/>',
				'sUrl': '',
				'oPaginate': {
					'sFirst': '<s:text name="dataTables.oPaginate.sFirst"/>',
					'sPrevious': '<s:text name="dataTables.oPaginate.sPrevious"/>',
					'sNext': '<s:text name="dataTables.oPaginate.sNext"/>',
					'sLast': '<s:text name="dataTables.oPaginate.sLast"/>'
				}
			}
		});
		
		var currentUrl = document.location.pathname;
		var currentPath = currentUrl.substr(currentUrl.lastIndexOf('/') + 1);
		$('nav a[href*="' + currentPath + '"]').parent().addClass('active');
		//End of styling
		
	})(jQuery);
</script>
</body>
</html>