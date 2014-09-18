package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.AnnounceEntity;

@Repository
public class AnnounceDao extends GenericDao<AnnounceEntity> {
	public List<AnnounceEntity> findLatestFiveRecord() {
		return getSession().createCriteria(AnnounceEntity.class)
					.addOrder(Order.desc("id"))
					.setMaxResults(5).list();
	}
}
