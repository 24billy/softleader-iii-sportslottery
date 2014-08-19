package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
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
		return session.createQuery("from OddsEntity odds order by odds.gameId.gameTime").list();
	}
	
	public List<OddsEntity> findByOddType(String oddType) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from OddsEntity odds where ODD_TYPE like :oddType order by odds.gameId.gameTime");
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
		Query query = session.createQuery("from OddsEntity odds where GAME_ID = :gameId order by odds.gameId.gameTime");
		return query.setLong("gameId", gameId).list();
	}
	
	public List<OddsEntity> findForHistory(String teamName, String earliestGametime, String latestGametime){
        List<OddsEntity> result= null;
        Session session = sessionFactory.getCurrentSession();
        	
        //hibernate query http://docs.jboss.org/hibernate/core/3.3/reference/en/html/queryhql.html
      

        
        String sql = "from OddsEntity odds where odds.gameId.isEnd = 'f' and odds.gameId.gameTime >= '"+earliestGametime+"' and odds.gameId.gameTime <= '"+latestGametime+"' and (odds.gameId.teamAway.teamName like '"+teamName+"%' or odds.gameId.teamHome.teamName like '"+teamName+"%')";
    
        Query query = session.createQuery(sql);
    
        result=query.list();
    
        return result;
    
}
	
}
