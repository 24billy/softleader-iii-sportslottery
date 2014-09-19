<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>首頁</title>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css"/>">
<!-- <link rel="stylesheet" href="<c:url value="/css/metro-bootstrap.min.css"/>"> -->
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
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
		  							<li class="active"><i class="fa fa-fw fa-home"></i><span class="left5">首頁</span></li>
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
																<i class="fa fa-fw fa-bullhorn"></i><span class="left10">最新公告</span>
																<a class="btn btn-default btn-sm" data-toggle="collapse" data-parent="#listPanel" href="#announcePanel"><i class="fa fa-fw fa-bars"></i></a>
															</h4>
														</div>
														<div id="announcePanel" class="panel-collapse collapse in">
															<div class="panel-body">
																<table id="announceTable" class="table table-hover table-condensed">
																	<thead>
																		<tr>
																			<th>公告標題</th>
																			<th>公告內容</th>
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
																<i class="fa fa-fw fa-table"></i><span class="left10">最新賽事</span>
																<a class="btn btn-default btn-sm" data-toggle="collapse" data-parent="#listPanel" href="#gamePanel"><i class="fa fa-fw fa-bars"></i></a>
															</h4>
														</div>
														<div id="gamePanel" class="panel-collapse collapse">
															<div class="panel-body">
																<table id="gameTable" class="table table-hover table-condensed">
																	<thead>
																		<tr>
																			<th>賽事編號</th>
																			<th>主隊</th>
																			<th>客隊</th>
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
																<i class="fa fa-fw fa-pencil-square-o"></i><span class="left10">新增公告</span>
																<a class="btn btn-default btn-sm" data-toggle="collapse" data-parent="#formPanel" href="#announceFormPanel"><i class="fa fa-fw fa-bars"></i></a>
															</h4>
														</div>
														<!-- .panel-heading -->
														<div id="announceFormPanel" class="panel-collapse collapse in">
															<div class="panel-body">
																<div class="row">
																
																	<div class="col-sm-12">
																		<div class="form-group">
																			<label for="announceTitle">公告標題</label>
																			<input class="form-control" type="text" name="model.announceTitle" id="announceTitle">
																		</div>
																	</div>
																	
																	<div class="col-sm-12">
																		<div class="form-group">
																			<label for="announceTitle">公告內容</label>
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
																		<button type="button" class="btn btn-success btn-sm pull-right" id="btnAnnounce">新增</button>
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
																<i class="fa fa-fw fa-pencil-square-o"></i><span class="left10">新增賽事</span>
																<a class="btn btn-default btn-sm" data-toggle="collapse" data-parent="#formPanel" href="#gameFormPanel"><i class="fa fa-fw fa-bars"></i></a>
															</h4>
														</div>
														<div id="gameFormPanel" class="panel-collapse collapse">
															<form role="form">
																<div class="panel-body">
																	<div class="row">
																		<div class="col-sm-12">
																			<div class="form-group">
																				<label for="leagueName">聯盟名稱</label>
																				<select class="form-control input-sm" id="leagueName" name="model.leagueName">
																					<option value="美國職棒" selected>美國職棒</option>
																					<option value="中華職棒">中華職棒</option>
																					<option value="中央聯盟">中央聯盟</option>
																					<option value="太平洋聯盟">太平洋聯盟</option>
																					<option value="韓國職棒">韓國職棒</option>
																				</select>
																			</div>
																		</div>
																		
																		<div class="col-sm-12">
																			<div class="form-group">
																				<label for="">賽事編號</label>
																				<input class="form-control input-sm" type="text" id="gameNum" name="model.gameNum" readonly>
																			</div>
																		</div>
																		
																		<div class="col-sm-12">
																			<div class="row">
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="teamAwayList">客隊隊伍</label>
																						<select class="form-control input-sm" id="teamAwayList" name="teamAwayId">
																						</select>
																					</div>
																				</div>
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="teamHomeList">主隊隊伍</label>
																						<select class="form-control input-sm" id="teamHomeList" name="teamHomeId">
																						</select>
																					</div>
																				</div>
																			</div>
																			<!-- .row -->
																		</div>
																		
																		<div class="col-sm-12">
																			<div class="form-group">
																				<label for="gameTime">賽事時程</label>
																				<input class="form-control input-sm" id="gameTime" type="text" name="model.gameTime">
																			</div>
																		</div>
																		
																		<div class="col-sm-12">
																			<div class="row">
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="SU_A">不讓分(客)</label>
																						<input class="form-control input-sm form-decimal" id="SU_A" type="text" name="SU_A">
																					</div>
																				</div>
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="SU_H">不讓分(主)</label>
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
																						<label for="ATS_A">讓分(客)</label>
																						<input class="form-control input-sm form-decimal" id="ATS_A" type="text" name="ATS_A">
																					</div>
																				</div>
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="ATS_H">讓分(主)</label>
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
																						<label for="SC_H">總分(大)</label>
																						<input class="form-control input-sm form-decimal" id="SC_H" type="text" name="SC_H">
																					</div>
																				</div>
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="SC_L">總分(小)</label>
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
																						<label for="EVEN">總分(單)</label>
																						<input class="form-control input-sm form-decimal" id="EVEN" type="text" name="EO_EVEN">
																					</div>
																				</div>
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="ODD">總分(雙)</label>
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
																						<label for="ATS_A_Combination">讓分數設定(客)</label>
																						<input class="form-control input-sm" id="ATS_A_Combination" type="text" name="ATS_A_Combination">
																					</div>
																				</div>
																				<div class="col-sm-6">
																					<div class="form-group">
																						<label for="ATS_H_Combination">讓分數設定(主)</label>
																						<input class="form-control input-sm" id="ATS_H_Combination" type="text" name="ATS_H_Combination">
																					</div>
																				</div>
																			</div>
																		</div>
																		
																		<div class="col-sm-12">
																			<div class="form-group">
																				<label for="SC_Combination">總分設定</label>
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
																		<button type="button" class="btn btn-success btn-sm pull-right" id="btnGame">新增</button>
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
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/highcharts.js"/>"></script>
<script src="<c:url value="/js/exporting.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script src="<c:url value="/js/admin-navgation.js"/>"></script>
<script>
	(function($) {
		
		/* Begin of gameTable */
		var gameNumArray = new Array();
		$.post('<c:url value="/admin/gameAdmin?method:selectLatestFiveRecord"/>', function(data) {
			
			$.each(data, function(index, game) {
				var child = '';
				child += '<tr>';
				child += '<td>' + game.gameNum + '</td>';
				child += '<td>' + game.teamAway.teamName + '</td>';
				child += '<td>' + game.teamHome.teamName + '</td>';
				child += '</tr>';
				$('#gameList').append(child);
				
				gameNumArray.push(game.gameNum);
			});
			
			var maxGameNum = Math.max.apply(Math, gameNumArray);
			$('[name="model.gameNum"]').val(maxGameNum + 1);
		}, 'json');
		/* End of gameTable */
		
		/* Begin of announceTable */
		$.post('<c:url value="/admin/announceAdmin?method:selectLatestFiveRecord"/>', function(data) {
			$.each(data, function(index, announce) {
				
				var child = '';
				child += '<tr>';
				child += '<td>' + announce.announceTitle + '</td>';
				child += '<td>' + announce.announceContent + '</td>';
				child += '</tr>';
				$('#announceList').append(child);
				
			});
		}, 'json');
		/* End of announceTable */
		
		//Begin of btnAnnounce
		$('#btnAnnounce').click(function() {
			$.post('<c:url value="/admin/announceAdmin?method:insert"/>',{
				'model.announceTitle':$('#announceTitle').val(),
				'model.announceContent':$('#announceContent').val()
			});
			
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnAnnounce
		
		//Begin of teamListChangeEvent
		$('#teamAwayList').change(function() {
			var value = $(this).val();
			$('#teamHomeList option').prop('disabled', false).css('display', 'inline');
			$('#teamHomeList option[value=' + value + ']').prop('disabled', true).css('display', 'none');
		});
		
		$('#teamHomeList').change(function() {
			var value = $(this).val();
			$('#teamAwayList option').prop('disabled', false).css('display', 'inline');
			$('#teamAwayList option[value=' + value + ']').prop('disabled', true).css('display', 'none');
		});
		//End of teamListChangeEvent
		
		//Begin of listTeam
		$('#leagueName').change(function() {
			listTeam();
		});
		
		function listTeam() {
			$('#teamAwayList,#teamHomeList').empty();

			$.post('<c:url value="/admin/teamAdmin?method:select"/>',{
				'model.leagueName':$('#leagueName').val()
			}, function(data) {
				$.each(data, function(key, value) {
					var str = '<option value=' + value.id + '>' + value.teamName + '</option>';
					$('#teamAwayList,#teamHomeList').append(str);
				});
				
				$('#teamAwayList')[0].selectedIndex = 0;
				$('#teamAwayList').change();
				$('#teamHomeList')[0].selectedIndex = 1;
				$('#teamHomeList').change();
			}, 'json');
		}
		
		listTeam();
		//End of listTeam
		
		//Begin of btnGame
		$('#btnGame').click(function() {
			$.post('<c:url value="/admin/gameAdmin?method:insert"/>', {
				//'model.ballType':$('[name="catagory"]').val(),
				'model.ballType':'Baseball',
				'model.leagueName':$('[name="model.leagueName"]').val(),
				'model.gameNum':$('[name="model.gameNum"]').val(),
				'model.gameTime':$('[name="model.gameTime"]').val(),
				'teamAwayId':$('[name="teamAwayId"]').val(),
				'teamHomeId':$('[name="teamHomeId"]').val(),
				'model.gameScoreAway':0,
				'model.gameScoreHome':0
			}, function(data) {
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
					$.post('<c:url value="/admin/oddsAdmin"/>', {
						'model.gameId':data,
				    	'model.oddType':oddType,
				    	'model.oddValue':$(this).val(),
				    	'model.oddCombination':oddCombination,
				    	'model.count':0,
					}, function(data) {
						return true;
					});
				});
			});
				
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnGame
		
		/* Begin of styling */
		function resetInput() {
			$('#gameTime').val('');
			$('#btnMerge').val('');
			$('.form-decimal').val('2.00')
			$('#ATS_A_Combination').val('1.50');
			$('#ATS_H_Combination').val('-1.50');
			$('#SC_Combination').val('7.50');
			
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
				'initval': 0,
				'step': 1,
				'buttondown_class': 'btn btn-info',
	            'buttonup_class': 'btn btn-success'
			});
			
			$('#ATS_A_Combination, #ATS_H_Combination').TouchSpin({
				'min': -3.50,
				'max': 3.50,
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
				'min': 6.50,
				'max': 8.50,
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