<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="<c:url value="/css/sophia.css"/>"> 
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<!-- <script src="http://code.highcharts.com/highcharts.js"></script> -->
<script src="<c:url value="/js/highcharts.js"/>"></script>
<script src="http://code.highcharts.com/modules/data.js"></script>
<script src="http://code.highcharts.com/modules/drilldown.js"></script>

<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script>
$(document).ready(function(){
	$('body').hide().fadeIn(3000);
});
</script>
</head>
<body>

	<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
	
	<!-- Data from www.netmarketshare.com. Select Browsers => Desktop share by version. Download as tsv. -->
	
	 <div id="tsv" style="display:none"></div>  
	 <!-- <div id="tsv"></div> -->
	<br><br>
<!-- 	<div >
		<label>購買推薦: <span id="suggestion">t</span> </label>
		<p>(推薦方式以歷史中最高的過關比為主)</p>
	</div> -->
	<br><br>
<!-- 	<div id="selectInput" >
		<button type="button" class="button" id="oddType" >以投注類型來看</button>
		<button type="button" class="button" id="Count" >以購買數來看</button>
		<button type="button" class="button" id="Count" >以過關比率來看</button>
		<button type="button" class="button" id="money">以金額來看</button>
		<button type="button" class="button" id="money">比分統計</button>
	</div>  -->
	<div id="modalBox" class="modal fade" tabindex="-1" role="dialog" aria-hidden="true">
  		<div class="modal-dialog modal-sm">
    		<div class="modal-content">
    			
    			<div class="modal-body">
    				<div id="searchMessage">
    				</div>
    			</div>
    		
    			<div class="modal-footer">
        			<button type="button" class="btn btn-default" data-dismiss="modal">OK</button>
      			</div>
      			
    		</div>
 		</div>
	</div>
