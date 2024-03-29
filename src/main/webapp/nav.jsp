<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		
		.btn-tree {
		color: #fff;
		background-color: #66CDAA;
		border-bottom:2px solid #098aa9;
		}
		
		.btn-tree:hover,.btn-tree.active:focus, .btn-tree:focus, .open>.dropdown-toggle.btn-tree {
		color: #fff;
		background-color: #66CDAA;
		border-bottom:2px solid #2192ad;
		outline: none;
		}
		
		.btn-tree:active, .btn-tree.active {
		color: #fff;
		background-color: #66CDAA;
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

	<button type="button" class="btn btn-hot text-uppercase btn-lg" id="game">賽事投注</button>
	<button type="button" class="btn btn-sunny text-uppercase btn-lg" id="history">歷史紀錄</button>
	<button type="button" class="btn btn-sky text-uppercase btn-lg " id="user">使用者資訊</button>
	<a href="" data-slidepanel="panel"><button type="button" class="btn btn-tree text-uppercase btn-lg " id="lotteryBoard">投注區</button></a>
	
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
