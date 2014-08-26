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
	
	public List<LotteryEntity> findByTime(LocalDateTime timeBegin, LocalDateTime timeEnd){
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
	
	public List<LotteryEntity> findComplex(Long userId, LocalDateTime timeBegin, LocalDateTime timeEnd){
		Session session = sessionFactory.getCurrentSession();
		
		String sql = "from LotteryEntity where 1=1";//1=1純粹只是為了節省判斷AND是否需要而存在的
		String sql1 = " and USER_ID = :userId";
		String sql2 = " and CONFIRM_TIME >= :timeBegin";
		String sql3 = " and CONFIRM_TIME < :timeEnd";
		
		if (userId == null && timeBegin == null && timeEnd == null) {
			//全部條件都沒輸入的情況下 findAll
			Query query = session.createQuery(sql);
			return query.list();
		}
		
		boolean hasUserId = false;
		if (userId != null) {
			sql += sql1;
			hasUserId = true;
		}
		
		boolean hasTimeBegin = false;
		if (timeBegin != null) {
			sql += sql2;
			hasTimeBegin = true;
		}
		
		boolean hasTimeEnd = false;
		if (timeEnd != null) {
			sql += sql3;
			hasTimeEnd = true;
		}
		
		Query query = session.createQuery(sql);
		if (hasUserId) {
			query.setLong("userId", userId);
		}
		
		if (hasTimeBegin) {
			query.setDate("timeBegin", timeBegin.toDate());
		}
		
		if (hasTimeEnd) {
			query.setDate("timeEnd", timeEnd.toDate());
		}
	
		return query.list();
		
	}

}
