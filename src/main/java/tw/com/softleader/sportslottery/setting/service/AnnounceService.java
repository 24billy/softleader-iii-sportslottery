package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.AnnounceDao;
import tw.com.softleader.sportslottery.setting.entity.AnnounceEntity;

@Service
public class AnnounceService extends GenericService<AnnounceEntity> {

	@Autowired
	private AnnounceDao dao;

	@Override
	protected GenericDao<AnnounceEntity> getDao() {
		return dao;
	}
	
	public List<AnnounceEntity> getLatestFiveRecord() {
		return dao.findLatestFiveRecord();
	}
}
