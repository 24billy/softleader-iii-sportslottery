package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name="depositCard")
public class DepositCardEntity extends GenericEntity{
	
	private static final long serialVersionUID = 2014L;
	
	@Column(name="CARD_ACCOUNT", length=50, nullable = false)
	private String cardaccount;
	
	@Column(name="CARD_PASSWORD", length=50, nullable = false)
	private String cardPassword;

	@Column(name="POINT", nullable = false)
	private Long point;
	
	@Column(name="USE_TIME")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime gameTime;
	
	@Column(name="STATE")
	private boolean state;
	
	public String getCardaccount() {
		return cardaccount;
	}

	public void setCardaccount(String cardaccount) {
		this.cardaccount = cardaccount;
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

	public LocalDateTime getGameTime() {
		return gameTime;
	}

	public void setGameTime(LocalDateTime gameTime) {
		this.gameTime = gameTime;
	}

	public boolean isState() {
		return state;
	}

	public void setState(boolean state) {
		this.state = state;
	}

	@Override
	public String toString() {
		return "DepositCardEntity [cardaccount=" + cardaccount
				+ ", cardPassword=" + cardPassword + ", point=" + point
				+ ", gameTime=" + gameTime + ", state=" + state + ", id=" + id
				+ "]";
	}
	
}
