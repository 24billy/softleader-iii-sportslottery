package tw.com.softleader.sportslottery.setting.service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.List;

import org.joda.time.LocalDate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.UserDao;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;
import tw.com.softleader.sportslottery.setting.web.GameAction;

@Service
public class UserService extends GenericService<UserEntity> {
	@Autowired
	private UserDao dao;
	private Logger log = LoggerFactory.getLogger(UserService.class);
	//密碼加密
	public UserEntity encoding(UserEntity entity) {
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			byte[] temp = md.digest(entity.getUserPassword());
			entity.setUserPassword(temp);
			log.debug("編碼成功: " + temp);
		} catch (NoSuchAlgorithmException e) {
			log.debug("編碼失敗");
			e.printStackTrace();
			return null;
		}
		return entity;
	}
	
	@Override
	public UserEntity insert(UserEntity entity) {
		dao.insert(this.encoding(entity));
		return entity;
	}

	@Override
	protected GenericDao<UserEntity> getDao() {
		return dao;
	}
	
	public UserEntity getByUserAccount(String USER_ACCOUNT) {
		return dao.findByUserAccount(USER_ACCOUNT);
	}
	
	public UserEntity checkLogin(String userAccount,UserEntity checkEntity) {
		UserEntity entity = dao.findByUserAccount(userAccount);
		checkEntity = this.encoding(checkEntity);
		if(entity!=null && checkEntity!=null
				&& Arrays.equals(entity.getUserPassword(), checkEntity.getUserPassword())) {
			log.debug("驗證成功");
			return entity;
		}
		return null;
	}
	
	public List<UserEntity> getByCreateTime(LocalDate CREATE_TIME) {
		return dao.findByCreateTime(CREATE_TIME);
	}
}
