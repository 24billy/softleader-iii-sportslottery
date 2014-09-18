<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<title>運動彩卷</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

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
<script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.zh-TW.js"/>"></script>




<!--sidepanel  -->  
<script type="text/javascript" src="js/jquery.slidepanel.js"></script>
<script type="text/javascript" src="js/jquery.sidr.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/jquery.slidepanel.css">
<link rel="stylesheet" type="text/css" href="css/jquery.sidr.light.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">

<link rel="stylesheet" href="<c:url value="css/jquery.sidr.light.css"/>">


<link rel="stylesheet" href="<c:url value="/css/jquery.sidr.light.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
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

<style>
		@import url(http://fonts.googleapis.com/css?family=Oswald);

</style>

<script>

</script>
</head>
<body>

<!-- page start -->
<div>
    <div class="page-wraper">
        <!-- TopPage start -->
        <div >
            <jsp:include page="topPage.jsp" />
        </div>        
        <!-- TopPage end --> 
        <!-- content start -->
	    <div  id="target" style="padding-top:120px;">	
		  <jsp:include page="/Event/test-events.jsp" />
	    </div>
        <!-- content end --> 
    </div>
</div>
<!-- page end -->


  <script type="text/javascript">

    $(document).ready(function(){
    	  $('.simple-menu').sidr();
    });

  	$('.game').click(function() {		  		
  		$("#target").load('<c:url value="/Event/test-events.jsp"/>');  		
 	});
	$('.history').click(function() {
		$("#target").load('<c:url value="/History/historyComplex.jsp"/>');
	});
	$('.user').click(function() {
		$("#target").load('<c:url value="/Security/userOddsSearch.jsp"/>');
	});
	$('.lotteryBoard').click(function() {
		odds_refresh();
	});
</script>



<div id="sidr">
  <!-- lottery content -->
<!--start lottery panel  -->
        <div class="panel panel-primary  ">
            <div class="panel-heading ">
                <h4>投注區</h4>
            </div>
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" id="myTab">
                <li class="active"><a href="#single" role="tab"
                    data-toggle="tab">單場</a></li>
                <li><a href="#pass" role="tab" data-toggle="tab">過關</a></li>
                <li><a href="#passCom" role="tab" data-toggle="tab">過關組合</a></li>
            </ul>
            <!-- Tab panes -->
            <table class="table table-striped  table-hover">
                <tr>
                    <td id="lottery1" hidden="true" name="oddList">
                        <div>編號:</div>
                        <div>時間:</div>
                        <div>隊伍:</div>
                        <div class="bg-success">贏家:</div>
                    </td>
                </tr>
                <tr>
                    <td id="lottery2" hidden="true" name="oddList">
                        <div>編號:</div>
                        <div>時間:</div>
                        <div>隊伍:</div>
                        <div class="bg-success">贏家:</div>
                    </td>
                </tr>
                <tr>
                    <td id="lottery3" hidden="true" name="oddList">
                        <div>編號:</div>
                        <div>時間:</div>
                        <div>隊伍:</div>
                        <div class="bg-success">贏家:</div>
                    </td>
                </tr>
                <tr>
                    <td id="lottery4" hidden="true" name="oddList">
                        <div>編號:</div>
                        <div>時間:</div>
                        <div>隊伍:</div>
                        <div class="bg-success">贏家:</div>
                    </td>
                </tr>
                <tr>
                    <td id="lottery5" hidden="true" name="oddList">
                        <div>編號:</div>
                        <div>時間:</div>
                        <div>隊伍:</div>
                        <div class="bg-success">贏家:</div>
                    </td>
                </tr>
                <tr>
                    <td id="lottery6" hidden="true" name="oddList">
                        <div>編號:</div>
                        <div>時間:</div>
                        <div>隊伍:</div>
                        <div class="bg-success">贏家:</div>
                    </td>
                </tr>
                <tr>
                    <td id="lottery7" hidden="true" name="oddList">
                        <div>編號:</div>
                        <div>時間:</div>
                        <div>隊伍:</div>
                        <div class="bg-success">贏家:</div>
                    </td>
                </tr>
                <tr>
                    <td id="lottery8" hidden="true" name="oddList">
                        <div>編號:</div>
                        <div>時間:</div>
                        <div>隊伍:</div>
                        <div class="bg-success">贏家:</div>
                    </td>
                </tr>
                <tr>
                    <td id="clearLottery" hidden="true">
                        <div>
                            <button id="clearbtn" type="button"
                                class="btn btn-warning btn-xs">清除投注區</button>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <!-- End of Lottery Panel   -->

        <!-- start of BetBoard -->
        <div id="betBoard" hidden="true" class="panel panel-primary ">
            <!-- Tab panes -->
            <div class="panel-heading">
                <h3>投注板</h3>
            </div>
            <div class="tab-content">
                <div class="tab-pane active" id="single">
                    <!-- Begin of Single Bet Panel -->
                    <div  >
                        <form class="form"
                            action="<c:url value="/lottery"/>" method="post">
                            <table
                                class="table table-striped  table-hover">
                                <thead>
                                    <tr>
                                        <td colspan="3">單場</td>
                                    </tr>
                                    <tr>
                                        <td>組合數</td>
                                        <td>最高中獎金額</td>
                                        <td>投注金</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td id="singleBet">組合數</td>
                                        <td id="singleTopPrize">最高中獎金額</td>
                                        <td id="singleCapital">總價</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">每組合投注  100元
                                            X</td>
                                        <td><input
                                            style="width: 40px"
                                            type="text"
                                            id="singleBetValue"
                                            value="1"></td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="lotteryOdds" hidden="true">
                                <input type="text" class="capitalValue"
                                    name="model.capital" value="">
                                <input type="text" class="oddId1"
                                    name="oddsIdList.oddId1" value="">
                                <input type="text" class="oddId2"
                                    name="oddsIdList.oddId2" value="">
                                <input type="text" class="oddId3"
                                    name="oddsIdList.oddId3" value="">
                                <input type="text" class="oddId4"
                                    name="oddsIdList.oddId4" value="">
                                <input type="text" class="oddId5"
                                    name="oddsIdList.oddId5" value="">
                                <input type="text" class="oddId6"
                                    name="oddsIdList.oddId6" value="">
                                <input type="text" class="oddId7"
                                    name="oddsIdList.oddId7" value="">
                                <input type="text" class="oddId8"
                                    name="oddsIdList.oddId8" value="">
                                <input type="text" name="model.com1"
                                    value="1">
                            </div>
                            <div>
                                <button class="lottery btn btn-danger btn-xs"
                                    type="submit">投注</button>                                
                            </div>
                        </form> <!-- lottery form真實投注 End-->
                        <form class="form"
                            action="<c:url value="/virtualLottery"/>" method="post">
                            <div class="lotteryOdds" hidden="true">
                                <input type="text" class="capitalValue"
                                    name="model.capital" value="">
                                <input type="text" class="oddId1"
                                    name="oddsIdList.oddId1" value="">
                                <input type="text" class="oddId2"
                                    name="oddsIdList.oddId2" value="">
                                <input type="text" class="oddId3"
                                    name="oddsIdList.oddId3" value="">
                                <input type="text" class="oddId4"
                                    name="oddsIdList.oddId4" value="">
                                <input type="text" class="oddId5"
                                    name="oddsIdList.oddId5" value="">
                                <input type="text" class="oddId6"
                                    name="oddsIdList.oddId6" value="">
                                <input type="text" class="oddId7"
                                    name="oddsIdList.oddId7" value="">
                                <input type="text" class="oddId8"
                                    name="oddsIdList.oddId8" value="">
                                <input type="text" name="model.com1"
                                    value="1">
                            </div>
                            <div>
                                <button type="submit" class="btn btn-warning btn-xs" >虛擬投注</button>
                            </div>
                        </form>
                    </div>
                    <!-- End of Single Bet Panel -->

                </div>
                <div class="tab-pane" id="pass">
                    <!-- Begin of Pass Bet Panel -->
                    <div  >
                        <form class="form" action="<c:url value="/lottery"/>">
                            <table class="table table-striped  table-hover">
                                <thead>
                                    <tr>
                                        <td colspan="3">過關</td>
                                    </tr>
                                    <tr>
                                        <td>組合數</td>
                                        <td>最高中獎金額</td>
                                        <td>投注金</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td id="passBet">組合數</td>
                                        <td id="passTopPrize">最高中獎金額</td>
                                        <td id="passCapital">總價</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">每組合投注  100元
                                            X</td>
                                        <td><input
                                            style="width: 40px"
                                            type="text"
                                            id="passBetValue" value="1"></td>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="lotteryOdds" hidden="true">
                                <input type="text" class="capitalValue"
                                    name="model.capital" value="">
                                <input type="text" class="oddId1"
                                    name="oddsIdList.oddId1" value="">
                                <input type="text" class="oddId2"
                                    name="oddsIdList.oddId2" value="">
                                <input type="text" class="oddId3"
                                    name="oddsIdList.oddId3" value="">
                                <input type="text" class="oddId4"
                                    name="oddsIdList.oddId4" value="">
                                <input type="text" class="oddId5"
                                    name="oddsIdList.oddId5" value="">
                                <input type="text" class="oddId6"
                                    name="oddsIdList.oddId6" value="">
                                <input type="text" class="oddId7"
                                    name="oddsIdList.oddId7" value="">
                                <input type="text" class="oddId8"
                                    name="oddsIdList.oddId8" value="">
                                <input type="text" name="model.com0"
                                    value="1">
                            </div>
                            <div>
                                <button class="lottery btn btn-danger btn-xs"
                                    type="submit">投注</button>
                                
                            </div>
                        </form>
                        <form class="form"
                            action="<c:url value="/virtualLottery"/>" method="post">
                            <div class="lotteryOdds" hidden="true">
                                <input type="text" class="capitalValue"
                                    name="model.capital" value="">
                                <input type="text" class="oddId1"
                                    name="oddsIdList.oddId1" value="">
                                <input type="text" class="oddId2"
                                    name="oddsIdList.oddId2" value="">
                                <input type="text" class="oddId3"
                                    name="oddsIdList.oddId3" value="">
                                <input type="text" class="oddId4"
                                    name="oddsIdList.oddId4" value="">
                                <input type="text" class="oddId5"
                                    name="oddsIdList.oddId5" value="">
                                <input type="text" class="oddId6"
                                    name="oddsIdList.oddId6" value="">
                                <input type="text" class="oddId7"
                                    name="oddsIdList.oddId7" value="">
                                <input type="text" class="oddId8"
                                    name="oddsIdList.oddId8" value="">
                                <input type="text" name="model.com1"
                                    value="1">
                                <input type="text" name="model.com0"
                                    value="1">                                    
                            </div>                        
                            <div>
                                <button type="submit" class="btn btn-warning btn-xs">虛擬投注</button>    
                            </div>
                        </form>
                    </div>
                    <!-- End of Pass Bet Panel -->
                </div>
                <div class="tab-pane" id="passCom">
                    <!-- Begin of Combination Bet Panel -->
                    <div class=" ">
                        <form id="passComForm" class="form"
                            action="<c:url value="/lottery"/>">

                            <table class="table table-striped  table-hover" id="comTable">
                                <tr>
                                    <td>過關組合</td>
                                    <td>組合數</td>
                                    <td>可能中獎金額</td>
                                </tr>
                                <tr>
                                    <td><label name="comLabel"
                                        class="checkbox "> <input
                                            type="checkbox"
                                            name="model.com1" value="">單場
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <td><label name="comLabel"
                                        class="checkbox"> <input
                                            type="checkbox"
                                            checked="true"
                                            name="model.com2" value="">過兩關
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td><label name="comLabel"
                                        class="checkbox"> <input
                                            type="checkbox"
                                            name="model.com3" value="">過三關
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td><label name="comLabel"
                                        class="checkbox"> <input
                                            type="checkbox"
                                            name="model.com4" value="">過四關
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td><label name="comLabel"
                                        class="checkbox"> <input
                                            type="checkbox"
                                            name="model.com5" value="">過五關斬六將
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td><label name="comLabel"
                                        class="checkbox"> <input
                                            type="checkbox"
                                            name="model.com6" value="">過六關
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td><label name="comLabel"
                                        class="checkbox"> <input
                                            type="checkbox"
                                            name="model.com7" value="">過七關
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td><label name="comLabel"
                                        class="checkbox"> <input
                                            type="checkbox"
                                            name="model.com8" value="">過八關
                                    </label></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </table>
                            <table
                                class="table table-striped  table-hover">
                                <thead>
                                    <tr>
                                        <td>總計</td>
                                    </tr>
                                    <tr>
                                        <td>組合數</td>
                                        <td>最高中獎金額</td>
                                        <td>投注金</td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td id="comBetsTotal">組合數</td>
                                        <td id="comTopPrize">最高中獎金額</td>
                                        <td id="comTopCapital">投注金</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">每組合投注  100元
                                            X</td>
                                        <td><input
                                            style="width: 40px"
                                            type="text" id="comBetValue"
                                            value="1"></td>
                                    </tr>
                                </tbody>
                            </table>

                            <div class="lotteryOdds" hidden="true">
                                <input type="text" class="capitalValue"
                                    name="model.capital" value="">
                                <input type="text" class="oddId1"
                                    name="oddsIdList.oddId1" value="">
                                <input type="text" class="oddId2"
                                    name="oddsIdList.oddId2" value="">
                                <input type="text" class="oddId3"
                                    name="oddsIdList.oddId3" value="">
                                <input type="text" class="oddId4"
                                    name="oddsIdList.oddId4" value="">
                                <input type="text" class="oddId5"
                                    name="oddsIdList.oddId5" value="">
                                <input type="text" class="oddId6"
                                    name="oddsIdList.oddId6" value="">
                                <input type="text" class="oddId7"
                                    name="oddsIdList.oddId7" value="">
                                <input type="text" class="oddId8"
                                    name="oddsIdList.oddId8" value="">
                            </div>
                            <div>
                                <button class="lottery btn btn-danger btn-xs" type="submit">投注</button>                                
                            </div>
                           
                            
                        </form>
                            <div>
                                <button  class="btn btn-warning btn-xs virtualButton" >虛擬投注</button>
                            </div> 

                        
                    </div>
                    <!-- End of Combination Bet Panel -->
                </div>
            </div>

        </div>
        <!-- End of BetBoard -->
    </div>
<!--sidepanel  -->  

<script>


var galbalGames;
var galbalOdds;
function golbalInsert(games, odds){
	galbalGames = games;
	galbalOdds = odds;
}
//-----------------------------------------------------
//投注區更新
function odds_refresh(){

	//var games = galbalGames;
	//var odds = galbalOdds;
     
	var games = sessionStorage.userGameInfo ? JSON.parse(sessionStorage.userGameInfo) : [];
	var odds = sessionStorage.userOddInfo ? JSON.parse(sessionStorage.userOddInfo) : [];
	
	//取出投注
	var userOddIds = [];
	if(sessionStorage.userOdds){
	    userOddIds  = sessionStorage.userOdds.split(',');
	}
	//console.log("userOddIds:"+userOddIds);
	
	//顯示投注區
	var lotteryId=1;
	var gameIsSelect=[];
	var combination=true;
	//投注的本金計錄；最高中獎金額紀錄
	var capitalValue=100;
	var singlePrize=0;
	var passPrize=1;
	var bets=userOddIds.length;
	var numerator=bets+0;
	var denominator=1;
	//紀錄投注賠率的陣列，用於計算最高中獎金額
	var lotteryOddValue=[];                    
	
	$.each(userOddIds, function(index, userOddId){
	    
	    lotteryOddValue[lotteryId-1]=odds[userOddId].oddValue;
	    //判斷是否有重覆選取同一賽事         
	    var oddGameNum=odds[userOddId].gameNum;
	    if(gameIsSelect[oddGameNum]!=-1 && gameIsSelect[oddGameNum]!=oddGameNum){
	        gameIsSelect[oddGameNum]=oddGameNum;
	    
	    }else{
	        gameIsSelect[oddGameNum]=-1;
	        combination=false;
	    }
	    
	    var oddType=odds[userOddId].labelText;
	    var oddValue=odds[userOddId].oddValue;
	    //調整最高中獎金額
	    singlePrize=singlePrize+oddValue;
	    passPrize=passPrize*oddValue;
	    var bet = games[odds[userOddId].gameNum];
	        $('#lottery'+lotteryId).prop("hidden",false);
	        $('#lottery'+lotteryId+'> div:eq(0)').html("編號:"+bet.gameNum+" "+bet.ballType);             
	        $('#lottery'+lotteryId+'> div:eq(1)').html("時間:"+millisecondToDate(bet.gameTime.iLocalMillis)+millisecondToTime(bet.gameTime.iLocalMillis));
	        $('#lottery'+lotteryId+'> div:eq(2)').html("隊伍:"+bet.teamAway.teamName+"vs"+bet.teamHome.teamName);
	        $('#lottery'+lotteryId+'> div:eq(3)').html(oddType+'<span">'+oddValue+'</span>'+'<button oddId="'+userOddId+'" type="button" class="close" lotteryId="'+lotteryId+'"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>');
	        //加入過關組合checkbox
	        $('#comTable  tr:eq('+lotteryId+')').prop("hidden",false);
	        //顯示過關組合數
	        denominator=denominator*lotteryId;
	        
	        $('#comTable  tr:eq('+lotteryId+') td:eq(1)').html(numerator/denominator);
	        bets=bets-1;
	        numerator=numerator*bets;
	    
	    	//加入odd至投注form中
	        $('.oddId'+lotteryId).val(userOddId);
	    lotteryId++;
	});
	
	//過關總投注金、最高中獎金額
	$('#passBet').html(1);
	$('#passCapital').html($('#passBetValue').val()*capitalValue);
	$('#passTopPrize').html(Math.floor(passPrize*100));            
	
	//單場總投注金、最高中獎金額
	$('#singleBet').html(userOddIds.length);
	$('#singleCapital').html((userOddIds.length)*$('#singleBetValue').val()*capitalValue);
	$('#singleTopPrize').html(Math.floor(singlePrize*100));
	//更新過關組合類型與計算金額
	//計算每個組合的最高可能獎金
	for(var i=1;i<=8;i++){
	    if(i<=userOddIds.length){
	        $('#comTable  tr:eq('+i+') td:eq(2)').html(Math.floor(getCapitalByOdd(lotteryOddValue,i)*capitalValue*$('#comBetValue').val()));    
	    }
	}
	
	//計算過關組合投注金、最高中獎金額
	    refreshBetTable();
	$('[name=comLabel]').click(function(){
	    refreshBetTable();
	});
	//更新總計
	function refreshBetTable(){
	    var bet=0;
	    var topPrize=0;
	    var checkedlabel=$('[name=comLabel] input:checked').parent().parent().parent();
	    $.each(checkedlabel, function(index, checkedItem){
	        
	        $('input',checkedItem).val(1);	        
	        bet+=parseInt($('td:eq(1)', checkedItem).text());
	        topPrize+=parseInt($('td:eq(2)', checkedItem).text());
	    });
	    $('#comBetsTotal').html(bet);
	    $('#comTopPrize').html(topPrize);
	    $('#comTopCapital').html(bet*capitalValue*$('#comBetValue').val());
	    
	}
	
	$('#singleBetValue').off('keyup');
	$('#singleBetValue').on('keyup', function(){            
	    $('#singleCapital').html((userOddIds.length)*$('#singleBetValue').val()*capitalValue);
	    $('.capitalValue').val($('#singleBetValue').val()*capitalValue);
	});
	
	$('#passBetValue').off('keyup');
	$('#passBetValue').on('keyup', function(){          
	    $('#passCapital').html($('#passBetValue').val()*capitalValue);              
	    $('.capitalValue').val($('#passBetValue').val()*capitalValue);
	});
	
	$('#comBetValue').off('keyup');
	$('#comBetValue').on('keyup', function(){                           
	    $('.capitalValue').val($('#comBetValue').val()*capitalValue);
	    refreshBetTable();
	});               
	
	//每一注投注金計算
	$('.capitalValue').val($('#singleBetValue').val()*capitalValue);
	$('.capitalValue').val($('#passBetValue').val()*capitalValue);
	$('.capitalValue').val($('#comBetValue').val()*capitalValue);
	
	if((userOddIds.length>=2)&&combination){
	    //過關
	    //console.log("before:"+sessionStorage.activeTab);
	        if($('#myTab li:eq(1)').hasClass("active")){
	            sessionStorage.activeTab="1";
	            $('#myTab li:eq(1) a').tab('show');
	        }
	        else if($('#myTab li:eq(2)').hasClass("active")){
	            sessionStorage.activeTab="2";
	            $('#myTab li:eq(2) a').tab('show');
	        }
	        else if( $('#myTab li:eq(0)').hasClass("active")){
	            sessionStorage.activeTab="0";
	            $('#myTab li:eq(0) a').tab('show');
	        }
	
	    //console.log("after:"+sessionStorage.activeTab);
	    
	
	    $('#myTab li:eq(1) a').off('click');
	    $('#myTab li:eq(2) a').off('click');
	}
	else{
	    //單場
	    $('#myTab li:eq(0) a').tab('show');
	    //若同一場賽事過關或過關組合僅能選擇一種遊戲玩法，凍結過關與過關組合
	    $('#myTab li:eq(1) a').off('click');
	    $('#myTab li:eq(1) a').on('click',function(){
	        return false;
	    });
	    $('#myTab li:eq(2) a').off('click');
	    $('#myTab li:eq(2) a').on('click',function(){
	        return false;
	    });
	}
	
	//隱藏未投注的投注區，未投注的值設定為空值
	while(lotteryId<=8){
	    $('#lottery'+lotteryId).attr("hidden",true);
	    $('#comTable  tr:eq('+lotteryId+')').prop("hidden",true);
	    $('.oddId'+lotteryId).val("");
	    lotteryId++;
	}
	
	if (userOddIds!=""){
	    //有投注時才顯示投注區
	    $('#betBoard').attr("hidden",false);
	    $('#clearLottery').attr("hidden",false);
	
	}
	else{
	    //沒有投注時才隱藏投注區
	    $('#betBoard').attr("hidden",true);
	    $('#clearLottery').attr("hidden",true);
	}
	
	//刪除指定投注
	$('td[name="oddList"] .close').off('click');
	$('td[name="oddList"] .close').on('click', function(){
	    userOddIds.splice(userOddIds.indexOf($(this).attr('oddId')),1);
	    console.log("userOddIds:"+userOddIds);
	    sessionStorage.userOdds = userOddIds;
	    
	    odds[$(this).attr('oddId')] = null;
	    sessionStorage.userOddInfo = JSON.stringify(odds);
	    
	    $(this).parent().parent().parent().attr("hidden",true); 
	    gameRefresh(galbalGames, galbalOdds);
	    odds_refresh();    
	});
	
	//清除投注區
	$('#clearbtn').off('click');
	$('#clearbtn').on('click', function(){
	    sessionStorage.userOdds = "";
	    sessionStorage.userOddInfo = [];
	    sessionStorage.userGameInfo = [];
	    gameRefresh(galbalGames, galbalOdds);
	    odds_refresh();
	    
   
	    
	    
	});
    //過關組合虛擬投注按鈕
    $('.virtualButton').off('click');
    $('.virtualButton').on('click',function(){
        var com1=$('#passComForm input:eq(0)').val();
        var com2=$('#passComForm input:eq(1)').val();
        var com3=$('#passComForm input:eq(2)').val();
        var com4=$('#passComForm input:eq(3)').val();
        var com5=$('#passComForm input:eq(4)').val();
        var com6=$('#passComForm input:eq(5)').val();
        var com7=$('#passComForm input:eq(6)').val();
        var com8=$('#passComForm input:eq(7)').val();
        
        var formCapital=$('#passComForm input:eq(9)').val();
        
        var odd1=$('#passComForm input:eq(10)').val();
        var odd2=$('#passComForm input:eq(11)').val();
        var odd3=$('#passComForm input:eq(12)').val();
        var odd4=$('#passComForm input:eq(13)').val();
        var odd5=$('#passComForm input:eq(14)').val();
        var odd6=$('#passComForm input:eq(15)').val();
        var odd7=$('#passComForm input:eq(16)').val();
        var odd8=$('#passComForm input:eq(17)').val();
       
        var queryString = {
             'model.com1':com1,
             'model.com2':com2,
             'model.com3':com3,
             'model.com4':com4,
             'model.com5':com5,
             'model.com6':com6,
             'model.com7':com7,
             'model.com8':com8,
             'model.capital':formCapital,
             'oddsIdList.oddId1':odd1,
             'oddsIdList.oddId2':odd2,
             'oddsIdList.oddId3':odd3,
             'oddsIdList.oddId4':odd4,
             'oddsIdList.oddId5':odd5,
             'oddsIdList.oddId6':odd6,
             'oddsIdList.oddId7':odd7,
             'oddsIdList.oddId8':odd8
        };
        $(location).attr("href",'<c:url value="/virtualLottery?"/>'+$.param(queryString));
//         	{
//         	url:'<c:url value="/virtualLottery"/>',
//         	data:{
//                 'model.com1':com1,
//                 'model.com2':com2,
//                 'model.com3':com3,
//                 'model.com4':com4,
//                 'model.com5':com5,
//                 'model.com6':com6,
//                 'model.com7':com7,
//                 'model.com8':com8,
//                 'model.capital':formCapital,
//                 'oddsIdList.oddId1':odd1,
//                 'oddsIdList.oddId2':odd2,
//                 'oddsIdList.oddId3':odd3,
//                 'oddsIdList.oddId4':odd4,
//                 'oddsIdList.oddId5':odd5,
//                 'oddsIdList.oddId6':odd6,
//                 'oddsIdList.oddId7':odd7,
//                 'oddsIdList.oddId8':odd8
//         	}
//        }

        
//         $.post(
//         	    '<c:url value="/virtualLottery"/>',
//         	    {

//         	    }
//         );
    });  

}

//-----------------------------------------------------
//投注區更新結束
</script>
</body>
</html>