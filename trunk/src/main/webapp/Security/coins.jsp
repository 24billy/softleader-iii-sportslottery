<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
 -->
<title>Insert title here</title>
<style>
body
{ 
	margin-top:20px;
	padding-top:20px
}
.coin,.pay,.card
{
	text-align:center;
	font-weight:900;
	font-family:新細明體;
	font-size:0.5cm;
}
.money
{
	font-size:0.5cm;
	font-weight:900;
}
.p2-0
{
	float:left;
}
.p2-1
{
	float:right;
}
.pricing-table .plan {
  margin-left:0px;
  border-radius: 5px;
  text-align: center;
  background-color: #f3f3f3;
  -moz-box-shadow: 0 0 6px 2px #b0b2ab;
  -webkit-box-shadow: 0 0 6px 2px #b0b2ab;
  box-shadow: 0 0 6px 2px #b0b2ab;
}
 
 .plan:hover {
  background-color: #fff;
  -moz-box-shadow: 0 0 12px 3px #b0b2ab;
  -webkit-box-shadow: 0 0 12px 3px #b0b2ab;
  box-shadow: 0 0 12px 3px #b0b2ab;
}
 
 .plan {
  padding: 20px;
  margin-left:0px;
  color: #ff;
  background-color: #5e5f59;
  -moz-border-radius: 5px 5px 0 0;
  -webkit-border-radius: 5px 5px 0 0;
  border-radius: 5px 5px 0 0;
}
  
.plan-name-bronze {
  padding: 20px;
  color: #fff;
  background-color: #665D1E;
  -moz-border-radius: 5px 5px 0 0;
  -webkit-border-radius: 5px 5px 0 0;
  border-radius: 5px 5px 0 0;
 }
  
.plan-name-silver {
  padding: 20px;
  color: #fff;
  background-color: #C0C0C0;
  -moz-border-radius: 5px 5px 0 0;
  -webkit-border-radius: 5px 5px 0 0;
  border-radius: 5px 5px 0 0;
 }
  
.plan-name-gold {
  padding: 20px;
  color: #fff;
  background-color: #FFD700;
  -moz-border-radius: 5px 5px 0 0;
  -webkit-border-radius: 5px 5px 0 0;
  border-radius: 5px 5px 0 0;
  } 
  
.pricing-table-bronze  {
  padding: 20px;
  color: #fff;
  background-color: #f89406;
  -moz-border-radius: 5px 5px 0 0;
  -webkit-border-radius: 5px 5px 0 0;
  border-radius: 5px 5px 0 0;
}
  
.pricing-table .plan .plan-name span {
  font-size: 20px;
}
 
.pricing-table .plan ul {
  list-style: none;
  margin: 0;
  -moz-border-radius: 0 0 5px 5px;
  -webkit-border-radius: 0 0 5px 5px;
  border-radius: 0 0 5px 5px;
}
 
.pricing-table .plan ul li.plan-feature {
  padding: 15px 10px;
  border-top: 1px solid #c5c8c0;
  margin-right: 35px;
}
 
.pricing-three-column {
  margin: 0 auto;
  width: 80%;
}
 
.pricing-variable-height .plan {
  float: none;
  margin-left: 2%;
  vertical-align: bottom;
  display: inline-block;
  zoom:1;
  *display:inline;
}
 
.plan-mouseover .plan-name {
  background-color: #4e9a06 !important;
}
 
.btn-plan-select {
  padding: 8px 25px;
  font-size: 18px;
}

.numberCoins
{
	color:red;
	font-size:0.5cm
}
.topWay
{
	color:#505050;
	font-size:0.6cm;
	font-weight:bolder;
	margin-bottom:15px;
	font-family: "微軟正黑體", "Microsoft JhengHei", "新細明體", "PMingLiU", "Arial", "Helvetica", "sans-serif";
}
.ul-li-q
{
	list-style-type:none;
	list-style-image:url(images/Q.gif);
	font-size:0.5cm;
	color:#000000;
	font-weight:bolder;
	
}

.ul-li-a
{
	list-style-type:none;
	list-style-image:url(images/A.gif);
	font-size:0.5cm;
	color:#585858;
	font-weight:bolder;
	
}

