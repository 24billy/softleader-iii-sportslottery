package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

/**
 * @Author:Billy
 */

@Repository
public class LotteryDao extends GenericDao<LotteryEntity>{
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<LotteryEntity> findByUserId(Long userId){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from LotteryEntity where USER_ID = :userId");
		return query.setLong("userId", userId).list();
	}
	
	public List<UserEntity> findByTime(LocalDateTime timeBegin, LocalDateTime timeEnd){
		Session session = sessionFactory.getCurrentSession();
		
		String sql1 = "from LotteryEntity where CONFIRM_TIME >= :timeBegin";
		String sql2 = "from LotteryEntity where CONFIRM_TIME < :timeEnd";
		String sql3 = "from LotteryEntity where CONFIRM_TIME >= :timeBegin and CONFIRM_TIME < :timeEnd";
		
		if (timeBegin != null && timeEnd != null) {
			//起始與結束時間都有輸入的情形
			Query query = session.createQuery(sql3);
			query.setDate("timeBegin", timeBegin.toDate());
			query.setDate("timeEnd", timeEnd.toDate());
			return query.list();
		} else if (timeBegin != null) {
			//只輸入起始時間
			Query query = session.createQuery(sql1);
			return query.setDate("timeBegin", timeBegin.toDate()).list();
		} else if (timeEnd != null) {
			//只輸入結束時間
			Query query = session.createQuery(sql2);
			return query.setDate("timeEnd", timeEnd.toDate()).list();
		} else {
			return null;
		}
	}
}
