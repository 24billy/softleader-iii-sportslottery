<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<title>Insert title here</title>
<style>
body
{ 
	margin-top:20px;
	padding-top:20px
}
.coin
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
.p2
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
                		<tr class="success money">
                			<td>100元</td>
                			<td>100虛幣</td>
                			<td><button type="button" class="btn btn-primary" value="100">購買</button></td>
                		</tr>
                		<tr class="money">
                			<td>500元</td>
                			<td>500虛幣</td>
                			<td><button type="button" class="btn btn-primary" value="500">購買</button></td>
                		</tr>
                		<tr class="success money">
                			<td>1000元</td>
                			<td>1000虛幣</td>
                			<td><button type="button" class="btn btn-primary" value="1000">購買</button></td>
                		</tr>
                		<tr class="money">
                			<td>2000元</td>
                			<td>2000虛幣</td>
                			<td><button type="button" class="btn btn-primary" value="2000">購買</button></td>
                		</tr>
                		<tr class="success money">
                			<td>5000元</td>
                			<td>5000虛幣</td>
                			<td><button type="button" class="btn btn-primary" value="5000">購買</button></td>
                		</tr>
                	</tbody>
                </table>
            </div>
        </div>
    </div>
    <div class="row setup-content" id="step-2">
        <div class="col-xs-12">
            <div class="col-md-10 well">
            	<span><h1 class="p2"><strong class="coinType"></strong>元虛幣</h1>
        		<span class="p2-1"><h1>合計
                <strong class="coinType"></strong>元</h1></span>
                </span>
            </div>
            
			<div class="container">
				<div class="pricing-table pricing-three-column row">
					<div class="plan col-sm-4 col-lg-4">
						<div class="plan-name-bronze">
							<h2>超商繳款</h2>
						</div>
						<ul>
							
							<li class="plan-feature">
							<button id="activate-step-3" class="btn btn-primary btn-lg">Select</button>
							</li>
						</ul>
					</div>
					<div style="z-index: 55;" class="plan col-sm-4 col-lg-4">
						<div class="plan-name-silver">
							<h2>Card點數</h2>
						</div>
						<ul>
							
							<li class="plan-feature">
							<button id="activate-step-4" class="btn btn-primary btn-lg">Select</button>
							</li>
						</ul>
					</div>
					<div class="plan col-sm-4 col-lg-4">
						<div class="plan-name-gold">
							<h2>ATM轉帳</h2>
						</div>
						<ul>
							
							<li class="plan-feature">
							<button id="activate-step-5" class="btn btn-primary btn-lg">Select</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
        </div>
    </div>
    <div class="row setup-content" id="step-3">
        <div class="col-xs-12">
            <div class="col-md-12 well text-center">
                <h1 class="text-center"> STEP 3</h1>
                <button id="activate-step-6" class="btn btn-primary btn-lg">Finish</button>
            </div>
        </div>
    </div>
</div>
<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
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
	$('.btn').on('click', function(e) {
    	$('ul.setup-panel li:eq(1)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-2"]').trigger('click');
    	$('.coinType').text($(this).val());
    	sessionStorage.coinBuy = $(this).val();
    	console.log(sessionStorage.coinBuy*1+100);
    	
	});
	
	$('#activate-step-3').on('click', function(e) {
    	$('ul.setup-panel li:eq(2)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-3"]').trigger('click');
    	
	});
	
	$('#activate-step-4').on('click', function(e) {
    	$('ul.setup-panel li:eq(2)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-3"]').trigger('click');
    	
	});
	
	$('#activate-step-5').on('click', function(e) {
    	$('ul.setup-panel li:eq(2)').removeClass('disabled');
    	$('ul.setup-panel li a[href="#step-3"]').trigger('click');
    	
	});

})(jQuery);

</script>
</body>
</html>