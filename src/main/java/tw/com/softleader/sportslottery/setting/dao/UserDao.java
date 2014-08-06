package tw.com.softleader.sportslottery.setting.dao;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;

@Repository
public class UserDao extends GenericDao {
	@Autowired
	private SessionFactory sessionFactory;
	
}
