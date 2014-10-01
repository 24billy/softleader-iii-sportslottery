package tw.com.softleader.sportslottery.setting.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.AnnounceEntity;

public class AnnounceDaoTest extends BaseTest{
	@Autowired
	AnnounceDao dao;
	private List<AnnounceEntity> models=null;
	
	@Test
	public void testFindLatestFiveRecord() {
		models =dao.findLatestFiveRecord();
		for(AnnounceEntity entity: models){
			System.out.println(entity);
		}
		System.out.println("size of models : "+ models.size());
//		AnnounceEntity [announceTitle=測試公告3, announceContent=測試公告內容3, announceTime=2014-08-14T10:00:00.000, modifiedTime=2014-08-15T10:30:00.000, id=3]
//				AnnounceEntity [announceTitle=測試公告2, announceContent=測試公告內容2, announceTime=2014-08-13T08:20:10.000, modifiedTime=2014-08-13T08:21:45.000, id=2]
//				AnnounceEntity [announceTitle=測試公告1, announceContent=測試公告內容1, announceTime=2014-08-10T10:50:20.000, modifiedTime=2014-08-12T07:20:50.000, id=1]
//				size of models : 3
	}

}
