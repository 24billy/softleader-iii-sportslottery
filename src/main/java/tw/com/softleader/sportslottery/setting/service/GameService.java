package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.joda.time.LocalDate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.GameDao;
import tw.com.softleader.sportslottery.setting.entity.GameEntity;

/**
 * 
 * @author nick
 *
 */
@Service
public class GameService extends GenericService<GameEntity> {
	@Autowired
	private GameDao dao;

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
	


}
