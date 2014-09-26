package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;

public class LotteryServiceTest extends BaseTest {
	
	@Autowired
	UserService userService;
	
	@Autowired
	LotteryService lotteryService;
	
	@Autowired
	OddsService oddsService;
	
	@Autowired
	GameService gameService;
	
	@Test
	public void test() {
	    /*
		//UserEntity user = userService.getById(1L);
		//log.debug("user = {}", user);
		LotteryEntity lottery = new LotteryEntity();

        OddsEntity odd=new OddsEntity();
        lottery.setUserId(1L);
        lottery.setCom1(2L);
        lottery.setCom2(4L);
        lottery.setCom3(6L);
        lottery.setCom4(8L);
        lottery.setCapital(200L);
        lottery.setConfirmTime(new LocalDateTime());    
        lotteryService.insert(lottery);
        
		Set<LotteryOddsEntity> lotteryOdds=new HashSet<LotteryOddsEntity>();
		LotteryOddsEntity lotteryOdd = new LotteryOddsEntity();
		odd=oddsService.getById(2L);
		lotteryOdd.setOddsId(odd);
		lotteryOdd.setLotteryId(lottery.getId());
		System.out.println("lotteryOdd:"+lotteryOdd);
		lotteryOdds.add(lotteryOdd);
		
		LotteryOddsEntity lotteryOdd1 = new LotteryOddsEntity();
		OddsEntity odd1=new OddsEntity();
		odd1=oddsService.getById(4L);
		lotteryOdd1.setOddsId(odd1);
		lotteryOdd1.setLotteryId(lottery.getId());
		lotteryOdds.add(lotteryOdd1);
		
		
		
		
		System.out.println("lotteryOdds:"+lotteryOdds);
		
		
	
		lottery.setLotteryOdds(lotteryOdds);
		
		lotteryService.update(lottery);
		
		*/
	    
	    //test CalculatePrize
	    System.out.println("Begin CalculatePrize");
	    LotteryEntity lottery = new LotteryEntity();
	    lottery=lotteryService.getById(7L);
	    Long Result1 = lotteryService.calculatePrize(lottery);
	    //log.debug("Result1 = {}",Result1);
	    System.out.println("lotteryId=7 ; Win Result1 ="+Result1);
	    
	    lottery=lotteryService.getById(8L);
	    Long Result2 = lotteryService.calculatePrize(lottery);
	    //log.debug("Result2 = {}",Result2);
	    System.out.println("lotteryId=8 ; Win Result2 ="+Result2);
	    
	    lottery=lotteryService.getById(10L);
	    Long Result3 = lotteryService.calculatePrize(lottery);
	    //log.debug("Result3 = {}",Result3);
	    System.out.println("lotteryId=10 ; Win Result3 ="+Result3);
	    
	}
	
	@Test
	public void testGetLotterysByGame() {
		GameEntity game = gameService.getById(40L);
		log.debug("GameEntity = {}", game);
		List<LotteryEntity> lotterys = lotteryService.getLotterysByGame(game);
		for (LotteryEntity lo : lotterys) {
			System.out.println(lo.getId());
		}
	}

}
