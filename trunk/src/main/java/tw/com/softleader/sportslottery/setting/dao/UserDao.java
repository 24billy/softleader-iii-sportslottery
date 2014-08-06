package tw.com.softleader.sportslottery.setting.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.dao.GenericDao;

public class UserDao extends GenericDao {
	@Autowired
	private SessionFactory sessionFactory;
	
}
