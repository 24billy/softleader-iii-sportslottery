package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

public class LotteryOddsServiceTest extends BaseTest{
	@Autowired
	private LotteryOddsService service;
	
	@Test
	public void testGetByLotteryId() {
		Long lotteryId=7L;
		List<LotteryOddsEntity> lotteryOdds= service.getByLotteryId(lotteryId);
		System.out.println("getByLotteryId: ");
		for(LotteryOddsEntity entity :lotteryOdds){
			System.out.println(entity);
		}
		System.out.println("the size of getByLotteryId is "+lotteryOdds.size() );
	}

	@Test
	public void testGetByOddsId() {
		Long oddsId=306L;
		List<LotteryOddsEntity> lotteryOdds= service.getByOddsId(oddsId);
		System.out.println("getByOddsId: ");
		for(LotteryOddsEntity entity :lotteryOdds){
			System.out.println(entity);
		}
		System.out.println("the size of getByOddsId is "+lotteryOdds.size() );
	}

	@Test
	public void testGetPassedOdds() {
		List<LotteryOddsEntity> lotteryOdds= service.getPassedOdds();
		System.out.println("getPassedOdds: ");
		for(LotteryOddsEntity entity :lotteryOdds){
			System.out.println(entity);
			//LotteryOddsEntity [lotteryId=7, oddsId=OddsEntity [gameId=39, oddType=SU_H, oddCombination=0.000, oddValue=1.450, count=300, isPass=true, id=306], id=9]

		}
		System.out.println("the size of getPassedOdds is "+lotteryOdds.size() );
	}

	@Test
	public void testGetPassedOddsByLotteryId() {
		Long lotteryId = 7L;
		List<LotteryOddsEntity> lotteryOdds= service.getPassedOddsByLotteryId(lotteryId);
		System.out.println("getPassedOddsByLotteryId: ");
		for(LotteryOddsEntity entity :lotteryOdds){
			System.out.println(entity);
		}
		System.out.println("the size of getPassedOddsByLotteryId is "+lotteryOdds.size() );//23
	}

	@Test
	public void testCheckStatus() {
//		List<LotteryOddsEntity> los=service.getAll();
		List<LotteryOddsEntity> los=null;
		boolean status=service.checkStatus(los);
		log.debug("checkStatus ={}",status );
	}
	@Test
	public void testGetAll() {
		List<LotteryOddsEntity> lotteryOdds= service.getAll();
		System.out.println("getAll: ");
		for(LotteryOddsEntity entity :lotteryOdds){
			System.out.println(entity);
		}
		System.out.println("the size of all LotteryOddsEntity is "+lotteryOdds.size() );//23
	}

	@Test
	public void testGetById() {
		Long id=1L;
		LotteryOddsEntity lotteryOdd=service.getById(id);
		System.out.println("lotteryOdd with id = "+id+ " is "+ lotteryOdd);
		//lotteryOdd with id = 1 is LotteryOddsEntity [lotteryId=4, oddsId=OddsEntity [gameId=46, oddType=SU_A, oddCombination=0.000, oddValue=2.850, count=500, isPass=null, id=361], id=1]

	}

	@Test
	public void testInsert() {
		LotteryOddsEntity entity=new LotteryOddsEntity();
		entity.setLotteryId(2L);
		OddsEntity oddsId= new OddsEntity();
		oddsId.setCount(260L);
		oddsId.setGameId(20L);
		oddsId.setIsPass(true);
		oddsId.setOddCombination(new BigDecimal(2.0));
		oddsId.setOddType("SU_A");
		oddsId.setOddValue(new BigDecimal(10));
		oddsId.setId(400L);
		entity.setOddsId(oddsId);
		entity= service.insert(entity);
		log.debug("insert LotteryOddsEntity= {}", entity);
		//insert LotteryOddsEntity= LotteryOddsEntity [lotteryId=2, oddsId=OddsEntity [gameId=20, oddType=SU_A, oddCombination=2, oddValue=10, count=260, isPass=true, id=400], id=24]
		testDelete();
	}
//
//	@Test
//	public void testUpdate() {
//		LotteryOddsEntity entity=new LotteryOddsEntity();
//		entity.setLotteryId(2L);
//		OddsEntity oddsId= new OddsEntity();
//		oddsId.setCount(265L);
//		oddsId.setGameId(28L);
//		oddsId.setIsPass(true);
//		oddsId.setOddCombination(new BigDecimal(2.9));
//		oddsId.setOddType("SU_A");
//		oddsId.setOddValue(new BigDecimal(80));
//		oddsId.setId(400L);//必須要有存在
//		entity.setOddsId(oddsId);
//		entity= service.update(entity);
//		log.debug("update LotteryOddsEntity= {}", entity);
//		//update LotteryOddsEntity= LotteryOddsEntity [lotteryId=2, oddsId=OddsEntity [gameId=28, oddType=SU_A, oddCombination=2.899999999999999911182158029987476766109466552734375, oddValue=80, count=265, isPass=true, id=400], id=null]
//	
//		testDelete();
//	}


