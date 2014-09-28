package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

@Repository
public class OddsDao extends GenericDao<OddsEntity> {
	
	@Override
	public List<OddsEntity> findAll() {
		return getSession().createQuery("from OddsEntity odds").list();
	}
	
	public List<OddsEntity> findByOddType(String oddType) {
		Query query = getSession().createQuery("from OddsEntity odds where ODD_TYPE like :oddType");
		             //from OddsEntity odds where odds.gameId.gameTime < {inputtime} and odds.gameId.isEnd == 'true'
		
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotEmpty(oddType)) {
			sb.append(oddType);
		}
		sb.append("%");
		
		return query.setString("oddType", sb.toString()).list();
		
	}
	
	public List<OddsEntity> findByGameId(Long gameId) {
		Query query = getSession().createQuery("from OddsEntity odds where GAME_ID = :gameId");
		return query.setLong("gameId", gameId).list();
	}
	
	public List<OddsEntity> findByGameIdWithOddType(Long gameId, String oddType) {
		Query query = getSession().createQuery("from OddsEntity odds where odds.gameId = :gameId and odds.oddType like :oddType");
		             //from OddsEntity odds where odds.gameId.gameTime < {inputtime} and odds.gameId.isEnd == 'true'
		
		StringBuffer sb = new StringBuffer();
		if (StringUtils.isNotEmpty(oddType)) {
			sb.append(oddType);
		}
		sb.append("%");
		
		return query.setLong("gameId", gameId).setString("oddType", sb.toString()).list();
		
	}
	
	//以odd_type查投注數加總
	public Long countByOddType(String oddType){
		Query query = getSession().createQuery("select SUM(odds.count) from OddsEntity odds where odds.oddType = :oddType ");
		query.setString("oddType",oddType);
		Long count = (Long)query.uniqueResult();
		
		
		return count;
	}
	
	//以odd_type，有過關，查投注數加總
	public Long countByOddTypeAndIsPass(String oddType){
		Query query = getSession().createQuery("select SUM(odds.count) from OddsEntity odds where odds.oddType = :oddType and odds.isPass = 't'");
		query.setString("oddType",oddType);
		Long count = (Long)query.uniqueResult();
		
		
		return count;
		
		
	}
	

	//以gameId和odd_type得 投注數
	public Long countByOddTypeAndGameID(String oddType, Long gameId){
		Query query = getSession().createQuery("select odds.count from OddsEntity odds where odds.oddType = :oddType and odds.gameId = :gameId");
		query.setString("oddType",oddType);
		query.setLong("gameId", gameId);
		
		
		Long count = (Long)query.uniqueResult();
		
		
		return count;
		
	}
	
	
/*	//以odd_type，時間，查投注數加總
	public Long countByOddType_Time(String oddType, LocalDate timeFrom, LocalDate timeTo){
		getSession() getSession() = getSession()Factory.getCurrentgetSession()();
		
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, teamName
		String sql = "select SUM(games.odds.count)from GameEntity games where games.odds.oddType= :oddType";//查詢投注類別
		//String sql = "select games.odds from GameEntity games where 1=1";//查詢投注類別
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
		
		Query query = getSession().createQuery(sql);
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

	//以odd_type，時間，有過關，查投注數加總
	public Long countByOddType_Time_isPass(String oddType, LocalDate timeFrom, LocalDate timeTo){
		getSession() getSession() = getSession()Factory.getCurrentgetSession()();
		
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, 
		String sql = "select SUM(games.odds.count)from GameEntity games where games.odds.oddType= :oddType and odds.isPass = 't'";//查詢投注類別
		//String sql = "select games.odds from GameEntity games where 1=1";
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
		
		Query query = getSession().createQuery(sql);
		if (hasTimeFrom) {
			query.setDate("timeFrom", timeFrom.toDate());//sql沒有支援LocalDateTime, 但有支援Date, 所以轉成Date
		}
		if (hasTimeTo) {
			query.setDate("timeTo", timeTo.toDate());
		}
		
		//Long count = (Long)query.uniqueResult();
		List<OddsEntity> odds = (List<OddsEntity>)query.list();
		//System.out.println(odds); //testing
		
		Long count = 0L;//初始化
		for (OddsEntity oddsEntity : odds) {
			if(oddsEntity.getOddType().equals(oddType) && oddsEntity.getIsPass()==true ){//查詢投注類別
				count += oddsEntity.getCount();
			}
		}
		
		return count;
		
	}*/
	
/*	//以時間範圍，得List<OddsEntity，以COUNT大小排列，從大排到小
	public List<OddsEntity> findByTime_orderByCount(LocalDate timeFrom, LocalDate timeTo){
		getSession() getSession() = getSession()Factory.getCurrentgetSession()();
		
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, 

		String sql = "select game.odds from GameEntity as game where 1=1";
		String sql1 = " and game.gameTime >= :timeFrom";//搜尋大於 timeFrom的時間
		String sql2 = " and game.gameTime < :timeTo";//搜尋小於 timeTo的時間
		//String sql3 = " order by odd.count desc ";//以count 由大到小排序
		//判斷是否有timeFrom 如有則加入sql1的敘述
		
		//sql += sql3;
		
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
				
		Query query = getSession().createQuery(sql);
		
		if (hasTimeFrom) {
			query.setDate("timeFrom", timeFrom.toDate());//sql沒有支援LocalDateTime, 但有支援Date, 所以轉成Date
		}
		if (hasTimeTo) {
			query.setDate("timeTo", timeTo.toDate());
		}
		
		//Long count = (Long)query.uniqueResult();
		
		return (List<OddsEntity>)query.list();
		
		
	}*/
	
	
	
	
}
