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
	.chart{
		width: 300px;
		height: 300px;
	}
	
	#hotGames{
		text-align: center;
		font-family: Meiryo, "Microsoft JhengHei" !important;
	}
</style>
</head>
<body>
    <!-- Image Background Page Header -->
    <!-- Note: The background image is set within the business-casual.css file. -->
    <header class="business-header">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                	<div class="titleBox">
                		<h1 class="tagline title">全民瘋運彩</h1>
                    	<h5 class="tagline subtitle">-Sports Lottery Maina-</h5>
                	</div>
                </div>
            </div>
        </div>
    </header>

    <!-- Page Content -->
    <div class="container">

        <hr>

        <div class="row">
            <div class="col-sm-8">
                <h2>近期公告</h2>
                <p>Introduce the visitor to the business using clear, informative text. Use well-targeted keywords within your sentences to make sure search engines can find the business.</p>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et molestiae similique eligendi reiciendis sunt distinctio odit? Quia, neque, ipsa, adipisci quisquam ullam deserunt accusantium illo iste exercitationem nemo voluptates asperiores.</p>
                <p>
                    <a class="btn btn-default btn-lg" href="#">Call to Action &raquo;</a>
                </p>
            </div>
            <div class="col-sm-4">
                <h2>Contact Us</h2>
                <address>
                    <strong>Start Bootstrap</strong>
                    <br>3481 Melrose Place
                    <br>Beverly Hills, CA 90210
                    <br>
                </address>
                <address>
                    <abbr title="Phone">P:</abbr>(123) 456-7890
                    <br>
                    <abbr title="Email">E:</abbr> <a href="mailto:#">name@example.com</a>
                </address>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <div class="row" id="hotGames">
        	<div class="btn-group col-sm-12" id="ballType" data-toggle="buttons">
				<label class="btn btn-primary active">
					<input type="radio" ballType="hotBaseballGames" id="option1" checked> 棒球
				</label>
				<label class="btn btn-primary">
					<input type="radio" ballType="hotBasketballGames" id="option2"> 籃球
				</label>
				<label class="btn btn-primary">
					<input type="radio" ballType="hotSoccerGames" id="option3"> 足球
				</label>
			</div>
            <div class="col-sm-4 chartBox" id="hotGame1">
                <div class="chart"></div>
                <h2>Marketing Box #1</h2>
                <p>These marketing boxes are a great place to put some information. These can contain summaries of what the company does, promotional information, or anything else that is relevant to the company. These will usually be below-the-fold.</p>
            </div>
            <div class="col-sm-4 chartBox" id="hotGame2">
                <div class="chart"></div>
                <h2>Marketing Box #2</h2>
                <p>The images are set to be circular and responsive. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
            </div>
            <div class="col-sm-4 chartBox" id="hotGame3">
                <div class="chart"></div>
                <h2>Marketing Box #3</h2>
                <p>Donec id elit non mi porta gravida at eget metus. Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus. Etiam porta sem malesuada magna mollis euismod. Donec sed odio dui.</p>
            </div>
        </div>
        <!-- /.row -->

        <hr>

        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Your Website 2014</p>
                </div>
            </div>
            <!-- /.row -->
        </footer>

    </div>
    <!-- /.container -->
 <script>
	$('.btn').button();
	
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
				$('div.chartBox h2').text('');
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
						highChatFn('總投注數<br/>' + datas[index].countTotal + '人次', $(chart), data);
						$('div.chartBox:eq(' + index + ') h2').text(datas[index].teamAway.teamName + ' vs ' + datas[index].teamHome.teamName );
						$('div.chartBox:eq(' + index + ') p').html(
								'<strong>比賽日期：</strong>' + millisecondToDate(datas[index].gameTime.iLocalMillis) + ' ' + millisecondToTime(datas[index].gameTime.iLocalMillis) + '<br>' +
								'<strong>讓分賠率：</strong>客隊(' + sortedOdds['SU_A'].oddValue +')主隊(' + sortedOdds['SU_H'].oddValue + ')' + '<br>' +
								'<strong>不讓分賠率：</strong>客隊(' + sortedOdds['ATS_A'].oddValue +') 主隊(' + sortedOdds['ATS_H'].oddValue + ')' + '<br>' +
								'<strong>總和大小賠率：</strong>大隊(' + sortedOdds['SC_H'].oddValue +') 小隊(' + sortedOdds['SC_L'].oddValue + ')' + '<br>' +
								'<strong>總和單雙賠率：</strong>單隊(' + sortedOdds['ODD'].oddValue +') 雙隊(' + sortedOdds['EVEN'].oddValue + ')'
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
 	        	weigth: 300,
 	        },
 	        title: {
 	            text: title,
 	            align: 'center',
 	            verticalAlign: 'middle',
 	            y: 0
 	        },
 	        tooltip: {
 	            pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
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
 </script>   
 
</body>
</html>