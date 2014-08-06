package tw.com.softleader.sportslottery.setting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.BetDao;

@Service
public class BetService extends GenericService {
	
	@Autowired
	private BetDao dao;
	
	@Override
	protected GenericDao getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
}
