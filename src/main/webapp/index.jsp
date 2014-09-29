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
<script src="<c:url value="/js/jquery.jdigiclock.js"/>"></script>
<script src="<c:url value="/js/jquery.shapeshift.min.js"/>"></script>
<script src="<c:url value="/js/jquery-dateFormat.min.js"/>"></script>
<script src="<c:url value="/js/jquery.jsort.0.4.min.js"/>"></script>

<!--sidepanel  -->  

<script type="text/javascript" src="js/jquery.sidr.min.js"></script>
<link rel="stylesheet" href="<c:url value="css/jquery.sidr.light.css"/>">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">



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
<link rel="stylesheet" href="<c:url value="/css/jquery.jdigiclock.css"/>">
<link rel="stylesheet" href="<c:url value="/css/sportslottery.css"/>">

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
        <div class="hidden visible-xs"><br></div>
        
        <!-- TopPage start -->
        <div id="top-page-div">
            <jsp:include page="topPage.jsp" />
        </div>        
        <!-- TopPage end --> 
        <!-- content start -->
	    <div  id="target" style="padding-top:60px;">	
<%-- 		  <jsp:include page="/Event/test-events.jsp" /> --%>
	    </div>
        <!-- content end --> 
    </div>
</div>
<!-- page end -->


<!-- <script type="text/javascript"> -->
<%--    	$('#top-page-div').load('<c:url value="/topPage.jsp"/>');   --%>
<!-- </script> -->



<div id="sidr" hidden="true">
  <!-- lottery content -->
<!--start lottery panel  -->
        <div class="panel panel-primary">
            <div class="panel-heading ">
                                         投注區
                <span id="closeLotteryPanel" class="glyphicon glyphicon glyphicon-arrow-left pull-right simple-menu" ></span>                                      
            </div>
            
            <!-- Nav tabs -->
            <ul class="nav nav-tabs" role="tablist" id="myTab" >
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
            <!-- start of autoLottery Panel -->
            <div id="autoLottery" class="panel panel-success" hidden="true" >
                <div class="panel-heading text-center ">
                                         自動投注
                </div>
                <div>
                    <ul class="pager">
                       <li id='randomLottery'><a href="#">小試牛刀</a></li>
                    </ul>
                 </div>
                 <button id="hasGameForBet" class="text-center bg-danger" hidden="true">
                                                     近三日無可投注賽事
                 </button>
            </div>
            <!-- End of autoLottery Panel -->   

        </div>
        <!-- End of Lottery Panel   -->
        
        

        
        
        <!-- start of BetBoard -->
        <div id="betBoard" hidden="true" class="panel panel-primary ">
            <!-- Tab panes -->
            <div class="panel-heading">
                                     投注板
            </div>
            <div class="tab-content">
                <div class="tab-pane active" id="single">
                    <!-- Begin of Single Bet Panel -->
                    <div  >
                        <form class="form"
                            action="<c:url value='/lottery'/>" method="post">
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
                                        <td><div class="form-group has-success"><input class='form-control'
                                            style="width: 40px"
                                            type="text"
                                            id="singleBetValue"
                                            value="1"></div></td>
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
                                <input type="text" name="lotteryToken" value="" hidden>
                            </div>
                            <div>
                                <button class="lottery btn btn-danger btn-xs checkOdds"
                                    type="submit">投注</button>
                            	<span class=checkOddsError></span>                                
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
                                <button type="submit" class="btn btn-warning btn-xs virtualLottery" >虛擬投注</button>
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
                                        <td><div class="form-group has-success"><input
                                            style="width: 40px" class="form-control"
                                            type="text"
                                            id="passBetValue" value="1"></div></td>
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
                                <input type="text" name="lotteryToken" value="" hidden>
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
                                <button type="submit" class="btn btn-warning btn-xs virtualLottery">虛擬投注</button>    
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
                                        <td><div class="form-group has-success"><input
                                            style="width: 40px" class="form-control"
                                            type="text" id="comBetValue"
                                            value="1"></div></td>
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
                                <input type="text" name="lotteryToken" value="" hidden>
                            </div>
                            <div>
                                <button class="lottery btn btn-danger btn-xs">投注</button>     
                                <span class="submitError"></span>                          
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

	<div id="youAreSoPoor" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<img src="images/success.png">
					<h4>
						<span id="forgetSuccess">${errorMsg}</span>
					</h4>
				</div>
			</div>
		</div>
	</div>


<script>
var hasLocking;
//建立本次token
$('input[name="lotteryToken"]').val(getUuid());

