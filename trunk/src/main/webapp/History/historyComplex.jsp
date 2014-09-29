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
	
	#gameTable .gameTimeDetail{
		cursor: pointer;
	}
	#gameTable .teamAwayDetail{
		cursor: pointer;
	}
	#gameTable .teamHomeDetail{
		cursor: pointer;
	}
	
	#gameTable .gameTimeDetail:HOVER{
		background-color: #cccccc;
	}
	#gameTable .teamAwayDetail:HOVER{
		background-color: #cccccc;
	}
	#gameTable .teamHomeDetail:HOVER{
		background-color: #cccccc;
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
								<option value="Soccer">足球</option>
							</select>
						</div>
                        <div id="searchScopeGroup" class="btn-group" data-toggle="buttons" >
							<a href="#" role="button" class="form-ele btn btn-success" id="back3" name="searchScope" data-toggle="button">
								<span class="glyphicon glyphicon-backward"></span>
							</a>
							<a href="#" role="button" class="form-ele btn btn-success" id="back1" name="searchScope" data-toggle="button">
								<span id="searchPreview"></span><span class="glyphicon glyphicon-chevron-left"></span>
							</a>
							<a href="#" role="button" class="form-ele btn btn-default" id="searchScopeDefault" name="searchScope" data-toggle="button" >
								<span id="searchDefault"></span>
							</a>
							<a href="#" role="button" class="form-ele btn btn-success" id="next1" name="searchScope" data-toggle="button">
								<span id="searchNextview"></span><span class="glyphicon glyphicon-chevron-right"></span>
							</a>
							<a href="#" role="button" class="form-ele btn btn-success" id="next3" name="searchScope" data-toggle="button">
								<span class="glyphicon glyphicon-forward"></span>
							</a>
						</div>
                        <input type="text" class="form-control" id="teamName" placeholder="隊伍名稱" value="" >
                        <div id="isEndGroup" class="btn-group" data-toggle="buttons">
							<label class="btn btn-default active" id="isEndLabelDefault">
								<input type="radio" name="isEnd" id="isEndInputDefault" value="none" checked >全選
							</label>
							<label class="btn btn-success">
								<input type="radio" name="isEnd" id="option2" value="true" >已派彩
							</label>
							<label class="btn btn-warning">
								<input type="radio" name="isEnd" id="option3" value="false">未派彩
							</label>
						</div>
						<button type="button" class="btn btn-default" id="cleanQuery">清除搜尋條件</button>
					</form>
				</div>
			</div>
			<!-- .row -->
                
			<div class="row top20">
				<div class="col-lg-12">
					<div class="table-responsive">
						<table id="gameTable" class="compact hover order-column row-border">
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
					</div>
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
	<form style="display:none;" id="timeCountForm" method="post" action="<c:url value="successCountAllHistoryByTime"/>">
		<input id= "linkGameTime" name = "linkGameTime">
	</form>
