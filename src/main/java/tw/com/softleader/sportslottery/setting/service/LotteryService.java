package tw.com.softleader.sportslottery.setting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.LotteryDao;
import tw.com.softleader.sportslottery.setting.entity.LotteryEntity;

/**
@Author:Billy 
 */

@Service
public class LotteryService extends GenericService<LotteryEntity> {
	
	@Autowired
	private LotteryDao dao;
	
	@Override
	protected GenericDao<LotteryEntity> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
	protected LotteryDao getLotteryDao(){
		return dao;
	}
}
