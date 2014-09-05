<%@ page language="java" contentType="text/html; charset=BIG5"
    pageEncoding="BIG5"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=BIG5">
	<title>Insert title here</title>
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <link href="css/bootstrap.min.css" rel="stylesheet">
	<style>
		@import url(http://fonts.googleapis.com/css?family=Oswald);
	
		#nav{
		    font-family: 'Oswald', sans-serif;
		}
		
		.btn{
		    margin: 4px;
		    box-shadow: 1px 1px 5px #888888;
		}
		
		.btn-xs{
		    font-weight: 300;
		}
		   
		.btn-hot {
		color: #fff;
		background-color: #db5566;
		border-bottom:2px solid #af4451;
		}
		
		.btn-hot:hover, .btn-sky.active:focus, .btn-hot:focus, .open>.dropdown-toggle.btn-hot {
		color: #fff;
		background-color: #df6a78;
		border-bottom:2px solid #b25560;
		outline: none;}
		
		
		.btn-hot:active, .btn-hot.active {
		color: #fff;
		background-color: #c04b59;
		border-top:2px solid #9a3c47;
		margin-top: 2px;
		}
		
		.btn-sunny {
		color: #fff;
		background-color: #f4ad49;
		border-bottom:2px solid #c38a3a;
		}
		
		.btn-sunny:hover, .btn-sky.active:focus, .btn-sunny:focus, .open>.dropdown-toggle.btn-sunny {
		color: #fff;
		background-color: #f5b75f;
		border-bottom:2px solid #c4924c;
		outline: none;
		}
		
		
		.btn-sunny:active, .btn-sunny.active {
		color: #fff;
		background-color: #d69840;
		border-top:2px solid #ab7a33;
		margin-top: 2px;
		}
		
		.btn-fresh {
		color: #fff;
		background-color: #51bf87;
		border-bottom:2px solid #41996c;
		}
		
		.btn-fresh:hover, .btn-sky.active:focus, .btn-fresh:focus, .open>.dropdown-toggle.btn-fresh {
		color: #fff;
		background-color: #66c796;
		border-bottom:2px solid #529f78;
		outline: none;
		}
		
		
		.btn-fresh:active, .btn-fresh.active {
		color: #fff;
		background-color: #47a877;
		border-top:2px solid #39865f;
		outline: none;
		outline-offset: none;
		margin-top: 2px;
		}
		
		.btn-sky {
		color: #fff;
		background-color: #0bacd3;
		border-bottom:2px solid #098aa9;
		}
		
		.btn-sky:hover,.btn-sky.active:focus, .btn-sky:focus, .open>.dropdown-toggle.btn-sky {
		color: #fff;
		background-color: #29b6d8;
		border-bottom:2px solid #2192ad;
		outline: none;
		}
		
		.btn-sky:active, .btn-sky.active {
		color: #fff;
		background-color: #0a97b9;
		border-top:2px solid #087994;
		outline-offset: none;
		margin-top: 2px;
		}
		
		.btn:focus,
		.btn:active:focus,
		.btn.active:focus {
		    outline: none;
		    outline-offset: 0px;
		}
	</style>
</head>
<body id='nav'>


				<button type="button" class="btn btn-hot text-uppercase btn-lg" id="game">�ɨƧ�`</button>
				<button type="button" class="btn btn-sunny text-uppercase btn-lg" id="history">���v����</button>
				<button type="button" class="btn btn-sky text-uppercase btn-lg " id="user">�ϥΪ̸�T</button>
			
				

	<script>
	
	$('#game').click(function() {
		location.href='<c:url value="/game"/>';
		});
	$('#history').click(function() {
		  window.location='<c:url value="/history"/>';
		});
	$('#user').click(function() {
		  window.location='<c:url value="/userInfo"/>';
		});
		
		
		
	</script>


</body>
</html>