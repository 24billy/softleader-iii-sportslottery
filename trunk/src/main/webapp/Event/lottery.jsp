<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<title>virtualLottery</title>
</head>
<body>

                <!-- .row -->
    <div id="page-wrapper">

        <div class="container top20">                
            <div class="row top20">
                <div class="col-lg-12">
                    <div class="alert alert-info text-center" role="alert">
                        <h3>${user.userAccount}，你已經完成投注。                            
                        </h3>
                        <button id="back">回到賽事表</button>
                    </div>
                    <table id ="lotteryTable" class="table table-hover table-condensed table-bordered table-striped nowrap text-left" >
                        <thead>
                            <tr>
                                <th></th>
                                <th>彩券編號</th>
                                <th>下注時間</th>
                                <th>下注金額</th>
                                <th>組合數</th>                             
                                <th>組合</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr id="lottery">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td></td>
                                <td><ul class="list-group"></ul></td>
                             </tr>
                        </tbody>
                    </table>
                
                    <!-- odds table -->
                        <table id="oddsTable" class="table table-hover table-condensed table-bordered table-striped nowrap">
                            <thead>
                                <tr>
                                    <th>球種</th>
                                    <th>聯盟</th>
                                    <th>賽事編號</th>
                                    <th>比賽日期</th>
                                    <th>客隊隊伍</th>
                                    <th>主隊隊伍</th>
                                    <th>玩法</th>
                                    <th>過關</th>
                                </tr>
                            </thead>
                            <tbody id="oddsList">
                                <tr hidden="true">
                                    <td></td>                                  
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>                               
                                <tr hidden="true">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr hidden="true">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                                                            
                            </tbody>
                        </table>
                    <!-- </div>  -->
                    <!-- odds table end -->
                </div>
            </div>
            <!-- .row -->
        </div>
        <!-- .container-fluid -->
    </div>
    <!-- #page-wrapper -->    
