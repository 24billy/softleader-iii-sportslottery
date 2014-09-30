package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

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
		entity.setAnnounceTitle("TEST");
		entity.setAnnounceContent("測試公告");
		entity.setAnnounceTime(LocalDateTime.now());
		log.debug("entity = {}", entity);
		List<AnnounceEntity> announces= service.getLatestFiveRecord();
		System.out.println("getLastestFiveRecord:");
		for(AnnounceEntity e: announces){
			System.out.println(e);
		}
		System.out.println("the size of getLatestFiveRecord : "+ announces.size());
//		getLastestFiveRecord:
//			AnnounceEntity [announceTitle=測試公告3, announceContent=測試公告內容3, announceTime=2014-08-14T10:00:00.000, modifiedTime=2014-08-15T10:30:00.000, id=3]
//			AnnounceEntity [announceTitle=測試公告2, announceContent=測試公告內容2, announceTime=2014-08-13T08:20:10.000, modifiedTime=2014-08-13T08:21:45.000, id=2]
//			AnnounceEntity [announceTitle=測試公告1, announceContent=測試公告內容1, announceTime=2014-08-10T10:50:20.000, modifiedTime=2014-08-12T07:20:50.000, id=1]
//			the size of getLatestFiveRecord : 3
	}

}
