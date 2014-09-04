<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link href="<c:url value="/Security/css/style.css"/>" rel="stylesheet">
<script src="<c:url value="/Security/js/jquery-1.7.1.min.js"/>"></script>
<script src="<c:url value="/Security/js/bootstrap.min.js"/>"></script>
<script src="<c:url value='/Security/js/button.js'/>"></script> 
<script src="<c:url value='/Security/js/jquery.validate.min.js'/>"></script> 
<style>
	.error {
		color:red;
	}
</style>

<body>
	<h1>儲值</h1>
	<form id="deposit-form" action="<c:url value='/coinsUpdate'/>">
		<label id="cardAccount">卡號</label>
		<input type="text" name="cardAccount"><br>
		<label id="cardPassword">密碼</label>
		<input type="password" name="cardPassword"><br>
		<button type="submit" class="btn btn-success">加值</button>
		<button type="reset" class="btn btn-info">清除</button>
		<div class="error"><s:property value="fieldErrors.cardError"/></div>
	</form>
	
	

<script>
	(function($){
		$('#deposit-form').validate({
			rules: {
				cardAccount: {
					required: true,
				},
				cardPassword: {
					required: true,
				}
			},
			highlight: function(element) {
				console.log("fail");
				
				$(element).closest('.control-group').removeClass('success').addClass('error');
			}
		});
	})(jQuery);
</script>
</body>
</html>