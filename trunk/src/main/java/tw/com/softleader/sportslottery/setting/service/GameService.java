package tw.com.softleader.sportslottery.setting.service;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.util.CountBean;

/**
 * 
 * @author nick
 *
 */
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
	
	public List<GameEntity> getComplex(Long gameNum, String teamName, Long gameStatus, LocalDate timeBegin, LocalDate timeEnd, String ballType) {
		return dao.findComplex(gameNum, teamName, gameStatus, timeBegin, timeEnd, ballType);
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
			System.out.println("totalCountOftheDay: "+totalCountOftheDay);
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
		bean.setCount(this.getCount(gameId, oddType));
		bean.setGameId(gameId);
		bean.setOddType(oddType);
		bean.setPass(this.getIsPass(gameId, oddType));
		bean.setPercentage(this.getIsPassPercentage(gameId,oddType));
		return bean;
	}
	
	//透過gameId 和投注類型取得投注數
	public Long getCount(Long gameId, String oddType){
		List<OddsEntity> oddsList= oddDao.findByGameId(gameId);//用GAMEID取得投注集合
		Long count = oddCountService.getOddsEntityByType(oddType, oddsList).getCount();//根據投注集合和投注類型，取得該OddsEntity，接著再取得投注數。
		return count;
	}
	
	//透過gameId和投注類型取得是否過關的資訊
	public boolean getIsPass(Long gameId, String oddType){
		List<OddsEntity> oddsList= oddDao.findByGameId(gameId);//用GAMEID取得投注集合
		boolean isPass = oddCountService.getOddsEntityByType(oddType, oddsList).getIsPass();//根據投注集合和投注類型，取得該OddsEntity，接著再取得投注數。
		return isPass;
	}
	
	//透過gameId和投注類型取得購買的過關比數
	public BigDecimal getIsPassPercentage(Long gameId,String oddType){
		BigDecimal percent=new BigDecimal(0);
		boolean isPass = this.getIsPass(gameId, oddType);//根據gameId和oddtype取得此投注是否過關的資訊
		Long count = this.getCount(gameId, oddType);//取得此投注的購賣數
		Long totalCountOftheGamae=this.getTotalCount(gameId);//取得此場比賽投注的總購買數
		
		if(isPass){//如果此種投注有過關，算出購買的過關比數，投注數除以總購買數，如果沒有過關則購買過關的比數是零
			percent=oddCountService.getCountPercentage(count, totalCountOftheGamae);
		}
		
		return percent;
	}
	
	//輸入GAMEID 取得圖表的柱子集合，可根據投注類型取得集合中投注數目資訊
	//一個MAP 是一場比賽的資訊
	public Map<String, CountBean> getGraphBarByGameId(Long gameId){
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
		
		return map;
	}

}
