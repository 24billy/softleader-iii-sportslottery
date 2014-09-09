package tw.com.softleader.sportslottery.setting.dao;

import static org.junit.Assert.assertEquals;

import java.util.List;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

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
		
//		LocalDateTime date1 = new LocalDateTime();
//		date1 = LocalDateTime.parse("2014-01-01T10:15:30");//將時間自串轉成 LocalDateTime
//		LocalDateTime date2 = new LocalDateTime();
//		date2 = LocalDateTime.parse("2014-12-31T07:04:00");
//		LocalDateTime date3 = new LocalDateTime();
//		date3 = LocalDateTime.parse("2014-08-20T10:15:30");
		
//		models = dao.findForHistory(date1, null, null);//結果數據不對, 得空值
//		models = dao.findForHistory(date3, null, null);//結果數據不對， 得空值
//		models = dao.findForHistory(null, date3, null);//結果數據正確
//		models = dao.findForHistory(null, date2, null);//結果數據正確
//		models = dao.findForHistory(date1, date2, null);//結果數據錯誤
//		
//		log.debug("findForHistory = {}", models);
//		System.out.println("size of the searching result: "+models.size());
//----------------------------------------------------------------------------------
/*		List<GameEntity> models = dao.findGameByLeagueName("MLB");
		log.debug("findGameByLeagueName = {}", models);
		System.out.println("size of the searching result: "+models.size());*/
		
//-------------test public List<GameEntity> findGameByPeriod(LocalDate timeFrom, LocalDate timeTo)
/*		LocalDate date1 = new LocalDate();
		date1 = LocalDate.parse("2014-08-20");//將時間自串轉成 LocalDateTime
		//log.debug("date1= {} ", date1);
		LocalDate date2 = new LocalDate();
		date2 = LocalDate.parse("2014-08-21");
		List<GameEntity> models = dao.findGameByPeriod(date1, date2);
		log.debug("findGameByPeriod = {}", models);
		System.out.println("size of the searching result: "+models.size());*/
//---------------------List<OddsEntity> getOddsByTime(LocalDate gameTime)----------------------
		LocalDate date1 = new LocalDate();
		date1 = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
		//log.debug("date1= {} ", date1);
		String teamName= "辛辛那堤紅人";
		List<OddsEntity> models = dao.getOddsByTimeAndTeamName(date1, teamName);
		log.debug("getOddsByTime = {}", models);
		System.out.println("size of the searching result: "+models.size());
		
////---------------------List<GameEntity> getGameByTimeAndNam----------------------
//		LocalDate date1 = new LocalDate();
//		date1 = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
//		//log.debug("date1= {} ", date1);
//		String teamName= "辛辛那堤紅人";
//		List<GameEntity> models = dao.getGameByTimeAndName(date1, teamName);
//		log.debug("getOddsByTime = {}", models);
//		System.out.println("size of the searching result: "+models.size());
		
		
		
		
		
		
		
	}

	

	
	
}
