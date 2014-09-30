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
.ul-li-q
{
	list-style-type:none;
	list-style-image:url(images/Q.gif);
	font-size:0.5cm;
	color:#000000;
	font-weight:bolder;
	list-style-position:outside;
}

.ul-li-a
{
	list-style-type:none;
	list-style-image:url(images/A.gif);
	font-size:0.5cm;
	color:#585858;
	font-weight:bolder;
	list-style-position:outside;
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
                			<td style='vertical-align:middle'>100元</td>
                			<td style='vertical-align:middle'>100虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="100"><span class="left5">購買</span></button></td>
                		</tr>
                		<tr class="bg-success money">
                			<td style='vertical-align:middle'>500元</td>
                			<td style='vertical-align:middle'>500虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="500"><span class="left5">購買</span></button></td>
                		</tr>
                		<tr class="bg-success money">
                			<td style='vertical-align:middle'>1000元</td>
                			<td style='vertical-align:middle'>1000虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="1000"><span class="left5">購買</span></button></td>
                		</tr>
                		<tr class="bg-success money">
                			<td style='vertical-align:middle'>2000元</td>
                			<td style='vertical-align:middle'>2000虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="2000"><span class="left5">購買</span></button></td>
                		</tr>
                		<tr class="bg-success money">
                			<td style='vertical-align:middle'>5000元</td>
                			<td style='vertical-align:middle'>5000虛幣</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn2" value="5000"><span class="left5">購買</span></button></td>
                		</tr>
                		<tr class="bg-danger money">
                			<td style='vertical-align:middle'>Card點數</td>
                			<td style='vertical-align:middle'>Card點數</td>
                			<td><button type="button" class="btn btn-primary glyphicon glyphicon-shopping-cart btn3" value="5000"><span class="left5">加值</span></button></td>
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
					<div class="plan col-sm-6 col-lg-6">
						<div class="plan-name-bronze">
							<h2>ATM轉帳</h2>
						</div>
						<ul>
							<li class="plan-feature">
							<button id="activate-step-3" class="btn btn-primary btn-lg" >Select</button>
							</li>
						</ul>
					</div>
					<div style="z-index: 55;" class="plan col-sm-6 col-lg-6">
						<div class="plan-name-silver">
							<h2>超商繳款</h2>
						</div>
						<ul>
							<li class="plan-feature">
							<button id="activate-step-4" class="btn btn-primary btn-lg" >Select</button>
							</li>
						</ul>
					</div>
					<!--  
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
					-->
				</div>
			</div>
        </div>
    </div>
    <div class="row setup-content" id="step-3" >
        <div class="col-sm-12 col-xs-12">
            <div class="well col-sm-12 col-xs-12">
                <table class="table text-center table1">
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
               	 <table class="table text-center table2">
                	<thead>
                		<tr class="bg-danger money">
                			<th class="pay">付款方式</th>
                			<th class="pay">付款說明</th>
                		</tr>
                	</thead>
                	<tbody>
                		<tr class="bg-success money">
                			<td class="payType"></td>
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
               		<div>
                		<input class="finish" type="text" name="coins">
                		<button class="btn btn-success btn-lg payWay-1-2">Finish</button>
               	 	</div>
                </div>
                <div id="payWay2">
               		<div class="topWay">超商繳款操作步驟</div>
                    	<div class="payWay2-1">
                        	<div class="fourWay">
                            	<button value="p1" class="btn btn-info btn-lg marketbut active">7-11 ibon</button><br>
                                <button value="p2" class="btn btn-info btn-lg marketbut">全家Famiport</button><br>
                                <button value="p3" class="btn btn-info btn-lg marketbut">萊爾富Life-ET</button><br>
                                <button value="p4" class="btn btn-info btn-lg marketbut">OK超商OK-GO</button>
                            </div>
                            <div id="fourWay-main" style="background-color:white">
                                <div class="p1 p market"><img src="images/ibonPayway.jpg" alt="7-11 ibon操作方式"/></div>
                                <div class="p2 p market"><img src="images/famiportpayl.jpg" alt="全家Famiport操作方式"/></div>
                                <div class="p3 p market"><img src="images/LifeET_pay_L.jpg" alt="萊爾富Life-ET"/></div>
                                <div class="p4 p market"><img src="images/ok-go_flow.jpg" alt="OK超商OK-GO"/></div>
                            </div>
                       </div>
                	<div>
                		<input class="finish" type="text" name="coins">
                		<button class="btn btn-success btn-lg payWay-1-2">Finish</button>
               	 	</div>
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
       							<h4>加值<span id="addCoins"></span>虛幣成功  3秒後回首頁</h4>
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
	
	$('.btn3').on('click', function() {
		$('ul.setup-panel li:eq(2)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-3"]').trigger('click');
    	
    	$('.payType').text("Card點數");
    	$('.payMoney').text($(this).val()*1);
    	$('.table1').hide();
    	$('.table2').show();
    	$('#payWay1').hide();
    	$('#payWay2').hide();
    	$('#payWay3').show();
    	$('.account').html("繳款方式");
    	$('.numberCoins').html('請輸入卡片上卡號及密碼，並注意大小寫');
	});
	
	$('#activate-step-3').on('click', function(e) {
    	$('ul.setup-panel li:eq(2)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-3"]').trigger('click');
    	$('.table1').show();
    	$('.table2').hide();
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
    	$('.table1').show();
    	$('.table2').hide();
    	$('.payType').text("超商繳款");
    	$('.payMoney').text($(this).val());
    	$('#payWay1').hide();
    	$('#payWay2').show();
    	$('#payWay3').hide();
    	$('.p1').show();
    	$('.account').html("繳款編號");
    	$('.numberCoins').html('AB05 1017 3456 7890');
    	//$('.finish').val($(this).val());
	});
	
	$('.fourWay button').click(function() {
		$('.fourWay button').removeClass('active');
		$(this).addClass('active');
		$('.p').hide();
        $('#fourWay-main div.' + $(this).val()).show();
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
				console.log(data);
				if(data.indexOf('error') == -1) {
					
					$('#dialog-coins').modal({
						backdrop: 'static',
						keyboard: false
					});
					$('#addCoins').text(data);
					setTimeout('document.location.href="<c:url value='/goIndex'/>"' ,3000);
					
				} else {
					data = data.replace('error ', '');
					if($('#cardAccount').val()=='' || $('#cardAccount').val()=='') {
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
			$('.coins-error').empty();
			$(element).closest('.control-group').removeClass('success').addClass('error');
		}
	});

	$('.payWay-1-2').click(function() {
		document.location.href="<c:url value='/goIndex'/>";
	});
	
})(jQuery);
</script>
</body>
</html>