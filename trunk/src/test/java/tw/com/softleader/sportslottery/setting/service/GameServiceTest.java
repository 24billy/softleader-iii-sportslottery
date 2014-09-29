package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.util.CountBean;

public class GameServiceTest extends BaseTest  {
	@Autowired
	private GameService gameService;
	private Map<String, CountBean> map2;
	
////	List<GameEntity> models=null;
////	GameEntity model=null;
	@Test
	public void testGetAll() {
		List<GameEntity> games=gameService.getAll();
		assertNotNull(games);
		System.out.println("印出所有GameEntity內容:");
		for(GameEntity game : games){
			System.out.println(game);
		}
		System.out.println("size of all GameEntity: "+ games.size());
		
	}
	
	@Test
	public void testGetByBallType(){
		String ballType="Baseball";
		List<GameEntity> games = gameService.getByBallType(ballType);
		System.out.println("印出使用getByBallType得出的 GameEntity內容:");
		for(GameEntity game : games){
			System.out.println(game);
		}
		System.out.println("size of all getByBallType ("+ballType + "): "+ games.size());
		
	}
	
	@Test
	public void testGetForHistory(){
		LocalDate timeFrom = LocalDate.parse("2014-08-26"), timeTo = LocalDate.parse("2014-09-27");
		String teamName = "底特律老虎";
		List<GameEntity> games = gameService.getForHistory(timeFrom, timeTo, teamName);
		System.out.println("印出使用getForHistory得出的 GameEntity內容:");
		for(GameEntity game : games){
			System.out.println(game);
		}
		System.out.println("size of getForHistory("+timeFrom +", "+timeTo+", "+teamName+ "): "+ games.size());	
	}
	
	@Test
	public void testGetByGameNum(){
		Long gameNum=111L;
		GameEntity game = gameService.getByGameNum(gameNum);
		log.debug("getByGameNum={}", game);
	}
	
	@Test 
	public void testGetComplex(){
		Long gameNum =null, gameStatusMin=null, gameStatusMax=null;
		String teamName=null, ballType=null, leagueName=null;
		LocalDate timeBegin=null, timeEnd=null;
		List<GameEntity> games = gameService.getComplex(gameNum, teamName, gameStatusMin, gameStatusMax, timeBegin, timeEnd, ballType, leagueName);
		System.out.println("印出使用getComplex得出的 GameEntity內容:");
		for(GameEntity game : games){
			System.out.println(game);
		}
		System.out.println("size of getComplex("+gameNum +", "+teamName+", "+gameStatusMin+", "+gameStatusMax+", "+timeBegin+", "+timeEnd+", "+ballType+", "+leagueName+ "): "+ games.size());		
	}
	
	@Test
	public void testMaxGameNum(){
		Long max = gameService.maxGameNum();
		log.debug("maxGameNum ={}", max);//maxGameNum =150
	}


	@Test
	public void testGetById() {
//		model=gameService.getById(1L);
//		System.out.println(model);
	}

	@Test
	public void testInsert() {
		
	}

	@Test
	public void testUpdate() {

	}

	@Test
	public void testDelete() {
		List<GameEntity> models = gameService.getAll();
		int originSize = models.size();
		GameEntity entity = gameService.getById(11L);
		log.debug("entity = {}", entity);
		gameService.delete(entity);
		
		models = gameService.getAll();
		int currentSize = models.size();
		assertEquals(originSize - 1, currentSize);
	}

	@Test
	public void testGetAllJSON() {
		
	}
	@Test
	public void testGetGameIdByGameNum(){
		Long gameNum;
//		gameNum=111L;//gameId=11
		gameNum=null;//gameId=null
		
		Long gameId = gameService.getGameIdByGameNum(gameNum);
		log.debug("getGameIdByGameNum ={}", gameId);
	}
	@Test
	public void testGetTotalCount(){
		Long totalCount=gameService.getTotalCount(2L);
		log.debug("total count= {}", totalCount);
		
		Long totalCount2=gameService.getTotalCount(210200L);
		log.debug("total count2= {}", totalCount2);
	}
	
	@Test
	public void testGetCount(){
		Long gameId=2L;
		String oddType= "SU_H";
		Long count = gameService.getCount(gameId, oddType);
		Long expectedCount = 100L;
		assertEquals(expectedCount, count);
	}

