package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.*;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.List;

import org.joda.time.LocalDate;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.util.CountBean;
import tw.com.softleader.sportslottery.setting.util.OddCountBean;

public class OddCountServiceTest extends BaseTest {
	@Autowired
	OddCountService service;
	
	@Autowired
	private GameDao gameDao;
	
//	@Test
//	public void test() {
//		LocalDate gameTime = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime		
//		String teamName= "辛辛那堤紅人";
//		String oddType="SU_H";
//		
//		
//////test BigDecimal getCountPercentage(Long count, Long totalCountOftheDay)
////		//防止循環小數
////		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);
////		BigDecimal expectedValue= new BigDecimal(new Long(100)).divide(new BigDecimal(new Long(3300)), mc);//100除以3300 取得BigDecimal
////
////		assertEquals(expectedValue,service.getCountPercentage(new Long(100), new Long(3300)));
//
////-------------------------------------------------------------------------	
//////test Long getTotalCountOftheDay(LocalDate gameTime, String teamName)
//
////		assertEquals(new Long(3300),service.getTotalCountOftheDay(gameTime, teamName));
////		
////-------------------------------------------------------------------------
//////test OddsEntity getOddsEntityByType(String oddType, List<OddsEntity> OddsList)		
//
////		List<OddsEntity> oddsList = gameDao.findOddsByTimeAndTeamName(gameTime, teamName);
////		OddsEntity odd = service.getOddsEntityByType(oddType, oddsList);
////		assertEquals(new Long(100), odd.getCount());
////		assertEquals(true,odd.getIsPass());
////		assertEquals(oddType,odd.getOddType());
////		assertEquals(new BigDecimal("1.850"),odd.getOddValue());
////test OddCountBean getBeanByGameTimeAndTeamName(LocalDate gameTime, String teamName, String oddType)
//		OddCountBean bean = service.getBeanByGameTimeAndTeamName(gameTime, teamName, oddType);
//		assertEquals(new Long(100), bean.getCount());
//		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);
//		assertEquals(new BigDecimal("100").divide(new BigDecimal("3300"),mc), bean.getCountPercentage());
//		assertEquals(gameTime, bean.getGameTime());
//		assertEquals(true, bean.getIsPass());
//		assertEquals(oddType, bean.getOddType());
//		assertEquals(new BigDecimal("1.850"), bean.getOddValue());
//		assertEquals( teamName, bean.getTeamName());
//		assertEquals(new Long(3300), bean.getTotalCountOftheDay());
//		
//		
//	}
	
//	@Test
//
//	public void testGetTotalCountOftheDay(){
//		LocalDate gameTime =LocalDate.parse("2014-09-10");
//		Long totalCount =service.getTotalCountOftheDay(gameTime);
//		System.out.println("total count = "+totalCount );
//		
//		Long size = 0L;
//		size +=service.getTotalCountOftheDay(gameTime, gameDao.findByGameNum(101L).getTeamHome().getTeamName());
//		size +=service.getTotalCountOftheDay(gameTime, gameDao.findByGameNum(102L).getTeamHome().getTeamName());
//		size +=service.getTotalCountOftheDay(gameTime, gameDao.findByGameNum(103L).getTeamHome().getTeamName());
//		size +=service.getTotalCountOftheDay(gameTime, gameDao.findByGameNum(104L).getTeamHome().getTeamName());
//		size +=service.getTotalCountOftheDay(gameTime, gameDao.findByGameNum(105L).getTeamHome().getTeamName());
//		size +=service.getTotalCountOftheDay(gameTime, gameDao.findByGameNum(106L).getTeamHome().getTeamName());
//		size +=service.getTotalCountOftheDay(gameTime, gameDao.findByGameNum(107L).getTeamHome().getTeamName());
//		size +=service.getTotalCountOftheDay(gameTime, gameDao.findByGameNum(108L).getTeamHome().getTeamName());
//		System.out.println("expected count = "+ size);
//		assertEquals(size, totalCount);
//	}

//	@Test
//	public void testgetBeanListByGameDay(){
//		LocalDate gameTime =LocalDate.parse("2014-09-10");
//		List<CountBean> beanList = service.getBeanListByGameDay(gameTime);
//		for(CountBean bean: beanList){
//			System.out.println(bean);
//		}
//		System.out.println("the size of beanList: "+ beanList.size());
//		
//	}
	
	@Test
	public void testGetCountPercentage(){
////	MathContext mc = new MathContext(2, RoundingMode.HALF_UP);
////	BigDecimal expectedValue= new BigDecimal(new Long(100)).divide(new BigDecimal(new Long(3300)), mc);//100除以3300 取得BigDecimal
////
		log.debug("getCountPercentage ={}",service.getCountPercentage(null, null));
	}
}
