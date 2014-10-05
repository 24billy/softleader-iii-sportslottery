package tw.com.softleader.sportslottery.setting.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.joda.time.LocalTime;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

@Repository
public class GameDao extends GenericDao<GameEntity>{
	
	@Override
	public List<GameEntity> findAll() {
		return getSession().createQuery("from GameEntity order by GAME_TIME").list();
	}

	public List<GameEntity> findByBallType(String ballType) {
		Query query = getSession().createQuery("from GameEntity where BALL_TYPE = :ballType order by GAME_TIME");
		return query.setString("ballType", ballType).list();
	}
	
	public List<GameEntity> findGameIsNotEnd(String ballType) {
		Query query = getSession().createQuery("from GameEntity where IS_END != true and BALL_TYPE = :ballType order by GAME_TIME");
		return query.setString("ballType", ballType).list();
	}
	
	public List<GameEntity> findGameTime(Date gameTime){
		Query query = getSession().createQuery("from GameEntity where GAME_TIME = :gameTime order by GAME_TIME");
		return query.setDate("gameTime", gameTime).list();
	}
	
	public List<GameEntity> findGameByPeriod(LocalDate timeFrom, LocalDate timeTo){
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, teamName
		String sql = "from GameEntity games where 1= 1";
		String sql1 = " and games.gameTime >= :timeFrom";//搜尋大於 timeFrom的時間
		String sql2 = " and games.gameTime < :timeTo";//搜尋小於 timeTo的時間
		String sql4 = " order by games.gameTime";
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
		
		//帶入排序方式
		sql += sql4;
		
		Query query = getSession().createQuery(sql);
	    
		//根據加入的sql敘述帶入變數
		if (hasTimeFrom) {
			query.setDate("timeFrom", timeFrom.toDate());//sql沒有支援LocalDateTime, 但有支援Date, 所以轉成Date
		}
		if (hasTimeTo) {
			query.setDate("timeTo", timeTo.toDate());
		}
		return query.list();
	}
	
	public List<GameEntity> findForHistory(LocalDate timeFrom, LocalDate timeTo,String teamName){		
////newer method user crirteria
//		
//		Criteria criteria = getSession().createCriteria(GameEntity.class);
//		criteria.createAlias("teamAway", "away");
//		criteria.createAlias("teamHome", "home");
//		
//		Criterion date = Restrictions.between("gameTime", timeFrom, timeTo.plusDays(1));
//		Criterion away = Restrictions.like("away.teamName", teamName);
//		Criterion home = Restrictions.like("home.teamName", teamName);
//		Criterion team = Restrictions.or(away, home);
//		return criteria.add(date).add(team).list();
//		
		
//.......older method using HQL	..............................................	
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, teamName
//		String sql = "from GameEntity games where games.isEnd = 't'";//查詢比賽是否已經結束, 要找已經結束
		String sql = "from GameEntity games where 1=1";
		String sql1 = " and games.gameTime > :timeFrom";//搜尋大於 timeFrom的時間
		String sql2 = " and games.gameTime <= :timeTo";//搜尋小於 timeTo的時間
		String sql3 = " and (games.teamAway.teamName like :teamName or games.teamHome.teamName like :teamName)";//搜訊teamName符合部分字串
		String sql4 = " order by games.gameTime";
		
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
		
		//判斷是否有teamName 如有則加入sql3的敘述
		boolean hasTeamName = false;
		if (teamName != null) {
			sql += sql3;
			hasTeamName = true;
		}
		
		//帶入排序方式
		sql += sql4;
		
		Query query = getSession().createQuery(sql);
	    
		//根據加入的sql敘述帶入變數
		if (hasTimeFrom) {
			query.setDate("timeFrom", timeFrom.toDate());//sql沒有支援LocalDateTime, 但有支援Date, 所以轉成Date
		}
		if (hasTimeTo) {
//			query.setDate("timeTo", timeTo.toDate());
			query.setDate("timeTo", timeTo.plusDays(1).toDate());
		}
		if (hasTeamName) {
			query.setString("teamName", teamName + "%");//因為使用 LIKE讓我們依據一個模式 (pattern) 來找出我們要的資料, 所以要搭配%這樣的萬用字元
		}
		
		return query.list();
	}
	
//	public String getHistoryJSON(LocalDateTime timeFrom, LocalDateTime timeTo,String teamName) {
//		String toJson = new Gson().toJson(this.findForHistory(timeFrom, timeTo, teamName)); 
//		//import com.google.gson.Gson;
//		//用 new Gson().toJson 與用 將findForHistory()得出的List<GameEntity> 轉成Json型態
//		return toJson;
//	}
	
