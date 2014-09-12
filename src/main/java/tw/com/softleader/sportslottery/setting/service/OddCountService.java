package tw.com.softleader.sportslottery.setting.service;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.List;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.util.OddCountBean;

//這個bean 主要用於儲存遊時間和隊伍名稱相關的odd資訊和以及購買數 和 odd在當天購賣的百分比
@Service
public class OddCountService {

	@Autowired
	private GameDao gameDao;
	
	//new 物件時，會在CONSTRUCTOR 把當日同隊所有的投注種類加總，並算出比率
	public OddCountBean getBeanByGameTimeAndTeamName(LocalDate gameTime, String teamName, String oddType) {
		OddCountBean bean=new OddCountBean();
		try {
			bean.setGameTime(gameTime);
			bean.setTeamName(teamName);
			bean.setOddType(oddType);		
			List<OddsEntity> oddsList = gameDao.findOddsByTimeAndTeamName(gameTime, teamName);
			OddsEntity odd=this.getOddsEntityByType(oddType, oddsList);
			bean.setCount(odd.getCount());
			Long totalCountOftheDay=this.getTotalCountOftheDay(gameTime, teamName);
			bean.setOddValue(odd.getOddValue());
			bean.setIsPass(odd.getIsPass());
			bean.setTotalCountOftheDay(totalCountOftheDay);
			bean.setCountPercentage(this.getCountPercentage(odd.getCount(), totalCountOftheDay));
			
			return bean;
		} catch (Exception e) {
			System.out.println("oddsList is null in getBeanByGameTimeAndTeamName");
			e.printStackTrace();
		}
		
		return null;
	}
	
	//get the entity from the oddsList for a selected oddType
	public OddsEntity getOddsEntityByType(String oddType, List<OddsEntity> oddsList){
		
		try {
			for(OddsEntity odd: oddsList){
				if(odd.getOddType().equals(oddType)){
					return odd;
				}
			}
			
		} catch (Exception e) {
			System.out.println("something wrong in getOddsEntityByType");
			e.printStackTrace();
		}
		
		return null;
	}

	public Long getTotalCountOftheDay(LocalDate gameTime, String teamName) {
		//從比賽時間和隊名取得投注物件list

		Long totalCountOftheDay;
		try {
			List<OddsEntity> OddsList= gameDao.findOddsByTimeAndTeamName(gameTime, teamName);
			totalCountOftheDay = 0L;
			
			for(OddsEntity odd: OddsList){
				totalCountOftheDay += odd.getCount();
				
			}
			System.out.println("totalCountOftheDay: "+totalCountOftheDay);
			return totalCountOftheDay;
		} catch (Exception e) {
			System.out.println("somethig wrong in getTotalCountOftheDay");
			e.printStackTrace();
		}
		
		return null;
		
	}
	
	
	public BigDecimal getCountPercentage(Long count, Long totalCountOftheDay) {
		System.out.println("count = " + count);
		System.out.println("totalCountOftheDay = " + totalCountOftheDay);
		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);

		return new BigDecimal(count).divide(new BigDecimal(totalCountOftheDay), mc);
	}

}
