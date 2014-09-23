package tw.com.softleader.sportslottery.setting.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.UserDao;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

@Service
public class UserService extends GenericService<UserEntity> {
	@Autowired
	private UserDao dao;
	private Logger log = LoggerFactory.getLogger(UserService.class);
	private String from = "sportslott123";
	private String password = "forget123";
	@Override
	protected GenericDao<UserEntity> getDao() {
		return dao;
	}
	
	//忘記密碼 寄送新密碼到使用者email
	static Properties properties = new Properties();
	static {
		System.out.println("初始化Eamil-Properites");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.socketFactory.port", "465");
		properties.put("mail.smtp.socketFactory.class","javax.net.ssl.SSLSocketFactory");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.port", "465");
	}

	public int forgetPassword(String to, String account) {
		log.debug(to + " : " + account);
		String body = null;
		UserEntity userEntity = dao.findByUserAccount(account);
		if (userEntity != null) {
			if (userEntity.getUserEmail().equals(to)) {
				byte[] newPassword = this.getNewPassword();
				userEntity.setUserPassword(newPassword);
				this.update(userEntity);
				body = "親愛的" + userEntity.getUserName() + "您的密碼暫為:"
						+ new String(newPassword);
			} else {
				log.debug("Email不正確");
				return 1;
			}
		} else {
			log.debug("帳號不正確");
			return 2;
		}
		try {
			Session session = Session.getDefaultInstance(properties,
					new javax.mail.Authenticator() {
						protected PasswordAuthentication getPasswordAuthentication() {
							return new PasswordAuthentication(from, password);
						}
					});
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(from));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			message.setSubject("您的密碼來了,請盡快更改");
			message.setText(body);
			Transport.send(message);
		} catch (Exception e) {
			log.debug("發信失敗");
			return 3;
		}
		return 0;
	}
	//密碼加密
	public UserEntity encoding(UserEntity entity) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] temp = md.digest(entity.getUserPassword());
			entity.setUserPassword(temp);
			//log.debug("編碼成功: " + temp);
		} catch (NoSuchAlgorithmException e) {
			log.debug("編碼失敗");
			e.printStackTrace();
			return null;
		}
		return entity;
	}
	//亂數取得新密碼
	public byte[] getNewPassword() {
		StringBuffer bs = new StringBuffer();
		int word = 0;
		int select = 0;
		byte[] newPassword;
		for(int i=0;i<((int) (Math.random()*5)+6);i++) {
			select = (int)(Math.random()*3);
			switch (select) {
				case 0 : word = (int) (Math.random()*10) + 48;break;
				case 1 : word = (int) (Math.random()*26) + 65;break;
				case 2 : word = (int) (Math.random()*26) + 97;break;
				default: log.debug("取得新密碼發生錯誤(UserService)");break;
			}
			bs.append((char) word);
		}
		return  bs.toString().getBytes();
	}
	
	@Override
	public UserEntity insert(UserEntity entity) {
		String account = entity.getUserAccount().toLowerCase();
		String email = entity.getUserEmail().toLowerCase();
		entity.setUserAccount(account);
		entity.setUserEmail(email);		
		return dao.insert(this.encoding(entity));
	}
	@Override
	public UserEntity update(UserEntity entity) {
		UserEntity enEntity = this.encoding(entity);
		dao.update(enEntity);
		return entity;
	}
	//單一欄位搜尋User
	public UserEntity getByuserCardId(String userCardId) {
		return dao.findByUserCardId(userCardId);
	}
	public UserEntity getByUserAccount(String userAccount) {
		String account = userAccount.toLowerCase();
		return dao.findByUserAccount(account);
	}
	public UserEntity getByUserEmail(String userEmail) {
		String email = userEmail.toLowerCase();
		return dao.findByUserEmail(email);
	}
	//登入
	public UserEntity checkLogin(String userAccount,UserEntity checkEntity) {
		UserEntity entity = this.getByUserAccount(userAccount);
		checkEntity = this.encoding(checkEntity);
		if(entity!=null && checkEntity!=null
				&& Arrays.equals(entity.getUserPassword(), checkEntity.getUserPassword())) {
			log.debug("驗證成功");
			return entity;
		}
		log.debug("登入失敗");
		return null;
	}
	
	public List<UserEntity> getByCreateTime(LocalDate CREATE_TIME) {
		return dao.findByCreateTime(CREATE_TIME);
	}
}
