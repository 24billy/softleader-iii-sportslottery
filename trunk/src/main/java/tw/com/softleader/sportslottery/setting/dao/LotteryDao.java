package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

/**
 * @Author:Billy
 */

@Repository
public class LotteryDao extends GenericDao<LotteryEntity>{
	@Autowired
	private SessionFactory sessionFactory;
	
	public List<UserEntity> findByUserId(Long userId){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from UserEntity where USER_ID = :userId");
		return query.setLong("userId", userId).list();
	}
}
