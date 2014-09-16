<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<style>
.error {
	color: red;
}
.jumbotron {
	background: #358CCE;
	color: #FFF;
	border-radius: 0px;
}
.jumbotron-sm { padding-top: 24px;
	padding-bottom: 24px; }
.jumbotron small {
	color: #FFF;
}
.h1 small {
	font-size: 24px;
}
.progress {    
    position: relative;
    height: 25px;
}
.progress > .progress-type {
    position: absolute;
    left: 0px;
    font-weight: 800;
    padding: 3px 30px 2px 10px;
    color: rgb(255, 255, 255);
    background-color: rgba(25, 25, 25, 0.2);
}
.progress > .progress-completed {
    position: absolute;
    right: 0px;
    font-weight: 800;
    padding: 3px 10px 2px;
}
.step {
	text-align: center;
}
.step .col-md-2:hover {
    color: #F58723;
    cursor: pointer;
}
.step .activestep {
    color: #F58723;
    height: 80px;
    margin-top: -7px;
    padding-top: 7px;
    border-left: 6px solid #5CB85C !important;
    border-right: 6px solid #5CB85C !important;
    border-top: 3px solid #5CB85C !important;
    border-bottom: 3px solid #5CB85C !important;
    vertical-align: central;
}

.step .fa {
    padding-top: 15px;
    font-size: 40px;
}
.infot {
	color: #c0c0c0;
	float:left;
}
#page2 {
	display: none;
}
#page3 {
	display: none;
}
#sigUp-body {
	text-align:center;
}

</style>

<body>
<BR>
	<div id="sigUp-body">
		<div id="page1">
			<h1>條約內容</h1>
			<button id="agree">我同意</button>
			<button id="agree">不同意</button>
		</div>
		<div id="page2"><!-- 
			<div class="jumbotron jumbotron-sm">
				<div class="container">
					<div class="row">
						<div class="col-sm-12 col-lg-12">
							<h1 class="h1">
								小賭怡情,大賭養家 <small>希望無窮</small>
							</h1>
						</div>
					</div>
				</div> 
			</div>-->

			<div class="container">
				<div class="row">
					<div class="col-md-8">
						<div class="well well-sm">
							<form id="registration-form">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group has-feedback">
											<label for="accountf">帳號</label> 
											<input type="text" class="form-control" id="accountf" name="model.userAccount"
												placeholder="輸入帳號"  />
											<span class="glyphicon form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for="passwordf">密碼</label> 
											<input type="text" class="form-control" id="passwordf" name="userPassword"
												placeholder="輸入密碼" />
											<span class="glyphicon form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for="confirm_password">確認密碼</label> 
											<input type="text" class="form-control" id="confirm_password"
												name="confirm_password" placeholder="確認密碼" />
											<span class="glyphicon form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for=userBirth>生日</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-calendar"></span> 
												</span> 
												<input type="text" class="form-control" id="userBirth"
													name="model.userBirthday" placeholder="日期"/>
											</div>
											<span class="glyphicon form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for="email">信箱</label>
											<div class="input-group">
												<span class="input-group-addon">
													<span class="glyphicon glyphicon-envelope"></span> 
												</span> 
												<input type="email" class="form-control" id="email"
													name="model.userEmail" placeholder="user@email.com" />
											</div>
											<span class="glyphicon form-control-feedback"></span>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group has-feedback">
											<label for="name">姓名</label> <input type="text"
												class="form-control" id="name" name="model.userName"
												placeholder="輸入姓名" />
											<span class="glyphicon form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for="userId">身分證</label> 
											<input type="text"class="form-control" id="userId" name="model.userCardId"
												placeholder="輸入號碼" />
											<span class="glyphicon form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for="phone">電話</label> 
											<input type="text" class="form-control" id="phone" name="model.userPhone"
												placeholder="輸入號碼" />
											<span class="glyphicon form-control-feedback"></span>
										</div>
										<div class="form-group has-feedback">
											<label for="credit">信用卡卡號</label>
											<input type="text" class="form-control" id="credit" name="model.userBankAccount"
												placeholder="xxxx-xxxx-xxxx-xxxx" />
											<span class="glyphicon form-control-feedback"></span>
										</div>
									</div>
									<div class="col-md-12">
										<button class="btn btn-primary pull-right" id="addUserButton">送出</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div id="info-form" class="col-md-4">
						<form>
							<legend>
								<span class="glyphicon glyphicon-user"></span>  
								<abbr id="info-account" title="預覽資料"></abbr> <span id="info-name"></span><br>
							</legend>
							<address>
								
								<legend>
									<p>
										<span id="info-idcard" class="infot">身分證:</span> 
									</p>
								</legend>
								<legend>
									<p>
										<span id="info-birth" class="infot">生日 :</span> 
									</p>
								</legend>
								<legend>
									<p>
										<span class="infot">E mail :</span> <a id="info-mail" href="mailto:#"></a>
									</p>
								</legend>
								<legend>
									<p>
										<span id="info-phone" class="infot">電話 :</span> 
									</p>
								</legend>
								<legend>
									<p>
										<span id="info-card" class="infot">卡號 :</span> 
									</p>
								</legend>

							</address>
						</form>
					</div>
				</div>
			</div>
		</div>
		<div id="page3">
			<form action="">
				<h1>請輸入驗證碼</h1>
				<input type="text" >
			</form>
		</div>
	</div>

	<div id="sigUp-footer" class="row container footer" style="margin-top: 100px; margin-bottom: 100px;">
    <div class="footer-body">
	    <div class="row">
	        <div class="progress" id="progress1">
	            <div class="progress-bar" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 10%;">                
	            </div>
	            <span class="progress-type">註冊步驟</span>
	            <span class="progress-completed">10%</span>
	        </div>      
	    </div>
	    <div class="row">
	        <div class="row step">
	            <div id="step1" class="col-md-3 activestep">
	                <span class="fa fa-check-square-o"></span>
	                <p></p>
	            </div>
	            <div class="col-md-1">
	            	<span class="fa fa-arrow-right"></span>
	            </div>
	            <div id="step2" class="col-md-3" >
	                <span class="fa fa-pencil"></span>
	                <p></p>
	            </div>
	            <div class="col-md-1">
	            	<span class="fa fa-arrow-right"></span>
	            </div>
	            <div id="step3" class="col-md-3">
	                <span class="fa fa-envelope-o"></span>
	                <p></p>
	            </div>
	        </div>
	    </div>
    </div>
