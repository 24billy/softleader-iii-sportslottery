package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.TeamDao;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;

@Service
public class TeamService extends GenericService<TeamEntity> {

	@Autowired
	private TeamDao dao;
	
	@Override
	protected GenericDao<TeamEntity> getDao() {
		return dao;
	}
	
	protected TeamDao getTeamDao(){
		return dao;
	}
	
	public List<TeamEntity> getTeamsByLeagueName(String leagueName){
		return dao.findByLeagueName(leagueName);
	}
	
	public List<String> leagueNames() {
		return dao.leagueNames();
	}
	
	public List<TeamEntity> getTeamsByLeagueNameEn(String leagueNameEn){
		return dao.findByLeagueNameEn(leagueNameEn);
	}
	
	public List<String> leagueNamesEn() {
		return dao.leagueNamesEn();
	}
	
	public List<String> getLeagueNamesByBallType(String ballType) {
		return dao.findLeagueNamesByBallType(ballType);
	}
	
	public List<String> getLeagueNamesByBallTypeEn(String ballType) {
		return dao.findLeagueNamesByBallTypeEn(ballType);
	}
	
	public List<String> ballTypes() {
		return dao.ballTypes();
	}
}
