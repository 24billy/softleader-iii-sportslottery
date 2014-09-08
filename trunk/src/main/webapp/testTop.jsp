<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>


<body>
<div class="navbar navbar-default navbar-fixed-top" role="navigation">
    <div class="container">
        <div class="collapse navbar-collapse">
            <ul class="nav navbar-nav">            
                <li><a href="#">首頁</a></li>
            </ul>
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
                                   		<p class="text-left"><strong>User Name</strong></p>    
                                   	</div>          
                                   	<div class="col-md-8">
                                   		<a href="#" class="btn-primary btn-xs">個人資料</a>
                                   	</div>                                                           
                            	</div>
                            	
                                <div class="row">
                                   	<div class="col-lg-4">                                   		
                                   	</div>
                                    
                                    <div class="col-lg-8">
                                        <p class="text-left small">user@email.com</p>
                                    	<p class="text-left small">0912345678</p>
                                    	<p class="text-left small">100$$</p>
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
                                            <a href="#" class="btn btn-danger btn-block">登出</a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</div>
</body>
</html>