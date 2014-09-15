package tw.com.softleader.sportslottery.setting.service;

import java.math.*;
import java.util.List;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
import tw.com.softleader.sportslottery.setting.entity.*;

/**
@Author:Billy 
 */

@Service
public class LotteryService extends GenericService<LotteryEntity> {
    BigDecimal result=new BigDecimal(0);
	@Autowired
	private LotteryDao dao;
	
	@Autowired
	private LotteryOddsDao lotteryOddsDao;
	
	@Autowired
	private GameDao gameDao;
	
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
        
        

        //得到陣列大小       
        System.out.println("size="+lotteryOdds.size());
        

        long[] tempAnsArray=null,ansArray=null;//暫存中獎ID
        BigDecimal[] tempOddsValue=null,oddsValue=null;
        BigDecimal[] tempArray=null;
        if(lotteryOdds.size()>0){
            tempAnsArray = new long[lotteryOdds.size()];
            tempOddsValue = new BigDecimal[lotteryOdds.size()];
         }
         //最大過關數
        int passCount=0;
        for (LotteryOddsEntity odds : lotteryOdds)
        {
            if(odds.getOddsId().getIsPass()!=null){
                tempAnsArray[passCount]=odds.getOddsId().getId();
                tempOddsValue[passCount]=odds.getOddsId().getOddValue();
                System.out.println("teampAnsArray[passCount]="+tempAnsArray[passCount]);
                passCount++;
            }
        }
        if(passCount>0){
            ansArray = new long[passCount];
            oddsValue = new BigDecimal[passCount];
            for (int i=0;i<passCount;i++){
                ansArray[i]=tempAnsArray[i];
                oddsValue[i]=tempOddsValue[i];
            }        
            tempArray = new BigDecimal[ansArray.length];
            
            //getCombination(oddsValue,2,0,tempArray,0);
            System.out.println("result 0 :"+result);
            System.out.println("passCount:"+passCount);

            if(com1!=null && com1<=passCount){
                getCombination(oddsValue,1,0,tempArray,0);
                System.out.println("result 1:"+result);
            }
            if(com2!=null && com2<=passCount){
                getCombination(oddsValue,2,0,tempArray,0);
                System.out.println("result 2:"+result);
            }
            if(com3!=null && com3<=passCount){
                getCombination(oddsValue,3,0,tempArray,0);
                System.out.println("result 3:"+result);
            }
            if(com4!=null && com4<=passCount){
                getCombination(oddsValue,4,0,tempArray,0);
                System.out.println("result 4:"+result);
            }
            if(com5!=null && com5<=passCount){
                getCombination(oddsValue,5,0,tempArray,0);
                System.out.println("result 5:"+result);
            }
            if(com6!=null && com6<=passCount){
                getCombination(oddsValue,6,0,tempArray,0);
                System.out.println("result 6:"+result);
            }
            if(com7!=null && com7<=passCount){
                getCombination(oddsValue,7,0,tempArray,0);
                System.out.println("result 7:"+result);
            }
            if(com8!=null && com8<=passCount){
                getCombination(oddsValue,8,0,tempArray,0);
                System.out.println("result 8:"+result);
            }
            Long win=result.multiply(new BigDecimal(capital)).longValue();
            /*
            */
            
            System.out.println("---->>lottery:"+lottery);
            System.out.println("---->>lotteryOdds:"+lotteryOdds);
            
            
            return win;    
        }
        else{
            return 0L;
        }
    }
    private void getCombination(BigDecimal[] a, int n, int begin, BigDecimal[] b, int index) {  
        
        if(n == 0){
            BigDecimal temp=new BigDecimal(1);
            for(int i = 0; i < index; i++){  
                System.out.print(b[i] + " ");
                temp=temp.multiply(b[i]);
            }
            System.out.println("temp:"+temp); 
            this.result=this.result.add(temp);
            return;
        }  
              
        for(int i = begin; i < a.length; i++){  
              
            b[index] = a[i];  
            getCombination(a, n-1, i+1, b, index+1);  
        }
   
            
    } 	
}
