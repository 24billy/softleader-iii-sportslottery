package tw.com.softleader.sportslottery.setting.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.joda.time.LocalDateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;

public class GameDaoTest extends BaseTest{

	@Autowired
	private GameDao dao;
	@Test
	public void test() {
		
		int os = 0;
		int ts = 0;
		
		List<GameEntity> models = dao.findAll();
		if (models!=null){
			os = models.size();
		}
		
		GameEntity entity = new GameEntity();
		LocalDateTime time = new LocalDateTime();
		entity.setGameTime(time);
		entity.setGameNum(100l);
		entity.setGameScoreHome(99l);
		entity.setGameScoreAway(101l);
		entity.setLeagueName("太平洋聯盟");
		entity.setBallType("Baseball");
		
		dao.insert(entity);

		models = dao.findAll();
		if (models!=null){
			ts = models.size();
		}
		
		log.debug("after insert totalSize = {}", ts);
		assertEquals(os + 1, ts);
	}

}
