package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.*;

import java.util.List;

import org.hibernate.Session;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;

public class GameServiceTest extends BaseTest  {
	@Autowired
	private GameService gameService;
	
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
//	public void testTotalCount(){
//		Long totalCount=gameService.totalCount(2L);
//		log.debug("total count= {}", totalCount);
//		
//		Long totalCount2=gameService.totalCount(210200L);
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

	@Test
	public void testGetIsPass(){
		Long gameId=2L;
		String oddType= "SU_H";
		boolean isPass= gameService.getIsPass(gameId, oddType);
		boolean expectedBoolean= true;
		assertEquals(expectedBoolean, isPass);
	}
}
