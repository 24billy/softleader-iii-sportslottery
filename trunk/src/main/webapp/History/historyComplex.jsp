<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/bootstrap-dialog.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/jquery.dataTables_themeroller.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/Admin/css/global.css"/>">
<style>
	td.details-control {
	    background: url('<c:url value="/History/images/details_open.png"/>') no-repeat center center;
	    cursor: pointer;
	}
	tr.shown td.details-control {
	    background: url('<c:url value="/History/images/details_close.png"/>') no-repeat center center;
	}
</style>
</head>
<body>
	<div id="page-wrapper">
		
		<div class="container top20">
			
			<div class="row">
				<div class="col-sm-12">
					<form role="form" class="form-inline pull-left" action="<c:url value="/gameManager"/>">
						<div class="form-group">
							<select class="form-control form-ball-type" id="ballType">
								<option value="Baseball">棒球</option>
								<option value="Basketball">籃球</option>
								<option value="Basketball">足球</option>
							</select>
						</div>
                        <input type="text" class="form-control form-game-time" id="timeBegin" placeholder="起始時間" value="" >
                        <input type="text" class="form-control form-game-time" id="timeEnd" placeholder="截止時間" value="" >
                        <input type="text" class="form-control" id="teamName" placeholder="隊伍名稱" value="" >
                        <div id="isEndGroup" class="btn-group" data-toggle="buttons">
							<label class="btn btn-default active" id="isEndLabelDefault">
								<input type="radio" name="isEnd" id="isEndInputDefault" value="none" checked >全選
							</label>
							<label class="btn btn-success">
								<input type="radio" name="isEnd" id="option2" value="true" >已完賽
							</label>
							<label class="btn btn-warning">
								<input type="radio" name="isEnd" id="option3" value="false">未完賽
							</label>
						</div>
						<button type="button" class="btn btn-default" id="cleanQuery">清除搜尋條件</button>
					</form>
				</div>
			</div>
			<!-- .row -->
                
			<div class="row top20">
				<div class="col-lg-12">
					<!-- <div class="table-responsive"> -->
						<table id="gameTable" class="table table-hover table-condensed table-bordered table-striped nowrap">
							<thead>
								<tr>
									<th></th>
									<th>賽事編號</th>
									<th>比賽日期</th>
									<th>客隊隊伍</th>
									<th>主隊隊伍</th>
									<th>投注比</th>
									<th>已結束</th>
	                            </tr>
							</thead>
							<tbody id="gameList">
							</tbody>
							<tfoot>
								<tr>
									<th></th>
									<th>賽事編號</th>
									<th>比賽日期</th>
									<th>客隊隊伍</th>
									<th>主隊隊伍</th>
									<th>投注比</th>
									<th>已結束</th>
	                            </tr>
							</tfoot>
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
	
<script src="<c:url value="/Admin/js/jquery.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/Admin/js/bootstrap-dialog.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/Admin/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/Admin/js/dataTables.responsive.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>

<script>
	(function($) {
		$('#timeBegin').datetimepicker({
			format: 'Y-m-d',
			onShow:function( ct ){
				//this.setOptions({
				//	maxDate:$('#timeEnd').val()?$('#timeEnd').val():false
				//});
			},
			onSelectDate:function(){
				renewData();
			},
			timepicker: false //取消掉顯示時間
		});
		$('#timeEnd').datetimepicker({
			format: 'Y-m-d',
			onShow:function( ct ){
				//this.setOptions({
				//	minDate:$('#timeBegin').val()?$('#timeBegin').val():false
				//});
			},
			onSelectDate:function(){
				renewData();
			},
			timepicker: false //取消掉顯示時間
		});
		$('.btn').button();
		
		$('#ballType').on('change', function(){renewData();});
		$('#teamName').on('keyup', function(){renewData();});	
		$('#isEndGroup>label>input').on('change', function(){
			renewData();
		});
		$('#cleanQuery').on('click', function(){
			$('#timeBegin').val('');
			$('#timeEnd').val('');
			$('#ballType').val('');
			$('#teamName').val('');
			$('#isEndGroup>label').removeClass('active');
			$('#isEndGroup>label>input').prop('checked', false);
			$('#isEndLabelDefault').addClass('active');
			$('#isEndInputDefault').prop('checked', true);
			renewData();
		});
		
		var table;
		function renewData(){
			var isEnd;
			if($('input:checked').val()!='none'){
				isEnd = $('input:checked').val();
			}
			
			$.ajax({
				url:'<c:url value="/searchHistoryComplex?method:searchHistoryComplexData" />',
				type:'post',
				dataType:'json',
				data:{
					'complexTimeBegin':$('#timeBegin').val(),
					'complexTimeEnd':$('#timeEnd').val(),
					'complexBallType':$('#ballType').val(),
					'complexTeamName':$('#teamName').val(),
					'complexIsEnd':isEnd
				},
				success:function(datas){
					if(table){
						$('#gameList').off('click');
						$('#gameTable').DataTable().rows().remove();
						$('#gameTable').DataTable().destroy();
					}
					
					table = $('#gameTable').dataTable({
						'data': datas,
						
				        'columns': [
				        		{
				        		'class':'details-control',
				        		'orderable':false,
				        		'data':null,
				        		'defaultContent': ''
				        		},
				        		{"data": "gameNum"},
				        		{"data": function(row, type, val, meta){
				        			timeString = "";
									timeString += millisecondToDate(row.gameTime.iLocalMillis);
									timeString += " ";
									timeString += millisecondToTime(row.gameTime.iLocalMillis);
									return timeString;
				        		}},
				        		{"data": "teamAway.teamName" },
				        		{"data": "teamHome.teamName" },
				        		{"data": null},
				        		{"data": "isEnd"}
				        ],
				        
				        "order": [[2, 'asc']]
					});
					
					$('#gameList').on('click', 'td.details-control', function () {
				    	var tr = $(this).closest('tr');
				    	var row = $('#gameTable').DataTable().row(tr);
				    	if (row.child.isShown()) {
				      		row.child.remove();
				    		tr.removeClass('shown info');
				    	}else {
				    		row.child(formatDataRow(row.data())).show();
				    		tr.addClass('shown info');
				    	}
				    });
				}
			});
			$(window).unbind('formatDataRow');
			function formatDataRow (dataRow) {
			    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
			        '<tr>'+
			            '<td>gameNum:</td>'+
			            '<td>' + dataRow.gameNum + '</td>'+
			        '</tr>'+
			        '<tr>'+
			            '<td>Extra info:</td>'+
			            '<td>And any further details here (images etc)...</td>'+
			        '</tr>'+
			    '</table>';
			}
		}
		
		renewData();
	})(jQuery);
</script>
</body>
</html>