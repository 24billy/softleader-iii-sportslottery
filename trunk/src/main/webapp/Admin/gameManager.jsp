<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>賽事管理</title>
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
 -->
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
	<!-- Begin of Game Table -->
	<div id="page-wrapper">
		
		<div class="container top20">
			
			<div class="row">
				<div class="col-lg-12">
					<form role="form" class="form-inline pull-left" action="<c:url value="/gameManager"/>">
						<div class="form-group">
							<select class="form-control input-sm form-ball-type" id="catagory" name="catagory">
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
				<div class="col-lg-12">
					<!-- <div class="table-responsive"> -->
						<table id="gameTable" class="table table-hover table-condensed table-bordered table-striped">
							<thead>
								<tr>
									<th>賽事編號</th>
									<th>客隊隊伍</th>
									<th>主隊隊伍</th>
									<th>狀態</th>
									<th>功能</th>
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
	<!-- End of Game Table -->
	
	<!-- Begin of gameModal -->
	<div class="modal fade" id="gameModal" role="dialog" aria-labelledby="gameModalTitle" aria-hidden="true">
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
							<div class="col-xs-6">
								
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<label for="leagueName">聯盟名稱</label>
											<select class="form-control input-sm" id="leagueName" name="model.leagueName">
												<option value="MLB" selected>美國職棒</option>
											</select>
										</div>
									</div>
								</div>
								<!-- .row -->
								
								<div class="row">
									<div class="col-xs-12">
										<div class="form-group">
											<label for="">賽事編號</label>
											<input class="form-control input-sm" type="text" id="gameNum" name="model.gameNum">
										</div>
									</div>
								</div>
								<!-- .row -->
							
								<div class="row">
									<div class="col-xs-6">
										<div class="form-group">
											<label for="teamAwayList">客隊隊伍</label>
											<select class="form-control input-sm" id="teamAwayList" name="teamAwayId">
											</select>
										</div>
									</div>
									<div class="col-xs-6">
										<div class="form-group">
											<label for="teamHomeList">主隊隊伍</label>
											<select class="form-control input-sm" id="teamHomeList" name="teamHomeId">
											</select>
										</div>
									</div>
								</div>
								<!-- .row -->
								
								<div class="row">
									<div class="col-xs-12">
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
							<div class="col-xs-6">
								
								<div class="row">
									<div class="col-xs-6">
										<div class="form-group">
											<label for="SU_A">不讓分(客)</label>
											<input class="form-control input-sm form-decimal" id="SU_A" type="text" name="SU_A">
										</div>
									</div>
									<div class="col-xs-6">
										<div class="form-group">
											<label for="SU_H">不讓分(主)</label>
											<input class="form-control input-sm form-decimal" id="SU_H" type="text" name="SU_H">
										</div>
									</div>
								</div>
								<!-- .row -->
								
								<div class="row">
									<div class="col-xs-6">
										<div class="form-group">
											<label for="ATS_A">讓分(客)</label>
											<input class="form-control input-sm form-decimal" id="ATS_A" type="text" name="ATS_A">
										</div>
									</div>
									<div class="col-xs-6">
										<div class="form-group">
											<label for="ATS_H">讓分(主)</label>
											<input class="form-control input-sm form-decimal" id="ATS_H" type="text" name="ATS_H">
										</div>
									</div>
								</div>
								<!-- .row -->
								
								<div class="row">
									<div class="col-xs-6">
										<div class="form-group">
											<label for="SC_H">總分(大)</label>
											<input class="form-control input-sm form-decimal" id="SC_H" type="text" name="SC_H">
										</div>
									</div>
									<div class="col-xs-6">
										<div class="form-group">
											<label for="SC_L">總分(小)</label>
											<input class="form-control input-sm form-decimal" id="SC_L" type="text" name="SC_L">
										</div>
									</div>
								</div>
								<!-- .row -->
								
								<div class="row">
									<div class="col-xs-6">
										<div class="form-group">
											<label for="EVEN">總分(單)</label>
											<input class="form-control input-sm form-decimal" id="EVEN" type="text" name="EO_EVEN">
										</div>
									</div>
									<div class="col-xs-6">
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
				<!-- .form -->	
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
	<div class="modal fade" id="deleteModal" role="dialog" aria-labelledby="deleteModalTitle" aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
			
				<div id="deleteModalHeader" class="modal-header">
					<h3 id="deleteModalTitle" class="modal-title">刪除賽事</h3>
				</div>
				<!-- modal-header -->
				
				<div class="modal-body">
				
					<div class="row">
						<div class="col-xs-12">
							<h4 class="text-center">確認刪除？</h4>
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
<!-- 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/jquery-ui.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 -->
<script src="<c:url value="/Admin/js/jquery.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap-dialog.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.dataTables.min.js"/>"></script>
<script>
	(function($) {
		
		var gameNumArray = new Array();
		var gameList = $.parseJSON('${json}');
		$.each(gameList, function(index, game) {
			var child = '';
			child += '<tr>';
			child += '<td>' + game.gameNum + '</td>';
			child += '<td>' + game.teamAway.teamName + '</td>';
			child += '<td>' + game.teamHome.teamName + '</td>';
			
			if (game.isEnd) {
				child += '<td><button type="button" class="btn btn-success btn-xs disabled">已結束</button></td>';
			} else {
				child += '<td><button type="button" value="' + game.id + '" class="btn btn-warning btn-xs btn-end">進行中</button>';
			}
			
			child += '<td>';
			child += '<button type="button" value="' + game.id + '"class="btn btn-info btn-xs btn-edit" data-toggle="modal" data-target="#gameModal">編輯</button>';
			child += '<button type="button" value="' + game.id + '"class="btn btn-danger btn-xs btn-del left10" data-toggle="modal" data-target="#deleteModal">刪除</button>';
			child += '</td>';
			child += '</tr>';
			
			$('#gameList').append(child);
			gameNumArray.push(game.gameNum);
		});
		
		
		$('.btn-end').click(function() {
			$.post('<c:url value="/gameManager?method:update"/>', {
				'model.id':$(this).val(),
				'model.isEnd':true
			}, function(data) {
				window.location.reload(true);
			});
		});
		
		$('#btnAddGame').click(function() {
			/*
			$('#gameModalHeader').removeClass('bg-info');
			$('#gameModalHeader').removeClass('bg-success');
			$('#gameModalHeader').addClass('bg-success');
			*/
			$('#gameModalTitle').text("新增賽事");
			listTeam(null);
		});
		
		$('.btn-edit').click(function() {
			/*
			$('#gameModalHeader').removeClass('bg-info');
			$('#gameModalHeader').removeClass('bg-success');
			$('#gameModalHeader').addClass('bg-info');
			*/
			$('#gameModalTitle').text("編輯賽事");
			listTeam($(this).val());
		});
		
		var maxGameNum = Math.max.apply(Math, gameNumArray);
		$('[name="model.gameNum"]').val(maxGameNum + 1);
		
		function listTeam(gameId) {
			
			$('#teamAwayList,#teamHomeList').empty();
			
			var url = '<c:url value="/team"/>';
			$.getJSON(url, function(data) {	
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
				$.getJSON(url, {'model.id':gameId}, function(data) {
					var dateTime = new Date(data.gameTime.iLocalMillis);
					var year = dateTime.getUTCFullYear();
					var month = addZero(dateTime.getUTCMonth() + 1);
					var date = addZero(dateTime.getUTCDate());
					var hours = addZero(dateTime.getUTCHours());
					var minutes = addZero(dateTime.getUTCMinutes());
					$('[name="model.leagueName"]>option').filter(function() {
						return $(this).text() == data.leaguName;
					}).prop('selected', true);
					$('[name="model.gameNum"]').val(data.gameNum);
					$('#teamAwayList').val(data.teamAway.id);
					$('#teamHomeList').val(data.teamHome.id);
					$('#gameTime').val(year + '-' + month + '-' + date + ' ' + hours + ':' + minutes);
					
					if (data.odds.length != 0) {
						$.each(data.odds, function(index, odd) {
							$('[name$="' + odd.oddType + '"]').val(odd.oddValue);
						});
					} else {
						$('.form-decimal').val('0.00');
					}
					
					if (data.isEnd) {
						$('#gameForm *').prop('disabled', true);
					} else {
						$('#gameForm *').prop('disabled', false);
					}
				});
				
			} 
		};
		
		$('#teamAwayList').change(function() {
			var value = $(this).val();
			$('#teamHomeList>option').prop('disabled', false).css('display', 'inline');
			$('#teamHomeList>option[value=' + value + ']').prop('disabled', true).css('display', 'none');
		});
		
		$('#teamHomeList').change(function() {
			var value = $(this).val();
			$('#teamAwayList>option').prop('disabled', false).css('display', 'inline');
			$('#teamAwayList>option[value=' + value + ']').prop('disabled', true).css('display', 'none');
		});
		
		
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
		
		var catagory = '${catagory}';
		if (catagory == null || catagory == "") {
			$('#catagory')[0].selectedIndex = 0;
		} else {
			$('#catagory').val(catagory);
		}
		/*
		$(':checkbox').change(function() {
			var type = $(this).attr('id');
			type = type.replace('chk', ''); 
			if ($(this).prop('checked')) {
				$('.form-decimal[name^=' + type + ']').prop('disabled', false);
			} else {
				$('.form-decimal[name^=' + type + ']').prop('disabled', true);
			}
		});
		*/
		$('#btnMerge').click(function() {
			
			$.ajax({
				url: '<c:url value="/gameManager?method:insert"/>',
				dataType: 'text',
				data: {
					'model.ballType':$('[name="catagory"]').val(),
					'model.leagueName':$('[name="model.leagueName"]').val(),
					'model.gameNum':$('[name="model.gameNum"]').val(),
					'model.gameTime':$('[name="model.gameTime"]').val(),
					'teamAwayId':$('[name="teamAwayId"]').val(),
					'teamHomeId':$('[name="teamHomeId"]').val()
				},
				success: function(data) {
					if (data != 'failed') {
						addOdds(data);
						
							
					} else {
						
					}
					
				}
			}).done(function() {
				$('#gameModal').modal('hide');
				window.location.reload(true);
			});
		});
		
		function addOdds(gameId) {
			
			$('.form-decimal:enabled').each(function() {
				var oddType = $(this).attr('name');
				if (oddType.indexOf('EO_') != -1) {
					oddType = oddType.replace('EO_', '');
				}
				$.ajax({
					url: '<c:url value="/odds?method:insert"/>',
				    dataType: 'text',
				    data: {
				    	'model.gameId':gameId,
				    	'model.oddType':oddType,
				    	'model.oddValue':$(this).val()
				    },
				    success: function(data) {
				    	if (data == 'SUCCESS') {
				    			
				    	} else {
				    		
				    	}
				    	
				    }
				});
			});
		};
				
		$('.btn-del').click(function() {
			$('#btnDelete').val($(this).val());
			/*
			BootstrapDialog.show({
				closable: false,
	            title: '<h4>刪除賽事</h4>',
	            message: '確認刪除？',
	            type: BootstrapDialog.TYPE_DEFAULT,
				buttons: [{
               		label: '取消',
                	action: function(dialog) {
                    dialog.close();
               		}
            	}, {
	                label: '刪除',
	                cssClass: 'btn-primary',
	                action: function(dialog) {
	                	
	                	$.ajax({
	                		url: '<c:url value="/gameManager?method:delete"/>',
	                		dataType: 'text',
	                		data: {
	                			'model.id':gameId
	                		},
	                		success: function(data) {
	                			
	                			if (data == 'deleted') {
	                			}
	                		},
	                	}).done(function() {
	                		dialog.close();
	                		window.location.reload(true);
	                	});
	                	
                	}
            	}]
	        });
			*/
		});
		
		$('#btnDelete').click(function() {
			$.ajax({
        		url: '<c:url value="/gameManager?method:delete"/>',
        		dataType: 'text',
        		data: {
        			'model.id':$(this).val()
        		},
        		success: function(data) {
        			
        			if (data == 'deleted') {
        			}
        		},
        	}).done(function() {
        		$('#deleteModal').modal('hide');
        		window.location.reload(true);
        	});
		});
		
		$('#gameTable').dataTable({
			responsive: true
		});
	})(jQuery);
</script>
</body>
</html>