package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.AdminLogEntity;

@Repository
public class AdminLogDao extends GenericDao<AdminLogEntity> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<AdminLogEntity> findInLastMonth() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusMonths(-1)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now())).list();
	}
	
	public List<AdminLogEntity> findInLastThreeMonths() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusMonths(-3)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now())).list();
	}
	
	public List<AdminLogEntity> findInLastSixMonths() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusMonths(-6)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now())).list();
	}
	
	public List<AdminLogEntity> findInLastYear() {
		Session session = sessionFactory.getCurrentSession();
		return session.createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusYears(-1)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now())).list();
	}
}
