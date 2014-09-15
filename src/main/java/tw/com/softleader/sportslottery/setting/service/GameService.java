package tw.com.softleader.sportslottery.setting.service;

import java.math.BigDecimal;
import java.util.ArrayList;
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
	
	public List<GameEntity> getComplex(Long gameNum, String teamName, Boolean isEnd, LocalDate timeBegin, LocalDate timeEnd, String ballType) {
		return dao.findComplex(gameNum, teamName, isEnd, timeBegin, timeEnd, ballType);
	}
	
	public Long maxGameNum() {
		return dao.maxGameNum();
	}
	
	//by gameid to get the total count of the odds
	public Long totalCount(Long gameId){
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
	public CountBean getBountBean(Long gameId, String oddType){
		CountBean bean = new CountBean();

		return null;
	}
	
	public Long getCount(Long gameId, String oddType){
		List<OddsEntity> oddsList= oddDao.findByGameId(gameId);//用GAMEID取得投注集合
		Long count = oddCountService.getOddsEntityByType(oddType, oddsList).getCount();//根據投注集合和投注類型，取得該OddsEntity，接著再取得投注數。
		return count;
	}
	
	//計算過關比率
	public BigDecimal isPassPercentage(String oddType){
		return null;
	}
	
	//輸入GAMEID 取得圖表的柱子集合，可根據投注類型取得集合中投注數目資訊
	public Map<String, CountBean> GraphBarByGameId(Long gameId){
		return null;
	}

}
