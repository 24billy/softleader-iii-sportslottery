package tw.com.softleader.sportslottery.setting.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.AdminLogDao;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
import tw.com.softleader.sportslottery.setting.dao.UserDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

@Service
public class LotteryService extends GenericService<LotteryEntity> {
    private BigDecimal result;
	@Autowired
	private LotteryDao dao;
	
	@Autowired
	private LotteryOddsDao lotteryOddsDao;
	
	@Autowired
	private GameDao gameDao;
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private AdminLogDao adminLogDao;
	
	@Override
	protected GenericDao<LotteryEntity> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
	public List<LotteryEntity> getByUserId(Long userId) {
		return dao.findByUserId(userId);
	}
	
	public List<LotteryEntity> getByTime(LocalDateTime timeBegin, LocalDateTime timeEnd) {
		return dao.findByTime(timeBegin, timeEnd);
	}
	
	public List<LotteryEntity> getComplex(Long userId, LocalDate timeBegin, LocalDate timeEnd, Long win) {
		return dao.findComplex(userId, timeBegin, timeEnd, win);
	}
	   //計算獎金
    public Long calculatePrize(LotteryEntity lottery){
    	result = new BigDecimal(0);
        Long com0 = lottery.getCom0();
        Long com1 = lottery.getCom1();
        Long com2 = lottery.getCom2();
        Long com3 = lottery.getCom3();
        Long com4 = lottery.getCom4();
        Long com5 = lottery.getCom5();
        Long com6 = lottery.getCom6();
        Long com7 = lottery.getCom7();
        Long com8 = lottery.getCom8();
        Long capital=lottery.getCapital();
        List<LotteryOddsEntity> lotteryOdds= lotteryOddsDao.findByLotteryId(lottery.getId());
        
              
        long[] tempPrize=null,prize=null;//暫存中獎ID
        BigDecimal[] tempOddsValue=null,oddsValue=null;
        BigDecimal[] tempArray=null;
        if(lotteryOdds.size()>0){  
            tempPrize = new long[lotteryOdds.size()];
            tempOddsValue = new BigDecimal[lotteryOdds.size()];
         }
        //計算哪些投注有中獎，截取暫存陣列存放中獎oddId and oddValue
        int passCount=0;
        for (LotteryOddsEntity odds : lotteryOdds)
        {
            
            //GameService gameService = new GameService();
           
            Long gameStatus=gameDao.findById(odds.getOddsId().getGameId()).getGameStatus();
            System.out.println("---------");
            System.out.println("GameStatus="+gameStatus+";GameId="+gameDao.findById(odds.getOddsId().getGameId()).getId());
            System.out.println("oddId="+odds.getOddsId().getId());
            
            
            
            
            if(odds.getOddsId().getIsPass()!=null && odds.getOddsId().getIsPass()){
                tempPrize[passCount]=odds.getOddsId().getId();
                tempOddsValue[passCount]=odds.getOddsId().getOddValue();
                System.out.println("過關的odd="+tempPrize[passCount]);
                passCount++;
            }else if (odds.getOddsId().getIsPass()!=null && !odds.getOddsId().getIsPass()){
                tempPrize[passCount]=odds.getOddsId().getId();
                tempOddsValue[passCount]=odds.getOddsId().getOddValue();
                System.out.println("未過關的odd="+tempPrize[passCount]);
            }
            if(odds.getOddsId().getIsPass()==null){
                System.out.println("有odds未結算，跳出計算:lotteryId="+lottery.getId());
                return -1L;
            }
            
        }
        
            //將過關轉成對應的組合數
            if(com0!=null&&com0.equals(1L)){
                int combinations =lotteryOdds.size();
                    switch(combinations) { 
                        case 8:
                            com8=1L;
                            System.out.println("得8"); 
                            break; 
                        case 7: 
                            com7=1L;
                            System.out.println("得7"); 
                            break; 
                        case 6: 
                            com6=1L;
                            System.out.println("得6"); 
                            break;
                        case 5:
                            com5=1L;
                            System.out.println("得5"); 
                            break; 
                        case 4: 
                            com4=1L;
                            System.out.println("得4"); 
                            break; 
                        case 3: 
                            com3=1L;
                            System.out.println("得3"); 
                            break;
                        case 2:
                            com2=1L;
                            System.out.println("得2"); 
                            break; 
                        case 1: 
                            com1=1L;
                            System.out.println("得1"); 
                            break;    
                        default: 
                            System.out.println("得-1"); 
                    }
            }
            if(passCount==0){
                lottery.setWin(0L);
                dao.update(lottery);
                return 0L;
            }
            prize = new long[passCount];
            oddsValue = new BigDecimal[passCount];
            for (int i=0;i<passCount;i++){
                prize[i]=tempPrize[i];
                oddsValue[i]=tempOddsValue[i];
            }        
            tempArray = new BigDecimal[prize.length];
            
            //getCombination(oddsValue,2,0,tempArray,0);
            System.out.println("計算前獎金為0 :"+result+"過關注數為:"+passCount);
            System.out.println("---->>lottery:"+lottery);
            System.out.println("---->>lotteryOdds:"+lotteryOdds);           

            if(com1!=null && 1<=passCount){
                getCombination(oddsValue,1,0,tempArray,0);
                System.out.println("過一關的累積獎金:"+result);
            }
            if(com2!=null && 2<=passCount){
                getCombination(oddsValue,2,0,tempArray,0);
                System.out.println("過二關的累積獎金:"+result);
            }
            if(com3!=null && 3<=passCount){
                getCombination(oddsValue,3,0,tempArray,0);
                System.out.println("過三關的累積獎金:"+result);
            }
            if(com4!=null && 4<=passCount){
                getCombination(oddsValue,4,0,tempArray,0);
                System.out.println("過四關的累積獎金:"+result);
            }
            if(com5!=null && 5<=passCount){
                getCombination(oddsValue,5,0,tempArray,0);
                System.out.println("過五關的累積獎金:"+result);
            }
            if(com6!=null && 6<=passCount){
                getCombination(oddsValue,6,0,tempArray,0);
                System.out.println("過六關的累積獎金:"+result);
            }
            if(com7!=null && 7<=passCount){
                getCombination(oddsValue,7,0,tempArray,0);
                System.out.println("過七關的累積獎金:"+result);
            }
            if(com8!=null && 8<=passCount){
                getCombination(oddsValue,8,0,tempArray,0);
                System.out.println("過八關的累積獎金:"+result);
            }
            Long win=result.multiply(new BigDecimal(capital)).setScale(3, BigDecimal.ROUND_HALF_UP).longValue();
            lottery.setWin(win);
            System.out.println("結算後總獎金:"+win+";結算後lottery:"+lottery);            
            dao.update(lottery);
            return win;    

    }
    
