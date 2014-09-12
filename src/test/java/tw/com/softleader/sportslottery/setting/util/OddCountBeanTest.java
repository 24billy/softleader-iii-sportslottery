package tw.com.softleader.sportslottery.setting.util;

import static org.junit.Assert.assertEquals;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;

import org.joda.time.LocalDate;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.util.OddCountBean;

public class OddCountBeanTest extends BaseTest {
//	@Autowired
//	OddCountBean bean;

//	Long totalCountOftheDay;
//	Long expectedResult;





	@Test
	public void test() {
		OddCountBean bean = new OddCountBean();
		
//test getTotalCountOftheDay
//		LocalDate gameTime = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime		
//		String teamName= "辛辛那堤紅人";
//		bean.setTotalCountOftheDay(gameTime, teamName);
//		Long totalCountOftheDay= bean.getTotalCountOftheDay();
//		Long expectedResult = 3300L;
//		assertEquals(expectedResult, totalCountOftheDay); 
		
//test setBeanByGameTimeAndTeamName(gameTime,teamName,type) 
		LocalDate gameTime = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime		
		String teamName= "辛辛那堤紅人";
		String type="SU_H";
		
//		bean.setBeanByGameTimeAndTeamName(gameTime,teamName,type);
		
//		
//		log.debug("bean = {}", bean.getCount());
//
//		assertEquals(new Long(100), bean.getCount());
//		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);
//		assertEquals(new BigDecimal("100").divide(new BigDecimal("3300"),mc), bean.getCountPercentage());
//		assertEquals(LocalDate.parse("2014-08-19"), bean.getGameTime());
//		assertEquals(true, bean.getIsPass());
//		assertEquals("SU_H", bean.getOddType());
//		assertEquals(new BigDecimal("1.850"), bean.getOddValue());
//		assertEquals( "辛辛那堤紅人", bean.getTeamName());
//		assertEquals(new Long(3300), bean.getTotalCountOftheDay());
//		
	}


}
