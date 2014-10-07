<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="joda" uri="http://www.joda.org/joda/time/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/bootstrap-dialog.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/jquery.shapeshift.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script src="<c:url value="/js/jquery.sidr.min.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.zh-TW.js"/>"></script>
<script src="<c:url value="/js/jquery.jdigiclock.js"/>"></script>
<script src="<c:url value="/js/jquery.shapeshift.min.js"/>"></script>
<script src="<c:url value="/js/jquery-dateFormat.min.js"/>"></script>
<script src="<c:url value="/js/jquery.jsort.0.4.min.js"/>"></script>
<script src="<c:url value="/js/jasny-bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.fileDownload.js"/>"></script>
<script src="<c:url value="/js/highcharts_zh.js"/>"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-theme.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-dialog.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">    
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
<link rel="stylesheet" href="<c:url value="/css/sophia.css"/>"> 
<link rel="stylesheet" href="<c:url value="/css/datepicker.css"/>"> 
<link rel="stylesheet" href="<c:url value="/css/coins.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.jdigiclock.css"/>">
<link rel="stylesheet" href="<c:url value="/css/sportslottery.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jasny-bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/business-frontpage.css"/>">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<title>全民瘋運彩-Sports Lottery Mania</title>
<style>
	.titleBox{
		float: left;
		text-align: center;
	}
	.title{
		font-family: "標楷體", "Microsoft JhengHei" !important;
		font-weight: 900;
	}
	.subtitle{
		font-family: Meiryo, "Microsoft JhengHei" !important;
	}
	.business-header{
		position:relative;
	}
	.titleFooter{
		font-family: "標楷體", "Microsoft JhengHei" !important;
		color: white;
		margin: 0px 20px;
		position:absolute;
		bottom:0px;
		right:0px;
	}
	.goIndex{
		position:absolute;
		bottom:0px;
		left:50%;
		margin:-20px -20px 40px -80px;
	}
	
	.chart{
		width: 300px;
		height: 300px;
		margin: auto;
	}
	
	#hotGames{
		text-align: center;
		font-family: Meiryo, "Microsoft JhengHei" !important;
	}
	
	.board footer{
		margin: 0px 10px;
	}
	.board p{
		margin: 5px 10px;
	}
	
	.sample{
		display: none;
	}
	
	blockquote{
		padding: 1px 20px;
	}
	blockquote.warning{
	    border-color: #f0ad4e;
	}
	blockquote.info{
	    border-color: #5bc0de;
	}
	blockquote.danger{
	    border-color: #d9534f;
	}
	
	.announcement{
		cursor: pointer;
	}
	.announcement *{
		transition: all 220ms ease;
	}
	.announcement:HOVER{
		background: rgba(255,255,255,0.6);
	}
	.announcement .detial{
		height: 0px;
		opacity: 0;
		visibility: hidden;
	}
	.announcement .detial.active{
		height: auto;
		opacity: 1;
		visibility: visible;
	}
	
	.business-header{
		background: url('<c:url value="/images/Des.png"/>') center center no-repeat scroll;
	}
	
