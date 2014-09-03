package tw.com.softleader.sportslottery.setting.dao;


import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.LocalDate;
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
		Query query = session.createQuery("from UserEntity u where USER_ACCOUNT = :userAccount");
		return  (UserEntity) query.setString("userAccount", userAccount).uniqueResult();	
	}
	
	public UserEntity findByUserEmail(String userEmail) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UserEntity where USER_EMAIL = :userEmail");
		return  (UserEntity) query.setString("userEmail", userEmail).uniqueResult();	
	}
	
	public List<UserEntity> findByCreateTime(LocalDate createTime) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UserEntity u where CREATE_TIME >= :createTime1 and CREATE_TIME < :createTime2 order by CREATE_TIME");
		query.setDate("createTime1", createTime.toDate());
		query.setDate("createTime2", createTime.plusDays(1).toDate());
		return query.list();
	}
	
}
