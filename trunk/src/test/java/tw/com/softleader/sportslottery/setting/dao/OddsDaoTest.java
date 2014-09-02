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
		
/*		List<OddsEntity> models = null;
		
		int originSize = 0;
		int currentSize = 0;
		
		models = oddsDao.findAll();
		
		if(models != null) {
			originSize = models.size();
		}*/
	
/*		OddsEntity entity = new OddsEntity();
		entity.setGameId(1L);
		entity.setOddType("EVEN");
		BigDecimal value = new BigDecimal("1");
		entity.setOddValue(value);
		
		oddsDao.insert(entity);
		
		models = oddsDao.findAll();
	
		if(models != null) {
			currentSize = models.size();
		}
		
		assertEquals(originSize + 1, currentSize);*/
//		
//		entity = oddsDao.findById(entity.getId());
//		log.debug("entity = {}", entity);
//		
//		entity.setOddType("ODD");
//		
//		oddsDao.update(entity);
//		log.debug("updated entity = {}", entity);
//		
//		models = oddsDao.findByOddType("ODD");
//		log.debug("findByOddType models = {}", models);
//		
//		models = oddsDao.findByGameId(1L);
//		log.debug("findByGameId models = {}", models);
//		
//		oddsDao.delete(entity);
//		
//		models = oddsDao.findAll();
//		
//		if(models != null) {
//			currentSize = models.size();
//		}
//		
//		assertEquals(originSize, currentSize);
//		
		
		//models = oddsDao.findForHistory("巴", "2014-08-08T10:50:20", "2014-08-19T10:50:20");
		/*
		log.debug("findForHistory = {}", models);
		System.out.println("size of the searching result: "+models.size());
		*/
//--------------------------------Test findByOddType---------------------------------------------------		
		Long count=oddsDao.countByOddType("SU_H");
		log.debug("count of SU_H= {} ", count);
		
		Long count2=oddsDao.countByOddType("SU_A");
		log.debug("count of SU_A= {} ", count2);
		
		Long count3=oddsDao.countByOddType("ATS_A");
		log.debug("count of ATS_A= {} ", count3);
		
		Long count4=oddsDao.countByOddType("ATS_H");
		log.debug("count of ATS_H= {} ", count4);
		
		Long count5=oddsDao.countByOddType("SC_H");
		log.debug("count of SC_H= {} ", count5);
		
		Long count6=oddsDao.countByOddType("SC_L");
		log.debug("count of SC_L= {} ", count6);
		
		Long count7=oddsDao.countByOddType("ODD");
		log.debug("count of ODD= {} ", count7);
		
		Long count8=oddsDao.countByOddType("EVEN");
		log.debug("count of EVEN= {} ", count8);
		
//-----------------------------------------------------------------------------------------------------		
		
		
		//--------------------------------Test findByOddType---------------------------------------------------		
				Long count9=oddsDao.countByOddTypeAndIsPass("SU_H");
				log.debug("count of SU_H= {} ", count9);
				
				Long count12=oddsDao.countByOddTypeAndIsPass("SU_A");
				log.debug("count of SU_A= {} ", count12);
				
				Long count13=oddsDao.countByOddTypeAndIsPass("ATS_A");
				log.debug("count of ATS_A= {} ", count13);
				
				Long count14=oddsDao.countByOddTypeAndIsPass("ATS_H");
				log.debug("count of ATS_H= {} ", count14);
				
				Long count15=oddsDao.countByOddTypeAndIsPass("SC_H");
				log.debug("count of SC_H= {} ", count15);
				
				Long count16=oddsDao.countByOddTypeAndIsPass("SC_L");
				log.debug("count of SC_L= {} ", count16);
				
				Long count17=oddsDao.countByOddTypeAndIsPass("ODD");
				log.debug("count of ODD= {} ", count17);
				
				Long count18=oddsDao.countByOddTypeAndIsPass("EVEN");
				log.debug("count of EVEN= {} ", count18);
				
		//-----------------------------------------------------------------------------------------------------		
			
	}

}