	@Test
	public void testGetIsPass(){
		Long gameId=2L;
		String oddType= "SU_H";
		boolean isPass= gameService.getIsPass(gameId, oddType);
		boolean expectedBoolean= true;
		assertEquals(expectedBoolean, isPass);
	}
	
	@Test
	public void testIsPassPercentage(){
		Long gameId=2L;
		String oddType= "SU_H";
		String oddType2="SU_A";
		BigDecimal percent= gameService.getIsPassPercentage(gameId, oddType);
		BigDecimal percent2= gameService.getIsPassPercentage(gameId, oddType2);
		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);//預防無限小數
		BigDecimal expPercent = new BigDecimal("100").divide(new BigDecimal("3300"),mc);
		BigDecimal expPercent2 = new BigDecimal(0);
		assertEquals(expPercent, percent);
		assertEquals(expPercent2, percent2);
	}
	
	@Test
	public void testGetCountBean(){
		Long gameId=2L;
		String oddType= "SU_H";
		String oddType2="SU_A";
		CountBean beanSUH= gameService.getCountBean(gameId, oddType);
		CountBean beanSUA= gameService.getCountBean(gameId, oddType2);
		log.debug("beanSUH = {}", beanSUH.toString());
		log.debug("beanSUA = {}", beanSUA.toString());

	}
	
	@Test
	public void testGetCountInfoByGameId(){
		Long gameId=2L;
		Map<String, CountBean> map = gameService.getCountInfoByGameId(gameId);
		log.debug("graphBar = {}", map.toString());
		//result:graphBar = {
		//ATS_H= CountBean [count=500, oddType=ATS_H, percentage=0, gameId=2, isPass=false], 
		//SU_A =  CountBean [count=300, oddType=SU_A, percentage=0, gameId=2, isPass=false], 
		//ATS_A= CountBean [count=400, oddType=ATS_A, percentage=0.12, gameId=2, isPass=true], 
		//EVEN =  CountBean [count=400, oddType=EVEN, percentage=0, gameId=2, isPass=false], 
		//SC_L =  CountBean [count=800, oddType=SC_L, percentage=0, gameId=2, isPass=false], 
		//SU_H =  CountBean [count=100, oddType=SU_H, percentage=0.030, gameId=2, isPass=true], 
		//ODD  =  CountBean [count=200, oddType=ODD, percentage=0.061, gameId=2, isPass=true], 
		//SC_H =  CountBean [count=600, oddType=SC_H, percentage=0.18, gameId=2, isPass=true]
		}
	@Test
	public void testGetCountInfoHistory(){
		
//		Long gameNum = 136L;
		Long gameNum = null;
		Long gameId=gameService.getGameIdByGameNum(gameNum);
//		System.out.println("gameId: "+ gameId);
//		System.out.println(gameService.getComplex(136L, null, null, null, null, null, null, null));
//		String teamName= "密爾瓦基釀酒人";
		String teamName = null;
//		Long gameId =null;
		List<Map<String, CountBean>> listMap = gameService.getCountInfoHistory(teamName, gameId);
		log.debug("listMap = {}",listMap.toString() );
		System.out.println("size of listMap: "+ listMap.size() );

	}
	
	@Test
	public void testGetAllCountHistoryByTeam(){
		String teamName= "紐約洋基";
		List<Map<String, CountBean>> listMap = gameService.getAllCountHistoryByTeam(teamName);
		log.debug("listMap = {}",listMap.toString() );
		System.out.println("size of listMap: "+ listMap.size() );
		
	}
	
	@Test
	public void testSortByComparator(){
		
		map2 = gameService.getSortByComparator(gameService.getCountInfoByGameId(36L));
		log.debug("map2 = {}", map2.toString());
	}
	
	@Test
	public void testGetPopularOdd(){
		String teamName= "密爾瓦基釀酒人";
		Long gameId= 36L;
		List<Map<String, CountBean>> listMap  = gameService.getCountInfoHistory(teamName, gameId);
		List<CountBean> list = gameService.getSortCountHistory(listMap);
		for(CountBean bean: list){
			System.out.println(bean.toString());
		}
		System.out.println();
		System.out.println(list.get(0));


	}
	
	@Test
	public void testAddMaxBeanToCountHistory(){
//		String teamName= "密爾瓦基釀酒人";
		
		String teamName = null;
		Long gameId= null;
		List<Map<String, CountBean>> listMap = gameService.addMaxBeanToCountHistory(teamName, gameId);
		System.out.println("AddMaxBeanToCountHistory().................");
		for(Map<String, CountBean> map: listMap){
			System.out.println(map);
		}
		System.out.println("size of map:"+listMap.size());

		
	}
	

	@Test
	public void testGetGameByLocalDateTime(){
		String gameTimeStr="2014-09-16T08:55";
		LocalDateTime gameTime = LocalDateTime.parse(gameTimeStr);
		System.out.println(gameTime.toString());//2014-09-16T08:55:00.000
		List<GameEntity> games = gameService.getGameByLocalDateTime(gameTime);
//		log.debug("testFindByLocalDateTime = {}", games);
		for(GameEntity game:games){
			System.out.println(game);
		}
		System.out.println("size of games = "+ games.size());
	}
	
	@Test
	public void testGetCountInfoHistoryPrevious3month(){
		String teamName= null;
//		teamName= "底特律老虎";
		Long gameId =null;
		List<Map<String, CountBean>> games=gameService.getCountInfoHistoryPrevious3month(teamName, gameId);
		Iterator it= games.iterator();
		while(it.hasNext()){
			System.out.println(it.next());
		}
		System.out.println("the size of games: "+games.size());
		
	}
	@Test
	public void testGetAllCountHistoryByTime(){
		LocalDate timeTo=LocalDate.parse("2014-09-26");
		List<Map<String, CountBean>> games=gameService.getAllCountHistoryByTime(timeTo);
		Iterator it= games.iterator();
		while(it.hasNext()){
			System.out.println(it.next());
		}
		System.out.println("the size of games before "+timeTo.toString()+": "+games.size());
	}
	
	@Test
	public void testGetAllCountHistoryByTimePrevious3Month(){
		//List<Map<String, CountBean>> games=gameService.getAllCountHistoryByTimePrevious3Month(null);
		LocalDate date1 = new LocalDate();
		date1 = LocalDate.parse("2014-09-26");//將時間自串轉成 LocalDate
		try {
			List<Map<String, CountBean>> games=gameService.getAllCountHistoryByTimePrevious3Month(date1);
			System.out.println(games.toString());
			Iterator it= games.iterator();
			while(it.hasNext()){
				System.out.println(it.next());
			}
			
			System.out.println("the size of games: "+ games.size());
		} catch (Exception e) {
			System.out.println("game is null in test");
			e.printStackTrace();
		}
	}
	
	@Test
	public void testGetAllCountHistoryByTimePrevious3Days(){
		LocalDate date1 = new LocalDate();
		date1 = LocalDate.parse("2014-09-26");
		List<Map<String, CountBean>> games = gameService.getAllCountHistoryByTimePrevious3Days(null);
		Iterator it= games.iterator();
		while(it.hasNext()){
			System.out.println(it.next());
		}
		System.out.println("the size of games: "+ games.size());
	}
	@Test
	public void testGetFinishedGameToday(){
		List<GameEntity> games = gameService.getFinishedGameToday();
		System.out.println("印出使用getFinishedGameToday得出的 GameEntity內容:");
		for(GameEntity game : games){
			System.out.println(game);
		}
		System.out.println("size of getFinishedGameToday: "+ games.size());		

	}
	
	@Test
	public void testGetLatestFiveRecord(){
		List<GameEntity> games = gameService.getLatestFiveRecord();
		System.out.println("印出使用getLatestFiveRecord得出的 GameEntity內容:");
		for(GameEntity game : games){
			System.out.println(game);
		}
		System.out.println("size of getLatestFiveRecord: "+ games.size());		

	}
	
	@Test
	public void testGetGameOnComing(){
		List<GameEntity> games = gameService.getGameOnComing();
		System.out.println("印出使用getGameOnComing得出的 GameEntity內容:");
		for(GameEntity game : games){
			System.out.println(game);
		}
		System.out.println("size of getGameOnComing: "+ games.size());		

	}
	
	@Test
	public void testGetBallTypes(){
		List<String> typeList = gameService.getBallTypes();
		System.out.println("印出使用getBallTypes得出的 type內容:");
		for(String type : typeList){
			System.out.println(type);
		}
		System.out.println("size of getBallTypes: "+ typeList.size());		
		
	}

}
