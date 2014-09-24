package tw.com.softleader.sportslottery.setting.dao;

import static org.junit.Assert.assertNotNull;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;

public class TeamDaoTest extends BaseTest {
	
	@Autowired
	private TeamDao dao;
	
//	@Test
//	public void testFindByLeagueName() {
//		List<TeamEntity> teamList = dao.findByLeagueName("美國職棒");
//		log.debug("findByLeagueName = {}", teamList);
//		assertNotNull(teamList);
//	}
//
//	@Test
//	public void testleagueNames() {
//		List<String> leagueList = dao.leagueNames();
//		log.debug("leagueList = {}", leagueList);
//		assertNotNull(leagueList);
//	}
	
	@Test
	public void testFindLeagueNamesByBallType() {
		log.debug("LeagueNames = {}", dao.findLeagueNamesByBallTypeEn("Basketball"));
	}
}
