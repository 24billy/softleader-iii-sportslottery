package tw.com.softleader.sportslottery.setting.dao;

import static org.junit.Assert.assertEquals;

import java.math.BigDecimal;
import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

/**
 * 
 * @author ebikyatto
 *
 */

public class OddsDaoTest extends BaseTest {
	
	@Autowired
	private OddsDao oddsDao;
	
	@Autowired
	private GameDao gameDao;
	
	@Test
	public void crud() {
		
		List<OddsEntity> entitys = null;
		
		int originSize = 0;
		int currentSize = 0;
		
		entitys = oddsDao.findAll();
		
		if(entitys != null) {
			originSize = entitys.size();
		}
		
		OddsEntity entity = new OddsEntity();
		entity.setGameId(gameDao.findById(1L));
		entity.setOddType("EVEN");
		BigDecimal combination = new BigDecimal("1");
		entity.setOddCombination(combination);
		BigDecimal value = new BigDecimal("1");
		entity.setOddValue(value);
		
		oddsDao.insert(entity);
		
		entitys = oddsDao.findAll();
		
		if(entitys != null) {
			currentSize = entitys.size();
		}
		
		assertEquals(originSize + 1, currentSize);
		
		entity = oddsDao.findById(entity.getId());
		log.debug("entity = {}", entity);
		
		entity.setOddType("ODD");
		
		oddsDao.update(entity);
		log.debug("updated entity = {}", entity);
		
		oddsDao.delete(entity);
		
		entitys = oddsDao.findAll();
		
		if(entitys != null) {
			currentSize = entitys.size();
		}
		
		assertEquals(originSize, currentSize);
	}

}
