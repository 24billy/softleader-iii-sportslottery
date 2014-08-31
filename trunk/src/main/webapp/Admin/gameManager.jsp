<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>賽事管理</title>
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap.min.css"/>">
<!-- <link rel="stylesheet" href="<c:url value="/Admin/css/font-awesome.min.css"/>"> -->
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/global.css"/>">
</head>
<body>
	<!-- Begin of gameTable -->
	<div id="page-wrapper">
		
		<div class="container top20">
			
			<div class="row">
				<div class="col-sm-12">
					<form role="form" class="form-inline pull-left" action="<c:url value="/gameManager"/>">
						<div class="form-group">
							<label for="catagory">運動項目</label>
							<select class="form-control input-sm" id="catagory" name="catagory">
								<option value="Baseball">棒球</option>
								<option value="Basketball">籃球</option>
								<option value="Basketball">足球</option>
							</select>
						</div>
						<button class="btn btn-primary btn-sm" type="submit">送出</button>
					</form>
					<button id="btnAddGame" class="btn btn-success pull-right btn-sm" type="button" data-toggle="modal" data-target="#gameModal">新增賽事</button>
				</div>
			</div>
			<!-- .row -->
                
			<div class="row top20">
				<div class="col-sm-12">
					<table id="gameTable" class="table table-hover table-condensed order-column compact nowrap">
						<thead>
							<tr>
								<th>賽事編號</th>
								<th>聯盟</th>
								<th>客隊隊伍</th>
								<th>主隊隊伍</th>
								<th>狀態</th>
								<th>功能</th>
							</tr>
						</thead>
						<tbody id="gameList">
						</tbody>
					</table>
				</div>
			</div>
			<!-- .row -->
		</div>
		<!-- .container-fluid -->
	</div>
	<!-- #page-wrapper -->
	<!-- End of gameTable -->
	
	<!-- Begin of gameModal -->
	<div class="modal fade" id="gameModal" role="dialog" aria-labelledby="gameModalTitle" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div id="gameModalHeader" class="modal-header">
					<h3 id="gameModalTitle" class="modal-title">新增賽事</h3>
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
											<label for="leagueName">聯盟名稱</label>
											<select class="form-control input-sm" id="leagueName" name="model.leagueName">
												<option value="美國職棒" selected>美國職棒</option>
												<option value="中華職棒" selected>中華職棒</option>
												<option value="中央聯盟" selected>中央聯盟</option>
												<option value="韓國職棒" selected>韓國職棒</option>
											</select>
										</div>
									</div>
								</div>
								<!-- .row -->
								
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="">賽事編號</label>
											<input class="form-control input-sm" type="text" id="gameNum" name="model.gameNum" readonly>
										</div>
									</div>
								</div>
								<!-- .row -->
							
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
								
								<div class="row">
									<div class="col-sm-12">
										<div class="form-group">
											<label for="gameTime">比賽時間</label>
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
							<!-- End of oddsInfo -->
						</div>
						<!-- .row -->
	      			</div>
	      			<!-- .modal-body -->
	      		</form>
				<!-- #gameForm -->	
	      		<div id="gameModalFooter" class="modal-footer">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn-sm" id="btnMerge">確認</button>
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
					<h3 id="deleteModalTitle" class="modal-title">刪除賽事</h3>
				</div>
				<!-- modal-header -->
				
				<div class="modal-body">
				
					<div class="row">
						<div class="col-sm-12">
							<h4 class="text-center">確認刪除賽事？</h4>
						</div>
					</div>
					<!-- .row -->
				</div>
				<!-- .modal-body -->
						
	      		<div id="deleteModalFooter" class="modal-footer">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn-sm" id="btnDelete">確認</button>
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
					<h3 id="statusModalTitle" class="modal-title">設定最後比分</h3>
				</div>
				<!-- modal-header -->
				
				<div class="modal-body">
				
					<div class="row">
						<div class="col-sm-6">
							<div class="form-group">
								<label for="">客隊分數</label>
								<input class="form-control input-sm form-score" id="gameScoreAway" type="text" name="model.gameScoreAway">
							</div>
						</div>
						<div class="col-sm-6">
							<div class="form-group">
								<label for="">主隊分數</label>
								<input class="form-control input-sm form-score" id="gameScoreHome" type="text" name="model.gameScoreHome">
							</div>
						</div>
					</div>
					<!-- .row -->
					
				</div>
				<!-- .modal-body -->
						
	      		<div id="statusModalFooter" class="modal-footer">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn-sm" id="btnStatus">確認</button>
	      		</div>
	      		<!-- .modal-footer -->
			</div>
			<!-- .modal-content -->
		</div>
		<!-- .modal-dialog -->
	</div>
	<!-- End of statusModal -->

