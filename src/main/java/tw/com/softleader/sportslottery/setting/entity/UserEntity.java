package tw.com.softleader.sportslottery.setting.entity;

import java.util.Arrays;
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
	//user:id, 帳號, 密碼, 姓名, 身分證, 生日, 地址, 信箱, 電話, 驗證狀態, 營行帳戶, 錢.
    //http://docs.oracle.com/javaee/7/api/javax/persistence/Column.html#nullable()
	//帳號
	@Column(name="USER_ACCOUNT", length=50, nullable=false, unique=true)
	private String userAccount;
	//密碼
	@Column(name="USER_PASSWORD", nullable=false)
	private byte[] userPassword;
	//姓名
	@Column(name="USER_NAME", length=50, nullable=false)
	private String userName;
	//身分證
	@Column(name="USER_CARD_ID", length=10, nullable=false, unique=true)
	private String userCardId;
	//生日
	@Column(name="USER_BIRTHDAY", nullable=false)
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDate")
	private LocalDate userBirthday;	
	//地址
	@Column(name="USER_ADDRESS")
	private String userAddress;
	//信箱
	@Column(name="USER_EMAIL", length=50, nullable=false, unique=true)
	private String userEmail;
	//電話
	@Column(name="USER_PHONE", length=10)
	private String userPhone;
	//驗證狀態
	@Column(name="USER_STATE", columnDefinition = "BIGINT default 0")
	private Long userState;
	//營行帳戶
	@Column(name="USER_BANK_ACCOUNT", length=20, nullable=false)
	private String userBankAccount;
	//錢
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
	
	public String getUserCardId() {
		return userCardId;
	}

	public void setUserCardId(String userCardId) {
		this.userCardId = userCardId;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public Long getUserState() {
		return userState;
	}

	public void setUserState(Long userState) {
		this.userState = userState;
	}

	public String getUserBankAccount() {
		return userBankAccount;
	}

	public void setUserBankAccount(String userBankAccount) {
		this.userBankAccount = userBankAccount;
	}
	
	public List<LotteryEntity> getLotterys() {
		return lotterys;
	}

	public void setLotterys(List<LotteryEntity> lotterys) {
		this.lotterys = lotterys;
	}

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
				+ Arrays.toString(userPassword) + ", userName=" + userName
				+ ", userCardId=" + userCardId + ", userBirthday="
				+ userBirthday + ", userAddress=" + userAddress
				+ ", userEmail=" + userEmail + ", userPhone=" + userPhone
				+ ", userState=" + userState + ", userBankAccount="
				+ userBankAccount + ", coins=" + coins + ", lotterys="
				+ lotterys + "]";
	}
	
}
