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
<title><s:text name="admin.announceAdmin"/></title>
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
		  							<li class="active"><i class="fa fa-fw fa-bullhorn"></i><span class="left5"><s:text name="admin.announceAdmin"/></span></li>
								</ol>
							</div>
						</div>
						<!-- row -->
						<div class="row">
							<div class="col-sm-12">
								<button id="btnAddAnnounce" class="btn btn-success pull-right btn-sm" type="button" data-toggle="modal" data-target="#announceModal"><i class="fa fa-fw fa-plus"></i><span class="left5"><s:text name="admin.announceAdmin.add"/></span></button>
							</div>
						</div>
						<!-- .row -->
						
			            <!-- Begin of announceTable -->    
						<div class="row top20 container-table">
							<div class="col-sm-12">
								<table id="announceTable" class="table table-hover table-condensed order-column compact nowrap">
									<thead>
										<tr>
											<th>Id</th>
											<th><s:text name="admin.announce.announceTitle"/></th>
											<th><s:text name="admin.announce.createTime"/></th>
											<th><s:text name="admin.announce.modifiedTime"/></th>
											<th><s:text name="admin.btn.action"/></th>
										</tr>
									</thead>
									<tbody id="announceList">
									</tbody>
								</table>
							</div>
						</div>
						<!-- .row -->
						<!-- End of announceTable -->
					</div>
					<!-- .container-right -->
				</div>
				<!-- .row -->
			</div>
			<!-- .container -->
		</div>
		<!-- #page-wrapper -->
		
		<!-- Begin of announceModal -->
		<div class="modal fade" id="announceModal" role="dialog" aria-labelledby="announceModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<div id="announceModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="announceModalTitle" class="modal-title"><s:text name="admin.announceAdmin.add"/></h3>
					</div>
					<!-- modal-header -->
					
					<form role="form" id="announceForm">
						<div class="modal-body">
						
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="announceTitle"><s:text name="admin.announce.announceTitle"/></label>
										<input class="form-control" type="text" name="model.announceTitle" id="announceTitle">
									</div>
								</div>
							</div>
							<!-- .row -->
							
							<div class="row">
								<div class="col-sm-12">
									<div class="form-group">
										<label for="announceContent"><s:text name="admin.announce.announceContent"/></label>
										<textarea class="form-control" name="model.announceContent" id="announceContent" rows="5"></textarea>
									</div>
								</div>
							</div>
							<!-- .row -->
							
						</div>
						<!-- .modal-body -->
					</form>
					<!-- #announceform -->
			      	<div id="announceModalFooter" class="modal-footer">
						<button type="button" class="btn btn-default btn-sm" data-dismiss="modal"><s:text name="admin.btn.cancel"/></button>
						<button type="button" class="btn btn-primary btn-sm" id="btnMerge"><s:text name="admin.btn.confirm"/></button>
			      	</div>
		      		
		      		<!-- .modal-footer -->
				</div>
				<!-- .modal-content -->
			</div>
			<!-- .modal-dialog -->
		</div>
		<!-- End of announceModal -->
		
		<!-- Begin of deleteModal -->
		<div class="modal fade" id="deleteModal" role="dialog" aria-labelledby="deleteModalTitle" aria-hidden="true" tabindex="-1">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
				
					<div id="deleteModalHeader" class="modal-header">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h3 id="deleteModalTitle" class="modal-title"><s:text name="admin.announceAdmin.delete"/></h3>
					</div>
					<!-- modal-header -->
					
					<div class="modal-body">
					
						<div class="row">
							<div class="col-sm-12">
								<h4 class="text-center"><s:text name="admin.announceAdmin.delete.message"/></h4>
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
		
		//Begin of announceTable
		var announceList = $.parseJSON('${json}');
		$.each(announceList, function(index, announce) {
			var child = '';
			child += '<tr>';
			child += '<td>' + announce.id + '</td>'; 
			child += '<td>' + announce.announceTitle + '</td>';
			child += '<td>'; 
			var announceTime = announce.announceTime.iLocalMillis;
			if (zh) {
				child += millisecondToDate(announceTime) + ' ' + millisecondToTime(announceTime);
			} else {
				child += millisecondToDateEn(announceTime) + ' ' + millisecondToTimeEn(announceTime);
			}
			child += '</td>'; 
			child += '<td>';
			var modifiedTime = announce.modifiedTime.iLocalMillis;
			if (zh) {
				child += millisecondToDate(modifiedTime) + ' ' + millisecondToTime(modifiedTime);
			} else {
				child += millisecondToDateEn(modifiedTime) + ' ' + millisecondToTimeEn(modifiedTime);
			}
			child += '</td>'; 
			child += '<td>';
			child += '<button type="button" value="' + announce.id + '"class="btn btn-default btn-xs btn-edit" data-toggle="modal" data-target="#announceModal"><i class="fa fa-fw fa-pencil-square-o"></i></button>';
			child += '<button type="button" value="' + announce.id + '"class="btn btn-default btn-xs btn-del left10" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-fw fa-trash-o"></i></button>';
			child += '</td>';
			child += '</tr>';
			$('#announceList').append(child);
		});
		//End of announceTable
		
		//Begin of listannounce
		$('#btnAddAnnounce').click(function() {
			$('#announceModalTitle').text('<s:text name="admin.announceAdmin.add"/>');
			resetInput();
		});
		$('.btn-edit').click(function() {
			$('#announceModalTitle').text('<s:text name="admin.announceAdmin.edit"/>');
			$.post('<c:url value="/admin/announceAdmin?method:select"/>', {
				'model.id':$(this).val()
			}, function(data) {
				$('#announceTitle').val(data.announceTitle);
				$('#announceContent').val(data.announceContent);
				$('#btnMerge').val(data.id);
			}, 'json');
		});
		//End of listannounce
		
		//Begin of btnMerge
		$('#btnMerge').click(function() {
			var announceId = $(this).val();
			var error = 0;
			
			if ($('#announceTitle').val() == "") {
				if (!$('#announceTitle').parent().hasClass('has-error')) {
					$('#announceTitle').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#announceTitle').parent().removeClass('has-error');
			}
			
			if ($('#announceContent').val() == "") {
				if (!$('#announceContent').parent().hasClass('has-error')) {
					$('#announceContent').parent().addClass('has-error');
				}
				error++;
			} else {
				$('#announceContent').parent().removeClass('has-error');
			}
			
			if (error > 0) {
				return;
			}
			
			$.post('<c:url value="/admin/announceAdmin?method:insert"/>',{
				'model.id':announceId,
				'model.announceTitle':$('#announceTitle').val(),
				'model.announceContent':$('#announceContent').val()
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
			$.post('<c:url value="/admin/announceAdmin?method:delete"/>', {
				'model.id':$(this).val()
			});
			
			$(document).ajaxStop(function() {
				window.location.reload(true);
			});
		});
		//End of btnDelete
		
		//Begin of styling		
		function resetInput() {
			$('#announceTitle').val('');
			$('#announceContent').val('');
			$('#btnMerge').val('');
		}
		
		resetInput();
		
		$('.btn-edit').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.announceAdmin.edit"/>'
		});
		
		$('.btn-del').tooltip({
			'placement': 'top',
			'title': '<s:text name="admin.announceAdmin.delete"/>'
		});
		
		if (zh) {
			$('#announceTable').dataTable({
				'responsive': true,
				'autoWidth': false,
				'order': [[ 0, 'asc' ]],
				'columns': [{'width': '9%'},
				            {'width': '21%'},
				            {'width': '25%'},
				            {'width': '25%'},
				            {'width': '20%'}],
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
		} else {
			$('#announceTable').dataTable({
				'responsive': true,
				'autoWidth': false,
				'order': [[ 0, 'desc' ]],
				'columns': [{'width': '9%'},
				            {'width': '21%'},
				            {'width': '25%'},
				            {'width': '25%'},
				            {'width': '20%'}]
			});
		}
		
		var currentUrl = document.location.pathname;
		var currentPath = currentUrl.substr(currentUrl.lastIndexOf('/') + 1);
		$('nav a[href*="' + currentPath + '"]').parent().addClass('active');
		//End of styling
		
	})(jQuery);
</script>
</body>
</html>