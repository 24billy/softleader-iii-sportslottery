package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDate;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

/**
 * 
 * @author Khalil
 *
 */

@Entity
@Table(name="USER")
public class UserEntity extends GenericEntity {
	
	@Override
	public String toString() {
		return "UserEntity [USER_ACCOUNT=" + USER_ACCOUNT + ", USER_PASSWORD="
				+ USER_PASSWORD + ", USER_NAME=" + USER_NAME
				+ ", USER_BIRTHDAY=" + USER_BIRTHDAY + ", USER_GENDER="
				+ USER_GENDER + ", USER_PHONE=" + USER_PHONE + ", USER_EMAIL="
				+ USER_EMAIL + "]";
	}

	//USER_ACCOUNT	帳號		varchar		String		50	NOT NULL
	@Column(name="USER_ACCOUNT", length=50, nullable=true)
	private String USER_ACCOUNT;
	
	//USER_PASSWORD	密碼		varchar		String		50	NOT NULL
	@Column(name="USER_PASSWORD", length=50, nullable=true)
	private String USER_PASSWORD;
	
	//USER_NAME		名字		varchar		String		50	NOT NULL
	@Column(name="USER_NAME", length=50, nullable=true)
	private String USER_NAME;
	
	//USER_BIRTHDAY	生日		timesemp	JODA_TIME
	@Column(name="USER_BIRTHDAY")
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDate")
	protected LocalDate USER_BIRTHDAY;	
	
	//USER_GENDER	性別		varchar		String		10	
	@Column(name="USER_GENDER", length=10)
	private String USER_GENDER;
	
	//USER_PHONE	電話		varchar		String		20
	@Column(name="USER_PHONE", length=10)
	private String USER_PHONE;
	
	//USER_EMAIL	電子信箱	varchar		String		50	NOT NULL
	@Column(name="USER_EMAIL", length=50, nullable=true)
	private String USER_EMAIL;

	public String getUSER_ACCOUNT() {
		return USER_ACCOUNT;
	}

	public void setUSER_ACCOUNT(String uSER_ACCOUNT) {
		USER_ACCOUNT = uSER_ACCOUNT;
	}

	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}

	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public String getUSER_GENDER() {
		return USER_GENDER;
	}

	public void setUSER_GENDER(String uSER_GENDER) {
		USER_GENDER = uSER_GENDER;
	}

	public String getUSER_PHONE() {
		return USER_PHONE;
	}

	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}

	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}

	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}

	public LocalDate getUSER_BIRTHDAY() {
		return USER_BIRTHDAY;
	}

	public void setUSER_BIRTHDAY(LocalDate uSER_BIRTHDAY) {
		USER_BIRTHDAY = uSER_BIRTHDAY;
	}

	
}
