package tw.com.softleader.sportslottery.setting.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.common.service.GenericService;
import tw.com.softleader.sportslottery.setting.dao.TeamDao;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;

/**
 * @Author:Rhys
 */

@Service
public class TeamService extends GenericService<TeamEntity> {

	@Autowired
	private TeamDao dao;
	
	@Override
	protected GenericDao<TeamEntity> getDao() {
		// TODO Auto-generated method stub
		return dao;
	}
	
	protected TeamDao getTeamDao(){
		return dao;
	}
	
	public List<TeamEntity> getTeamsByCountry(String country){
		return dao.findByCountry(country);
	}

}