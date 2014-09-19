<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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

.login-error
{
	color: red;
}
#coins
{
	size:100;
}
</style>


<body>
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
		
		<!-- 摺疊書籤 -->
        <div class="navbar-header">
            <a class="navbar-brand" href="/index.jsp">Sport Lottery</a>
                       
        
        
            <button type="button" class="navbar-toggle navbar-right" data-toggle="collapse"
                data-target=".navbar-responsive-collapse.userinfo">
                <span class="icon-bar"></span> 
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <span class="navbar navbar-toggle" data-toggle="collapse" >
                <button class="game">賽事</button>
                <button class="history">歷史</button>
                <button class="user">使用者</button>
                <button class="lotteryBoard simple-menu">投注</button>
            </span>
            
            
        </div>
        
        <div class="container-fluid">
            <div class="navbar-collapse collapse navbar-responsive-collapse userinfo">                
                <!-- 登入後 -->
	            <c:if test="${ not empty user }">
		            <ul class="nav navbar-nav navbar-right">
		            	<li class="dropdown">
		            		<a href="#" class="dropdown-toggle coins" data-toggle="dropdown">
								<span class="glyphicon glyphicon-usd">${user.coins} </span> 
							</a>
		            	</li>
						<li class="dropdown">
							<a href="/index.jsp" class="dropdown-toggle" data-toggle="dropdown">
								<span class="glyphicon glyphicon-comment">最新投注</span>  
							</a>
							<ul class="dropdown-menu" id="newOdds">
							</ul>
						</li>
						<li class="dropdown">
			            	<a href="/index.jsp"class="dropdown-toggle" data-toggle="dropdown">
			                	<span class="badge pull-right">42</span>
		   				 		<span class="glyphicon glyphicon-envelope"></span>
			                </a>
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
		                    <a href="/index.jsp" class="dropdown-toggle" data-toggle="dropdown">
		                        <span class="glyphicon glyphicon-user"></span>
		                        <strong>${user.userAccount}</strong>
		                        <span class="glyphicon glyphicon-chevron-down"></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <li>
		                            <div class="navbar-login">
		                            	<div class="row">
		                                   	<div class="col-sm-4">
		                                   		<p class="text-left"><strong>${user.userName}</strong></p>    
		                                   	</div>          
		                                   	<div class="col-sm-8">
		                                   		<button id="goUser" class="btn-primary btn-xs" data-dismiss="modal">個人資料</button>
		                                   	</div>                                                           
		                            	</div>
		                            	
		                                <div class="row">
		                                   	<div class="col-sm-4">                                   		
		                                   	</div>
		                                    
		                                    <div class="col-sm-8">
		                                        <p class="text-left small">${user.userEmail}</p>
		                                    	<p class="text-left small">${user.userPhone}</p>
		                                    	<p class="text-left small glyphicon glyphicon-usd">${user.coins}</p>
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
	        </div>


        </div>
        <!-- 登入區結束 -->
        <div class="navbar-collapse collapse navbar-responsive-collapse">
            <div class="row">
                <div class="navbar-header col-xs-8 col-xs-offset-4 col-sm-9 col-sm-offset-3">
                    <button type="button"
                        class="btn btn-hot text-uppercase btn-lg game"
                        >賽事投注</button>
                    <button type="button"
                        class="btn btn-sunny text-uppercase btn-lg history"
                        >歷史紀錄</button>
                    <button type="button"
                        class="btn btn-sky text-uppercase btn-lg user"
                        >使用者投注資訊</button>
                    <button
                            type="button"
                            class="btn btn-right btn-tree text-uppercase btn-lg lotteryBoard simple-menu"
                            >投注區</button>
                </div>
            </div>
        </div>        
	</div>
	<!--登入頁面 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<h3>全民瘋運彩</h3>
				</div>
				<div class="modal-body">
					<c:if test="${not empty errorMsg}"><div class="alert alert-danger" role="alert">${errorMsg}<button type="button" class="close" data-dismiss="alert"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button></div></c:if>
					<form method="post" action="" name="login_form">
						<p>
							<input type="text" class="span3" name="model.userAccount" id="loginAccount"
								placeholder="Account">
						</p>
						<p>
							<input type="password" class="span3" name="userPassword" id="loginPassword"
								placeholder="Password">
						</p>
						<p>
							<button type="button" id="login" class="btn btn-primary">登入</button>
							<a href="#">忘記密碼</a>
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

<script>

(function($) {
	var str = "";

	<c:if test="${mustBeLogin == 'true'}">callMyModal()</c:if>
	function callMyModal(){
    	$('#myModal').modal('show');
    	$('#loginError').html('您必須登入才能投注!!!');
    }
	
	$('#toLogin').click(function() {
		$('#loginError').html('');
		setTimeout('$("#loginAccount").focus()' ,200);
		
	});
			
	$('#goUser').click(function() {
		$("#target").load('<c:url value="/MustBeUser/memberInfo.jsp"/>');
	});
	
	$('#regist').click(function() {
		$("#target").load('<c:url value="/Security/singUp.jsp"/>');
	});
			
	$('#login').click(function() {
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
		url:'<c:url value="/userOdds?method:selectByUser" />',
		type:'post',
		dataType:'json',
		success:function(datas){
			var count = 0;
			$.each(datas, function(index,data) {
				console.log(data);
				var lottery = {};
				lottery.date = millisecondToDate(data.confirmTime.iLocalMillis);
				if(data.win>=0 && count<3) {
					str+= "<li><a href='#' class='allOdds' ><span class='label label-warning'>下注時間:"+ lottery.date +"</span><span class='label label-info'>下注金額:" + data.capital + 
					"</span><span class='label label-success'>獎金:"+ data.win +"</span></a></li>";
				} else if(count<3){
					str+= "<li><a href='#' class='allOdds' ><span class='label label-warning'>下注時間:"+ lottery.date +"</span><span class='label label-info'>下注金額:" + data.capital + 
					"</span><span class='label label-danger'>獎金:未開獎 </span></a></li>";
				}
				count++;
			});
			$('#newOdds').append(str+= "<li class='divider'></li><li><a href='#' class='text-center allOdds'>View All</a></li>");
		}
	});//ajax
	$(document).ajaxStop(function() {
		$('.allOdds').click(function() {
			console.log('all check');
			$("#target").load('<c:url value="/Security/userOddsSearch.jsp"/>');
		});
	});
	
	/*	function fadeOut() {
	    $('#coins').fadeOut(500, fadeIn);
	};
	function fadeIn() {
	    $('#coins').delay(500).fadeIn(500, fadeOut);
	};
	fadeOut();
	*/
	
	$('.coins').click(function() {
		console.log('coins...');
		$("#target").load('<c:url value="/Security/coins.jsp"/>');
	});

	$('#myModal').keyup(function() {
		if($('#loginAccount').val()!='' && $('#loginPassword').val()!='') {
			if(event.keyCode == 13) {
				$("#login").click();
			}
		}
	});
	
	
	
	
	
	
})(jQuery); 
</script>
</body>
</html>