	public void testDelete() {
		LotteryOddsEntity entity = service.getById(24L);
		System.out.println("entity 24: "+ entity );
		service.delete(entity);
		log.debug("delete LotteryOddsEntity= {}", entity);
		LotteryOddsEntity check=service.getById(24L);
		log.debug("select ={}", check);// 得到null
	
	}

	@Test
	public void testGetAllJSON() {
		String json=service.getAllJSON();
		log.debug("getAllJSON={}", json);
		//getAllJSON=[
		//{"lotteryId":4,"oddsId":{"gameId":46,"oddType":"SU_A","oddCombination":0.000,"oddValue":2.850,"count":500,"id":361},"id":1},
		//{"lotteryId":4,"oddsId":{"gameId":46,"oddType":"ATS_A","oddCombination":1.500,"oddValue":1.950,"count":500,"id":363},"id":2},
		//{"lotteryId":4,"oddsId":{"gameId":46,"oddType":"SC_H","oddCombination":6.500,"oddValue":1.600,"count":500,"id":365},"id":3},{"lotteryId":5,"oddsId":{"gameId":46,"oddType":"SU_H","oddCombination":0.000,"oddValue":1.250,"count":500,"id":362},"id":4},{"lotteryId":5,"oddsId":{"gameId":46,"oddType":"ATS_H","oddCombination":-1.500,"oddValue":1.550,"count":500,"id":364},"id":5},{"lotteryId":5,"oddsId":{"gameId":46,"oddType":"SC_L","oddCombination":6.500,"oddValue":1.900,"count":500,"id":366},"id":6},{"lotteryId":5,"oddsId":{"gameId":46,"oddType":"EVEN","oddCombination":0.000,"oddValue":2.050,"count":500,"id":368},"id":7},{"lotteryId":6,"oddsId":{"gameId":46,"oddType":"SU_H","oddCombination":0.000,"oddValue":1.250,"count":500,"id":362},"id":8},{"lotteryId":7,"oddsId":{"gameId":39,"oddType":"SU_H","oddCombination":0.000,"oddValue":1.450,"count":300,"isPass":true,"id":306},"id":9},{"lotteryId":8,"oddsId":{"gameId":39,"oddType":"SU_A","oddCombination":0.000,"oddValue":2.150,"count":800,"id":305},"id":10},{"lotteryId":8,"oddsId":{"gameId":40,"oddType":"ATS_H","oddCombination":-1.500,"oddValue":1.900,"count":0,"id":316},"id":11},{"lotteryId":9,"oddsId":{"gameId":40,"oddType":"SC_L","oddCombination":8.500,"oddValue":1.800,"count":0,"id":318},"id":12},{"lotteryId":9,"oddsId":{"gameId":40,"oddType":"EVEN","oddCombination":0.000,"oddValue":2.050,"count":0,"id":320},"id":13},{"lotteryId":10,"oddsId":{"gameId":40,"oddType":"SU_A","oddCombination":0.000,"oddValue":1.250,"count":0,"id":314},"id":14},{"lotteryId":10,"oddsId":{"gameId":40,"oddType":"SC_H","oddCombination":8.500,"oddValue":1.700,"count":0,"id":317},"id":15},{"lotteryId":10,"oddsId":{"gameId":40,"oddType":"EVEN","oddCombination":0.000,"oddValue":2.050,"count":0,"id":320},"id":16},{"lotteryId":11,"oddsId":{"gameId":39,"oddType":"ODD","oddCombination":0.000,"oddValue":1.500,"count":600,"id":311},"id":17},{"lotteryId":11,"oddsId":{"gameId":40,"oddType":"ODD","oddCombination":0.000,"oddValue":1.500,"count":0,"id":319},"id":18},{"lotteryId":12,"oddsId":{"gameId":39,"oddType":"ODD","oddCombination":0.000,"oddValue":1.500,"count":600,"id":311},"id":19},{"lotteryId":12,"oddsId":{"gameId":38,"oddType":"ATS_H","oddCombination":-1.500,"oddValue":1.900,"count":200,"id":300},"id":20},{"lotteryId":12,"oddsId":{"gameId":32,"oddType":"EVEN","oddCombination":0.000,"oddValue":2.050,"count":20,"isPass":false,"id":256},"id":21},{"lotteryId":12,"oddsId":{"gameId":30,"oddType":"EVEN","oddCombination":0.000,"oddValue":2.050,"count":500,"isPass":false,"id":240},"id":22},{"lotteryId":12,"oddsId":{"gameId":28,"oddType":"EVEN","oddCombination":0.000,"oddValue":2.050,"count":700,"isPass":false,"id":224},"id":23}]
		
		System.out.println("length of json: "+ json.length());//2925
		
	}

}
