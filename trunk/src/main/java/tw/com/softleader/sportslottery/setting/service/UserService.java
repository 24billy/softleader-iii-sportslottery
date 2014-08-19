package tw.com.softleader.sportslottery.setting.service;

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
		// TODO Auto-generated method stub
		return dao;
	}
	public boolean getByUserAccount(String USER_ACCOUNT) {
		return dao.findByUserAccount(USER_ACCOUNT);
	}
	
}
