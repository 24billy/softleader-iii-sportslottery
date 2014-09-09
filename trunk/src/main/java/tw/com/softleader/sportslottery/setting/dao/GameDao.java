package tw.com.softleader.sportslottery.setting.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

/**
 * 
 * @author nick
 * modified by Billy 
 */
@Repository
public class GameDao extends GenericDao<GameEntity>{
	@Autowired
	private SessionFactory sessionFactory; //Hibernate
	
	@Override
	public List<GameEntity> findAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("from GameEntity order by GAME_TIME").list();
	}

	public List<GameEntity> findByBallType(String ballType) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from GameEntity where BALL_TYPE = :ballType order by GAME_TIME");
		return query.setString("ballType", ballType).list();
	}
	
	public List<GameEntity> findGameIsNotEnd(String ballType) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from GameEntity where IS_END != true and BALL_TYPE = :ballType order by GAME_TIME");
		return query.setString("ballType", ballType).list();
	}
	
	public List<GameEntity> findGameTime(Date gameTime){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from GameEntity where GAME_TIME = :gameTime order by GAME_TIME");
		return query.setDate("gameTime", gameTime).list();
	}
	
	public List<GameEntity> findGameByLeagueName(String leagueName){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from GameEntity where league_name = :leagueName order by GAME_TIME");
		return query.setString("leagueName", leagueName).list();
	}
	
	public List<GameEntity> findGameByPeriod(LocalDate timeFrom, LocalDate timeTo){
		Session session = sessionFactory.getCurrentSession();
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
		
		Query query = session.createQuery(sql);
	    
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
		Session session = sessionFactory.getCurrentSession();
		
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, teamName
		String sql = "from GameEntity games where games.isEnd = 't'";//查詢比賽是否已經結束, 要找已經結束
		String sql1 = " and games.gameTime >= :timeFrom";//搜尋大於 timeFrom的時間
		String sql2 = " and games.gameTime < :timeTo";//搜尋小於 timeTo的時間
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
		
		Query query = session.createQuery(sql);
	    
		//根據加入的sql敘述帶入變數
		if (hasTimeFrom) {
			query.setDate("timeFrom", timeFrom.toDate());//sql沒有支援LocalDateTime, 但有支援Date, 所以轉成Date
		}
		if (hasTimeTo) {
			query.setDate("timeTo", timeTo.toDate());
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
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from GameEntity game where game.gameNum = :gameNum");
		return (GameEntity) query.setLong("gameNum", gameNum).uniqueResult();
	}
	
	public List<GameEntity> findComplex(Long gameNum, String teamName, Boolean isEnd, LocalDate timeBegin, LocalDate timeEnd, String ballType) {
		Session session = sessionFactory.getCurrentSession();
		
		String sql = "from GameEntity games where 1=1";
		String sql1 = " and games.gameNum = :gameNum";
		String sql2 = " and games.isEnd = :isEnd";
		String sql3 = " and (games.teamAway.teamName like :teamName or games.teamHome.teamName like :teamName)";
		String sql4 = " and games.gameTime >= :timeBegin";
		String sql5 = " and games.gameTime < :timeEnd";
		String sql6 = " and games.ballType like :ballType";
		String sql7 = " order by games.gameTime";
		
		boolean hasGameNum = false;
		if (gameNum != null) {
			sql += sql1;
			hasGameNum = true;
		}
		boolean hasIsEnd = false;
		if (isEnd != null) {
			sql += sql2;
			hasIsEnd = true;
		}
		boolean hasTeamName = false;
		if (teamName != null) {
			sql += sql3;
			hasTeamName = true;
		}
		boolean hasTimeBegin = false;
		if (timeBegin != null) {
			sql += sql4;
			hasTimeBegin = true;
		}
		boolean hasTimeEnd = false;
		if (timeEnd != null) {
			sql += sql5;
			hasTimeEnd = true;
		}
		boolean hasBallType = false;
		if (ballType != null) {
			sql += sql6;
			hasBallType = true;
		}
		sql += sql7;
		
		System.out.println(sql);
		
		Query query = session.createQuery(sql);
		
		if (hasGameNum) {
			query.setLong("gameNum", gameNum);
		}
		if (hasTeamName) {
			query.setString("teamName", "%" + teamName + "%");
		}
		if (hasIsEnd) {
			query.setBoolean("isEnd", isEnd);
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
		
		return query.list();
	}
	
	public List<OddsEntity> getOddsByTime(LocalDate gameTime, String teamName){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select game.odds from GameEntity as game where game.gameTime = :gameTime and (game.teamHome.teamName = :teamName or game.teamAway.teamName = :teamName) ");
		query.setDate("gameTime", gameTime.toDate());
		query.setString("teamName", teamName);
		return query.list();
		
	}

}