	public GameEntity findByGameNum(Long gameNum) {
		Query query = getSession().createQuery("from GameEntity game where game.gameNum = :gameNum");
		return (GameEntity) query.setLong("gameNum", gameNum).uniqueResult();
	}
	
	public List<GameEntity> findComplex(Long gameNum, String teamName, Long gameStatusMin, Long gameStatusMax, LocalDate timeBegin, LocalDate timeEnd, String ballType, String leagueName) {
		
		String sql = "from GameEntity games where 1=1";
		String sql1 = " and games.gameNum = :gameNum";
		String sql2 = " and games.gameStatus >= :gameStatusMin";
		String sql3 = " and games.gameStatus <= :gameStatusMax";
		String sql4 = " and (games.teamAway.teamName like :teamName or games.teamHome.teamName like :teamName)";
		String sql5 = " and games.gameTime >= :timeBegin";
		String sql6 = " and games.gameTime < :timeEnd";
		String sql7 = " and games.ballType like :ballType";
		String sql8 = " and (games.teamAway.leagueName like :leagueName or games.teamHome.leagueName like :leagueName)";
		String sql99 = " order by games.gameTime";
		
		boolean hasGameNum = false;
		if (gameNum != null) {
			sql += sql1;
			hasGameNum = true;
		}
		boolean hasGameStatusMin = false;
		if (gameStatusMin != null) {
			sql += sql2;
			hasGameStatusMin = true;
		}
		boolean hasGameStatusMax = false;
		if (gameStatusMax != null) {
			sql += sql3;
			hasGameStatusMax = true;
		}
		boolean hasTeamName = false;
		if (teamName != null) {
			sql += sql4;
			hasTeamName = true;
		}
		boolean hasTimeBegin = false;
		if (timeBegin != null) {
			sql += sql5;
			hasTimeBegin = true;
		}
		boolean hasTimeEnd = false;
		if (timeEnd != null) {
			sql += sql6;
			hasTimeEnd = true;
		}
		boolean hasBallType = false;
		if (ballType != null) {
			sql += sql7;
			hasBallType = true;
		}
		boolean hasLeagueName = false;
		if (leagueName != null) {
			sql += sql8;
			hasLeagueName = true;
		}
		sql += sql99;
		
		System.out.println(sql);
		
		Query query = getSession().createQuery(sql);
		
		if (hasGameNum) {
			query.setLong("gameNum", gameNum);
		}
		if (hasTeamName) {
			query.setString("teamName", "%" + teamName + "%");
		}
		if (hasGameStatusMin) {
			query.setLong("gameStatusMin", gameStatusMin);
		}
		if (hasGameStatusMax) {
			query.setLong("gameStatusMax", gameStatusMax);
		}
		if (hasTimeBegin) {
			query.setDate("timeBegin", timeBegin.toDate());
		}
		if (hasTimeEnd) {
			query.setDate("timeEnd", timeEnd.toDate());
		}
		if (hasBallType) {
			query.setString("ballType", "%" + ballType + "%");
		}
		if (hasLeagueName) {
			query.setString("leagueName", "%" + leagueName + "%");
		}
		
		return query.list();
	}
	
	//從比賽時間和隊名瞿德投注物件list
	public List<OddsEntity> findOddsByTimeAndTeamName(LocalDate gameTime, String teamName){
		LocalDate newGameTime= gameTime.plusDays(1);//add one day to the gameTime
		Query query = getSession().createQuery("select game.odds from GameEntity as game where game.gameTime >= :gameTime and game.gameTime < :newGameTime and (game.teamHome.teamName = :teamName or game.teamAway.teamName = :teamName) ");
		query.setDate("gameTime", gameTime.toDate());
		query.setDate("newGameTime", newGameTime.toDate());
//		if(teamName==null){
//			teamName="";
//		}
		query.setString("teamName", teamName);
		return query.list();
		
	}
	
