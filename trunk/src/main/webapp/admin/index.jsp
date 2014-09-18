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
												<div class="panel panel-default">
													<div class="panel-heading">最新公告</div>
													<div class="panel-body">
														<table id="announceTable" class="table table-hover table-condensed order-column compact nowrap">
															<thead>
																<tr>
																	<th>公告標題</th>
																	<th>公告日期</th>
																	<th>修改日期</th>
																</tr>
															</thead>
															<tbody id="announceList">
															</tbody>
														</table>
													</div>
													<!-- .panel-body -->
												</div>
												<!-- .panel -->
											</div>
											
											<div class="col-sm-12">
												<div class="panel panel-default">
													<div class="panel-heading">最新賽事</div>
													<div class="panel-body">
														<table id="gameTable" class="table table-hover table-condensed order-column compact nowrap">
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
												<!-- .panel -->
											</div>
											
										</div>
										<!-- .row -->
									</div>
									<div class="col-sm-6">
										<div class="row">
											
											<div class="col-sm-12">
												<div class="panel panel-default">
													<div class="panel-heading">新增公告</div>
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
												</div>
												<!-- .panel -->
											</div>
											
											<div class="col-sm-12">
												<div class="panel panel-default">
													<div class="panel-heading">新增賽事</div>
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
																		<label for="gameTime">比賽時間</label>
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
																				<label for="ATS_A">讓分(客)(-1.5)</label>
																				<input class="form-control input-sm form-decimal" id="ATS_A" type="text" name="ATS_A">
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<div class="form-group">
																				<label for="ATS_H">讓分(主)(+1.5)</label>
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
																				<label for="SC_H">總分(大7.5)</label>
																				<input class="form-control input-sm form-decimal" id="SC_H" type="text" name="SC_H">
																			</div>
																		</div>
																		<div class="col-sm-6">
																			<div class="form-group">
																				<label for="SC_L">總分(小7.5)</label>
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
															</div>
															<!-- .row -->
														</div>
														<!-- .panel-body -->
													</form>
												</div>
												<!-- .panel -->
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
<script>
	(function($) {
		
		/* Begin of gameTable */
		$.post('<c:url value="/admin/gameAdmin?method:selectLatestFiveRecord"/>', function(data) {
			$.each(data, function(index, game) {
				var child = '';
				child += '<tr>';
				child += '<td>' + game.gameNum + '</td>';
				child += '<td>' + game.teamAway.teamName + '</td>';
				child += '<td>' + game.teamHome.teamName + '</td>';
				child += '</tr>';
				$('#gameList').append(child);
			});
			$('#gameTable').dataTable({
				'responsive': true,
				'autoWidth': false,
				'sDom': '',
				'order': [[ 0, 'desc' ]],
				'columns': [{'width': '30%'},
			            	{'width': '35%'},
			            	{'width': '35%'}]
			});
		}, 'json');
		/* End of gameTable */
		
		/* Begin of announceTable */
		$.post('<c:url value="/admin/announceAdmin?method:selectLatestFiveRecord"/>', function(data) {
			$.each(data, function(index, announce) {
				var child = '';
				child += '<tr>';
				child += '<td>' + announce.announceTitle + '</td>';
				child += '<td>';
				var announceTime = announce.announceTime.iLocalMillis;
				child += millisecondToDate(announceTime) + ' ' + millisecondToTime(announceTime);
				child += '</td>';
				child += '<td>'; 
				var modifiedTime = announce.modifiedTime.iLocalMillis;
				child += millisecondToDate(modifiedTime) + ' ' + millisecondToTime(modifiedTime);
				child += '</td>';
				child += '</tr>';
				$('#announceList').append(child);
			});
			$('#announceTable').dataTable({
				'responsive': true,
				'autoWidth': false,
				'sDom': '',
				'order': [[ 0, 'desc' ]],
				'columns': [{'width': '30%'},
			            	{'width': '35%'},
			            	{'width': '35%'}]
			});
		}, 'json');
		/* End of announceTable */
		
		/* Begin of styling */
		function resetInput() {
			$('#gameTime').val('');
			$('#btnMerge').val('');
			$('.form-decimal').val('2.00')
			
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
		}
		
		resetInput();
		/* End of styling */
		$('nav a[href$="admin"]').parent().addClass('active');
	})(jQuery);
</script>
</body>
</html>