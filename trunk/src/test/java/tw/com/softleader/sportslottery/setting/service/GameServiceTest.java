package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;

public class GameServiceTest extends BaseTest{
	@Autowired
	GameService gameService;

	@Test
	public void service(){
		List<GameEntity> models = gameService.getByLeagueName("MLB");
		log.debug("getByLeagueName models={}", models);
		System.out.println("The size of the result: "+ models.size());
		
	}

}
