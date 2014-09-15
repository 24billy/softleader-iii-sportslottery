package tw.com.softleader.sportslottery.setting.service;

import java.util.*;

import org.joda.time.*;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.*;

public class LotteryServiceTest extends BaseTest {
	
	@Autowired
	UserService userService;
	
	@Autowired
	LotteryService lotteryService;
	
	@Autowired
	OddsService oddsService;
	
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
	    System.out.println("Begin CalculatePrize");
	    LotteryEntity lottery = new LotteryEntity();
	    lottery=lotteryService.getById(10L);
	    Long Result = lotteryService.calculatePrize(lottery);
	    log.debug("Result = {}",Result);
	}

}
