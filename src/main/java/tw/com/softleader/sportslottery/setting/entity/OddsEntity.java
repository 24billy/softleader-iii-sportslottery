package tw.com.softleader.sportslottery.setting.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name = "ODDS")
public class OddsEntity extends GenericEntity {
	
	private static final long serialVersionUID = 2014L;

	@Column(name = "GAME_ID", nullable = false) 
	private Long gameId;
	
	@Column(name = "ODD_TYPE", length = 10, nullable = false)
	private String oddType;
	
	@Column(name = "ODD_COMBINATION", columnDefinition = "NUMERIC(8,3) default 0")
	private BigDecimal oddCombination;
	
	@Column(name = "ODD_VALUE", columnDefinition = "NUMERIC(8,3) default 0", nullable = false)
	private BigDecimal oddValue;
	
	@Column(name = "COUNT", columnDefinition = "BIGINT default 0")
	private Long count; 
	
	@Column(name = "IS_PASS", columnDefinition = "BOOLEAN default FALSE")
	private Boolean isPass;

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Boolean getIsPass() {
		return isPass;
	}

	public void setIsPass(Boolean isPass) {
		this.isPass = isPass;
	}

	public Long getGameId() {
		return gameId;
	}

	public void setGameId(Long gameId) {
		this.gameId = gameId;
	}

	public String getOddType() {
		return oddType;
	}

	public void setOddType(String oddType) {
		this.oddType = oddType;
	}

	public BigDecimal getOddCombination() {
		return oddCombination;
	}

	public void setOddCombination(BigDecimal oddCombination) {
		this.oddCombination = oddCombination;
	}

	public BigDecimal getOddValue() {
		return oddValue;
	}

	public void setOddValue(BigDecimal oddValue) {
		this.oddValue = oddValue;
	}

	@Override
	public String toString() {
		return "OddsEntity [gameId=" + gameId + ", oddType=" + oddType
				+ ", oddCombination=" + oddCombination + ", oddValue="
				+ oddValue + ", count=" + count + ", isPass=" + isPass
				+ ", id=" + id + "]";
	}
	
}
