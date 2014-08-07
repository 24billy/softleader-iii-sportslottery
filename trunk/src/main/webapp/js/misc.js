/**
 * 
 */

function millisecondToDate(millisecond){
	var d = new Date(millisecond);
	var str = d.getUTCFullYear() + "年" + (d.getUTCMonth()+1) + "月" + d.getUTCDate() + "日";
	return str;
}

function millisecondToTime(millisecond){
	var d = new Date(millisecond);
	var day = "";
	if (d.getUTCDay() == 1) {
		day = "一";
	} else if (d.getUTCDay() == 2) {
		day = "二";
	} else if (d.getUTCDay() == 3) {
		day = "三";
	} else if (d.getUTCDay() == 4) {
		day = "四";
	} else if (d.getUTCDay() == 5) {
		day = "五";
	} else if (d.getUTCDay() == 6) {
		day = "六";
	} else if (d.getUTCDay() == 0) {
		day = "日";
	} else {
		day = "大老你開掛吧";
	}

	var str = d.getUTCHours() + ":" + (d.getUTCMinutes()) + "(" + day + ")";
	return str;
}

function getMatchDates(models){
	var matchDate = [];
	$.each(models, function(index,model){
		var d = millisecondToDate(model.gameTime.iLocalMillis);
		var isRepeat = false;
		$.each(matchDate, function(index,value){
			if(value!=null && d == value){
				isRepeat = true;
			}
		});
		if(!isRepeat){
			matchDate.push(d);
		}
	});
	
	return matchDate;
}