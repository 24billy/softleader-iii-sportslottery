package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name="depositCard")
public class DepositCardEntity extends GenericEntity{
	
	private static final long serialVersionUID = 2014L;
	
	@Column(name="CARD_ACCOUNT", length=50, nullable = false)
	private String cardAccount;
	
	@Column(name="CARD_PASSWORD", length=50, nullable = false)
	private String cardPassword;

	@Column(name="POINT", nullable = false)
	private Long point;
	
	@Column(name="USE_TIME")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime useTime;
	
	@Column(name="STATE")
	private boolean state;
	
	@ManyToOne
	@JoinColumn(name = "USER_ID")
	private UserEntity userId;
	
	public String getCardAccount() {
		return cardAccount;
	}

	public void setCardAccount(String cardaccount) {
		this.cardAccount = cardaccount;
	}

	public String getCardPassword() {
		return cardPassword;
	}

	public void setCardPassword(String cardPassword) {
		this.cardPassword = cardPassword;
	}

	public Long getPoint() {
		return point;
	}

	public void setPoint(Long point) {
		this.point = point;
	}	

	public LocalDateTime getUseTime() {
		return useTime;
	}

	public void setUseTime(LocalDateTime useTime) {
		this.useTime = useTime;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "DepositCardEntity [cardaccount=" + cardAccount
				+ ", cardPassword=" + cardPassword + ", point=" + point
				+ ", gameTime=" + useTime + ", state=" + state + ", id=" + id
				+ "]";
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}
	
}
