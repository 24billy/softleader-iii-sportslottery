package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;

@Repository
public class LotteryOddsDao extends GenericDao<LotteryOddsEntity> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<LotteryOddsEntity> findByLotteryId(Long lotteryId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from LotteryOddsEntity lo where lo.lotteryId = :lotteryId");
		return query.setLong("lotteryId", lotteryId).list();
	}
	
	public List<LotteryOddsEntity> findByOddsId(Long oddsId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from LotteryOddsEntity lo where lo.oddsId = :oddsId");
		return query.setLong("oddsId", oddsId).list();
	}
	
	public List<LotteryOddsEntity> findPassedOdds() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from LotteryOddsEntity lo where lo.oddsId.isPass = true");
		return query.list();
	}
	
	public List<LotteryOddsEntity> findPassedOddsByLotteryId(Long lotteryId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from LotteryOddsEntity lo where lo.lotteryId = :lotteryId and lo.oddsId.isPass = true");
		return query.setLong("lotteryId", lotteryId).list();
	}
	
}
