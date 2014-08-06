package tw.com.softleader.sportslottery.setting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

@Service
public class OddsService extends GenericService {
	
	@Autowired
	private OddsDao dao;
	
	@Override
	protected GenericDao<OddsEntity> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
}