<script src="<c:url value="/js/misc.js"/>"></script>
<script>
$(function () {
	var teamNameHome=[], teamNameAway=[];
	
	appendToDiv(); 
	$(document).ajaxStop(function() {//確認appendToDiv()先執行完，才執行 mainFunction()
		mainFunction();
	});
	
	
	function appendToDiv(){
		/* test1();  */
		// test2();  
		 final1();  
		 //final2(); 
		/*  test4();  */
		// test5(); 
		
	}

	function test1(){
	 	var child='';
		child += '過關	歷史\n'; 

		child += '2014-08-19 1';
		child +='\t';
		child +='24.21%';
		child +='\n';
		child += '2014-08-19 1	8.05%\n';
		
		$('#tsv').append(child); 
		

	}
	function test2(){
		var url = '<c:url value="/countInfoGraph"/>';
			
		 $.getJSON(url, function(data) { //透過countInfoGraph取回的Json型式的值
			 /* console.log(data); */
				$.each(data, function(key, value) {
					//console.log(value['ATS_A']);
					var time=value['ATS_A'].gameTime.iLocalMillis;
					console.log(millisecondToDate(time)+millisecondToTime(time));
					console.log(value['ATS_H'].percentage);
					console.log(value['SU_A'].percentage);
					console.log(value['SU_H'].percentage);
					console.log(value['SC_H'].percentage);
					console.log(value['SC_L'].percentage);
					console.log(value['ODD'].percentage);
					console.log(value['EVEN'].percentage);
					console.log('\n');
				});
			});
	}
	function final1(){
		var url = '<c:url value="/countInfoGraph"/>';
		var i=0; //比賽的紀錄出現順序，主要用於抓取比賽的teamNameAway, teamNameHome
		var child='';	
		child += '過關	歷史\n'; 
		$('#searchMessage').text('取得 "'+'${linkTeamSearch}'+'"選取比賽之前的投注統計');
		$('#modalBox').modal('show');
		//alert('搜尋 "'+'${linkTeamSearch}'+'"比賽投注統計');
 		 $.post(url, {
 			'linkGameNum':'${linkGameNum}',
 			'linkTeamSearch':'${linkTeamSearch}'
 		 },function(data) { //用POST透過countInfoGraph取回的Json型式的值
 			 
 			
 			 console.log(data);
				$.each(data, function(key, value) { 
					
 					var type=value['ATS_A'];
 					teamNameAway[i] = type.teamNameAway;//取得teamNameAway和teamNameHome, 將在mainFunction()使用
		 			teamNameHome[i] = type.teamNameHome;
 					console.log(i+' AAAway : '+teamNameAway[i]);
 					//console.log(i+' Home : '+teamNameHome[i]);
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis); 
					var percent=type.percentage;
					child += time+' '+'4'+'\t'+percent*100+'%'+'\n';
	
 					var type=value['ATS_H'];
 					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'3'+'\t'+percent*100+'%'+'\n';
					
 					var type=value['SU_A'];
 					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis); 
					var percent=type.percentage;
					child += time+' '+'2'+'\t'+percent*100+'%'+'\n';
					
					var type=value['SU_H'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'1'+'\t'+percent*100+'%'+'\n';
					
					var type=value['SC_H'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'5'+'\t'+percent*100+'%'+'\n';
					
					var type=value['SC_L'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'6'+'\t'+percent*100+'%'+'\n';
					
					var type=value['ODD'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'7'+'\t'+percent*100+'%'+'\n';
					
					var type=value['EVEN'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'8'+'\t'+percent*100+'%'+'\n';
					
					i +=8;
 				 });  
				$('#tsv').append(child);
			  },'json');  
		 /* console.log(child); */
		  
	}
	
	function final2(){
		var url = '<c:url value="/countAllHistoryByTeam"/>';
		var i=0; //比賽的紀錄出現順序，主要用於抓取比賽的teamNameAway, teamNameHome
		var child='';	
		child += '過關	歷史\n'; 
		$('#searchMessage').text('正在搜尋 "'+'${linkTeamSearch}'+'"比賽投注統計');
		$('#modalBox').modal('show');
		//alert('搜尋 "'+'${linkTeamSearch}'+'"比賽投注統計');
 		 $.post(url, {
 			'linkTeamSearch':'${linkTeamSearch}'
 		 },function(data) { //用POST透過countInfoGraph取回的Json型式的值
 			 
 			
 			 console.log(data);
				$.each(data, function(key, value) { 
					
 					var type=value['ATS_A'];
 					teamNameAway[i] = type.teamNameAway;//取得teamNameAway和teamNameHome, 將在mainFunction()使用
		 			teamNameHome[i] = type.teamNameHome;
 					console.log(i+' AAAway : '+teamNameAway[i]);
 					//console.log(i+' Home : '+teamNameHome[i]);
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis); 
					var percent=type.percentage;
					child += time+' '+'4'+'\t'+percent*100+'%'+'\n';
	
 					var type=value['ATS_H'];
 					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'3'+'\t'+percent*100+'%'+'\n';
					
 					var type=value['SU_A'];
 					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis); 
					var percent=type.percentage;
					child += time+' '+'2'+'\t'+percent*100+'%'+'\n';
					
					var type=value['SU_H'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'1'+'\t'+percent*100+'%'+'\n';
					
					var type=value['SC_H'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'5'+'\t'+percent*100+'%'+'\n';
					
					var type=value['SC_L'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'6'+'\t'+percent*100+'%'+'\n';
					
					var type=value['ODD'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'7'+'\t'+percent*100+'%'+'\n';
					
					var type=value['EVEN'];
					var time=millisecondToDate(type.gameTime.iLocalMillis)+millisecondToTime(type.gameTime.iLocalMillis);
					var percent=type.percentage;
					child += time+' '+'8'+'\t'+percent*100+'%'+'\n';
					
					i +=8;
 				 });  
				$('#tsv').append(child);
			  },'json');  
		 /* console.log(child); */
		  
	}
	
	function test4(){
	 	var child='';
		child += '過關	歷史\n'; 
		child += '2014年08月22日08:05(五)'+' '+'1'+'\t'+'64.21'+'%'+'\n';
		child += '2014年08月22日08:05(五)'+' '+'2'+'\t'+'8.05'+'%'+'\n';	
		$('#tsv').append(child); 
	}
	function test5(){
		var url = '<c:url value="/countInfoGraph"/>';
		var child='';	
		
		var i=1;
		child += '過關	歷史\n'; 
  		 $.post(url, function(data) { //透過countInfoGraph取回的Json型式的值
  			
				// $.each(data, function(key, value) {  
					console.log('inside'+i); 
					child += '2014年08月22日08:05(五)'+' '+'1'+'\t'+'64.21'+'%'+'\n';
					child += '2014年08月22日08:05(五)'+' '+'2'+'\t'+'8.05'+'%'+'\n';	
  				 	i++;
				//});  
				
				console.log(child);
	  			$('#tsv').append(child);
		}, 'json');
	}



	function mainFunction(){
		var col = [];
		col[0] = [];
		col[1] = [];
		$.each($('#tsv').text().split('\n'), function(index, row){//取出#tsv下的text資料，並以\n取成row陣列
			/* console.log(row); */
			coldata = row.split('\t');
			if(coldata[0]){
				col[0].push(coldata[0]);
				col[1].push(coldata[1]);
			}
		});
		
	    Highcharts.data({
	        csv: document.getElementById('tsv').innerHTML,
	        itemDelimiter: '\t',
	        parsed: function (columns) {

	            var brands = {},
	                brandsData = [],
	                versions = {},
	                drilldownSeries = [];

	            // Parse percentage strings
	            columns[1] = $.map(columns[1], function (value) {
	                if (value.indexOf('%') === value.length - 1) {
	                    value = parseFloat(value);
	                }
	                return value;
	            });
				
	            var j=0; //用來取teamNameAway, teamNameHome
	            var awayName, homeName;
	            $.each(col[0], function (i, name) {
	                var brand,
	                    version;
	                if(j%8==0){//確認能取到TEAM的值 每八個數字一數
	                	awayName= teamNameAway[j];
		                homeName= teamNameHome[j];
	                	
	                }
	                
					console.log(name);
	                if (i > 0) {

	                    // Remove special edition notes

	                   // name = name.split(' -')[0];

	                    //console.log(name);

	                    // Split into brand and version
	                    version = name.match(/( [0-9])/);
	                    if (version) {
	                        version = version[0];
	                    }
	                    brand = name.replace(version, '');

	                    // Create the main data
	                    if (!brands[brand]) {
	                        brands[brand] = columns[1][i];
	                    } else {
	                        brands[brand] += columns[1][i];
	                    }
	                    console.log(j+": "+homeName);
	                    console.log(j+": "+awayName);
		
	                    // Create the version data
	                    if (version !== null) {
	                        if (!versions[brand]) {
	                            versions[brand] = [];
	                        }
	                        if(version == 1){
	                        	versions[brand].push(['主隊不讓分<br>('+homeName+')', columns[1][i]]);
	                        }else if(version == 2){
	                        	versions[brand].push(['客隊不讓分<br>('+awayName+')', columns[1][i]]);
	                        	//console.log(i+' Away : '+awayName);
	                        }else if(version == 3){
	                        	versions[brand].push(['主隊讓分<br>('+homeName+')', columns[1][i]]);
	                        }else if(version == 4){
	                        	versions[brand].push(['客隊讓分<br>('+awayName+')', columns[1][i]]);
	                        	//console.log(i+' Away : '+awayName);
	                        }else if(version == 5){
	                        	versions[brand].push(['高於總和', columns[1][i]]);
	                        }else if(version == 6){
	                        	versions[brand].push(['低於總和', columns[1][i]]);
	                        }else if(version == 7){
	                        	versions[brand].push(['總分奇數', columns[1][i]]);
	                        }else if(version == 8){
	                        	versions[brand].push(['總分偶數', columns[1][i]]);
	                        }
	                       
	                    }
	                    j++;
	                }

	            });

	            $.each(brands, function (name, y) {
	                brandsData.push({
	                    name: name,
	                    y: y,
	                    drilldown: versions[name] ? name : null
	                });
	            });
	            $.each(versions, function (key, value) {
	                drilldownSeries.push({
	                    name: key,
	                    id: key,
	                    data: value
	                });
	            });

	            	// Create the chart
	            	$('#container').highcharts({
	                	chart: {
	                    	type: 'column'
	                	},
	                	title: {
	                    	text: '有賺到錢的投注統計, 2014'
	                	},
	                	subtitle: {
	                    	text: '過關的數目除以當場投注總數, 點擊長柱見投注細節'
	                	},
	                	xAxis: {
	                    	type: 'category'
	                	},
	                	yAxis: {
	                    	title: {
	                        	text: '過關數比例'
	                    	}
	                	},
	                	legend: {
	                    	enabled: false
	                	},
	                	plotOptions: {
	                    	series: {
	                        	borderWidth: 0,
	                        	dataLabels: {
	                            	enabled: true,
	                            	format: '{point.y:.1f}%'
	                        	}
	                    	}
	                	},

	                	tooltip: {
	                    	headerFormat: '<span style="font-size:11px">{series.name}</span><br>',
	                    	pointFormat: '<span style="color:{point.color}">{point.name}</span>: <b>{point.y:.2f}%</b> of total<br/>'
	                	},

	                	series: [{
	                    	name: '總和',
	                    	colorByPoint: true,
	                    	data: brandsData
	                	}],
	                	drilldown: {
	                    series: drilldownSeries
	                	}
	            	});//$('#container').highcharts
	        	}
	    	});//Highcharts.data
		
		}//function mainFunction()

	});

</script>

	
	
<div class="alert alert-danger" role="alert">最熱門的單場投注是..........</div>




<button type="button" class="btn btn-default btn-lg" onclick="goBack()" >
 		<span class="glyphicon glyphicon-backward"></span> Back
</button>

<script>
	 function goBack() {
	     window.history.back()
	 }
</script>

</body>
</html>