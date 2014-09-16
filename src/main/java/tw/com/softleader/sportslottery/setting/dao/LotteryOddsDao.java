package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryOddsEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

@Repository
public class LotteryOddsDao extends GenericDao<LotteryOddsEntity> {
	
	public List<LotteryOddsEntity> findByLotteryId(Long lotteryId) {
		Query query = getSession().createQuery("from LotteryOddsEntity lo where lo.lotteryId = :lotteryId");
		return query.setLong("lotteryId", lotteryId).list();
	}
	
	public List<LotteryOddsEntity> findByOddsId(Long oddsId) {
		Query query = getSession().createQuery("from LotteryOddsEntity lo where lo.oddsId = :oddsId");
		return query.setLong("oddsId", oddsId).list();
	}
	
	public List<LotteryOddsEntity> findPassedOdds() {
		Query query = getSession().createQuery("from LotteryOddsEntity lo where lo.oddsId.isPass = true");
		return query.list();
	}
	
	public List<LotteryOddsEntity> findPassedOddsByLotteryId(Long lotteryId) {
		Query query = getSession().createQuery("from LotteryOddsEntity lo where lo.lotteryId = :lotteryId and lo.oddsId.isPass = true");
		return query.setLong("lotteryId", lotteryId).list();
	}
	
	public List<Long> findLotteryIdByOddsId(OddsEntity odds) {
		return getSession().createCriteria(LotteryOddsEntity.class)
								.add(Restrictions.eq("oddsId", odds))
								.setProjection(Projections.property("lotteryId"))
								.list();
	}
}