    //此方法用在getCombination
    //在a組中，取出n個數的排列組合
    //b 輔助空間，保存待輸出組合數
    //begin 和 index使用時輸入是0，測試見下一個方法combine(BigDecimal[] a, int n)
    private void getCombination(BigDecimal[] a, int n, int begin, BigDecimal[] b, int index) {  
        if(n == 0){ //如果夠n個數了，輸出b數組
            BigDecimal temp=new BigDecimal(1);
            for(int i = 0; i < index; i++){  
                System.out.print(b[i] + " ");
                temp=temp.multiply(b[i]);//選出的組合數相乘
            }
            System.out.println();
            System.out.println("temp:"+temp); 
            this.result=this.result.add(temp);//測試時 需要注解掉，防止得到result的null
            return;
        }       
        for(int i = begin; i < a.length; i++){  
            b[index] = a[i];  
            getCombination(a, n-1, i+1, b, index+1);  
        }   
    }
    
    //用來測試getCombination
    //從數組a中，取出n個數的所有組合(不可重複取)
	public void combine(BigDecimal[] a, int n) {
		if(null == a || a.length == 0 || n <= 0 || n > a.length)
			return;		
		BigDecimal[] b = new BigDecimal[n];//輔助空間，保存待輸出組合數
		this.getCombination(a, n , 0, b, 0);
	}
    
    public List<LotteryEntity> getLotterysByGame(GameEntity game) {
		List<LotteryEntity> lotterys = new ArrayList<LotteryEntity>();
		Set<Long> lotteryIds = new HashSet<Long>();
		List<OddsEntity> odds = game.getOdds();
		for (OddsEntity odd : odds) {
			lotteryIds.addAll(lotteryOddsDao.findLotteryIdByOddsId(odd));
		}
		for (Long id : lotteryIds) {
			lotterys.add(dao.findById(id));
		}
		return lotterys;
	}
    
    public List<LotteryEntity> getByLotteryStatus(Long lotteryStatus) {
    	return dao.findByLotteryStatus(lotteryStatus);
    }
    
    public Boolean paidWinsToUser() {
		List<LotteryEntity> lotterys = dao.findByLotteryStatus(0L);
		try {
			for (LotteryEntity lottery : lotterys) {
				Long lotteryStatus = lottery.getLotteryStatus();
				Long win = lottery.getWin();
				if (lotteryStatus == 0L && win != -1) {
					Long userId = lottery.getUserId();
					//AdminLogEntity adminLog = new AdminLogEntity();
					//adminLog.setEnteredTime(lottery.getConfirmTime());
					if (win > 0) {
						UserEntity user = userDao.findById(userId);
						Long coins = user.getCoins();
						user.setCoins(coins + win);
						userDao.update(user);
						/*
						adminLog.setProfit(win * -1);
						adminLogDao.insert(adminLog);
						*/
					} else {
						/*
						adminLog.setProfit(lottery.getCapital());
						adminLogDao.insert(adminLog);
						*/
					}
					lottery.setLotteryStatus(1L);
					update(lottery);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		return true;
	}
    public List<LotteryEntity> getNewestLotterysByUserId(Long userId) {
    	return dao.findNewestLotterysByUserId(userId);
    }
}