<script>
(function($) {
    //存放投注資訊
    var odds = '${json}' ? JSON.parse('${json}') : [];
    var games = '${jsonGame}' ? JSON.parse('${jsonGame}') : [];
    
    //比賽分數暫存區
    var awayScoreByGameId=[];
    var homeScoreByGameId=[];
    
    //中獎投注暫存區
    var lotteryOddValue=[];
    var prizeCount=0;
    var totalPrize=0;
   
    //計算組合數    
    var totalCombinations=0;
    
    $.each(games, function(index,game){
        //console.log("game:");
        //console.log(game);
        $('#oddsList tr:eq('+index+')').prop('hidden',false);
        $('#oddsList tr:eq('+index+') td:eq(0)').html(game.ballType);
        $('#oddsList tr:eq('+index+') td:eq(1)').html(game.teamAway.leagueName);
        $('#oddsList tr:eq('+index+') td:eq(2)').html(game.gameNum);
        $('#oddsList tr:eq('+index+') td:eq(3)').html(millisecondToDate(game.gameTime.iLocalMillis));
        $('#oddsList tr:eq('+index+') td:eq(4)').html(game.teamAway.teamName);
        $('#oddsList tr:eq('+index+') td:eq(5)').html(game.teamHome.teamName);      
    });
    
    $.each(odds, function(index, odd){


        var pass = '不知道有沒有過關';      
        //console.log("odd:");
        //console.log(odd);
  
        $('#oddsList tr:eq('+index+') td:eq(6)').html(odd.oddType);  
        pass = isPass(awayScoreByGameId[odd.gameId],homeScoreByGameId[odd.gameId],odd.oddCombination,odd.oddType);
        if(pass=='過關'){
            lotteryOddValue[prizeCount]=odd.oddValue;
            prizeCount++;
        }
        
        $('#oddsList tr:eq('+index+') td:eq(7)').html(pass);
    });

    function isPass(awayScore,homeScore,oddCombination,oddType){
        if(oddType=='SU_H' && (homeScore-awayScore)>0){
            return '過關'; //不讓分主隊贏           
        }
        if(oddType=='SU_A' && (homeScore-awayScore)<0){
            return '過關'; //不讓分客隊贏           
        }
        if(oddType=='ATS_H' && (homeScore-awayScore)>oddCombination){
            return '過關'; //讓分主隊贏           
        }
        if(oddType=='ATS_A' && (awayScore-homeScore)>oddCombination){
            return '過關'; //讓分客隊贏           
        }
        if(oddType=='SC_H' && (homeScore+awayScore)>oddCombination){
            return '過關'; //總分合大於           
        }
        if(oddType=='SC_L' && (homeScore+awayScore)<oddCombination){
            return '過關'; //總分合小於           
        }
        if(oddType=='ODD' && (homeScore+awayScore)%2==1){
            return '過關'; //總分奇數           
        }
        if(oddType=='EVEN' && (homeScore+awayScore)%2==0){
            return '過關'; //總分偶數           
        }
        else{
            return '沒過關';
        }
    }
    
    
    var lottery = '${jsonLottery}' ? JSON.parse('${jsonLottery}') : [];
    var com='';
    $('#lottery td:eq(1)').html('<h4>需你投注</h4>');
    $('#lottery td:eq(2)').html('<h4>'+millisecondToDate(lottery.confirmTime.iLocalMillis)+'</h4>');
    
    if(lottery.com0==1){
        $('#lottery td:eq(5)').html('<p>'+'(過關)'+'</p>');
        if(prizeCount==odds.length){
            totalPrize==totalPrize+Math.floor(getCapitalByOdd(lotteryOddValue,odds.length))*(lottery.capital);
        }
        totalCombinations=totalCombinations+cngm(odds.length,odds.length);
    }
    else{
        if(lottery.com1==1){            
            com=com+'<p>'+'(單場)'+'</p>';
            $('#lottery td:eq(5)').html(com);
            if((lotteryOddValue.length)>=1){
                totalPrize+=(getCapitalByOdd(lotteryOddValue,1))*(lottery.capital); 
            }
            totalCombinations+=cngm(odds.length,1);
        }
        if(lottery.com2==1){
            com=com+'<p>'+'(過兩關)'+'</p>';
            $('#lottery td:eq(5)').html(com);
            if(lotteryOddValue.length>=2){
                totalPrize+=(getCapitalByOdd(lotteryOddValue,2))*(lottery.capital);
            }
            totalCombinations+=cngm(odds.length,2);
        }
        if(lottery.com3==1){
            com=com+'<p>'+'(過三關)'+'</p>';
            $('#lottery td:eq(5)').html(com);
            if(lotteryOddValue.length>=3){
                totalPrize+=(getCapitalByOdd(lotteryOddValue,3))*(lottery.capital);
            }
            totalCombinations+=cngm(odds.length,3);
        }
        if(lottery.com4==1){
            com=com+'<p>'+'(過四關)'+'</p>';
            $('#lottery td:eq(5)').html(com);
            if(lotteryOddValue.length>=4){
                totalPrize+=(getCapitalByOdd(lotteryOddValue,4))*(lottery.capital);
            }
            totalCombinations+=cngm(odds.length,4);
        }
        if(lottery.com5==1){
            com=com+'<p>'+'(過五關斬六將)'+'</p>';
            $('#lottery td:eq(5)').html(com);
            if(lotteryOddValue.length>=5){
                totalPrize+=(getCapitalByOdd(lotteryOddValue,5))*(lottery.capital);
            }
            totalCombinations+=cngm(odds.length,5);
        }
        if(lottery.com6==1){
            com=com+'<p>'+'(過六關)'+'</p>';
            $('#lottery td:eq(5)').html(com);
            if(lotteryOddValue.length>=6){
                totalPrize+=(getCapitalByOdd(lotteryOddValue,6))*(lottery.capital);
            }
            totalCombinations+=cngm(odds.length,6);
        }
        if(lottery.com7==1){
            com=com+'<p>'+'(過七關)'+'</p>';
            $('#lottery td:eq(5)').html(com);
            if(lotteryOddValue.length>=7){
                totalPrize+=(getCapitalByOdd(lotteryOddValue,7))*(lottery.capital);
            }
            totalCombinations+=cngm(odds.length,7);
        }
        if(lottery.com8==1){
            com=com+'<p>'+'(過八關)'+'</p>';
            $('#lottery td:eq(5)').html(com);
            if(lotteryOddValue.length>=8){
                totalPrize+=(getCapitalByOdd(lotteryOddValue,8))*(lottery.capital);
            }
            totalCombinations+=cngm(odds.length,8);
        }

        
    }
    $('#lottery td:eq(3)').html('<h4>'+lottery.capital+" X "+totalCombinations+" = "+(lottery.capital*totalCombinations)+'</h4>');
     $('#lottery td:eq(4)').html('<h4>'+totalCombinations+'</h4>');

   //計算排列組合數 
   function cngm(n,m){
       var numerator=1;
       var denominator=1;
       for(var i=1;i<=m;i++){
           numerator=numerator*n;
           denominator=denominator*i;
           n=n-1;
       }
       return numerator/denominator;
   } 
   
   $('#back').on('click',function(){
       document.location.href='<c:url value="/index.jsp"/>';
   })
})(jQuery);

sessionStorage.userOdds = "";
sessionStorage.userOddInfo = [];
sessionStorage.userGameInfo = [];
//setTimeout(function(){
//  document.location.href='<c:url value="/index.jsp"/>';
//},50000);
</script>
</body>
</html>
   