.word
{
	 display: inline-block;
	 margin-bottom:10px;
}

.p1,.p2,.p3,.p4
{
	display:none;
}

.myButton 
{
	background-color:#009933;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:arial;
	font-size:17px;
	padding:10px 70px;
	text-decoration:none;
	text-shadow:0px 0px 0px #2f6627;
	
}
.myButton:hover 
{
	background-color:#5cbf2a;
}
.myButton:active 
{
	position:relative;
	top:1px;
}
.marketbut
{
	display:inline-block;
	width:200px;
	opacity:0.5;
}
#fourWay-main
{
	width: 650px;
	float: right;
	position:static;
}
.fourWay
{
	float: left;
	width: 230px;
	position: relative;
}
.payWay2-1
{
	overflow:auto;
}
.active
{
	opacity:1;
}
.finish
{
	display:none;
}
.bg-danger
{
	margin-bottom:20px;
	border-radius:10px 10px 10px 10px;
	overflow:auto;
}
.container
{
	overflow:hidden;
}
#dialog-coins
{
	position:absolute;
  	top:80px;
}
.modal-content 
{
	background-color: #FFFFF0;
}
#deposit-form
{
	width:150%
}
#coins-error,.error
{
	color:red;
}
.way
{
	position:relative;
	left:300px;
  	
}
</style>
</head>
<body>
<div class="container">
	<div class="row form-group">
        <div class="col-xs-12">
            <ul class="nav nav-pills nav-justified thumbnail setup-panel">
                <li class="active">
                	<a href="#step-1">
                    	<h4 class="list-group-item-heading">Step 1</h4>
                    	<p class="list-group-item-text">選擇加值金額</p>
                	</a>
                </li>
                <li class="disabled">
                	<a href="#step-2">
                    	<h4 class="list-group-item-heading">Step 2</h4>
                    	<p class="list-group-item-text">選擇付款方式</p>
                	</a>
                </li>
                <li class="disabled">
                	<a href="#step-3">
                    	<h4 class="list-group-item-heading">Step 3</h4>
                    	<p class="list-group-item-text">完成交易</p>
                	</a>
                </li>
            </ul>
        </div>
	</div>
    <div class="row setup-content" id="step-1">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <table class="table table-hover">
                	<thead>
                		<tr>
                			<th class="coin">價格$NT</th>
                			<th class="coin">商品</th>
                			<th></th>
                		</tr>
                	</thead>
                	<tbody>
                		<tr class="bg-success money">
                			<td>100元</td>
                			<td>100虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="100">購買</button></td>
                		</tr>
                		<tr class="bg-info money">
                			<td>500元</td>
                			<td>500虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="500">購買</button></td>
                		</tr>
                		<tr class="bg-success money">
                			<td>1000元</td>
                			<td>1000虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="1000">購買</button></td>
                		</tr>
                		<tr class="bg-info money">
                			<td>2000元(適用Card點數)</td>
                			<td>2000虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="2000">購買</button></td>
                		</tr>
                		<tr class="bg-success money">
                			<td>5000元(適用Card點數)</td>
                			<td>5000虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="5000">購買</button></td>
                		</tr>
                	</tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-12 bg-danger">
            	<span><h1 class="p2-0"><strong class="coinType"></strong>元虛幣</h1>
        		<span class="p2-1"><h1>合計
                <strong class="coinType"></strong>元</h1></span>
                </span>
            </div>
            
			<div class="container">
				<div class="pricing-table pricing-three-column row">
					<div class="plan col-sm-4 col-lg-4">
						<div class="plan-name-bronze">
							<h2>ATM轉帳</h2>
						</div>
						<ul>
							<li class="plan-feature">
							<button id="activate-step-3" class="btn btn-primary btn-lg" >Select</button>
							</li>
						</ul>
					</div>
					<div style="z-index: 55;" class="plan col-sm-4 col-lg-4">
						<div class="plan-name-silver">
							<h2>超商繳款</h2>
						</div>
						<ul>
							<li class="plan-feature">
							<button id="activate-step-4" class="btn btn-primary btn-lg" >Select</button>
							</li>
						</ul>
					</div>
					<div class="plan col-sm-4 col-lg-4">
						<div class="plan-name-gold">
							<h2>Card點數</h2>
						</div>
						<ul>
							<li class="plan-feature">
							<button id="activate-step-5" class="btn btn-primary btn-lg" >Select</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
        </div>
    </div>
    <div class="row setup-content" id="step-3" >
        <div class="col-xs-12">
            <div class="col-md-12 well">
                <table class="table text-center">
                	<thead>
                		<tr>
                			<th class="pay">付款方式</th>
                			<th class="pay">付款金額</th>
                			<th class="pay">儲值虛幣</th>
                			<th class="pay account"></th>
                		</tr>
                	</thead>
                	<tbody>
                		<tr class="bg-danger money">
                			<td class="payType"></td>
                			<td><span class="payMoney"></span>元</td>
                			<td><span class="payMoney"></span>元虛幣</td>
                			<td class="numberCoins"></td>
                		</tr>
                	</tbody>
               	 </table>
               	 <div id="payWay1">
               	 	<ul class="ul-li-q ">
                		<li>付款之後，幾時會轉換成虛幣呢？</li>
                	</ul>
                	<ul class="ul-li-a">
                		<li>電腦24小時內自動對帳，正常會在付款後 5 - 15 分鐘內，自動存入您的虛幣帳戶。</li>
               		</ul>
               		<hr>
               		<ul class="ul-li-q">
                        <li>銀行ATM</li>
               		</ul>
               		<ul class="ul-li-a">
               			<li>選擇"其他服務"→選擇"跨行轉帳"→輸入銀行代號→輸入轉帳帳號(共16位)→輸入繳款金額→確認</li>
               		</ul>
               		<button class="btn btn-success btn-lg">Finish</button>
                </div>
                <div id="payWay2">
               		<div class="topWay">超商繳款操作步驟</div>
                    	<div class="payWay2-1">
                        	<div class="fourWay">
                            	<a href="#" rel="p1" class="btn btn-info btn-lg marketbut active">7-11 ibon</a><br>
                                <a href="#" rel="p2" class="btn btn-info btn-lg marketbut">全家Famiport</a><br>
                                <a href="#" rel="p3" class="btn btn-info btn-lg marketbut">萊爾富Life-ET</a><br>
                                <a href="#" rel="p4" class="btn btn-info btn-lg marketbut">OK超商OK-GO</a>
                            </div>
                            <div id="fourWay-main" style="background-color:white">
                                <div class="p1 p market"><img src="images/ibonPayway.jpg" alt="7-11 ibon操作方式"/></div>
                                <div class="p2 p market"><img src="images/famiportpayl.jpg" alt="全家Famiport操作方式"/></div>
                                <div class="p3 p market"><img src="images/LifeET_pay_L.jpg" alt="萊爾富Life-ET"/></div>
                                <div class="p4 p market"><img src="images/ok-go_flow.jpg" alt="OK超商OK-GO"/></div>
                            </div>
                       </div>
                	<form action="<c:url value="/coinsUpdate" />" method="post">
                		<input class="finish" type="text" name="coins">
                		<button class="btn btn-success btn-lg">Finish</button>
               	 	</form>
                </div>
                <div class="way" id="payWay3">
                <form id="deposit-form">
                	<div class="col-xs-3">
						<label for="cardAccount" class="card">卡號</label> 
						<input class="form-control" type="text" id="cardAccount" name="cardAccount" placeholder="請輸入卡號">
						<br>
						<label for="cardPassword" class="card">密碼</label>
						<input class="form-control" type="password" id="cardPassword" name="cardPassword" placeholder="請輸入密碼"><br>
						<button class="btn btn-success addMoney">確認送出</button>
						<span class="coins-error"></span>
					</div>
				</form>
				</div>
				<!-- dialog -->
				<div id = "dialog-coins" class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" 
						aria-labelledby="myLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-sm">
						<div class="modal-content">
							<div class="modal-body">
								<img src="images/success.png">
       							<h4>加值成功 3秒後自動跳轉</h4>
      						</div>
						</div>
					</div>
				</div>
            </div>
        </div>
    </div>
