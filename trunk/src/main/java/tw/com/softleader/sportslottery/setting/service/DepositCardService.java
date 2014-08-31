package tw.com.softleader.sportslottery.setting.service;

import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.DepositCardDao;
import tw.com.softleader.sportslottery.setting.entity.DepositCardEntity;

public class DepositCardService extends GenericService<DepositCardEntity>{
	@Autowired
	private DepositCardDao dao; 
	
	@Override
	protected GenericDao<DepositCardEntity> getDao() {
		return dao;
	}
	
	public DepositCardEntity findByCardAccount(String cardAccount, String cardPassword) {
		
		
		return dao.findByCardAccount(cardAccount);
	}
	
	
}
