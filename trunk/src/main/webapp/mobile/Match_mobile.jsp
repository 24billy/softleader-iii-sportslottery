<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
		<title>jQuery Mobile Lab</title>
		<link rel="stylesheet" href="css/jquery.mobile-1.4.0.css" />
		<link rel="stylesheet" href="css/jqm-icon-pack-fa.css" />
		<script src="js/jquery-1.11.0.js"></script>
        <script src="js/jquery.mobile-1.4.0.js"></script>
	</head>
	<body>
		<div data-role ="page" id="page_main">
			<div data-role="header">
				<h3>Page Demos</h3>
			</div>
			<div data-role="content">
				<p>These are demos of pages and dialogs.</p>
				<a data-role="button"  href="#page_internal" >Internal Page-default</a> 
				<a data-role="button" href="#page_internal" data-transition="flip" >Internal Page-flip</a> 
				<a data-role="button" href="#page_internal" data-transition="turn" >Internal Page-turn</a> 
				<a data-role="button" href="#page_internal" data-transition="flow" >Internal Page-flow</a> 
				<a data-role="button" href="#page_internal" data-transition="slide" >Internal Page-slide</a> 
				<a data-role="button" href="#page_internal" data-transition="slidefade" >Internal Page-slidefade</a> 
				<a data-role="button" href="#page_internal" data-transition="slideup" >Internal Page-slideup</a> 
				<a data-role="button" href="#page_internal" data-transition="slidedown" >Internal Page-slidedown</a> 
				<a data-role="button" href="#page_internal" data-transition="none" >Internal Page-none</a> 

				<hr>
				<a href="external.html"  data-role="button" data-icon="android" data-iconpos="right">External Page</a>
				<a href="#page_dialog">Dialog</a>

			</div>
			<div data-role="footer">
				<h3>About jQM Lab</h3>
			</div>
		</div>

		<div data-role="page" id="page_internal">
			<div data-role="header">
				<h3>Internal Page</h3>
			</div>
			<div data-role="main" class="ui-content">
				<img width="100%" src="images/productlogo.png">
			</div>
			<div data-role="footer">
				<h3>Copyright 2013</h3>
			</div>
		</div>

		<div data-role="page" id="page_dialog" data-dialog="true">
			<!-- 
				Page也可以用Rounded-Corner Dialog 的方式呈現，左右跟上面補上一些MARGIN，背景設定成黑色

				Page 要變成Dialog, 只要將data-dialog的屬性設定為true即可

				如果有Header，jQuery Mobile還會自動在Header的左邊加上一個Close 按鈕，方便關閉Dialogㄝ返回上一個Page

				data-transition 屬性建議設定為pop，否則會用PAge預設的fade
			-->
			<div data-role="header">
				<h3>Dialog Page</h3>
			</div>
			<div data-role="main" class="ui-content">
				<img width="100%" src="images/productlogo.png">
			</div>
			<div data-role="footer">
				<h3>Copyright 2013</h3>
			</div>
		</div>
		

	</body>



</html>