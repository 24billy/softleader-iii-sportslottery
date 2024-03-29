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
<title><s:text name="admin.home"/></title>
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
		  							<li class="active"><i class="fa fa-fw fa-home"></i><span class="left5"><s:text name="admin.home"/></span></li>
								</ol>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-sm-12">
								<div class="row">
									<div class="col-sm-6">
										<div class="row">
										
											<div class="col-sm-12">
												<div class="panel-group" id="listPanel">
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
																<i class="fa fa-fw fa-bullhorn"></i><span class="left10"><s:text name="admin.home.announce"/></span>
																<a class="btn btn-default btn-sm" data-toggle="collapse" data-parent="#listPanel" href="#announcePanel"><i class="fa fa-fw fa-bars"></i></a>
															</h4>
														</div>
														<div id="announcePanel" class="panel-collapse collapse in">
															<div class="panel-body">
																<table id="announceTable" class="table table-hover table-condensed">
																	<thead>
																		<tr>
																			<th style="width: 20%">Id</th>
																			<th style="width: 40%"><s:text name="admin.announce.announceTitle"/></th>
																			<th style="width: 40%"><s:text name="admin.announce.announceContent"/></th>
																		</tr>
																	</thead>
																	<tbody id="announceList">
																	</tbody>
																</table>
															</div>
															<!-- .panel-body -->
														</div>
														<!-- #announcePanel -->
													</div>
													<!-- .panel -->
													
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
																<i class="fa fa-fw fa-table"></i><span class="left10"><s:text name="admin.home.game"/></span>
																<a class="btn btn-default btn-sm" data-toggle="collapse" data-parent="#listPanel" href="#gamePanel"><i class="fa fa-fw fa-bars"></i></a>
															</h4>
														</div>
														<div id="gamePanel" class="panel-collapse collapse">
															<div class="panel-body">
																<table id="gameTable" class="table table-hover table-condensed">
																	<thead>
																		<tr>
																			<th style="width: 30%"><s:text name="admin.game.gameNum"/></th>
																			<th style="width: 35%"><s:text name="admin.game.teamAway"/></th>
																			<th style="width: 35%"><s:text name="admin.game.teamHome"/></th>
																		</tr>
																	</thead>
																	<tbody id="gameList">
																	</tbody>
																</table>
															</div>
															<!-- .panel-body -->
														</div>
														<!-- #gamePanel -->
													</div>
													<!-- .panel -->
												</div>
												<!-- .panel-group -->
											</div>
										</div>
										<!-- .row -->
									</div>
									<div class="col-sm-6">
										<div class="row">
											
											<div class="col-sm-12">
												<div class="panel-group" id="formPanel">
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
																<i class="fa fa-fw fa-pencil-square-o"></i><span class="left10"><s:text name="admin.form.announceForm"/></span>
																<a class="btn btn-default btn-sm" data-toggle="collapse" data-parent="#formPanel" href="#announceFormPanel"><i class="fa fa-fw fa-bars"></i></a>
															</h4>
														</div>
														<!-- .panel-heading -->
														<div id="announceFormPanel" class="panel-collapse collapse in">
															<div class="panel-body">
																<div class="row">
																
																	<div class="col-sm-12">
																		<div class="form-group">
																			<label for="announceTitle" class="control-label"><s:text name="admin.announce.announceTitle"/></label>
																			<input class="form-control input-sm" type="text" name="model.announceTitle" id="announceTitle">
																		</div>
																	</div>
																	
																	<div class="col-sm-12">
																		<div class="form-group">
																			<label for="announceContent" class="control-label"><s:text name="admin.announce.announceContent"/></label>
																			<textarea class="form-control" name="model.announceContent" id="announceContent" rows="5"></textarea>
																		</div>
																	</div>
																</div>
																<!-- .row -->
															</div>
															<!-- .panel-body -->
															<div class="panel-footer">
																<div class="row">
																	<div class="col-sm-12">
																		<button type="button" class="btn btn-success btn-sm pull-right" id="btnAnnounce"><s:text name="admin.btn.insert"/></button>
																	</div>
																</div>
															</div>
															<!-- .panel-footer -->
														</div>
														<!-- #announceFormPanel -->
													</div>
													<!-- .panel -->
													
													<div class="panel panel-default">
														<div class="panel-heading">
															<h4 class="panel-title">
																<i class="fa fa-fw fa-pencil-square-o"></i><span class="left10"><s:text name="admin.form.gameForm"/></span>
																<a class="btn btn-default btn-sm" data-toggle="collapse" data-parent="#formPanel" href="#gameFormPanel"><i class="fa fa-fw fa-bars"></i></a>
															</h4>
														</div>
														<div id="gameFormPanel" class="panel-collapse collapse">
															<form role="form">
																<div class="panel-body">
																	<div class="row">
																		<div class="col-sm-12">
																			<div class="form-group">
																				<label for="ballType"><s:text name="admin.team.ballType"/></label>
																				<select class="form-control input-sm" id="ballType" name="model.ballType">
																					
																				</select>
																			</div>
																		</div>
																		
																		<div class="col-sm-12">
																			<div class="form-group">
																				<div class="form-group">
																					<label for="leagueName"><s:text name="admin.team.leagueName"/></label>
																					<select class="form-control input-sm" id="leagueName" name="model.leagueName">
																					</select>
																				</div>
																			</div>
																		</div>
																		
																		<div class="col-sm-12">
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
																		</div>
																		
																		<div class="col-sm-12">
																			<div class="form-group">
																				<label for="gameTime" class="control-label"><s:text name="admin.game.gameTime"/></label>
																				<input class="form-control input-sm" id="gameTime" type="text" name="model.gameTime">
																			</div>
																		</div>
																		
																		<div class="col-sm-12">
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
																		</div>
																		
																		<div class="col-sm-12">
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
																		</div>
																		
																		<div class="col-sm-12">
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
																		</div>
																		
																		<div class="col-sm-12">
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
																		
																		<div class="col-sm-12">
																			<div class="row">
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="ATS_A_Combination"><s:text name="admin.odds.ATS_A_Combination"/></label>
																						<input class="form-control input-sm" id="ATS_A_Combination" type="text" name="ATS_A_Combination">
																					</div>
																				</div>
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="ATS_H_Combination"><s:text name="admin.odds.ATS_H_Combination"/></label>
																						<input class="form-control input-sm" id="ATS_H_Combination" type="text" name="ATS_H_Combination">
																					</div>
																				</div>
																			</div>
																		</div>
																		
																		<div class="col-sm-12">
																			<div class="form-group">
																				<label for="SC_Combination"><s:text name="admin.odds.SC_Combination"/></label>
																				<input class="form-control input-sm" id="SC_Combination" type="text" name="SC_Combination">
																			</div>
																		</div>
																	</div>
																	<!-- .row -->
																</div>
																<!-- .panel-body -->
															</form>
															<div class="panel-footer">
																<div class="row">
																	<div class="col-sm-12">
																		<button type="button" class="btn btn-success btn-sm pull-right" id="btnGame"><s:text name="admin.btn.insert"/></button>
																	</div>
																</div>
															</div>
															<!-- .panel-footer -->
														</div>
														<!-- #gameFormPanel -->
													</div>
													<!-- .panel -->
												</div>
												<!-- .panel-group -->
											</div>
										</div>
										<!-- .row -->
									</div>
								</div>
								<!-- .row -->
							</div>
						</div>
						<!-- .row -->
					</div>
					<!-- .container-right -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container -->
		</div>
		<!-- #page-wrapper -->
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
		
		/* Begin of gameTable */
		var gameNumArray = new Array();
		$.ajax({
			url: '<c:url value="/admin/gameAdmin?method:selectLatestFiveRecord"/>',
			type: 'post',
			dataType: 'json',
			success: function(data) {
				$.each(data, function(index, game) {
					var child = '';
					child += '<tr>';
					child += '<td>' + game.gameNum + '</td>';
					if (zh) {
						child += '<td>' + game.teamAway.teamName + '</td>';
						child += '<td>' + game.teamHome.teamName + '</td>';
					} else {
						child += '<td>' + game.teamAway.teamNameEn + '</td>';
						child += '<td>' + game.teamHome.teamNameEn + '</td>';
					}
					child += '</tr>';
					$('#gameList').append(child);
					
					gameNumArray.push(game.gameNum);
				});
				
				var maxGameNum = Math.max.apply(Math, gameNumArray);
				$('[name="model.gameNum"]').val(maxGameNum + 1);
			},
			async: false
		});
		/* End of gameTable */
		
		/* Begin of announceTable */
		$.ajax({
			url: '<c:url value="/admin/announceAdmin?method:selectLatestFiveRecord"/>',
			type: 'post',
			dataType: 'json',
			success: function(data) {
				$.each(data, function(index, announce) {
					
					var child = '';
					child += '<tr>';
					child += '<td>' + announce.id + '</td>';
					child += '<td>' + announce.announceTitle + '</td>';
					child += '<td>' + announce.announceContent + '</td>';
					child += '</tr>';
					$('#announceList').append(child);
					
				});
			},
			async: false
		});
		/* End of announceTable */
		
		//Begin of btnAnnounce
		$('#btnAnnounce').click(function() {
			var error = 0;
			if ($('#announceTitle').val() == "" || chkJS($('#announceTitle').val())) {
				if (!$('#announceTitle').parent().hasClass('has-error')) {
					$('#announceTitle').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#announceTitle').parent().removeClass('has-error');
			}
			if ($('#announceContent').val() == "" || chkJS($('#announceContent').val())) {
				if (!$('#announceContent').parent().hasClass('has-error')) {
					$('#announceContent').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#announceContent').parent().removeClass('has-error');
			}
			
			function chkJS(str) {
				var js = new RegExp('<script[^>]*?>[\\s\\S]*?<\/script>');
				return js.test(str);
			}
				
			if (error > 0) {
				return;
			}
			
			$.ajax({
				url: '<c:url value="/admin/announceAdmin?method:insert"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.announceTitle':$('#announceTitle').val(),
					'model.announceContent':$('#announceContent').val()
				},
				success: function(data) {
					
				},
				async: false
			});
			window.location.reload(true);
		});
		//End of btnAnnounce
		
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
		$('#ballType').change();
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
		$('#leagueName').change();
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
					$.each(data, function(key, value) {
						var teamName = zh? value.teamName:value.teamNameEn;
						var str = '<option value=' + value.id + '>' + teamName + '</option>';
						$('#teamAwayList,#teamHomeList').append(str);
					});
					
					$('#teamAwayList')[0].selectedIndex = 0;
					$('#teamHomeList')[0].selectedIndex = 1;
				},
				async: false
			});
		}
		//End of listTeam
		
		//Begin of btnGame
		$('#btnGame').click(function() {
			var error = 0;
			if ($('#gameTime').val().search(/[0-9]/) == -1) {
				if (!$('#gameTime').parent().hasClass('has-error')) {
					$('#gameTime').parent().addClass('has-error');
				}
				error++;
			} else {
				$('[name="model.gameTime"]').parent().removeClass('has-error');
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
			
			$.ajax({
				url: '<c:url value="/admin/gameAdmin?method:insert"/>',
				type: 'post',
				dataType: 'json',
				data: {
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
		//End of btnGame
		
		/* Begin of styling */
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
				'min': 1,
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
		/* End of styling */
		$('nav a[href$="admin"]').parent().addClass('active');
	})(jQuery);
</script>
</body>
</html>