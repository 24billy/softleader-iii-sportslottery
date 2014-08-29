package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

import com.google.gson.Gson;

/**
 * 
 * @author ebikyatto
 *
 */

@Service
public class OddsService extends GenericService<OddsEntity> {
	
	@Autowired
	private OddsDao dao;
	
	@Override
	protected GenericDao<OddsEntity> getDao() {
		return dao;
	}
	
	public List<OddsEntity> getByOddType(String oddType) {
		return dao.findByOddType(oddType);
	}
	
	public String getByOddTypeJson(String oddType) {
		String toJson = new Gson().toJson(dao.findByOddType(oddType));
		return toJson;
	}
	
	public List<OddsEntity> getByGameId(Long gameId) {
		return dao.findByGameId(gameId);
	}
	
	public String getByGameIdJson(Long gameId) {
		String toJson = new Gson().toJson(dao.findByGameId(gameId));
		return toJson;
	}
	
	public Double getOddValue(Long gameId, String oddType) {
		
		Double oddValue = null;
		List<OddsEntity> list = dao.findByGameId(gameId);
				
		if (list != null) {
			for (OddsEntity odds : list) {
				if (odds.getOddType().equals(oddType)) {
					oddValue = odds.getOddValue().doubleValue();
				}
			}
		}
		return oddValue;
	}
	
	public void setIsPass(Long gameId, String su, String ats, String sc, String eo) {
		OddsEntity entity = null;
		
		if (su != null) {
			entity = dao.findByGameIdWithOddType(gameId, su).get(0);
			entity.setIsPass(true);
			dao.update(entity);
		}
		if (ats != null) {
			entity = dao.findByGameIdWithOddType(gameId, ats).get(0);
			entity.setIsPass(true);
			dao.update(entity);
		}
		if (sc != null) {
			entity = dao.findByGameIdWithOddType(gameId, sc).get(0);
			entity.setIsPass(true);
			dao.update(entity);
		}
		if (eo != null) {
			entity = dao.findByGameIdWithOddType(gameId, eo).get(0);
			entity.setIsPass(true);
			dao.update(entity);
		}
	}
}
