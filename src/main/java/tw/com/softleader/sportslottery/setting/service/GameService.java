package tw.com.softleader.sportslottery.setting.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.joda.time.LocalDate;
import org.joda.time.LocalDateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.util.CountBean;

@Service
public class GameService extends GenericService<GameEntity> {
	
	@Autowired
	private GameDao dao;
	@Autowired
	private OddCountService oddCountService;
	@Autowired
	private OddsDao oddDao;

	@Override
	protected GenericDao<GameEntity> getDao() {
		
		return dao;
	}
	
	public List<GameEntity> getGameIsNotEnd(String ballType){
		return dao.findGameIsNotEnd(ballType);		
	}
	
	public List<GameEntity> getByBallType(String ballType) {
		return dao.findByBallType(ballType);
	}
	
/*	public String getForHistory(LocalDateTime timeFrom, LocalDateTime timeTo,String teamName){
		return dao.getHistoryJSON(timeFrom, timeTo, teamName);
	}*/
	
	public List<GameEntity> getForHistory(LocalDate timeFrom, LocalDate timeTo,String teamName){
		return dao.findForHistory(timeFrom, timeTo, teamName);
	}
	
	public List<GameEntity> getByLeagueName(String leagueName){
		return dao.findGameByLeagueName(leagueName);
	}
	
	public GameEntity getByGameNum(Long gameNum) {
		return dao.findByGameNum(gameNum);
	}
	
	public List<GameEntity> getComplex(Long gameNum, String teamName, Long gameStatusMin, Long gameStatusMax, LocalDate timeBegin, LocalDate timeEnd, String ballType, String leagueName) {
		return dao.findComplex(gameNum, teamName, gameStatusMin, gameStatusMax, timeBegin, timeEnd, ballType, leagueName);
	}
	
	public Long maxGameNum() {
		return dao.maxGameNum();
	}
	
	//by gameid to get the total count of the odds
	public Long getTotalCount(Long gameId){
		try {
			List<OddsEntity> OddsList= dao.findById(gameId).getOdds();
			Long totalCountOftheDay = 0L;
			
			for(OddsEntity odd: OddsList){
				totalCountOftheDay += odd.getCount();
				
			}
//			System.out.println("totalCountOftheDay: "+totalCountOftheDay+" "+dao.findById(gameId).getGameTime());
			return totalCountOftheDay;
		} catch (Exception e) {
			System.out.println("List<OddsEntity> is null in totalCount(Long gameId)");
			e.printStackTrace();
		}
		
		//如果比賽ID不存在則回傳負值
		return -100000000000000000L;
	}
	//透過gameId和投注類型取得CountBean，也就是用來統計單一比賽過關比的物件
	public CountBean getCountBean(Long gameId, String oddType){
		CountBean bean = new CountBean();
		GameEntity game = dao.findById(gameId);
		bean.setCount(this.getCount(gameId, oddType));
		bean.setGameId(gameId);
		bean.setOddType(oddType);
		bean.setIsPass(this.getIsPass(gameId, oddType));
		bean.setPercentage(this.getIsPassPercentage(gameId,oddType));
		bean.setGameTime(game.getGameTime());
		bean.setTeamNameAway(game.getTeamAway().getTeamName());
		bean.setTeamNameHome(game.getTeamHome().getTeamName());
		return bean;
	}
	
	//透過gameId 和投注類型取得投注數
	public Long getCount(Long gameId, String oddType){
		List<OddsEntity> oddsList= oddDao.findByGameId(gameId);//用GAMEID取得投注集合
		Long count = oddCountService.getOddsEntityByType(oddType, oddsList).getCount();//根據投注集合和投注類型，取得該OddsEntity，接著再取得投注數。
		return count;
	}
	
	//透過gameId和投注類型取得是否過關的資訊
	public Boolean getIsPass(Long gameId, String oddType){
		List<OddsEntity> oddsList= oddDao.findByGameId(gameId);//用GAMEID取得投注集合
		Boolean isPass = oddCountService.getOddsEntityByType(oddType, oddsList).getIsPass();//根據投注集合和投注類型，取得該OddsEntity，接著再取得投注數。
		return isPass;
	}
	
	//透過gameId和投注類型取得購買的過關比數
	public BigDecimal getIsPassPercentage(Long gameId,String oddType){
		BigDecimal percent=new BigDecimal(0);
		Boolean isPass = this.getIsPass(gameId, oddType);//根據gameId和oddtype取得此投注是否過關的資訊
		Long count = this.getCount(gameId, oddType);//取得此投注的購賣數
		Long totalCountOftheGamae=this.getTotalCount(gameId);//取得此場比賽投注的總購買數
		
		if(isPass!=null && isPass){//如果此種投注有過關，算出購買的過關比數，投注數除以總購買數，如果沒有過關則購買過關的比數是零
			percent=oddCountService.getCountPercentage(count, totalCountOftheGamae);
		}
		
		return percent;
	}
	
