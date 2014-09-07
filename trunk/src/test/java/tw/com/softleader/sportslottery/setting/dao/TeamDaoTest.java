package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;

public class TeamDaoTest extends BaseTest {
	@Autowired
	private TeamDao dao;
	
	@Test
	public void test(){
		List<TeamEntity> models = dao.findByLeagueName("美國職棒");
		log.debug("models = {}", models);
		
	}
}
