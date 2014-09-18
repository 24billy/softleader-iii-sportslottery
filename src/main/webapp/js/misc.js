/**
 * 
 */

function millisecondToDate(millisecond){
	var d = new Date();
	var n = d.getTimezoneOffset()*60000;
	d = new Date(millisecond+n);
	var month = (d.getUTCMonth()+1);
	if (month<10) {
		month = "0" + month;
	}
	var day = d.getUTCDate();
	if (day<10) {
		day = "0" + day;
	}
	var str = d.getUTCFullYear() + "年" + month + "月" + day + "日";
	return str;
}

function millisecondToTime(millisecond){
	var d = new Date();
	var n = d.getTimezoneOffset()*60000;
	d = new Date(millisecond+n);
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

	var hr = d.getUTCHours();
	if (hr<10){
		hr = "0" + hr;	
	}
	
	var min = d.getUTCMinutes();
	if (min<10){
		min = "0" + min;	
	}
	
	var str = hr + ":" + (min) + "(" + day + ")";
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

//把OddType轉換成中文
function castOddType(oddType) {
	switch(true) {
		case (oddType.charAt('SU') != -1):
			return '不讓分';
			break;
		case (oddType.charAt('ATS') != -1):
			return '讓分';
			break;
		case (oddType.charAt('SC') != -1):
			return '總分';
			break;
		default:
			alert('轉換失敗');
	}	
}
//將game.odds賦予KEY值
function sortGameOdds(gameOdds) {
	var sortedOdds = [];
	
	$.each(gameOdds, function(index, odd){
		switch(odd.oddType) {
	    case 'SU_A':
	    	sortedOdds['SU_A'] = odd;
	    	break;
	    case 'SU_H':
	    	sortedOdds['SU_H'] = odd;
			break;
	    case 'ATS_A':
	    	sortedOdds['ATS_A'] = odd;
	    	break;
	    case 'ATS_H':
	    	sortedOdds['ATS_H'] = odd;
	    	break;
	    case 'SC_H':
	    	sortedOdds['SC_H'] = odd;
	    	break;
	    case 'SC_L':
	    	sortedOdds['SC_L'] = odd;
	    	break;
	    case 'ODD':
	    	sortedOdds['ODD'] = odd;
	    	break;
	    case 'EVEN':
	    	sortedOdds['EVEN'] = odd;
	    	break;
	    default:
	    	break;
		}
	});
	
	return sortedOdds;
}
//計算最高中獎金額
function getCapitalByOdd(lotteryOddValue,combinations){
		var temparray = [];	
		var begin=0;
		var index=0;
		var totalCapital =0;
		getCombination(lotteryOddValue, combinations, begin, temparray, index);
		return totalCapital;  //回傳所有中獎下注的總合係數
		
	function getCombination(lotteryOddValue, combinations, begin, temparray, index) {  
        var oddcapital = 1;
//如果n足夠，輸出  temparray
        if(combinations == 0){
        	var str = "";
            for(var i = 0; i < index; i++){  
            	str += temparray[i]+" ";
            	oddcapital=oddcapital*temparray[i];
            }
            totalCapital+=oddcapital;
            return;  
        }          
        for(var i = begin; i < lotteryOddValue.length; i++){  
        	temparray[index] = lotteryOddValue[i];  
            getCombination(lotteryOddValue, combinations-1, i+1, temparray, index+1);  
        }  
         
    }
}