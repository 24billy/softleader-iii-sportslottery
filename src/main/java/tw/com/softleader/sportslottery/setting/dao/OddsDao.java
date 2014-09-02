package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

/**
 * 
 * @author ebikyatto
 *
 */

@Repository
public class OddsDao extends GenericDao<OddsEntity> {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<OddsEntity> findAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from OddsEntity odds").list();
	}
	
	public List<OddsEntity> findByOddType(String oddType) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from OddsEntity odds where ODD_TYPE like :oddType");
		             //from OddsEntity odds where odds.gameId.gameTime < {inputtime} and odds.gameId.isEnd == 'true'
		
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotEmpty(oddType)) {
			sb.append(oddType);
		}
		sb.append("%");
		
		return query.setString("oddType", sb.toString()).list();
		
	}
	
	public List<OddsEntity> findByGameId(Long gameId) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from OddsEntity odds where GAME_ID = :gameId");
		return query.setLong("gameId", gameId).list();
	}
	
	public List<OddsEntity> findByGameIdWithOddType(Long gameId, String oddType) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from OddsEntity odds where odds.gameId = :gameId and odds.oddType like :oddType");
		             //from OddsEntity odds where odds.gameId.gameTime < {inputtime} and odds.gameId.isEnd == 'true'
		
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotEmpty(oddType)) {
			sb.append(oddType);
		}
		sb.append("%");
		
		return query.setLong("gameId", gameId).setString("oddType", sb.toString()).list();
		
	}
	
	public Long countByOddType(String oddType){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select SUM(odds.count) from OddsEntity odds where odds.oddType = :oddType ");
		query.setString("oddType",oddType);
		Long count = (Long)query.uniqueResult();
		
		
		return count;
	}
	
	
	public Long countByOddTypeAndIsPass(String oddType){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select SUM(odds.count) from OddsEntity odds where odds.oddType = :oddType and odds.isPass = 't'");
		query.setString("oddType",oddType);
		Long count = (Long)query.uniqueResult();
		
		
		return count;
		
		
	}
	
	public Long countByOddType_Time(String oddType, LocalDate timeFrom, LocalDate timeTo){
		Session session = sessionFactory.getCurrentSession();
		
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, teamName
		//String sql = "select SUM(games.odds.count)from GameEntity games where games.odds.oddType= :oddType";//查詢投注類別
		String sql = "select games.odds from GameEntity games where 1=1";//查詢投注類別
		String sql1 = " and games.gameTime >= :timeFrom";//搜尋大於 timeFrom的時間
		String sql2 = " and games.gameTime < :timeTo";//搜尋小於 timeTo的時間
		//判斷是否有timeFrom 如有則加入sql1的敘述
		boolean hasTimeFrom = false;
		if(timeFrom != null){
			sql += sql1;
			hasTimeFrom = true;
		}
		
		//判斷是否有timeTo 如有則加入sql2的敘述
		boolean hasTimeTo = false;
		if (timeTo != null) {
			sql += sql2;
			hasTimeTo = true;
		}
		
		Query query = session.createQuery(sql);
		if (hasTimeFrom) {
			query.setDate("timeFrom", timeFrom.toDate());//sql沒有支援LocalDateTime, 但有支援Date, 所以轉成Date
		}
		if (hasTimeTo) {
			query.setDate("timeTo", timeTo.toDate());
		}
		
		//Long count = (Long)query.uniqueResult();
		List<OddsEntity> odds = (List<OddsEntity>)query.list();
		System.out.println(odds);
		
		Long count = 0L;//初始化
		for (OddsEntity oddsEntity : odds) {
			if(oddsEntity.getOddType().equals(oddType)){
				count += oddsEntity.getCount();
			}
		}
		
		return count;
		
	}

	public Long countByOddType_Time_isPass(String oddType, LocalDate timeFrom, LocalDate timeTo){
		Session session = sessionFactory.getCurrentSession();
		
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, teamName
		//String sql = "select SUM(games.odds.count)from GameEntity games where games.odds.oddType= :oddType";//查詢投注類別
		String sql = "select games.odds from GameEntity games where 1=1";//查詢投注類別
		String sql1 = " and games.gameTime >= :timeFrom";//搜尋大於 timeFrom的時間
		String sql2 = " and games.gameTime < :timeTo";//搜尋小於 timeTo的時間
		//判斷是否有timeFrom 如有則加入sql1的敘述
		boolean hasTimeFrom = false;
		if(timeFrom != null){
			sql += sql1;
			hasTimeFrom = true;
		}
		
		//判斷是否有timeTo 如有則加入sql2的敘述
		boolean hasTimeTo = false;
		if (timeTo != null) {
			sql += sql2;
			hasTimeTo = true;
		}
		
		Query query = session.createQuery(sql);
		if (hasTimeFrom) {
			query.setDate("timeFrom", timeFrom.toDate());//sql沒有支援LocalDateTime, 但有支援Date, 所以轉成Date
		}
		if (hasTimeTo) {
			query.setDate("timeTo", timeTo.toDate());
		}
		
		//Long count = (Long)query.uniqueResult();
		List<OddsEntity> odds = (List<OddsEntity>)query.list();
		System.out.println(odds);
		
		Long count = 0L;//初始化
		for (OddsEntity oddsEntity : odds) {
			if(oddsEntity.getOddType().equals(oddType) && oddsEntity.getIsPass()==true ){
				count += oddsEntity.getCount();
			}
		}
		
		return count;
		
	}
	
	
	
}
