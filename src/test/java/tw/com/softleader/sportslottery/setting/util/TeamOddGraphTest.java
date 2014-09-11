package tw.com.softleader.sportslottery.setting.util;

import static org.junit.Assert.assertEquals;

import java.util.Map;

import org.joda.time.LocalDate;
import org.junit.Test;

public class TeamOddGraphTest {

	@Test
	public void test() {

		//test Map<String, OddCountBean> getOddBeanMapByTimeAndTeam (LocalDate gameTime, String teamName)
		TeamOddGraph teamOddGraph = new TeamOddGraph();
		LocalDate gameTime = new LocalDate();
		gameTime = LocalDate.parse("2014-08-19");//將時間自串轉成 LocalDateTime
		//log.debug("date1= {} ", date1);
		String teamName= "辛辛那堤紅人";
		Map<String, OddCountBean> map=teamOddGraph.getOddBeanMapByTimeAndTeam(gameTime, teamName);
		assertEquals(new Long(100), map.get("SU_H").getCount());
	}

}
