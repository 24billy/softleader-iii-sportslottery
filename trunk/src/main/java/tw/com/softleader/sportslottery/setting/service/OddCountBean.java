package tw.com.softleader.sportslottery.setting.service;

import java.math.BigDecimal;
import java.util.List;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

public class OddCountBean {
	private LocalDate gameTime;
	private String teamName;
	private Long count;
	private Long totalCountOftheDay;//the total count of the eight types in a day;
	private String oddType;
	private Long countPercentage;// count/totalCountOftheDay 
	private Boolean isPass;
//	@Autowired
//	private GameDao gameDao;
	
	public OddCountBean(){
		
	}
	public OddCountBean(LocalDate gameTime, String teamName, Long count,
			String oddType, Boolean isPass) {

		this.gameTime = gameTime;
		this.teamName = teamName;
		this.count = count;
		this.oddType = oddType;
		this.setTotalCountOftheDay(gameTime,teamName);
		this.setCountPercentage(count, this.totalCountOftheDay );
		this.isPass = isPass;
		
		
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
		GameDao gameDao= new GameDao();
		Long totalCountOftheDay;
		try {
			List<OddsEntity> OddsList= gameDao.getOddsByTimeAndTeamName(gameTime, teamName);
			totalCountOftheDay = 0L;
			
			for(OddsEntity odd: OddsList){
				totalCountOftheDay += odd.getCount();
				
			}
			this.totalCountOftheDay = totalCountOftheDay;

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
	public Long getCountPercentage() {
		return countPercentage;
	}
	public void setCountPercentage(Long count, Long totalCountOftheDay) {
		
		this.countPercentage =(count/totalCountOftheDay);
	}
	public Boolean getIsPass() {
		return isPass;
	}
	public void setIsPass(Boolean isPass) {
		this.isPass = isPass;
	}
	

	

	

}
