package tw.com.softleader.sportslottery.setting.service;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

public class LotteryServiceTest extends BaseTest {
	
	@Autowired
	UserService userService;
	
	@Autowired
	LotteryService lotteryService;
	
	@Test
	public void test() {
		UserEntity user = userService.getById(1L);
		log.debug("user = {}", user);
		LotteryEntity lottery = new LotteryEntity();
		lottery.setUserId(user);
		lotteryService.insert(lottery);
	}

}
