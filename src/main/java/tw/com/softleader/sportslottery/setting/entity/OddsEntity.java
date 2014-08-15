package tw.com.softleader.sportslottery.setting.entity;

import java.math.BigDecimal;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

/**
 * 
 * @author ebikyatto
 *
 */

@Entity
@Table(name = "ODDS")
public class OddsEntity extends GenericEntity {
	
	@ManyToOne
	@JoinColumn(name = "GAME_ID", nullable = false)
	private GameEntity gameId;
	
	@Column(name = "ODD_TYPE", length = 10, nullable = false)
	private String oddType;
	
	@Column(name = "ODD_COMBINATION", columnDefinition = "NUMERIC(8,3)", nullable = false)
	private BigDecimal oddCombination;
	
	@Column(name = "ODD_VALUE", columnDefinition = "NUMERIC(8,3)", nullable = false)
	private BigDecimal oddValue;
	
	@Column(name = "COUNT")
	private Long count; 
	
	@Column(name = "IS_PASS")
	private Boolean isPass;
	

	@Override
	public String toString() {
		return "OddsEntity [gameId=" + gameId + ", oddType=" + oddType
				+ ", oddCombination=" + oddCombination + ", oddValue="
				+ oddValue + ", count=" + count + ", isPass=" + isPass
				+ ", id=" + id + ", createTime=" + createTime + ", creator="
				+ creator + ", modifiedTime=" + modifiedTime + ", modifier="
				+ modifier + "]";
	}

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
