package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;

@Repository
public class LotteryDao extends GenericDao<LotteryEntity>{
	
	@Autowired
	private LotteryOddsDao lotteryOddsDao;
	
	public List<LotteryEntity> findByUserId(Long userId){
		Query query = getSession().createQuery("from LotteryEntity where USER_ID = :userId");
		return (List<LotteryEntity>)query.setLong("userId", userId).list();
	}
	
	@Override
	public List<LotteryEntity> findAll() {
		return getSession().createCriteria(LotteryEntity.class)
					.setFetchMode("lotteryOdds", FetchMode.SELECT).list();
	}
	
	public List<LotteryEntity> findByTime(LocalDateTime timeBegin, LocalDateTime timeEnd){
		
		String sql1 = "from LotteryEntity where CONFIRM_TIME >= :timeBegin";
		String sql2 = "from LotteryEntity where CONFIRM_TIME < :timeEnd";
		String sql3 = "from LotteryEntity where CONFIRM_TIME >= :timeBegin and CONFIRM_TIME < :timeEnd";
		
		if (timeBegin != null && timeEnd != null) {
			//起始與結束時間都有輸入的情形
			Query query = getSession().createQuery(sql3);
			query.setDate("timeBegin", timeBegin.toDate());
			query.setDate("timeEnd", timeEnd.toDate());
			return query.list();
		} else if (timeBegin != null) {
			//只輸入起始時間
			Query query = getSession().createQuery(sql1);
			return query.setDate("timeBegin", timeBegin.toDate()).list();
		} else if (timeEnd != null) {
			//只輸入結束時間
			Query query = getSession().createQuery(sql2);
			return query.setDate("timeEnd", timeEnd.toDate()).list();
		} else {
			return null;
		}
	}
	
	public List<LotteryEntity> findComplex(Long userId, LocalDate timeBegin, LocalDate timeEnd, Long win){
		
		String sql = "from LotteryEntity lotterys where 1=1";//1=1純粹只是為了節省判斷AND是否需要而存在的
		String sql1 = " and USER_ID = :userId";
		String sql2 = " and CONFIRM_TIME >= :timeBegin";
		String sql3 = " and CONFIRM_TIME < :timeEnd";
		String sql4 = "";
		if(win != null){
			if(win >= 0){
				sql4 = " and WIN >= :win";
			} else {
				sql4 = " and WIN < 0";
			}
		}
		String sql5 = " order by id desc";
		
		if (userId == null && timeBegin == null && timeEnd == null && win == null) {
			//全部條件都沒輸入的情況下 findAll
			Query query = getSession().createQuery(sql);
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
		
		boolean hasWin = false;
		if (win != null) {
			sql += sql4;
			hasWin = true;
		}
		
		sql += sql5;
		
		Query query = getSession().createQuery(sql);
		if (hasUserId) {
			query.setLong("userId", userId);
		}
		
		if (hasTimeBegin) {
			query.setDate("timeBegin", timeBegin.toDate());
		}
		
		if (hasTimeEnd) {
			query.setDate("timeEnd", timeEnd.toDate());
		}
		
		if (hasWin) {
			if(win >= 0){
				query.setLong("win", win);
			}
		}
	
		return query.list();
		
	}
	public List<LotteryEntity> findByLotteryStatus(Long lotteryStatus) {
		return getSession().createCriteria(LotteryEntity.class)
					.setFetchMode("lotteryOdds", FetchMode.SELECT)
					.add(Restrictions.eq("lotteryStatus", lotteryStatus)).list();
	}
	public List<LotteryEntity> findNewestLotterysByUserId(Long userId) {
		return getSession().createCriteria(LotteryEntity.class)
					.setFetchMode("lotteryOdds", FetchMode.SELECT)
					.addOrder(Order.desc("id"))
					.add(Restrictions.eq("userId", userId))
					.setMaxResults(3).list();
	}
}
