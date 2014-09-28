package tw.com.softleader.sportslottery.setting.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

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
	
	public List<String> getBallTypes() {
		return dao.findBallTypes();
	}
	
	public List<TeamEntity> getByLeagueCode(String leagueCode) {
		return dao.findByLeagueCode(leagueCode);
	}
	
	public List<String> leagueCodes() {
		return dao.leagueCodes();
	}
	
	public void setToProperties(TeamEntity team) {
		URL url = getClass().getClassLoader().getResource("/locale/team.properties");
		URL urlEn = getClass().getClassLoader().getResource("/locale/team_en_US.properties");
		URL urlZh = getClass().getClassLoader().getResource("/locale/team_zh_TW.properties");
		
		String leagueKey = "league." + team.getLeagueCode();
		String leagueEn = team.getLeagueNameEn();
		String leagueZh = team.getLeagueName();
		String teamKey = "team." + team.getTeamCode();
		String teamEn = team.getTeamNameEn();
		String teamZh = team.getTeamName();
		
		setKeyToProperties(url, leagueKey, leagueEn);
		setKeyToProperties(url, teamKey, teamEn);
		setKeyToProperties(urlEn, teamKey, teamEn);
		setKeyToProperties(urlEn, leagueKey, leagueEn);
		setKeyToProperties(urlZh, teamKey, teamZh);
		setKeyToProperties(urlZh, leagueKey, leagueZh);
	}
	
	private void setKeyToProperties(URL url, String key, String value) {
		try {
			File file = new File(url.toURI());
			if (file != null) {
				FileInputStream in = new FileInputStream(file);
				FileOutputStream out = new FileOutputStream(file);
				Properties properties = new Properties();
				properties.load(in);
				in.close();
				properties.setProperty(key, value);
				properties.store(out, null);
				out.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<TeamEntity> getTeamList(String leagueName) {
		return !StringUtils.isEmpty(leagueName)?
				getTeamsByLeagueName(leagueName):
				getTeamsByLeagueName(leagueNames().get(0));
	}
	
	public List<TeamEntity> getTeamListEn(String leagueName) {
		return !StringUtils.isEmpty(leagueName)?
				getTeamsByLeagueNameEn(leagueName):
				getTeamsByLeagueNameEn(leagueNamesEn().get(0));
	}
}
