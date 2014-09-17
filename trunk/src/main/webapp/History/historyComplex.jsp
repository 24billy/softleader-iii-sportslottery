<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
	td.details-control {
	    background: url('<c:url value="/History/images/details_open.png"/>') no-repeat center center;
	    cursor: pointer;
	}
	tr.shown td.details-control {
	    background: url('<c:url value="/History/images/details_close.png"/>') no-repeat center center;
	}
	
	.progress{
		margin:0px;
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
	<form style="display:none;" id="countForm" method="post" action="<c:url value="/teamChartOddTime"/>">
		<input id="linkGameNum" name="linkGameNum">
		<input id="linkTeamSearch" name="linkTeamSearch">
	</form>
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
					}//end if
					
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
						},//end oLanguage
						
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
				        		{
				        		"data": "teamAway.teamName",
				        		"class":"teamAwayDetail",
				        		'defaultContent': ''
				        		},
				        		{
				        		"data": "teamHome.teamName",
				        		"class":"teamHomeDetail",
				        		'defaultContent': ''
				        		},
				        		{"data": function(row, type, val, meta){
									if(row.gameScoreAway||row.gameScoreHome){
										var rateA = parseInt(((row.gameScoreAway+1)/(row.gameScoreHome+row.gameScoreAway+2))*100);
										var rateH = 100 - rateA;
										
										return '<div class="progress">' +
										  '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: ' + rateA + '%">' + row.gameScoreAway + '</div>' +
										  '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: ' + rateH + '%">' + row.gameScoreHome + '</div>' +
										'</div>';
									} else {
										return '<div class="progress">' + 
											'<div class="progress-bar progress-bar-danger progress-bar-striped active" style="width: 100%">暫無比分</div>' +
										'</div>';
									}

				        		}},//end dataL function(row, type, val, meta)
				        		{"data": function(row, type, val, meta){
				        			if(row.isEnd){
				        				return '<td><button type="button" class="btn btn-success btn-xs disabled">已完賽</button></td>';
				        			} else {
				        				return '<td><button type="button" class="btn btn-warning btn-xs btn-status" data-toggle="modal" data-target="#statusModal">未完賽</button></td>'	
				        			}
				        		}}//"data": function(row, type, val, meta)
				        ],
				        
				        "order": [[2, 'asc']]
					});//table = $('#gameTable').dataTable
					
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
					
					sendDataToGraph1();//以隊伍搜尋此場賽事(含)之前所有的COUNT資訊
					//sendDataToGraph2();//以隊伍搜尋所有COUNT資訊
					function sendDataToGraph1(){
						
						
						$('#gameList').on('click', '.teamAwayDetail', function() {
							var linkGameNum = $('td:eq(1)' ,$(this).parent()).text(); //gameNum
							var linkTeamSearch = $('td:eq(3)' ,$(this).parent()).text(); //teamAway
							$('#linkGameNum').val(linkGameNum);
							$('#linkTeamSearch').val(linkTeamSearch);
							$('#countForm').submit();
						});
						
						$('#gameList').on('click', '.teamHomeDetail', function() {
							var linkGameNum = $('td:eq(1)' ,$(this).parent()).text(); //gameNum
							var linkTeamSearch = $('td:eq(4)' ,$(this).parent()).text(); //teamAway
							$('#linkGameNum').val(linkGameNum);
							$('#linkTeamSearch').val(linkTeamSearch);
							$('#countForm').submit();
						});
						
					}
					
					function sendDataToGraph2(){
		
						
						$('#gameList').on('click', '.teamAwayDetail', function() {
							var linkGameNum = $('td:eq(1)' ,$(this).parent()).text(); //gameNum
							var linkTeamSearch = $('td:eq(3)' ,$(this).parent()).text(); //teamAway
							
							$('#linkTeamSearch').val(linkTeamSearch);
							$('#countForm').submit();
						});
						
						$('#gameList').on('click', '.teamHomeDetail', function() {
							var linkGameNum = $('td:eq(1)' ,$(this).parent()).text(); //gameNum
							var linkTeamSearch = $('td:eq(4)' ,$(this).parent()).text(); //teamAway
							
							$('#linkTeamSearch').val(linkTeamSearch);
							$('#countForm').submit();
						});
						
					}
					