<script>
	(function($) {
		
		//取得今天日期
		var d = new Date();
		var searchDay = $.format.date(d.getTime(), 'yyyy-MM-dd');
		var searchDayPre;
		var searchDayNex;
		
		//響應頁面大小
		function responseSize(){
			d = new Date(Date.parse(searchDay));
			searchDayPre = $.format.date(d.setDate(d.getDate()), 'yyyy-MM-dd');
			searchDayNex = $.format.date(d.setDate(d.getDate()+1), 'yyyy-MM-dd');
			d = new Date(Date.parse(searchDay));
			
			if ($(window).width() < 1543){
				$('#sortGroup').css('float', 'none');
			} else {
				$('#sortGroup').css('float', 'right');
			}
			if ($(window).width() < 895) {
				if(!$('form .form-ele').hasClass('input-sm')){
					$('form .form-ele').addClass('input-sm');
				}
				$('#searchPreview').text('');
				d = new Date(Date.parse(searchDay));
				$('#searchDefault').html('<span class="glyphicon glyphicon-repeat"></span>');
				d = new Date(Date.parse(searchDay));
				$('#searchNextview').text('');
				d = new Date(Date.parse(searchDay));
			} else {
				if($('form .form-ele').hasClass('input-sm')){
					$('form .form-ele').removeClass('input-sm');
				}
				$('#searchPreview').text($.format.date(d.setDate(d.getDate()-1), 'yyyy-MM-dd'));
				d = new Date(Date.parse(searchDay));
				$('#searchDefault').text($.format.date(d.getTime(), 'yyyy-MM-dd'));
				d = new Date(Date.parse(searchDay));
				$('#searchNextview').text($.format.date(d.setDate(d.getDate()+1), 'yyyy-MM-dd'));
				d = new Date(Date.parse(searchDay));
			}
		}

		$(window).resize(function() {
			responseSize();
		});
		
		//依時間顯示按鈕訊息
		function changeDate(){
			responseSize();
			
			$('#back3').tooltip({
				placement:'top',
				title:'往前三天',
				container: 'body'
			});
			$('#back1').tooltip({
				placement:'top',
				title:'往前一天',
				container: 'body'
			});
			$('#searchScopeDefault').tooltip({
				placement:'top',
				title:'返回今天日期',
				container: 'body'
			});
			$('#next1').tooltip({
				placement:'top',
				title:'往後一天',
				container: 'body'
			});
			$('#next3').tooltip({
				placement:'top',
				title:'往後三天',
				container: 'body'
			});
		}
		changeDate();

		$('.btn').button();
		
		//往前一日
		$('#searchScopeGroup a:eq(1)').off('click');
		$('#searchScopeGroup a:eq(1)').on('click', function(){
			d = new Date(Date.parse(searchDay));
			searchDay = $.format.date(d.setDate(d.getDate()-1), 'yyyy-MM-dd');
			changeDate();
			renewData();
		});

		//往後一日
		$('#searchScopeGroup a:eq(3)').off('click');
		$('#searchScopeGroup a:eq(3)').on('click', function(){
			d = new Date(Date.parse(searchDay));
			searchDay = $.format.date(d.setDate(d.getDate()+1), 'yyyy-MM-dd');
			changeDate();
			renewData();
		});

		//往前三日
		$('#searchScopeGroup a:eq(0)').off('click');
		$('#searchScopeGroup a:eq(0)').on('click', function(){
			d = new Date(Date.parse(searchDay));
			searchDay = $.format.date(d.setDate(d.getDate()-3), 'yyyy-MM-dd');
			changeDate();
			renewData();
		});

		//往後三日
		$('#searchScopeGroup a:eq(4)').off('click');
		$('#searchScopeGroup a:eq(4)').on('click', function(){
			d = new Date(Date.parse(searchDay));
			searchDay = $.format.date(d.setDate(d.getDate()+3), 'yyyy-MM-dd');
			changeDate();
			renewData();
		});

		//回到今日
		$('#searchScopeDefault').off('click');
		$('#searchScopeDefault').on('click', function(){
			searchDay = $.format.date(new Date, 'yyyy-MM-dd');
			changeDate();
			renewData();
		});
		
		$('#ballType').on('change', function(){renewData();});
		$('#teamName').on('keyup', function(){renewData();});	
		$('#isEndGroup>label>input').on('change', function(){
			renewData();
		});
		$('#cleanQuery').on('click', function(){
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
				isEnd = $('#isEndGroup input:checked').val();
			}
			
			$.ajax({
				url:'<c:url value="/searchHistoryComplex?method:searchHistoryComplexData" />',
				type:'post',
				dataType:'json',
				data:{
					'complexTimeBegin':searchDayPre,
					'complexTimeEnd':searchDayNex,
					'complexBallType':$('#ballType').val(),
					'complexTeamName':$('#teamName').val(),
					'complexIsEnd':isEnd,
				},
				success:function(datas){
					
					if(table){
						$('#gameList').off('click');
						$('#gameTable').DataTable().rows().remove();
						$('#gameTable').DataTable().destroy();
					}//end if
					
					//取得今天日期
					var d = new Date();
					var searchDay = $.format.date(d.getTime(), 'yyyy-MM-dd');
					
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
				        			},
				        		"class":"gameTimeDetail"
				        		},
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
									if(row.gameStatus >= 2){
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
				        			if(row.gameStatus == 3){
				        				return '<td><button type="button" class="btn btn-success btn-xs disabled">已派彩</button></td>';
				        			} else {
				        				return '<td><button type="button" class="btn btn-warning btn-xs btn-status disable" data-toggle="modal" data-target="#statusModal" disabled>未派彩</button></td>'	
				        			}
				        		}}//"data": function(row, type, val, meta)
				        ],
				        
				        "order": [[2, 'asc']]
					});//table = $('#gameTable').dataTable
					
					$('#gameList').on('mouseover ', 'td.gameTimeDetail', function () {
						$(this).tooltip('destroy');
						$(this).tooltip({
							placement:'top',
							title:'點擊可開啟詳細統計資訊',
							container: 'body',
						});
						$(this).tooltip('show');
				    });
					$('#gameList').on('mouseover ', 'td.teamAwayDetail', function () {
						$(this).tooltip('destroy');
						$(this).tooltip({
							placement:'top',
							title:'開啟' + $(this).text() + '的統計資訊',
							container: 'body',
						});
						$(this).tooltip('show');
				    });
					$('#gameList').on('mouseover ', 'td.teamHomeDetail', function () {
						$(this).tooltip('destroy');
						$(this).tooltip({
							placement:'top',
							title:'開啟' + $(this).text() + '的統計資訊',
							container: 'body',
						});
						$(this).tooltip('show');
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
					
						$('#gameList').on('click', '.gameTimeDetail', function() {
							var linkGameTime = $('td:eq(2)' ,$(this).parent()).text(); //gameNum
							$('#linkGameTime').val(linkGameTime);
							$('#timeCountForm').submit();
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
						            '<td width="6%">' + rateName + ':</td>'+
									'<td>'+
							            '<div class="progress">'+
										  '<div class="progress-bar progress-bar-success progress-bar-striped active" style="width: ' + rateA + '%">' + teamA + ' ' + rateA + '%</div>'+
										  '<div class="progress-bar progress-bar-warning progress-bar-striped active" style="width: ' + rateH + '%">' + teamH + ' ' + rateH + '%</div>'+
										'</div>'+
									'</td>'+
						        '</tr>';
						} else {
							return '<tr>'+
				            		'<td width="6%">' + rateName + ':</td>'+
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