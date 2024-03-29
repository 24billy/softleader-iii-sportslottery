<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Navigation</title>
</head>
<style>
.navbar-login
{
    width: 280px;
    padding: 10px;
    padding-bottom: 0px;
}

.navbar-login-session
{
    padding: 10px;
    padding-bottom: 0px;
    padding-top: 0px;
}

.btn-xs
{
	height: 20px;
}

.label,.glyphicon 
{
	 margin-right:5px; 
}
.label-info
{
	display:inline-block;
	width:120px;
}
.label-danger,.label-success
{
	display:inline-block;
	width:100px;
}

.login-error,.forgetPass
{
	color: red;
}
#coins
{
	size:100;
}
#forgetImg
{
	display:none
}
.forgetLable
{
	width:150px;
	margin-left:17px;
}
.loginFont
{
	font-family: 微軟正黑體;
	font-weight:bolder;
}
#forgetSumbit
{
	margin-left:17px;
}

#errorMsgLottery{
	display:none;
}
</style>


<body>
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		<div class="container-fluid">
		<!-- 摺疊書籤 -->
	        <div class="navbar-header">
	
	                <a class="navbar-brand" href='<c:url value="/welcome"/>'>Sports Lottery Mania</a>
	                <span id="digiclock" class="hidden-xs" style="float:left;"></span>
	                       
	        <script type="text/javascript">
	            $(document).ready(function() {
	                $('#digiclock').jdigiclock();
	            });
	        </script>
	        
	            <button type="button" class="navbar-toggle navbar-right" data-toggle="collapse"
	                data-target=".navbar-responsive-collapse.userinfo">
	                <span class="icon-bar"></span> 
	                <span class="icon-bar"></span>
	                <span class="icon-bar"></span>
	            </button>
	            <span class="navbar navbar-toggle" data-toggle="collapse" >
	                <button class="btn btn-hot game">賽事</button>
	                <button class="btn btn-sunny history">歷史</button>
	                <button class="btn btn-sky user">使用者</button>
	                <button class="btn btn-tree lotteryBoard simple-menu">投注</button>
	            </span>              
	            
	        </div>
        
            <div class="navbar-collapse collapse navbar-responsive-collapse userinfo">                
                <!-- 登入後 -->
	            <c:if test="${ not empty user }">
		            <ul class="nav navbar-nav navbar-right">
		            	<li class="dropdown">
		            		<a href="#" class="dropdown-toggle coins" data-toggle="dropdown">
								<span class="glyphicon glyphicon-usd" id="userCoins"></span><span class="left5">${user.coins}</span> 
							</a>
		            	</li>
						<li class="dropdown">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">
								<span class="glyphicon glyphicon-comment"></span><span class="left5">最新投注<span class="caret"></span></span> 
							</a>
							<ul class="dropdown-menu" id="newOdds">
							</ul>
						</li>
						<li class="dropdown">
						<!--  系統訊息區
			            	<a href="/goIndex"class="dropdown-toggle" data-toggle="dropdown">
			                	<span class="badge pull-right">42</span>
		   				 		<span class="glyphicon glyphicon-envelope"></span>
			                </a>
			            -->
			               	<ul class="dropdown-menu">
			               		<li>系統訊息</li>
				                <li class="divider"></li>
				                <li><a href="#"></a></li>
				                <li class="divider"></li>
				                <li><a href="#">連結2</a></li>
				                <li class="divider"></li>
				            	<li><a href="#">連結3</a></li>
				            </ul>
		                </li> 
		            
		                <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		                        <span class="glyphicon glyphicon-user"></span>
		                        <span>${user.userAccount}<span class="caret"></span></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <li>
		                            <div class="navbar-login">
		                            	<div class="row">
		                                   	<div class="col-sm-4">
		                                   		<p class="text-left"><strong>${user.userName}</strong></p>
		                                   	</div>          
		                                   	<div class="col-sm-8">
		                                   		<button type="button" id="goUser" class="btn-primary btn-sm" data-dismiss="modal">個人資料</button>
		                                   	</div>                                                           
		                            	</div>
		                            	
		                                <div class="row top20">
		                                   	<div class="col-sm-4">
		                                   		<c:if test="${user.userState!='0'}">
 		                                   			<a id="goVerify" href="#"><p style="color:red"><strong>未認證</strong></p><a>         
		                                   		</c:if>                                   		
		                                   	</div>
		                                    
		                                    <div class="col-sm-8">
		                                        <p class="text-left small">${user.userEmail}</p>
		                                    	<p class="text-left small">${user.userPhone}</p>
		                                    	<p class="text-left small glyphicon glyphicon-usd"><span class="left5">${user.coins}</span></p>
		                                    </div>
		                                </div>
		                            </div>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <div class="navbar-login navbar-login-session">
		                                <div class="row">
		                                    <div class="col-sm-12">
		                                        <p>
		                                            <a href="<c:url value="/Security/Result/logout.jsp"/>" class="btn btn-danger btn-block">登出</a>
		                                        </p>
		                                    </div>
		                                </div>
		                            </div>
		                        </li>
		                    </ul>
		                </li>
		            </ul>
	        	</c:if>
	        	<!--登入前 -->
	            <c:if test="${ empty user }">
		            <ul class="nav navbar-nav navbar-right" >
		            	<li>
		            		<a href="#" id="toLogin" data-toggle="modal" data-target="#myModal">
		                        <span class="glyphicon glyphicon-user"></span>
		                        <strong>登入</strong>
		                    </a>
		            	</li>
		            </ul>
	            </c:if>
	            <div class="nav navbar-nav navbar-center hidden-xs">
	            	<button type="button" class="btn btn-hot text-uppercase btn-lg game">
	            		賽事投注
	            	</button>
	                <button type="button" class="btn btn-sunny text-uppercase btn-lg history">
	                	歷史紀錄
	                </button>
	                <button type="button" class="btn btn-sky text-uppercase btn-lg user">
	                	使用者投注資訊
	                </button>
	                <button type="button" class="btn btn-right btn-tree text-uppercase btn-lg lotteryBoard simple-menu">
	                	顯示投注區
	                </button>
	            </div>
	        </div>
			<!-- 登入區結束 -->
        </div>
	</div>
	<!--登入頁面 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" id="close2" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
					<h3 class="loginFont">全民瘋運彩</h3>
				</div>
				<div class="modal-body">
					<div id="errorMsgLottery" class="alert alert-danger" role="alert">${errorMsgLottery}<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></div>
					<form method="post" action="" name="login_form">
						<p>
							<input type="text" class="input-sm" name="model.userAccount" id="loginAccount"
								placeholder="帳號" autofocus>
						</p>
						<p>
							<input type="password" class="input-sm" name="userPassword" id="loginPassword"
								placeholder="密碼">
						</p>
						<p>
							<button type="button" id="login" class="btn btn-primary">登入</button>
							<a href="#" id="forgetPass">忘記密碼</a>
							<div id="loginError" class="login-error"></div>
						</p>
					</form>
				</div>
				<div class="modal-footer">
					還沒有成為會員? <a href="#" id="regist" class="btn btn-primary" data-dismiss="modal">註冊</a>
				</div>
			</div>
		</div>
	</div>
	<!--忘記密碼 -->
	<div class="modal fade" id="myModal2">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;<span class="sr-only">Close</span></button>
					<h3 class="loginFont">馬上找回您寶貝的密碼</h3>
				</div>
				
				<div class="modal-body">
					<form role="form">
					 	<div class="form-group">
					    	<label for="forgetAccount" class="forgetLable">輸入您註冊的帳號:</label>
					    	<input class="input-sm" type="text" id="forgetAccount"/><br/>
					  	</div>
					  	<div class="form-group">
					    	<label for="forgetEmail" class="forgetLable">輸入您註冊的Email:</label>
					    	<input class="input-sm" type="text" id="forgetEmail"/><br/>
					  	</div>
					</form>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" id="forgetSumbit" data-loading-text="發信中...">確認送出</button>
					<span class="forgetPass"></span>
				</div>
			</div>
		</div>
	</div>
	<div id="dialog-forget" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<img src="images/success.png">
					<h4>
						<span id="forgetSuccess">密碼已寄至您信箱 請速收信</span>
					</h4>
				</div>
			</div>
		</div>
	</div>
	
	<script>