</style>
</head>
<body>
    <!-- Image Background Page Header -->
    <!-- Note: The background image is set within the business-casual.css file. -->
    <header class="business-header">
        <div class="container">
            <div class="row header">
                <div class="col-lg-12">
                	<div class="titleBox">
                		<h1 class="tagline title">全民瘋運彩</h1>
                    	<h5 class="tagline subtitle">-Sports Lottery Mania-</h5>'
                	</div>
                </div>
            </div>
        </div>
        <h3 class="titleFooter">九大行星都已連成一線 投注的時機來臨了!</h3>
        <button class="goIndex btn btn-lg btn-default">&lt;&lt;投注去&gt;&gt;</button>
    </header>

    <!-- Page Content -->
    <div class="container">

        <hr>

        <div class="row">
			<div class="col-sm-8">
            	<h2>近期公告</h2>
            	<blockquote class="board sample info">
	                <h3 style="margin:5px;">公告標題#0</h3>
	                <div class="detial">
		                <p>公告內容#0</p>
	            	</div>
	            	<footer>公告時間#0</footer>
				</blockquote>
				<div id="boardBox">
				</div>
            </div>
            
            <div class="col-sm-4">
                <h2>聯絡我們</h2>
                <address>
                    <strong>Sports Lottery Mania</strong>
                    <br>台北市大安區
                    <br>信義路三段153號
                    <br>
                </address>
                <address>
                    <abbr title="Phone">P:</abbr>(00) 334-5678
                    <br>
                    <abbr title="Email">E:</abbr> <a href="mailto:#">sportslott123@gmail.com</a>
                </address>
            </div>
        </div>
        <!-- /.row -->

        <hr>

		<div class="row">
			<div class="btn-group col-sm-8">
        		<h2 style="text-align: left">熱門投注賽事</h2>
        	</div>
        	<div class="btn-group col-sm-4" id="ballType" data-toggle="buttons" style="margin:15px 0px 6px 0px;">
				<label class="btn btn-default active">
					<input type="radio" ballType="hotBaseballGames" id="option1" checked> 棒球
				</label>
				<label class="btn btn-default">
					<input type="radio" ballType="hotBasketballGames" id="option2"> 籃球
				</label>
				<label class="btn btn-default">
					<input type="radio" ballType="hotSoccerGames" id="option3"> 足球
				</label>
			</div>
		</div>

        <div class="row" id="hotGames">
            <div class="col-sm-4 chartBox" id="hotGame1">
                <h3>球隊資訊 #1</h3>
                <div class="chart"></div>
                <p>賠率資訊 #1</p>
            </div>
            <div class="col-sm-4 chartBox" id="hotGame2">
            	<h3>球隊資訊 #2</h3>
                <div class="chart"></div>
                <p>賠率資訊 #2</p>
            </div>
            <div class="col-sm-4 chartBox" id="hotGame3">
                <h3>球隊資訊 #3</h3>
                <div class="chart"></div>
                <p>賠率資訊 #3</p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; 2014 <a href="#">CECJ05 Team 01 </a>All Rights Reserved.</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->
 <script>
	$('.btn').button();
	//--公告處理--
	function announceLoad(){
		var todayMil = new Date().valueOf() - new Date().getTimezoneOffset()*60000;
		var threeAgoMil = (new Date().setDate(new Date().getDate()-3)).valueOf() - new Date().getTimezoneOffset()*60000;
		
		console.log(todayMil);
		console.log(threeAgoMil);
		
		$('#boardBox *').remove();
		$.ajax({
			url: '<c:url value="/announceFive" />',
			type:'post',
			dataType:'json',
			success:function(datas){
				console.log(datas);
				$.each(datas, function(index, data){
					var thisBoard = $('blockquote.board.sample').clone();
					thisBoard.removeClass('sample');
					thisBoard.addClass('announcement');
					
					$('h3', thisBoard).text(data.announceTitle);
					$('.detial p', thisBoard).text(data.announceContent);
					$('footer', thisBoard).text(millisecondToDate(data.modifiedTime.iLocalMillis));
					
					console.log(data.modifiedTime.iLocalMillis);

					if(data.modifiedTime.iLocalMillis > todayMil){
						thisBoard.removeClass('info');
						thisBoard.addClass('danger');
					} else if(data.modifiedTime.iLocalMillis > threeAgoMil){
						thisBoard.removeClass('info');
						thisBoard.addClass('warning');
					}

					//展開公告的情況
					thisBoard.on('click', function(){
						if($('.detial', thisBoard).hasClass('active')){
							$('.detial', thisBoard).removeClass('active');
						}else{
							$('.detial', thisBoard).addClass('active');
						}
					});
					
					$('#boardBox').append(thisBoard);
				});
				
			}
		});
	}
	announceLoad();
	
	//--熱門賽事處理--
	$('#ballType input').on('change', function(){
		changeBalltype($(this).attr('ballType'));
	});
	
	var charts;
	function changeBalltype(ballType){
		$.ajax({
			url: '<c:url value="/game?method:getHotGames" />',
			type:'post',
			dataType:'json',
			data:{
				'complexBallType':ballType,
			},
			success:function(datas){
				console.log(datas);
				try {
				$('div.chartBox:eq(0) .chart').highcharts().destroy();
				} catch (e) {
				}
				try {
					$('div.chartBox:eq(1) .chart').highcharts().destroy();
				} catch (e) {
				}
				try {
					$('div.chartBox:eq(2) .chart').highcharts().destroy();
				} catch (e) {
				}
				$('div.chartBox .chart').removeAttr('data-highcharts-chart');
				$('div.chartBox h3').text('');
				$('div.chartBox p').text('');
				$.each($('div.chartBox .chart'), function(index, chart){
					if(datas[index] && datas[index].countTotal != 0){
						var sortedOdds = sortGameOdds(datas[index].odds);
						var data = [
									[datas[index].teamAway.teamName + '(不讓分)', sortedOdds['SU_A'].count],
									[datas[index].teamHome.teamName + '(不讓分)', sortedOdds['SU_H'].count],
									[datas[index].teamAway.teamName + '(讓分)', sortedOdds['ATS_A'].count],
									[datas[index].teamHome.teamName + '(讓分)', sortedOdds['ATS_H'].count],
									['總分合(大)', sortedOdds['SC_H'].count],
									['總分合(小)', sortedOdds['SC_L'].count],
									['總分(單)', sortedOdds['ODD'].count],
									['總分(雙)', sortedOdds['EVEN'].count]
 					    ];
						highChatFn('總投注次數<br/>' + datas[index].countTotal + '注', $(chart), data);
						$('div.chartBox:eq(' + index + ') h3').text(datas[index].teamAway.teamName + ' vs ' + datas[index].teamHome.teamName );
						$('div.chartBox:eq(' + index + ') p').html(
								'<table class="table table-hover " style="text-align: left;background: none;"><tr><td><strong style="color:#000000">■</strong></td><td><strong>比賽日期：</strong></td><td colspan="2">' + millisecondToDate(datas[index].gameTime.iLocalMillis) + ' ' + millisecondToTime(datas[index].gameTime.iLocalMillis) + '</td></tr>' +
								'<tr><td><strong style="color:#008500">■</strong></td><td><strong>讓分賠率：</strong></td><td>客隊(<strong>' + sortedOdds['SU_A'].oddValue +'</strong>)</td><td>主隊(<strong>' + sortedOdds['SU_H'].oddValue + '</strong>)</td>' + '</tr>' +
								'<tr><td><strong style="color:#08356D">■</strong></td><td><strong>不讓分賠率：</strong></td><td>客隊(<strong>' + sortedOdds['ATS_A'].oddValue +'</strong>)</td><td>主隊(<strong>' + sortedOdds['ATS_H'].oddValue + '</strong>)</td>' + '</tr>' +
								'<tr><td><strong style="color:#A66700">■</strong></td><td><strong>總和大小賠率：</strong></td><td>大隊(<strong>' + sortedOdds['SC_H'].oddValue +'</strong>)</td><td>小隊(<strong>' + sortedOdds['SC_L'].oddValue + '</strong>)</td>' + '</tr>' +
								'<tr><td><strong style="color:#A60000">■</strong></td><td><strong >總和單雙賠率：</strong></td><td>單數(<strong>' + sortedOdds['ODD'].oddValue +'</strong>)</td><td>雙數(<strong>' + sortedOdds['EVEN'].oddValue + '</strong>)</td>' + '</tr><table>'
								);
					} else {
						highChatFn('抱歉，暫無資料', $(chart), null);
					}
				});

				
				
			}
		});
	}

	function highChatFn(title, target, data){
		target.highcharts({
 	        chart: {
 	            plotBackgroundColor: null,
 	            plotBorderWidth: 0,
 	            plotShadow: true,
 	        	backgroundColor: 'none',
 	        	height: 300,
 	        	width: 300,
 	        	style: { margin: '0px auto'}
 	        },
 	        title: {
 	            text: title,
 	            align: 'center',
 	            verticalAlign: 'middle',
 	            y: 0
 	        },
 	        tooltip: {
 	            pointFormat: '{series.name}: <b>{point.y}注</b>'
 	        },
 	        plotOptions: {
 	            pie: {
 	            	colors: [
 	            	        '#3FC63F', '#8CE08C',
 	            	       	'#3D6AA2', '#84A2C9',
 	            	     	'#F7B74F', '#FFDA9F',
 	            	   		'#F74F4F', '#FF9F9F',],
 	                dataLabels: {
 	                    enabled: false,
 	                    distance: 50,
 	                    style: {
 	                        fontWeight: 'bold',
 	                        color: 'black',
 	                        textShadow: '0px 0px 3px white'
 	                    }
 	                },
 	                startAngle: 0,
 	                endAngle: 360,
 	                center: ['50%', '50%'],
 	             	showInLegendL: true,
 	            }
 	        },
 	        series: [{
 	            type: 'pie',
 	            name: '投注比率',
 	            innerSize: '50%',
 	            data: data
 	        }]
 	    });
	}
	
	changeBalltype("hotBaseballGames");
	
	$('.goIndex').on('click', function(){
		sessionStorage.visited = "true";
		window.location.href = '<c:url value="/"/>';
	});
 </script>   
 
</body>
</html>