//判斷錢夠不夠
<c:if test="${not empty errorMsg}">callErrorModal()</c:if>
function callErrorModal(){
	$('#youAreSoPoor').modal('show');
	$(document).bind("keypress keydown keyup", function(e) {
		if(e.which === 116) {
			return false;
			}
			if(e.which === 82 && e.ctrlKey) {
				return false;
			}
		 });
	
	setTimeout('document.location.href="<c:url value='/goIndex'/>"' ,3000);
}
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
	$('#passTopPrize').html(Math.floor(passPrize*$('#passBetValue').val()*capitalValue));            
	
	//單場總投注金、最高中獎金額
	$('#singleBet').html(userOddIds.length);
	$('#singleCapital').html((userOddIds.length)*$('#singleBetValue').val()*capitalValue);
	$('#singleTopPrize').html(Math.floor(singlePrize*$('#singleBetValue').val()*capitalValue));
	//更新過關組合類型與計算金額
	//計算每個過關組合的最高可能獎金
	function calculateComTopPrize(){
		for(var i=1;i<=8;i++){
	        if(i<=userOddIds.length){
	            $('#comTable  tr:eq('+i+') td:eq(2)').html(Math.floor(getCapitalByOdd(lotteryOddValue,i)*capitalValue*$('#comBetValue').val()));    
	        }
	    }	
	}
	calculateComTopPrize();
	
	
	//計算過關組合投注金、最高中獎金額
	    refreshBetTable();
	$('[name=comLabel]').click(function(){
	    refreshBetTable();
	});
	//更新總計
    function refreshBetTable(){
		
		var bet=0;
	    var topPrize=0;
	    //將未選取的checkbox對應的com設為0
	    var uncheckedlabel=$('[name=comLabel] input:unchecked').parent().parent().parent();
	    $.each(uncheckedlabel, function(index, uncheckedItem){           
            $('input',uncheckedItem).val(0);                      
        });   
	  //將選取的checkbox對應的com設為1	    
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
	//更改投注金額控制
	$('#singleBetValue').off('keyup');
	$('#singleBetValue').on('keyup', function(){
		var positiveInteger = /^[0-9]*[1-9][0-9]*$/;
		if(isNaN($('#singleBetValue').val()) || !positiveInteger.test($('#singleBetValue').val())){
			$('#singleBetValue').tooltip({
			 placement:'bottom',
			 title:'請輸入正整數',
			 triger:'hover focus'					
			});
			$('#singleBetValue').tooltip('show');
			$('#singleBetValue').parent().removeClass();
			$('#singleBetValue').parent().addClass('form-group has-error');
			$('#singleCapital').html('0');
            $('#singleTopPrize').html('0');
            //禁止點選虛擬投注與真實投注
            $('.lottery').on('click',function(e){
                $('.lottery').tooltip({
                    placement:'right',
                    title:'請檢查投注金',
                    triger:'hover focus'                   
                   });
                $('.lottery').tooltip('show');
                e.preventDefault();
            });
            $('.virtualLottery').on('click',function(e){
            	$('.virtualLottery').tooltip({
                    placement:'right',
                    title:'請檢查投注金',
                    triger:'hover focus'                   
                   });
                $('.virtualLottery').tooltip('show');
            	e.preventDefault();
            });
            
		}else{
			$('#singleBetValue').tooltip('destroy');
			$('.virtualLottery').tooltip('destroy');
			$('#singleBetValue').parent().removeClass();
            $('#singleBetValue').parent().addClass('form-group has-success');
            //顯示試算彩金
            $('#singleCapital').html((userOddIds.length)*$('#singleBetValue').val()*capitalValue);
            $('#singleTopPrize').html(Math.floor(singlePrize*$('#singleBetValue').val()*capitalValue));
            $('.capitalValue').val($('#singleBetValue').val()*capitalValue);
            //允許點選虛擬投注與真實投注
            $('.lottery').off('click');
            $('.lottery').on('click');
            $('.virtualLottery').off('click');
            $('.virtualLottery').on('click');
		}

	    
	});
	
	$('#passBetValue').off('keyup');
	$('#passBetValue').on('keyup', function(){
		var positiveInteger = /^[0-9]*[1-9][0-9]*$/;
        if(isNaN($('#passBetValue').val()) || !positiveInteger.test($('#passBetValue').val())){
            $('#passBetValue').tooltip({
             placement:'bottom',
             title:'請輸入正整數',
             triger:'hover focus'                   
            });
            $('#passBetValue').tooltip('show');
            $('#passBetValue').parent().removeClass();
            $('#passBetValue').parent().addClass('form-group has-error');
            $('#passCapital').html('0');
            $('#passTopPrize').html('0');
            //禁止點選虛擬投注與真實投注
            $('.lottery').on('click',function(e){
                $('.lottery').tooltip({
                    placement:'right',
                    title:'請檢查投注金',
                    triger:'hover focus'                   
                   });
                $('.lottery').tooltip('show');
                e.preventDefault();
            });
            $('.virtualLottery').on('click',function(e){
                $('.virtualLottery').tooltip({
                    placement:'right',
                    title:'請檢查投注金',
                    triger:'hover focus'                   
                   });
                $('.virtualLottery').tooltip('show');
                e.preventDefault();
            });
            
        }else{
            $('#passBetValue').tooltip('destroy');
            $('.lottery').tooltip('destroy');
            $('.virtualLottery').tooltip('destroy');
            $('#passBetValue').parent().removeClass();
            $('#passBetValue').parent().addClass('form-group has-success');
            //顯示試算彩金
            $('#passCapital').html($('#passBetValue').val()*capitalValue);
            $('#passTopPrize').html(Math.floor(passPrize*$('#passBetValue').val()*capitalValue));
            $('.capitalValue').val($('#passBetValue').val()*capitalValue);
            //允許點選虛擬投注與真實投注
            $('.lottery').off('click');
            $('.lottery').on('click');
            $('.virtualLottery').off('click');
            $('.virtualLottery').on('click');
        }		
	    
	});
	
	$('#comBetValue').off('keyup');
	$('#comBetValue').on('keyup', function(){
        var positiveInteger = /^[0-9]*[1-9][0-9]*$/;
        if(isNaN($('#comBetValue').val()) || !positiveInteger.test($('#comBetValue').val())){
        	var comBet = $('#comBetValue').val();
        	$('#comBetValue').val(0);
            calculateComTopPrize();
            refreshBetTable();
            $('#comBetValue').val(comBet);
        	$('#comBetValue').tooltip({
             placement:'bottom',
             title:'請輸入正整數',
             triger:'hover focus'                   
            });
            $('#comBetValue').tooltip('show');
            $('#comBetValue').parent().removeClass();
            $('#comBetValue').parent().addClass('form-group has-error');
            $('#comBetCapital').html('無');
            $('#comBetTopPrize').html('無');
            //禁止點選虛擬投注與真實投注
            $('.lottery').on('click',function(e){
                $('.lottery').tooltip({
                    placement:'right',
                    title:'請檢查投注金',
                    triger:'hover focus'                   
                   });
                $('.lottery').tooltip('show');
                e.preventDefault();
            });
            $('.virtualButton').off('click');
            $('.virtualButton').on('click',function(e){
                $('.virtualButton').tooltip({
                    placement:'right',
                    title:'請檢查投注金',
                    triger:'hover focus'                   
                   });
                $('.virtualButton').tooltip('show');
                e.preventDefault();
            });
            
        }else{
            $('#comBetValue').tooltip('destroy');
            $('.lottery').tooltip('destroy');
            $('.virtualButton').tooltip('destroy');
            $('#comBetValue').parent().removeClass();
            $('#comBetValue').parent().addClass('form-group has-success');
            //顯示試算彩金
            $('#comBetCapital').html($('#comBetValue').val()*capitalValue);
            $('#comBetTopPrize').html(Math.floor(passPrize*$('#comBetValue').val()*capitalValue));
            $('.capitalValue').val($('#comBetValue').val()*capitalValue);
            //允許點選虛擬投注與真實投注
            $('.lottery').off('click');
            $('.lottery').on('click');
            $('.virtualButton').off('click');
            $('.virtualButton').on('click');
            calculateComTopPrize();
            refreshBetTable();
            $('.capitalValue').val($('#comBetValue').val()*capitalValue);
        }		
		

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
   	    $('#autoLottery').attr("hidden",true);
	    
	}
	else{
	    //沒有投注時才隱藏投注區
	    $('#betBoard').attr("hidden",true);
	    $('#clearLottery').attr("hidden",true);
	    
	    if('${user.userAccount}'!=""){
	    	$('#autoLottery').attr("hidden",false);	
	    }
	    
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
	    odds_refresh();
	    if(galbalGames){
	    gameRefresh(galbalGames, galbalOdds);
	    }
	});
	
	//清除投注區
	$('#clearbtn').off('click');
	$('#clearbtn').on('click', function(){
	    sessionStorage.userOdds = "";
	    sessionStorage.userOddInfo = [];
	    sessionStorage.userGameInfo = [];
	    odds_refresh();	    
	    if(galbalGames){
	    	gameRefresh(galbalGames, galbalOdds);
        }
	    
	    
	    
	});
    //過關組合虛擬投注按鈕，將form裡的資料加入post的uri後
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
    });  

}
$('#randomLottery').on('click',function(){
	if(!galbalGames){
	    $('#randomLottery').tooltip({
         placement:'bottom',
         title:'查無賽事列表',
         triger:'hover focus'                   
        });
        $('#randomLottery').tooltip('show');
	}
	else{
		$('#randomLottery').tooltip('destroy');  
	    var randomOdd=0;
	    var userOddInfo = sessionStorage.userOddInfo ? JSON.parse(sessionStorage.userOddInfo) : [];
	    var userGameInfo = sessionStorage.userGameInfo ? JSON.parse(sessionStorage.userGameInfo) : [];
	    var hasGameToBet = -1;
	    var todayMil = new Date().valueOf() - new Date().getTimezoneOffset()*60000;
	    $.each(galbalGames,function(index, game){ 	 
	        if(game && game.gameStatus==1 ){
	        	var targetGameTime = game.gameTime.iLocalMillis;
	        	if(targetGameTime>todayMil){
	        		console.log(game);
	                hasGameToBet=1;	
	        	}	        
	        }
	    });
	    
	    if(hasGameToBet==-1){
	        $('#hasGameForBet').prop('hidden',false);
	        //$('#randomLottery').off('click');
	        $('#hasGameForBet').fadeIn(1000);
	        $('#hasGameForBet').fadeOut(2000);
	        setTimeout(function(){          
	            $('#hasGameForBet').prop('hidden',true);
	            $('#hasGameForBet').attr("disabled", false);
	            //$('#randomLottery').on('click');
	        },3000);
	        return;
	    }else{
	        $('#hasGameForBet').prop('hidden',true);
	    }
	   
	    
	    while(!galbalOdds[randomOdd] || (galbalGames[galbalOdds[randomOdd].gameNum].gameStatus!=1 || galbalGames[galbalOdds[randomOdd].gameNum].gameTime.iLocalMillis<todayMil)){
	        randomOdd=parseInt(Math.random()*galbalOdds.length)+1;                            
	    }
	    
	    console.log("game:"+randomOdd);
	    console.log(galbalGames[galbalOdds[randomOdd].gameNum]);        
	    console.log(galbalGames[galbalOdds[randomOdd].gameNum].gameStatus==1); 
	    
	    
	    
	    if(!userOddInfo[randomOdd]){
	        var thisOdd = galbalOdds[randomOdd];
	        var thisGame = galbalGames[thisOdd.gameNum];
	        userOddInfo[randomOdd] = thisOdd;
	        userGameInfo[thisOdd.gameNum] = thisGame;
	    }
	    
	    sessionStorage.userOddInfo = JSON.stringify(userOddInfo);
	    sessionStorage.userGameInfo = JSON.stringify(userGameInfo);
	    sessionStorage.userOdds=galbalOdds[randomOdd].id;
	    
	    odds_refresh();
	}
        
});
$('#closeLotteryPanel').on("mouseover",function(){
    $(this).addClass("closeOver");
});
$('#closeLotteryPanel').on("mouseout",function(){
	$(this).removeClass("closeOver");
});

