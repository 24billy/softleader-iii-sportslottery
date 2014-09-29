package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.assertNotNull;

import java.math.BigDecimal;
import java.util.List;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
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
	
	@Test
	public void testGetDao(){
		List<LotteryEntity> lotteries = lotteryService.getAll();
		log.debug("get all = {}", lotteries);
		for(LotteryEntity lottery: lotteries){
			System.out.println(lottery);
		}
		log.debug("size of GetDao = {}", lotteries.size());
		
	}
	
	@Test
	public void testGetByUserId(){
//		Long userId =null; //null pointer
//		Long userId =1L;
		Long userId = 100L;//空值 ，size =0
		List<LotteryEntity> lotteries = lotteryService.getByUserId(userId);
		log.debug("get all = {}", lotteries);
		for(LotteryEntity lottery: lotteries){
			System.out.println(lottery);
		}
		log.debug("size of GetByUserId = {}", lotteries.size());
		
	}
	
	@Test
	public void testGetByTime(){
		LocalDateTime timeBegin, timeEnd;
		
		////test1:
//		timeBegin =null;//測試結果錯誤，得null pointer
//		timeEnd = null;//測試結果錯誤，得null pointer
		
		////test2:
		String timeBeginStr="2014-09-01T08:55";
		String timeEndStr="2014-09-30T08:55";
		timeBegin = LocalDateTime.parse(timeBeginStr);
		timeEnd = LocalDateTime.parse(timeEndStr);
		
		List<LotteryEntity> lotteries = lotteryService.getByTime(timeBegin, timeEnd);
		log.debug("get all = {}", lotteries);
		for(LotteryEntity lottery: lotteries){
			System.out.println(lottery);
		}
		log.debug("size of GetByTime = {}", lotteries.size());		
	}
	
	@Test
	public void testGetComplex(){
		Long userId, win;
		LocalDate timeBegin, timeEnd;
		
		////test 1:
		userId=null;
		win=null;
		timeBegin = null;
		timeEnd = null;
		List<LotteryEntity> lotteries = lotteryService.getComplex(userId, timeBegin, timeEnd, win);
		log.debug("get all = {}", lotteries);
		for(LotteryEntity lottery: lotteries){
			System.out.println(lottery);
		}		
		log.debug("size of GetComplex = {}", lotteries.size());		
		
		////test 2:
				assertNotNull(lotteries);
		///test 3
		userId=1L;
		lotteries = lotteryService.getComplex(userId, timeBegin, timeEnd, win);
		log.debug("get getComplex = {}", lotteries);
		System.out.println("userId = "+userId);
		for(LotteryEntity lottery: lotteries){
			System.out.println(lottery);
		}		
		log.debug("size of GetComplex = {}", lotteries.size());	//size of GetComplex = 4
		
	}
	
	@Test
	public void testCalculatePrize(){
		

//		////test 1
//		LotteryEntity lottery=new LotteryEntity();
//		//lottery = null;//null pointer
//		Long prize;
//		prize = lotteryService.calculatePrize(lottery);
//		log.debug("prize = {}", prize);
		
		////test2
		Long userId = 2L;
		List<LotteryEntity>lotteries =lotteryService.getByUserId(userId);
		for(LotteryEntity lot: lotteries ){
			System.out.println("lotteryEntity: "+ lot);
			log.debug("prize = {}", lotteryService.calculatePrize(lot) );
		}
		System.out.println("size of lotteries by userId "+ userId+" : "+ lotteries.size());
	}
	
	
	//參考:http://fanli7.net/a/JAVAbiancheng/JAVAzonghe/20121227/279562.html
//	//測試前須先註解掉getCombination(...)裡面的 "this.result=this.result.add(temp);"，以防止得到null pointer
//	@Test 
//	public void testGetCombination(){
//		BigDecimal[] a = {new BigDecimal(1),new BigDecimal(2),new BigDecimal(3),new BigDecimal(4)};
//		int n = 2;
//		lotteryService.combine(a,n);//在陣列a{1,2,3,4}取兩個值的組合
//	}
	
	
	


}
