package tw.com.softleader.sportslottery.setting.dao;


import java.util.List;

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
	
	public UserEntity findByUserAccount(String userAccount) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UserEntity u where USER_ACCOUNT = :ACCOUNT");
		return  (UserEntity) query.setString("ACCOUNT", userAccount).uniqueResult();	
	}
	
	public List<UserEntity> findByCreateTime(java.util.Date createTime) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UserEntity u where CREATE_TIME= :createTime order by CREATE_TIME");
		return  (List<UserEntity>) query.setDate("createTime", createTime).list();
	}
	
}
