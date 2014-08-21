<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<body>
<h2>Hello World!</h2>
<a href="odds">odds</a><br>
<a href="Match.jsp">Match</a><br>
<a href="odds?gameId=1">OddType(Id=1)</a><br>
<a href="Admin/index.jsp">Game Manager</a><br>
<a href="Event/match-index.jsp">Game info</a><br>
<a href="Admin/Lottery.jsp">Lottery</a><br>
<a href="<c:url value="/History/historyIndex.jsp"/>">History Index</a><br>


<hr>
<a href="http://getbootstrap.com/">BootStrap</a><br>
<a href="http://fortawesome.github.io/Font-Awesome/">BootStrap.icon</a><br>

<hr>
<button type="button" class="btn btn-success"><a href="123">Modify</a></button>
<button type="button" class="btn btn-primary"><a href="<c:url value="/Security/logout.jsp"/>">LogOut</a></button>



<!-- åå»spring-struts.xmlæ¾åºoddsActionçä½ç½®å»å·è¡oddsActionè£¡çexecute()ï¼æåå¾ï¼å·è¡Json/oddsJson.jsp
	struts.xml:
	<action name="odds" class="oddsAction" method="execute">
		<result name="success">Json/oddsJson.jsp</result>
		<result name="input">Json/oddsJson.jsp</result>
		<allowed-methods>select,insert,update,delete</allowed-methods>
	</action> 
	
-->
	
</body>
</html>