	//輸入GAMEID 取得圖表的柱子集合，可根據投注類型取得集合中投注數目資訊
	//一個MAP 是一場比賽的資訊
	public Map<String, CountBean> getCountInfoByGameId(Long gameId){
//		System.out.println("inside getCountInfoByGameID......................");
		Map<String, CountBean> map= new HashMap<String, CountBean>();
		//用投注類型取得Bean
		String oddType="SU_H";
		CountBean bean = this.getCountBean(gameId, oddType);
		map.put(oddType, bean);
		
		oddType="SU_A";
		bean = this.getCountBean(gameId, oddType);
		map.put(oddType, bean);
		
		oddType="ATS_A";
		bean = this.getCountBean(gameId, oddType);
		map.put(oddType, bean);
		
		oddType="ATS_H";
		bean = this.getCountBean(gameId, oddType);
		map.put(oddType, bean);
		
		oddType="SC_H";
		bean = this.getCountBean(gameId, oddType);
		map.put(oddType, bean);
		
		oddType="SC_L";
		bean = this.getCountBean(gameId, oddType);
		map.put(oddType, bean);
		
		oddType="ODD";
		bean = this.getCountBean(gameId, oddType);
		map.put(oddType, bean);
		
		oddType="EVEN";
		bean = this.getCountBean(gameId, oddType);
		map.put(oddType, bean);
//		System.out.println("#@$@$@#R#RRR" + map);
		return map;
	}
	
	//輸入 GameId和隊伍名稱，取得之前所有人購買的投注資訊 
	//一個MAP是一場比賽的投注資訊，投注資訊包含投注數，和過關數比值
	//這個LIST是之前所有比賽的投注資訊
	public List<Map<String, CountBean>> getCountInfoHistory (String teamName, Long gameId){
		try {
			List<GameEntity> games = new ArrayList<GameEntity>();
			if(gameId ==null){
				games = dao.findForHistory(null, null, teamName);
			}else{
//			System.out.println("inside getCountInforHistory"+gameId);
				games = dao.findForHistory(null, dao.findById(gameId).getGameTime().toLocalDate(), teamName);//起始時間設為NULL代表取之前所有資訊
			}	
			//結束時間則以輸入gameId來尋找
//			System.out.println(games.toString());
			List<Map<String, CountBean>> listMap= new LinkedList<Map<String, CountBean>>();
			for(GameEntity game : games){
//				System.out.println("inside for GameEntity..................");
//				System.out.println(game.toString());
//				System.out.println("I am here!!!!!!!!!!!!!!!"+this.getCountInfoByGameId(game.getId()));
				listMap.add(this.getCountInfoByGameId(game.getId())); //從games 中取的每場比賽，再從每場比賽取得gameId，再得到八種投注數的相關資訊
			}
			return listMap;
		} catch (Exception e) {
			System.out.println("getCountInfoHistory出問題..................................");
			e.printStackTrace();
		}
		
		return null;
	}
	
	//輸入 GameId和隊伍名稱，取得此game前三個月所有人購買的投注資訊 
	//一個MAP是一場比賽的投注資訊，投注資訊包含投注數，和過關數比值
	//這個LIST是之前所有比賽的投注資訊
	public List<Map<String, CountBean>> getCountInfoHistoryPrevious3month (String teamName, Long gameId){
		try {
			List<GameEntity> games = new ArrayList<GameEntity>();
			if(gameId ==null){//如果game不存在，則取今日時間前三個月
				games = dao.findForHistory(LocalDate.now().minusMonths(3), LocalDate.now(), teamName);
			}else{
//			System.out.println("inside getCountInforHistory"+gameId);
				games = dao.findForHistory(dao.findById(gameId).getGameTime().toLocalDate().minusMonths(3), dao.findById(gameId).getGameTime().toLocalDate(), teamName);//起始時間設為NULL代表取之前所有資訊
			}	
			//結束時間則以輸入gameId來尋找
//			System.out.println(games.toString());
			List<Map<String, CountBean>> listMap= new LinkedList<Map<String, CountBean>>();
			for(GameEntity game : games){
//				System.out.println("inside for GameEntity..................");
//				System.out.println(game.toString());
//				System.out.println("I am here!!!!!!!!!!!!!!!"+this.getCountInfoByGameId(game.getId()));
				listMap.add(this.getCountInfoByGameId(game.getId())); //從games 中取的每場比賽，再從每場比賽取得gameId，再得到八種投注數的相關資訊
			}
			return listMap;
		} catch (Exception e) {
			System.out.println("getCountInfoHistory出問題..................................");
			e.printStackTrace();
		}
		
		return null;
	}

	
	
