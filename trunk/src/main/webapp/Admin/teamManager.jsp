<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>隊伍管理</title>
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap.min.css"/>">
<!-- <link rel="stylesheet" href="<c:url value="/Admin/css/font-awesome.min.css"/>"> -->
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/global.css"/>">
</head>
<body>
	<!-- Begin of teamTable -->
	<div id="page-wrapper">
		
		<div class="container top20">
			
			<div class="row">
				<div class="col-sm-12">
					<form role="form" class="form-inline pull-left" action="<c:url value="/teamManager"/>">
						<div class="form-group">
							<select class="form-control input-sm" id="countryList" name="country">
								<option value="">所有國家</option>
								<option value="中華民國">中華民國</option>
								<option value="日本">日本</option>
								<option value="美國">美國</option>
								<option value="韓國">韓國</option>
							</select>
						</div>
						<button class="btn btn-primary btn-sm" type="submit">送出</button>
					</form>
					<button id="btnAddTeam" class="btn btn-success pull-right btn-sm" type="button" data-toggle="modal" data-target="#teamModal">新增隊伍</button>
				</div>
			</div>
			<!-- .row -->
                
			<div class="row top20">
				<div class="col-sm-12">
					<table id="teamTable" class="table table-hover table-condensed order-column compact nowrap">
						<thead>
							<tr>
								<th>國家</th>
								<th>隊伍名稱</th>
								<th>功能</th>
							</tr>
						</thead>
						<tbody id="teamList">
						</tbody>
					</table>
				</div>
			</div>
			<!-- .row -->
		</div>
		<!-- .container-fluid -->
	</div>
	<!-- #page-wrapper -->
	<!-- End of teamTable -->
	
	<!-- Begin of teamModal -->
	<div class="modal fade" id="teamModal" role="dialog" aria-labelledby="teamModalTitle" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
			
				<div id="teamModalHeader" class="modal-header">
					<h3 id="teamModalTitle" class="modal-title">新增隊伍</h3>
				</div>
				<!-- modal-header -->
				
				<form role="form" id="teamForm">
					<div class="modal-body">
					
						<div class="row">
							<div class="col-sm-6">
								<label for="country">國家</label>
								<select class="form-control input-sm" id="country" name="model.country">
									<option value="中華民國">中華民國</option>
									<option value="日本">日本</option>
									<option value="美國">美國</option>
									<option value="韓國">韓國</option>
								</select>
							</div>
							<div class="col-sm-6">
								<div class="form-group">
									<label for="teamName">隊伍名稱</label>
									<input class="form-control input-sm" id="teamName" name="model.teamName">
								</div>
							</div>
						</div>
						<!-- .row -->
						
					</div>
					<!-- .modal-body -->
				</form>
				<!-- #teamform -->
		      	<div id="teamModalFooter" class="modal-footer">
					<button type="button" class="btn btn-default btn-sm" data-dismiss="modal">取消</button>
					<button type="button" class="btn btn-primary btn-sm" id="btnMerge">確認</button>
		      	</div>
	      		
	      		<!-- .modal-footer -->
			</div>
			<!-- .modal-content -->
		</div>
		<!-- .modal-dialog -->
	</div>
	<!-- End of teamModal -->
	
	<!-- Begin of deleteModal -->
	<div class="modal fade" id="deleteModal" role="dialog" aria-labelledby="deleteModalTitle" aria-hidden="true" tabindex="-1">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
			
				<div id="deleteModalHeader" class="modal-header">
					<h3 id="deleteModalTitle" class="modal-title">刪除隊伍</h3>
				</div>
				<!-- modal-header -->
				
				<div class="modal-body">
				
					<div class="row">
						<div class="col-sm-12">
							<h4 class="text-center">確認刪除隊伍？</h4>
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

<script src="<c:url value="/Admin/js/jquery.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/Admin/js/dataTables.responsive.js"/>"></script>
<script>
	(function($) {
		
		//Begin of country
		var country = '${country}';
		if (country == null || country == "") {
			$('#countryList')[0].selectedIndex = 0;
		} else {
			$('#countryList').val(country);
		}
		//End of catagory
		
		//Begin of teamTable
		var teamList = $.parseJSON('${json}');
		$.each(teamList, function(index, team) {
			var child = '';
			child += '<tr>';
			child += '<td>' + team.country + '</td>';
			child += '<td>' + team.teamName + '</td>';
			child += '<td>';
			child += '<button type="button" value="' + team.id + '"class="btn btn-info btn-xs btn-edit" data-toggle="modal" data-target="#teamModal">編輯</button>';
			child += '<button type="button" value="' + team.id + '"class="btn btn-danger btn-xs btn-del left10" data-toggle="modal" data-target="#deleteModal">刪除</button>';
			child += '</td>';
			child += '</tr>';
			$('#teamList').append(child);
		});
		//End of teamTable
		
		//Begin of listTeam
		$('#btnAddTeam').click(function() {
			$('#teamModalTitle').text('新增隊伍');
			resetInput();
		});
		$('.btn-edit').click(function() {
			$('#teamModalTitle').text('編輯隊伍');
			$.getJSON('<c:url value="/teamManager?method:select"/>', {
				'model.id':$(this).val()
			}, function(data) {
				$('#country').val(data.country);
				$('#teamName').val(data.teamName);
				$('#btnMerge').val(data.id);
			});
		});
		//End of listTeam
		
		//Begin of btnMerge
		$('#btnMerge').click(function() {
			var teamId = $(this).val();
			$.post('<c:url value="/teamManager?method:insert"/>',{
				'model.id':teamId,
				'model.country':$('#country').val(),
				'model.teamName':$('#teamName').val()
			});
			
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnMerge
		
		//Begin of btnDelete
		$('.btn-del').click(function() {
			$('#btnDelete').val($(this).val());
			console.log($(this).val());
		});
		
		$('#btnDelete').click(function() {
			$.post('<c:url value="/teamManager?method:delete"/>', {
				'model.id':$(this).val()
			});
			
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnDelete
		
		//Begin of styling		
		function resetInput() {
			$('#country')[0].selectedIndex = 0;
			$('#teamName').val('');
			$('#btnMerge').val('');
		}
		
		resetInput();
		
		$('#teamTable').dataTable({
			responsive: true,
			autoWidth: false,
			order: [[ 0, "asc" ]],
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