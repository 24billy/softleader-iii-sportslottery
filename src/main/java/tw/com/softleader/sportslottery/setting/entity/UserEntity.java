package tw.com.softleader.sportslottery.setting.entity;

import javax.persistence.Column;

import org.hibernate.annotations.Type;
import org.joda.time.LocalDateTime;

import tw.com.softleader.sportslottery.common.entity.GenericEntity;
/**
 * 
 * @author Khalil
 *
 */

/*
  	USER_ACCOUNT	帳號		varchar		String		50	NOT NULL
	USER_PASSWORD	密碼		varchar		String		50	NOT NULL
	USER_NAME		名字		varchar		String		50	NOT NULL
	USER_BIRTHDAY	生日		timesemp	JODA_TIME		
	USER_GENDER		性別		varchar		String		10	
	USER_PHONE		電話		varchar		String		20	
	USER_EMAIL		電子信箱	varchar		String		50	NOT NULL
 */
public class UserEntity extends GenericEntity {
	
	@Column(name="USER_ACCOUNT", length=50)
	private String USER_ACCOUNT;
	
	@Column(name="USER_PASSWORD", length=50)
	private String USER_PASSWORD;
	
	@Column(name="USER_NAME", length=50)
	private String USER_NAME;
	//
	
	
	@Column(name="USER_GENDER", length=10)
	private String USER_GENDER;
	
	
	
	
}
