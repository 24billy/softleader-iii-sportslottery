package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;


/**
 * @Author:Rhys
 */

@Repository
public class TeamDao  extends GenericDao<TeamEntity> {
	@Autowired
	private SessionFactory sessionFactory;
	public List<TeamEntity> findByCountry(String country){
		Session session = sessionFactory.getCurrentSession();
		Query query= session.createQuery("from TeamEntity where country = :country ");
		return query.setString("country", country).list();
		
	}
}
