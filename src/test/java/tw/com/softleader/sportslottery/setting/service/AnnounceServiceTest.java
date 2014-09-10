package tw.com.softleader.sportslottery.setting.service;

import org.joda.time.LocalDateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.AnnounceEntity;

public class AnnounceServiceTest extends BaseTest {

	@Autowired
	private AnnounceService service;
	
	@Test
	public void test() {
		AnnounceEntity entity = new AnnounceEntity();
		entity.setAnnounceContent("測試公告");
		entity.setAnnounceTime(LocalDateTime.now());
		log.debug("entity = {}", entity);
	}

}
