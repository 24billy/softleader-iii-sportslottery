package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.LotteryDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
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
	
	@Autowired
	private LotteryOddsDao lotteryOddsDao;
	
	@Autowired
	private LotteryDao lotteryDao;
	
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
	
	public boolean setIsPass(Long gameId, String su, String ats, String sc, String eo) {
		OddsEntity entity = null;
		
		try {
			List<OddsEntity> entitys = dao.findByGameId(gameId);
			
			for (OddsEntity odds : entitys) {
				odds.setIsPass(false);
				dao.update(odds);
			}
			
			if (!StringUtils.isEmpty(su)) {
				entity = dao.findByGameIdWithOddType(gameId, su).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(ats)) {
				entity = dao.findByGameIdWithOddType(gameId, ats).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(sc)) {
				entity = dao.findByGameIdWithOddType(gameId, sc).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(eo)) {
				entity = dao.findByGameIdWithOddType(gameId, eo).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<OddsEntity> getByGameIdWithOddType(Long gameId, String oddType) {
		return dao.findByGameIdWithOddType(gameId, oddType);
	}
	
	public Long countByOddType(String oddType){
		return dao.countByOddType(oddType);
	}
	
}
