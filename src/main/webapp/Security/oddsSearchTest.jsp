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
                        <input type="text" class="form-control form-game-time" id="timeBegin" placeholder="下注時間" value="" >
                        <input type="text" class="form-control form-game-time" id="timeEnd" placeholder="下注時間" value="" >
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
	                            </tr>
							</thead>
							<tbody id="oddList">
							</tbody>
						<!-- <tfoot>
								<tr>
									<th></th>
									<th>賽事編號</th>
									<th>比賽日期</th>
									<th>客隊隊伍</th>
									<th>主隊隊伍</th>
									<th>投注比</th>
									<th>已結束</th>
	                            </tr>
							</tfoot>   -->
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
	
		var table;
		function renewData(){
		
			$.ajax({
				url:'<c:url value="/userSearchOdds?method:selectByUser" />',
				type:'post',
				dataType:'json',
				data:{
					'complexTimeBegin':$('#timeBegin').val(),
					'complexTimeEnd':$('#timeEnd').val(),
					'complexBallType':$('#ballType').val(),
				},
				success:function(datas){
					if(table){
						$('#oddList').off('click');
						$('#oddTable').DataTable().rows().remove();
						$('#oddTable').DataTable().destroy();
					}
				
					console.log(datas);
					var lotterys = [];
					$.each(datas,function(index,data) {
						var lottery = new Object();
						//每筆彩券
						console.log(data);
						lottery.id = data.id;
						//下注時間
						lottery.iMillis = data.confirmTime.iLocalMillis;
						lottery.date = millisecondToDate(lottery.iMillis); //下注日期
						lottery.time = millisecondToTime(lottery.iMillis); //下注時間
						//金額獎金
						lottery.win = data.win;
						lottery.capital = data.capital;
						//每注資料
						lottery.odds1 = data.oddsId1;
						lottery.odds2 = data.oddsId2;
						lottery.odds3 = data.oddsId3;
						lottery.odds4 = data.oddsId4;
						lottery.odds5 = data.oddsId5;
						lottery.odds6 = data.oddsId6;
						lottery.odds7 = data.oddsId7;
						lottery.odds8 = data.oddsId8;
						//彩券以id編號
						lotterys.push(lottery);
					});
					console.log(lotterys);
					table = $('#oddTable').dataTable({
						'data': lotterys,
						
				        'columns': [
				        		{
				        		'class':'details-control',
				        		'orderable':false,
				        		'data':null,
				        		'defaultContent': ''
				        		},
				        		{"data": "id"},
				        		{"data": "date"},
				        		{"data": "capital" },
				        		{"data": "win" },
				        ],
				        
				        "order": [[2, 'asc']]
					});

				}
			});
		}
		renewData();
	})(jQuery);
</script>
</body>
</html>