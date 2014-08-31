package tw.com.softleader.sportslottery.setting.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.DepositCardEntity;

public class DepositCardDao extends GenericDao<DepositCardEntity> {
	//Hibernate
	@Autowired
	private SessionFactory sessionFactory;
	
	public DepositCardEntity findByCardAccount(String cardAccount) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from DepositCardEntity where CARD_ACCOUNT = :cardAccount");
		return (DepositCardEntity)query.setString("cardAccount", cardAccount).uniqueResult();
	}
	
}
