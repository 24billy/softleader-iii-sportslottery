package tw.com.softleader.sportslottery.setting.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

@Repository
public class UserDao extends GenericDao<UserEntity> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
}
