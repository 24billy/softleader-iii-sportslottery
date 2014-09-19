package tw.com.softleader.sportslottery.setting.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryDao;
import tw.com.softleader.sportslottery.setting.dao.LotteryOddsDao;
import tw.com.softleader.sportslottery.setting.dao.OddsDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;
import tw.com.softleader.sportslottery.setting.entity.OddsEntity;
import tw.com.softleader.sportslottery.setting.util.OddCountBean;

import com.google.gson.Gson;

@Service
public class OddsService extends GenericService<OddsEntity> {
	
	@Autowired
	private OddsDao dao;
	
	@Autowired
	private LotteryOddsDao lotteryOddsDao;
	
	@Autowired
	private LotteryDao lotteryDao;
	
	@Autowired
	private GameDao gameDao;
	
	
	@Override
	protected GenericDao<OddsEntity> getDao() {
		return dao;
	}
	
	public List<OddsEntity> getByOddType(String oddType) {
		return dao.findByOddType(oddType);
	}
	
	public String getByOddTypeJson(String oddType) {
		String toJson = new Gson().toJson(dao.findByOddType(oddType));
		return toJson;
	}
	
	public List<OddsEntity> getByGameId(Long gameId) {
		return dao.findByGameId(gameId);
	}
	
	public String getByGameIdJson(Long gameId) {
		String toJson = new Gson().toJson(dao.findByGameId(gameId));
		return toJson;
	}
	
