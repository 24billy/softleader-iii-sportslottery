<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!--  
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-dialog.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables_themeroller.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">
-->
<style>
	td.details-control {
	    background: url('<c:url value="/Security/images/icon.gif"/>') no-repeat center center;
	    cursor: pointer;
	}
	tr.shown td.details-control {
	    background: url('<c:url value="/Security/images/icon.gif"/>') no-repeat center center;
	}
</style>
</head>
<body>
	<div id="page-wrapper">
		
		<div class="container top20">
			
			<div class="row">
				<div class="col-sm-12">
					<form role="form" class="form-inline pull-left" action="<c:url value="/userOdds?method:selectByUser"/>">
                        <input type="text" class="form-control form-game-time" id="timeBegin" placeholder="From" name="timeFrom" >
                        <input type="text" class="form-control form-game-time" id="timeEnd" placeholder="To" name="timeTo" >
                        <div id="isEndGroup" class="btn-group" data-toggle="buttons">
							<label class="btn btn-default active" id="isEndLabelDefault">
								<input type="radio" name="win" id="isEndInputDefault" value="none" checked >全選
							</label>
							<label class="btn btn-success">
								<input type="radio" name="win" id="option2" value="true" >已開獎
							</label>
							<label class="btn btn-warning">
								<input type="radio" name="win" id="option3" value="false" >未開獎
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
						<table id="oddTable" class="table table-hover table-condensed table-bordered table-striped nowrap">
							<thead>
								<tr>
									<th></th>
									<th>彩券編號</th>
									<th>下注時間</th>
									<th>下注金額</th>
									<th>獎金</th>
									<th>玩法</th>
	                            </tr>
							</thead>
							<tbody id="oddList">
							</tbody>
							<tfoot>
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
<!--  
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/bootstrap-dialog.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
-->
<script>
	(function($) {
		$('#timeBegin').datetimepicker({
			format: 'Y-m-d',
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
			format: 'Y-m-d',
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
		$('input[name="win"]').on('change',function() {
			renewData();
		});
		$('#cleanQuery').on('click',function() {
			$('#timeBegin').val('');
			$('#timeEnd').val('');
			$('#isEndGroup>label').removeClass('active');
			$('#isEndGroup>label>input').prop('checked', false);
			$('#isEndLabelDefault').addClass('active');
			$('#isEndInputDefault').prop('checked', true);
			renewData();
		});
		
		var table;
		function renewData(){
			var win = "";
			var winQuery;
			win = $('input[name="win"]:checked').val();
			if(win == 'none'){
			} else if(win == 'true') {
				winQuery = 0;
			} else if(win == 'false') {
				winQuery = -1;
			}
			//console.log(winQuery);
			$.ajax({
				url:'<c:url value="/userOdds?method:selectByUser" />',
				type:'post',
				dataType:'json',
				data:{
					'timeFrom':$('#timeBegin').val(),
					'timeTo':$('#timeEnd').val(),
					'winOpen':winQuery,
				},
				success:function(datas){
					if(table){
						$('#oddList').off('click');
						$('#oddTable').DataTable().rows().remove();
						$('#oddTable').DataTable().destroy();
					}
					//console.log("-----datas-----");
					//console.log(datas);
					
					var detail = [];
					var lotterys = [];
					var lotteryInfo = [];
					//每張彩券
					$.each(datas,function(index,data) {
						//console.log(data);
						lotterys = [];
						detail = [];
						var lottery = {};
						lottery.id = data.id;
						//下注時間
						lottery.iMillis = data.confirmTime.iLocalMillis;
						lottery.date = millisecondToDate(lottery.iMillis); //下注日期
						lottery.time = millisecondToTime(lottery.iMillis); //下注時間
						//金額獎金
						lottery.win = data.win;
						lottery.capital = data.capital;
						//lottery.odds = data.lotteryOdds;
						//判斷玩法
						lottery.unique = data.com1;
						lottery.com2 = data.com2;
						lottery.com3 = data.com3;
						lottery.com4 = data.com4;
						lottery.com5 = data.com5;
						lottery.com6 = data.com6;
						lottery.com7 = data.com7;
						lottery.com8 = data.com8;
						lottery.com = data.com0;
						if(lottery.unique!=null && lottery.com2==null && lottery.com3==null && 
						   lottery.com4==null && lottery.com5==null && lottery.com6==null && 
						   lottery.com7==null && lottery.com8==null && lottery.com==null) {
						
						   lottery.play = "單場";
						   
						} else if(lottery.unique==null && lottery.com2==null && lottery.com3==null && 
								  lottery.com4==null && lottery.com5==null && lottery.com6==null && 
								  lottery.com7==null && lottery.com8==null && lottery.com!=null) {
								  
								  lottery.play = "過關";
								  
						} else if(lottery.com2!=null || lottery.com3!=null || lottery.com4!=null || lottery.com5!=null ||
								  lottery.com6!=null || lottery.com7!=null || lottery.com8!=null) {
								  
								  lottery.play = "過關組合";
						}
						
						//每注資料以oddsId排列
						$.each(data.lotteryOdds, function(index,odd) {
							
							var info = {};
							var gameId = odd.oddsId.gameId;
							$.getJSON('<c:url value="/game?method:select" />',{
								'model.id':gameId
							}).done(function(game) {
								info['oddId'] = odd.oddsId.id;
								info['count'] = odd.oddsId.count;
								info['value'] = odd.oddsId.oddValue;
								if(odd.oddsId.isPass == null) {
									info['isPass'] = "未開獎";
								} else {
									if(odd.oddsId.isPass == true) {
										info['isPass'] = "過關";
									} else {
										info['isPass'] = "未過關";
									}
								}
								info['teamAwayName'] = game.teamAway.teamName;
								info['teamHomeName'] = game.teamHome.teamName;
								info['ballType'] = game.ballType;
								timeString = "";
								timeString += millisecondToDate(game.gameTime.iLocalMillis);
								timeString += " ";
								timeString += millisecondToTime(game.gameTime.iLocalMillis);
								info['gameTime'] = timeString;
								if(game.gameScoreHome == 0 && game.gameScoreAway == 0) {
									info['gameName'] = "未完賽";
								} else {
									gameName = "";
									gameName += game.gameScoreAway;
									gameName += ":";
									gameName += game.gameScoreHome;
									info['gameName'] = gameName;
								}
								switch(odd.oddsId.oddType) {
							    case 'SU_A':
							    	type = "不讓分(";
							    	type += game.teamAway.teamName;
							    	type += ")";
							    	info.labelText = type;
							    	break;
							    case 'SU_H':
							    	type = "不讓分(";
							    	type += game.teamHome.teamName;
							    	type += ")";
							    	info.labelText = type;
									break;
							    case 'ATS_A':
							    	type = "讓分(";
							    	type += game.teamAway.teamName;
							    	type += ")";
							    	info.labelText = type;
							    	break;
							    case 'ATS_H':
							    	type = "讓分(";
							    	type += game.teamHome.teamName;
							    	type += ")";
							    	info.labelText = type;
							    	break;
							    case 'SC_H':
							    	info.labelText = "總分合大於";
							    	break;
							    case 'SC_L':
							    	info.labelText = "總分合小於";
							    	break;
							    case 'ODD':
							    	info.labelText = "總分合為單數";
							    	break;
							    case 'EVEN':
							    	info.labelText = "總分合為偶數";
							    	break;
							    default:
							    	break;
								}
							});
							detail.push(info);
						});
						lotterys.push(detail);
						lottery.odds = detail;
						lotteryInfo.push(lottery);
					});
					
					//$(document).ajaxStop(function() {
						console.log("=====lotteryInfo=====");
						console.log(lotteryInfo);
						//$('.details-control').click(function() {
						//	$('#dialog').modal();
						//});
						//塞第一層資料
						table = $('#oddTable').dataTable({
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
							'data': lotteryInfo,
							
					        'columns': [
					        		{
					        		'class':'details-control',
					        		'orderable':false,
					        		'data':null,
					        		'defaultContent': ''
					        		},
					        		{"data": "id"},
					        		{"data": function(row, type, val, meta){
					        			timeString = "";
										timeString += millisecondToDate(row.iMillis);
										timeString += " ";
										timeString += millisecondToTime(row.iMillis);
										return timeString;
					        		}},
					        		{"data": "capital" },
					        		{"data": function(row, type, val, meta){
					        			if(row.win == -1) {
					        				return '<td><button type="button" class="btn btn-warning btn-xs btn-status" data-toggle="modal" data-target="#statusModal">未開獎</button></td>';
					        			} else {
					        				return row.win;
					        			}
					        		}},
					        		{"data": "play" },
					        ],
					        
					        "order": [[1, 'desc']]
						});
						$('#oddList').on('click', 'td.details-control', function () {
					    	var tr = $(this).closest('tr');
					    	var row = $('#oddTable').DataTable().row(tr);
					    	if (row.child.isShown()) {
					      		row.child.remove();
					    		tr.removeClass('shown info');
					    	}else {
					    		row.child(formatDataRow(row.data())).show();
					    		tr.addClass('shown info');
					    	}
					    });
						
					//});//ajaxStop	
				}//success
			});//ajax
				
			$(window).unbind('formatDataRow');
			function formatDataRow (dataRow) {
				var odds = new Object();
				odds = dataRow.odds;
				console.log(odds);
				var temp = '';
				temp += '<table class="table" cellspacing="0" border="0";">'+
		        '<thead>'+
		        	'<tr>'+
		        		'<td>球種</td>'+
		        		'<td>比賽時間</td>'+
		        		'<td>比賽隊伍</td>'+
		        		'<td>下注類型</td>'+
		        		'<td>賠率</td>'+
		        		'<td>比分</td>'+
		        		'<td>投注人數</td>'+
		        		'<td>過關</td>'+
		        	'</tr>'+	
				'</thead>';
				
				$.each(odds, function(index,odd) {
				
				temp += '<tbody>'+
				'<tr>'+
		            '<td>' + odd.ballType+ '</td>'+
		            '<td>' + odd.gameTime+ '</td>'+
		            '<td>' + odd.teamAwayName+'VS.'+ odd.teamHomeName+'</td>'+
		            '<td>' + odd.labelText+ '</td>'+
		            '<td>' + odd.value+ '</td>'+
		            '<td>' + odd.gameName+ '</td>'+
		            '<td>' + odd.count+ '</td>'+
		            '<td>' + odd.isPass+ '</td>'+
		        '</tr>'+
		        '</tbody>';
				});
				temp += '</table>';
				return temp;
			}
		}
		renewData();
	})(jQuery);
</script>
</body>
</html>