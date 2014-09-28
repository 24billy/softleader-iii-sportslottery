package tw.com.softleader.sportslottery.setting.dao;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.DepositCardEntity;

@Repository
public class DepositCardDao extends GenericDao<DepositCardEntity> {
	
	public DepositCardEntity findByCardAccount(String cardAccount) {
		Query query = getSession().createQuery("from DepositCardEntity where CARD_ACCOUNT = :cardAccount");
		return (DepositCardEntity)query.setString("cardAccount", cardAccount).uniqueResult();
	}
	
}
