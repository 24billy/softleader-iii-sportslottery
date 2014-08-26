package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

/**
 * 
 * @author Khalil
 *
 */

@Entity
@Table(name="USERN")
public class UserEntity extends GenericEntity {
	
    //http://docs.oracle.com/javaee/7/api/javax/persistence/Column.html#nullable()
	
	//USER_ACCOUNT	帳號		varchar		String		50	NOT NULL
	@Column(name="USER_ACCOUNT", length=50, nullable=false,unique = true)
	private String userAccount;
	
	//USER_PASSWORD	密碼		varchar		String		50	NOT NULL
	@Column(name="USER_PASSWORD", length=50, nullable=false)
	private String userPassword;
	
	//USER_NAME		名字		varchar		String		50	NOT NULL
	@Column(name="USER_NAME", length=50, nullable=false)
	private String userName;
	
	//USER_BIRTHDAY	生日		timesemp	JODA_TIME
	@Column(name="USER_BIRTHDAY")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDate")
	protected LocalDate userBirthday;	
	
	//USER_GENDER	性別		varchar		String		10	
	@Column(name="USER_GENDER", length=10)
	private String userGender;
	
	//USER_PHONE	電話		varchar		String		20
	@Column(name="USER_PHONE", length=10)
	private String userPhone;
	
	//USER_EMAIL	電子信箱	varchar		String		50	NOT NULL
	@Column(name="USER_EMAIL", length=50, nullable=false)
	private String userEmail;
	
	@Column(name="COINS", columnDefinition = "BIGINT default 0")
	private Long coins;
	
	@Column(name="CREATE_TIME")//data inserted time
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	protected LocalDateTime createTime;
	
	@Column(name="CREATOR") //who input the data 
	protected String creator;
	
	@Column(name="MODIFIED_TIME")//data updated time
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	protected LocalDateTime modifiedTime;
	
	@Column(name="MODIFIER")//who modifies the data
	protected String modifier;

	@Override
	public String toString() {
		return "UserEntity [userAccount=" + userAccount + ", userPassword="
				+ userPassword + ", userName=" + userName + ", userBirthday="
				+ userBirthday + ", userGender=" + userGender + ", userPhone="
				+ userPhone + ", userEmail=" + userEmail + ", coins=" + coins
				+ ", createTime=" + createTime + ", creator=" + creator
				+ ", modifiedTime=" + modifiedTime + ", modifier=" + modifier
				+ ", id=" + id + "]";
	}

	public String getUserAccount() {
		return userAccount;
	}

	public void setUserAccount(String userAccount) {
		this.userAccount = userAccount;
	}

	public String getUserPassword() {
		return userPassword;
	}

	public void setUserPassword(String userPassword) {
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
	
	
	
}
