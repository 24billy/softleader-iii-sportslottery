package tw.com.softleader.sportslottery.setting.dao;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import tw.com.softleader.sportslottery.common.test.BaseTest;
import tw.com.softleader.sportslottery.setting.entity.AdminLogEntity;

public class AdminLogDaoTest extends BaseTest{
	@Autowired
	AdminLogDao dao;
	
	@Test 
	public void testFindAll(){
		List<AdminLogEntity> models =dao.findAll();
		System.out.println("all: ");
		for(AdminLogEntity entity: models){
			System.out.println(entity);
		}
//		all: 
//			AdminLogEntity [profit=91200, enteredTime=2014-09-06T17:03:26.000, id=1]
//			AdminLogEntity [profit=25696, enteredTime=2014-02-11T11:28:22.000, id=2]
//			AdminLogEntity [profit=150422, enteredTime=2014-11-25T07:21:21.000, id=3]
//			AdminLogEntity [profit=127061, enteredTime=2014-02-19T02:15:28.000, id=4]
//			AdminLogEntity [profit=79340, enteredTime=2014-08-17T15:35:40.000, id=5]
//			AdminLogEntity [profit=61904, enteredTime=2014-09-02T22:20:10.000, id=6]
//			AdminLogEntity [profit=53885, enteredTime=2014-06-22T12:40:55.000, id=7]
//			AdminLogEntity [profit=47135, enteredTime=2014-01-22T10:15:28.000, id=8]
//			AdminLogEntity [profit=69984, enteredTime=2014-10-06T11:26:36.000, id=9]
//			AdminLogEntity [profit=51459, enteredTime=2014-12-16T11:50:22.000, id=10]
//			AdminLogEntity [profit=111845, enteredTime=2014-08-04T14:14:38.000, id=11]
//			AdminLogEntity [profit=121204, enteredTime=2014-03-28T14:08:09.000, id=12]
//			AdminLogEntity [profit=140473, enteredTime=2014-05-02T17:20:07.000, id=13]
//			AdminLogEntity [profit=26726, enteredTime=2014-06-26T12:17:15.000, id=14]
//			AdminLogEntity [profit=106258, enteredTime=2014-12-12T13:58:15.000, id=15]
//			AdminLogEntity [profit=-8114, enteredTime=2014-04-27T07:58:45.000, id=16]
//			AdminLogEntity [profit=124016, enteredTime=2014-10-05T21:11:36.000, id=17]
//			AdminLogEntity [profit=63078, enteredTime=2014-08-11T01:38:45.000, id=18]
//			AdminLogEntity [profit=52217, enteredTime=2014-09-27T03:46:38.000, id=19]
//			AdminLogEntity [profit=136969, enteredTime=2014-06-05T20:58:06.000, id=20]
//			AdminLogEntity [profit=-9818, enteredTime=2014-07-18T12:21:36.000, id=21]
//			AdminLogEntity [profit=-2465, enteredTime=2014-03-17T02:22:25.000, id=22]
//			AdminLogEntity [profit=47841, enteredTime=2014-09-02T10:37:19.000, id=23]
//			AdminLogEntity [profit=113211, enteredTime=2014-05-17T07:04:58.000, id=24]
//			AdminLogEntity [profit=152269, enteredTime=2014-11-25T12:53:26.000, id=25]
//			AdminLogEntity [profit=13908, enteredTime=2014-09-07T13:37:59.000, id=26]
//			AdminLogEntity [profit=33451, enteredTime=2014-11-21T08:21:08.000, id=27]
//			AdminLogEntity [profit=5303, enteredTime=2014-06-21T17:04:12.000, id=28]
//			AdminLogEntity [profit=78885, enteredTime=2014-01-14T21:11:01.000, id=29]
//			AdminLogEntity [profit=-15676, enteredTime=2014-10-05T05:32:04.000, id=30]
//			AdminLogEntity [profit=62388, enteredTime=2014-07-25T13:22:07.000, id=31]
//			AdminLogEntity [profit=-5113, enteredTime=2014-02-18T02:44:42.000, id=32]
//			AdminLogEntity [profit=37076, enteredTime=2014-09-22T21:15:03.000, id=33]
//			AdminLogEntity [profit=106926, enteredTime=2014-02-05T22:51:28.000, id=34]
//			AdminLogEntity [profit=135795, enteredTime=2014-06-21T18:15:52.000, id=35]
//			AdminLogEntity [profit=14430, enteredTime=2014-07-28T19:27:56.000, id=36]
//			AdminLogEntity [profit=44356, enteredTime=2014-08-24T17:49:54.000, id=37]
//			AdminLogEntity [profit=29650, enteredTime=2014-04-04T18:59:45.000, id=38]
//			AdminLogEntity [profit=103734, enteredTime=2014-04-23T19:35:13.000, id=39]
//			AdminLogEntity [profit=100843, enteredTime=2014-12-17T08:21:24.000, id=40]
//			AdminLogEntity [profit=156988, enteredTime=2014-10-13T07:51:11.000, id=41]
//			AdminLogEntity [profit=99871, enteredTime=2014-09-19T15:19:42.000, id=42]
//			AdminLogEntity [profit=-15046, enteredTime=2014-08-19T02:46:39.000, id=43]
//			AdminLogEntity [profit=113632, enteredTime=2014-04-20T16:27:48.000, id=44]
//			AdminLogEntity [profit=71837, enteredTime=2014-07-23T08:55:39.000, id=45]
//			AdminLogEntity [profit=29797, enteredTime=2014-07-05T20:20:45.000, id=46]
//			AdminLogEntity [profit=107676, enteredTime=2014-10-15T14:45:01.000, id=47]
//			AdminLogEntity [profit=132478, enteredTime=2014-12-22T19:43:53.000, id=48]
//			AdminLogEntity [profit=69167, enteredTime=2014-12-08T07:05:10.000, id=49]
//			AdminLogEntity [profit=117431, enteredTime=2014-04-11T08:59:50.000, id=50]
//			AdminLogEntity [profit=123731, enteredTime=2014-04-14T09:31:45.000, id=51]
//			AdminLogEntity [profit=99059, enteredTime=2014-01-06T23:18:09.000, id=52]
//			AdminLogEntity [profit=173701, enteredTime=2014-03-18T09:42:30.000, id=53]
//			AdminLogEntity [profit=12965, enteredTime=2014-04-02T09:10:54.000, id=54]
//			AdminLogEntity [profit=-1612, enteredTime=2014-04-06T02:09:57.000, id=55]
//			AdminLogEntity [profit=117967, enteredTime=2014-02-18T17:19:17.000, id=56]
//			AdminLogEntity [profit=61307, enteredTime=2014-01-07T19:31:30.000, id=57]
//			AdminLogEntity [profit=70438, enteredTime=2014-10-08T22:16:10.000, id=58]
//			AdminLogEntity [profit=128220, enteredTime=2014-06-07T18:39:37.000, id=59]
//			AdminLogEntity [profit=81565, enteredTime=2014-05-22T05:08:24.000, id=60]
//			AdminLogEntity [profit=88640, enteredTime=2014-09-08T17:08:52.000, id=61]
//			AdminLogEntity [profit=174497, enteredTime=2014-03-24T08:29:55.000, id=62]
//			AdminLogEntity [profit=-10633, enteredTime=2014-04-27T23:55:42.000, id=63]
//			AdminLogEntity [profit=133624, enteredTime=2014-06-09T18:39:45.000, id=64]
//			AdminLogEntity [profit=73090, enteredTime=2014-12-03T06:15:28.000, id=65]
//			AdminLogEntity [profit=-17881, enteredTime=2014-11-04T14:52:34.000, id=66]
//			AdminLogEntity [profit=168506, enteredTime=2014-08-23T20:25:46.000, id=67]
//			AdminLogEntity [profit=136586, enteredTime=2014-02-03T17:15:58.000, id=68]
//			AdminLogEntity [profit=100383, enteredTime=2014-02-07T07:49:47.000, id=69]
//			AdminLogEntity [profit=169128, enteredTime=2014-10-23T21:39:46.000, id=70]
//			AdminLogEntity [profit=78911, enteredTime=2014-09-02T20:29:27.000, id=71]
//			AdminLogEntity [profit=157294, enteredTime=2014-04-21T18:32:52.000, id=72]
//			AdminLogEntity [profit=87169, enteredTime=2014-10-07T10:38:26.000, id=73]
//			AdminLogEntity [profit=121356, enteredTime=2014-06-17T08:06:14.000, id=74]
//			AdminLogEntity [profit=113914, enteredTime=2014-03-22T20:32:54.000, id=75]
//			AdminLogEntity [profit=36039, enteredTime=2014-06-01T09:43:19.000, id=76]
//			AdminLogEntity [profit=75949, enteredTime=2014-07-08T01:04:23.000, id=77]
//			AdminLogEntity [profit=160278, enteredTime=2014-05-25T07:09:38.000, id=78]
//			AdminLogEntity [profit=40130, enteredTime=2014-09-07T15:20:06.000, id=79]
//			AdminLogEntity [profit=153763, enteredTime=2014-04-04T06:35:46.000, id=80]
//			AdminLogEntity [profit=89685, enteredTime=2014-08-06T05:07:16.000, id=81]
//			AdminLogEntity [profit=42995, enteredTime=2014-04-02T04:31:20.000, id=82]
//			AdminLogEntity [profit=82784, enteredTime=2014-02-13T13:03:28.000, id=83]
//			AdminLogEntity [profit=162258, enteredTime=2014-09-17T21:08:34.000, id=84]
//			AdminLogEntity [profit=23426, enteredTime=2014-02-28T01:44:30.000, id=85]
//			AdminLogEntity [profit=126365, enteredTime=2014-05-19T07:46:01.000, id=86]
//			AdminLogEntity [profit=5480, enteredTime=2014-02-05T22:05:31.000, id=87]
//			AdminLogEntity [profit=92215, enteredTime=2014-06-05T02:30:48.000, id=88]
//			AdminLogEntity [profit=100314, enteredTime=2014-11-03T22:27:20.000, id=89]
//			AdminLogEntity [profit=35175, enteredTime=2014-08-17T20:02:40.000, id=90]
//			AdminLogEntity [profit=136769, enteredTime=2014-07-15T11:45:09.000, id=91]
//			AdminLogEntity [profit=103959, enteredTime=2014-11-05T17:48:37.000, id=92]
//			AdminLogEntity [profit=69287, enteredTime=2014-02-06T12:17:37.000, id=93]
//			AdminLogEntity [profit=124153, enteredTime=2014-12-08T16:48:12.000, id=94]
//			AdminLogEntity [profit=145838, enteredTime=2014-02-14T09:02:46.000, id=95]
//			AdminLogEntity [profit=-4288, enteredTime=2014-01-06T03:41:11.000, id=96]
//			AdminLogEntity [profit=171850, enteredTime=2014-08-06T01:56:41.000, id=97]
//			AdminLogEntity [profit=73694, enteredTime=2014-06-15T23:30:39.000, id=98]
//			AdminLogEntity [profit=19683, enteredTime=2014-10-12T14:19:57.000, id=99]
//			AdminLogEntity [profit=34235, enteredTime=2014-02-26T23:07:40.000, id=100]
		log.debug("size of all ={}", models.size());//100
	}
	@Test
	public void testFindInLastMonth() {
		List<AdminLogEntity> models =dao.findInLastMonth();
		for(AdminLogEntity entity: models){
			System.out.println(entity);
		}
//				AdminLogEntity [profit=91200, enteredTime=2014-09-06T17:03:26.000, id=1]
//				AdminLogEntity [profit=61904, enteredTime=2014-09-02T22:20:10.000, id=6]
//				AdminLogEntity [profit=52217, enteredTime=2014-09-27T03:46:38.000, id=19]
//				AdminLogEntity [profit=47841, enteredTime=2014-09-02T10:37:19.000, id=23]
//				AdminLogEntity [profit=13908, enteredTime=2014-09-07T13:37:59.000, id=26]
//				AdminLogEntity [profit=37076, enteredTime=2014-09-22T21:15:03.000, id=33]
//				AdminLogEntity [profit=99871, enteredTime=2014-09-19T15:19:42.000, id=42]
//				AdminLogEntity [profit=88640, enteredTime=2014-09-08T17:08:52.000, id=61]
//				AdminLogEntity [profit=78911, enteredTime=2014-09-02T20:29:27.000, id=71]
//				AdminLogEntity [profit=40130, enteredTime=2014-09-07T15:20:06.000, id=79]
//				AdminLogEntity [profit=162258, enteredTime=2014-09-17T21:08:34.000, id=84]

		log.debug("size of last Month ={}", models.size());//11
	}

	@Test
	public void testFindInLastThreeMonths() {
		List<AdminLogEntity> models = dao.findInLastThreeMonths();
		for(AdminLogEntity entity : models){
			System.out.println(entity);
		}
		log.debug("size of last three months= {}", models.size());//27
	}

	@Test
	public void testFindInLastSixMonths() {
		List<AdminLogEntity> models = dao.findInLastSixMonths();
		for(AdminLogEntity entity: models){
			System.out.println(entity);
		}
		System.out.println("size of last six months= "+ models.size());//55
	}

	@Test
	public void testFindInLastYear() {
		List<AdminLogEntity> models = dao.findInLastYear(); 
		for(AdminLogEntity entity : models){
			System.out.println(entity);
		}
		System.out.println("size of last year= "+ models.size());//78
	}

	@Test
	public void testFindSumFromTodayToSpecificMonth() {
		Long sum = dao.findSumFromTodayToSpecificMonth(1);
		log.debug("sum from today to 1 months = "+ sum);//522534
		
	}

}
