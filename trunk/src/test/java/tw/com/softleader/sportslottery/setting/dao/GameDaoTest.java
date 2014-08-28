package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.joda.time.LocalDate;
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
		
//		int os = 0;
//		int ts = 0;
//		
//		List<GameEntity> models = dao.findAll();
//		if (models!=null){
//			os = models.size();
//		}
//		
//		GameEntity entity = new GameEntity();
//		LocalDateTime time = new LocalDateTime();
//		entity.setGameTime(time);
//		entity.setGameNum(100l);
//		entity.setGameScoreHome(99l);
//		entity.setGameScoreAway(101l);
//		entity.setLeagueName("太平洋聯盟");
//		entity.setBallType("Baseball");
//		
//		dao.insert(entity);
//
//		models = dao.findAll();
//		if (models!=null){
//			ts = models.size();
//		}
//		
//		log.debug("after insert totalSize = {}", ts);
//		assertEquals(os + 1, ts);
//		
//		models = dao.findByBallType("Baseball");
//		log.debug("findByBallType models = {}", models);
		
		LocalDate date1 = new LocalDate();
		date1 = LocalDate.parse("2014-08-18");//將時間自串轉成 LocalDateTime
		LocalDate date2 = new LocalDate();
		date2 = LocalDate.parse("2014-08-18");
		LocalDate date3 = new LocalDate();
		date3 = LocalDate.parse("2014-08-20");
		
		List<GameEntity> models = null;
		models = dao.findForHistory(date1, date2, null);
/*		models = dao.findForHistory(date3, null, null);//結果數據不對， 得空值
		models = dao.findForHistory(null, date3, null);//結果數據正確
		models = dao.findForHistory(null, date2, null);//結果數據正確
		models = dao.findForHistory(date1, date2, null);//結果數據錯誤
*/		
		log.debug("findForHistory = {}", models);
		System.out.println("size of the searching result: "+models.size());
//----------------------------------------------------------------------------------
//		List<GameEntity> models = dao.findGameByLeagueName("MLB");
//		log.debug("findGameByLeagueName = {}", models);
//		System.out.println("size of the searching result: "+models.size());
		
//		LocalDateTime date1 = new LocalDateTime();
//		System.out.println(date1.minusDays(10).toDate());
//		System.out.println(dao.findComplex(null, null, false, date1.minusDays(3), null).size());
		
	}

}
