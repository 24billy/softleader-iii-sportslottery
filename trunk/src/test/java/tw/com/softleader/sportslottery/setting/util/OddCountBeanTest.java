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
	@Autowired
	OddCountBean bean;

	Long totalCountOftheDay;
	Long expectedResult;
	@Before
	public void setUp() throws Exception {
//		beforeTest_setTotalCountOftheDay();
		beforeTest_constructorWithParameters();

	}
	public void beforeTest_setTotalCountOftheDay(){
		LocalDate gameTime = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime		
		String teamName= "辛辛那堤紅人";
		bean.setTotalCountOftheDay(gameTime, teamName);
		totalCountOftheDay= bean.getTotalCountOftheDay();
		expectedResult = 3300L;
		
	}

	private void beforeTest_constructorWithParameters() {
		LocalDate gameTime = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime		
		String teamName= "辛辛那堤紅人";
		String type="SU_H";
		bean.setBeanByGameTimeAndTeamName(gameTime,teamName,type);

	}


	@After
	public void tearDown() throws Exception {
		bean=null;

	}

	@Test
	public void test() {
		log.debug("bean = {}", bean);
//		assertEquals(expectedResult, totalCountOftheDay); 
		assertEquals(new Long(100), bean.getCount());
		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);
		assertEquals(new BigDecimal("100").divide(new BigDecimal("3300"),mc), bean.getCountPercentage());
		assertEquals(LocalDate.parse("2014-08-19"), bean.getGameTime());
		assertEquals(true, bean.getIsPass());
		assertEquals("SU_H", bean.getOddType());
		assertEquals(new BigDecimal("1.850"), bean.getOddValue());
		assertEquals( "辛辛那堤紅人", bean.getTeamName());
		assertEquals(new Long(3300), bean.getTotalCountOftheDay());
//		
	}


}
