package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

public class OddsServiceTest extends BaseTest {
	
	@Autowired
	private OddsService oddsService;
	
	@Test
	public void service() {
		
		List<OddsEntity> models = null;
		
		models = oddsService.getByGameId(1L);
		
		log.debug("getByGameId models = {}", models);
		
		models = oddsService.getByOddType("SU_H");
		
		log.debug("getByOddType('SU_H') models = {}", models);
		
		Long gameId = 0L;
		Double oddValue = 0.00;
		String oddType = "";
		
		if (models.get(0) != null) {
			gameId = models.get(0).getGameId().getId();
			oddValue = models.get(0).getOddValue().doubleValue();
			oddType = models.get(0).getOddType();
		}
		
		assertEquals(oddValue, oddsService.getOddValue(gameId, oddType));
	}

}
