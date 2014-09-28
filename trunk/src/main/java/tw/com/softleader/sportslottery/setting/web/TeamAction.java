package tw.com.softleader.sportslottery.setting.web;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;

import tw.com.softleader.sportslottery.setting.entity.TeamEntity;
import tw.com.softleader.sportslottery.setting.service.TeamService;

import com.google.gson.Gson;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class TeamAction extends ActionSupport {
	private static final long serialVersionUID = 2014L;

	@Autowired
	private TeamService service;
	
	private TeamEntity model;
	
	private List<TeamEntity> models;
	
	private InputStream inputStream;
	
	private Logger log = LoggerFactory.getLogger(TeamAction.class);
	
	private String json;

	private String leagueName;
	
	private Locale locale = ActionContext.getContext().getLocale();
	
	public Locale getLocale() {
		return locale;
	}
	
	public String getLeagueName() {
		return leagueName;
	}
	public void setLeagueName(String leagueName) {
		this.leagueName = leagueName;
	}
	public String getJson() {
		return json;
	}
	public TeamEntity getModel() {
		return model;
	}

	public void setModel(TeamEntity model) {
		this.model = model;
	}

	public List<TeamEntity> getModels() {
		return models;
	}
	
	public InputStream getInputStream() {
		return inputStream;
	}
	
	public String select() {
		log.debug("TeamAction select()");
		Long teamId = model.getId();
		String leagueName = model.getLeagueName();
		TeamEntity team = teamId != null && teamId > 0? service.getById(teamId): null;
		List<TeamEntity> teams = null;
		if (!StringUtils.isEmpty(leagueName)) {
			teams = locale.getLanguage().equals("zh")?
						service.getTeamsByLeagueName(leagueName):
						service.getTeamsByLeagueNameEn(leagueName);
		} else {
			teams = service.getAll();
		}
		json = team != null? new Gson().toJson(team): new Gson().toJson(teams);
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "select";
	}
	
	public String execute(){
		log.debug("execute TeamAction");
		json = new Gson().toJson(service.getAll());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return Action.SUCCESS;
	}
	
	public String delete(){
		log.debug("TeamAction delete()");
		String result = null;
		try {
			service.delete(service.getById(model.getId()));
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String insert() {
		log.debug("TeamAction insert()");
		String result = null;
		Long teamId = model.getId();
		try {
			if (teamId != null && teamId > 0) service.update(model);
			else service.insert(model);
			result = "success";
		} catch (Exception e) {
			e.printStackTrace();
			result = "failed";
		}
		inputStream = new ByteArrayInputStream(result.getBytes(StandardCharsets.UTF_8));
		return "message";
	}
	
	public String admin() {
		log.debug("TeamAction admin()");
		List<TeamEntity> teams = 
				locale.getLanguage().equals("zh")?
				service.getTeamList(leagueName):
				service.getTeamListEn(leagueName);
		json = new Gson().toJson(teams);
		return Action.SUCCESS;
	}
	
	public String getTeamsByLeagueName(){
		System.out.println("leagueName"+leagueName);
		json = new Gson().toJson(service.getTeamsByLeagueName(leagueName));
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "getTeamsByCountry";
	}
	
	public String getLeagueNames() {
		log.debug("TeamAction getLeagueNames()");
		String ballType = model != null? model.getBallType():null;
		List<String> leagueNames = null;
		if (ballType != null) {
			leagueNames = locale.getLanguage().equals("zh")?
							service.getLeagueNamesByBallType(ballType):
							service.getLeagueNamesByBallTypeEn(ballType);
		} else {
			leagueNames = locale.getLanguage().equals("zh")?
							service.leagueNames():
							service.leagueNamesEn();
		}
		json = new Gson().toJson(leagueNames);
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "select";
	}
	
	public String getBallTypes() {
		log.debug("TeamAction getBallTypes()");
		json = new Gson().toJson(service.getBallTypes());
		inputStream = new ByteArrayInputStream(json.getBytes(StandardCharsets.UTF_8));
		return "select";
	}
}