</div>
</body>

<script src="<c:url value='/Security/js/jquery.validate.min.js'/>"></script> 
<script type="text/javascript">
	(function($) {
		
		//帳號重複與驗證
		jQuery.validator.addMethod("alnum", function(value, element) {
				return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
	 		}, "只能包括英文字母和数字");
		jQuery.validator.addMethod("checkAccount", function() {
			$('#info-account').empty();
			$('#info-account').append($('#accountf').val());
	    	$.ajax({
	    		url:"<c:url value='/checkAccount'/>",
				type:"get",
				data:{
					'model.userAccount': $('#accountf').val()
				},
				async:false,
				success: function(data) {
					if(data=="success") {
						checeAccount = true;	
					}else {
						checeAccount = false;	
					}
				}
			});
	    	return checeAccount;	       
		}, "帳號重複!");
		
		//驗證Email
		jQuery.validator.addMethod("checkEmail", function() {
			$('#info-mail').empty();
			$('#info-mail').append($('#email').val());
	    	$.ajax({
	    		url:"<c:url value='/checkEmail'/>",
				type:"get",
				data:{
					'model.userEmail': $('#email').val()
				},
				async:false,
				success: function(data) {
					if(data=="success") {
						checeEmail = true;	
					}else {
						checeEmail = false;	
					}
				}
			});
	    	return checeEmail;
		}, "Email已使用過");
		
		//密碼規則驗證
		jQuery.validator.addMethod("alnumpwd", function(value, element) {
				return this.optional(element) || /^[a-zA-Z0-9]+$/.test(value);
	 		}, "只能包括英文字母和数字");
		jQuery.validator.addMethod("checkPsw1", function() {
			var re1 = /^(?!.*[\u4E00-\u9FA5])(?=.*[0-9])\S{6,}$/g;
	        if (re1.test($('#passwordf').val())) {
	            checkPsw1 = true;
	        }else {
	        	checkPsw1 = false;
	        }
	        return checkPsw1;
		}, "須包含數字");
		jQuery.validator.addMethod("checkPsw2", function() {
			var re2 = /^(?!.*[\u4E00-\u9FA5])(?=.*[a-zA-Z])\S{6,}$/g;
	        if (re2.test($('#passwordf').val())) {
	            checkPsw2 = true;
	        }else {
	        	checkPsw2 = false;
	        }
	        return checkPsw2;
		}, "須包含英文");
		
		//姓名
		jQuery.validator.addMethod("input", function() {
			console.log($('#name').val());
			$('#info-name').empty();
			$('#info-name').append("(" + $('#name').val());
			
			return true;
		});
		
		//身分證驗證
		jQuery.validator.addMethod("idCard",
			function(citizenid, element) {
				var local_table = [10,11,12,13,14,15,16,17,34,18,19,20,21,
			                       22,35,23,24,25,26,27,28,29,32,30,31,33];
			    var local_digit = local_table[citizenid.charCodeAt(0)-'A'.charCodeAt(0)];
			    var checksum = 0;
			    checksum += Math.floor(local_digit / 10);
			    checksum += (local_digit % 10) * 9;
			    for (var i=1, p=8; i <= 8; i++, p--) {
			    	checksum += parseInt(citizenid.charAt(i)) * p;
			    }
			    checksum += parseInt(citizenid.charAt(9)); 
			    return (boolean)(
			        this.optional(element) || !(checksum % 10)
				);
			}, "無此身分證"
		);
		jQuery.validator.addMethod("idCardLayout",
			function(citizenid, element) {
				citizenid = citizenid.replace(/\s+/g, "");
				return (this.optional(element) || /^[A-Z]{1}[1-2]{1}[0-9]{8}$/.test(citizenid));
			}, "格式不正確"
		);
		
		$('#registration-form').validate({
			debug: true,
			rules: {
				'model.userAccount': {
					minlength: 6,
					required: true,
					checkAccount: true,
					alnum: true
				},
				userPassword: {
					required: true,
					minlength: 6,
					checkPsw1 : true,
					checkPsw2 : true, 
					alnumpwd: true
				},
				confirm_password: {
					required: true,
					minlength: 6,
					equalTo: "#passwordf"
				},
				'model.userEmail': {
					required: true,
					email: true,
					checkEmail: true
				},
				'model.userBirthday': {
					dateISO:true
				},
				'model.userName': {
					required: true,
					input: true
				},
				'model.userCardId': {
					required: true,
					idCardLayout: true,
					idCard: true,
				}
				
			},
			highlight: function(element) {
				console.log('fail');
				var formGroup = $(element).closest('.form-group');
				formGroup.removeClass('has-success').addClass('has-error');
				$('.form-control-feedback', formGroup).removeClass('glyphicon-ok').addClass('glyphicon-remove');
			},
			success: function(element) {
				console.log("success");
				var formGroup = $(element).closest('.form-group');
				formGroup.removeClass('has-error').addClass('has-success');
				$('.form-control-feedback', formGroup).removeClass('glyphicon-remove').addClass('glyphicon-ok');
			}
		});
		$('#addUserButton').on('click',function() {
			console.log($('#accountf').val());
			console.log($('#passwordf').val());
			$.ajax({
				url:"<c:url value='/addAccount'/>",
				type:"get",
				data:{
					'model.userAccount': $('#accountf').val(),
					userPassword: $('#passwordf').val(),
					'model.userBirthday': $('#userBirth').val(),
					'model.userEmail': $('#email').val(),
					'model.userName': $('#name').val(),
					'model.userCardId': $('#userId').val(),
					'model.userPhone': $('#phone').val(),
					'model.userBankAccount': $('#credit').val()
				},
				success: function(data) {
					//console.log(data);
					if(data=="success") {
						$('#step2').removeClass("activestep");
				        $('#step3').addClass("activestep");
						$('#page2').css("display","none");
						$('#page3').css("display","block");
				        $(".progress-bar").css("width", 70 + "%").attr("aria-valuenow", 70);
				        $(".progress-completed").text(70 + "%");
					}else {
					}
				}
			});
		});
		
		//$( "#userBirth").datepicker();
		
		$('#agree').on('click',function() {
	        $('#step1').removeClass("activestep");
	        $('#step2').addClass("activestep");
	        $('#page1').css("display","none");
	        $('#page2').css("display","block");
	        $(".progress-bar").css("width", 40 + "%").attr("aria-valuenow", 40);
	        $(".progress-completed").text(40 + "%");
		});
		
		
	})(jQuery);
    
</script>
</html>