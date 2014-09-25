package tw.com.softleader.sportslottery.setting.dao;


import java.util.List;

import org.hibernate.Query;
import org.joda.time.LocalDate;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.UserEntity;

@Repository
public class UserDao extends GenericDao<UserEntity> {
	
	public UserEntity findByUserAccount(String userAccount) {
		Query query = getSession().createQuery("from UserEntity u where USER_ACCOUNT = :userAccount");
		return  (UserEntity) query.setString("userAccount", userAccount).uniqueResult();	
	}
	
	public UserEntity findByUserEmail(String userEmail) {
		Query query = getSession().createQuery("from UserEntity where USER_EMAIL = :userEmail");
		return  (UserEntity) query.setString("userEmail", userEmail).uniqueResult();	
	}
	
	public List<UserEntity> findByCreateTime(LocalDate createTime) {
		Query query = getSession().createQuery("from UserEntity u where CREATE_TIME >= :createTime1 and CREATE_TIME < :createTime2 order by CREATE_TIME");
		query.setDate("createTime1", createTime.toDate());
		query.setDate("createTime2", createTime.plusDays(1).toDate());
		return query.list();
	}
	
	public UserEntity findByUserCardId(String userCardId) {
		Query query = getSession().createQuery("from UserEntity u where USER_CARD_ID = :userCardId");
		return (UserEntity) query.setString("userCardId", userCardId).uniqueResult();
	}
	
//	public long updateUserCoin(Long userId, Long coin) {
//		Query query = getSession().createQuery("update UserEntity set COINS = :coin where ID = :userId");
//		query.setLong("coin",coin);
//        query.setLong("userId",userId);
//        long rowCount = query.executeUpdate();
//		return rowCount;
//	}

	
}