<script src="<c:url value="/Admin/js/jquery.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/Admin/js/dataTables.responsive.js"/>"></script>
<script>
	(function($) {
		
		//Begin of catagory
		var catagory = '${catagory}';
		if (catagory == null || catagory == "") {
			$('#catagory')[0].selectedIndex = 0;
		} else {
			$('#catagory').val(catagory);
		}
		//End of catagory
		
		//Begin of gameTable
		var gameNumArray = new Array();
		var gameList = $.parseJSON('${json}');
		$.each(gameList, function(index, game) {
			var child = '';
			child += '<tr>';
			child += '<td>' + game.gameNum + '</td>';
			child += '<td>' + game.leagueName + '</td>';
			child += '<td>' + game.teamAway.teamName + '</td>';
			child += '<td>' + game.teamHome.teamName + '</td>';
			
			var currentDate = new Date().getTime();
			var gameTime = new Date(game.gameTime.iLocalMillis - 8 * 60 * 60 * 1000).getTime();
			
			if (game.isEnd) {
				child += '<td><button type="button" class="btn btn-success btn-xs disabled">已結束</button></td>';
				child += '<td>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-info btn-xs btn-edit disabled" data-toggle="modal" data-target="#gameModal">編輯</button>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-danger btn-xs btn-del left10 disabled" data-toggle="modal" data-target="#deleteModal">刪除</button>';
			} else if (currentDate > gameTime) {
				child += '<td><button type="button" value="' + game.id + '" class="btn btn-warning btn-xs btn-status" data-toggle="modal" data-target="#statusModal">進行中</button></td>';
				child += '<td>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-info btn-xs btn-edit disabled" data-toggle="modal" data-target="#gameModal">編輯</button>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-danger btn-xs btn-del left10 disabled" data-toggle="modal" data-target="#deleteModal">刪除</button>';
			} else {
				child += '<td><button type="button" value="' + game.id + '" class="btn btn-xs btn-status disabled" data-toggle="modal" data-target="#statusModal">尚未開始</button></td>';
				child += '<td>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-info btn-xs btn-edit" data-toggle="modal" data-target="#gameModal">編輯</button>';
				child += '<button type="button" value="' + game.id + '"class="btn btn-danger btn-xs btn-del left10" data-toggle="modal" data-target="#deleteModal">刪除</button>';
			}
			child += '</td>';
			child += '</tr>';
			
			$('#gameList').append(child);
			gameNumArray.push(game.gameNum);
		});
		//End of gameTable
		
		//Begin of listTeam
		$('#btnAddGame').click(function() {
			$('#gameModalTitle').text("新增賽事");
			listTeam(null);
		});
		
		$('.btn-edit').click(function() {
			$('#gameModalTitle').text("編輯賽事");
			listTeam($(this).val());
		});
		
		function listTeam(gameId) {
			resetInput();
			var maxGameNum = Math.max.apply(Math, gameNumArray);
			$('[name="model.gameNum"]').val(maxGameNum + 1);
			
			$('#teamAwayList,#teamHomeList').empty();
			
			$.getJSON('<c:url value="/team"/>').done(function(data) {	
				$.each(data, function(key, value) {
					var str = '<option value=' + value.id + '>' + value.teamName + '</option>';
					$('#teamAwayList,#teamHomeList').append(str);
				});
				
				$('#teamAwayList')[0].selectedIndex = 0;
				$('#teamAwayList').change();
				$('#teamHomeList')[0].selectedIndex = 1;
				$('#teamHomeList').change();
			});
			
			function addZero(str) {
				if (str < 10) {
					str = '0' + str;
				}
				return str;
			}
			
			if (gameId != null) {
				var url = '<c:url value="/gameManager?method:select"/>';
				$.getJSON(url, {'model.id':gameId}).done(function(data) {
					var dateTime = new Date(data.gameTime.iLocalMillis);
					var year = dateTime.getUTCFullYear();
					var month = addZero(dateTime.getUTCMonth() + 1);
					var date = addZero(dateTime.getUTCDate());
					var hours = addZero(dateTime.getUTCHours());
					var minutes = addZero(dateTime.getUTCMinutes());
					$('[name="model.leagueName"] option').filter(function() {
						return $(this).text() == data.leaguName;
					}).prop('selected', true);
					$('[name="model.gameNum"]').val(data.gameNum);
					$('#teamAwayList').val(data.teamAway.id);
					$('#teamAwayList').change();
					$('#teamHomeList').val(data.teamHome.id);
					$('#teamHomeList').change();
					$('#gameTime').val(year + '-' + month + '-' + date + ' ' + hours + ':' + minutes);
					$('#btnMerge').val(data.id);
					if (data.odds.length != 0) {
						$.each(data.odds, function(index, odd) {
							$('[name$="' + odd.oddType + '"]').val(odd.oddValue.toFixed(2));
						});
					} else {
						$('.form-decimal').val('0.00');
					}
					
				});
				
			}
		}
		//End of listTeam
		
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
		
		//Begin of btnStatus
		$('.btn-status').click(function() {
			$('#btnStatus').val($(this).val());
		});
		
		$('#btnStatus').click(function() {
			
			$.post('<c:url value="/gameManager?method:update"/>', {
				'model.id':$(this).val(),
				'model.isEnd':true,
				'model.gameScoreAway':$('#gameScoreAway').val(),
				'model.gameScoreHome':$('#gameScoreHome').val()
			});
			
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnStatus
		
		//Begin of btnMerge
		$('#btnMerge').click(function() {
			var gameId = $(this).val();
			$.post('<c:url value="/gameManager?method:insert"/>', {
				'model.id':gameId,
				'model.ballType':$('[name="catagory"]').val(),
				'model.leagueName':$('[name="model.leagueName"]').val(),
				'model.gameNum':$('[name="model.gameNum"]').val(),
				'model.gameTime':$('[name="model.gameTime"]').val(),
				'teamAwayId':$('[name="teamAwayId"]').val(),
				'teamHomeId':$('[name="teamHomeId"]').val(),
				'model.gameScoreAway':0,
				'model.gameScoreHome':0
			}).done(function(data) {
				
				$('.form-decimal').each(function() {
					var oddCombination = 0;
					
					var oddType = $(this).attr('name');
					if (oddType.indexOf('EO_') != -1) {
						oddType = oddType.replace('EO_', '');
					} else if (oddType == 'ATS_A') {
						oddCombination = -1.5;
					} else if (oddType == 'ATS_H') {
						oddCombination = 1.5;
					} else if (oddType.indexOf('SC_') != -1) {
						oddCombination = 7.5;
					}
					$.post('<c:url value="/odds?method:insert"/>', {
						'model.gameId':data,
				    	'model.oddType':oddType,
				    	'model.oddValue':$(this).val(),
				    	'model.oddCombination':oddCombination,
				    	'model.count':0,
				    	'model.isPass':false
					}).done(function(data) {
						return true;
					});
				});
			});
				
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnMerge
		
		//Begin of btnDelete		
		$('.btn-del').click(function() {
			$('#btnDelete').val($(this).val());
		});
		
		$('#btnDelete').click(function() {
			
			$.post('<c:url value="/gameManager?method:delete"/>', {
				'model.id':$(this).val()
			});
			
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnDelete
		
		//Begin of styling
		function resetInput() {
			$('#gameTime').val('');
			$('.form-decimal').val('0.00')
			
			$('#gameTime').datetimepicker({
				defaultDate:new Date(),
				minDate: new Date(),
				format: 'Y-m-d H:i',
				mask:true,
				lang:'ch'
			});
			
			$('.form-decimal').TouchSpin({
				min: 0,
				initval: 0,
				step: 0.05,
				decimals: 2,
				buttondown_class: 'btn btn-info',
	            buttonup_class: 'btn btn-success'
			});
			
			$('.form-score').TouchSpin({
				min: 0,
				initval: 0,
				step: 1,
				buttondown_class: 'btn btn-info',
	            buttonup_class: 'btn btn-success'
			});
		}
		
		resetInput();
		
		$('#gameTable').dataTable({
			responsive: true,
			autoWidth: false,
			order: [[ 0, "desc" ]],
			oLanguage: {
				'sProcessing':   '處理中...',
				'sLengthMenu':   '顯示 _MENU_ 項結果',
				'sZeroRecords':  '沒有匹配結果',
				'sInfo':         '顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項',
				'sInfoEmpty':    '顯示第 0 至 0 項結果，共 0 項',
				'sInfoFiltered': '(從 _MAX_ 項結果過濾)',
				'sInfoPostFix':  '',
				'sSearch':       '搜索:',
				'sUrl':          '',
				'oPaginate': {
					'sFirst':    '首頁',
					'sPrevious': '上頁',
					'sNext':     '下頁',
					'sLast':     '尾頁'
				}
			}
		});
		//End of styling
		
	})(jQuery);
</script>
</body>
</html>