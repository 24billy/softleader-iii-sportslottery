package tw.com.softleader.sportslottery.setting.dao;

import java.util.List;

import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import tw.com.softleader.sportslottery.common.dao.GenericDao;
import tw.com.softleader.sportslottery.setting.entity.TeamEntity;

@Repository
public class TeamDao  extends GenericDao<TeamEntity> {
	
	public List<TeamEntity> findByLeagueName(String leagueName){
		return getSession().createCriteria(TeamEntity.class)
				.add(Restrictions.eq("leagueName", leagueName)).list();
	}
	
	public List<TeamEntity> findByLeagueNameEn(String leagueNameEn){
		return getSession().createCriteria(TeamEntity.class)
				.add(Restrictions.eq("leagueNameEn", leagueNameEn)).list();
	}
	
	public List<String> leagueNames() {
		return getSession().createCriteria(TeamEntity.class)
				.setProjection(Projections.distinct(Projections.property("leagueName"))).list();
	}
	
	public List<String> leagueNamesEn() {
		return getSession().createCriteria(TeamEntity.class)
				.setProjection(Projections.distinct(Projections.property("leagueNameEn"))).list();
	}
	
	public List<String> leagueCodes() {
		return getSession().createCriteria(TeamEntity.class)
				.setProjection(Projections.distinct(Projections.property("leagueCode"))).list();
	}
	
	public List<String> findLeagueNamesByBallType(String ballType) {
		return getSession().createCriteria(TeamEntity.class)
				.add(Restrictions.eq("ballType", ballType))
				.setProjection(Projections.distinct(Projections.property("leagueName"))).list();
	}
	
	public List<String> findLeagueNamesByBallTypeEn(String ballType) {
		return getSession().createCriteria(TeamEntity.class)
				.add(Restrictions.eq("ballType", ballType))
				.setProjection(Projections.distinct(Projections.property("leagueNameEn"))).list();
	}
	
	public List<String> findBallTypes() {
		return getSession().createCriteria(TeamEntity.class)
				.setProjection(Projections.distinct(Projections.property("ballType"))).list();
	}
	
	public List<TeamEntity> findByLeagueCode(String leagueCode) {
		return getSession().createCriteria(TeamEntity.class)
				.add(Restrictions.eq("leagueCode", leagueCode)).list();
	}
}
