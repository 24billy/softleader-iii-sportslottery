<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


<link href="<c:url value="/Security/css/style.css"/>" rel="stylesheet">
<script src="<c:url value="/Security/js/jquery-1.7.1.min.js"/>"></script>
<script src="<c:url value="/Security/js/jquery.XYTipsWindow.min.2.8.js"/>"></script>
<script src="<c:url value="/Security/js/bootstrap.min.js"/>"></script>
<script src="<c:url value='/Security/js/button.js'/>"></script> 
<script src="<c:url value='/Security/js/jquery.validate.min.js'/>"></script> 

<style>
#form1{
	float:right;
}
#form2{
	float:right;
}
.info{
	width:100px;
}
#reg{
	float:right;
}
.error{
	font-family: "Lucida Sans Unicode", "Lucida Grande", "微軟正黑體";
	font-weight: 700;
	font-size: 13px;
	line-height: 20px;
	color:red;
}
</style>
</head>
<body>
<div class="body">
	<c:if test="${empty user}">
		<form id="form1" class="form-inline" action="<c:url value="checkLogin"/>" >
			<div>
				<input value="jackychen" type="text" class="info" name="model.userAccount" placeholder="請輸入帳號" required>
				<input value="a123456" type="password" class="info" name="userPassword" placeholder="請輸入密碼" required>
				<s:submit cssClass="btn btn-success" value="登入" method="login"/>
			</div>
			<div>
			
				<a href="<c:url value='/Security/Email/index.jsp'/>">忘記密碼</a>
				<span class="error">${errors.LoginFail}</span>
				<button type="button" id="reg" class="btn btn-info">註冊</button>
			</div>
		</form>
	</c:if>
	
	<c:if test="${ !empty user }">
		<form id="form2" class="form-inline" action="<c:url value="/Security/Result/logout.jsp"/>" >	
			<div>
				<button type="sumit" class="btn btn-info">登出</button>
			</div>
		</form>
		
		<button id="update" class="btn btn-info">修改資料</button>
		
		<button id="deposit" class="btn btn-primary">充值</button>
	</c:if>

<div class="modal fade">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
        <h4 class="modal-title">Modal title</h4>
      </div>
      <div class="modal-body">
        <p>One fine body…</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	
</div>


<script>
	(function($){
		$('deposit').click(function() {
		
			BootstrapDialog.show({
		    	title: 'Button Hotkey',
				message: $('<textarea class="form-control" placeholder="Try to input multiple lines here..."></textarea>'),
		        buttons: [{
		        	label: '(Enter) Button A',
		            cssClass: 'btn-primary',
		            hotkey: 13, // Enter.
		            action: function() {
		                alert('You pressed Enter.');
		            }
		        }]
			});
	       
		})
		
		$("#reg").click(function(){
			$.XYTipsWindow({
				___title:"會員註冊",
				___content:"iframe:<c:url value='/Security/addUser.jsp'/>",
				___width:"450",
				___height:"550",
				___showbg:true,
				___drag:"___boxTitle"
			});
		});
	})(jQuery);
	
</script>

</body>
</html>