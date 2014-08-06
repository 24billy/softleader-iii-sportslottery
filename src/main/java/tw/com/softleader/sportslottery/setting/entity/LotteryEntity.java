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
public class LotteryEntity extends GenericEntity{
	@ManyToOne	
	@JoinColumn(name="USER_ID")
	private UserEntity userId;
	
	@ManyToOne	
	@JoinColumn(name="STAKE_ID_1")
	private StakeEntity stakeId1;
	
	@ManyToOne	
	@JoinColumn(name="STAKE_ID_2")
	private StakeEntity stakeId2;
	
	@ManyToOne	
	@JoinColumn(name="STAKE_ID_3")
	private StakeEntity stakeId3;
	
	@ManyToOne	
	@JoinColumn(name="STAKE_ID_4")
	private StakeEntity stakeId4;
	
	@ManyToOne	
	@JoinColumn(name="STAKE_ID_5")
	private StakeEntity stakeId5;
		
	@ManyToOne	
	@JoinColumn(name="STAKE_ID_6")
	private StakeEntity stakeId6;
	
	@ManyToOne	
	@JoinColumn(name="STAKE_ID_7")
	private StakeEntity stakeId7;
	
	@ManyToOne	
	@JoinColumn(name="STAKE_ID_8")
	private StakeEntity stakeId8;

	
	
	@Override
	public String toString() {
		return "LotteryEntity [userId=" + userId + ", stakeId1=" + stakeId1
				+ ", stakeId2=" + stakeId2 + ", stakeId3=" + stakeId3
				+ ", stakeId4=" + stakeId4 + ", stakeId5=" + stakeId5
				+ ", stakeId6=" + stakeId6 + ", stakeId7=" + stakeId7
				+ ", stakeId8=" + stakeId8 + ", id=" + id + ", createTime="
				+ createTime + ", creator=" + creator + ", modifiedTime="
				+ modifiedTime + ", modifier=" + modifier + "]";
	}

	public UserEntity getUserId() {
		return userId;
	}

	public void setUserId(UserEntity userId) {
		this.userId = userId;
	}

	public StakeEntity getStakeId1() {
		return stakeId1;
	}

	public void setStakeId1(StakeEntity stakeId1) {
		this.stakeId1 = stakeId1;
	}

	public StakeEntity getStakeId2() {
		return stakeId2;
	}

	public void setStakeId2(StakeEntity stakeId2) {
		this.stakeId2 = stakeId2;
	}

	public StakeEntity getStakeId3() {
		return stakeId3;
	}

	public void setStakeId3(StakeEntity stakeId3) {
		this.stakeId3 = stakeId3;
	}

	public StakeEntity getStakeId4() {
		return stakeId4;
	}

	public void setStakeId4(StakeEntity stakeId4) {
		this.stakeId4 = stakeId4;
	}

	public StakeEntity getStakeId5() {
		return stakeId5;
	}

	public void setStakeId5(StakeEntity stakeId5) {
		this.stakeId5 = stakeId5;
	}

	public StakeEntity getStakeId6() {
		return stakeId6;
	}

	public void setStakeId6(StakeEntity stakeId6) {
		this.stakeId6 = stakeId6;
	}

	public StakeEntity getStakeId7() {
		return stakeId7;
	}

	public void setStakeId7(StakeEntity stakeId7) {
		this.stakeId7 = stakeId7;
	}

	public StakeEntity getStakeId8() {
		return stakeId8;
	}

	public void setStakeId8(StakeEntity stakeId8) {
		this.stakeId8 = stakeId8;
	}
	
	
}
