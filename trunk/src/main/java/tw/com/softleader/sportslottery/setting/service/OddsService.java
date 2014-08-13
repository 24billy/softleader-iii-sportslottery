package tw.com.softleader.sportslottery.setting.service;

import java.math.BigDecimal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

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
	
	public List<OddsEntity> getByGameId(Long gameId) {
		return dao.findByGameId(gameId);
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
	
	/*
	public List<OddsEntity> getAllGame(){
		return dao.findAllGame();
	}
	*/
	
}
