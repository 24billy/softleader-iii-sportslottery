package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.dao.UserDao;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

public class UserServiceTest extends BaseTest{

	@Autowired
	private UserService userService;
	@Autowired
	private UserDao dao;
	List<UserEntity> models=null;
	UserEntity model=null;
	
	@Test
	public void testGetByUserAccount() {
		model=userService.getByUserAccount("CHEN");
		log.debug("GetByUserAccount:{}",model);
	}
	
	@Test
	public void testGetByUserEmail() {
		model=userService.getByUserEmail("wANg@gMail.Com");
		log.debug("GetByUserEmail:{}",model);
	}
}
