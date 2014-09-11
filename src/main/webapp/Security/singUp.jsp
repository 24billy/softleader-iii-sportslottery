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


#sigUp-footer {
height:20px;
position:absolute;
bottom:0;
left:0;
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
.info {
	margin-bottom: 0;
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
						
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="account">帳號</label> <input type="text"
												class="form-control" id="account" name="model.userAccount"
												placeholder="輸入帳號" required="required" />
										</div>
										<div class="form-group">
											<label for="password">密碼</label> <input type="text"
												class="form-control" id="password" name="userPassword"
												placeholder="輸入密碼" />
										</div>
										<div class="form-group">
											<label for="confirm_password">確認密碼</label> <input type="text"
												class="form-control" id="confirm_password"
												name="confirm_password" placeholder="確認密碼" />
										</div>
										<div class="form-group">
											<label for=userBirth>生日</label>
											<div class="input-group">
												<span class="input-group-addon"><span
													class="glyphicon glyphicon-calendar"></span> 
												</span> 
												<input type="text" class="form-control" id="userBirth"
													name="model.userBirthday" placeholder="日期"/>
											</div>
										</div>
										<div class="form-group">
											<label for="email">信箱</label>
											<div class="input-group">
												<span class="input-group-addon"><span
													class="glyphicon glyphicon-envelope"></span> 
												</span> 
												<input type="email" class="form-control" id="email"
													name="model.userEmail" placeholder="user@email.com" />
											</div>
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="name">姓名</label> <input type="text"
												class="form-control" id="name" name="model.userName"
												placeholder="輸入姓名" />
										</div>
										<div class="form-group">
											<label for="userId">身分證</label> <input type="text"
												class="form-control" id="userId" name="model.userCardId"
												placeholder="輸入號碼" />
										</div>
										<div class="form-group">
											<label for="phone">電話</label> <input type="text"
												class="form-control" id="phone" name="model.userPhone"
												placeholder="輸入號碼" />
										</div>
										<div class="form-group">
											<label for="credit">信用卡卡號</label> <input type="text"
												class="form-control" id="credit" name="model.userBankAccount"
												placeholder="xxxx-xxxx-xxxx-xxxx" />
										</div>
									</div>
									<div class="col-md-12">
										<button class="btn btn-primary pull-right" id="addUserButton">送出</button>
									</div>
								</div>
							</form>
						</div>
					</div>
					<div class="col-md-4">
						<form>
							<legend>
								<span class="glyphicon glyphicon-user"></span>  <abbr
									title="預覽資料">User Account</abbr> <strong>(User Name</strong><br>
							</legend>
							<address>
								<legend>
									<p>
										<span class="infot">電話 :</span> 0912345678
									</p>
								</legend>
								<legend>
									<p>
										<span class="infot">身分證:</span> a123456
									</p>
								</legend>
								<legend>
									<p>
										<span class="infot">生日 :</span> 2000/01/01
									</p>
								</legend>
								<legend>
									<p>
										<span class="infot">E mail :</span> <a href="mailto:#">user@example.com</a>
									</p>
								</legend>
								<legend>
									<p>
										<span class="infot">卡號 :</span> 1234-5678-2234-5678
									</p>
								</legend>

							</address>
							<address></address>
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


<script type="text/javascript">


	(function($) {
		$('#addUserButton').on('click',function() {
			$.ajax({
				url:"<c:url value='/addAccount'/>",
				type:"get",
				data:{
					'model.userAccount': $('#account').val(),
					userPassword: $('#password').val(),
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
						$('#page2').css("display","none");
						$('#page3').css("display","block");
				        $(".progress-bar").css("width", 70 + "%").attr("aria-valuenow", 70);
				        $(".progress-completed").text(70 + "%");
					}else {
					}
				}
			});
		});
		
		$( "#userBirth").datepicker();
		
		$('#agree').on('click',function() {
	        $('#step1').removeClass("activestep");
	        $('#step2').addClass("activestep");
	        $('#page1').css("display","none");
	        $('#page2').css("display","block");
	        $(".progress-bar").css("width", 40 + "%").attr("aria-valuenow", 40);
	        $(".progress-completed").text(40 + "%");
		});
		
		function resetActive(event, percent) {
	        $(".progress-bar").css("width", percent + "%").attr("aria-valuenow", percent);
	        $(".progress-completed").text(percent + "%");

	        $("div").each(function () {
	            if ($(this).hasClass("activestep")) {
	                $(this).removeClass("activestep");
	            }
	        });

	        if (event.target.className == "col-md-2") {
	            $(event.target).addClass("activestep");
	        }
	        else {
	            $(event.target.parentNode).addClass("activestep");
	        }
	    }
		
	})(jQuery);

    
</script>
</html>