	public Double getOddValue(Long gameId, String oddType) {
		
		Double oddValue = null;
		List<OddsEntity> list = dao.findByGameId(gameId);
				
		if (list != null) {
			for (OddsEntity odds : list) {
				if (odds.getOddType().equals(oddType)) {
					oddValue = odds.getOddValue().doubleValue();
				}
			}
		}
		return oddValue;
	}
	/*
	public boolean setIsPass(GameEntity game) {
		Long gameScoreAway = game.getGameScoreAway();
		Long gameScoreHome = game.getGameScoreHome();
		
		return true;
	}
	
	private OddsEntity checkSUA(GameEntity game) {
		return (OddsEntity) (game.getGameScoreAway() > game.getGameScoreHome() ? dao.findByGameIdWithOddType(game.getId(), "SU_A") : null);
	}
	
	private OddsEntity checkSUH(GameEntity game) {
		return (OddsEntity) (game.getGameScoreAway() > game.getGameScoreHome() ? dao.findByGameIdWithOddType(game.getId(), "SU_H") : null);
	}
	
	private OddsEntity checkATS(GameEntity game) {
		return (OddsEntity) (game.getGameScoreAway() + 1.5 > game.getGameScoreHome() ? dao.findByGameIdWithOddType(game.getId(), "ATS_A") : dao.findByGameIdWithOddType(game.getId(), "ATS_H"));
	}
	
	private OddsEntity checkSC(GameEntity game) {
		return (OddsEntity) (game.getGameScoreAway() + game.getGameScoreHome() > 7.5 ? dao.findByGameIdWithOddType(game.getId(), "SC_H") : dao.findByGameIdWithOddType(game.getId(), "SC_L"));
	}
	
	private OddsEntity checkEO(GameEntity game) {
		return (OddsEntity) (game.getGameScoreAway() + game.getGameScoreHome() % 2 == 0 ? dao.findByGameIdWithOddType(game.getId(), "EVEN") : dao.findByGameIdWithOddType(game.getId(), "ODD"));
	}
	*/
	public Boolean setIsPass(Long gameId, String su, String ats, String sc, String eo) {
		OddsEntity entity = null;
		
		try {
			List<OddsEntity> entitys = dao.findByGameId(gameId);
			
			for (OddsEntity odds : entitys) {
				odds.setIsPass(false);
				dao.update(odds);
			}
			
			if (!StringUtils.isEmpty(su)) {
				entity = dao.findByGameIdWithOddType(gameId, su).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(ats)) {
				entity = dao.findByGameIdWithOddType(gameId, ats).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(sc)) {
				entity = dao.findByGameIdWithOddType(gameId, sc).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			if (!StringUtils.isEmpty(eo)) {
				entity = dao.findByGameIdWithOddType(gameId, eo).get(0);
				entity.setIsPass(true);
				dao.update(entity);
			}
			
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public List<OddsEntity> getByGameIdWithOddType(Long gameId, String oddType) {
		return dao.findByGameIdWithOddType(gameId, oddType);
	}
	
	public Long countByOddType(String oddType){
		return dao.countByOddType(oddType);
	}

	public Boolean countOddsOnComing() {
		try {
			List<GameEntity> games = gameDao.findGameOnComing();
			for (GameEntity game : games) {
				List<OddsEntity> oddsList = game.getOdds();
				for (OddsEntity odds : oddsList) {
					Long count = lotteryOddsDao.countLotterysByOddsId(odds);
					odds.setCount(count);
					dao.update(odds);
				}
			}
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	
	
	
	
	//將OddsList 變成 Map
	public Map<String, OddCountBean> from_OddsEntityList_To_OddsEntityMap(String teamName , LocalDate gameTime){
		Map<String,OddCountBean> map=new HashMap<String,OddCountBean>();

//		Long totalCount=getTotalCountOftheDay(OddsList);
		
		
//		for(OddsEntity odd: OddsList ){
//			OddCountBean bean= new OddCountBean();
//			bean.setCount(odd.getCount());
//			bean.setTotalCountOftheDay(totalCount);
//			bean.setCountPercentage(bean.getCount(), totalCount);
//			bean.setGameTime(gameTime);
//			bean.setIsPass(odd.getIsPass());
			//bean.setTeamName();
		
			
//			
//			if(odd.getOddType().equals("SU_H")){
//				bean.setOddType("SU_H");
//				map.put("SU_H", bean);
//				
//				
//			}else if(odd.getOddType().equals("SU_A")){
//				bean.setOddType("SU_A");
//				map.put("SU_A", bean);
//				
//				
//			}else if(odd.getOddType().equals("ATS_A")){
//				bean.setOddType("ATS_A");
//				map.put("ATS_A", bean);
//				
//				
//			}else if(odd.getOddType().equals("ATS_H")){
//				bean.setOddType("ATS_H");
//				map.put("ATS_H", bean);
//				
//				
//			}else if(odd.getOddType().equals("SC_H")){
//				bean.setOddType("SC_H");
//				map.put("SC_H", bean);
//				
//				
//			}else if(odd.getOddType().equals("SC_L")){
//				bean.setOddType("SC_L");
//				map.put("SC_L", bean);
//				
//				
//			}else if(odd.getOddType().equals("ODD")){
//				bean.setOddType("ODD");
//				map.put("ODD", bean);
//				
//				
//			}else if(odd.getOddType().equals("EVEN")){
//				bean.setOddType("EVEN");
//				map.put("EVEN", bean);
//			
//				
//			}
//		}
		
		return map;
	}


	
	

	
	
	
}

/*class CountBean {
	private LocalDate gameTime;
	private String teamName;
	private Long count;
	private Long totalCountOftheDay;//the total count of the eight types in a day;
	private String oddType;
	private Long countPercentage;// count/totalCountOftheDay 
	private Boolean isPass;
	@Autowired
	private GameDao gameDao;
	
	public CountBean(){
		
	}
	public CountBean(LocalDate gameTime, String teamName, Long count,
			String oddType, Boolean isPass) {

		this.gameTime = gameTime;
		this.teamName = teamName;
		this.count = count;
		this.oddType = oddType;
		this.setTotalCountOftheDay(gameTime,teamName);
		this.setCountPercentage(count, this.totalCountOftheDay );
		this.isPass = isPass;
		
		
	}
	public LocalDate getGameTime() {
		return gameTime;
	}
	public void setGameTime(LocalDate gameTime) {
		this.gameTime = gameTime;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public Long getCount() {
		return count;
	}
	public void setCount(Long count) {
		this.count = count;
	}
	public Long getTotalCountOftheDay() {
		return totalCountOftheDay;
	}
	public void setTotalCountOftheDay(LocalDate gameTime, String teamName) {
		//從比賽時間和隊名取得投注物件list
//		GameDao gameDao= new GameDao();
		Long totalCountOftheDay;
		try {
			List<OddsEntity> OddsList= gameDao.findOddsByTimeAndTeamName(gameTime, teamName);
			totalCountOftheDay = 0L;
			
			for(OddsEntity odd: OddsList){
				totalCountOftheDay += odd.getCount();
				
			}
			this.totalCountOftheDay = totalCountOftheDay;

		} catch (Exception e) {
			System.out.println("oddList is null");
			e.printStackTrace();
		}
		
	}
	public String getOddType() {
		return oddType;
	}
	public void setOddType(String oddType) {
		this.oddType = oddType;
	}
	public Long getCountPercentage() {
		return countPercentage;
	}
	public void setCountPercentage(Long count, Long totalCountOftheDay) {
		
		this.countPercentage =(count/totalCountOftheDay);
	}
	public Boolean getIsPass() {
		return isPass;
	}
	public void setIsPass(Boolean isPass) {
		this.isPass = isPass;
	}
	

	

	

}*/

