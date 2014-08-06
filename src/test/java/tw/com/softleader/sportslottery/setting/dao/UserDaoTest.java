package tw.com.softleader.sportslottery.setting.dao;

import org.junit.Test;

import tw.com.softleader.sportslottery.setting.entity.UserEntity;

public class UserDaoTest {

	@Test
	public void test() {
		UserDao dao = new UserDao();
		UserEntity entity = new UserEntity();
		entity.setCreator("Ken");
		entity.setUSER_ACCOUNT("");
	}

}
