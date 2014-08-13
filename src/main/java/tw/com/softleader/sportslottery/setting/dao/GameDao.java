package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;

/**
 * 
 * @author nick
 *
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
}
