package tw.com.softleader.sportslottery.setting.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

@Entity
@Table(name="USERN")
public class UserEntity extends GenericEntity {
	
	private static final long serialVersionUID = 2014L;
	
    //http://docs.oracle.com/javaee/7/api/javax/persistence/Column.html#nullable()
	
	@Column(name="USER_ACCOUNT", length=50, nullable=false,unique = true)
	private String userAccount;
	
	@Column(name="USER_PASSWORD", nullable=false)
	private byte[] userPassword;
	
	@Column(name="USER_NAME", length=50, nullable=false)
	private String userName;
	
	@Column(name="USER_BIRTHDAY")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDate")
	private LocalDate userBirthday;	
	
	@Column(name="USER_GENDER", length=10)
	private String userGender;
	
	@Column(name="USER_PHONE", length=10)
	private String userPhone;
	
	@Column(name="USER_EMAIL", length=50, nullable=false)
	private String userEmail;
	
	@Column(name="COINS", columnDefinition = "BIGINT default 0")
	private Long coins;
	
	@Column(name="CREATE_TIME")//data inserted time
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime createTime;
	
	@Column(name="CREATOR") //who input the data 
	private String creator;
	
	@Column(name="MODIFIED_TIME")//data updated time
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	private LocalDateTime modifiedTime;
	
	@Column(name="MODIFIER")//who modifies the data
	private String modifier;

	@OneToMany(fetch=FetchType.EAGER, mappedBy = "userId", cascade = {CascadeType.ALL})
	private List<LotteryEntity> lotterys;
	
	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public byte[] getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(byte[] userPassword) {
		this.userPassword = userPassword;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public LocalDate getUserBirthday() {
		return userBirthday;
	}

	public void setUserBirthday(LocalDate userBirthday) {
		this.userBirthday = userBirthday;
	}

	public String getUserGender() {
		return userGender;
	}

	public void setUserGender(String userGender) {
		this.userGender = userGender;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public Long getCoins() {
		return coins;
	}

	public void setCoins(Long coins) {
		this.coins = coins;
	}

	public LocalDateTime getCreateTime() {
		return createTime;
	}

	public void setCreateTime(LocalDateTime createTime) {
		this.createTime = createTime;
	}

	public String getCreator() {
		return creator;
	}

	public void setCreator(String creator) {
		this.creator = creator;
	}

	public LocalDateTime getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(LocalDateTime modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	public String getModifier() {
		return modifier;
	}

	public void setModifier(String modifier) {
		this.modifier = modifier;
	}

	@Override
	public String toString() {
		return "UserEntity [userAccount=" + userAccount + ", userPassword="
				+ userPassword + ", userName=" + userName + ", userBirthday="
				+ userBirthday + ", userGender=" + userGender + ", userPhone="
				+ userPhone + ", userEmail=" + userEmail + ", coins=" + coins
				+ ", createTime=" + createTime + ", creator=" + creator
				+ ", modifiedTime=" + modifiedTime + ", modifier=" + modifier
				+ ", lotterys=" + lotterys + ", id=" + id + "]";
	}
	
}
