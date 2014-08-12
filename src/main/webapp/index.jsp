<html>
<body>
<h2>Hello World!</h2>
<a href="odds">oddsJson</a>
<!-- 先去spring-struts.xml找出oddsAction的位置去執行oddsAction裡的execute()，成功後，執行Json/oddsJson.jsp
	struts.xml:
	<action name="odds" class="oddsAction" method="execute">
		<result name="success">Json/oddsJson.jsp</result>
		<result name="input">Json/oddsJson.jsp</result>
		<allowed-methods>select,insert,update,delete</allowed-methods>
	</action> 
	
-->
	
<a href="game">Match</a>
<!-- 如odds -->
</body>
</html>
