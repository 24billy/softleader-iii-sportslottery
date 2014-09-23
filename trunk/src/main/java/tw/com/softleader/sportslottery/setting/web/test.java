package tw.com.softleader.sportslottery.setting.web;

import org.joda.time.LocalDate;

public class test {

	public static void main(String[] args) {
		LocalDate date = new LocalDate();
		LocalDate checkDate;
		
		try {
			checkDate = new LocalDate(date.getYear()-18,date.getMonthOfYear(),date.getDayOfMonth());
		} catch (Exception e) {
			checkDate = new LocalDate(date.getYear()-18,date.getMonthOfYear(),28);
		}
		System.out.println(checkDate.getValue(0)-date.getValue(0));
		if((checkDate.getValue(0)-date.getValue(0)) <= 18 && 
				(date.getValue(1)-checkDate.getValue(1)) <= 0 &&
				(date.getValue(2)-checkDate.getValue(2) < 0)) {
			
			
		}
	}
}
