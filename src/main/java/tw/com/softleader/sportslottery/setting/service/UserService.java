package tw.com.softleader.sportslottery.setting.service;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.UserDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

@Service
public class UserService extends GenericService<UserEntity> {
	@Autowired
	private UserDao dao;

	@Override
	protected GenericDao<UserEntity> getDao() {
		return dao;
	}
	
	public UserEntity getByUserAccount(String USER_ACCOUNT) {
		return dao.findByUserAccount(USER_ACCOUNT);
	}
	
	public UserEntity checkLogin(String userAccount,String userPassword) {
		UserEntity entity = dao.findByUserAccount(userAccount);
		if(entity!=null) {
			if(userPassword!=null) {
				String MemberPass = entity.getUserPassword();
				String GuestPass = userPassword;
				System.out.println(MemberPass+" : "+GuestPass);
				if(MemberPass.equals(GuestPass)) {
					System.out.println("驗鄭成功");
					return entity;
				}
			}
		}
		return null;
	}
}
