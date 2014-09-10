package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name = "ADMIN_LOG")
public class AdminLogEntity extends GenericEntity {
	
	private static final long serialVersionUID = 2014L;

	@Column(name = "PROFIT")
	private Long profit;
	
	@Column(name = "ENTERED_TIME")
	@Type(type = "org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime enteredTime;

	public Long getProfit() {
		return profit;
	}

	public void setProfit(Long profit) {
		this.profit = profit;
	}

	public LocalDateTime getEnteredTime() {
		return enteredTime;
	}

	public void setEnteredTime(LocalDateTime enteredTime) {
		this.enteredTime = enteredTime;
	}

	@Override
	public String toString() {
		return "AdminLogEntity [profit=" + profit + ", enteredTime="
				+ enteredTime + ", id=" + id + "]";
	}
	
}
