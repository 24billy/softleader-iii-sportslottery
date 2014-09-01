package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name = "LOTTERY_ODDS")
public class LotteryOddsEntity extends GenericEntity {
	
	@Column(name = "LOTTERY_ID")
	private Long lotteryId;
}
