package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;

public class OddsServiceTestV2 extends BaseTest{
	@Autowired
	private OddsService oddsService;
	
	private OddsEntity model = null;
	private List<OddsEntity> models = null;
	private String str = null;
	
	
	@Test
	public void testGetByOddType() {
		models = oddsService.getByOddType("SU_H");
		log.debug("GetByOddType:{}",models);
	}

	@Test
	public void testGetByOddTypeJson() {
		str = oddsService.getByOddTypeJson("SU_H");
		log.debug("GetByOddTypeJson:{}",str);
	}

	@Test
	public void testGetByGameId() {
		models = oddsService.getByGameId(100l);
		log.debug("GetByGameId:{}",models);
	}

	@Test
	public void testGetByGameIdJson() {
		str=oddsService.getByGameIdJson(100l);
		log.debug("GetByGameIdJson:{}",str);
	}

	@Test
	public void testGetOddValue() {
		Double oddValue = oddsService.getOddValue(100l, "SU_H");
		log.debug("GetOddValue:{}",oddValue);
	}

}