	//將有最大count percentage的CountBean轉成map加入搜尋結果的List後
	public List<Map<String, CountBean>> addMaxBeanToCountHistory(String teamName, Long gameId){
		List<Map<String, CountBean>> listMap=this.getCountInfoHistory(teamName, gameId);
		System.out.println("in addMaxBeanToCountHistory, listMap: ..............."+ listMap);
		System.out.println("size of listMap: ........."+ listMap.size());
		List<CountBean> listMapSorted= this.getSortCountHistory(listMap); //將listMap依據count percentage由大到小排序
		CountBean maxBean= listMapSorted.get(0);//取得最大的bean
		
		//將最大的bean 轉成Map
		Map<String, CountBean> maxMap = new HashMap<String, CountBean>();
		maxMap.put("max",maxBean );
		
		//加入list裡
		listMap.add(maxMap);
		
		
		return listMap;
	}
	
	public List<Map<String, CountBean>> getAllCountHistoryByTeam (String teamName){
		try {

			List<GameEntity> games = dao.findForHistory(null, null, teamName);//取出跟隊伍有關的所有資訊
			//結束時間則以輸入gameId來尋找
			System.out.println(games.toString());
			List<Map<String, CountBean>> listMap= new ArrayList<Map<String, CountBean>>();
			for(GameEntity game : games){
				listMap.add(this.getCountInfoByGameId(game.getId())); //從games 中取的每場比賽，再從每場比賽取得gameId，再得到八種投注數的相關資訊
			}
			return listMap;
		} catch (Exception e) {
			System.out.println("getCountInfoHistory出問題..................................");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public List<Map<String, CountBean>> getAllCountHistoryByTime (LocalDate timeTo){
		try {

			List<GameEntity> games = dao.findForHistory(null, timeTo, null);//取出跟隊伍有關的所有資訊
			
			List<Map<String, CountBean>> listMap= new ArrayList<Map<String, CountBean>>();
			for(GameEntity game : games){
				listMap.add(this.getCountInfoByGameId(game.getId())); //從games 中取的每場比賽，再從每場比賽取得gameId，再得到八種投注數的相關資訊
			}
			return listMap;
		} catch (Exception e) {
			System.out.println("getAllCountHistoryByTime出問題..................................");
			e.printStackTrace();
		}
		
		return null;
	}
	
	public List<Map<String, CountBean>> getAllCountHistoryByTimePrevious3Month (LocalDate timeTo){
		try {
			
			if(timeTo ==null){
				List<GameEntity> games = dao.findForHistory(LocalDate.now().minusMonths(3), LocalDate.now(), null);//只取前三個月到輸入時間的資訊
				List<Map<String, CountBean>> listMap= new ArrayList<Map<String, CountBean>>();
				for(GameEntity game : games){
					listMap.add(this.getCountInfoByGameId(game.getId())); //從games 中取的每場比賽，再從每場比賽取得gameId，再得到八種投注數的相關資訊
				}
				System.out.println("I am time null..current time is..............................."+LocalDate.now());
				return listMap;

			}else{
				List<GameEntity> games = dao.findForHistory(timeTo.minusMonths(3), timeTo, null);//只取前三個月到輸入時間的資訊
				List<Map<String, CountBean>> listMap= new ArrayList<Map<String, CountBean>>();
				for(GameEntity game : games){
					listMap.add(this.getCountInfoByGameId(game.getId())); //從games 中取的每場比賽，再從每場比賽取得gameId，再得到八種投注數的相關資訊
					
				}
				return listMap;
			}
			

			
		} catch (Exception e) {
			System.out.println("getAllCountHistoryByTime出問題..................................");
			e.printStackTrace();
		}
		
		return null;
	}

	public List<Map<String, CountBean>> getAllCountHistoryByTimePrevious3Days (LocalDate timeTo){
		try {
			
			if(timeTo ==null){
				List<GameEntity> games = dao.findForHistory(LocalDate.now().minusDays(3), LocalDate.now(), null);//只取前三天到輸入時間的資訊
				List<Map<String, CountBean>> listMap= new ArrayList<Map<String, CountBean>>();
				for(GameEntity game : games){
					listMap.add(this.getCountInfoByGameId(game.getId())); //從games 中取的每場比賽，再從每場比賽取得gameId，再得到八種投注數的相關資訊
				}
				System.out.println("I am time null..current time is..............................."+LocalDate.now());
				return listMap;

			}else{
				List<GameEntity> games = dao.findForHistory(timeTo.minusDays(3), timeTo, null);//只取前3天到輸入時間的資訊
				System.out.println("timeTo: "+ timeTo);
				System.out.println("timeTo.minusDays(3): "+ timeTo.minusDays(3));
				List<Map<String, CountBean>> listMap= new ArrayList<Map<String, CountBean>>();
				for(GameEntity game : games){
					listMap.add(this.getCountInfoByGameId(game.getId())); //從games 中取的每場比賽，再從每場比賽取得gameId，再得到八種投注數的相關資訊
					
				}
				return listMap;
			}
			

			
		} catch (Exception e) {
			System.out.println("getAllCountHistoryByTime出問題..................................");
			e.printStackTrace();
		}
		
		return null;
	}
	
	//測試getCountInfoHistor，前端用的預設值
	public List<Map<String, CountBean>> trialGetCountInfoHistory(){
		Long gameId=100L;
		String teamName= "辛辛那堤紅人";
		List<Map<String, CountBean>> listMap = this.getCountInfoHistory(teamName, gameId);
		return listMap;
	}
	
	//從gameNum取得gameId
	public Long getGameIdByGameNum(Long gameNum){
		
		if(gameNum ==null){
			return null;
			
		}
	
		return dao.findByGameNum(gameNum).getId();
		
	}
	
	public List<GameEntity> getFinishedGameToday() {
		return dao.findFinishedGameToday();
	}

	//單筆過關投注按比率大小從大排到小，取得List<CountBean>
	public List<CountBean> getSortCountHistory(List<Map<String, CountBean>> listMap){
		List<CountBean> totalList = new LinkedList<CountBean>(); //用來裝List<Map<String, CountBean>>, 其中Map<String, CountBean>將轉成List
		
		//將map轉成List
		for(Map<String, CountBean> map:listMap ){
			//將map轉成List
			List<CountBean> list = new LinkedList<CountBean>(map.values());
			
			//將原先map裡所有的CountBean加入totalList中
			for(CountBean bean: list){
				totalList.add(bean);
			}
			
		}
		
		//依照percentage大小排序
		Collections.sort(totalList, new Comparator<CountBean>(){

			@Override
			public int compare(CountBean o1, CountBean o2) {
				
				return o2.getPercentage().compareTo(o1.getPercentage());
			}
			
		});

		return totalList;
	}
	
	
	
	//取得單筆最高過關數目比，MAP
	public Map<String, CountBean> getSortByComparator( Map<String, CountBean> unsortMap){

        List<Entry<String, CountBean>> list = new LinkedList<Entry<String, CountBean>>(unsortMap.entrySet());

        // Sorting the list based on values
        Collections.sort(list, new Comparator<Entry<String, CountBean>>()
        {
            public int compare(Entry<String, CountBean> o1,
                    Entry<String, CountBean> o2)
            {
               
            		return o2.getValue().getPercentage().compareTo(o1.getValue().getPercentage());
            		//以count percentage 來比，由大排到小
                
            }
        });

        // Maintaining insertion order with the help of LinkedList
        Map<String, CountBean> sortedMap = new LinkedHashMap<String, CountBean>();
        for (Entry<String, CountBean> entry : list)
        {
            sortedMap.put(entry.getKey(), entry.getValue());
        }

        return sortedMap;
    }
	

	public List<GameEntity> getHotGames(Long gameStatus, int amount, String ballType){
		//針對list內的物件進行排序
		//使用Collections.sort方法，並實作Comparator內的compare辦法
		//此方法可以針對list內的物件中的特定條件如屬性進行排序
		List<GameEntity> games = dao.findComplex(null, null, gameStatus, gameStatus, null, null, ballType, null);
		Collections.sort(games, new Comparator<GameEntity>() {
			@Override
			public int compare(GameEntity o1, GameEntity o2) {
				return (int)(o2.getCountTotal() - o1.getCountTotal());
			}
		});

		List<GameEntity> result = games.subList(0, games.size()>amount?amount:games.size());
		
		return result;
	}

	public List<GameEntity> getLatestFiveRecord() {
		return dao.findLatestFiveRecord();
	}
	
	public List<GameEntity> getGameOnComing() {
		return dao.findGameOnComing();
	}
	
	public List<String> getBallTypes() {
		return dao.findBallTypes();
	}
	
	public List<GameEntity> getGameByLocalDateTime(LocalDateTime gameTime){
		return dao.findByLocalDateTime(gameTime);
	}
	
	public List<GameEntity> getByGameTime(LocalDateTime gameTime) {
		return dao.findGameTime(gameTime.toDate());
	}
}