(function($) {
	var str = "";
	
	//檢查此次訊息是不是已經顯示過
	var errorTokenHasDone = false;
	if(sessionStorage.seerorToken == '${errorToken}'){
		//此次訊息已重複
		errorTokenHasDone = true;
	}else{
		sessionStorage.seerorToken = '${errorToken}';
		errorTokenHasDone = false;
	}
	var errorMsg;
	if(!errorTokenHasDone && ${not empty errorMsgLottery}){
		<c:if test="${mustBeLogin == 'true'}">callMyModal()</c:if>
		errorMsg = '${errorMsgLottery}';
		$('#errorMsgLottery').show();
	}
	function callMyModal(){
    	$('#myModal').modal('show');
    }
	
	$('#forgetPass').off('click');
	$('#forgetPass').on('click',function() {
		$('#close2').click();
		//$('#myModal').modal('hide');
		$('#myModal2').modal('show');
		setTimeout("$('#forgetAccount').focus()" ,500);
	});
	
	$('#toLogin').off('click');
	$('#toLogin').on('click',function() {
		$(window).off('resize');
		$('#loginError').html('');
		setTimeout('$("#loginAccount").focus()' ,200);
		
	});
			
	$('#goUser').off('click');
	$('#goUser').on('click',function() {
		$("#target").load('<c:url value="/MustBeUser/memberInfo.jsp"/>');
	});
	
	$('#regist').off('click');
	$('#regist').on('click',function() {
		$("#target").load('<c:url value="/Security/signUp.jsp"/>');
	});
			
	$('#login').off('click');
	$('#login').on('click',function() {
		
		$.ajax({
	   		url:"<c:url value='/checkLogin'/>",
			type:"get",
			data:{
				'model.userAccount': $('#loginAccount').val(),
				userPassword: $('#loginPassword').val()
			},
			success: function(data) {
				if(data=="success") {
					document.location.href="<c:url value='/goIndex'/>";	
				}else {
					$('#loginError').html('帳號或密碼有誤');
				}
			}
		});
	});
	$.ajax({
		url:'<c:url value="/userOdds?method:getNewestLotterys" />',
		type:'post',
		dataType:'json',
		success:function(datas){
			var count = 0;			
			$.each(datas, function(index,data) {
				//console.log(data);
				if(data.com1!=null && data.com2==null && data.com3==null && 
						data.com4==null && data.com5==null && data.com6==null && 
						data.com7==null && data.com8==null && data.com==null) {
					
					data.play = "單場";
				   
				} else if(data.com1==null && data.com2==null && data.com3==null && 
						data.com4==null && data.com5==null && data.com6==null && 
						data.com7==null && data.com8==null && data.com0!=null) {
						  
						data.play = "過關";
						  
				} else if(data.com2!=null || data.com3!=null || data.com4!=null || data.com5!=null ||
						data.com6!=null || data.com7!=null || data.com8!=null) {
						  
						data.play = "過關組合";
				}
				var lottery = {};
				lottery.date = millisecondToDate(data.confirmTime.iLocalMillis);
				//計算投注組合數
				var betcount = 0;
				if(data.com0!=null){
					betcount = 1;
				}else{
					if(data.com1!=null) {
	                    betcount+=cngm((data.lotteryOdds).length,1);
	                }
	                
	                if(data.com2!=null) {
	                    betcount+=cngm((data.lotteryOdds).length,2);
	                }
	                
	                if(data.com3!=null) {
	                    betcount+=cngm((data.lotteryOdds).length,3);
	                }
	                
	                if(data.com4!=null) {
	                    betcount+=cngm((data.lotteryOdds).length,4);
	                }
	                
	                if(data.com5!=null) {
	                    betcount+=cngm((data.lotteryOdds).length,5);
	                }
	                
	                if(data.com6!=null) {
	                    betcount+=cngm((data.lotteryOdds).length,6);
	                }
	                
	                if(data.com7!=null) {
	                    betcount+=cngm((data.lotteryOdds).length,7);
	                }
	                
	                if(data.com8!=null) {
	                    betcount+=cngm((data.lotteryOdds).length,8);
	                };
					
				}
				
				if(data.play == "過關組合" || data.play == "單場") {
					if(data.win>=0 && count<3) {
						str+= "<li><a href='#' class='allOdds' ><span class='label label-warning'>下注時間:"+ lottery.date +"</span><span class='label label-info'>下注金額:" + data.capital*betcount + 
						"</span><span class='label label-success'>獎金:"+ data.win +"</span></a></li>";
					} else if(count<3){
						str+= "<li><a href='#' class='allOdds' ><span class='label label-warning'>下注時間:"+ lottery.date +"</span><span class='label label-info'>下注金額:" + data.capital*betcount + 
						"</span><span class='label label-danger'>獎金:未開獎 </span></a></li>";
					}
					count++;
				} else {
					if(data.win>=0 && count<3) {
						str+= "<li><a href='#' class='allOdds' ><span class='label label-warning'>下注時間:"+ lottery.date +"</span><span class='label label-info'>下注金額:" + data.capital + 
						"</span><span class='label label-success'>獎金:"+ data.win +"</span></a></li>";
					} else if(count<3){
						str+= "<li><a href='#' class='allOdds' ><span class='label label-warning'>下注時間:"+ lottery.date +"</span><span class='label label-info'>下注金額:" + data.capital + 
						"</span><span class='label label-danger'>獎金:未開獎 </span></a></li>";
					}
					count++;
				}
				
			});
			$('#newOdds').append(str+= "<li class='divider'></li><li><a href='#' class='text-center allOdds'>所有投注</a></li>");
			$('.allOdds').off('click');
			$('.allOdds').on('click',function() {
				console.log('all check');
				<c:if test="${user.userState!='0'}">
					<c:if test="${not empty user}">
						hasLocking = true;
					</c:if>	
				</c:if>
				if(hasLocking){
					$("#target").load('<c:url value="/Security/signUp.jsp"/>');
				}else{
					$("#target").load('<c:url value="/Security/userOddsSearch.jsp"/>');
				}
			});
		},
		async:false
	});//ajax
	
	/*	function fadeOut() {
	    $('#coins').fadeOut(500, fadeIn);
	};
	function fadeIn() {
	    $('#coins').delay(500).fadeIn(500, fadeOut);
	};
	fadeOut();
	*/
	$('.coins').off('click');
	$('.coins').on('click',function() {
		console.log('coins...');
		<c:if test="${user.userState=='0'}">
			$("#target").load('<c:url value="/Security/coins.jsp"/>');
		</c:if>
		<c:if test="${user.userState!='0'}">
			$('#goVerify').trigger('click');
		</c:if>
	});

	$('#myModal').keyup(function() {
		if($('#loginAccount').val()!='' && $('#loginPassword').val()!='') {
			if(event.keyCode == 13) {
				$("#login").click();
			}
		}
	});
	
	$('#myModal2').keyup(function() {
		if($('#forgetAccount').val()!='' && $('#forgetEmail').val()!='') {
			if(event.keyCode == 13) {
				$("#forgetSumbit").click();
			}
		}
	});
	
	//忘記密碼
	$('#forgetSumbit').off('click');
	$('#forgetSumbit').on('click',function() {
		$('.forgetPass').empty();
		var btn = $(this);
		$('#forgetAccount').addClass('disable');
		$('#forgetEmail').addClass('disable');
		btn.button('loading');
		if($('#forgetAccount').val()!='' && $('#forgetEmail').val()!=''){
			$.ajax({
				url:"<c:url value='/emailer'/>",
				type:'post',
				data:{
					account:$('#forgetAccount').val(),
					to:$('#forgetEmail').val(),
				},
				success:function(data) {
					if(data=="success"){
						console.log(data);
						$('.forgetPass').empty();
						$('#myModal2').modal('hide');
						$('#dialog-forget').modal({
							backdrop: 'static',
							keyboard: false
						});
						setTimeout('document.location.href="<c:url value='/goIndex'/>"' ,3000);
					} else {
						$('.forgetPass').empty();
						$('.forgetPass').append(data);
					}
					
				},
				beforeSend:function() {
					
				},
	            complete:function() {
	            	btn.button('reset');
	            }
			});
		} else {
			$('.forgetPass').text("欄位不可空白");
		}
	});
	
	$('#goVerify').on('click',function() {
		$("#target").load('<c:url value="/Security/signUp.jsp"/>');
	});
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
})(jQuery); 
</script>
<script type="text/javascript">
    $(window).on('load', function(){
		<c:if test="${user.userState!='0'}">
			<c:if test="${not empty user}">
				hasLocking = true;
			</c:if>	
		</c:if>
    	$('.simple-menu').sidr();
    });
    $('.game').off('click');
  	$('.game').on('click',function() {		
  		$("#target").load('<c:url value="/Event/test-events.jsp"/>');
 	});
  	$('.history').off('click');
	$('.history').on('click',function() {
		$("#target").load('<c:url value="/History/historyComplex.jsp"/>');
	});
	$('.user').off('click');
	$('.user').on('click',function() {
		if(hasLocking){
			sessionStorage.hasLocated = 'locking';
			window.location.href = '<c:url value="/"/>';
		}else{
			$("#target").load('<c:url value="/Security/userOddsSearch.jsp"/>');
		}
	});
	$('.lotteryBoard').off('click');
	$('.lotteryBoard').on('click',function() {
		odds_refresh();
	});
	
</script>

</body>
</html>