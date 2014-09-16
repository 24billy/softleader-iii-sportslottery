package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.ReportEntity;

@Repository
public class ReportDao extends GenericDao<ReportEntity> {
	
	public List<ReportEntity> findReportsNotReplay() {
		return getSession()
				.createCriteria(ReportEntity.class)
				.add(Restrictions.eq("isReplayed", false))
				.list();
	}
}