// 					sendDataToGraph();
	
// 					//點選隊伍，將對伍名稱和比賽號碼送出
// 					function sendDataToGraph(){
// 						$('#gameList tr').each(function() {//tr迴圈
// 							$(this).find('td:eq(3)').on('click', function() {//尋找第四個TD
							
							
// 								var linkGameNum = $('td:eq(1)' ,$(this).parent()).text(); //gameNum
// 								var linkTeamSearch = $('td:eq(3)' ,$(this).parent()).text(); //teamAway
// 								$('#linkGameNum').val(linkGameNum);
// 								$('#linkTeamSearch').val(linkTeamSearch);
// 								$('#countForm').submit();

// 							});
// 						});//end $('#gameList tr').each(function()
								
// 						$('#gameList tr').each(function() {//tr迴圈
// 							$(this).find('td:eq(4)').on('click', function() {//尋找第四個TD
							
							
// 								var linkGameNum = $('td:eq(1)' ,$(this).parent()).text(); //gameNum
// 								var linkTeamSearch = $('td:eq(4)' ,$(this).parent()).text(); //teamAway
// 								$('#linkGameNum').val(linkGameNum);
// 								$('#linkTeamSearch').val(linkTeamSearch);
// 								$('#countForm').submit();
// 							});
// 						});//end $('#gameList tr').each(function()
// 					}//end sendDataToGraph()
					

/* 					$('#gameList tr>td:eq(4)').on('click', function(){
						var linkGameNum = $('td:eq(1)' ,$(this).parent()).text(); //gameNum
						var linkTeamAway = $('td:eq(3)' ,$(this).parent()).text(); //teamAway
						var linkTeamSearch = $('td:eq(4)' ,$(this).parent()).text(); //teamHome
						console.log('linkGameNum'+linkGameNum);
						console.log('linkTeamAway'+linkTeamAway);
						console.log('linkTeamSearch'+linkTeamSearch);
					}); */
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
					
					function writeRateHtml(rateName, rateA, rateH, teamA, teamH){
						if(rateA||rateH){
							return '<tr>'+
						            '<td width="5%">' + rateName + ':</td>'+
									'<td>'+
							            '<div class="progress">'+
										  '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: ' + rateA + '%">' + teamA + ' ' + rateA + '%</div>'+
										  '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: ' + rateH + '%">' + teamH + ' ' + rateH + '%</div>'+
										'</div>'+
									'</td>'+
						        '</tr>';
						} else {
							return '<tr>'+
				            		'<td width="5%">' + rateName + ':</td>'+
									'<td>'+
							            '<div class="progress">'+
										  '<div class="progress-bar progress-bar-danger progress-bar-striped active" style="width: 100%">暫無資料</div>'+
										'</div>'+
									'</td>'+
						        '</tr>';	
						}

					}
					
				    return '<table class="table" cellspacing="0" border="0">'+
				    	'<tr><th>投注比<th><tr>'+
					    writeRateHtml('不讓分', rateSU_A, rateSU_H, dataRow.teamAway.teamName, dataRow.teamHome.teamName)+
					    writeRateHtml('　讓分', rateATS_A, rateATS_H, dataRow.teamAway.teamName, dataRow.teamHome.teamName)+
					    writeRateHtml('　總分', rateSC_H, rateSC_L, dataRow.teamAway.teamName, dataRow.teamHome.teamName)+
					    writeRateHtml('單雙數', rateODD, rateEVEN, dataRow.teamAway.teamName, dataRow.teamHome.teamName)+
			    	'</table>';
				}
			}
		}
		
		renewData();
	})(jQuery);
</script>
</body>
</html>