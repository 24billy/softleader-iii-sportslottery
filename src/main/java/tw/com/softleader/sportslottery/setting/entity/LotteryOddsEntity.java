package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;
/**
 * 
 * 
 * @author Ebi & Billy
 *
 */
@Entity
@Table(name = "LOTTERY_ODDS")
public class LotteryOddsEntity extends GenericEntity {
	
	private static final long serialVersionUID = 2014L;
	
	@Column(name = "LOTTERY_ID")
	private Long lotteryId;
	
	@ManyToOne
	@JoinColumn(name = "ODDS_ID")
	private OddsEntity oddsId;

	public Long getLotteryId() {
		return lotteryId;
	}

	public void setLotteryId(Long lotteryId) {
		this.lotteryId = lotteryId;
	}

	public OddsEntity getOddsId() {
		return oddsId;
	}

	public void setOddsId(OddsEntity oddsId) {
		this.oddsId = oddsId;
	}

	@Override
	public String toString() {
		return "LotteryOddsEntity [lotteryId=" + lotteryId + ", oddsId="
				+ oddsId + ", id=" + id + "]";
	}
	
}
