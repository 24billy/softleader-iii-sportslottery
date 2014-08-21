package tw.com.softleader.sportslottery.setting.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;

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
	
	public List<GameEntity> findForHistory(LocalDateTime timeFrom, LocalDateTime timeTo,String teamName){		
		Session session = sessionFactory.getCurrentSession();
		
		//設定sql字串
		//HQL的帶入變數為 timeFrom, timeTo, teamName
		String sql = "from GameEntity games where games.isEnd = 't'";//察遜比菜是否已經結束, 要找已經結束
		String sql1 = " and games.gameTime >= :timeFrom";//搜尋大於 timeFrom的時間
		String sql2 = " and games.gameTime <= :timeTo";//搜尋小於 timeTo的時間
		String sql3 = " and (games.teamAway.teamName like :teamName or games.teamHome.teamName like :teamName)";//搜訊teamName符合部分字串
		String sql4 = " order by games.gameTime";
		
		//判斷是否有timeFrom 如有責加入sql1的敘述
		boolean hasTimeFrom = false;
		if(timeFrom != null){
			sql += sql1;
			hasTimeFrom = true;
		}
		
		//判斷是否有timeTo 如有責加入sql2的敘述
		boolean hasTimeTo = false;
		if (timeTo != null) {
			sql += sql2;
			hasTimeTo = true;
		}
		
		//判斷是否有teamName 如有責加入sql3的敘述
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

}
