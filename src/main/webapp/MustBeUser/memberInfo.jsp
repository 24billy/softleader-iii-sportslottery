<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<style>

</style>
<div class="container top20">
	<div class="row">
	
    	<nav class="col-sm-3"><!--nav-->
	        <ul id="naver" class="nav nav-pills nav-stacked nav-ul">
		    	<li id="linkUserInfo" class="active" >
		    		<a href="#pageUserInfo" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;個人資料</a>
		    	</li>
		        <li id="linkFixPassword" >
		        	<a href="#pageFixPassword" role="tab" data-toggle="tab"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;修改密碼</a>
		        </li>        
	        </ul>
      	</nav><!--/nav-->
      	
      	<div id="pageStorage" class="col-sm-9 tab-content">
	      	<div id="pageUserInfo" class="tab-pane fade in active">
	      		<div id="alert" class="alert alert-danger" role="alert"></div>
				<div class="panel panel-info">
					<div class="panel-heading">
						<h3 class="panel-title">個人資訊</h3>
					</div>
					<div class="panel-body">
						<form id="userForm" class="form-horizontal" role="form">
							<div class="form-group">
								<label for="inputAccount" class="col-sm-2 control-label">帳號</label>
								<div class="col-sm-10">
									<input id="inputAccount" type="text" class="form-control" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="inputBankAccount" class="col-sm-2 control-label">帳戶</label>
								<div class="col-sm-10">
									<input id="inputBankAccount" type="text" class="form-control" disabled>
								</div>
							</div>
							
							<div class="form-group">
								<label for="inputName" class="col-sm-2 control-label">姓名</label>
								<div class="col-sm-10">
									<input id="inputName" type="text" class="form-control editable" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="inputBirth" class="col-sm-2 control-label">生日</label>
								<div class="col-sm-10">
									<input id="inputBirth" type="text" class="form-control editable" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="inputPhone" class="col-sm-2 control-label">電話</label>
								<div class="col-sm-10">
									<input id="inputPhone" type="text" class="form-control editable" disabled>
								</div>
							</div>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-2 control-label">信箱</label>
								<div class="col-sm-10">
									<input id="inputEmail" type="text" class="form-control editable" disabled>
								</div>
							</div>
							<div class="form-group" id="passConfirm">
								<label for="inputPass" class="col-sm-2 control-label">密碼</label>
								<div class="col-sm-10">
									<input id="inputPass" type="password" class="form-control editable" placeholder="請輸入密碼以進行身分驗證" disabled>
								</div>
							</div>
							
						</form>
						<div id="buttonGroup">
							<button id="edit" class="btn btn-primary">編輯</button>
							<button id="save" class="btn btn-success" disabled>儲存</button>
							<button id="cancel" class="btn btn-danger" disabled>取消</button>
						</div>
					</div>

				</div>
			</div>

	      	<div id="pageFixPassword" class="tab-pane fade ">
	      		<form action="">
	      	 		<h3>舊密碼<input type="text"></h3>
	      	 		<h3>新密碼<input type="text"></h3>
	      	 		<h3>確認新密碼<input type="text"></h3>
	      	 	</form>
	    	</div>
      	</div>
	</div>
</div><!--/.content-->
<footer class="row footer">
	<div class="panel-footer"></div>
</footer>
<script>
	(function($) {
		editMode(false);
		
		$('#inputBirth').datetimepicker({
			timepicker:false,
			format:'Y年m月d日'
		});
		//取得使用者資訊
		getUserInfo();
		function getUserInfo(){
			$('#alert').hide();
			$.ajax({
				url: '<c:url value="/userInfo" />',
				type:'post',
				dataType:'json',
				success:function(datas){
					console.log(datas)
					$('#inputAccount').val(datas.userAccount);
					$('#inputBankAccount').val(datas.userBankAccount);
					$('#inputName').val(datas.userName);
					$('#inputBirth').val(millisecondToDate(datas.userBirthday.iLocalMillis));
					$('#inputPhone').val(datas.userPhone);
					$('#inputEmail').val(datas.userEmail);
				}
			});
			$('#inputPass').val('');
		}
		
		//開始編輯
		$('#edit').on('click', function(){
			editMode(true);
		});
		
		$('#cancel').on('click', function(){
			editMode(false);
			getUserInfo();
		});
		
		$('#save').on('click', function(){
			if($('#inputPass').val().trim().length <= 0){
				$('#passConfirm').addClass('has-error');
				$('#alert').html('<strong>密碼不能為空:</strong>請輸入密碼');
				$('#alert').show();
			} else {
				$('#passConfirm').removeClass('has-error');
				//登入驗證先
				$.ajax({
					url: '<c:url value="/checkUser" />',
					type:'post',
					dataType:'json',
					data:{
						'model.userAccount':$('#inputAccount').val(),
						'userPassword':$('#inputPass').val()
					},
					success:function(checkLogin){
						if(checkLogin){
							//送出修改資訊
							var dateFormat = $('#inputBirth').val();
							dateFormat = dateFormat.replace(/年|月/g,'-');
							dateFormat = dateFormat.replace(/日/g,'');
							console.log(dateFormat);
							$.ajax({
								url: '<c:url value="/updateUserInfo" />',
								type:'post',
								dataType:'json',
								data:{
									'model.userAccount':$('#inputAccount').val(),
									'userPassword':$('#inputPass').val(),
									'model.userName':$('#inputName').val(),
									'model.userEmail':$('#inputEmail').val(),
									'model.userBirthday':dateFormat,
									'model.userPhone':$('#inputPhone').val(),
								},
								success:function(updateResult){
									if(updateResult){
										console.log('修改成功');
										editMode(false);
										getUserInfo();
									} else {
										//修改資料失敗
									}
								}
							});
						} else {
							//驗證登入失敗
							$('#passConfirm').addClass('has-error');
							$('#alert').html('<strong>密碼錯誤:</strong>請重新輸入密碼');
							$('#alert').show();
						}
					}
				});
			}
		});
		
		//切換編輯模式 mode為布林值
		function editMode(mode){
			if(mode){
				//啟動編輯模式
				$('#userForm input.editable').prop('disabled', false);
				$('#buttonGroup #edit').prop('disabled', true);
				$('#buttonGroup #save').prop('disabled', false);
				$('#buttonGroup #cancel').prop('disabled', false);
				$('#passConfirm').show();
			} else {
				//關閉編輯模式
				$('#userForm input.editable').prop('disabled', true);
				$('#buttonGroup #edit').prop('disabled', false);
				$('#buttonGroup #save').prop('disabled', true);
				$('#buttonGroup #cancel').prop('disabled', true);
				$('#passConfirm').hide();
			}
		}
		
	})(jQuery);

</script>
</body>
</html>