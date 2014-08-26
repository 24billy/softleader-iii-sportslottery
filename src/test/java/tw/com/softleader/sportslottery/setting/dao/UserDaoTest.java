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
		
		UserEntity entity = dao.findById(1l);
		
		
		log.debug(entity.toString());
		
		
		//LocalDateTime date1 = new LocalDateTime();
		//date1 = LocalDateTime.parse("2014-08-25");
		
		//SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.S");
		//java.util.Date date = sFormat.parse("2014-08-26 13:30:38.315");
		LocalDate date1 = new LocalDate();
		date1 = LocalDate.parse("2014-08-26");//將時間自串轉成 LocalDate
		System.out.println(date1.plusDays(1));
		System.out.println("entity :" + dao.findByCreateTime(date1));
		//System.out.println(dao.findByUserAccount("jackychen"));
		
	}

}
