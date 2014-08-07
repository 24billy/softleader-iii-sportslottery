package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;
/**
@Author:Billy 
 */
@Entity
@Table(name="LOTTERY")
public class LotteryEntity extends GenericEntity {
	@ManyToOne	
	@JoinColumn(name="USER_ID")
	private UserEntity userId;
	
	@ManyToOne	
	@JoinColumn(name="ODDS_ID_1")
	private OddsEntity oddsId1;
	
	@ManyToOne	
	@JoinColumn(name="ODDS_ID_2")
	private OddsEntity oddsId2;
	
	@ManyToOne	
	@JoinColumn(name="ODDS_ID_3")
	private OddsEntity oddsId3;
	
	@ManyToOne	
	@JoinColumn(name="ODDS_ID_4")
	private OddsEntity oddsId4;
	
	@ManyToOne	
	@JoinColumn(name="ODDS_ID_5")
	private OddsEntity oddsId5;
		
	@ManyToOne	
	@JoinColumn(name="ODDS_ID_6")
	private OddsEntity oddsId6;
	
	@ManyToOne	
	@JoinColumn(name="ODDS_ID_7")
	private OddsEntity oddsId7;
	
	@ManyToOne	
	@JoinColumn(name="ODDS_ID_8")
	private OddsEntity oddsId8;

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public OddsEntity getOddsId1() {
		return oddsId1;
	}

	public void setOddsId1(OddsEntity oddsId1) {
		this.oddsId1 = oddsId1;
	}

	public OddsEntity getOddsId2() {
		return oddsId2;
	}

	public void setOddsId2(OddsEntity oddsId2) {
		this.oddsId2 = oddsId2;
	}

	public OddsEntity getOddsId3() {
		return oddsId3;
	}

	public void setOddsId3(OddsEntity oddsId3) {
		this.oddsId3 = oddsId3;
	}

	public OddsEntity getOddsId4() {
		return oddsId4;
	}

	public void setOddsId4(OddsEntity oddsId4) {
		this.oddsId4 = oddsId4;
	}

	public OddsEntity getOddsId5() {
		return oddsId5;
	}

	public void setOddsId5(OddsEntity oddsId5) {
		this.oddsId5 = oddsId5;
	}

	public OddsEntity getOddsId6() {
		return oddsId6;
	}

	public void setOddsId6(OddsEntity oddsId6) {
		this.oddsId6 = oddsId6;
	}

	public OddsEntity getOddsId7() {
		return oddsId7;
	}

	public void setOddsId7(OddsEntity oddsId7) {
		this.oddsId7 = oddsId7;
	}

	public OddsEntity getOddsId8() {
		return oddsId8;
	}

	public void setOddsId8(OddsEntity oddsId8) {
		this.oddsId8 = oddsId8;
	}

	@Override
	public String toString() {
		return "LotteryEntity [userId=" + userId + ", oddsId1=" + oddsId1
				+ ", oddsId2=" + oddsId2 + ", oddsId3=" + oddsId3
				+ ", oddsId4=" + oddsId4 + ", oddsId5=" + oddsId5
				+ ", oddsId6=" + oddsId6 + ", oddsId7=" + oddsId7
				+ ", oddsId8=" + oddsId8 + ", id=" + id + ", createTime="
				+ createTime + ", creator=" + creator + ", modifiedTime="
				+ modifiedTime + ", modifier=" + modifier + "]";
	}

	
	
	
	
	
}
