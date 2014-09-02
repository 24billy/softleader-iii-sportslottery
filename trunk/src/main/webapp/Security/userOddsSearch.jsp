<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
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
					<form role="form" class="form-inline pull-left" action="<c:url value="/userSearchOdds?method:selectByUser"/>">
						<!--<div class="form-group">
							<select class="form-control form-ball-type" id="ballType">
								<option value="Baseball">棒球</option>
								<option value="Basketball">籃球</option>
								<option value="Basketball">足球</option>
							</select>
						</div>  -->
                        <input type="text" class="form-control form-game-time" id="timeBegin" placeholder="From" name="timeFrom" >
                        <input type="text" class="form-control form-game-time" id="timeEnd" placeholder="To" name="timeTo" >
                        <div id="isEndGroup" class="btn-group" data-toggle="buttons">
							<label class="btn btn-default active" id="isEndLabelDefault">
								<input type="radio" name="isEnd" id="isEndInputDefault" value="none" checked >全選
							</label>
							<label class="btn btn-success">
								<input type="radio" name="isEnd" id="option2" value="true" >已開獎
							</label>
							<label class="btn btn-warning">
								<input type="radio" name="isEnd" id="option3" value="false">未開獎
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
									<th>狀態</th>
	                            </tr>
							</thead>
							<tbody id="oddList">
								<tr>
									<th></th>
									<th>彩券編號</th>
									<th>下注時間</th>
									<th>下注金額</th>
									<th>獎金</th>
									<th>狀態</th>
	                            </tr>
							</tbody>
							<tfoot>
								<!--  <tr>
									<th></th>
									<th>球種</th>
									<th>比賽日期</th>
									<th>比賽隊伍</th>
									<th>下注類型</th>
									<th>賠率</th>
									<th>主隊比分</th>
									<th>客隊比分</th>
									<th>投注人數</th>
									<th>過關</th>
	                            </tr>-->
							</tfoot>   
						</table>
					<!-- </div>  -->
					<!-- .table-responsive -->
				</div>
			</div>
			<!-- .row -->
			<div id = "dialog" class="modal fade bs-example-modal-lg" tabindex="-1"
				role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg">
					<div class="modal-content">
						<div id="gameModalHeader" class="modal-header">
							<h3 id="gameModalTitle" class="modal-title">投注資訊</h3>
						</div>
					</div>
				</div>
			</div>
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
		$('#isEndGroup>lable>input').on('change',function() {
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
		var odds2 = [];
		var table;
		var table2;
		function renewData(){
		
			$.ajax({
				url:'<c:url value="/userSearchOdds?method:selectByUser" />',
				type:'post',
				dataType:'json',
				data:{
					'timeFrom':$('#timeBegin').val(),
					'timeTo':$('#timeEnd').val(),
					'complexBallType':$('#ballType').val(),
				},
				success:function(datas){
					if(table){
						$('#oddList').off('click');
						$('#oddTable').DataTable().rows().remove();
						$('#oddTable').DataTable().destroy();
					}
					console.log("-----datas-----");
					console.log(datas);
					
					
					var lotterys = [];
					var odds1 = [];
					//每張彩券
					$.each(datas,function(index,data) {
						var lottery = new Object();
						console.log(data);
						lottery.id = data.id;
						//下注時間
						lottery.iMillis = data.confirmTime.iLocalMillis;
						lottery.date = millisecondToDate(lottery.iMillis); //下注日期
						lottery.time = millisecondToTime(lottery.iMillis); //下注時間
						//金額獎金
						lottery.win = data.win;
						lottery.capital = data.capital;
						lottery.odds = data.lotteryOdds;
						//每注資料以oddsId排列
						$.each(data.lotteryOdds, function(index,odd) {
							odds1.push(odd);
						});
						lotterys.push(lottery);
					});
					console.log("-----lotterys(第一層)-----");
					console.log(lotterys);
					console.log("-----odds1-----");
					console.log(odds1);
					
					//取得game&team 資料
					$.getJSON('<c:url value="/game?method:select" />', {}, function(datas2){
						var games = [];
						var odds = [];
						//根據gameId與oddId分配出game陣列與odd陣列方便後續使用
						$.each(datas2, function(index, data){
							games[data.gameNum] = data;
							$.each(data.odds, function(index, odd){
								odds[odd.id] = odd;
							});
						});
						
						//debug用
						console.log('-----Game-----');
						console.log(games);
						console.log('-----Odds-----');
						console.log(odds);
						
						//game資料進一步處理 將odds中的資料往上提方便後續使用
						$.each(games, function(index, game){
							if(game != null){
								game.iMillis = game.gameTime.iLocalMillis;
								game.date = millisecondToDate(game.iMillis);
								game.time = millisecondToTime(game.iMillis);
								//根據odd的內容來建立game的屬性
								
								$.each(game.odds, function(index, odd){
									odd.gameNum = game.gameNum;
								});
							}
						});
						
						//抓game裡的資料塞入odds2(第二層用)
						for(var i = 0; i<odds1.length; i++) {
							var odd = new Object();
							
							odd.lotteryId = odds1[i].lotteryId;
							for(var j = 0; j<lotterys.length; j++){
								if(odd.lotteryId == lotterys[j].id) {
									odd.win =  lotterys[j].win;
									odd.capital = lotterys[j].capital;
									odd.lotteryTime = lotterys[j].iMillis;
								}
							}
							odd.ballType = games[odds[odds1[i].oddsId.gameId].gameNum].ballType;
							odd.gameTime = games[odds[odds1[i].oddsId.gameId].gameNum].date;
							odd.teamHome = games[odds[odds1[i].oddsId.gameId].gameNum].teamHome.teamName;
							odd.teamAway = games[odds[odds1[i].oddsId.gameId].gameNum].teamAway.teamName;
							odd.scoreHome = games[odds[odds1[i].oddsId.gameId].gameNum].gameScoreHome;
							odd.scoreAway = games[odds[odds1[i].oddsId.gameId].gameNum].gameScoreAway;
							odd.count = odds1[i].oddsId.count;
							odd.value = odds1[i].oddsId.oddValue;
							odd.isPass = odds1[i].oddsId.isPass;
							switch(odds1[i].oddsId.oddType) {
						    case 'SU_A':
						    	odd.labelText = games[odds[odds1[i].oddsId.gameId].gameNum].teamAway.teamName;
						    	break;
						    case 'SU_H':
						    	odd.labelText = games[odds[odds1[i].oddsId.gameId].gameNum].teamHome.teamName;
								break;
						    case 'ATS_A':
						    	odd.labelText = games[odds[odds1[i].oddsId.gameId].gameNum].teamAway.teamName;
						    	break;
						    case 'ATS_H':
						    	odd.labelText = games[odds[odds1[i].oddsId.gameId].gameNum].teamHome.teamName;
						    	break;
						    case 'SC_H':
						    	odd.labelText = "總分合大於";
						    	break;
						    case 'SC_L':
						    	odd.labelText = "總分合小於";
						    	break;
						    case 'ODD':
						    	odd.labelText = "總分合為單數";
						    	break;
						    case 'EVEN':
						    	odd.labelText = "總分合為偶數";
						    	break;
						    default:
						    	break;
							}
							odds2.push(odd);
						}
						/*
						for(var k = 0; k<datas.length; k++){
							if(odds2[1].lotteryId == datas[k].id){
								datas.push(odds2);
							}
						}
						*/
						console.log('-----Odds2(第二層)-----');
						console.log(odds2);
						
						console.log(datas);
						//$('.details-control').click(function() {
						//	$('#dialog').modal();
						//});
						//塞第一層資料
					table = $('#oddTable').dataTable({
						'data': odds2,
						
				        'columns': [
				        		{
				        		'class':'details-control',
				        		'orderable':false,
				        		'data':null,
				        		'defaultContent': ''
				        		},
				        		{"data": "lotteryId"},
				        		{"data":  function(row, type, val, meta){
				        			timeString = "";
									timeString += millisecondToDate(row.lotteryTime);
									timeString += " ";
									timeString += millisecondToTime(row.lotteryTime);
									return timeString;
				        		}},
				        		{"data": "capital" },
				        		{"data": "win" },
				        		{"data": null },
				        ],
				        
				        "order": [[2, 'asc']]
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
						
					});//game
				}//success
			});//ajax
			
			$(window).unbind('formatDataRow');
			function formatDataRow (dataRow) {
				
				return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
		        '<tr>'+
		            '<td>gameNum:</td>'+
		            '<td>' + dataRow.ballType+ '</td>'+
		        '</tr>'+
		        '<tr>'+
		            '<td>Extra info:</td>'+
		            '<td>And any further details here (images etc)...</td>'+
		        '</tr>'+
		    	'</table>';
		    	
				return "";
			}
		}
		renewData();
	})(jQuery);
</script>
</body>
</html>