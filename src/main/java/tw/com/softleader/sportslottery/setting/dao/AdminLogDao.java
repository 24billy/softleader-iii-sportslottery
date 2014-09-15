package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDateTime;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.AdminLogEntity;

@Repository
public class AdminLogDao extends GenericDao<AdminLogEntity> {
	
	public List<AdminLogEntity> findInLastMonth() {
		return getSession().createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusMonths(-1)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now())).list();
	}
	
	public List<AdminLogEntity> findInLastThreeMonths() {
		return getSession().createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusMonths(-3)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now())).list();
	}
	
	public List<AdminLogEntity> findInLastSixMonths() {
		return getSession().createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusMonths(-6)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now())).list();
	}
	
	public List<AdminLogEntity> findInLastYear() {
		return getSession().createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusYears(-1)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now())).list();
	}
	
	public Long findSumFromTodayToSpecificMonth(int arg0) {
		return (Long) getSession().createCriteria(AdminLogEntity.class)
				.add(Restrictions.gt("enteredTime", LocalDateTime.now().plusMonths(arg0)))
				.add(Restrictions.le("enteredTime", LocalDateTime.now().plusMonths(arg0 + 1)))
				.setProjection(Projections.sum("profit")).uniqueResult();
	}
}
