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
		
//		int os = 0;
//		int ts = 0;
//		
		List<GameEntity> models = dao.findAll();
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
		
		LocalDateTime date1 = new LocalDateTime();
		date1 = LocalDateTime.parse("2014-01-01T10:15:30");//將時間自串轉成 LocalDateTime
		LocalDateTime date2 = new LocalDateTime();
		date2 = LocalDateTime.parse("2014-12-31T07:04:00");
		LocalDateTime date3 = new LocalDateTime();
		date3 = LocalDateTime.parse("2014-08-20T10:15:30");
		
//		models = dao.findForHistory(date1, null, null);//結果數據不對, 得空值
//		models = dao.findForHistory(date3, null, null);//結果數據不對， 得空值
//		models = dao.findForHistory(null, date3, null);//結果數據正確
//		models = dao.findForHistory(null, date2, null);//結果數據正確
		models = dao.findForHistory(date1, date2, null);//結果數據錯誤
		
		log.debug("findForHistory = {}", models);
		System.out.println("size of the searching result: "+models.size());
	}

}
