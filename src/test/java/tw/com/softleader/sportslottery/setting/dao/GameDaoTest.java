package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.joda.time.LocalDateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;

public class GameDaoTest extends BaseTest{

	@Autowired
	private GameDao dao;
//	@Test
//	public void test() {
		
//		int os = 0;
//		int ts = 0;
//		
//		List<GameEntity> models = dao.findAll();
////		log.debug("all = {}", models);
////		if (models!=null){
////			os = models.size();
////		}
////		
////		GameEntity entity = new GameEntity();
////		LocalDateTime time = new LocalDateTime();
////		entity.setGameTime(time);
////		entity.setGameNum(100l);
////		entity.setGameScoreHome(99l);
////		entity.setGameScoreAway(101l);
////		entity.setLeagueName("太平洋聯盟");
////		entity.setBallType("Baseball");
////		
////		dao.insert(entity);
////
////		models = dao.findAll();
////		if (models!=null){
////			ts = models.size();
////		}
////		
////		log.debug("after insert totalSize = {}", ts);
////		assertEquals(os + 1, ts);
////		
////		models = dao.findByBallType("Baseball");
////		log.debug("findByBallType models = {}", models);
//		
////		LocalDate date1 = new LocalDate();
////		date1 = LocalDate.parse("2014-08-31");//將時間自串轉成 LocalDateTime
////		LocalDateTime date2 = new LocalDateTime();
////		date2 = LocalDateTime.parse("2014-12-31T07:04:00");
////		LocalDateTime date3 = new LocalDateTime();
////		date3 = LocalDateTime.parse("2014-08-20T10:15:30");
//		

//		models = dao.findByBallType("Baseball");
//		log.debug("findByBallType models = {}", models);
		
//		LocalDate date1 = new LocalDate();
//		date1 = LocalDate.parse("2014-08-31");//將時間自串轉成 LocalDateTime
//		LocalDateTime date2 = new LocalDateTime();
//		date2 = LocalDateTime.parse("2014-12-31T07:04:00");
//		LocalDateTime date3 = new LocalDateTime();
//		date3 = LocalDateTime.parse("2014-08-20T10:15:30");
		
//		models = dao.findForHistory(null, date1, "辛辛那堤紅人");//結果數據不對, 得空值
//		models = dao.findForHistory(date3, null, null);//結果數據不對， 得空值
//		models = dao.findForHistory(null, date3, null);//結果數據正確
//		models = dao.findForHistory(null, date2, null);//結果數據正確
//		LocalDate date1=dao.findById(29L).getGameTime().toLocalDate();
//		String teamName= dao.findById(29L).getTeamHome().getTeamName() ;
//		models = dao.findForHistory(null, date1,teamName);
//		List<GameEntity> models = dao.findForHistory(null, null,teamName);
//		log.debug("game = {}", dao.findById(2L));
//		log.debug("Gametime= {}",dao.findById(2L).getGameTime().toLocalDate() );
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
//---------------------List<OddsEntity> getOddsByTimeAndTeamName(date1, teamName);----------------------
//		LocalDate date1 = new LocalDate();
//		date1 = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
//		//log.debug("date1= {} ", date1);
//		String teamName= "辛辛那堤紅人";
//		List<OddsEntity> models = dao.findOddsByTimeAndTeamName(date1, teamName);
//		log.debug("getOddsByTime = {}", models);

////		models = dao.findForHistory(null, date1, "辛辛那堤紅人");//結果數據不對, 得空值
////		models = dao.findForHistory(date3, null, null);//結果數據不對， 得空值
////		models = dao.findForHistory(null, date3, null);//結果數據正確
////		models = dao.findForHistory(null, date2, null);//結果數據正確
//		LocalDate date1=dao.findById(29L).getGameTime().toLocalDate();
//		String teamName= dao.findById(29L).getTeamHome().getTeamName() ;
//		models = dao.findForHistory(null, date1,teamName);
////		log.debug("game = {}", dao.findById(2L));
////		log.debug("Gametime= {}",dao.findById(2L).getGameTime().toLocalDate() );
//		log.debug("findForHistory = {}", models);

//		System.out.println("size of the searching result: "+models.size());
////----------------------------------------------------------------------------------
///*		List<GameEntity> models = dao.findGameByLeagueName("MLB");
//		log.debug("findGameByLeagueName = {}", models);
//		System.out.println("size of the searching result: "+models.size());*/
//		
////-------------test public List<GameEntity> findGameByPeriod(LocalDate timeFrom, LocalDate timeTo)
///*		LocalDate date1 = new LocalDate();
//		date1 = LocalDate.parse("2014-08-20");//將時間自串轉成 LocalDateTime
//		//log.debug("date1= {} ", date1);
//		LocalDate date2 = new LocalDate();
//		date2 = LocalDate.parse("2014-08-21");
//		List<GameEntity> models = dao.findGameByPeriod(date1, date2);
//		log.debug("findGameByPeriod = {}", models);
//		System.out.println("size of the searching result: "+models.size());*/
////---------------------List<OddsEntity> getOddsByTimeAndTeamName(date1, teamName);----------------------
////		LocalDate date1 = new LocalDate();
////		date1 = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
////		//log.debug("date1= {} ", date1);
////		String teamName= "辛辛那堤紅人";
////		List<OddsEntity> models = dao.findOddsByTimeAndTeamName(date1, teamName);
////		log.debug("getOddsByTime = {}", models);
////		System.out.println("size of the searching result: "+models.size());
//		
//////---------------------List<GameEntity> getGameByTimeAndNam----------------------
////		LocalDate date1 = new LocalDate();
////		date1 = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
////		//log.debug("date1= {} ", date1);
////		String teamName= "辛辛那堤紅人";
////		List<GameEntity> models = dao.getGameByTimeAndName(date1, teamName);
////		log.debug("getOddsByTime = {}", models);
////		System.out.println("size of the searching result: "+models.size());
		
		
		
		
		
		
		
//	}
	/*
	@Test
	public void testFindFinishedGameToday() {
		
	    List<GameEntity> games = dao.findFinishedGameToday();
		for (GameEntity game : games) {
			System.out.println("game:"+game);
		}
	}
	*/
	

	@Test
	public void testFindByLocalDateTime(){
		String gameTimeStr="2014-09-16T08:55";
		LocalDateTime gameTime = LocalDateTime.parse(gameTimeStr);
		System.out.println(gameTime.toString());//2014-09-16T08:55:00.000
		List<GameEntity> games = dao.findByLocalDateTime(gameTime);
//		log.debug("testFindByLocalDateTime = {}", games);
		for(GameEntity game:games){
			System.out.println(game);
		}
		System.out.println("size of games = "+ games.size());
	}
}
