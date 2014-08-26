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
		System.out.println("--------Test:findByID--------");
		System.out.println(dao.findById(1L).getUserId());
		
		LocalDateTime date1 = new LocalDateTime();
		date1 = LocalDateTime.parse("2014-08-08T00:00:00");//將時間自串轉成 LocalDateTime
		LocalDateTime date2 = new LocalDateTime();
		date2 = LocalDateTime.parse("2014-08-09T00:00:00");
		LocalDateTime date3 = new LocalDateTime();
		date3 = LocalDateTime.parse("2014-08-11T00:00:00");
		
		System.out.println(date1);
		System.out.println(date1.plusDays(1));
		
		System.out.println("--------Test:findByTime--------");
		System.out.println(dao.findByTime(date1, null).size());
		System.out.println(dao.findByTime(null, date2).size());
		System.out.println(dao.findByTime(date2, date3).size());
		
		System.out.println("--------Test:findComplex--------");
		System.out.println(dao.findComplex(null, null, null).size());
		System.out.println(dao.findComplex(1L, null, null).size());
		System.out.println(dao.findComplex(null, date1, null).size());
		System.out.println(dao.findComplex(null, null, date2).size());
		System.out.println(dao.findComplex(null, date2, date3).size());
		System.out.println(dao.findComplex(1L, date1, null).size());
	}

}
