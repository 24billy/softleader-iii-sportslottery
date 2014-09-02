package tw.com.softleader.sportslottery.setting.dao;

import static org.junit.Assert.assertEquals;

import java.math.BigDecimal;
import java.util.List;

import org.joda.time.LocalDate;
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
/*
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
*/		
//-----------------------------------------------------------------------------------------------------		
		
		
/*//--------------------------------Test findByOddType---------------------------------------------------		
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
*/

//--------------------------------Test countByOddType_Time---------------------------------------------------		
		
		LocalDate date1 = new LocalDate();
		date1 = LocalDate.parse("2014-08-20");//將時間自串轉成 LocalDateTime
		//log.debug("date1= {} ", date1);
		LocalDate date2 = new LocalDate();
		date2 = LocalDate.parse("2014-08-21");
		Long count29=oddsDao.countByOddType_Time("SU_H", date1, date2);
		log.debug("count of SU_H= {} ", count29);
		
//		Long count22=oddsDao.countByOddType_Time("SU_A", null, null);
//		log.debug("count of SU_A= {} ", count22);
//		
//		Long count23=oddsDao.countByOddType_Time("ATS_A", null, null);
//				
//		log.debug("count of ATS_A= {} ", count23);
//		
//		Long count24=oddsDao.countByOddType_Time("ATS_H", null, null);
//		log.debug("count of ATS_H= {} ", count24);
//		
//		Long count25=oddsDao.countByOddType_Time("SC_H", null, null);
//		log.debug("count of SC_H= {} ", count25);
//		
//		Long count26=oddsDao.countByOddType_Time("SC_L", null, null);
//		log.debug("count of SC_L= {} ", count26);
//		
//		Long count27=oddsDao.countByOddType_Time("ODD", null, null);
//		log.debug("count of ODD= {} ", count27);
//		
//		Long count28=oddsDao.countByOddType_Time("EVEN", null, null);
//		log.debug("count of EVEN= {} ", count28);
		
//-----------------------------------------------------------------------------------------------------		

	
	}

}
