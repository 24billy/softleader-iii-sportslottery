package tw.com.softleader.sportslottery.setting.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.ReportDao;
import tw.com.softleader.sportslottery.setting.entity.ReportEntity;

@Service
public class ReportService extends GenericService<ReportEntity>{

	@Autowired
	private ReportDao dao;
	
	@Override
	protected GenericDao<ReportEntity> getDao() {
		return dao;
	}

}
