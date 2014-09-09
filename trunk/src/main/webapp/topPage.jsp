<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.navbar-login
{
    width: 305px;
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

</style>


<body>
	<div class="navbar navbar-default navbar-fixed-top" role="navigation">
	    <div class="container">
	        <div class="collapse navbar-collapse">
	            <ul class="nav navbar-nav">            
	                <li><a href="#">首頁</a></li>
	            </ul>
	            <!-- 登入後 -->
	            <c:if test="${ !empty user }">
		            <ul class="nav navbar-nav navbar-right">
		            	<li class="dropdown">
			            	<a href="#"class="dropdown-toggle" data-toggle="dropdown">
			                	<span class="badge pull-right">42</span>
		   				 		<span class="glyphicon glyphicon-envelope"></span>
			                </a>
			               	<ul class="dropdown-menu">
			               		<li>系統訊息</li>
				                <li class="divider"></li>
				                <li><a href="#">連結1</a></li>
				                <li class="divider"></li>
				                <li><a href="#">連結2</a></li>
				                <li class="divider"></li>
				            	<li><a href="#">連結3</a></li>
				            </ul>
		                </li> 
		            
		                <li class="dropdown">
		                    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
		                        <span class="glyphicon glyphicon-user"></span>
		                        <strong>UserAccount</strong>
		                        <span class="glyphicon glyphicon-chevron-down"></span>
		                    </a>
		                    <ul class="dropdown-menu">
		                        <li>
		                            <div class="navbar-login">
		                            	<div class="row">
		                                   	<div class="col-md-4">
		                                   		<p class="text-left"><strong>${user.userName}</strong></p>    
		                                   	</div>          
		                                   	<div class="col-md-8">
		                                   		<a href="#" class="btn-primary btn-xs">個人資料</a>
		                                   	</div>                                                           
		                            	</div>
		                            	
		                                <div class="row">
		                                   	<div class="col-lg-4">                                   		
		                                   	</div>
		                                    
		                                    <div class="col-lg-8">
		                                        <p class="text-left small">${user.userEmail}</p>
		                                    	<p class="text-left small">${user.userPhone}</p>
		                                    	<p class="text-left small">${user.coins}$$</p>
		                                    </div>
		                                </div>
		                            </div>
		                        </li>
		                        <li class="divider"></li>
		                        <li>
		                            <div class="navbar-login navbar-login-session">
		                                <div class="row">
		                                    <div class="col-lg-12">
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
		            		<a href="#" data-toggle="modal" data-target="#myModal">
		                        <span class="glyphicon glyphicon-user"></span>
		                        <strong>登入</strong>                        
		                    </a>
		            	</li>
		            </ul>
	            </c:if>
	        </div>
	    </div>
	</div>
	<!--登入頁面 -->
	<div class="modal fade" id="myModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">x</button>
					<h3>Login to MyWebsite.com</h3>
				</div>
				<div class="modal-body">
					<form method="post" action="<c:url value="checkLogin"/>" name="login_form">
						<p>
							<input type="text" class="span3" name="model.userAccount" id="account"
								placeholder="Account">
						</p>
						<p>
							<input type="password" class="span3" name="userPassword"
								placeholder="Password">
						</p>
						<p>
							<button type="submit" class="btn btn-primary">Sign in</button>
							<a href="#">Forgot Password?</a>
						</p>
					</form>
				</div>
				<div class="modal-footer">
					New To MyWebsite.com? <a href="#" class="btn btn-primary">Register</a>
				</div>
			</div>
		</div>
	</div>
</body>
</html>