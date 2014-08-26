<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Game Table</title>
<!-- 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css">
 -->
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap-dialog.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap-switch.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/global.css"/>">
</head>
<body>
	<!-- Begin of Game Table -->
	<div id="page-wrapper">
		
		<div class="container-fluid top20">
			
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
						<button class="btn btn-primary" type="submit">送出</button>
					</form>
					<button id="btnAddGame" class="btn btn-success pull-right" type="button" data-toggle="modal" data-target="#addGameModal">新增賽事</button>
				</div>
			</div>
			<!-- .row -->
                
			<div class="row top20">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table class="table table-hover table-condensed table-bordered">
							<thead>
								<tr>
									<th>賽事編號</th>
									<th>客隊隊伍</th>
									<th>主隊隊伍</th>
									<th>已結束</th>
									<th>功能</th>
	                            </tr>
							</thead>
							<tbody id="gameList">
							</tbody>
						</table>
					</div>
					<!-- .table-responsive -->
				</div>
			</div>
			<!-- .row -->
		</div>
		<!-- .container-fluid -->
	</div>
	<!-- #page-wrapper -->
	<!-- End of Game Table -->
	
	<!-- Begin of Modal -->
	<div class="modal fade" id="addGameModal">
		<div class="modal-dialog">
			<div class="modal-content">
			
				<div class="modal-header bg-primary">
					<h3 class="modal-title">新增賽事</h3>
				</div>
				<!-- modal-header -->
				<form role="form" action="<c:url value="/game.action"/>">
				
					<div class="modal-body">
				
						<div class="row">
							<div class="col-xs-12">
								<h4 class="text-center">聯盟名稱</h4>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<select class="form-control" name="model.leagueName">
										<option value="MLB" selected>美國職棒</option>
									</select>
								</div>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-12">
								<h4 class="text-center">賽事編號</h4>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-12">
								<div class="form-group">
									<input class="form-control" type="text" name="model.gameNum">
								</div>
							</div>
						</div>
						<!-- .row -->
					
						<div class="row">
							<div class="col-xs-6">
								<h4 class="text-center">客隊隊伍</h4>
							</div>
							<div class="col-xs-6">
								<h4 class="text-center">主隊隊伍</h4>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group">
									<select class="form-control" id="teamAwayList" name="teamAwayId">
									</select>
								</div>
							</div>
							<div class="col-xs-6">
								<div class="form-group">
									<select class="form-control" id="teamHomeList" name="teamHomeId">
									</select>
								</div>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-12">
								<h4 class="text-center">比賽時間</h4>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-12">
								<input class="form-control" id="gameTime" type="text" name="model.gameTime">
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-12">
								<h4 class="text-center">
									不讓分<input type="checkbox" id="chkSU">
								</h4>
								
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-6">
								<input class="form-control form-decimal" type="text" name="SU_A">
							</div>
							<div class="col-xs-6">
								<input class="form-control form-decimal" type="text" name="SU_H">
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-12">
								<h4 class="text-center">
									讓分<input type="checkbox" id="chkATS">
								</h4>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-xs-6">
								<input class="form-control form-decimal" type="text" name="ATS_A">
							</div>
							<div class="col-xs-6">
								<input class="form-control form-decimal" type="text" name="ATS_H">
							</div>
						</div>
						<!-- .row -->
						
	      			</div>
	      			<!-- .modal-body -->
	      			
	      			<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
						<button type="button" class="btn btn-success" id="btnInsert">新增</button>
	      			</div>
      			</form>
				<!-- .form -->
			</div>
			<!-- .modal-content -->
		</div>
		<!-- .modal-dialog -->
	</div>
	<!-- End of Modal -->
	
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
<script src="<c:url value="/Admin/js/bootstrap-switch.min.js"/>"></script>
<script>
	(function($) {
		$('.form-decimal').prop('disabled', true);
		$('#btnAddGame').click(listTeam);
		
		var gameNumArray = new Array();
		var gameList = $.parseJSON('${json}');
		$.each(gameList, function(index, game) {
			var child = '';
			child += '<tr>';
			child += '<td>' + game.gameNum + '</td>';
			child += '<td>' + game.teamAway.teamName + '</td>';
			child += '<td>' + game.teamHome.teamName + '</td>';
			child += '<td>' + game.isEnd + '</td>';
			child += '<td>';
			child += '<button type="button" value="' + game.id + '"class="btn btn-primary btn-edit">編輯</button>';
			child += '<button type="button" value="' + game.id + '"class="btn btn-danger btn-del left10">刪除</button>';
			child += '</td>';
			child += '</tr>';
			
			$('#gameList').append(child);
			gameNumArray.push(game.gameNum);
		});
		
		var maxGameNum = Math.max.apply(Math, gameNumArray);
		$('[name="model.gameNum"]').val(maxGameNum + 1);
		
		function setEditButton() {
			
		};
		
		function setDeleteButton() {
			
		};
		
		function listTeam() {
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
			minDate: new Date(),
			format: 'Y-m-d H:i:s',
		});
		
		$('.form-decimal').TouchSpin({
			initval: 1,
			step: 0.05,
			decimals: 2
		});
		
		var catagory = '${catagory}';
		if (catagory == null || catagory == "") {
			$('#catagory')[0].selectedIndex = 0;
		} else {
			$('#catagory').val(catagory);
		}
		
		$(':checkbox').bootstrapSwitch();
		$(':checkbox').on('switchChange.bootstrapSwitch', function(event, state) {
			var type = $(this).attr('id');
			type = type.replace('chk', '');  
			if (state) {
				$('.form-decimal[name^=' + type + ']').prop('disabled', false);
			} else {
				$('.form-decimal[name^=' + type + ']').prop('disabled', true);
			}
		});
		
		
		$('#btnInsert').click(function() {
			
			$.ajax({
				url: '<c:url value="/gameManager?method:insert"/>',
				type: 'get',
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
						var gameId = $.parseJSON(data).id;
						addOdds(gameId);
						$('#addGameModal').modal('hide');
						window.location.replace('<c:url value="/gameManager"/>');	
					} else {
						
					}
				}
			});
			
			
		});
		
		function addOdds(gameId) {
			
			$('input:checked').each(function() {
				
				var type = $(this).attr('id');
				type = type.replace('chk', ''); 
				$('.form-decimal[name^=' + type + ']').each(function() {
					
					$.ajax({
						url: '<c:url value="/odds?method:insert"/>',
					    type: 'get',
					    data: {
					    	'model.gameId':gameId,
					    	'model.oddType':$(this).attr('name'),
					    	'model.oddValue':$(this).val()
					    },
					    success: function(data) {
					    	if (data == 'SUCCESS') {
					    			
					    	} else {
					    		
					    	}
					    	
					    }
					});
					
				});
					
			});
		};
		
		$('.btn-edit').click(function() {
			console.log($(this).val());
		});
		
		$('.btn-del').click(function() {
			BootstrapDialog.show({
				closable: false,
	            title: '刪除賽事',
	            message: '確認刪除？',
	            type: BootstrapDialog.TYPE_WARNING,
				buttons: [{
               		label: '取消',
                	action: function(dialog) {
                    dialog.close();
               		}
            	}, {
	                label: '刪除',
	                cssClass: 'btn-danger',
	                action: function(dialog) {
	                	
	                	$.ajax({
	                		url: '<c:url value="/gameManager?method:delete"/>',
	                		type: 'get',
	                		data: {
	                			'model.id':$(this).val()
	                		},
	                		success: function(result) {
	                			
	                			if (result == 'deleted') {
	                				console.log('test');
	                			}
	                			dialog.close();
	    	                	window.location.replace('<c:url value="/gameManager"/>');
	                		}
	                	});
	                	
                	}
            	}]
	        });
		});
	})(jQuery);
</script>
</body>
</html>