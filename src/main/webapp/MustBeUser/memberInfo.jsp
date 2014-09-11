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
	        <ul class="nav nav-pills nav-stacked">
	        <br><br>
		    	<li><a id="goUserInfo" href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;&nbsp;About</a></li>
		        <li><a id="goFixPassword" href="#"><span class="glyphicon glyphicon-envelope"></span>&nbsp;&nbsp;修改密碼</a></li>        
	        </ul>
	    </div>
      	</nav><!--/nav-->
      	<div class="col-sm-9">
	      	<div id="userInfo">
				<div class="container">
					<div class="row">
						<div
							class="col-xs-12 col-sm-12 col-md-6 col-lg-6 col-xs-offset-0 col-sm-offset-0 col-md-offset-3 col-lg-offset-3 toppad">
							<div class="panel panel-info">
								<div class="panel-heading">
									<h3 class="panel-title">Sheena Kristin A.Eschor</h3>
								</div>
								<div class="panel-body">
									<div class="row">
										<div class=" col-md-12 col-lg-12 ">
											<table class="table table-user-information">
												<tbody>
													<tr>
														<td>Department:</td>
														<td>Programming</td>
													</tr>
													<tr>
														<td>Hire date:</td>
														<td>06/23/2013</td>
													</tr>
													<tr>
														<td>Date of Birth</td>
														<td>01/24/1988</td>
													</tr>

													<tr>
													<tr>
														<td>Gender</td>
														<td>Male</td>
													</tr>
													<tr>
														<td>Home Address</td>
														<td>Metro Manila,Philippines</td>
													</tr>
													<tr>
														<td>Email</td>
														<td><a href="mailto:info@support.com">info@support.com</a></td>
													</tr>
													<td>Phone Number</td>
													<td>123-4567-890(Landline)<br> <br>555-4567-890(Mobile)
													</td>

													</tr>

												</tbody>
											</table>

											<a href="#" class="btn btn-primary">My Sales Performance</a>
											<a href="#" class="btn btn-primary">Team Sales
												Performance</a>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
			
	      	<div id="fixPassword">
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
		$('goFixPassword').on('click',function() {
			
		});
	})(jQuery);

</script>
</body>
</html>