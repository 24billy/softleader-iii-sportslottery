package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;

/**
 * 
 * @author Khalil
 *
 */

@Entity
@Table(name="USER")
public class UserEntity extends GenericEntity {
	
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
	@Type(type="org.joda.time.contrib.hibernate.PersistentLocalDateTime")
	protected LocalDateTime USER_BIRTHDAY;	
	
	//USER_GENDER	性別		varchar		String		10	
	@Column(name="USER_GENDER", length=10)
	private String USER_GENDER;
	
	//USER_PHONE	電話		varchar		String		20
	@Column(name="USER_PHONE", length=10)
	private String USER_PHONE;
	
	//USER_EMAIL	電子信箱	varchar		String		50	NOT NULL
	@Column(name="USER_EMAIL", length=50, nullable=true)
	private String USER_EMAIL;

}
