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
<title><s:text name="admin.teamAdmin"/></title>
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
									<li><a href="<c:url value="/admin"/>"><i class="fa fa-fw fa-home"></i><span class="left5"><s:text name="admin.home"/></span></a></li>
			  						<li class="active"><i class="fa fa-fw fa-users"></i><span class="left5"><s:text name="admin.teamAdmin"/></span></li>
								</ol>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-sm-12">
								<form role="form" class="form-inline pull-left" action="<c:url value="/admin/teamAdmin"/>" method="post">
									<select class="input-sm" id="leagueNameList" name="leagueName">
										<option value="美國職棒" selected>美國職棒</option>
										<option value="中華職棒">中華職棒</option>
										<option value="中央聯盟">中央聯盟</option>
										<option value="太平洋聯盟">太平洋聯盟</option>
										<option value="韓國職棒">韓國職棒</option>
									</select>
									<button class="btn btn-primary btn-sm" type="submit"><i class="fa fa-fw fa-search"></i></button>
								</form>
								<button id="btnAddTeam" class="btn btn-success pull-right btn-sm" type="button" data-toggle="modal" data-target="#teamModal"><i class="fa fa-fw fa-plus"></i><span class="left5"><s:text name="admin.teamAdmin.add"/></span></button>
							</div>
						</div>
						<!-- .row -->
						
						<!-- Begin of teamTable -->    
						<div class="row top20 container-table">
							<div class="col-sm-12">
								<table id="teamTable" class="table table-hover table-condensed order-column compact nowrap">
									<thead>
										<tr>
											<th><s:text name="admin.team.leagueName"/></th>
											<th><s:text name="admin.team.teamName"/></th>
											<th><s:text name="admin.btn.action"/></th>
										</tr>
									</thead>
									<tbody id="teamList">
									</tbody>
								</table>
							</div>
						</div>
						<!-- .row -->
						<!-- End of teamTable -->
					</div>
					<!-- .container-right -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container -->
		</div>
		<!-- #page-wrapper -->
		
		<!-- Begin of teamModal -->
		<div class="modal fade" id="teamModal" role="dialog" aria-labelledby="teamModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<div id="teamModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="teamModalTitle" class="modal-title"><s:text name="admin.teamAdmin.add"/></h3>
					</div>
					<!-- modal-header -->
					
					<form role="form" id="teamForm">
						<div class="modal-body">
						
							<div class="row">
								<div class="col-sm-12">
									<label for="leagueName"><s:text name="admin.team.leagueName"/></label>
									<select class="form-control input-sm" id="leagueName" name="model.leagueName">
										<option value="美國職棒" selected>美國職棒</option>
										<option value="中華職棒">中華職棒</option>
										<option value="中央聯盟">中央聯盟</option>
										<option value="太平洋聯盟">太平洋聯盟</option>
										<option value="韓國職棒">韓國職棒</option>
									</select>
								</div>
							</div>
							<!-- .row -->
							
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="teamName"><s:text name="admin.team.teamName"/></label>
										<input class="form-control input-sm" id="teamName" name="model.teamName" placeholder="<s:text name="admin.team.teamName"/>">
									</div>
								</div>
							</div>
							<!-- .row -->
							
						</div>
						<!-- .modal-body -->
					</form>
					<!-- #teamform -->
			      	<div id="teamModalFooter" class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><s:text name="admin.btn.cancel"/></button>
						<button type="button" class="btn btn-primary btn-sm" id="btnMerge"><s:text name="admin.btn.confirm"/></button>
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
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="deleteModalTitle" class="modal-title"><s:text name="admin.teamAdmin.delete"/></h3>
					</div>
					<!-- modal-header -->
					
					<div class="modal-body">
					
						<div class="row">
							<div class="col-sm-12">
								<h4 class="text-center"><s:text name="admin.teamAdmin.delete.message"/></h4>
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
		var zh = '${locale.language}' == 'zh';
		
		//Begin of leagueName
		var leagueName = '${leagueName}';
		if (leagueName == null || leagueName == "") {
			$('#leagueNameList')[0].selectedIndex = 0;
		} else {
			$('#leagueNameList').val(leagueName);
		}
		//End of leagueName
		
		//Begin of teamTable
		var teamList = $.parseJSON('${json}');
		$.each(teamList, function(index, team) {
			var child = '';
			child += '<tr>';
			if (zh) {
				child += '<td>' + team.leagueName + '</td>';
				child += '<td>' + team.teamName + '</td>';
			} else {
				child += '<td>' + team.leagueNameEn + '</td>';
				child += '<td>' + team.teamNameEn + '</td>';
			}
			
			child += '<td>';
			child += '<button type="button" value="' + team.id + '"class="btn btn-default btn-xs btn-edit" data-toggle="modal" data-target="#teamModal"><i class="fa fa-fw fa-pencil-square-o"></i></button>';
			child += '<button type="button" value="' + team.id + '"class="btn btn-default btn-xs btn-del left10" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-fw fa-trash-o"></i></button>';
			child += '</td>';
			child += '</tr>';
			$('#teamList').append(child);
		});
		//End of teamTable
		
		//Begin of listTeam
		$('#btnAddTeam').click(function() {
			$('#teamModalTitle').text('<s:text name="admin.teamAdmin.add"/>');
			resetInput();
		});
		$('.btn-edit').click(function() {
			$('#teamModalTitle').text('<s:text name="admin.teamAdmin.edit"/>');
			$.post('<c:url value="/admin/teamAdmin?method:select"/>', {
				'model.id':$(this).val()
			}, function(data) {
				$('#leagueName').val(data.leagueName);
				$('#teamName').val(data.teamName);
				$('#btnMerge').val(data.id);
			}, 'json');
		});
		//End of listTeam
		
		//Begin of btnMerge
		$('#btnMerge').click(function() {
			var teamId = $(this).val();
			$.post('<c:url value="/admin/teamAdmin?method:insert"/>',{
				'model.id':teamId,
				'model.leagueName':$('#leagueName').val(),
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
			$.post('<c:url value="/admin/teamAdmin?method:delete"/>', {
				'model.id':$(this).val()
			});
			
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnDelete
		
		//Begin of styling		
		function resetInput() {
			$('#leagueName')[0].selectedIndex = 0;
			$('#teamName').val('');
			$('#btnMerge').val('');
		}
		
		resetInput();
		
		$('.btn-edit').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.teamAdmin.edit"/>'
		});
		
		$('.btn-del').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.teamAdmin.delete"/>'
		});
		
		$('#teamTable').dataTable({
			'responsive': true,
			'autoWidth': false,
			'order': [[ 0, 'asc' ]],
			'columns': [{'width': '30%'},
			            {'width': '35%'},
			            {'width': '35%'}],
			'oLanguage': {
				'sProcessing': '處理中...',
				'sLengthMenu': '顯示 _MENU_ 項結果',
				'sZeroRecords': '沒有匹配結果',
				'sInfo': '顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項',
				'sInfoEmpty': '顯示第 0 至 0 項結果，共 0 項',
				'sInfoFiltered': '(從 _MAX_ 項結果過濾)',
				'sInfoPostFix': '',
				'sSearch': '搜索:',
				'sUrl': '',
				'oPaginate': {
					'sFirst': '首頁',
					'sPrevious': '上頁',
					'sNext': '下頁',
					'sLast': '尾頁'
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