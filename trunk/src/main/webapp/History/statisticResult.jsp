<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<script src="<c:url value="/js/jquery.min.js"/>"></script>
<script src="<c:url value="/js/jquery-ui.min.js"/>"></script>
<script src="<c:url value="/js/bootstrap.min.js"/>"></script>
<script src="<c:url value="/js/jquery.datetimepicker.js"/>"></script>
<script src="<c:url value="/js/bootstrap-dialog.min.js"/>"></script>
<script src="<c:url value="/js/jquery.bootstrap-touchspin.min.js"/>"></script>
<script src="<c:url value="/js/jquery.dataTables.min.js"/>"></script>
<script src="<c:url value="/js/jquery.shapeshift.min.js"/>"></script>
<script src="<c:url value="/js/dataTables.responsive.js"/>"></script>
<script src="<c:url value="/js/jquery.sidr.min.js"/>"></script>
<script src="<c:url value="/js/misc.js"/>"></script>
<script src="<c:url value='/js/jquery.validate.min.js'/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.js"/>"></script>
<script src="<c:url value="/js/bootstrap-datepicker.zh-TW.js"/>"></script>


<!--sidepanel  -->  
<script type="text/javascript" src="js/jquery.slidepanel.js"></script>
<script type="text/javascript" src="js/jquery.sidr.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/jquery.slidepanel.css">
<link rel="stylesheet" type="text/css" href="css/jquery.sidr.light.css">

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.1/themes/smoothness/jquery-ui.css">

<link rel="stylesheet" href="<c:url value="css/jquery.sidr.light.css"/>">


<link rel="stylesheet" href="<c:url value="/css/jquery.sidr.light.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/font-awesome.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.datetimepicker.css"/>">
<link rel="stylesheet" href="<c:url value="/css/bootstrap-dialog.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.bootstrap-touchspin.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/jquery.dataTables.min.css"/>">
<link rel="stylesheet" href="<c:url value="/css/dataTables.responsive.css"/>">
<link rel="stylesheet" href="<c:url value="/css/global.css"/>">    
<link rel="stylesheet" href="<c:url value="/css/animate.css"/>">
<link rel="stylesheet" href="<c:url value="/css/sophia.css"/>"> 
<link rel="stylesheet" href="<c:url value="/css/datepicker.css"/>"> 
<link rel="stylesheet" href="<c:url value="/css/coins.css"/>">

<style>
		@import url(http://fonts.googleapis.com/css?family=Oswald);
</style>


<style>
	td.details-control {
	    background: url('<c:url value="/History/images/details_open.png"/>') no-repeat center center;
	    cursor: pointer;
	}
	tr.shown td.details-control {
	    background: url('<c:url value="/History/images/details_close.png"/>') no-repeat center center;
	}
	
	.progress{
		margin:0px;
	}
</style>
</head>
<body>
	<div id="page-wrapper">
		
		<div class="container top20">
			
			<div class="row">
				<div class="col-sm-12">
					<form role="form" class="form-inline pull-left" action="<c:url value="/gameManager"/>">
						<div class="form-group">
							<label class="sr-only" for="country">聯盟:</label>
							<select class="form-control form-country" id="country" name="country"  >                     	
							</select>
						</div>
						<div class="form-group">
							<label class="sr-only" for="teamName">隊名:</label>
							<select class="form-control form-team" id="teamName" name="teamName" ></select>
						</div>
						<div class="form-group">
							<label class="sr-only" for="odds">隊名:</label>
							<select class="form-control form-odds" id="odds" name="odds" >
								<option value="">不選擇單筆投注類型 </option>
								<option value="">不選擇單筆投注類型 </option>
								<option value="">不選擇單筆投注類型 </option>
								<option value="">不選擇單筆投注類型 </option>
								<option value="">不選擇單筆投注類型 </option>
								<option value="">不選擇單筆投注類型 </option>
								<option value="">不選擇單筆投注類型 </option>
								<option value="">不選擇單筆投注類型 </option>
							</select>
						</div>
						<button type="button" class="btn btn-default" id="submitButton">顯示統計</button>
					</form>
				</div>
			</div>
			<!-- .row -->



<h3>總共有${size}資料  </h3>
${json}
<%-- <p>${result}</p> --%>
<script>
(function($) {
	listTeam();
	listLeague();
	
	$( ".form-country" ).change(function() { 
		if($(this).val() == "") {
			listTeam();
		}else{
			getTeamsByCountry();//根據聯盟名稱列出隊名
		}
	});
	
	function listTeam() {
	 	$('.form-team').empty(); 
		
		var url = '<c:url value="/team.action"/>';
		 $('.form-team').append('<option value="">不選擇隊伍 </option>'); 
			
		 $.getJSON(url, function(data) { //透過team.action從資料庫，取回的Json型式的值，一條條成option
				$.each(data, function(key, value) {
					var str = '<option value=' + value.teamName + '>' + value.teamName + '</option>';
					$('.form-team').append(str);
				});
			});
	}
	function listLeague() {
	 	$('.form-country').empty(); 
		
		var url = '<c:url value="/team.action?method:getLeagueNames"/>';
		 $('.form-country').append('<option value="">不選擇聯盟 </option>'); 
			
		 $.getJSON(url, function(data) { //透過team.action從資料庫，取回的Json型式的值，一條條成option
			//console.log(data);	
			 $.each(data, function(key, value) {
					var str = '<option value=' + value+ '>' + value+ '</option>';
					$('.form-country').append(str);
				});
			});
	}
	function getTeamsByCountry(){
		
		$.ajax({
			url:'<c:url value="/teamsByCountryStatistic?method:getTeamsByLeagueName"/>',
			type:'post',
			dataType:'json',//不可為text, 不然不是物件
			data:{
				'leagueName':$('#country').val()
			},
			success:function(data) {
				console.log(data);	
				$('.form-team').empty(); 
			 	$('.form-team').append('<option value="">不選擇隊伍 </option>');  
				$.each(data, function(key, value) {
					var str = '<option value=' + value.teamName + '>' + value.teamName + '</option>';
					$('.form-team').append(str);
				});
			 	
			}
		});
		
	}
	
	
})(jQuery);

</script>
</body>
</html>