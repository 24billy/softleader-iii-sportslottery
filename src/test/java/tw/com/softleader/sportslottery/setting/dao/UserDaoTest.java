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
//		entity.setModifier("ken");
		entity.setUserPassword("a123456");
		entity.setUserName("Ken");
		entity.setUserEmail("ken@gmail.com");
		entity.setUserGender("male");
		entity.setUserPhone("0988123456");
		LocalDate birthDate = new LocalDate();
		entity.setUserBirthday(birthDate);
		log.debug(entity.toString());
		dao.insert(entity);
		
	}

}
