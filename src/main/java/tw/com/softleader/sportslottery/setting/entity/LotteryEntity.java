package tw.com.softleader.sportslottery.setting.entity;

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
 * 
 * @author Billy
 *
 */
@Entity
@Table(name="LOTTERY")
public class LotteryEntity extends GenericEntity {
	private static final long serialVersionUID = 2014L;
	
	@Column(name="USER_ID", nullable = false)
	private Long userId;
	
	@Column(name="WIN")
	private Long win;
	
	@Column(name="CAPITAL")
	private Long capital;
	
	@Column(name="CONFIRM_TIME")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime confirmTime;
	
	@Column(name="COMBINATION_COM1")
	private Long com1;
	
	@Column(name="COMBINATION_COM2")
	private Long com2;
	
	@Column(name="COMBINATION_COM3")
	private Long com3;
	
	@Column(name="COMBINATION_COM4")
	private Long com4;	
	
	@Column(name="COMBINATION_COM5")
	private Long com5;
	
	@Column(name="COMBINATION_COM6")
	private Long com6;
	
	@Column(name="COMBINATION_COM7")
	private Long com7;
	
	@Column(name="COMBINATION_COM8")
	private Long com8;
	
	@Column(name="COMBINATION_COM0")
	private Long com0;
	
	@Column(name="LOTTERY_STATUS", columnDefinition="BIGINT default 0")
	private Long lotteryStatus;
	
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

	public Set<LotteryOddsEntity> getLotteryOdds() {
		return lotteryOdds;
	}

	public void setLotteryOdds(Set<LotteryOddsEntity> lotteryOdds) {
		this.lotteryOdds = lotteryOdds;
	}

	public Long getCom1() {
		return com1;
	}

	public void setCom1(Long com1) {
		this.com1 = com1;
	}

	public Long getCom2() {
		return com2;
	}

	public void setCom2(Long com2) {
		this.com2 = com2;
	}

	public Long getCom3() {
		return com3;
	}

	public void setCom3(Long com3) {
		this.com3 = com3;
	}

	public Long getCom4() {
		return com4;
	}

	public void setCom4(Long com4) {
		this.com4 = com4;
	}

	public Long getCom5() {
		return com5;
	}

	public void setCom5(Long com5) {
		this.com5 = com5;
	}

	public Long getCom6() {
		return com6;
	}

	public void setCom6(Long com6) {
		this.com6 = com6;
	}

	public Long getCom7() {
		return com7;
	}

	public void setCom7(Long com7) {
		this.com7 = com7;
	}

	public Long getCom8() {
		return com8;
	}

	public void setCom8(Long com8) {
		this.com8 = com8;
	}

	public Long getCom0() {
		return com0;
	}

	public void setCom0(Long com0) {
		this.com0 = com0;
	}
	
	public Long getLotteryStatus() {
		return lotteryStatus;
	}

	public void setLotteryStatus(Long lotteryStatus) {
		this.lotteryStatus = lotteryStatus;
	}

	@Override
	public String toString() {
		return "LotteryEntity [userId=" + userId + ", win=" + win
				+ ", capital=" + capital + ", confirmTime=" + confirmTime
				+ ", com1=" + com1 + ", com2=" + com2 + ", com3=" + com3
				+ ", com4=" + com4 + ", com5=" + com5 + ", com6=" + com6
				+ ", com7=" + com7 + ", com8=" + com8 + ", com0=" + com0
				+ ", lotteryStatus=" + lotteryStatus + ", lotteryOdds="
				+ lotteryOdds + "]";
	}

}
