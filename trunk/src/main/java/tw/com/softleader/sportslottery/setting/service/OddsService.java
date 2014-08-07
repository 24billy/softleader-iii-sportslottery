package tw.com.softleader.sportslottery.setting.service;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

import com.google.gson.Gson;

@Service
public class OddsService extends GenericService<OddsEntity> {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private OddsDao dao;
	
	@Override
	protected GenericDao<OddsEntity> getDao() {
		return dao;
	}
}
