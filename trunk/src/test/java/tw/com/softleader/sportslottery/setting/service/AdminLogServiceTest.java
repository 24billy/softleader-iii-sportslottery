package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.joda.time.LocalDateTime;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.AdminLogEntity;

public class AdminLogServiceTest extends BaseTest {

	@Autowired
	private AdminLogService service;
	
	@Test
	public void test() {
		AdminLogEntity entity = new AdminLogEntity();
		entity.setProfit(1000L);
		entity.setEnteredTime(LocalDateTime.now());
		entity = service.insert(entity);
		log.debug("first entity = {}", entity);
		
		entity = new AdminLogEntity();
		entity.setProfit(2000L);
		entity.setEnteredTime(LocalDateTime.now().plusMonths(-2));
		entity = service.insert(entity);
		log.debug("second entity = {}", entity);
		
		entity = new AdminLogEntity();
		entity.setProfit(3000L);
		entity.setEnteredTime(LocalDateTime.now().plusMonths(-4));
		entity = service.insert(entity);
		log.debug("third entity = {}", entity);
		
		entity = new AdminLogEntity();
		entity.setProfit(4000L);
		entity.setEnteredTime(LocalDateTime.now().plusMonths(-7));
		entity = service.insert(entity);
		log.debug("last entity = {}", entity);
		
		List<AdminLogEntity> models = service.getInLastMonth();
		log.debug("last month models = {}", models);
		
		models = service.getInLastThreeMonths();
		log.debug("last three months models = {}", models);
		
		models = service.getInLastSixMonths();
		log.debug("last six months models = {}", models);
		
		models = service.getInLastYear();
		log.debug("last year month models = {}", models);
		
		Long sum = service.getSumFromTodayToSpecificMonth(-12);
		log.debug("sum = {}", sum);
		
		List<Long> sums = service.getSumOfLastYear();
		log.debug("sums = {}", sums);
	}

}
