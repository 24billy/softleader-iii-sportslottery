package tw.com.softleader.sportslottery.setting.util;

import java.math.BigDecimal;

import org.joda.time.LocalDateTime;

public class CountBean {

	private Long count;
	private String oddType;
	@Override
	public String toString() {
		return "CountBean [count=" + count + ", oddType=" + oddType
				+ ", percentage=" + percentage + ", gameId=" + gameId
				+ ", isPass=" + isPass + ", gameTime=" + gameTime + "]";
	}
	private BigDecimal percentage;
	private Long gameId;
	boolean isPass;
	private LocalDateTime gameTime;

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
	public boolean isPass() {
		return isPass;
	}
	public void setPass(boolean isPass) {
		this.isPass = isPass;
	}
	public LocalDateTime getGameTime() {
		return gameTime;
	}
	public void setGameTime(LocalDateTime gameTime) {
		this.gameTime = gameTime;
	}

}
