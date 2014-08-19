package tw.com.softleader.sportslottery.setting.dao;

import org.hibernate.HibernateException;
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
	
	public boolean findByUserAccount(String USER_ACCOUNT) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UserEntity u where u.USER_ACCOUNT = :ACCOUNT");
		query.setString("ACCOUNT", USER_ACCOUNT);
		boolean result;
		UserEntity e = null;
		System.out.println("檢查點...:" + USER_ACCOUNT);
		try {
			e = (UserEntity)query.uniqueResult();
		} catch (HibernateException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("檢查...");
		if (e==null){
			result=true;
		} else {
			result=false;
		}
		return result;
	}
}