	//找出當天比賽所有的投注一個list 是一場比賽的投注集合，list<list...>是多場比賽的投注集合
	public List<GameEntity> findGameByLocalDate(LocalDate gameTime){
		LocalDateTime gameTimeLocalDateTime = gameTime.toLocalDateTime(new LocalTime(0, 0));
		
		Criterion lessEqualGameTime = Restrictions.between("gameTime", gameTimeLocalDateTime, gameTimeLocalDateTime.plusDays(1));
		return getSession().createCriteria(GameEntity.class)
					.setFetchMode("odds", FetchMode.SELECT)
					.add(lessEqualGameTime)
					/*.setProjection(Projections.property("odds"))*/
					.list();
		
	}
	
	
	public List<GameEntity> findGameByTimeAndName(LocalDate gameTime, String teamName){
		LocalDate newGameTime= gameTime.plusDays(1);//add one day to the gameTime
		Query query = getSession().createQuery("from GameEntity as game where game.gameTime >= :gameTime and game.gameTime < :newGameTime and (game.teamHome.teamName = :teamName or game.teamAway.teamName = :teamName)");
		query.setDate("gameTime", gameTime.toDate());
		query.setDate("newGameTime", newGameTime.toDate());
		query.setString("teamName", teamName);
		return query.list();
		/*
		Criteria criteria = session.createCriteria(GameEntity.class);
		criteria.createAlias("teamAway", "away");
		criteria.createAlias("teamHome", "home");
		
		Criterion date = Restrictions.between("gameTime", gameTime, gameTime.plusDays(1));
		Criterion away = Restrictions.like("away.teamName", teamName);
		Criterion home = Restrictions.like("home.teamName", teamName);
		Criterion team = Restrictions.or(away, home);
		return criteria.add(date).add(team).list();
		*/
	}

	public Long maxGameNum() {
		return (Long) getSession().createCriteria(GameEntity.class)
					.setProjection(Projections.max("gameNum")).uniqueResult();
	}
	
	public List<GameEntity> findFinishedGameToday() {
		LocalDateTime today = LocalDate.now().toLocalDateTime(new LocalTime(0, 0));
		Criterion isEnd = Restrictions.eq("isEnd", true);
		Criterion gameStatus = Restrictions.eq("gameStatus", 2L);
		return getSession().createCriteria(GameEntity.class)
					.setFetchMode("odds", FetchMode.SELECT)
					.add(Restrictions.between("gameTime", today, today.plusDays(1)))
					.add(Restrictions.or(isEnd, gameStatus))
					.list();
	}
	
	public List<GameEntity> findGameOnComing() {
		LocalDateTime today = LocalDate.now().toLocalDateTime(new LocalTime(0, 0));
		return getSession().createCriteria(GameEntity.class)
					.setFetchMode("odds", FetchMode.SELECT)
					.add(Restrictions.between("gameTime", today, today.plusDays(3)))
					.list();
	}
	
	public List<GameEntity> findLatestFiveRecord() {
		return getSession().createCriteria(GameEntity.class)
					.setFetchMode("odds", FetchMode.SELECT)
					.addOrder(Order.desc("id"))
					.setMaxResults(5).list();
	}
	
	public List<String> findBallTypes() {
		return getSession().createCriteria(GameEntity.class)
					.setProjection(Projections.distinct(Projections.property("ballType")))
					.list();
	}
	
	public List<GameEntity> findByLocalDateTime(LocalDateTime gameTime) {
		return getSession().createCriteria(GameEntity.class)
				.setFetchMode("odds", FetchMode.SELECT)
				.add(Restrictions.le("gameTime",gameTime)).list();
	}
	
	public List<GameEntity> findByNearDays(LocalDateTime gameTime) {
		return getSession().createCriteria(GameEntity.class)
				.setFetchMode("odds", FetchMode.SELECT)
				.add(Restrictions.between("gameTime", gameTime, gameTime.plusDays(1))).list();
	}
	
	public List<GameEntity> findByLeagueName(String leagueName) {
		Criteria criteria = getSession().createCriteria(GameEntity.class);
		criteria = criteria.createAlias("teamAway", "team");
		criteria = criteria.setFetchMode("odds", FetchMode.SELECT);
		Criterion firstCri = Restrictions.eq("team.leagueName", leagueName);
		Criterion secondCri = Restrictions.eq("team.leagueNameEn", leagueName);
		Criterion criterion = Restrictions.or(firstCri, secondCri);
		return criteria.add(criterion).list();
	}
}
