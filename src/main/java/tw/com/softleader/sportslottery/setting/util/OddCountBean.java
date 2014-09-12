package tw.com.softleader.sportslottery.setting.util;

import java.math.BigDecimal;
import org.joda.time.LocalDate;
//這個bean 主要用於儲存遊時間和隊伍名稱相關的odd資訊和以及購買數 和 odd在當天購賣的百分比
public class OddCountBean {
	//8 attributes
	private LocalDate gameTime;
	private String teamName;
	private Long count;
	private Long totalCountOftheDay;//the total count of the eight types in a day;
	private String oddType;
	private BigDecimal countPercentage;// count除以totalCountOftheDay 百分比
	private BigDecimal oddValue;
	private Boolean isPass;
	
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
	public BigDecimal getCountPercentage() {
		return countPercentage;
	}
	public void setCountPercentage(BigDecimal countPercentage) {
		this.countPercentage = countPercentage;
	}
	public BigDecimal getOddValue() {
		return oddValue;
	}
	public void setOddValue(BigDecimal oddValue) {
		this.oddValue = oddValue;
	}
	public Boolean getIsPass() {
		return isPass;
	}
	public void setIsPass(Boolean isPass) {
		this.isPass = isPass;
	}

}
