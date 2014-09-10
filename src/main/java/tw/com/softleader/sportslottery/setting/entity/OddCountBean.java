package tw.com.softleader.sportslottery.setting.entity;

import java.math.BigDecimal;

import org.joda.time.LocalDate;

public class OddCountBean {
	
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
	public void setTotalCountOftheDay(Long totalCountOftheDay) {
		this.totalCountOftheDay = totalCountOftheDay;
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
	
	private LocalDate gameTime;
	private String teamName;
	private Long count;
	private Long totalCountOftheDay;//the total count of the eight types in a day;
	private String oddType;
	private Long countPercentage;// count/totalCountOftheDay 
	private Boolean isPass;
	

}
