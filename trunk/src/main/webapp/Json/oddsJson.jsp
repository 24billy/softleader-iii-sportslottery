<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Odds Json</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
</head>
<body>
<div id="json">
	${modelsJson}
</div>

<script>
(function($) {
	var json = '${modelsJson}';

	var odds = $.parseJSON(json);
	$.each(odds, function(index, value) {
		console.log("-=ODDS=-");
		$.each(value, function(key, value) {
			console.log(key + ":" + value);
		});
		console.log("-=GAME=-");
		$.each(value.gameId, function(key, value) {
			console.log(key + ":" + value);
		});
	});

})(jQuery);
</script>
</body>
</html>