$('#closeLotteryPanel').on("click",function(){
	
});

//-----------------------------------------------------

	<c:if test="${not empty locking}">locking()</c:if>
	<c:if test="${not empty locking}">hasLocking = true</c:if>
	function locking(){
		//setTimeout("$('#goVerify').trigger('click')" ,10);
		$('#goVerify').trigger('click');
    };
//投注區更新結束

$(document).ready(function() {
	//判定是否有指定導向的頁面
	var hasLocated = sessionStorage.hasLocated ? sessionStorage.hasLocated : "" ;
	var isLocking;
	<c:if test="${not empty locking}">
		isLocking = ${locking};
	</c:if>	
	if(isLocking){
		hasLocated = 'locking';
	}
	switch(hasLocated) {
	case 'game':
		$("#target").load('<c:url value="/Event/test-events.jsp"/>');
		break;
	case 'history':
		$("#target").load('<c:url value="/History/historyComplex.jsp"/>');
		break;
	case 'user':
		$("#target").load('<c:url value="/Security/userOddsSearch.jsp"/>');
		break;
	case 'locking':
		$("#target").load('<c:url value="/Security/singUp.jsp"/>');
		break;
	default:
		$("#target").load('<c:url value="/Event/test-events.jsp"/>');
		break;
	}
	sessionStorage.hasLocated = "";
	
	$(document).on('touchend',function(){
		$('*').tooltip('hide');
	});
		
});

</script>
</body>
</html>