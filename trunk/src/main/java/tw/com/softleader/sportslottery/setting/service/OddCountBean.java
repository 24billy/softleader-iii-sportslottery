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

@Service
public class OddCountBean {
	private LocalDate gameTime;
	private String teamName;
	private Long count;
	private Long totalCountOftheDay;//the total count of the eight types in a day;
	private String oddType;
	private BigDecimal countPercentage;// count除以totalCountOftheDay 百分比字串
	private BigDecimal oddValue;
	private Boolean isPass;
	@Autowired
	private GameDao gameDao;
	public OddCountBean(){
		
	}
	
	//new 物件時，會在CONSTRUCTOR 把當日同隊所有的投注種類加總，並算出比率
	public void setBeanByGameTimeAndTeamName(LocalDate gameTime, String teamName, 
			String oddType) {

		try {
			this.gameTime = gameTime;
			this.teamName = teamName;
			List<OddsEntity> oddsList= gameDao.getOddsByTimeAndTeamName(gameTime, teamName);
			OddsEntity odd=this.getOddsEntityByType(oddType, oddsList);
			
			this.count = odd.getCount();
			this.oddType = oddType;
			this.setTotalCountOftheDay(gameTime,teamName);
			this.setCountPercentage(count, this.totalCountOftheDay );
			this.isPass = odd.getIsPass();
			System.out.println(odd.getOddValue());
			this.setOddValue(odd.getOddValue());
		} catch (Exception e) {
			System.out.println("oddsList is null in OddCountBean");
			e.printStackTrace();
		}
		
		
	}
	
	//get the entity from the oddsList for a selected oddType
	public OddsEntity getOddsEntityByType(String oddType, List<OddsEntity> OddsList){
		
		try {
			for(OddsEntity odd: OddsList){
				if(odd.getOddType().equals(oddType)){
					return odd;
				}
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
	public LocalDate getGameTime() {
		return gameTime;
	}
	public void setGameTime(LocalDate gameTime) {
		this.gameTime = gameTime;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public Long getTotalCountOftheDay() {
		return totalCountOftheDay;
	}
	public void setTotalCountOftheDay(LocalDate gameTime, String teamName) {
		//從比賽時間和隊名取得投注物件list
//		GameDao gameDao= new GameDao();
		Long totalCountOftheDay;
		try {
			List<OddsEntity> OddsList= gameDao.getOddsByTimeAndTeamName(gameTime, teamName);
			totalCountOftheDay = 0L;
			
			for(OddsEntity odd: OddsList){
				totalCountOftheDay += odd.getCount();
				
			}
			this.totalCountOftheDay = totalCountOftheDay;
			System.out.println("totalCountOftheDay = " + totalCountOftheDay);
		} catch (Exception e) {
			System.out.println("oddList is null");
			e.printStackTrace();
		}
		
	}
	public String getOddType() {
		return oddType;
	}
	public void setOddType(String oddType) {
		this.oddType = oddType;
	}
	public BigDecimal getCountPercentage() {
		return countPercentage;
	}
	public void setCountPercentage(Long count, Long totalCountOftheDay) {
		System.out.println("count = " + count);
		System.out.println("totalCountOftheDay = " + totalCountOftheDay);
		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);
		this.countPercentage = new BigDecimal(count).divide(new BigDecimal(totalCountOftheDay), mc);
		System.out.println("countPercentage = " + countPercentage);
	}
	public Boolean getIsPass() {
		return isPass;
	}
	public void setIsPass(Boolean isPass) {
		this.isPass = isPass;
	}

	public BigDecimal getOddValue() {
		return oddValue;
	}

	public void setOddValue(BigDecimal oddValue) {
		this.oddValue = oddValue;
	}
	

	

	

}
