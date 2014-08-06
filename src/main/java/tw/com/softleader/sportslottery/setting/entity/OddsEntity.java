package tw.com.softleader.sportslottery.setting.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name = "ODDS")
public class OddsEntity extends GenericEntity {
	
	@ManyToOne
	@JoinColumn(name = "GAME_ID")
	private GameEntity gameId;
	
	@Column(name = "ODD_TYPE")
	private String oddType;
	
	@Column(name = "ODD_COMBINATION")
	private BigDecimal oddCombination;
	
	@Column(name = "ODD_VALUE")
	private BigDecimal oddValue;
	
	@Override
	public String toString() {
		return "OddsEntity [gameId=" + gameId + ", oddType=" + oddType
				+ ", oddCombination=" + oddCombination + ", oddValue="
				+ oddValue + ", id=" + id + ", createTime=" + createTime
				+ ", creator=" + creator + ", modifiedTime=" + modifiedTime
				+ ", modifier=" + modifier + "]";
	}

	public GameEntity getGameId() {
		return gameId;
	}

	public void setGameId(GameEntity gameId) {
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
	
}
