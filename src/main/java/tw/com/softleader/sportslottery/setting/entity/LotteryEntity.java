package tw.com.softleader.sportslottery.setting.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;
/**
@Author:Billy 
 */
@Entity
@Table(name="LOTTERY")
public class LotteryEntity extends GenericEntity {
	@Column(name="USER_ID", nullable = false)
	private Long userId;
	
	@Column(name="WIN")
	private Long win;
	
	@Column(name="CAPITAL")
	private Long capital;
	
	@Column(name="CONFIRM_TIME")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime confirmTime;
	
	@OneToMany(fetch=FetchType.EAGER, mappedBy = "lotteryId", cascade = {CascadeType.ALL})
	private Set<LotteryOddsEntity> lotteryOdds;
	
	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public Long getWin() {
		return win;
	}

	public void setWin(Long win) {
		this.win = win;
	}

	public Long getCapital() {
		return capital;
	}

	public void setCapital(Long capital) {
		this.capital = capital;
	}

	public LocalDateTime getConfirmTime() {
		return confirmTime;
	}

	public void setConfirmTime(LocalDateTime confirmTime) {
		this.confirmTime = confirmTime;
	}

	
}
