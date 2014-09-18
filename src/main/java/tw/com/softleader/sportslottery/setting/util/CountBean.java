package tw.com.softleader.sportslottery.setting.util;

import java.io.Serializable;
import java.math.BigDecimal;

import org.joda.time.LocalDateTime;

//實做comparable，用來比較count的大小
//CountBean是 一場比賽，特定投注型態的投注資訊
//包含投注型態，投注數，是否過關，過關比數(此注過關數/此場比賽單筆總購買數)，比賽隊伍，比賽時間，比賽ID
public class CountBean implements Comparable<CountBean>, Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Long count;
	private String oddType;

	@Override
	public String toString() {
		return "CountBean [count=" + count + ", oddType=" + oddType
				+ ", percentage=" + percentage + ", gameId=" + gameId
				+ ", isPass=" + isPass + ", gameTime=" + gameTime
				+ ", teamNameAway=" + teamNameAway + ", teamNameHome="
				+ teamNameHome + "]";
	}
	private BigDecimal percentage;
	private Long gameId;
	Boolean isPass;
	private LocalDateTime gameTime;
	private String teamNameAway;
	private String teamNameHome;

	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public String getOddType() {
		return oddType;
	}
	public void setOddType(String oddType) {
		this.oddType = oddType;
	}
	public BigDecimal getPercentage() {
		return percentage;
	}
	public void setPercentage(BigDecimal percentage) {
		this.percentage = percentage;
	}
	public Long getGameId() {
		return gameId;
	}
	public void setGameId(Long gameId) {
		this.gameId = gameId;
	}
	public Boolean getIsPass() {
		return isPass;
	}
	public void setIsPass(Boolean isPass) {
		this.isPass = isPass;
	}
	public LocalDateTime getGameTime() {
		return gameTime;
	}
	public void setGameTime(LocalDateTime gameTime) {
		this.gameTime = gameTime;
	}
	public String getTeamNameAway() {
		return teamNameAway;
	}
	public void setTeamNameAway(String teamNameAway) {
		this.teamNameAway = teamNameAway;
	}
	public String getTeamNameHome() {
		return teamNameHome;
	}
	public void setTeamNameHome(String teamNameHome) {
		this.teamNameHome = teamNameHome;
	}

	@Override
	public int compareTo(CountBean o) {
		
		return this.getPercentage().compareTo(o.getPercentage());
	}


}
