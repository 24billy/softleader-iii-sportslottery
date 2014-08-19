package tw.com.softleader.sportslottery.setting.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

@Repository
public class UserDao extends GenericDao<UserEntity> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public String findByUserAccount(String USER_ACCOUNT) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UserEntity u where u.USER_ACCOUNT = :USER_ACCOUNT");
		return query.setString("USER_ACCOUNT", USER_ACCOUNT).toString();
	}
}
