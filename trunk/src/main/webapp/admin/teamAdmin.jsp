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
			  						<li class="active"><i class="fa fa-fw fa-users"></i><span class="left5"><s:text name="admin.teamAdmin"/></span></li>
								</ol>
							</div>
						</div>
						<!-- .row -->
						
						<div class="row">
							<div class="col-sm-12">
								<form role="form" class="form-inline pull-left" action="<c:url value="/admin/teamAdmin"/>" method="post">
									<select class="input-sm" id="leagueNameList" name="leagueName">
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
								<div class="table-responsive">
									<table id="teamTable" class="compact hover order-column row-border nowrap">
										<thead>
											<tr>
												<th>Id</th>
												<th><s:text name="admin.team.ballType"/></th>
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
									<div class="form-group">
										<label for="ballType"><s:text name="admin.team.ballType"/></label>
										<select id="ballType" class="input-sm form-control">
											<option value="Baseball" selected><s:text name="admin.teamAdmin.ballType.baseball"/></option>
											<option value="Basketball"><s:text name="admin.teamAdmin.ballType.basketball"/></option>
											<option value="Soccer"><s:text name="admin.teamAdmin.ballType.soccer"/></option>
										</select>
									</div>
								</div>
							</div>
							<!-- .row -->
							
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="leagueName"><s:text name="admin.team.leagueName"/></label>
										<input class="form-control input-sm" id="leagueName" name="model.leagueName" placeholder="<s:text name="admin.team.leagueName"/>">
									</div>
								</div>
							</div>
							<!-- .row -->
							
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="leagueNameEn"><s:text name="admin.team.leagueNameEn"/></label>
										<input class="form-control input-sm" id="leagueNameEn" name="model.leagueNameEn" placeholder="<s:text name="admin.team.leagueNameEn"/>">
									</div>
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
							
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="teamNameEn"><s:text name="admin.team.teamNameEn"/></label>
										<input class="form-control input-sm" id="teamNameEn" name="model.teamNameEn" placeholder="<s:text name="admin.team.teamNameEn"/>">
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
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/highcharts.js"/>"></script>
<script src="<c:url value="/js/exporting.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script src="<c:url value="/js/admin-navgation.js"/>"></script>
<script>
	(function($) {
		var zh = '${locale.language}' == 'zh';
		
		//Begin of teamTable
		var teamList = $.parseJSON('${json}');
		$.each(teamList, function(index, team) {
			var child = '';
			child += '<tr>';
			child += '<td>' + team.id + '</td>';
			child += '<td>' + team.ballType + '</td>';
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
		
		//Begin of listLeague
		$.ajax({
			url: '<c:url value="/admin/teamAdmin?method:getLeagueNames"/>',
			type: 'post',
			dataType: 'json',
			success: function(data) {
				$.each(data, function(index, leagueName) {
					var str = '<option value="' + leagueName + '">' + leagueName + '</option>';
					$('#leagueNameList').append(str);
				});
				var leagueName = '${leagueName}';
				if (leagueName == null || leagueName == "") {
					$('#leagueNameList')[0].selectedIndex = 0;
				} else {
					$('#leagueNameList').val(leagueName);
				}
			},
			async: false
		});
		//End of listLeague
		
		//Begin of listTeam
		$('#btnAddTeam').click(function() {
			$('#teamModalTitle').text('<s:text name="admin.teamAdmin.add"/>');
			resetInput();
		});
		$('.btn-edit').click(function() {
			$('#btnMerge').val($(this).val());
			$('#teamModalTitle').text('<s:text name="admin.teamAdmin.edit"/>');
			$.ajax({
				url: '<c:url value="/admin/teamAdmin?method:select"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':$(this).val()
				},
				success: function(data) {
					$('#ballType').val(data.ballType);
					$('#leagueName').val(data.leagueName);
					$('#leagueNameEn').val(data.leagueNameEn);					
					$('#teamName').val(data.teamName);
					$('#teamNameEn').val(data.teamNameEn);
				},
				async: false
			});
		});
		//End of listTeam
		
		//Begin of btnMerge
		$('#btnMerge').click(function() {
			var error = 0;
			if ($('#leagueName').val() == "" || chkJS($('#leagueName').val())) {
				if (!$('#leagueName').parent().hasClass('has-error')) {
					$('#leagueName').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#leagueName').parent().removeClass('has-error');
			}
			
			if ($('#leagueNameEn').val() == "" || chkJS($('#leagueNameEn').val())) {
				if (!$('#leagueNameEn').parent().hasClass('has-error')) {
					$('#leagueNameEn').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#leagueNameEn').parent().removeClass('has-error');
			}
			
			if ($('#teamName').val() == "" || chkJS($('#teamName').val())) {
				if (!$('#teamName').parent().hasClass('has-error')) {
					$('#teamName').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#teamName').parent().removeClass('has-error');
			}
			
			if ($('#teamNameEn').val() == "" || chkJS($('#teamNameEn').val())) {
				if (!$('#teamNameEn').parent().hasClass('has-error')) {
					$('#teamNameEn').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#teamNameEn').parent().removeClass('has-error');
			}
			
			function chkJS(str) {
				var js = new RegExp('<script[^>]*?>[\\s\\S]*?<\/script>');
				return js.test(str);
			}
			
			if (error > 0) {
				return;
			}
			
			var teamId = $(this).val();
			$.ajax({
				url: '<c:url value="/admin/teamAdmin?method:insert"/>',
				type: 'post',
				dataType: 'json',
				data: {
					'model.id':teamId,
					'model.ballType':$('#ballType').val(),
					'model.leagueName':$('#leagueName').val(),
					'model.leagueNameEn':$('#leagueNameEn').val(),
					'model.teamName':$('#teamName').val(),
					'model.teamNameEn':$('#teamNameEn').val()
				},
				success: function(data) {
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
				url: '<c:url value="/admin/teamAdmin?method:delete"/>',
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
		
		//Begin of styling		
		function resetInput() {
			$('#ballType')[0].selectedIndex = 0;
			$('#leagueName').val('');
			$('#leagueNameEn').val('');
			$('#teamName').val('');
			$('#teamNameEn').val('');
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
			'order': [[ 0, 'asc' ]],
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