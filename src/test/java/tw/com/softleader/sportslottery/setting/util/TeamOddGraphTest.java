package tw.com.softleader.sportslottery.setting.util;

import static org.junit.Assert.assertEquals;

import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Map;

import org.joda.time.LocalDate;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;

public class TeamOddGraphTest extends BaseTest{
	@Autowired
	private TeamOddGraph teamOddGraph;
	@Test
	public void test() {

//test Map<String, OddCountBean> getOddBeanMapByTimeAndTeam (LocalDate gameTime, String teamName)
		LocalDate gameTime = new LocalDate();
		gameTime = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
		String teamName= "辛辛那堤紅人";
		Map<String, OddCountBean> map=teamOddGraph.getOddBeanMapByTimeAndTeam(gameTime, teamName);
//		assertEquals(new Long(100), map.get("SU_H").getCount());
//		assertEquals(new Long(300), map.get("SU_A").getCount());
//		assertEquals(new Long(400), map.get("ATS_A").getCount());
//		assertEquals(new Long(500), map.get("ATS_H").getCount());
//		assertEquals(new Long(600), map.get("SC_H").getCount());
//		assertEquals(new Long(800), map.get("SC_L").getCount());
//		assertEquals(new Long(200), map.get("ODD").getCount());
//		assertEquals(new Long(400), map.get("EVEN").getCount());
		
		
		MathContext mc = new MathContext(2, RoundingMode.HALF_UP);
//		assertEquals(new BigDecimal("100").divide(new BigDecimal("3300"),mc), bean.getCountPercentage());
		
		assertEquals(new BigDecimal("100").divide(new BigDecimal("3300"),mc), map.get("SU_H").getCountPercentage());
		assertEquals(new BigDecimal("300").divide(new BigDecimal("3300"),mc), map.get("SU_A").getCountPercentage());
//		assertEquals(new Long(400), map.get("ATS_A").getCountPercentage());
//		assertEquals(new Long(500), map.get("ATS_H").getCountPercentage());
//		assertEquals(new Long(600), map.get("SC_H").getCountPercentage());
//		assertEquals(new Long(800), map.get("SC_L").getCountPercentage());
//		assertEquals(new Long(200), map.get("ODD").getCountPercentage());
//		assertEquals(new Long(400), map.get("EVEN").getCountPercentage());
//		
		
		
	}

}
