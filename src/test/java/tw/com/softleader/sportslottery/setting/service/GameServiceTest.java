package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.assertEquals;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.List;
import java.util.Map;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.util.CountBean;

public class GameServiceTest extends BaseTest  {
	@Autowired
	private GameService gameService;
	private Map<String, CountBean> map2;
	
////	List<GameEntity> models=null;
////	GameEntity model=null;
//	@Test
//	public void testGetAll() {
//
//	}
//
//	@Test
//	public void testGetById() {
////		model=gameService.getById(1L);
////		System.out.println(model);
//	}
//
//	@Test
//	public void testInsert() {
//		
//	}
//
//	@Test
//	public void testUpdate() {
//
//	}
//
//	@Test
//	public void testDelete() {
//		List<GameEntity> models = gameService.getAll();
//		int originSize = models.size();
//		GameEntity entity = gameService.getById(11L);
//		log.debug("entity = {}", entity);
//		gameService.delete(entity);
//		
//		models = gameService.getAll();
//		int currentSize = models.size();
//		assertEquals(originSize - 1, currentSize);
//	}
//
//	@Test
//	public void testGetAllJSON() {
//		
//	}
	
//	@Test
//	public void testGetTotalCount(){
//		Long totalCount=gameService.getTotalCount(2L);
//		log.debug("total count= {}", totalCount);
//		
//		Long totalCount2=gameService.getTotalCount(210200L);
//		log.debug("total count2= {}", totalCount2);
//	}
	
//	@Test
//	public void testGetCount(){
//		Long gameId=2L;
//		String oddType= "SU_H";
//		Long count = gameService.getCount(gameId, oddType);
//		Long expectedCount = 100L;
//		assertEquals(expectedCount, count);
//	}

//	@Test
//	public void testGetIsPass(){
//		Long gameId=2L;
//		String oddType= "SU_H";
//		boolean isPass= gameService.getIsPass(gameId, oddType);
//		boolean expectedBoolean= true;
//		assertEquals(expectedBoolean, isPass);
//	}
	
//	@Test
//	public void testIsPassPercentage(){
//		Long gameId=2L;
//		String oddType= "SU_H";
//		String oddType2="SU_A";
//		BigDecimal percent= gameService.getIsPassPercentage(gameId, oddType);
//		BigDecimal percent2= gameService.getIsPassPercentage(gameId, oddType2);
//		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);//預防無限小數
//		BigDecimal expPercent = new BigDecimal("100").divide(new BigDecimal("3300"),mc);
//		BigDecimal expPercent2 = new BigDecimal(0);
//		assertEquals(expPercent, percent);
//		assertEquals(expPercent2, percent2);
//	}
	
//	@Test
//	public void testGetCountBean(){
//		Long gameId=2L;
//		String oddType= "SU_H";
//		String oddType2="SU_A";
//		CountBean beanSUH= gameService.getCountBean(gameId, oddType);
//		CountBean beanSUA= gameService.getCountBean(gameId, oddType2);
//		log.debug("beanSUH = {}", beanSUH.toString());
//		log.debug("beanSUA = {}", beanSUA.toString());
//
//	}
	
//	@Test
//	public void testGetGraphBarByGameId(){
//		Long gameId=2L;
//		Map<String, CountBean> map = gameService.getCountInfoByGameId(gameId);
//		log.debug("graphBar = {}", map.toString());
//		//result:graphBar = {
//		//ATS_H= CountBean [count=500, oddType=ATS_H, percentage=0, gameId=2, isPass=false], 
//		//SU_A =  CountBean [count=300, oddType=SU_A, percentage=0, gameId=2, isPass=false], 
//		//ATS_A= CountBean [count=400, oddType=ATS_A, percentage=0.12, gameId=2, isPass=true], 
//		//EVEN =  CountBean [count=400, oddType=EVEN, percentage=0, gameId=2, isPass=false], 
//		//SC_L =  CountBean [count=800, oddType=SC_L, percentage=0, gameId=2, isPass=false], 
//		//SU_H =  CountBean [count=100, oddType=SU_H, percentage=0.030, gameId=2, isPass=true], 
//		//ODD  =  CountBean [count=200, oddType=ODD, percentage=0.061, gameId=2, isPass=true], 
//		//SC_H =  CountBean [count=600, oddType=SC_H, percentage=0.18, gameId=2, isPass=true]
//		//}
//	@Test
//	public void testGetCountInfoHistory(){
//		
////		Long gameNum = 136L;
//		Long gameNum = null;
//		Long gameId=gameService.getGameIdByGameNum(gameNum);
////		System.out.println("gameId: "+ gameId);
////		System.out.println(gameService.getComplex(136L, null, null, null, null, null, null, null));
////		String teamName= "密爾瓦基釀酒人";
//		String teamName = null;
////		Long gameId =null;
//		List<Map<String, CountBean>> listMap = gameService.getCountInfoHistory(teamName, gameId);
//		log.debug("listMap = {}",listMap.toString() );
//		System.out.println("size of listMap: "+ listMap.size() );
//
//	}
	
//	@Test
//	public void testGetAllCountHistoryByTeam(){
//		String teamName= "辛辛那堤紅人";
//		List<Map<String, CountBean>> listMap = gameService.getAllCountHistoryByTeam(teamName);
//		log.debug("listMap = {}",listMap.toString() );
//		System.out.println("size of listMap: "+ listMap.size() );
//		
//	}
//	
//	@Test
//	public void testSortByComparator(){
//		
//		map2 = gameService.getSortByComparator(gameService.getCountInfoByGameId(36L));
//		log.debug("map2 = {}", map2.toString());
//	}
	
//	@Test
//	public void testGetPopularOdd(){
//		String teamName= "密爾瓦基釀酒人";
//		Long gameId= 36L;
//		List<Map<String, CountBean>> listMap  = gameService.getCountInfoHistory(teamName, gameId);
//		List<CountBean> list = gameService.getSortCountHistory(listMap);
//		for(CountBean bean: list){
//			System.out.println(bean.toString());
//		}
//		System.out.println();
//		System.out.println(list.get(0));
//
//
//	}
	
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

}
