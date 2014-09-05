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
							<select class="form-control form-ball-type" id="ballType" >
								<option value="Baseball">棒球</option>
								<option value="Basketball">籃球</option>
								<option value="Basketball">足球</option>
							</select>
						</div>
                        <input type="text" class="form-control form-game-time" id="timeBegin" placeholder="起始時間" >
                        <input type="text" class="form-control form-game-time" id="timeEnd" placeholder="截止時間" >
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
									<th>比分</th>
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
									<th>比分</th>
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
			format:'Y-m-d',
			onShow:function( ct ){
				this.setOptions({
					maxDate:$('#timeEnd').val()?$('#timeEnd').val().replace(/-/g,'/'):false
				});
			},
			onSelectDate:function(){
				renewData();
			},
			timepicker: false //取消掉顯示時間
		});
		$('#timeEnd').datetimepicker({
			format:'Y-m-d',
			onShow:function( ct ){
				this.setOptions({
					minDate:$('#timeBegin').val()?$('#timeBegin').val().replace(/-/g,'/'):false
				});
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
						oLanguage: {
							'sProcessing':'處理中...',
							'sLengthMenu':'顯示 _MENU_ 項結果',
							'sZeroRecords':'沒有匹配結果',
							'sInfo':'顯示第 _START_ 至 _END_ 項結果，共 _TOTAL_ 項',
							'sInfoEmpty':'顯示第 0 至 0 項結果，共 0 項',
							'sInfoFiltered':'(從 _MAX_ 項結果過濾)',
							'sInfoPostFix':'',
							'sSearch':'搜索:',
							'sUrl':'',
							'oPaginate': {
								'sFirst':'首頁',
								'sPrevious':'上頁',
								'sNext':'下頁',
								'sLast':'尾頁'
							}
						},
						
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
				        		{"data": function(row, type, val, meta){
									var sortedOdds = sortGameOdds(row.odds);
									if(sortedOdds['SU_A']&&sortedOdds['SU_H']){
										
										var rateSU_A = parseInt((sortedOdds['SU_A'].count/(sortedOdds['SU_H'].count+sortedOdds['SU_A'].count))*100);
										var rateSU_H = 100 - rateSU_A;
										
										return '<div class="progress">' +
										  '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: ' + rateSU_A + '%"></div>' +
										  '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: ' + rateSU_H + '%"></div>' +
										'</div>';
									} else {
										return "undefined";
									}

				        		}},
				        		{"data": function(row, type, val, meta){
				        			if(row.isEnd){
				        				return '<td><button type="button" class="btn btn-success btn-xs disabled">已完賽</button></td>';
				        			} else {
				        				return '<td><button type="button" class="btn btn-warning btn-xs btn-status" data-toggle="modal" data-target="#statusModal">未完賽</button></td>'	
				        			}
				        		}}
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
				var sortedOdds = sortGameOdds(dataRow.odds);
				if(!sortedOdds['SU_A']){
					return "undefined";
				} else {
					var rateSU_A = parseInt((sortedOdds['SU_A'].count/(sortedOdds['SU_H'].count+sortedOdds['SU_A'].count))*100);
					var rateSU_H = 100 - rateSU_A;
					
					var rateATS_A = parseInt((sortedOdds['ATS_A'].count/(sortedOdds['ATS_H'].count+sortedOdds['ATS_A'].count))*100);
					var rateATS_H = 100 - rateATS_A;
					
					var rateSC_H = parseInt((sortedOdds['SC_L'].count/(sortedOdds['SC_H'].count+sortedOdds['SC_L'].count))*100);
					var rateSC_L = 100 - rateSC_H;
					
					var rateODD = parseInt((sortedOdds['ODD'].count/(sortedOdds['EVEN'].count+sortedOdds['ODD'].count))*100);
					var rateEVEN = 100 - rateODD;
					
				    return '<table class="table" cellspacing="0" border="0">'+
			        '<tr>'+
			            '<td width="5%">不讓分:</td>'+
						'<td>'+
				            '<div class="progress">'+
							  '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: ' + rateSU_A + '%">' + dataRow.teamAway.teamName + ' ' + rateSU_A + '%</div>'+
							  '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: ' + rateSU_H + '%">' + dataRow.teamHome.teamName + ' ' + rateSU_H + '%</div>'+
							'</div>'+
						'</td>'+
			        '</tr>'+
			        '<tr>'+
			            '<td>　讓分:</td>'+
						'<td>'+
				            '<div class="progress">'+
							  '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: ' + rateATS_A + '%">' + dataRow.teamAway.teamName + ' ' + rateATS_A + '%</div>'+
							  '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: ' + rateATS_H + '%">' + dataRow.teamAway.teamName + ' ' + rateATS_H + '%</div>'+
							'</div>'+
						'</td>'+
			        '</tr>'+
			        '<tr>'+
			            '<td>　總分:</td>'+
						'<td>'+
				            '<div class="progress">'+
							  '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: ' + rateSC_H + '%">大 ' + rateSC_H + '%</div>'+
							  '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: ' + rateSC_L + '%">小 ' + rateSC_L + '%</div>'+
							'</div>'+
						'</td>'+
			        '</tr>'+
				        '<tr>'+
			            '<td>單雙數:</td>'+
						'<td>'+
				            '<div class="progress">'+
							  '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: ' + rateODD + '%">單 ' + rateODD + '%</div>'+
							  '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: ' + rateEVEN + '%">雙 ' + rateEVEN + '%</div>'+
							'</div>'+
						'</td>'+
			        '</tr>'+
			    '</table>';
				}
			}
		}
		
		renewData();
	})(jQuery);
</script>
</body>
</html>