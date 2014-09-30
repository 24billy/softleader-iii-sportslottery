package tw.com.softleader.sportslottery.setting.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

public class UserDaoTest extends BaseTest {

	@Autowired
	private UserDao dao;
	
	@Test
	public void test() throws ParseException {
		
		LocalDate date1 = new LocalDate();
		date1 = LocalDate.parse("2014-08-26");//將時間自串轉成 LocalDate		
		
		System.out.println("--------Test:findByUserAccount--------");
		System.out.println("findByUserAccount :" + dao.findByUserAccount("jackychen"));
		
		System.out.println("--------Test:findByCreateTime--------");
		System.out.println(date1.plusDays(1));
		System.out.println("findByCreateTime :" + dao.findByCreateTime(date1));
		System.out.println("findByCreateTime :" + dao.findByCreateTime(date1).size());
		
		System.out.println("--------Test:findByUserCardId--------");
		log.debug(dao.findByUserCardId("A223456788").toString());
		
		System.out.println("--------Test:updateUserCoin--------");
		log.debug("--------Test:updateUserCoin--------"+dao.updateUserCoin(2l, 5001l));
		System.out.println("findByUserAccount :" + dao.findByUserAccount("chen"));
		
		System.out.println("--------Test:findByUserEmail--------");
		log.debug("--------Test:findByUserEmail--------"+dao.findByUserEmail("chen@gmail.com"));
		
	}

}
