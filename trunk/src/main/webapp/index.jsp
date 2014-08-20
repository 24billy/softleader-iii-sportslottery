<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<body>
<h2>Hello World!</h2>
<a href="odds">odds</a><br>
<a href="Match.jsp">Match</a><br>
<a href="odds?gameId=1">OddType(Id=1)</a><br>
<a href="Admin/index.jsp">Game Manager</a><br>
<a href="Event/match-index.jsp">Game info</a><br>
<a href="<c:url value="/History/historyIndex.jsp"/>">History Index</a><br>


<hr>
<a href="http://getbootstrap.com/">BootStrap</a><br>
<a href="http://fortawesome.github.io/Font-Awesome/">BootStrap.icon</a><br>

<!-- 先去spring-struts.xml找出oddsAction的位置去執行oddsAction裡的execute()，成功後，執行Json/oddsJson.jsp
	struts.xml:
	<action name="odds" class="oddsAction" method="execute">
		<result name="success">Json/oddsJson.jsp</result>
		<result name="input">Json/oddsJson.jsp</result>
		<allowed-methods>select,insert,update,delete</allowed-methods>
	</action> 
	
-->
	
</body>
</html>
