package tw.com.softleader.sportslottery.setting.service;

import static org.junit.Assert.assertEquals;

import org.joda.time.LocalDate;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;

public class OddCountBeanTest extends BaseTest {
	@Autowired
	OddCountBean bean;
	Long totalCountOftheDay;
	Long expectedResult;
	@Before
	public void setUp() throws Exception {
		LocalDate gameTime = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
		
		String teamName= "辛辛那堤紅人";
		Long count=1L;
		String oddType="test";
		Boolean isPass=true;
		
		
		bean.setTotalCountOftheDay(gameTime, teamName);
		totalCountOftheDay= bean.getTotalCountOftheDay();
		expectedResult = 3300L;
	}

	@After
	public void tearDown() throws Exception {
		OddCountBean bean=null;
	}

	@Test
	public void test() {
//		log.debug("bean = {}", bean);
		assertEquals(expectedResult, totalCountOftheDay); 
		
	}

}
