package tw.com.softleader.sportslottery.setting.dao;

import org.joda.time.LocalDate;
import org.junit.Test;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

public class UserDaoTest extends BaseTest {

	@Test
	public void test() {
		UserDao dao = new UserDao();
		UserEntity entity = new UserEntity();
		//entity.setCreator("Ken123");
		entity.setUSER_ACCOUNT("ken");
		entity.setUSER_PASSWORD("a123456");
		entity.setUSER_NAME("Ken");
		entity.setUSER_EMAIL("ken@gmail.com");
		entity.setUSER_GENDER("male");
		entity.setUSER_PHONE("0988123456");
		LocalDate birthDate = new LocalDate();
		entity.setUSER_BIRTHDAY(birthDate);
		log.debug(entity.toString());
		dao.insert(entity);
		
	}

}
