package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.Map;

import org.joda.time.LocalDate;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

public class OddsServiceTest extends BaseTest {
	
	@Autowired
	private OddsService oddsService;
	@Autowired
	private GameDao gamedao;
	
	@Test
	public void service() {
	
//		List<OddsEntity> models = null;
//		
//		models = oddsService.getByGameId(1L);
//		
//		log.debug("getByGameId models = {}", models);
//		
//		models = oddsService.getByOddType("SU_H");
//		
//		log.debug("getByOddType('SU_H') models = {}", models);
//		
//		Long gameId = 0L;
//		Double oddValue = 0.00;
//		String oddType = "";
//		
//		if (models.get(0) != null) {
////			gameId = models.get(0).getGameId().getId();
//			oddValue = models.get(0).getOddValue().doubleValue();
//			oddType = models.get(0).getOddType();
//		}
//		
//		assertEquals(oddValue, oddsService.getOddValue(gameId, oddType));

	
//----------------------------test Map<String,OddsEntity> from_OddsEntityList_To_OddsEntityMap(List<OddsEntity> OddsList)	

	
//	LocalDate date1 = new LocalDate();
//	date1 = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
//	//log.debug("date1= {} ", date1);
//	String teamName= "辛辛那堤紅人";
//	List<OddsEntity> oddList = gamedao.getOddsByTimeAndTeamName(date1, teamName);
////	log.debug("oddList = {}", oddList );
//	
//	Map<String,OddsEntity> map = oddsService.from_OddsEntityList_To_OddsEntityMap(oddList);
//	log.debug("getOddsByTimeAndTeamName map = {}", map);
	
	
	
	}	
	
	
	
}
