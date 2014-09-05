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
		/*
		List<TeamEntity> models = dao.findByCountry("ROC");
		log.debug("find teams by country, ROC: {}", models);
		if(models != null){
			System.out.println("result size, ROC: "+models.size());
		}
		
		models=dao.findByCountry("USA");
		log.debug("find teams by country, USA: {}", models);
		if(models != null){
			System.out.println("result size, USA: "+models.size());
		}
		
		models=dao.findByCountry("JAPAN");
		log.debug("find teams by country, JAPAN: {}", models);
		if(models != null){
			System.out.println("result size, JAPAN: "+models.size());
		}
		
		models=dao.findByCountry("KOREA");
		log.debug("find teams by country, KOREA: {}", models);
		if(models != null){
			System.out.println("result size, KOREA: "+models.size());
		}
		
		
		
		*/
	}
}
