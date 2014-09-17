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

#fixPassword {
	display: none;
}
</style>
<div class="container">
	<div class="row">
    	<nav class="col-sm-3"><!--nav-->
        <div class="row">
	        <ul class="nav nav-pills nav-stacked nav-ul">
	        <br><br>
		    	<li><a id="goUserInfo" class="active disabled" href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;個人資料</a></li>
		        <li><a id="goFixPassword" class="disabled" href="#"><span class="glyphicon glyphicon-cog"></span>&nbsp;&nbsp;修改密碼</a></li>        
	        </ul>
	    </div>
      	</nav><!--/nav-->
      	<div class="col-sm-9">
	      	<div id="userInfo" class="active content disabled">
				<div class="container">
					<div class="row">
						<div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">個人資訊</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class=" col-md-12 col-lg-12 ">
											<table class="table table-user-information">
												<tbody>
													<tr>
														<td>帳號</td>
														<td><input type="text" value="User Account" disabled></td>
													</tr>
													<tr>
														<td>姓名</td>
														<td><input type="text" value="User Name" disabled></td>
													</tr>
													<tr>
														<td>生日</td>
														<td><input type="text" value="1988/01/01" disabled></td>
													</tr>

													<tr>
													<tr>
														<td>性別</td>
														<td><input type="text" value="男" disabled></td>
													</tr>
													<tr>
														<td>地址</td>
														<td><input type="text" value="aaa,aaaa,bbbbb" disabled></td>
													</tr>
													<tr>
														<td>信箱</td>
														<td><input type="text" value="user@email.com" disabled></td>
													</tr>
														<td>電話</td>
														<td><input type="text" value="0912345678" disabled></td>
													</tr>

												</tbody>
											</table>
											<button id="edit" class="btn btn-primary">更新個人資訊</button>
											<button id="save" class="btn btn-success" disabled>儲存</button>
											<button id="save" class="btn btn-danger" disabled>取消</button>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>

	      	<div id="fixPassword" class="content disabled">
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
		var navListItems = $('.nav-ul li a'),
			allWells = $('.content');
		allWells.hide();
		
		
		$('.nav-ul li a').click(function(e) {
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
		
		$('.nav-ul').trigger('click');
		
		$('#edit').on('click', function(e) {
			$('tr input').removeAttr("disabled");
		});

		$('goFixPassword').on('click',function() {
			
		});
	})(jQuery);

</script>
</body>
</html>