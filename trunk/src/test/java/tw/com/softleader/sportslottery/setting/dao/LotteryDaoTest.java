package tw.com.softleader.sportslottery.setting.dao;

import org.joda.time.LocalDateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;

public class LotteryDaoTest extends BaseTest {
	
	@Autowired
	private LotteryDao dao;
	
	@Test
	public void test() {
		LocalDateTime date1 = new LocalDateTime();
		date1 = LocalDateTime.parse("2014-08-08T00:00:00");//將時間自串轉成 LocalDateTime
		LocalDateTime date2 = new LocalDateTime();
		date2 = LocalDateTime.parse("2014-08-09T00:00:00");
		LocalDateTime date3 = new LocalDateTime();
		date3 = LocalDateTime.parse("2014-08-11T00:00:00");
		
		System.out.println(dao.findByTime(date1, null).size());
		System.out.println(dao.findByTime(null, date2).size());
		System.out.println(dao.findByTime(date2, date3).size());
		System.out.println(dao.findById(1L));
	}

}