</div>
<!--  
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
-->
<script>
(function($){
	var navListItems = $('ul.setup-panel li a'),
    allWells = $('.setup-content');
	allWells.hide();

	$('ul.setup-panel li a').click(function(e) {
    	e.preventDefault();
    	var $target = $($(this).attr('href')),
       		$item = $(this).closest('li');

    	if (!$item.hasClass('disabled')) {
        	navListItems.closest('li').removeClass('active');
        	$item.addClass('active');
        	allWells.hide();
        	$target.show();
    	}
    	
	});

	$('ul.setup-panel li.active a').trigger('click');
	
	// DEMO ONLY //
	$('.btn2').on('click', function(e) {
    	$('ul.setup-panel li:eq(1)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-2"]').trigger('click');
    	$('.coinType').text($(this).val());
    	//sessionStorge
    	sessionStorage.coinBuy = $(this).val();
    	console.log(sessionStorage.coinBuy*1);

    	$('#activate-step-3').val($(this).val());
    	$('#activate-step-4').val($(this).val());
    	$('#activate-step-5').val($(this).val());
    	
    	if($('#activate-step-5').val() == 100 || $('#activate-step-5').val() == 500 || 
    	   $('#activate-step-5').val() == 1000) {
    		$('#activate-step-5').addClass('disabled');
    	} else if ($('#activate-step-5').hasClass('disabled')) {
    		$('#activate-step-5').removeClass('disabled');
    	}
    	
	});
	
	$('#activate-step-3').on('click', function(e) {
    	$('ul.setup-panel li:eq(2)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-3"]').trigger('click');
    	$('.payType').text("ATM轉帳");
    	$('.payMoney').text($(this).val());
    	$('#payWay1').show();
    	$('#payWay2').hide();
    	$('#payWay3').hide();
    	$('.account').html("轉帳帳號");
    	$('.numberCoins').html('1234 5678 8765 4321');
    	
	});
	
	$('#activate-step-4').on('click', function(e) {
    	$('ul.setup-panel li:eq(2)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-3"]').trigger('click');
    	$('.payType').text("超商繳款");
    	$('.payMoney').text($(this).val());
    	$('#payWay1').hide();
    	$('#payWay2').show();
    	$('#payWay3').hide();
    	$('.p1').show();
    	$('.account').html("繳款編號");
    	$('.numberCoins').html('AB05 1017 3456 7890');
    	$('.finish').val($(this).val());
	});
	
	$('#activate-step-5').on('click', function(e) {
    	$('ul.setup-panel li:eq(2)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-3"]').trigger('click');
    	$('.payType').text("Card點數");
    	$('.payMoney').text($(this).val()*1);
    	$('#payWay1').hide();
    	$('#payWay2').hide();
    	$('#payWay3').show();
    	$('.account').html("繳款方式");
    	$('.numberCoins').html('請輸入卡號密碼');
    	
	});
	
	$('.fourWay a').click(function() {
		$('.fourWay a').removeClass('active');
		$(this).addClass('active');
		$('.p').hide();
        $('#fourWay-main div.' + $(this).attr('rel')).show();
	});
	
	
	
	$('.addMoney').click(function() {
		$.ajax({
			url:"<c:url value='/coinsUpdate'/>",
			type:'post',
			data:{
				'cardAccount' :$('#cardAccount').val(),
				'cardPassword':$('#cardPassword').val(),
			},
			success:function(data) {
				console.log($('#cardAccount').val() + ":" + $('#cardPassword').val());
				console.log(data);
				if(data == 'success') {
					$('#dialog-coins').modal({
						backdrop: 'static',
						keyboard: false
					});
					setTimeout('document.location.href="<c:url value='/goIndex'/>"' ,3000);
					
				} else {
					if($('#cardAccount').val()=='' && $('#cardAccount').val()=='') {
						$('.coins-error').empty();
					} else {	
 						$('.coins-error').empty();
	  					$('.coins-error').append('<span id="coins-error">'+ data +'</span>');
					}
				}
			}
		});
	});
	
	$('#deposit-form').validate({
		debug: true,
		rules: {
			cardAccount: {
				required: true,
			},
			cardPassword: {
				required: true,
			}
		},
		highlight: function(element) {
			console.log("fail");
			
			$(element).closest('.control-group').removeClass('success').addClass('error');
		}
	});
	
})(jQuery);
</script>
</body>
</html>